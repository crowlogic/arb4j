<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Covariance Functions>|<doc-author|<author-data|<author-name|That
  Guy Who Wrote The Book That was Way Too Focused On Machine Learning to be
  Of Use and Incorrected Stated Complex Exponentials as being Eigenfunctions
  of statiomary kernels rather than covariance operators having stationary
  kernels because it doesnt even make sense to say a function has an
  eigenfunction>>>>

  <\table-of-contents|toc>
    <vspace*|2fn><with|font-series|bold|math-font-series|bold|font-size|1.19|1<space|2spc>Covariance
    Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|1fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Mean Square Continuity and
    Differentiability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Examples
    of Covariance Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Stationary Covariance Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Dot Product Covariance Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.3<space|2spc>Other Non-stationary Covariance
    Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Eigenfunction
    Analysis of Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Kernels
    for Non-vectorial Inputs> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>String Kernels
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|4.2<space|2spc>Fisher Kernels
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Exercises>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|A.6<space|2spc>References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>
  </table-of-contents>

  <chapter|Covariance Functions><label|ch:covariance>

  It has been seen that a covariance function is the crucial ingredient in a
  Gaussian process predictor, as it encodes the assumptions about the
  function which is to be learned. From a slightly different viewpoint it is
  clear that in supervised learning the notion of similarity between data
  points is crucial; it is a basic assumption that points with inputs
  <math|x> which are close are likely to have similar target values <math|y>,
  and thus training points that are near to a test point should be
  informative about the prediction at that point. Under the Gaussian process
  view it is the covariance function that defines nearness or similarity.

  An arbitrary function of input pairs <math|x> and <math|x<rprime|'>> will
  not, in general, be a valid covariance function.<footnote|To be a valid
  covariance function it must be positive semidefinite, see
  equation<nbsp><eqref|eq:psd_kernel>.> The purpose of this chapter is to
  give examples of some commonly-used covariance functions and to examine
  their properties. Section<nbsp><reference|sec:preliminaries> defines a
  number of basic terms relating to covariance functions.
  Section<nbsp><reference|sec:examples> gives examples of stationary,
  dot-product, and other non-stationary covariance functions, and also gives
  some ways to make new ones from old. Section<nbsp><reference|sec:eigenfunction>
  introduces the important topic of eigenfunction analysis of covariance
  functions, and states Mercer's theorem which allows the expression of the
  covariance function (under certain conditions) in terms of its
  eigenfunctions and eigenvalues. The covariance functions given in
  section<nbsp><reference|sec:examples> are valid when the input domain
  <math|\<cal-X\>> is a subset of <math|\<bbb-R\><rsup|D>>. In
  section<nbsp><reference|sec:nonvectorial> methods are described to define
  covariance functions when the input domain is over structured objects such
  as strings and trees.

  <section|Preliminaries><label|sec:preliminaries>

  A stationary covariance function is a function of <math|x-x<rprime|'>>.
  Thus it is invariant to translations in the input space.<footnote|In
  stochastic process theory a process which has constant mean and whose
  covariance function is invariant to translations is called weakly
  stationary. A process is strictly stationary if all of its finite
  dimensional distributions are invariant to
  translations<nbsp><cite|papoulis1991>.> For example the squared exponential
  covariance function given in equation<nbsp><eqref|eq:se_covariance> is
  stationary. If further the covariance function is a function only of
  <math|<around|\||x-x<rprime|'>|\|>> then it is called isotropic; it is thus
  invariant to all rigid motions. For example the squared exponential
  covariance function given in equation<nbsp><eqref|eq:se_covariance> is
  isotropic. As <math|k> is now only a function of
  <math|r=<around|\||x-x<rprime|'>|\|>> these are also known as radial basis
  functions (RBFs).

  If a covariance function depends only on <math|x> and <math|x<rprime|'>>
  through <math|x\<cdot\>x<rprime|'>> it is called a dot product covariance
  function. A simple example is the covariance function
  <math|k<around|(|x,x<rprime|'>|)>=\<sigma\><rsub|0><rsup|2>+x\<cdot\>x<rprime|'>>
  which can be obtained from linear regression by putting
  <math|\<cal-N\><around|(|0,1|)>> priors on the coefficients of
  <math|x<rsub|d>> (<math|d=1,\<ldots\>,D>) and a prior of
  <math|\<cal-N\><around|(|0,\<sigma\><rsub|0><rsup|2>|)>> on the bias (or
  constant function) <math|1>, see equation<nbsp><eqref|eq:dot_linear_cov>.
  Another important example is the inhomogeneous polynomial kernel
  <math|k<around|(|x,x<rprime|'>|)>=<around|(|\<sigma\><rsub|0><rsup|2>+x\<cdot\>x<rprime|'>|)><rsup|p>>
  where <math|p> is a positive integer. Dot product covariance functions are
  invariant to a rotation of the coordinates about the origin, but not
  translations.

  A general name for a function <math|k> of two arguments mapping a pair of
  inputs <math|x\<in\>\<cal-X\>,x<rprime|'>\<in\>\<cal-X\>> into
  <math|\<bbb-R\>> is a kernel. This term arises in the theory of integral
  operators, where the operator <math|T<rsub|k>> is defined as

  <\equation>
    <label|eq:integral_operator><around|(|T<rsub|k>*f|)><around|(|x|)>=<big|int><rsub|\<cal-X\>>k<around|(|x,x<rprime|'>|)>*f<around|(|x<rprime|'>|)>*d*\<mu\><around|(|x<rprime|'>|)>,
  </equation>

  where <math|\<mu\>> denotes a measure; see
  Section<nbsp><reference|sec:eigenfunction> for further discussion.

  A real kernel is said to be symmetric if
  <math|k<around|(|x,x<rprime|'>|)>=k<around|(|x<rprime|'>,x|)>>; clearly
  covariance functions must be symmetric from the definition.

  Given a set of input points <math|<around|{|x<rsub|i>\|i=1,\<ldots\>,n|}>>
  the Gram matrix <math|K> can be computed whose entries are
  <math|K<rsub|i*j>=k<around|(|x<rsub|i>,x<rsub|j>|)>>. If <math|k> is a
  covariance function the matrix <math|K> is called the covariance matrix.

  A real <math|n\<times\>n> matrix <math|K> which satisfies
  <math|Q<around|(|v|)>=v<rsup|\<top\>>*K*v\<geq\>0> for all vectors
  <math|v\<in\>\<bbb-R\><rsup|n>> is called positive semidefinite (PSD). If
  <math|Q<around|(|v|)>=0> only when <math|v=0> the matrix is positive
  definite. <math|Q<around|(|v|)>> is called a quadratic form. A symmetric
  matrix is PSD if and only if all of its eigenvalues are non-negative. A
  Gram matrix corresponding to a general kernel function need not be PSD, but
  the Gram matrix corresponding to a covariance function is PSD.

  A kernel is said to be positive semidefinite if

  <\equation>
    <label|eq:psd_kernel><big|int>k<around|(|x,x<rprime|'>|)>*f<around|(|x|)>*f<around|(|x<rprime|'>|)>*d*\<mu\><around|(|x|)>*d*\<mu\><around|(|x<rprime|'>|)>\<geq\>0
  </equation>

  for all <math|f\<in\>L<rsup|2><around|(|\<cal-X\>,\<mu\>|)>>. Equivalently
  a kernel function which gives rise to PSD Gram matrices for any choice of
  <math|n> and <math|\<cal-D\>> is positive semidefinite.

  For a one-dimensional Gaussian process one way to understand the
  characteristic length-scale of the process (if this exists) is in terms of
  the number of upcrossings of a level <math|u>. Adler<nbsp><cite|adler1981>
  states that the expected number of upcrossings
  <math|E<around|[|N<rsub|u>|]>> of the level <math|u> on the unit interval
  by a zero-mean, stationary, almost surely continuous Gaussian process is
  given by

  <\equation>
    <label|eq:upcrossings>E<around|[|N<rsub|u>|]>=<frac|1|2*\<pi\>>*<sqrt|<frac|-k<rprime|''><around|(|0|)>|k<around|(|0|)>>>*exp
    <around*|(|-<frac|u<rsup|2>|2*k<around|(|0|)>>|)>
  </equation>

  If <math|k<rprime|''><around|(|0|)>> does not exist (so that the process is
  not mean square differentiable) then if such a process has a zero at
  <math|x<rsub|0>> then it will almost surely have an infinite number of
  zeros in the arbitrarily small interval
  <math|<around|(|x<rsub|0>,x<rsub|0>+\<delta\>|)>><nbsp><cite|blake1973>.

  <subsection|Mean Square Continuity and Differentiability><label|sec:ms_continuity>

  Mean square continuity and differentiability of stochastic processes is now
  described, following Adler<nbsp><cite|adler1981>. Let
  <math|x<rsub|1>,x<rsub|2>,\<ldots\>> be a sequence of points and
  <math|x<rsup|\<ast\>>> be a fixed point in <math|\<bbb-R\><rsup|D>> such
  that <math|<around|\||x<rsub|k>-x<rsup|\<ast\>>|\|>\<to\>0> as
  <math|k\<to\>\<infty\>>. Then a process <math|f<around|(|x|)>> is
  continuous in mean square at <math|x<rsup|\<ast\>>> if
  <math|E<around|[|<around|\||f<around|(|x<rsub|k>|)>-f<around|(|x<rsup|\<ast\>>|)>|\|><rsup|2>|]>\<to\>0>
  as <math|k\<to\>\<infty\>>. If this holds for all
  <math|x<rsup|\<ast\>>\<in\>A> where <math|A> is a subset of
  <math|\<bbb-R\><rsup|D>> then <math|f<around|(|x|)>> is said to be
  continuous in mean square (MS) over <math|A>. A random field is continuous
  in mean square at <math|x<rsup|\<ast\>>> if and only if its covariance
  function <math|k<around|(|x,x<rprime|'>|)>> is continuous at the point
  <math|x=x<rprime|'>=x<rsup|\<ast\>>>. For stationary covariance functions
  this reduces to checking continuity at <math|k<around|(|0|)>>. Note that MS
  continuity does not necessarily imply sample function continuity; for a
  discussion of sample function continuity and differentiability see
  Adler<nbsp><cite|adler1981>.

  The mean square derivative of <math|f<around|(|x|)>> in the <math|i>th
  direction is defined as

  <\equation>
    <label|eq:ms_derivative><frac|\<partial\>*f<around|(|x|)>|\<partial\>*x<rsub|i>>=lim<rsub|h\<to\>0>
    <frac|f*<around|(|x+h*e<rsub|i>|)>-f<around|(|x|)>|h>
  </equation>

  when the limit exists, where the limit is in mean square and
  <math|e<rsub|i>> is the unit vector in the <math|i>th direction. The
  covariance function of <math|\<partial\>*f<around|(|x|)>/\<partial\>*x<rsub|i>>
  is given by <math|<frac|\<partial\><rsup|2>*k<around|(|x,x<rprime|'>|)>|\<partial\>*x<rsub|i>*\<partial\>*x<rprime|'><rsub|i>>>.
  These definitions can be extended to higher order derivatives. For
  stationary processes, if the <math|2*k>th-order partial derivative
  <math|<frac|\<partial\><rsup|2*k>*k<around|(|x|)>|\<partial\><rsup|2>*x<rsub|i<rsub|1>>*\<ldots\>*\<partial\><rsup|2>*x<rsub|i<rsub|k>>>>
  exists and is finite at <math|x=0> then the <math|k>th order partial
  derivative <math|<frac|\<partial\><rsup|k>*f<around|(|x|)>|\<partial\>*x<rsub|i<rsub|1>>*\<ldots\>*x<rsub|i<rsub|k>>>>
  exists for all <math|x\<in\>\<bbb-R\><rsup|D>> as a mean square limit.
  Notice that it is the properties of the kernel <math|k> around <math|0>
  that determine the smoothness properties (MS differentiability) of a
  stationary process.

  <section|Examples of Covariance Functions><label|sec:examples>

  In this section covariance functions are considered where the input domain
  <math|\<cal-X\>> is a subset of the vector space <math|\<bbb-R\><rsup|D>>.
  More general input spaces are considered in
  Section<nbsp><reference|sec:nonvectorial>. The section starts in
  Section<nbsp><reference|sec:stationary> with stationary covariance
  functions, then considers dot-product covariance functions in
  Section<nbsp><reference|sec:dotproduct> and other varieties of
  non-stationary covariance functions in Section<nbsp><reference|sec:nonstationary>.
  An overview of some commonly used covariance functions is given in
  Table<nbsp><reference|tab:covariance_summary> and in
  Section<nbsp><reference|sec:new_kernels> general methods for constructing
  new kernels from old are described. There exist several other good
  overviews of covariance functions, see e.g.
  Abrahamsen<nbsp><cite|abrahamsen1997>.

  <subsection|Stationary Covariance Functions><label|sec:stationary>

  In this section (and Section<nbsp><reference|sec:eigenfunction>) it will be
  convenient to allow kernels to be a map from
  <math|x\<in\>\<cal-X\>,x<rprime|'>\<in\>\<cal-X\>> into <math|\<bbb-C\>>
  (rather than <math|\<bbb-R\>>). If a zero-mean process <math|f> is
  complex-valued, then the covariance function is defined as

  <\equation>
    k<around|(|x,x<rprime|'>|)>=E*<around|[|f<around|(|x|)>*f<rsup|\<ast\>><around|(|x<rprime|'>|)>|]>
  </equation>

  where <math|\<ast\>> denotes complex conjugation. A stationary covariance
  function is a function of <math|\<tau\>=x-x<rprime|'>>. Sometimes in this
  case <math|k> will be written as a function of a single argument, i.e.
  <math|k<around|(|\<tau\>|)>>.

  The covariance function of a stationary process can be represented as the
  Fourier transform of a positive finite measure.

  <\theorem>
    [Bochner's theorem]<label|thm:bochner> A complex-valued function <math|k>
    on <math|\<bbb-R\><rsup|D>> is the covariance function of a weakly
    stationary mean square continuous complex-valued random process on
    <math|\<bbb-R\><rsup|D>> if and only if it can be represented as

    <\equation>
      <label|eq:bochner>k<around|(|\<tau\>|)>=<big|int><rsub|\<bbb-R\><rsup|D>>e<rsup|2*\<pi\>*i*\<b-s\>\<cdot\>\<tau\>>*d*\<mu\><around|(|\<b-s\>|)>
    </equation>

    where <math|\<mu\>> is a positive finite measure.
  </theorem>

  If <math|\<mu\>> has a density <math|S<around|(|\<b-s\>|)>> then <math|S>
  is called the spectral density or power spectrum corresponding to <math|k>.

  In the case that the spectral density <math|S<around|(|\<b-s\>|)>> exists,
  the covariance function and the spectral density are Fourier duals of each
  other as shown in

  <\align>
    <tformat|<table|<row|<cell|k<around|(|\<tau\>|)>>|<cell|=<big|int>S<around|(|\<b-s\>|)>*e<rsup|2*\<pi\>*i*\<b-s\>\<cdot\>\<tau\>>*d*\<b-s\><eq-number><label|eq:wiener_khintchine>>>|<row|<cell|S<around|(|\<b-s\>|)>>|<cell|=<big|int>k<around|(|\<tau\>|)>*e<rsup|-2*\<pi\>*i*\<b-s\>\<cdot\>\<tau\>>*d*\<tau\>>>>>
  </align>

  This is the Wiener-Khintchine theorem<nbsp><cite|chatfield1989>; see
  Appendix<nbsp>A.8 for details of Fourier transforms.

  Notice that the variance of the process is
  <math|k<around|(|0|)>=<big|int>S<around|(|\<b-s\>|)>*d*\<b-s\>> so the
  power spectrum must be integrable to define a valid Gaussian process.

  The complex exponentials <math|e<rsup|2*\<pi\>*i*\<b-s\>\<cdot\>x>> are
  eigenfunctions of a stationary kernel with respect to Lebesgue measure (see
  Section<nbsp><reference|sec:eigenfunction> for further details).

  If the covariance function is isotropic (so that it is a function of
  <math|r>, where <math|r=<around|\||\<tau\>|\|>>) then
  <math|S<around|(|\<b-s\>|)>> is a function of <math|<around|\||\<b-s\>|\|>>
  only<nbsp><cite|adler1981>. In this case the integrals
  in<nbsp><eqref|eq:wiener_khintchine> can be simplified by changing to
  spherical polar coordinates and integrating out the angular variables,
  yielding a Hankel transform:

  <\align>
    <tformat|<table|<row|<cell|k<around|(|r|)>>|<cell|=<frac|2*\<pi\>|r<rsup|D/2-1>>*<big|int><rsub|0><rsup|\<infty\>>S<around|(|s|)>*J<rsub|D/2-1>*<around|(|2*\<pi\>*r*s|)>*s<rsup|D/2>*d*s<eq-number><label|eq:hankel_transform>>>|<row|<cell|S<around|(|s|)>>|<cell|=<frac|2*\<pi\>|s<rsup|D/2-1>>*<big|int><rsub|0><rsup|\<infty\>>k<around|(|r|)>*J<rsub|D/2-1>*<around|(|2*\<pi\>*r*s|)>*r<rsup|D/2>*d*r>>>>
  </align>

  where <math|J<rsub|D/2-1>> is a Bessel function of order <math|D/2-1>.

  <vspace*|1ex><no-indent><with|font-series|bold|Common Stationary Covariance
  Functions:>

  Below are several commonly-used covariance functions as defined in
  Table<nbsp><reference|tab:covariance_summary>. All expressions refer to
  covariance <math|k<around|(|r|)>=k<around|(|<around|\||x-x<rprime|'>|\|>|)>>
  unless otherwise indicated.

  <\enumerate>
    <item><with|font-series|bold|Squared Exponential (SE):>

    <\equation>
      <label|eq:se_covariance>k<rsub|SE><around|(|r|)>=exp
      <around*|(|-<frac|r<rsup|2>|2*\<ell\><rsup|2>>|)>
    </equation>

    Parameter <math|\<ell\>> is the characteristic length-scale. This kernel
    is infinitely differentiable. The SE spectral density is
    <math|S<around|(|s|)>=<around|(|2*\<pi\>*\<ell\><rsup|2>|)><rsup|D/2>*exp
    <around|(|-2*\<pi\><rsup|2>*\<ell\><rsup|2>*s<rsup|2>|)>>.

    <item><with|font-series|bold|Matérn class:>

    <\equation>
      <label|eq:matern>k<rsub|<text|Matérn>><around|(|r|)>=<frac|2<rsup|1-\<nu\>>|\<Gamma\><around|(|\<nu\>|)>><around*|(|<frac|<sqrt|2*\<nu\>>*r|\<ell\>>|)><rsup|\<nu\>>*K<rsub|\<nu\>><around*|(|<frac|<sqrt|2*\<nu\>>*r|\<ell\>>|)>
    </equation>

    with positive parameters <math|\<nu\>,\<ell\>>, and <math|K<rsub|\<nu\>>>
    a modified Bessel function<nbsp><cite|abramowitz1965>. See
    Section<nbsp><reference|sec:examples> for special cases.

    <item><with|font-series|bold|Exponential:>

    <\equation>
      k<around|(|r|)>=exp <around|(|-r/\<ell\>|)>
    </equation>

    A special case of the Matérn with <math|\<nu\>=1/2>. Not MS
    differentiable. Related to the Ornstein-Uhlenbeck process.

    <item><with|font-series|bold|<math|\<gamma\>>-Exponential:>

    <\equation>
      k<around|(|r|)>=exp <around*|(|-<around*|(|<frac|r|\<ell\>>|)><rsup|\<gamma\>>|)>,<space|1em>0\<less\>\<gamma\>\<leq\>2
    </equation>

    <item><with|font-series|bold|Rational Quadratic:>

    <\equation>
      k<rsub|RQ><around|(|r|)>=<around*|(|1+<frac|r<rsup|2>|2*\<alpha\>*\<ell\><rsup|2>>|)><rsup|-\<alpha\>>
    </equation>

    This is a scale mixture of SE kernels with Gamma-distributed
    length-scales.

    <item><with|font-series|bold|Piecewise polynomial with compact support:>

    <\align>
      <tformat|<table|<row|<cell|k<rsub|p*p><rsup|D,0><around|(|r|)>>|<cell|=<around|(|1-r|)><rsub|+><rsup|j>>>|<row|<cell|k<rsub|p*p><rsup|D,1><around|(|r|)>>|<cell|=<around|(|1-r|)><rsub|+><rsup|j+1>*<around|(|<around|(|j+1|)>*r+1|)>>>|<row|<cell|k<rsub|p*p><rsup|D,2><around|(|r|)>>|<cell|=<around|(|1-r|)><rsub|+><rsup|j+2>*<around|(|<around|(|j<rsup|2>+4*j+3|)>*r<rsup|2>+<around|(|3*j+6|)>*r+3|)>/3>>|<row|<cell|k<rsub|p*p><rsup|D,3><around|(|r|)>>|<cell|=<around|(|1-r|)><rsub|+><rsup|j+3>*<around|(|<around|(|j<rsup|3>+9*j<rsup|2>+23*j+15|)>*r<rsup|3>+<around|(|6*j<rsup|2>+36*j+45|)>*r<rsup|2>+<around|(|15*j+45|)>*r+15|)>/15<eq-number>>>>>
    </align>

    where <math|j=<around|\<lfloor\>|D/2|\<rfloor\>>+q+1>.
  </enumerate>

  See<nbsp><cite|wendland2005> for conditions of positive-definiteness in
  different input dimensions.

  <big-table|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|10|10|1|-1|cell-bborder|1ln>|<table|<row|<cell|covariance
  function>|<cell|expression>|<cell|Stationary? (S)>|<cell|Nondegenerate?
  (ND)>>|<row|<cell|constant>|<cell|<math|\<sigma\><rsub|0><rsup|2>>>|<cell|<math|\<checkmark\>>>|<cell|>>|<row|<cell|linear>|<cell|<math|<big|sum><rsub|d=1><rsup|D>\<sigma\><rsub|d><rsup|2>*x<rsub|d>*x<rprime|'><rsub|d>>>|<cell|>|<cell|>>|<row|<cell|polynomial>|<cell|<math|<around|(|x\<cdot\>x<rprime|'>+\<sigma\><rsub|0><rsup|2>|)><rsup|p>>>|<cell|>|<cell|>>|<row|<cell|squared
  exponential>|<cell|<math|exp <around|(|-r<rsup|2>/2*\<ell\><rsup|2>|)>>>|<cell|<math|\<checkmark\>>>|<cell|<math|\<checkmark\>>>>|<row|<cell|Matérn>|<cell|see
  Eq.<nbsp><eqref|eq:matern>>|<cell|<math|\<checkmark\>>>|<cell|<math|\<checkmark\>>>>|<row|<cell|exponential>|<cell|<math|exp
  <around|(|-r/\<ell\>|)>>>|<cell|<math|\<checkmark\>>>|<cell|<math|\<checkmark\>>>>|<row|<cell|<math|\<gamma\>>-exponential>|<cell|<math|exp
  <around|(|-<around|(|r/\<ell\>|)><rsup|\<gamma\>>|)>>>|<cell|<math|\<checkmark\>>>|<cell|<math|\<checkmark\>>>>|<row|<cell|rational
  quadratic>|<cell|<math|<around|(|1+r<rsup|2>/<around|(|2*\<alpha\>*\<ell\><rsup|2>|)>|)><rsup|-\<alpha\>>>>|<cell|<math|\<checkmark\>>>|<cell|<math|\<checkmark\>>>>|<row|<cell|neural
  network>|<cell|see Eq.<nbsp><eqref|eq:nn_covariance>>|<cell|>|<cell|<math|\<checkmark\>>>>>>><label|tab:covariance_summary>>|Summary
  of several commonly-used covariance functions.
  <math|r=<around|\||x-x<rprime|'>|\|>>. See
  Section<nbsp><reference|sec:examples> for details.>

  <subsection|Dot Product Covariance Functions><label|sec:dotproduct>

  The kernel

  <\equation>
    <label|eq:dot_linear_cov>k<around|(|x,x<rprime|'>|)>=\<sigma\><rsub|0><rsup|2>+x\<cdot\>x<rprime|'>
  </equation>

  arises from Bayesian linear regression. Homogeneous if
  <math|\<sigma\><rsub|0><rsup|2>=0>, inhomogeneous otherwise. It is also
  valid to apply a general positive-semidefinite <math|\<Sigma\><rsub|p>>:

  <\equation>
    k<around|(|x,x<rprime|'>|)>=\<sigma\><rsub|0><rsup|2>+x<rsup|\<top\>>*\<Sigma\><rsub|p>*x<rprime|'>
  </equation>

  Polynomials are generated via

  <\equation>
    k<around|(|x,x<rprime|'>|)>=<around|(|\<sigma\><rsub|0><rsup|2>+x<rsup|\<top\>>*\<Sigma\><rsub|p>*x<rprime|'>|)><rsup|p>
  </equation>

  for <math|p> a positive integer. See Section<nbsp><reference|sec:dotproduct>
  for feature space construction.

  <subsection|Other Non-stationary Covariance
  Functions><label|sec:nonstationary>

  Covariance functions derived from neural
  networks<nbsp><cite|neal1996|williams1998>, convolution constructions, and
  kernels defined on nonlinear input transformations <math|u<around|(|x|)>>
  (<em|warping>, see<nbsp><cite|sampson1992>) are important examples. The
  neural network (NN) kernel (with <math|<math-up|erf>> nonlinearity) is

  <\equation>
    <label|eq:nn_covariance>k<rsub|NN><around|(|x,x<rprime|'>|)>=<frac|2|\<pi\>>*sin<rsup|-1><around*|(|<frac|2*<wide|x|~><rsup|\<top\>>*\<Sigma\>*<wide|x|~><rprime|'>|<sqrt|<around|(|1+2*<wide|x|~><rsup|\<top\>>*\<Sigma\>*<wide|x|~>|)>*<around|(|1+2*<wide|x|~><rprime|'><rsup|\<top\>>*\<Sigma\>*<wide|x|~><rprime|'>|)>>>|)>
  </equation>

  where <math|<wide|x|~>=<around|(|1,x<rsub|1>,...,x<rsub|D>|)><rsup|\<top\>>>.
  More non-stationary constructions, including the Gibbs kernel, are
  discussed in Section<nbsp><reference|sec:nonstationary>.

  <section|Eigenfunction Analysis of Kernels><label|sec:eigenfunction>

  A function <math|\<phi\><around|(|\<cdummy\>|)>> is an eigenfunction of
  kernel <math|k> (with respect to measure <math|\<mu\>>) with eigenvalue
  <math|\<lambda\>> if

  <\equation>
    <big|int>k<around|(|x,x<rprime|'>|)>*\<phi\><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>=\<lambda\>*\<phi\><around|(|x<rprime|'>|)>
  </equation>

  holds. The ordering is such that <math|\<lambda\><rsub|1>\<geq\>\<lambda\><rsub|2>\<geq\>>...
  and eigenfunctions are orthonormal.

  <\theorem>
    [Mercer's theorem]<label|thm:mercer> Let
    <math|<around|(|\<cal-X\>,\<mu\>|)>> be a finite measure space and
    <math|k\<in\>L<rsup|\<infty\>><around|(|\<cal-X\><rsup|2>,\<mu\><rsup|2>|)>>
    a kernel such that <math|T<rsub|k>:L<rsup|2><around|(|\<cal-X\>,\<mu\>|)>\<to\>L<rsup|2><around|(|\<cal-X\>,\<mu\>|)>>
    is positive definite (see Eq.<nbsp><eqref|eq:psd_kernel>). Let
    <math|\<phi\><rsub|i>> be normalized eigenfunctions associated to
    eigenvalues <math|\<lambda\><rsub|i>\<gtr\>0>. Then

    <\enumerate>
      <item>The sequence <math|<around|{|\<lambda\><rsub|i>|}>> is absolutely
      summable;

      <item>

      <\equation>
        k<around|(|x,x<rprime|'>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<phi\><rsub|i><around|(|x|)>*\<phi\><rsub|i><rsup|\<ast\>><around|(|x<rprime|'>|)>
      </equation>

      holds <math|\<mu\><rsup|2>> almost everywhere, with absolute and
      uniform convergence.
    </enumerate>
  </theorem>

  A <em|degenerate> kernel has finitely many nonzero eigenvalues.

  For stationary kernels on <math|\<bbb-R\><rsup|D>>, Bochner's theorem
  yields

  <\equation>
    k*<around|(|x-x<rprime|'>|)>=<big|int><rsub|\<bbb-R\><rsup|D>>e<rsup|2*\<pi\>*i*\<b-s\>\<cdot\><around|(|x-x<rprime|'>|)>>*d*\<mu\><around|(|\<b-s\>|)>
  </equation>

  where the Fourier exponentials <math|e<rsup|2*\<pi\>*i*\<b-s\>\<cdot\>x>>
  are eigenfunctions.

  For the SE kernel with Gaussian measure, the eigenvalues and eigenfunctions
  are<nbsp><cite|zhu1998>

  <\align>
    <tformat|<table|<row|<cell|\<lambda\><rsub|k>>|<cell|=<sqrt|<frac|2*a|A>>*B<rsup|k><eq-number><label|eq:se_eigenvalues>>>|<row|<cell|\<phi\><rsub|k><around|(|x|)>>|<cell|=exp
    <around|(|-<around|(|c-a|)>*x<rsup|2>|)>*H<rsub|k>*<around|(|<sqrt|2*c>*x|)><eq-number><label|eq:se_eigenfunctions>>>>>
  </align>

  where <math|H<rsub|k>> is the <math|k>th Hermite polynomial,
  <math|a<rsup|-1>=4*\<sigma\><rsup|2>>, <math|b<rsup|-1>=2*\<ell\><rsup|2>>,
  <math|c=<sqrt|a<rsup|2>+2*a*b>>, <math|A=a+b+c>, <math|B=b/A>.

  <section|Kernels for Non-vectorial Inputs><label|sec:nonvectorial>

  For data such as strings, trees, or graphs, kernels are defined as follows.

  <subsection|String Kernels><label|sec:string_kernels>

  Let <math|\<cal-A\>> be a finite alphabet. The string kernel is

  <\equation>
    <label|eq:string_kernel>k<around|(|x,x<rprime|'>|)>=<big|sum><rsub|s\<in\>\<cal-A\><rsup|\<ast\>>>w<rsub|s>*\<phi\><rsub|s><around|(|x|)>*\<phi\><rsub|s><around|(|x<rprime|'>|)>
  </equation>

  where <math|\<phi\><rsub|s><around|(|x|)>> is the count of substring
  <math|s> in <math|x>, and <math|w<rsub|s>\<geq\>0>. Special cases include
  the bag-of-characters, bag-of-words, and <math|k>-spectrum kernels.

  <subsection|Fisher Kernels><label|sec:fisher_kernels>

  Given a probabilistic model <math|p<around|(|x\<mid\>\<theta\>|)>>, the
  Fisher kernel uses the score <math|\<phi\><rsub|\<theta\>><around|(|x|)>=\<nabla\><rsub|\<theta\>>*log
  p<around|(|x\|\<theta\>|)>>:

  <\equation>
    k<around|(|x,x<rprime|'>|)>=\<phi\><rsub|\<theta\>><around|(|x|)><rsup|\<top\>>*M<rsup|-1>*\<phi\><rsub|\<theta\>><around|(|x<rprime|'>|)>
  </equation>

  Usually <math|M> is the Fisher information matrix:
  <math|M=E<rsub|x>*<around|[|\<phi\><rsub|\<theta\>><around|(|x|)>*\<phi\><rsub|\<theta\>><around|(|x|)><rsup|\<top\>>|]>><nbsp><cite|amari1985>.

  <section|Exercises><label|sec:exercises>

  <\enumerate>
    <item>The OU process with covariance <math|k*<around|(|x-x<rprime|'>|)>=exp
    <around|(|-<around|\||x-x<rprime|'>|\|>/\<ell\>|)>> is the unique
    stationary first-order Markovian Gaussian process. See computation in
    Section<nbsp><reference|sec:examples>.

    <item>Write code to draw samples from the neural network covariance
    function, Eq.<nbsp><eqref|eq:nn_covariance> in 1-d and 2-d. Compare
    var<math|<around|(|u<rsub|0>|)>> values.

    <item>Show that the random process <math|f<around|(|x|)>=<math-up|erf><around|(|u<rsub|0>+<big|sum><rsub|i=1><rsup|D>u<rsub|j>*x<rsub|j>|)>>
    with <math|u\<sim\>\<cal-N\><around|(|0,\<Sigma\>|)>> has the same
    covariance as the NN kernel.

    <item>Derive Gibbs' non-stationary covariance function,
    Eq.<nbsp><eqref|eq:gibbs_kernel>.

    <item>Draw samples from Gibbs' non-stationary covariance,
    Eq.<nbsp><eqref|eq:gibbs_kernel>, for various
    <math|\<ell\><around|(|x|)>>.

    <item>Show the SE process is infinitely MS differentiable, but the OU
    process is not.

    <item>Prove eigenfunctions of a symmetric kernel are orthogonal w.r.t.
    <math|\<mu\>>.

    <item>Show the transformation <math|k<around|(|x,x<rprime|'>|)>\<mapsto\><wide|k|~><around|(|x,x<rprime|'>|)>=p<rsup|1/2><around|(|x|)>*k<around|(|x,x<rprime|'>|)>*p<rsup|1/2><around|(|x<rprime|'>|)>>
    gives the same eigenvalues as with weighted measure.

    <item>Apply this to the SE kernel and Gaussian density. Confirm
    Eqs.<nbsp><eqref|eq:se_eigenvalues> and<nbsp><eqref|eq:se_eigenfunctions>.

    <item>Compare the SE eigenfunctions exactly to numerics via the Nyström
    method.

    <item>Let <math|x\<sim\>\<cal-N\><around|(|\<mu\>,\<sigma\><rsup|2>*I|)>>.
    Show the Fisher kernel for <math|\<mu\>=0> is the linear kernel:
    <math|k<around|(|x,x<rprime|'>|)>=<frac|1|\<sigma\><rsup|2>>*x\<cdot\>x<rprime|'>>.

    <item>For a <math|k-1> order Markov model string kernel, derive the
    Fisher score and relate it to the <math|k>-spectrum kernel.
  </enumerate>

  <assign|the-section|<macro|A.<number|<section-nr>|arabic>>>

  <section|References>

  <\thebibliography|99>
    <bibitem|abrahamsen1997>P. Abrahamsen. A review of Gaussian random fields
    and correlation functions. Technical Report 917, Norwegian Computing
    Center, Oslo, 1997.

    <bibitem|abramowitz1965>M. Abramowitz and I. A. Stegun. Handbook of
    Mathematical Functions. Dover, New York, 1965.

    <bibitem|adler1981>R. J. Adler. The Geometry of Random Fields. John Wiley
    & Sons, New York, 1981.

    <bibitem|amari1985>S. Amari. Differential-Geometrical Methods in
    Statistics, volume 28 of Lecture Notes in Statistics. Springer-Verlag,
    New York, 1985.

    <bibitem|bach2002>F. R. Bach and M. I. Jordan. Kernel independent
    component analysis. Journal of Machine Learning Research, 3:1\U48, 2002.

    <bibitem|baker1977>C. T. H. Baker. The Numerical Treatment of Integral
    Equations. Oxford University Press, Oxford, 1977.

    <bibitem|blake1973>I. F. Blake and W. C. Lindsey. Level-crossing problems
    for random processes. IEEE Transactions on Information Theory,
    19(3):295\U315, 1973.

    <bibitem|bracewell1986>R. N. Bracewell. The Fourier Transform and its
    Applications. McGraw-Hill, second edition, 1986.

    <bibitem|chatfield1989>C. Chatfield. The Analysis of Time Series: An
    Introduction. Chapman and Hall, London, fourth edition, 1989.

    <bibitem|collins2002>M. Collins and N. Duffy. New ranking algorithms for
    parsing and tagging: Kernels over discrete structures, and the voted
    perceptron. In Proceedings of the 40th Annual Meeting of the Association
    for Computational Linguistics, pages 263\U270, 2002.

    <bibitem|cornford2002>D. Cornford, I. T. Nabney, and C. K. I. Williams.
    Adding constrained discontinuities to Gaussian process models of wind
    fields. In T. G. Dietterich, S. Becker, and Z. Ghahramani, editors,
    Advances in Neural Information Processing Systems 14, pages 861\U867. MIT
    Press, Cambridge, MA, 2002.

    <bibitem|gibbs1997>M. N. Gibbs. Bayesian Gaussian Processes for
    Regression and Classification. PhD thesis, University of Cambridge, 1997.

    <bibitem|gihman1974>I. I. Gihman and A. V. Skorohod. The Theory of
    Stochastic Processes I. Springer-Verlag, New York, 1974.

    <bibitem|gradshteyn1980>I. S. Gradshteyn and I. M. Ryzhik. Table of
    Integrals, Series, and Products. Academic Press, New York, 1980.

    <bibitem|grimmett1992>G. R. Grimmett and D. R. Stirzaker. Probability and
    Random Processes. Oxford University Press, Oxford, second edition, 1992.

    <bibitem|hand2001>D. Hand, H. Mannila, and P. Smyth. Principles of Data
    Mining. MIT Press, Cambridge, MA, 2001.

    <bibitem|hastie1990>T. J. Hastie and R. J. Tibshirani. Generalized
    Additive Models. Chapman and Hall, London, 1990.

    <bibitem|haussler1999>D. Haussler. Convolution kernels on discrete
    structures. Technical Report UCSC-CRL-99-10, University of California at
    Santa Cruz, 1999.

    <bibitem|hawkins1989>D. M. Hawkins. Using U statistics to derive the
    asymptotic distribution of Fisher's Z statistic. The American
    Statistician, 43(4):235\U237, 1989.

    <bibitem|hornik1993>K. Hornik. Some new results on neural network
    approximation. Neural Networks, 6:1069\U1072, 1993.

    <bibitem|jaakkola2000>T. Jaakkola, M. Diekhans, and D. Haussler. A
    discriminative framework for detecting remote protein homologies. Journal
    of Computational Biology, 7(1/2):95\U114, 2000.

    <bibitem|konig1986>H. König. Eigenvalue Distribution of Compact
    Operators. Birkhäuser Verlag, Basel, 1986.

    <bibitem|leslie2003>C. Leslie, E. Eskin, A. Cohen, J. Weston, and W. S.
    Noble. Mismatch string kernels for discriminative protein classification.
    Bioinformatics, 20(4):467\U476, 2004.

    <bibitem|lodhi2001>H. Lodhi, C. Saunders, J. Shawe-Taylor, N.
    Cristianini, and C. Watkins. Text classification using string kernels.
    Journal of Machine Learning Research, 2:419\U444, 2002.

    <bibitem|mackay1998>D. J. C. MacKay. Introduction to Gaussian processes.
    In C. M. Bishop, editor, Neural Networks and Machine Learning, pages
    133\U165. Springer-Verlag, Berlin, 1998.

    <bibitem|matern1960>B. Matérn. Spatial Variation. Meddelanden från
    Statens Skogsforskningsinstitut, volume 49, number 5. Springer-Verlag,
    New York, second edition, 1986. [First edition published in 1960 by
    Statens Skogsforskningsinstitut].

    <bibitem|neal1996>R. M. Neal. Bayesian Learning for Neural Networks.
    Springer-Verlag, New York, 1996.

    <bibitem|ohagan1978>A. O'Hagan. Curve fitting and optimal design for
    prediction. Journal of the Royal Statistical Society B, 40:1\U42, 1978.

    <bibitem|paciorek2004>C. J. Paciorek and M. J. Schervish. Nonstationary
    covariance functions for Gaussian process regression. In S. Thrun, L. K.
    Saul, and B. Schölkopf, editors, Advances in Neural Information
    Processing Systems 16. MIT Press, Cambridge, MA, 2004.

    <bibitem|papoulis1991>A. Papoulis. Probability, Random Variables, and
    Stochastic Processes. McGraw-Hill, New York, third edition, 1991.

    <bibitem|plate1999>T. A. Plate. Accuracy versus interpretability in
    flexible modeling: Implementing a tradeoff using Gaussian process models.
    Behaviormetrika, 26(1):29\U50, 1999.

    <bibitem|poggio1990>T. Poggio and F. Girosi. Networks for approximation
    and learning. Proceedings of the IEEE, 78(9):1481\U1497, 1990.

    <bibitem|press1992>W. H. Press, S. A. Teukolsky, W. T. Vetterling, and B.
    P. Flannery. Numerical Recipes in C: The Art of Scientific Computing.
    Cambridge University Press, Cambridge, second edition, 1992.

    <bibitem|ritter1995>K. Ritter, G. W. Wasilkowski, and H. Wo¹niakowski.
    Multivariate integration and approximation for random fields satisfying
    Sacks-Ylvisaker conditions. The Annals of Applied Probability,
    5(2):518\U540, 1995.

    <bibitem|salton1988>G. Salton and C. Buckley. Term-weighting approaches
    in automatic text retrieval. Information Processing and Management,
    24(5):513\U523, 1988.

    <bibitem|sampson1992>P. D. Sampson and P. Guttorp. Nonparametric
    estimation of nonstationary spatial covariance structure. Journal of the
    American Statistical Association, 87(417):108\U119, 1992.

    <bibitem|saunders2003>C. Saunders, H. Tschach, and J. Shawe-Taylor.
    Syllables and other string kernel extensions. In Proceedings of the
    Nineteenth International Conference on Machine Learning, pages 530\U537.
    Morgan Kaufmann, 2002.

    <bibitem|schoenberg1938>I. J. Schoenberg. Metric spaces and completely
    monotone functions. Annals of Mathematics, 39(4):811\U841, 1938.

    <bibitem|scholkopf1998>B. Schölkopf, A. Smola, and K.-R. Müller.
    Nonlinear component analysis as a kernel eigenvalue problem. Neural
    Computation, 10(5):1299\U1319, 1998.

    <bibitem|scholkopf2002>B. Schölkopf and A. J. Smola. Learning with
    Kernels. MIT Press, Cambridge, MA, 2002.

    <bibitem|shawe2003>J. Shawe-Taylor and C. K. I. Williams. The stability
    of kernel principal components analysis and its relation to the process
    eigenspectrum. In S. Becker, S. Thrun, and K. Obermayer, editors,
    Advances in Neural Information Processing Systems 15, pages 383\U390. MIT
    Press, Cambridge, MA, 2003.

    <bibitem|stein1999>M. L. Stein. Interpolation of Spatial Data: Some
    Theory for Kriging. Springer-Verlag, New York, 1999.

    <bibitem|stitson1999>M. O. Stitson, J. A. E. Weston, A. Gammerman, V.
    Vovk, and V. Vapnik. Theory of support vector machines. Technical Report
    CSD-TR-96-17, Department of Computer Science, Royal Holloway, University
    of London, Egham, UK, 1996.

    <bibitem|tsuda2002>K. Tsuda, M. Kawanabe, G. Rätsch, S. Sonnenburg, and
    K.-R. Müller. A new discriminative kernel from probabilistic models.
    Neural Computation, 14(10):2397\U2414, 2002.

    <bibitem|uhlenbeck1930>G. E. Uhlenbeck and L. S. Ornstein. On the theory
    of the Brownian motion. Physical Review, 36(5):823\U841, 1930.

    <bibitem|vishwanathan2003>S. V. N. Vishwanathan and A. J. Smola. Fast
    kernels for string and tree matching. In S. Becker, S. Thrun, and K.
    Obermayer, editors, Advances in Neural Information Processing Systems 15,
    pages 585\U592. MIT Press, Cambridge, MA, 2003.

    <bibitem|vivarelli1999>F. Vivarelli and C. K. I. Williams. Discovering
    hidden features with Gaussian processes regression. In M. S. Kearns, S.
    A. Solla, and D. A. Cohn, editors, Advances in Neural Information
    Processing Systems 11, pages 613\U619. MIT Press, Cambridge, MA, 1999.

    <bibitem|wahba1990>G. Wahba. Spline Models for Observational Data. SIAM,
    Philadelphia, 1990.

    <bibitem|watkins1999>C. Watkins. Dynamic alignment kernels. In A. J.
    Smola, P. L. Bartlett, B. Schölkopf, and D. Schuurmans, editors, Advances
    in Large Margin Classifiers, pages 39\U50. MIT Press, Cambridge, MA,
    2000.

    <bibitem|watkins2000>C. Watkins. Dynamic alignment kernels. Technical
    Report CSD-TR-98-11, Department of Computer Science, Royal Holloway,
    University of London, 1999.

    <bibitem|wendland2005>H. Wendland. Scattered Data Approximation.
    Cambridge University Press, Cambridge, 2005.

    <bibitem|widom1963>H. Widom. Asymptotic behavior of the eigenvalues of
    certain integral equations. Transactions of the American Mathematical
    Society, 109(2):278\U295, 1963.

    <bibitem|widom1964>H. Widom. Asymptotic behavior of the eigenvalues of
    certain integral equations II. Archive for Rational Mechanics and
    Analysis, 17(3):215\U229, 1964.

    <bibitem|williams1998>C. K. I. Williams. Computation with infinite neural
    networks. Neural Computation, 10(5):1203\U1216, 1998.

    <bibitem|yaglom1987>A. M. Yaglom. Correlation Theory of Stationary and
    Related Random Functions. Springer-Verlag, New York, 1987.

    <bibitem|zhu1998>H. Zhu, C. K. I. Williams, R. J. Rohwer, and M.
    Morciniec. Gaussian regression and optimal finite dimensional linear
    models. In C. M. Bishop, editor, Neural Networks and Machine Learning,
    pages 167\U184. Springer-Verlag, Berlin, 1998.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|4|8>>
    <associate|auto-11|<tuple|4.1|8>>
    <associate|auto-12|<tuple|4.2|9>>
    <associate|auto-13|<tuple|5|9>>
    <associate|auto-14|<tuple|A.6|10>>
    <associate|auto-15|<tuple|A.6|10>>
    <associate|auto-2|<tuple|1|2>>
    <associate|auto-3|<tuple|1.1|3>>
    <associate|auto-4|<tuple|2|4>>
    <associate|auto-5|<tuple|2.1|4>>
    <associate|auto-6|<tuple|1|6>>
    <associate|auto-7|<tuple|2.2|7>>
    <associate|auto-8|<tuple|2.3|7>>
    <associate|auto-9|<tuple|3|7>>
    <associate|bib-abrahamsen1997|<tuple|abrahamsen1997|10>>
    <associate|bib-abramowitz1965|<tuple|abramowitz1965|10>>
    <associate|bib-adler1981|<tuple|adler1981|10>>
    <associate|bib-amari1985|<tuple|amari1985|10>>
    <associate|bib-bach2002|<tuple|bach2002|10>>
    <associate|bib-baker1977|<tuple|baker1977|10>>
    <associate|bib-blake1973|<tuple|blake1973|10>>
    <associate|bib-bracewell1986|<tuple|bracewell1986|10>>
    <associate|bib-chatfield1989|<tuple|chatfield1989|10>>
    <associate|bib-collins2002|<tuple|collins2002|10>>
    <associate|bib-cornford2002|<tuple|cornford2002|10>>
    <associate|bib-gibbs1997|<tuple|gibbs1997|10>>
    <associate|bib-gihman1974|<tuple|gihman1974|10>>
    <associate|bib-gradshteyn1980|<tuple|gradshteyn1980|10>>
    <associate|bib-grimmett1992|<tuple|grimmett1992|10>>
    <associate|bib-hand2001|<tuple|hand2001|10>>
    <associate|bib-hastie1990|<tuple|hastie1990|10>>
    <associate|bib-haussler1999|<tuple|haussler1999|10>>
    <associate|bib-hawkins1989|<tuple|hawkins1989|10>>
    <associate|bib-hornik1993|<tuple|hornik1993|10>>
    <associate|bib-jaakkola2000|<tuple|jaakkola2000|10>>
    <associate|bib-konig1986|<tuple|konig1986|10>>
    <associate|bib-leslie2003|<tuple|leslie2003|10>>
    <associate|bib-lodhi2001|<tuple|lodhi2001|11>>
    <associate|bib-mackay1998|<tuple|mackay1998|11>>
    <associate|bib-matern1960|<tuple|matern1960|11>>
    <associate|bib-neal1996|<tuple|neal1996|11>>
    <associate|bib-ohagan1978|<tuple|ohagan1978|11>>
    <associate|bib-paciorek2004|<tuple|paciorek2004|11>>
    <associate|bib-papoulis1991|<tuple|papoulis1991|11>>
    <associate|bib-plate1999|<tuple|plate1999|11>>
    <associate|bib-poggio1990|<tuple|poggio1990|11>>
    <associate|bib-press1992|<tuple|press1992|11>>
    <associate|bib-ritter1995|<tuple|ritter1995|11>>
    <associate|bib-salton1988|<tuple|salton1988|11>>
    <associate|bib-sampson1992|<tuple|sampson1992|11>>
    <associate|bib-saunders2003|<tuple|saunders2003|11>>
    <associate|bib-schoenberg1938|<tuple|schoenberg1938|11>>
    <associate|bib-scholkopf1998|<tuple|scholkopf1998|11>>
    <associate|bib-scholkopf2002|<tuple|scholkopf2002|11>>
    <associate|bib-shawe2003|<tuple|shawe2003|11>>
    <associate|bib-stein1999|<tuple|stein1999|11>>
    <associate|bib-stitson1999|<tuple|stitson1999|11>>
    <associate|bib-tsuda2002|<tuple|tsuda2002|11>>
    <associate|bib-uhlenbeck1930|<tuple|uhlenbeck1930|11>>
    <associate|bib-vishwanathan2003|<tuple|vishwanathan2003|11>>
    <associate|bib-vivarelli1999|<tuple|vivarelli1999|12>>
    <associate|bib-wahba1990|<tuple|wahba1990|12>>
    <associate|bib-watkins1999|<tuple|watkins1999|12>>
    <associate|bib-watkins2000|<tuple|watkins2000|12>>
    <associate|bib-wendland2005|<tuple|wendland2005|12>>
    <associate|bib-widom1963|<tuple|widom1963|12>>
    <associate|bib-widom1964|<tuple|widom1964|12>>
    <associate|bib-williams1998|<tuple|williams1998|12>>
    <associate|bib-yaglom1987|<tuple|yaglom1987|12>>
    <associate|bib-zhu1998|<tuple|zhu1998|12>>
    <associate|ch:covariance|<tuple|1|1>>
    <associate|eq:bochner|<tuple|6|4>>
    <associate|eq:dot_linear_cov|<tuple|15|7>>
    <associate|eq:hankel_transform|<tuple|8|5>>
    <associate|eq:integral_operator|<tuple|1|2>>
    <associate|eq:matern|<tuple|10|5>>
    <associate|eq:ms_derivative|<tuple|4|3>>
    <associate|eq:nn_covariance|<tuple|18|7>>
    <associate|eq:psd_kernel|<tuple|2|3>>
    <associate|eq:se_covariance|<tuple|9|5>>
    <associate|eq:se_eigenfunctions|<tuple|23|8>>
    <associate|eq:se_eigenvalues|<tuple|22|8>>
    <associate|eq:string_kernel|<tuple|24|8>>
    <associate|eq:upcrossings|<tuple|3|3>>
    <associate|eq:wiener_khintchine|<tuple|7|5>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnote-2|<tuple|2|2>>
    <associate|footnr-1|<tuple|1|2>>
    <associate|footnr-2|<tuple|2|2>>
    <associate|sec:dotproduct|<tuple|2.2|7>>
    <associate|sec:eigenfunction|<tuple|3|7>>
    <associate|sec:examples|<tuple|2|4>>
    <associate|sec:exercises|<tuple|5|9>>
    <associate|sec:fisher_kernels|<tuple|4.2|9>>
    <associate|sec:ms_continuity|<tuple|1.1|3>>
    <associate|sec:nonstationary|<tuple|2.3|7>>
    <associate|sec:nonvectorial|<tuple|4|8>>
    <associate|sec:preliminaries|<tuple|1|2>>
    <associate|sec:stationary|<tuple|2.1|4>>
    <associate|sec:string_kernels|<tuple|4.1|8>>
    <associate|tab:covariance_summary|<tuple|1|6>>
    <associate|thm:bochner|<tuple|1|4>>
    <associate|thm:mercer|<tuple|2|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      papoulis1991

      adler1981

      blake1973

      adler1981

      adler1981

      abrahamsen1997

      chatfield1989

      adler1981

      abramowitz1965

      wendland2005

      neal1996

      williams1998

      sampson1992

      zhu1998

      amari1985
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Summary of several
      commonly-used covariance functions.
      <with|mode|<quote|math>|r=<around|\||x-x<rprime|'>|\|>>. See Section
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|sec:examples>
      for details.>|<pageref|auto-6>>
    </associate>
    <\associate|toc>
      <vspace*|2fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-size|<quote|1.19>|1<space|2spc>Covariance
      Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|1fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Mean Square Continuity and
      Differentiability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Examples
      of Covariance Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Stationary Covariance
      Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Dot Product Covariance
      Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Other Non-stationary
      Covariance Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenfunction
      Analysis of Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Kernels
      for Non-vectorial Inputs> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>String Kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Fisher Kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|A.6<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>