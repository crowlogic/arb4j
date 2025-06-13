<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Testing for Harmonizability>|<doc-author|<author-data|<author-name|H.
  L. Hurd>>>|<doc-date|IEEE Transactions on Information Theory, Vol. IT-19,
  No. 3, May 1973>>

  <abstract-data|<\abstract>
    Let <math|R<around|(|s,t|)>> be a covariance function having the
    representation

    <\equation>
      R<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|(|i*s*x-i*t*y|)>*<space|0.17em>d<rsup|2>*G<around|(|x,y|)><label|eq:covariance-harmonizable>
    </equation>

    where <math|G<around|(|x,y|)>> is continuous to the right in both
    variables and is of bounded variation in the plane; then
    <math|R<around|(|s,t|)>> is harmonizable in that <math|G<around|(|x,y|)>>
    is also a covariance. Examples are given in which this result is used to
    determine the harmonizability of new processes and covariances that are
    formed by operations on old processes and covariances. Specifically, if
    <math|X<around|(|t|)>> is a real Gaussian harmonizable process, then
    <math|X<rsup|n><around|(|t|)>> is harmonizable. If <math|X<around|(|t|)>>
    is harmonizable, <math|G<around|(|x,y|)>> has bounded support and
    <math|g<around|(|t|)>> is a Fourier-Stieltjes transform, then
    <math|X<around|(|g<around|(|t|)>|)>> and
    <math|X*<around|(|t+g<around|(|t|)>|)>> are harmonizable. If

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*<space|0.17em>d*Z<around|(|u|)><label|eq:moving-average>
    </equation>

    where <math|f<around|(|t,u|)>=f*<around|(|t-u|)>> is a Fourier-Stieltjes
    transform and <math|G<around|(|u,v|)>=\<bbb-E\>*<around|{|Z<around|(|u|)>*Z<rsup|\<ast\>><around|(|v|)>|}>>
    has finite total variation, then <math|X<around|(|t|)>> is harmonizable.
    A sufficient condition for Priestley's oscillatory processes to be
    harmonizable is also obtained. The Bochner-Eberlein characterization of
    Fourier-Stieltjes transforms is particularly convenient for determining
    harmonizability in these cases.
  </abstract>>

  <section|Introduction>

  Let <math|<around|{|X<around|(|t,\<omega\>|)>,-\<infty\>\<less\>t\<less\>\<infty\>,\<omega\>\<in\>\<Omega\>|}>>
  be a second-order continuous-parameter stochastic process defined on some
  probability space <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>. The
  process <math|X<around|(|t,\<omega\>|)>> is said to be
  harmonizable<nbsp><cite-detail|loeve1955probability|p.<nbsp>474> if it has
  the quadratic mean representation

  <\equation>
    X<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*t*x|)>*<space|0.17em>d*Z<around|(|x,\<omega\>|)><label|eq:process-harmonizable>
  </equation>

  where <math|<around|{|Z<around|(|x,\<omega\>|)>,-\<infty\>\<less\>x\<less\>\<infty\>|}>>
  is a process whose covariance is of bounded variation (BV) in the plane.
  Harmonizable processes are of engineering interest because decomposition
  relative to <math|exp <around|(|i*t*x|)>> admits the usual frequency
  interpretation of linear filtering. If <math|H<around|(|x|)>> is the
  frequency response of a stable, linear time-invariant system, then the
  system output process <math|Y<around|(|t,\<omega\>|)>> is given by the
  quadratic mean integral

  <\equation>
    Y<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*t*x|)>*H<around|(|x|)>*<space|0.17em>d*Z<around|(|x,\<omega\>|)><label|eq:lti-filter>
  </equation>

  A detailed account may be found in<nbsp><cite-detail|blanc-lapierre1968random|Ch.<nbsp>8>.
  For recent results on harmonizable processes in engineering,
  see<nbsp><cite|cambanis1970harmonizable|donati1971spectra|ogura1971spectral>.

  The covariance functions for <math|X<around|(|t|)>> and
  <math|Y<around|(|t|)>> are

  <\align>
    <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*s*x-i*t*y|)>*<space|0.17em>d<rsup|2>*G<around|(|x,y|)><eq-number><label|eq:cov-fn-harm>>>|<row|<cell|R<rsub|Y><around|(|s,t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*s*x-i*t*y|)>*H<around|(|x|)>*H<rsup|\<ast\>><around|(|y|)>*<space|0.17em>d<rsup|2>*G<around|(|x,y|)><eq-number><label|eq:cov-fn-filtered>>>>>
  </align>

  where <math|d<rsup|2>*G<around|(|x,y|)>=\<bbb-E\>*<around|{|d*Z<around|(|x|)>*d*Z<rsup|\<ast\>><around|(|y|)>|}>>.
  Any covariance with representation<nbsp><eqref|eq:cov-fn-harm>, with
  <math|G<around|(|x,y|)>> a covariance of bounded variation, is called
  harmonizable; harmonizable processes have harmonizable covariances.
  Conversely, processes with harmonizable covariances are themselves
  harmonizable<nbsp><cite-detail|loeve1955probability|p.<nbsp>476>. For
  brevity, we call those corresponding to <math|G> with finite total
  variation simply \Pharmonizable.\Q

  This paper addresses the determination of harmonizability for new processes
  or covariances constructed from old ones. The main results are as follows:

  <\itemize>
    <item>If <math|X<around|(|t|)>> is a real Gaussian harmonizable process,
    then <math|X<rsup|n><around|(|t|)>> is harmonizable.

    <item>If <math|X<around|(|t|)>> is harmonizable with spectral
    decomposition of bounded support and <math|g<around|(|t|)>> is a
    Fourier-Stieltjes transform, then <math|X*<around|(|t+g<around|(|t|)>|)>>
    and <math|X<around|(|g<around|(|t|)>|)>> are harmonizable.

    <item>If <math|R<rsub|1>> and <math|R<rsub|2>> are harmonizable
    covariances, then for <math|T> of finite Lebesgue measure,

    <\equation>
      R<rsub|3><around|(|s,t|)>=<big|int><rsub|T>R<rsub|1><around|(|s,u|)>*R<rsub|2><around|(|u,t|)>*<space|0.17em>d*u<label|eq:integral-composed>
    </equation>

    is harmonizable.

    <item>If <math|X<around|(|t|)>> is a moving average as
    in<nbsp><eqref|eq:moving-average> with
    <math|f<around|(|t,u|)>=f*<around|(|t-u|)>> a Fourier-Stieltjes transform
    and <math|G<around|(|u,v|)>> of bounded variation, then
    <math|X<around|(|t|)>> is harmonizable.

    <item>If <math|X<around|(|t|)>> is as above, <math|Z<around|(|u|)>> has
    orthogonal increments with <math|d*F<around|(|u|)>=\<bbb-E\>*<around|\||d*Z<around|(|u|)>|\|><rsup|2>>
    and

    <\equation>
      f<around|(|t,u|)>=exp <around|(|i*u*t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|(|i*t*x|)>*<space|0.17em>d*H<rsub|u><around|(|x|)><label|eq:oscillatory-fn>
    </equation>

    with <math|H<rsub|u><around|(|x|)>> of bounded variation for every
    <math|u>, the resulting processes include Priestley's oscillatory
    processes<nbsp><cite|priestley1965evolutionary>, which are harmonizable
    under suitable conditions.
  </itemize>

  The method is to use the following result.

  <\theorem>
    <label|thm:covariance-fs>If <math|R<around|(|s,t|)>> is simultaneously a
    covariance and a Fourier-Stieltjes (FS) transform with respect to some
    <math|G<around|(|x,y|)>> of bounded variation, then
    <math|R<around|(|s,t|)>> is harmonizable in that <math|G> is necessarily
    a covariance.
  </theorem>

  <\proof>
    Sufficiency is immediate: one can find a process
    <math|Z<around|(|x,\<omega\>|)>> whose covariance is <math|G> and whose
    FS transform <math|X<around|(|t,\<omega\>|)>> as
    in<nbsp><eqref|eq:process-harmonizable> has covariance
    <math|R<around|(|s,t|)>>. Conversely, suppose <math|R> is both a
    covariance and an FS transform with respect to some <math|G> that is BV.
    Define

    <\equation>
      G<rsub|a><around|(|x,y|)>=G<around|(|x,y|)>-G<around|(|a,y|)>-G<around|(|x,a|)>+G<around|(|a,a|)><label|eq:nnd-Ga>
    </equation>

    For any <math|n> and sequence <math|<around|{|x<rsub|j>\<ge\>a,<space|0.17em>j=1,\<ldots\>,n|}>>
    and complex <math|<around|{|c<rsub|j>|}>>,

    <\equation>
      <big|sum><rsub|j,k=1><rsup|n>c<rsub|j>*c<rsub|k><rsup|\<ast\>>*G<rsub|a><around|(|x<rsub|j>,x<rsub|k>|)>\<ge\>0
    </equation>

    This follows by constructing <math|g<rsub|a><around|(|s|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<around|[|1-exp
    <around|(|-i*s*x<rsub|j>|)>|]>*exp <around|(|-i*s*a|)>> and applying the
    inversion theorem<nbsp><cite-detail|loeve1955probability|p.<nbsp>475>.
    Letting <math|a\<to\>-\<infty\>>, <math|G<rsub|a><around|(|x,y|)>\<to\>G<around|(|x,y|)>>.
    Thus <math|G<around|(|x,y|)>> is non-negative definite.
  </proof>

  Thus, any characterization of FS transforms, such as the Bochner-Eberlein
  theorem, also provides a characterization for harmonizable
  covariances<nbsp><cite|bochner1934fst|eberlein1955fst|rudin1962groups>.
  Cramér<nbsp><cite|cramer1939representation> and
  Dominguez<nbsp><cite|dominguez1940fst> provide alternative
  characterizations.

  <section|Mathematical Preliminaries>

  Assume <math|G<around|(|x,y|)>> is normalized, e.g.,

  <\equation>
    G<around|(|x,y|)>=<frac|1|4>*<around*|[|G<around|(|x+0,y+0|)>+G<around|(|x+0,y-0|)>+G<around|(|x-0,y+0|)>+G<around|(|x-0,y-0|)>|]><label|eq:G-normalization>
  </equation>

  and satisfies

  <\equation>
    lim<rsub|x\<to\>-\<infty\>> G<around|(|x,y|)>=lim<rsub|y\<to\>-\<infty\>>
    G<around|(|x,y|)>=0
  </equation>

  We now state the key characterizations.

  <\theorem>
    [Bochner]<label|thm:bochner>A necessary and sufficient condition that
    <math|f<around|(|t|)>>, <math|-\<infty\>\<less\>t\<less\>\<infty\>>, has
    the representation

    <\equation>
      f<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|(|i*x*t|)>*<space|0.17em>d*G<around|(|x|)><label|eq:bochner>
    </equation>

    for a complex measure <math|G> of bounded variation is that, for any
    <math|n>, any sequence <math|<around|{|t<rsub|j>|}><rsub|j=1><rsup|n>>
    and any complex <math|<around|{|c<rsub|j>|}><rsub|j=1><rsup|n>>,

    <\equation>
      <around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*f<around|(|t<rsub|j>|)>|\|>\<leq\>M<around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j>*c<rsub|k><rsup|\<ast\>>*exp
      <around|(|i*x*<around|(|t<rsub|j>-t<rsub|k>|)>|)>|]><rsup|1/2><label|eq:bochner-nnd>
    </equation>

    for some <math|M\<gtr\>0>.
  </theorem>

  <\theorem>
    [Bochner-Eberlein]<label|thm:bochner-eberlein>A necessary and sufficient
    condition for a function <math|R<around|(|s,t|)>> to have
    representation<nbsp><eqref|eq:covariance-harmonizable> with

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d<rsup|2>*G<around|(|x,y|)>|\|>\<leq\>M<label|eq:bounded-var-G>
    </equation>

    is that for any <math|n>, any sequence of pairs
    <math|<around|{|<around|(|s<rsub|j>,t<rsub|j>|)>|}><rsub|j=1><rsup|n>>
    and any complex <math|<around|{|c<rsub|j>|}><rsub|j=1><rsup|n>>,

    <\equation>
      <around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*R<around|(|s<rsub|j>,t<rsub|j>|)>|\|>\<leq\>M<around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j>*c<rsub|k><rsup|\<ast\>>*exp
      <around|(|i*<around|(|x*s<rsub|j>-y*t<rsub|j>-x*s<rsub|k>+y*t<rsub|k>|)>|)>|]><rsup|1/2><label|eq:BE-nnd>
    </equation>

    for some <math|M\<gtr\>0>.
  </theorem>

  <section|Examples and Application>

  <\example>
    Let <math|X<around|(|t|)>> be a zero-mean real Gaussian harmonizable
    process with covariance <math|R<around|(|s,t|)>>. Then, for any
    <math|n\<geq\>1>, <math|X<rsup|n><around|(|t|)>> is harmonizable.
  </example>

  <\proof>
    An exercise with characteristic functions shows that

    <\equation>
      \<bbb-E\>*<around|[|X<rsup|n><around|(|s|)>*X<rsup|n><around|(|t|)>|]>=<big|sum><rsub|p,q,r\<geq\>0>c<rsub|z>*<around|(|p,q,r,n|)>*R<rsup|p><around|(|s,s|)>*R<rsup|q><around|(|s,t|)>*R<rsup|r><around|(|t,s|)>*R<rsup|p><around|(|t,t|)><label|eq:gaussian-moments>
    </equation>

    where the sum is over all <math|p,q,r\<geq\>0> with <math|n=2*p+q+r> and
    <math|c<rsub|z>*<around|(|p,q,r,n|)>> are combinatorial coefficients.

    Since both FS transforms<nbsp><cite-detail|bochner1934fst|p.151> and
    covariances<nbsp><cite-detail|loeve1955probability|p.468> are closed
    under products, <math|R<rsup|q><around|(|s,t|)>*R<rsup|r><around|(|t,s|)>=R<rsup|q+r><around|(|s,t|)>>
    is an FS transform and a covariance. The product
    <math|R<rsup|p><around|(|s,s|)>*R<rsup|p><around|(|t,t|)>> is also an FS
    transform, as for <math|f<around|(|s|)>=R<around|(|s,s|)>>

    <\equation>
      f<rsup|p><around|(|s|)>*f<rsup|p><around|(|t|)>
    </equation>

    is NND and an FS transform by Theorem<nbsp><reference|thm:bochner>. The
    sum in<nbsp><eqref|eq:gaussian-moments> is harmonizable since FS
    transforms and covariances are closed under positive sums.
  </proof>

  <\example>
    <label|ex:composition>Suppose <math|X<around|(|t|)>> is harmonizable with
    spectral decomposition supported by a bounded set <math|A> and
    <math|g<around|(|t|)>> is the FS transform of some <math|G<around|(|x|)>>
    of finite variation. Then <math|X*<around|(|t+g<around|(|t|)>|)>> and
    <math|X<around|(|g<around|(|t|)>|)>> are harmonizable.
  </example>

  <\proof>
    Set

    <\equation>
      Y<around|(|t|)>=X*<around|(|t+g<around|(|t|)>|)>
    </equation>

    so

    <\equation>
      R<rsub|Y><around|(|s,t|)>=R<rsub|X><around|(|s+g<around|(|s|)>,t+g<around|(|t|)>|)>=<big|iint><rsub|A>exp
      <around*|(|i*x*<around|(|s+g<around|(|s|)>|)>-i*y*<around|(|t+g<around|(|t|)>|)>|)>*d<rsup|2>*G<around|(|x,y|)>
    </equation>

    Let <math|M<rsub|A>> denote the variation over <math|A\<times\>A> of
    <math|G<around|(|x,y|)>>. For any complex <math|<around|{|c<rsub|j>|}>>
    and parameter pairs,

    <\equation>
      Q=<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*R<rsub|Y><around|(|s<rsub|j>,t<rsub|j>|)>|\|>\<leq\>M<rsub|A><around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*exp
      <around*|(|i*x<rprime|'>*s<rsub|j>+i*x<rprime|'>*g<around|(|s<rsub|j>|)>-i*y<rprime|'>*t<rsub|j>-i*y<rprime|'>*g<around|(|t<rsub|j>|)>|)>|\|>
    </equation>

    where <math|x<rprime|'>,y<rprime|'>> in closure of <math|A>. The mappings

    <\equation>
      t\<mapsto\>exp <around|[|i*x<rprime|'>*g<around|(|t|)>|]>
    </equation>

    \ and

    <\equation>
      t\<mapsto\>exp <around|[|-i*y<rprime|'>*g<around|(|t|)>|]>
    </equation>

    \ are FS transforms, so by repeated application of Bochner's condition
    this is bounded, and <math|R<rsub|Y><around|(|s,t|)>> is an FS transform.
  </proof>

  <\example>
    <label|ex:integral-composed>Suppose <math|R<rsub|1>> and <math|R<rsub|2>>
    are harmonizable covariances, and for <math|T> of finite Lebesgue measure
    define <math|R<rsub|3><around|(|s,t|)>> as
    in<nbsp><eqref|eq:integral-composed>. Then <math|R<rsub|3>> is
    harmonizable.
  </example>

  <\proof>
    By the Bochner-Eberlein condition, for any <math|<around|{|c<rsub|j>|}>>,

    <\equation>
      Q=<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<big|int><rsub|T>R<rsub|1><around|(|s<rsub|j>,u|)>*R<rsub|2><around|(|u,t<rsub|j>|)>*<space|0.17em>d*u|\|>\<leq\>M<rsub|1>*sup<rsub|x,y><around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<big|int><rsub|T>R<rsub|2><around|(|u,t<rsub|j>|)>*exp
      <around|(|i*s<rsub|j>*x-i*u*y|)>*d*u|\|>
    </equation>

    With <math|M<rsub|2>> the variation bound for <math|R<rsub|2>>,

    <\equation>
      Q\<leq\>M<rsub|1>*M<rsub|2>*m<around|(|T|)>*sup<rsub|x,y><around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*exp
      <around|(|i*s<rsub|j>*x-i*t<rsub|j>*y|)>|\|>
    </equation>

    where <math|m<around|(|T|)>> is Lebesgue measure. Thus <math|R<rsub|3>>
    is an FS transform.
  </proof>

  <\example>
    Suppose <math|X<around|(|t|)>> is a moving average as
    in<nbsp><eqref|eq:moving-average> with
    <math|f<around|(|t,u|)>=f*<around|(|t-u|)>> a Fourier-Stieltjes transform
    and <math|G<around|(|u,v|)>> of bounded variation. Then
    <math|X<around|(|t|)>> is harmonizable.
  </example>

  <\proof>
    From<nbsp><eqref|eq:moving-average> and the bounded variation of
    <math|H<around|(|x|)>> and <math|G<around|(|u,v|)>>,

    <\equation>
      R<around|(|s,t|)>=<big|iint>exp <around|[|i*x*<around|(|s-u|)>-i*y*<around|(|t-v|)>|]>*<space|0.17em>d<rsup|2>*G<around|(|u,v|)>*<space|0.17em>d*H<around|(|x|)>*<space|0.17em>d*H<rsup|\<ast\>><around|(|y|)>
    </equation>

    This is an FS transform with variation bound
    <math|M<rsub|G>*M<rsub|H><rsup|2>>, where <math|M<rsub|G>> bounds
    <math|G<around|(|u,v|)>> and <math|M<rsub|H>> bounds
    <math|H<around|(|x|)>>.
  </proof>

  <\example>
    Suppose <math|X<around|(|t|)>> is as above, <math|Z<around|(|u|)>> has
    orthogonal increments with <math|d*F<around|(|u|)>=\<bbb-E\><around|[|<around|\||d*Z<around|(|u|)>|\|><rsup|2>|]>>
    and <math|f<around|(|t,u|)>> as in<nbsp><eqref|eq:oscillatory-fn>. Then
    <math|X<around|(|t|)>> is a Priestley oscillatory process, and is
    harmonizable provided

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*H<rsub|u><around|(|x|)><around|\||<space|0.17em>|\|>*d*H<rsub|u><rsup|\<ast\>><around|(|y|)>|\|>*<space|0.17em>d*F<around|(|u|)>\<less\>\<infty\><label|eq:osc-harmonizable>
    </equation>
  </example>

  <\proof>
    The covariance is

    <\equation>
      R<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|[|i*u*<around|(|s-t|)>|]>*f<around|(|u,s|)>*f<rsup|\<ast\>><around|(|u,t|)>*d*F<around|(|u|)>
    </equation>

    By repeated application of Bochner's and Fubini's theorems,
    provided<nbsp><eqref|eq:osc-harmonizable> holds, <math|R<around|(|s,t|)>>
    is an FS transform and thus harmonizable.
  </proof>

  <section*|Acknowledgment>

  The author is indebted to H. J. Landau for remarks on an early version of
  this paper and to a referee for several helpful suggestions.

  <\thebibliography|12>
    <bibitem|loeve1955probability>M.<nbsp>Loève, <em|Probability Theory>. New
    York: Van Nostrand, 1955.

    <bibitem|blanc-lapierre1968random>A.<nbsp>Blanc-Lapierre and
    R.<nbsp>Fortet, <em|Theory of Random Functions>. New York: Gordon and
    Breach, 1968.

    <bibitem|cambanis1970harmonizable>S.<nbsp>Cambanis and B.<nbsp>Liu, \POn
    harmonizable stochastic processes,\Q <em|Inform. Contr.>, vol.<nbsp>17,
    pp.<nbsp>183\U202, 1970.

    <bibitem|donati1971spectra>F.<nbsp>Donati, \PFinite-time averaged power
    spectra\Q, <em|IEEE Trans. Inform. Theory>, vol. IT-17, pp. 7\U16, Jan.
    1971.

    <bibitem|ogura1971spectral>H.<nbsp>Ogura, \PSpectral representation of a
    periodic nonstationary random process,\Q <em|IEEE Trans. Inform. Theory>,
    vol. IT-17, pp. 143\U149, Mar. 1971.

    <bibitem|gladyshev1963almost>E.<nbsp>G.<nbsp>Gladyshev, \PPeriodically
    and almost-periodically correlated random processes with continuous time
    parameter,\Q <em|Theory Prob. Appl.>, vol.<nbsp>8, pp.<nbsp>173\U177,
    1963.

    <bibitem|priestley1965evolutionary>M.<nbsp>B.<nbsp>Priestley,
    \PEvolutionary spectra and nonstationary processes,\Q <em|J. Roy.
    Statist. Soc. B>, vol.<nbsp>27, pp.<nbsp>204\U237, 1965.

    <bibitem|bochner1934fst>S.<nbsp>Bochner, \PA theorem on Fourier-Stieltjes
    integrals,\Q <em|Bull. Amer. Math. Soc.>, vol.<nbsp>40,
    pp.<nbsp>271\U276, 1934.

    <bibitem|eberlein1955fst>W.<nbsp>F.<nbsp>Eberlein, \PCharacterization of
    Fourier-Stieltjes transforms,\Q <em|Duke Math. J.>, vol.<nbsp>22,
    pp.<nbsp>465\U468, 1955.

    <bibitem|rudin1962groups>W.<nbsp>Rudin, <em|Fourier Analysis on Groups>.
    New York: Interscience, 1962.

    <bibitem|cramer1939representation>H.<nbsp>Cramér, \POn the representation
    of a function by certain Fourier integrals,\Q <em|Trans. Amer. Math.
    Soc.>, vol.<nbsp>46, pp.<nbsp>191\U201, 1939.

    <bibitem|dominguez1940fst>A.<nbsp>G.<nbsp>Dominguez, \PThe representation
    of functions by Fourier integrals,\Q <em|Duke Math. J.>, vol.<nbsp>6,
    pp.<nbsp>246\U255, 1940.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-4|<tuple|28|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-5|<tuple|28|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-blanc-lapierre1968random|<tuple|blanc-lapierre1968random|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-bochner1934fst|<tuple|bochner1934fst|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-cambanis1970harmonizable|<tuple|cambanis1970harmonizable|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-cramer1939representation|<tuple|cramer1939representation|7|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-dominguez1940fst|<tuple|dominguez1940fst|7|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-donati1971spectra|<tuple|donati1971spectra|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-eberlein1955fst|<tuple|eberlein1955fst|7|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-gladyshev1963almost|<tuple|gladyshev1963almost|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-loeve1955probability|<tuple|loeve1955probability|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-ogura1971spectral|<tuple|ogura1971spectral|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-priestley1965evolutionary|<tuple|priestley1965evolutionary|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-rudin1962groups|<tuple|rudin1962groups|7|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:BE-nnd|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:G-normalization|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:bochner|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:bochner-nnd|<tuple|14|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:bounded-var-G|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:cov-fn-filtered|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:cov-fn-harm|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:covariance-harmonizable|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:gaussian-moments|<tuple|17|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:integral-composed|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:lti-filter|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:moving-average|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:nnd-Ga|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:osc-harmonizable|<tuple|27|6|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:oscillatory-fn|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:process-harmonizable|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|ex:composition|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|ex:integral-composed|<tuple|6|5|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:bochner|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:bochner-eberlein|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:covariance-fs|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      loeve1955probability

      blanc-lapierre1968random

      cambanis1970harmonizable

      donati1971spectra

      ogura1971spectral

      loeve1955probability

      priestley1965evolutionary

      loeve1955probability

      bochner1934fst

      eberlein1955fst

      rudin1962groups

      cramer1939representation

      dominguez1940fst

      bochner1934fst

      loeve1955probability
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Examples
      and Application> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgment>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>