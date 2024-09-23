<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|<with|font-size|1.41|font-series|bold|Orthonormal
  Expansions for Translation-Invariant Kernels>>|<doc-author|<author-data|<author-name|Filip
  TronarpToni Karvonen>|<author-affiliation|Centre for Mathematical Sciences,
  Lund University, Sweden>|<emdash>|<author-affiliation|Department of
  Mathematics and Statistics, University of Helsinki, Finland \ <date|>>>>>

  <abstract-data|<\abstract>
    <no-indent>We present a general Fourier analytic technique for
    constructing orthonormal basis expansions of translation-invariant
    kernels from orthonormal bases of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>.
    This allows us to derive explicit expansions on the real line for (i)
    Matérn kernels of all half-integer orders in terms of associated Laguerre
    functions, (ii) the Cauchy kernel in terms of rational functions, and
    (iii) the Gaussian kernel in terms of Hermite
    functions.<next-line><next-line><with|font-series|bold|Keywords:>
    positive-definite kernels, radial basis functions, orthonormal
    expansions, orthogonal polynomials<next-line><next-line><with|font-series|bold|MSC2020:>
    65D12, 46E22, 33C45, 60G10
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Construction of orthonormal bases
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>On Mercer expansions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Summary
    of expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Matérn kernels
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Cauchy kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.3<space|2spc>Gaussian kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Expansions
    of Matérn kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Laguerre functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.2<space|2spc>Matérn\ULaguerre functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.3<space|2spc>Classification of Matérn\ULaguerre
    functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|3.4<space|2spc>Truncation error
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|3.5<space|2spc>The null-space
    <with|mode|math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Expansions
    of the Cauchy kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Expansion in complex-valued
    Cauchy\ULaguerre functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|4.2<space|2spc>Expansion in real-valued
    Cauchy--Laguerre functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Expansion
    of the Gaussian kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Expansion for the Gaussian kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|5.2<space|2spc>Mercer basis and Mehler's formula
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|5.3<space|2spc>Truncation error
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:introduction>

  Let <math|\<Omega\>> be a vector space. A symmetric positive-semidefinite
  kernel <math|r:\<Omega\>\<times\>\<Omega\>\<to\>\<bbb-R\>> is
  <em|translation-invariant> if <math|r<around|(|t,u|)>=\<Phi\>*<around|(|t-u|)>>
  for some <math|\<Phi\>:\<Omega\>\<to\>\<bbb-R\>> and all
  <math|t,u\<in\>\<Omega\>>. Translation-invariant kernels, also known as
  <em|stationary> or <em|shift-invariant> kernels, are a mainstay of radial
  basis function interpolation<nbsp><cite|Wendland2005> and Gaussian process
  modelling as used in, for example, spatial statistics<nbsp><cite|Stein1999>
  and machine learning<nbsp><cite|RasmussenWilliams2006>. Each
  positive-semidefinite kernel induces a unique reproducing kernel Hilbert
  space (RKHS), <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>>,
  which is equipped with an inner product
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|r>> and the
  associated norm <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>><rsub|r>>
  <cite|Paulsen2016>. Practically every commonly used kernel induces an
  infinite-dimensional RKHS that is separable
  (see<nbsp><cite|OwhadiScovel2017> for a short review on separability of
  RKHSs), which means that <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>>
  has an orthonormal basis <math|<around|{|\<psi\><rsub|m>|}><rsub|m\<in\>I>>
  for some countably infinite index set <math|I> (e.g., <math|I=\<bbb-N\>>)
  and that the kernel admits the pointwise convergent orthonormal expansion

  <\equation>
    <label|eq:kernel-expansion-intro>r<around|(|t,u|)>=<big|sum><rsub|m\<in\>I>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>*<space|1em><text|for
    all ><space|1em>t,u\<in\>\<Omega\>,
  </equation>

  where <math|z<rsup|\<ast\>>> denotes the complex conjugate
  of<math|z\<in\>C> If <math|\<Omega\>> is a compact subset of
  <math|\<bbb-R\><rsup|d>> and <math|r> is continuous, the
  expansion<nbsp><eqref|eq:kernel-expansion-intro> converges
  uniforml<cite|Paulsen2016>. Expansions of the
  form<nbsp><eqref|eq:kernel-expansion-intro> are often needed to develop
  reduced rank methods of sub-cubic computational
  complexity<nbsp><cite|RahimiRecht2007|SolinSarkka2020>, to improve
  numerical stability<nbsp><cite|FasshauerMcCourt2012>, and for various
  theoretical purposes<nbsp><cite-detail|[|e.g.,>]Karvonen2022,
  Steinwart2019.

  However, few orthonormal expansions appear to have been constructed for
  translation-invariant kernels. To the best of our knowledge, the
  Matérn-<math|<frac|1|2>> kernel <math|r<around|(|t,u|)>=exp
  <around|(|-\<lambda\><around*|\||t-u|\|>|)>> and the Gaussian kernel
  <math|r<around|(|t,u|)>=exp <around|(|-<frac|1|2>*\<lambda\><rsup|2>*<around|(|t-u|)><rsup|2>|)>>
  on subsets of <math|\<bbb-R\>> are the only commonly used
  translation-invariant kernels for which orthonormal expansions have been
  found. For various expansions of the Matérn-<math|<frac|1|2>> kernel, see
  Section<nbsp>4 in <cite|Hawkins1989>, Section<nbsp>3.4.1 in
  <cite|VanTrees2001>, Example<nbsp>4.1 in <cite|Xiu2010>, and
  Example<nbsp>2.5 and Appendix<nbsp>A.2 in <cite|FasshauerMcCourt2015>. For
  the Gaussian kernel both a simple non-Mercer expansion based on a Taylor
  expansion of the exponential function<nbsp><cite-detail|[|e.g.,>]Minh2010
  and a class of Mercer expansions<nbsp><cite-detail|FasshauerMcCourt2015|Section<nbsp>12.2.1>,
  which appear to have originated in<nbsp><cite-detail|Zhu1998|Section<nbsp>4>,
  are available. A large collection of expansions for kernels which are not
  translation-invariant can be found in<nbsp><cite-detail|FasshauerMcCourt2015|Appendix<nbsp>A>.
  In this article we describe a general and conceptually simple Fourier
  analytic technique, contained in Theorem<nbsp><reference|thm:main-theorem>,
  for constructing orthonormal bases for translation-invariant kernels on
  <math|\<bbb-R\>> out of orthonormal bases of
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>. We then use
  this technique to compute orthonormal expansions for three commonly used
  classes of kernels.

  Ours is what one could call a <em|kernel-centric> approach. That is, our
  starting point is a kernel that has, in some sense, desirable or intuitive
  properties and our goal is to find its orthonormal expansion. The
  <em|space-centric> approach is to start with a Hilbert space or its
  orthonormal basis, show that this space is an RKHS, and construct its
  reproducing kernel via<nbsp><eqref|eq:kernel-expansion-intro>; under
  fortuitous circumstances the kernel is available in closed form. A prime
  example of this approach is how Korobov spaces and their kernels, which can
  be expressed in terms of Bernoulli polynomials, are used in the quasi-Monte
  Carlo literature<nbsp><cite-detail|[|e.g.,>Section<nbsp>5.8]DickKuoSloan2013.
  Other examples include Hardy spaces<nbsp><cite-detail|Paulsen2016|Section<nbsp>1.4.2>,
  power series kernels<nbsp><cite|Zwickngaslc2009>, and Hermite
  spaces<nbsp><cite|IrrgeherLeobacher2015>. Our technique to construct
  orthonormal bases is similar to the method in<nbsp><cite|NovakUllrich2018>,
  where the goal is however to find a closed form expression for the
  reproducing kernel of a Hilbert space.

  <subsection|Construction of orthonormal bases>

  Let <math|<around*|\||z|\|>> denote the modulus of <math|z\<in\>\<bbb-C\>>
  and recall that <math|z<rsup|\<ast\>>> is the complex conjugate. The spaces
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> and
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>
  consist of all square-integrable functions
  <math|f:\<bbb-R\>\<to\>\<bbb-C\>> and are equipped with the inner products

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t*<space|1em><text|and
    ><space|1em><around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t
  </equation>

  The Fourier transform and the corresponding inverse transform for any
  integrable or square-integrable function <math|f> are defined as

  <\equation>
    <wide|f|^><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*e<rsup|-i*\<omega\>*t>\<mathd\>t*<space|1em><text|and
    ><space|1em>f<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>
  </equation>

  The Fourier transform defines an isometry from
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> to
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>> via
  the Plancherel theorem

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>\<mathd\>\<omega\>.
  </equation*>

  The functions <math|f> and <math|<wide|f|^>> are referred to as time domain
  and Fourier domain representations, respectively. Our
  <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>>-orthonormal
  expansions are derived from the following rather straight-forward theorem.
  Let <math|I> be a countably infinite index set, typically either <math|<N>>
  or <math|<Z>>.

  <\theorem>
    [Construction of orthonormal bases]<label|thm:main-theorem> Suppose that
    <math|r<around|(|t,u|)>=\<Phi\>*<around|(|t-u|)>> is a
    translation-invariant symmetric positive-definite kernel with
    <math|\<Phi\>\<in\>C<around|(|<R>|)>\<cap\><with|math-font|cal*|L><rsub|1><around|(|\<bbb-R\>|)>>.
    Let <math|<around|{|\<varphi\><rsub|m>|}><rsub|m\<in\>I>> be an
    orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>>
    and <math|h> a function such that <math|<around*|\||<wide|h|^><around|(|\<omega\>|)>|\|>=<wide|\<Phi\>|^><around|(|\<omega\>|)><rsup|1/2>>.
    Then the functions

    <\equation*>
      \<psi\><rsub|m><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*\<varphi\><rsub|m><around|(|\<tau\>|)>\<mathd\>\<tau\>*<space|1em><text|with
      Fourier transforms ><space|1em><wide|\<psi\>|^><rsub|m><around|(|\<omega\>|)>=<wide|h|^><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>
    </equation*>

    for <math|m\<in\>I> form an orthonormal basis of
    <math|<with|math-font|cal*|H><rsub|r><around|(|<R>|)>> and the kernel
    <math|r> has the pointwise convergent expansion

    <\equation>
      <label|eq:main-theorem-r-expansion>r<around|(|t,u|)>=<big|sum><rsub|m\<in\>I>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>*<space|1em><text|for
      all ><space|1em>t,u\<in\><R>.
    </equation>
  </theorem>

  <\proof>
    That <math|r> is symmetric positive-definite implies that
    <math|<wide|\<Phi\>|^>> is real-valued and
    positive<nbsp><cite-detail|Wendland2005|Theorem<nbsp>6.11> For a function
    <math|h> such that <math|<around*|\||<wide|h|^><around|(|\<omega\>|)>|\|>=<wide|\<Phi\>|^><around|(|\<omega\>|)><rsup|1/2>\<gtr\>0>
    for all <math|\<omega\>\<in\>\<bbb-R\>> we define a convolution operator
    <math|\<cal-H\>:<with|math-font|cal*|L><rsub|2><around|(|<R>|)>\<to\><with|math-font|cal*|L><rsub|2><around|(|<R>|)>>
    via

    <\equation>
      <around|(|\<cal-H\>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*f<around|(|\<tau\>|)>\<mathd\>\<tau\>*<space|1em><text|\<forall\>>t\<in\>\<bbb-R\>
    </equation>

    Note that the convolution theorem yields\ 

    <\equation>
      <wide|\<cal-H\>*f|^><around|(|\<omega\>|)>=<wide|h|^><around|(|\<omega\>|)>*<wide|f|^><around|(|\<omega\>|)>
    </equation>

    . By the standard characterisation (see<nbsp><cite|KimeldorfWahba1970>
    or<nbsp><cite-detail|Wendland2005|Theorem<nbsp>10.12>) of the RKHS of a
    translation-invariant kernel,

    <\equation>
      <label|eq:RKHS-fourier><around|\<langle\>|f,g|\<rangle\>><rsub|r>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>|<wide|\<Phi\>|^><around|(|\<omega\>|)>>\<mathd\>\<omega\>*<space|1em>\<forall\>f,g\<in\><with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>
    </equation>

    For any <math|f,g\<in\><with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>
    the convolution theorem and Plancherel theorem thus give

    <\equation*>
      <around|\<langle\>|\<cal-H\>*f,\<cal-H\>*g|\<rangle\>><rsub|r>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<around*|\||<wide|h|^><around|(|\<omega\>|)>|\|><rsup|2><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>|<wide|\<Phi\>|^><around|(|\<omega\>|)>>\<mathd\>\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>\<mathd\>\<omega\>=<around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>,
    </equation*>

    which shows that <math|\<cal-H\>> is an isometry from
    <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> to
    <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>>. It follows
    from<nbsp><eqref|eq:RKHS-fourier> that the inverse Fourier transform

    <\equation>
      <around|(|\<cal-H\><rsup|-1>*f|)><around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<wide|f|^><around|(|\<omega\>|)>|<wide|h|^><around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>*<space|1em><text|for
      all ><space|1em>t\<in\>\<bbb-R\>
    </equation>

    defines the inverse of <math|\<cal-H\>>. Therefore <math|\<cal-H\>> is an
    isometric isomorphism and thus maps every orthonormal basis of
    <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> to an
    orthonormal basis of <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>><nbsp><cite-detail|Higgins1977|Section<nbsp>2.6>.
    The kernel has a pointwise convergent expansion of the
    form<nbsp><eqref|eq:main-theorem-r-expansion> for every orthonormal basis
    of <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>><nbsp><cite|Paulsen2016>
  </proof>

  To obtain the basis functions <math|\<psi\><rsub|m>> in time domain using
  <localize|Theorem><nbsp><reference|thm:main-theorem> one has to either
  compute the convolution <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>\<varphi\><rsub|m><around*|(|\<tau\>|)>\<mathd\>\<tau\>>
  or the inverse Fourier transform of <math|<wide|h|^><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>>.
  It is therefore necessary to select a basis of
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> for which
  either of these operations can be done in closed form. We use
  <localize|Theorem><nbsp><reference|thm:main-theorem> to derive orthonormal
  expansions for (i) Matérn kernels for all half-integer orders, (ii) the
  Cauchy kernel (i.e., rational quadratic
  kernel<nbsp><cite-detail|RasmussenWilliams2006|Equation<nbsp>(4.19)> with
  <math|\<alpha\>=1>), and (iii) the Gaussian kernel. The expansions are
  summarised in <localize|Section><nbsp><reference|sec:summary>. All
  expansions appearing in this article converge pointwise.

  <subsection|On Mercer expansions>

  Let <math|\<Omega\>> be a subset of <math|\<bbb-R\><rsup|d>> and
  <math|w:\<Omega\>\<to\><around|[|0,\<infty\>|)>> a weight function. The
  Hilbert space <math|<with|math-font|cal*|L><rsub|2><around|(|\<Omega\>,w|)>>
  is equipped with the inner product

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<Omega\>,w|)>>=<big|int><rsub|\<Omega\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>*w<around|(|t|)>\<mathd\>t
  </equation>

  and consists of all functions <math|f:\<bbb-R\>\<to\>\<bbb-C\>> for which
  the corresponding norm is finite. Suppose that the kernel <math|r> is
  continuous and define the integral operator

  <\equation>
    <label|eq:mercer-integral-operator>\<cal-T\><rsub|r,w>*f=<big|int><rsub|-\<infty\>><rsup|\<infty\>>r<around|(|\<cdummy\>,u|)>*f<around|(|u|)>*w<around|(|u|)>\<mathd\>u
  </equation>

  Under certain assumptions, Mercer's theorem<nbsp><cite|SteinwartScovel2012>
  states that (i) <math|\<cal-T\><rsub|r,w>> has continuous eigenfunctions
  <math|<around|{|\<vartheta\><rsub|m>|}><rsub|m=0><rsup|\<infty\>>> and
  corresponding positive non-increasing eigenvalues
  <math|<around|{|\<mu\><rsub|m>|}><rsub|m=0><rsup|\<infty\>>> which tend to
  zero, (ii) <math|<around|{|\<vartheta\><rsub|m>|}><rsub|m=0><rsup|\<infty\>>>
  are an orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|\<Omega\>,w|)>>,
  and (iii) <math|<around|{|<sqrt|<smash|[>b]\<mu\><rsub|m>>\<vartheta\><rsub|m>|}><rsub|m=0><rsup|\<infty\>>>
  is an orthonormal basis of <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>>.
  Consequently, the kernel has the pointwise convergent <em|Mercer expansion>

  <\equation>
    <label|eq:kernel-expansion-mercer>r<around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<mu\><rsub|m>\<vartheta\><rsub|m><rsup|\<ast\>><around|(|t|)>\<vartheta\><rsub|m><around|(|u|)>*<space|1em><text|\<forall\>>t,u\<in\>\<Omega\>
  </equation>

  While Mercer's theorem and the eigenvalues of <math|\<cal-T\><rsub|r,w>>
  constitute a powerful tool for understanding topics such as optimal
  approximation in <math|<with|math-font|cal*|L><rsub|2><around|(|\<Omega\>,w|)>>-norm
  (e.g.,<nbsp><cite-detail|NovakWozniakowski2008|Corollary<nbsp>4.12>
  and<nbsp><cite-detail|FasshauerHickernell2012|Section<nbsp>2.4>) and
  improved approximation orders in subsets of
  <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>><nbsp><cite-detail|Wendland2005|Section<nbsp>11.5>,
  both in theoretical research and practical applications there is often no
  reason to prefer a Mercer expansion<nbsp><eqref|eq:kernel-expansion-mercer>
  over a generic RKHS-orthonormal expansion<nbsp><eqref|eq:kernel-expansion-intro>.
  For example, the Karhunen\ULoève theorem is merely a special case of a more
  general result that a Gaussian process with covariance kernel<nbsp><math|r>
  can be expanded in terms of any orthonormal basis of
  <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>><nbsp><cite-detail|Adler1990|Chapter<nbsp>III>.\ 

  Constructing a Mercer expansion by first identifying a convenient weight
  and then finding the eigendecomposition of the integral
  operator<nbsp><eqref|eq:mercer-integral-operator> can be rather involved,
  which is illustrated by the construction
  in<nbsp><cite-detail|FasshauerMcCourt2015|Example<nbsp>2.5> for the
  Matérn-<math|<frac|1|2>> kernel. <strong|What makes
  <localize|Theorem><nbsp><reference|thm:main-theorem> convenient is
  therefore that it does <em|not> require that the expansion be Mercer for
  some weight.> However, identifying a weight <math|w> for which the basis
  function <math|\<psi\><rsub|m>> constructed via
  <localize|Theorem><nbsp><reference|thm:main-theorem> are
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w|)>>-orthogonal
  shows that the expansion is Mercer because the
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w|)>>-normalised
  versions of <math|\<psi\><rsub|m>> are the eigenfunctions of
  <math|\<cal-T\><rsub|r,w>>. It turns out that our expansion for the
  Gaussian kernel is Mercer and the ones for Matérn kernels are \Palmost\Q
  Mercer, in that all but finitely many basis functions are orthogonal in
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w|)>> for a
  certain weight.

  <section|Summary of expansions><label|sec:summary>

  This section summarises the expansions that we derive using
  <localize|Theorem><nbsp><reference|thm:main-theorem>. Each expansion
  converges pointwise for all <math|t,u\<in\>\<bbb-R\>>. All expansions are
  for kernels with unit scaling. Expansions of arbitrary scalings,
  <math|\<lambda\>>, may be obtained by considering the kernel
  <math|r<around|(|\<lambda\>*t,\<lambda\>*u|)>>, for which the corresponding
  basis functions are <math|\<psi\><rsub|m>*<around|(|\<lambda\>*t|)>>.

  <subsection|Matérn kernels>

  Expansions for Matérn kernels are derived in
  <localize|Section><nbsp><reference|sec:matern>. A Matérn kernel of order
  <math|\<alpha\>\<gtr\>0> is

  <\equation>
    <label|eq:matern-kernel-intro>r<rsub|\<alpha\>><around|(|t,u|)>=<frac|2<rsup|1-\<alpha\>>|\<Gamma\><around|(|\<alpha\>|)>><around|(|<around*|\||t-u|\|>|)><rsup|\<alpha\>><math-up|K><rsub|\<alpha\>><around|(|<around*|\||t-u|\|>|)>
  </equation>

  where <math|\<Gamma\>> is the Gamma function and
  <math|<math-up|K><rsub|\<alpha\>>> the modified Bessel function of the
  second kind of order<nbsp><math|\<alpha\>>. Let
  <math|<math-up|L><rsub|m><rsup|<around|(|\<eta\>|)>>> denote the <math|m>th
  associated Laguerre polynomial of index <math|\<eta\>>, defined
  in<nbsp><eqref|eq:associated-laguerre>, and let
  <math|<around|{|\<varphi\><rsub|m>|}><rsub|m\<in\>\<bbb-Z\>>> be the
  Laguerre functions

  <\equation>
    \<varphi\><rsub|m><around|(|t|)>=<sqrt|2><space|0.17em><math-up|L><rsub|m><around|(|2*t|)>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>
  </equation>

  and

  <\equation>
    \<varphi\><rsub|-m-1><around|(|t|)>=-<sqrt|2><space|0.17em><math-up|L><rsub|m><around|(|-2*t|)>*e<rsup|t>*<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,0|)>><around|(|t|)>
  </equation>

  for <math|m\<in\>\<bbb-N\><rsub|0>>, where
  <math|<math-up|L><rsub|m>=<math-up|L><rsub|m><rsup|<around|(|0|)>>> and
  <math|<with|math-font-family|bf|1><rsub|A>> denotes the indicator function
  of a set <math|A>. Consider half-integer order <math|\<alpha\>=\<nu\>+1/2>
  for <math|\<nu\>\<in\>\<bbb-N\><rsub|0>>. Then the Matérn-Laguerre
  functions

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<psi\><rsup|+><rsub|m,\<nu\>><around|(|t|)>>|<cell|=<frac|\<nu\>!|<around|(|2*\<nu\>|)>!>*<frac|m!|<around|(|m+\<nu\>+1|)>!>*<around|(|2*t|)><rsup|\<nu\>+1><math-up|L><rsub|m><rsup|<around|(|\<nu\>+1|)>><around|(|2*t|)>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>>|<cell|<text|\<forall\>>m\<in\>\<bbb-N\><rsub|0>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|\<psi\><rsup|-><rsub|m,\<nu\>><around|(|t|)>>|<cell|=<around|(|-1|)><rsup|\<nu\>>*\<psi\><rsup|+><rsub|m,\<nu\>>*<around|(|-t|)>>|<cell|\<forall\>m\<in\>\<bbb-N\><rsub|0>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|\<psi\><rsup|0><rsub|m,\<nu\>><around|(|t|)>>|<cell|=<frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*\<varphi\><rsub|m+k-\<nu\>-1><around|(|t|)>>|<cell|\<forall\>m=0,\<ldots\>,\<nu\>>>>>>
  </equation>

  form an orthonormal basis of the RKHS and

  <\equation>
    r<rsub|\<nu\>+<frac|1|2>,><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsup|0><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsup|0><rsub|m,\<nu\>><around|(|u|)>+<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsup|-><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsup|-><rsub|m,\<nu\>><around|(|u|)>+<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsup|+><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsup|+><rsub|m,\<nu\>><around|(|u|)>
  </equation>

  \<forall\><math|t,u\<in\>\<bbb-R\>>. The basis functions
  <math|<smash|[>b]\<psi\><rsub|m,\<nu\>><rsup|->> and
  <math|<smash|[>b]\<psi\><rsub|m,\<nu\>><rsup|+>> are orthogonal in
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>>
  for the weight function <math|<smash|[>b]w<rsub|\<nu\>><around|(|t|)>=<frac|2|<around*|\||2*t|\|><rsup|\<nu\>+1>>>.

  <subsection|Cauchy kernel>

  Expansions for the Cauchy kernel are derived in
  <localize|Section><nbsp><reference|sec:cauchy>. The Cauchy kernel is

  <\equation>
    r<around|(|t,u|)>=<frac|1|1+<around|(|t-u|)><rsup|2>>
  </equation>

  Both the complex-valued Cauchy\ULaguerre functions

  <\equation>
    \<psi\><rsub|m><around|(|t|)>=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m>|<around|(|i*t-1|)><rsup|m+1>>*<space|1em><text|and
    ><space|1em>\<psi\><rsub|-m-1><around|(|t|)>=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m>|<around|(|i*t+1|)><rsup|m+1>>
  </equation>

  for <math|m\<in\>\<bbb-N\><rsub|0>> and the real-valued Cauchy--Laguerre
  functions

  <\equation>
    \<alpha\><rsub|m><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|(|\<psi\><rsub|m><around|(|t|)>+\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>|)>*<space|1em><text|and><space|1em>\<beta\><rsub|m><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|(|\<psi\><rsub|m><around|(|t|)>-\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>|)>
  </equation>

  for <math|m\<in\>\<bbb-N\><rsub|0>> form orthonormal bases of the RKHS.
  Therefore, the Cauchy kernel has the expansions

  <\equation>
    r<around|(|t,u|)>=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<alpha\><rsub|m><around|(|t|)>*\<alpha\><rsub|m><around|(|u|)>+<big|sum><rsub|m=0><rsup|\<infty\>>\<beta\><rsub|m><around|(|t|)>*\<beta\><rsub|m><around|(|u|)>
  </equation>

  for all <math|t,u\<in\>\<bbb-R\>>. Expressions of <math|\<alpha\><rsub|m>>
  and <math|\<beta\><rsub|m>> in terms of real parameters are given in
  <eqref|eq:real_cauchy_laguerre_explicit>.

  <subsection|Gaussian kernel>

  Expansions for the Gaussian kernel are derived in
  <localize|Section><nbsp><reference|sec:gaussian>. The Gaussian kernel is

  <\equation>
    r<around|(|t,u|)>=e<rsup|-<frac|<around|(|t-u|)><rsup|2>|2>*>
  </equation>

  The functions

  <\equation>
    <label|eq:gaussian-basis-intro>\<psi\><rsub|m><around|(|t|)>=<sqrt|<frac|2*<sqrt|2>|6<rsup|m>*m!
    3>>*e<rsup|-<frac|t<rsup|2>|3>> <math-up|H><rsub|m><around*|(|<frac|2*t|<sqrt|3>>|)>*<space|1em>\<forall\>m\<in\>\<bbb-N\><rsub|0>
  </equation>

  form an orthonormal basis of the RKHS and the kernel has the expansion

  <\equation>
    r<around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>
  </equation>

  for all <math|t,u\<in\><R>>. This expansion is a special case of the
  well-known Mercer expansion of the Gaussian
  kernel<nbsp><cite-detail|FasshauerMcCourt2015|Section<nbsp>12.2.1>. The
  basis functions<nbsp><eqref|eq:gaussian-basis-intro> are orthogonal in
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>,w<rsub|\<alpha\>>|)>>
  for the weight function <math|w<rsub|\<alpha\>><around|(|t|)>=\<alpha\>*\<pi\><rsup|-1/2>*e<rsup|-\<alpha\><rsup|2>*t<rsup|2>>>
  with <math|\<alpha\>=<sqrt|<smash|[>b]2/3>>.

  <section|Expansions of Matérn kernels><label|sec:matern>

  The Matérn kernel of order <math|\<alpha\>\<gtr\>0>
  in<nbsp><eqref|eq:matern-kernel-intro> can be written as

  <\equation>
    r<rsub|\<alpha\>><around|(|t,u|)>=<frac|2<rsup|1-2*\<alpha\>>|\<Gamma\><around|(|\<alpha\>|)>><around|(|2<around*|\||t-u|\|>|)><rsup|\<alpha\>><math-up|K><rsub|\<alpha\>><around|(|<around*|\||t-u|\|>|)>
  </equation>

  and its Fourier transform is <cite-detail|Wendland2005|Theorem-6.13>

  <\equation>
    <wide|\<Phi\>|^><rsub|\<alpha\>><around|(|\<omega\>|)>=2<rsup|1-2*\<alpha\>>*<sqrt|\<pi\>>*<space|0.17em><frac|\<Gamma\>*<around|(|\<alpha\>+1/2|)>|\<Gamma\><around|(|\<alpha\>|)>>*<frac|2<rsup|2*\<alpha\>>|<around|(|\<omega\><rsup|2>+1|)><rsup|\<alpha\>+1/2>>
  </equation>

  From now on we assume that the kernel is of half-integer order:
  <math|\<alpha\>=\<nu\>+1/2> for <math|\<nu\>\<in\>\<bbb-N\><rsub|0>>. Then
  the Fourier transform simplifies to

  <\equation>
    <wide|\<Phi\>|^><rsub|\<nu\>+1/2><around|(|\<omega\>|)>=<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>*<frac|2<rsup|2*\<nu\>+1>|<around|(|\<omega\><rsup|2>+1|)><rsup|\<nu\>+1>>
  </equation>

  and a non-symmetric square-root, in the sense that <math|>

  <\equation>
    <around*|\||<wide|h|^><rsub|\<nu\>+1/2><around|(|\<omega\>|)>|\|><rsup|2>=<wide|\<Phi\>|^><rsub|\<nu\>+1/2><around|(|\<omega\>|)>
  </equation>

  is given by

  <\equation>
    <label|eq:h-hat-matern><wide|h|^><rsub|\<nu\>+1/2><around|(|\<omega\>|)>=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|2<rsup|\<nu\>+1/2>|<around|(|i*\<omega\>+1|)><rsup|\<nu\>+1>>
  </equation>

  The corresponding time domain function is<nbsp><cite-detail|Wiener1949|Section<nbsp>1.03>

  <\equation>
    <label|eq:h-matern>h<rsub|\<nu\>+1/2><around|(|t|)>=2<rsup|\<nu\>+1/2>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|t<rsup|\<nu\>>|\<nu\>!>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>.
  </equation>

  Note that this function vanishes on the negative real line.

  <subsection|Laguerre functions><label|sec:laguerre-functions>

  The following material is mostly based on Section<nbsp>2.6.4
  in<nbsp><cite|Higgins1977> and Section<nbsp>1.03 in<nbsp><cite|Wiener1949>.
  To derive an orthonormal expansion for the Matérn kernel we use the
  so-called <em|Laguerre functions> <math|\<varphi\><rsub|m>> whose Fourier
  transforms are given by

  <\equation>
    <label|eq:laguerre-func-ft><wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>=<sqrt|2>*<frac|<around|(|i*\<omega\>-1|)><rsup|m>|<around|(|i*\<omega\>+1|)><rsup|m+1>>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-Z\>.
  </equation>

  The functions <math|<wide|\<varphi\>|^><rsub|m>> form an orthonormal basis
  of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>.
  Because the Fourier transform is an isometry, the Laguerre functions
  themselves, defined by the inverse Fourier transform

  <\equation>
    <label|eq:laguerre-inverse-ft>\<varphi\><rsub|m><around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-Z\>,
  </equation>

  are an orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>.
  Let <math|<math-up|L><rsub|m>> for <math|m\<in\>\<bbb-N\><rsub|0>> be the
  <math|m>th Laguerre polynomial

  <\equation>
    <label|eq:laguerre-polynomial><math-up|L><rsub|m><around|(|t|)>=<big|sum><rsub|k=0><rsup|m><binom|m|k><frac|<around|(|-1|)><rsup|k>|k!>*t<rsup|k>.
  </equation>

  For non-negative indices <math|m\<in\><N><rsub|0>> the inverse Fourier
  transform<nbsp><eqref|eq:laguerre-inverse-ft> is given by

  <\equation>
    <label|eq:phi-m-matern-non-negative>\<varphi\><rsub|m><around|(|t|)>=<sqrt|2><space|0.17em><math-up|L><rsub|m><around|(|2*t|)>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>.
  </equation>

  The conjugate symmetry <math|<wide|\<varphi\>|^><rsub|-m-1><rsup|\<ast\>><around|(|\<omega\>|)>=-<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>>
  gives the following expression for negative indices:

  <\equation*>
    \<varphi\><rsub|-m-1><around|(|t|)>=-\<varphi\><rsub|m>*<around|(|-t|)>=-<sqrt|2><space|0.17em><math-up|L><rsub|m><around|(|-2*t|)>*e<rsup|t>*<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,0|)>><around|(|t|)>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-N\><rsub|0>.
  </equation*>

  The Laguerre functions and their Fourier transforms satisfy the following
  useful identities:

  <\align*>
    <tformat|<table|<row|<cell|<wide|\<varphi\>|^><rsub|-m-1><rsup|\<ast\>><around|(|\<omega\>|)>>|<cell|=-<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>,>>|<row|<cell|<wide|\<varphi\>|^><rsub|m+k><around|(|\<omega\>|)>>|<cell|=<around*|(|<frac|i*\<omega\>-1|i*\<omega\>+1>|)><rsup|k>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>,>>|<row|<cell|<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|k><around|(|\<omega\>|)>>|<cell|=<frac|1|<sqrt|2>>*<around*|(|<wide|\<varphi\>|^><rsub|m+k><around|(|\<omega\>|)>-<wide|\<varphi\>|^><rsub|m+k+1><around|(|\<omega\>|)>|)>,>>|<row|<cell|<frac|2<rsup|\<nu\>+1/2>|<around|(|i*\<omega\>+1|)><rsup|\<nu\>+1>>>|<cell|=<big|sum><rsub|k=0><rsup|\<nu\>><choose|\<nu\>|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|k><around|(|\<omega\>|)>.>>|<row|<cell|>|<cell|>>>>
  </align*>

  <subsection|Matérn\ULaguerre functions><label|sec:matern-laguerre>

  In view of <localize|Theorem><nbsp><reference|thm:main-theorem>, an
  orthonormal basis for the RKHS of the Matérn kernel
  <math|r<rsub|\<nu\>,+1/2>> is obtained from<nbsp><eqref|eq:h-hat-matern>
  and<nbsp><eqref|eq:laguerre-func-ft> in Fourier domain as

  <\equation>
    <label|eq:matern_laguerre_functions><wide|\<psi\>|^><rsub|m,\<nu\>><around|(|\<omega\>|)>=<wide|h|^><rsub|\<nu\>+1/2><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>=2<rsup|\<nu\>+1>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|<around|(|i*\<omega\>-1|)><rsup|m>|<around|(|i*\<omega\>+1|)><rsup|m+1+\<nu\>+1>>
  </equation>

  for <math|m\<in\>\<bbb-Z\>>. We call the resulting functions the
  <em|Matérn\ULaguerre functions>. Like the Laguerre functions, the
  Matérn\ULaguerre functions satisfy a certain conjugate symmetry property in
  the sense that

  <\equation>
    <label|eq:matern_laguerre_conjugate_symmetry><wide|\<psi\>|^><rsub|-\<nu\>-1-m-1,\<nu\>><around|(|\<omega\>|)>=<around|(|-1|)><rsup|\<nu\>>*<wide|\<psi\>|^><rsup|\<ast\>><rsub|m,\<nu\>><around|(|\<omega\>|)>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-N\><rsub|0>.
  </equation>

  Furthermore, by the binomial identity and the shift property of Laguerre
  functions, the Matérn\ULaguerre functions and their Fourier transforms are

  <\equation>
    <label|eq:matern-laguerre-functions>\<psi\><rsub|m,\<nu\>><around|(|t|)>=<frac|1|<sqrt|2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*\<varphi\><rsub|m+k><around|(|t|)>
  </equation>

  and

  <\equation>
    <label|eq:matern_laguerre_binomial_expression><wide|\<psi\>|^><rsub|m,\<nu\>><around|(|\<omega\>|)>=<frac|1|<sqrt|2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|m+k><around|(|\<omega\>|)>
  </equation>

  for <math|m\<in\>\<bbb-Z\>>. The Matérn kernel of order <math|\<nu\>+1/2>
  can therefore be expanded as

  <\equation>
    <label|eq:matern-expansion>r<rsub|\<nu\>+1/2><around|(|t,u|)>=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsub|m,\<nu\>><around|(|u|)>
  </equation>

  The following proposition provides a uniform upper bound on the
  Matérn\ULaguerre functions.

  <\proposition>
    [Matérn\ULaguerre upper bound]<label|prop:matern_laguerre_bound>For all
    <math|t\<in\>\<bbb-R\>> and <math|m\<in\>\<bbb-Z\>>, the Matérn\ULaguerre
    functions satisfy

    <\equation>
      <around*|\||\<psi\><rsub|m,\<nu\>><around|(|t|)>|\|>\<leq\><frac|2<rsup|\<nu\>>*\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>\<sim\><around|(|\<pi\>*\<nu\>|)><rsup|1/4>*<space|1em><text|as
      ><space|1em>\<nu\>\<to\>\<infty\>
    </equation>
  </proposition>

  <\proof>
    By<nbsp><eqref|eq:matern_laguerre_binomial_expression> and the binomial
    identity for Laguerre functions,

    <\equation>
      \<psi\><rsub|m,\<nu\>><around|(|t|)>=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>><choose|\<nu\>|k><around|(|-1|)><rsup|k><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|k><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>
    </equation>

    Apply the triangle inequality, the Cauchy\USchwartz inequality, and the
    orthonormality in <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>
    of <math|<wide|\<varphi\>|^><rsub|m>> to arrive at

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|m,\<nu\>><around|(|t|)>>|<cell|\<leq\><frac|\<nu\>!|<sqrt|<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>><choose|\<nu\>|k><frac|1|2*\<pi\>><around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|k><around|(|\<omega\>|)>\<mathd\>\<omega\>|\|>>>|<row|<cell|>|<cell|\<leq\><frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>><choose|\<nu\>|k><frac|<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>|\|><rsup|2>\<mathd\>\<omega\>><sqrt|<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<wide|\<varphi\>|^><rsub|k><around|(|\<omega\>|)>|\|><rsup|2>\<mathd\>\<omega\>|)>>|2*\<pi\>>>>|<row|<cell|>|<cell|=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>><choose|\<nu\>|k>>>|<row|<cell|>|<cell|=<frac|2<rsup|\<nu\>>*\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>>>>>>
    </equation>

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>>>>
      </eqsplit>
    </equation>

    The asymptotic equivalence as <math|\<nu\>\<to\>\<infty\>> follows from
    Stirling's formula.
  </proof>

  It appears difficult to improve upon the bound in
  <localize|Proposition><nbsp><reference|prop:matern_laguerre_bound>.
  Consequently, uniform convergence of Matérn\ULaguerre expansions on
  <math|\<bbb-R\>> is likely unattainable.

  <subsection|Classification of Matérn\ULaguerre
  functions><label|sec:matern-classification>

  For <math|m\<in\>\<bbb-N\><rsub|0>>, a more compact and convenient
  expression of the Matérn\ULaguerre functions<nbsp><eqref|eq:matern-laguerre-functions>
  may be obtained by using the convolution formula in
  <localize|Theorem><nbsp><reference|thm:main-theorem>. For
  <math|\<eta\>\<in\>\<bbb-N\><rsub|0>>, the associated Laguerre polynomial
  <math|<math-up|L><rsub|m><rsup|<around|(|\<eta\>|)>>> is defined as

  <\equation>
    <label|eq:associated-laguerre><math-up|L><rsub|m><rsup|<around|(|\<eta\>|)>><around|(|t|)>=<big|sum><rsub|k=0><rsup|m><binom|m+\<eta\>|m-k><frac|<around|(|-1|)><rsup|k>|k!>*t<rsup|k>.
  </equation>

  The associated Laguerre polynomial <math|<math-up|L><rsub|m><rsup|<around|(|0|)>>>
  equals the Laguerre polynomial <math|<math-up|L><rsub|m>>
  in<nbsp><eqref|eq:laguerre-polynomial>. For <math|t\<gtr\>0> and
  <math|m\<in\>\<bbb-N\><rsub|0>>, we get from<nbsp><eqref|eq:h-matern>
  and<nbsp><eqref|eq:phi-m-matern-non-negative> that

  <\equation*>
    <\eqsplit>
      <tformat|<table|<row|<cell|\<psi\><rsub|m,\<nu\>><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|\<nu\>+1/2>*<around|(|t-\<tau\>|)>*\<varphi\><rsub|m><around|(|\<tau\>|)>\<mathd\>\<tau\>>>|<row|<cell|>|<cell|=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*2<rsup|\<nu\>+1/2>*<big|int><rsub|0><rsup|t>e<rsup|-<around|(|t-\<tau\>|)>>*<frac|<around|(|t-\<tau\>|)><rsup|\<nu\>>|\<nu\>!>*e<rsup|-\<tau\>>*<sqrt|2><math-up|L><rsub|m><around|(|2*\<tau\>|)>\<mathd\>\<tau\>>>|<row|<cell|>|<cell|=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*2*e<rsup|-t>*<big|int><rsub|0><rsup|t><frac|<around|(|2*t-2*\<tau\>|)><rsup|\<nu\>>|\<nu\>!><math-up|L><rsub|m><around|(|2*\<tau\>|)>\<mathd\>\<tau\>>>|<row|<cell|>|<cell|=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*e<rsup|-t>*<big|int><rsub|0><rsup|2*t><frac|<around|(|2*t-\<tau\>|)><rsup|\<nu\>>|\<nu\>!><math-up|L><rsub|m><around|(|\<tau\>|)>\<mathd\>\<tau\>>>|<row|<cell|>|<cell|=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|m!|<around|(|m+\<nu\>+1|)>!>*<around|(|2*t|)><rsup|\<nu\>+1><math-up|L><rsub|m><rsup|<around|(|\<nu\>+1|)>><around|(|2*t|)>*e<rsup|-t>,>>>>
    </eqsplit>
  </equation*>

  where the last equality follows from a convolution identity for Laguerre
  polynomials<nbsp><cite-detail|Bell2004|Chapter<nbsp>6, Problem<nbsp>(3)>.
  For <math|t\<less\>0>, the Laguerre functions
  <math|\<varphi\><rsub|m><around|(|t|)>> vanish and the convolution
  evaluates to zero and hence

  <\equation*>
    \<psi\><rsub|m,\<nu\>><around|(|t|)>=<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|m!|<around|(|m+\<nu\>+1|)>!>*<around|(|2*t|)><rsup|\<nu\>+1><math-up|L><rsub|m><rsup|<around|(|\<nu\>+1|)>><around|(|2*t|)>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-N\><rsub|0>.
  </equation*>

  For negative indices <math|m\<leq\>-\<nu\>-2> a similar expression is
  obtained from the conjugate symmetry<nbsp><eqref|eq:matern_laguerre_conjugate_symmetry>:

  <\equation>
    <label|eq:negative_matern_laguerre>

    <\eqsplit>
      <tformat|<table|<row|<cell|\<psi\><rsub|-\<nu\>-1-m-1,\<nu\>><around|(|t|)>>|<cell|=<around|(|-1|)><rsup|\<nu\>>*\<psi\><rsub|m,\<nu\>>*<around|(|-t|)>>>|<row|<cell|>|<cell|=-<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<frac|m!|<around|(|m+\<nu\>+1|)>!>*<around|(|2*t|)><rsup|\<nu\>+1><math-up|L><rsub|m><rsup|<around|(|\<nu\>+1|)>><around|(|2<around*|\||t|\|>|)>*e<rsup|-<around*|\||t|\|>>*<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,0|)>><around|(|t|)>>>>>
    </eqsplit>
  </equation>

  for <math|m\<in\>\<bbb-N\><rsub|0>>. This motivates the following notation
  for the three classes of Matérn\ULaguerre functions that comprise an
  orthonormal basis:

  <\align>
    <tformat|<table|<row|<cell|\<psi\><rsub|m,\<nu\>><rsup|+><around|(|t|)>>|<cell|=\<psi\><rsub|m,\<nu\>><around|(|t|)>>|<cell|>|<cell|<text|for
    ><space|1em>m\<in\>\<bbb-N\><rsub|0><eq-number><label|eq:psi-positive>>>|<row|<cell|\<psi\><rsub|m,\<nu\>><rsup|-><around|(|t|)>>|<cell|=<around|(|-1|)><rsup|\<nu\>>*\<psi\><rsub|m,\<nu\>>*<around|(|-t|)>>|<cell|>|<cell|<text|for
    ><space|1em>m\<in\>\<bbb-N\><rsub|0><eq-number><label|eq:psi-negative>>>|<row|<cell|\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>>|<cell|=\<psi\><rsub|-\<nu\>-1+m,\<nu\>><around|(|t|)>>|<cell|>|<cell|<text|for
    ><space|1em>m=0,1,\<ldots\>,\<nu\><eq-number><label|eq:psi-null>>>>>
  </align>

  For convenience, define the corresponding sets

  <\equation>
    <with|math-font|cal*|M><rsub|\<nu\>><rsup|+>=<around*|{|\<psi\><rsub|m,\<nu\>><rsup|+>|}><rsub|m\<in\>\<bbb-N\><rsub|0>>,<space|1em><with|math-font|cal*|M><rsub|\<nu\>><rsup|->=<around*|{|\<psi\><rsub|m,\<nu\>><rsup|->|}><rsub|m\<in\>\<bbb-N\><rsub|0>>,<space|1em><with|math-font|cal*|M><rsub|\<nu\>><rsup|0>=<around*|{|\<psi\><rsub|m,\<nu\>><rsup|0>|}><rsub|m=0><rsup|\<nu\>>
  </equation>

  the union <math|<with|math-font|cal*|M><rsub|\<nu\>>=<with|math-font|cal*|M><rsub|\<nu\>><rsup|->\<cup\><with|math-font|cal*|M><rsub|\<nu\>><rsup|+>>,
  and the kernels

  <\equation>
    <label|eq:rho-kernels>\<rho\><rsub|\<nu\>+1/2><rsup|-><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m,\<nu\>><rsup|-><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|-><around|(|u|)>*<space|1em><text|and><space|1em>\<rho\><rsub|\<nu\>+1/2><rsup|+><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m,\<nu\>><rsup|+><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|+><around|(|u|)>.
  </equation>

  We call the set <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>> the
  <em|null-space> and study it in more detail in
  <localize|Section><nbsp><reference|sec:null-space>. For now, note that the
  null-space functions are supported on <math|\<bbb-R\>> because
  from<nbsp><eqref|eq:matern-laguerre-functions> one can see that for
  <math|m=0,\<ldots\>,\<nu\>> the sum that defines
  <math|\<psi\><rsub|-\<nu\>-1+m,\<nu\>>> contains Laguerre functions with
  both negative and non-negative indices. Some of the basis functions are
  shown in <localize|Figures><nbsp><reference|fig:matern-null-space>
  and<nbsp><reference|fig:matern-non-null-space>.

  <big-figure|<with|par-mode|center|<image|Figures/fig_matern_non_null_basis.pdf|1par|||><label|fig:matern-non-null-space>>|The
  Matérn--Laguerre functions <math|\<psi\><rsub|m,\<nu\>><rsup|+>>
  in<nbsp><eqref|eq:psi-positive> for <math|m=0,\<ldots\>,6>. Observe that
  the functions vanish on the negative real line.>

  The Matérn expansion<nbsp><eqref|eq:matern-expansion> can now be written in
  terms of these functions and kernels as

  <\equation*>
    r<rsub|\<nu\>+1/2><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>+\<rho\><rsub|\<nu\>+1/2><rsup|-><around|(|t,u|)>+\<rho\><rsub|\<nu\>+1/2><rsup|+><around|(|t,u|)>.
  </equation*>

  It is clear that the functions in <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|->>
  are supported on the negative real line and the functions in
  <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>> on the positive real
  line. This observation yields the following simplifications:

  <\align>
    <tformat|<table|<row|<cell|r<rsub|\<nu\>+1/2><around|(|t,u|)>>|<cell|=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>+\<rho\><rsub|\<nu\>+1/2><rsup|+><around|(|t,u|)>>|<cell|>|<cell|<text|if
    ><space|1em>t\<geq\>0*<space|0.22em><text|or
    ><space|0.22em>u\<geq\>0,<eq-number><label|eq:matern-simplification-positive>>>|<row|<cell|r<rsub|\<nu\>+1/2><around|(|t,u|)>>|<cell|=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>+\<rho\><rsub|\<nu\>+1/2><rsup|-><around|(|t,u|)>>|<cell|>|<cell|<text|if
    ><space|1em>t\<leq\>0*<space|0.22em><text|or
    ><space|0.22em>u\<leq\>0,<eq-number>>>|<row|<cell|r<rsub|\<nu\>+1/2><around|(|t,u|)>>|<cell|=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>>|<cell|>|<cell|<text|if
    ><space|1em><math-up|sign>t\<neq\><math-up|sign>u.<eq-number><label|eq:matern-simplification-sign>>>>>
  </align>

  We next show that <math|<with|math-font|cal*|M><rsub|\<nu\>>>,
  <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|->>, and
  <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>> form orthogonal bases
  with respect to the weight function

  <\equation>
    w<rsub|\<nu\>><around|(|t|)>=<frac|2|<around*|\||2t|\|><rsup|\<nu\>+1>>
  </equation>

  This justifies saying that the expansions we have derived for Matérn
  kernels are \Palmost\Q Mercer.

  <\proposition>
    [Matérn\ULaguerre orthogonality]<label|prop:matern_laguerre_L2>The sets
    <math|<with|math-font|cal*|M><rsub|\<nu\>>>,
    <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>>, and
    <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|->> form orthogonal bases
    in <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>>,
    <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|+>,w<rsub|\<nu\>>|)>>,
    and <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|->,w<rsub|\<nu\>>|)>>,
    respectively. Furthermore,

    <\equation>
      <around*|\<\|\|\>|\<psi\><rsup|+><rsub|m,\<nu\>>|\<\|\|\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|2>=<around*|\<\|\|\>|\<psi\><rsup|-><rsub|m,\<nu\>>|\<\|\|\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|2>=<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>*<frac|m!|<around|(|m+\<nu\>+1|)>!>*<space|1em><text|for
      every ><space|1em>m\<in\>\<bbb-N\><rsub|0>
    </equation>
  </proposition>

  <\proof>
    That <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>> forms an
    orthogonal basis in <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|+>,w<rsub|\<nu\>>|)>>
    follows from the fact that the functions

    <\equation>
      t<rsup|<frac|v+1|2>><math-up|L><rsub|m><rsup|<around|(|\<nu\>+1|)>><around|(|t|)>*e<rsup|-<frac|t|2>><space|1em><text|\<forall\>>m\<in\>\<bbb-N\><rsub|0>
    </equation>

    form an orthonormal basis in <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|+>|)>>
    <cite|Szego1939>.Furthermore, the norms of the functions in
    <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>> are readily computed
    from the norms of the corresponding Laguerre polynomials:

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|<around*|\<\|\|\>|\<psi\><rsup|+><rsub|m,\<nu\>>|\<\|\|\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|2>>|<cell|=<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!><around*|(|<frac|m!|<around|(|m+\<nu\>+1|)>!>|)><rsup|2>*<big|int><rsub|0><rsup|\<infty\>><math-up|L><rsub|m><rsup|\<nu\>+1><around|(|t|)><rsup|2>*t<rsup|\<nu\>+1>*e<rsup|-t>\<mathd\>t>>|<row|<cell|>|<cell|=<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>*<frac|m!|<around|(|m+\<nu\>+1|)>!>>>>>
      </eqsplit>
    </equation>

    The statement pertaining to <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|->>
    follows from the symmetry <eqref|eq:negative_matern_laguerre> and the
    statement pertaining to <math|<with|math-font|cal*|M><rsub|\<nu\>>> from
    the fact that <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>=<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|->|)>\<oplus\><with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\><rsub|+>|)>>.
  </proof>

  Because they do not decay to zero sufficiently fast at the origin, the
  functions in <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>> are not
  members of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>>.
  This will become evident in Section<nbsp><reference|sec:null-space>

  <subsection|Truncation error>

  <big-figure|<with|par-mode|center|<image|Figures/fig_matern_rho_kernel.pdf|1par|||><label|fig:matern-rho-kernel>>|Translates
  <math|\<rho\><rsub|\<nu\>+1/2><around|(|\<cdummy\>,u|)>> of the kernel
  in<nbsp><eqref|eq:rho-kernel> for <math|u\<in\><around|{|-2,-1.2,-0.4,0.4,1.2,2|}>>.
  Observe that each translate is supported on the axis that <math|u> lies
  on.>

  Define the kernel

  <\equation>
    <label|eq:rho-kernel>\<rho\><rsub|\<nu\>+1/2><around|(|t,u|)>=\<rho\><rsub|\<nu\>+1/2><rsup|-><around|(|t,u|)>+\<rho\><rsub|\<nu\>+1/2><rsup|+><around|(|t,u|)>
  </equation>

  in terms of the kernels in<nbsp><eqref|eq:rho-kernels>. A few translates of
  this kernel are displayed in <localize|Figure><nbsp><reference|fig:matern-rho-kernel>.
  The full Matérn kernel is therefore

  <\equation>
    r<rsub|\<nu\>+1/2><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>+\<rho\><rsub|\<nu\>+1/2><around|(|t,u|)>
  </equation>

  From <localize|Proposition><nbsp><reference|prop:matern_laguerre_L2> we see
  that the kernel <math|\<rho\><rsub|\<nu\>+1/2>> is an element of
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>\<times\>\<bbb-R\>,w<rsub|\<nu\>>\<otimes\>w<rsub|\<nu\>>|)>>
  and that its squared norm is given by

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\><rsub|\<nu\>+1/2><rsup|2>>|<cell|<around|(|t,u|)>*w<rsub|\<nu\>><around|(|t|)>*w<rsub|\<nu\>><around|(|u|)>\<mathd\>t\<mathd\>u>>|<row|<cell|>|<cell|=<big|sum><rsub|m=0><rsup|\<infty\>><around*|(|<around*|\<\|\|\>|\<psi\><rsup|-><rsub|m,\<nu\>>|\<\|\|\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|4>+<around*|\<\|\|\>|\<psi\><rsup|+><rsub|m,\<nu\>>|\<\|\|\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|4><space|-0.17em>|)>>>>>
    </eqsplit>
  </equation>

  This implies that <math|\<rho\><rsub|\<nu\>+1/2>> defines a
  Hilbert\USchmidt operator on <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>>
  via<nbsp><eqref|eq:mercer-integral-operator> and that the above norm is
  precisely the squared Hilbert\USchmidt norm of this
  operator<nbsp><cite|Kuo1975>. Next the approximation errors for
  appropriately truncated approximations of the Matérn kernel are examined in
  terms of the Hilbert\USchmidt norm. Let <math|n\<geq\>1> and define the
  truncated kernels

  <\align>
    <tformat|<table|<row|<cell|\<rho\><rsub|\<nu\>+1/2,n><around|(|t,u|)>>|<cell|=<big|sum><rsub|m=0><rsup|n-1>\<psi\><rsub|m,\<nu\>><rsup|-><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|-><around|(|u|)>+<big|sum><rsub|m=0><rsup|n-1>\<psi\><rsub|m,\<nu\>><rsup|+><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|+><around|(|u|)><eq-number>>>|<row|<cell|r<rsub|\<nu\>+1/2,n><around|(|t,u|)>>|<cell|=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|u|)>+\<rho\><rsub|\<nu\>+1/2,n><around|(|t,u|)>.<eq-number><label|eq:matern-truncation>>>>>
  </align>

  Observe that <math|r<rsub|\<nu\>+1/2,n>> is a finite expansion of
  <math|\<nu\>+1+2*n> terms. Some truncations of Matérn kernels are displayed
  in <localize|Figure><nbsp><reference|fig:matern-truncations>.

  <big-figure|<with|par-mode|center|<image|Figures/fig_matern_truncations.pdf|1par|||><label|fig:matern-truncations>>|The
  truncation in<nbsp><eqref|eq:matern-truncation> for two Matérn kernels.
  Because the second kernel argument has been fixed to a positive value, the
  truncations are exact on the negative real line
  by<nbsp><eqref|eq:matern-simplification-sign>.>

  <\proposition>
    [Matérn truncation]<label|prop:matern-truncation-error>For every
    <math|n\<in\>\<bbb-N\>> it holds that

    <\equation>
      <sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|r<rsub|\<nu\>+1/2><around|(|t,u|)>-r<rsub|\<nu\>+1/2,n><around|(|t,u|)>|)><rsup|2>*w<rsub|\<nu\>><around|(|t|)>*w<rsub|\<nu\>><around|(|u|)>\<mathd\>t\<mathd\>u>\<leq\><frac|c<rsub|\<nu\>>|n<rsup|\<nu\>+<frac|1|2>>>
    </equation>

    where

    <\equation>
      c<rsub|\<nu\>>=<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>*<sqrt|<frac|2*<around|(|2*\<nu\>+2|)>|2*\<nu\>+1>>\<sim\><frac|1|2<rsup|2*\<nu\>>>*<sqrt|<frac|2*\<pi\>*<around|(|2*\<nu\>+2|)>*\<nu\>|2*\<nu\>+1>>*<space|1em><text|as
      ><space|1em>\<nu\>\<to\>\<infty\>
    </equation>
  </proposition>

  <\proof>
    Firstly, the truncation error is

    <\equation*>
      <\eqsplit>
        <tformat|<table|<row|<cell|r<rsub|\<nu\>+1/2><around|(|t,u|)>-r<rsub|\<nu\>+1/2,n><around|(|t,u|)>>|<cell|=\<rho\><rsub|\<nu\>+1/2><around|(|t,u|)>-\<rho\><rsub|\<nu\>+1/2,n><around|(|t,u|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=n><rsup|\<infty\>><around*|[|\<psi\><rsup|-><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsup|-><rsub|m,\<nu\>><around|(|u|)>+\<psi\><rsup|+><rsub|m,\<nu\>><around|(|t|)>*\<psi\><rsup|+><rsub|m,\<nu\>><around|(|u|)>|]>.>>>>
      </eqsplit>
    </equation*>

    Using <localize|Proposition><nbsp><reference|prop:matern_laguerre_L2>,
    the squared norm of the truncation error is straight-forwardly computed
    as

    <\equation*>
      <\eqsplit>
        <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>(r<rsub|\<nu\>+1/2>>|<cell|<around|(|t,u|)>-r<rsub|\<nu\>+1/2,n><around|(|t,u|)>)<rsup|2>w<rsub|\<nu\>><around|(|t|)>*w<rsub|\<nu\>><around|(|u|)>\<mathd\>t\<mathd\>u>>|<row|<cell|>|<cell|=<big|sum><rsub|m=n><rsup|\<infty\>><around*|(|<norm*|1|\<psi\><rsup|-><rsub|m,\<nu\>>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|4>+<norm*|1|\<psi\><rsup|+><rsub|m,\<nu\>>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<nu\>>|)>><rsup|4>|)>>>|<row|<cell|>|<cell|=2<around*|(|<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>|)><rsup|2>*<big|sum><rsub|m=n><rsup|\<infty\>><around*|(|<frac|m!|<around|(|m+\<nu\>+1|)>!>|)><rsup|2>>>|<row|<cell|>|<cell|\<leq\>2<around*|(|<frac|<around|(|\<nu\>!|)><rsup|2>|<around|(|2*\<nu\>|)>!>|)><rsup|2>*<big|sum><rsub|m=n><rsup|\<infty\>><frac|1|m<rsup|2*\<nu\>+2>>.>>>>
      </eqsplit>
    </equation*>

    The sum may be estimated with an integral as

    <\equation*>
      <\eqsplit>
        <tformat|<table|<row|<cell|<big|sum><rsub|m=n><rsup|\<infty\>><frac|1|m<rsup|2*\<nu\>+2>>>|<cell|\<leq\><frac|1|n<rsup|2*\<nu\>+2>>+<big|int><rsub|n><rsup|\<infty\>><frac|1|t<rsup|2*\<nu\>+2>><dif>t=<frac|1|n<rsup|2*\<nu\>+2>>+<frac|1|2*\<nu\>+1>*<space|0.17em><frac|1|n<rsup|2*\<nu\>+1>>\<leq\><frac|2*\<nu\>+2|2*\<nu\>+1>*<space|0.17em><frac|1|n<rsup|2*\<nu\>+1>>,>>>>
      </eqsplit>
    </equation*>

    where <math|n\<geq\>1> was used in the last inequality. This yields the
    desired upper bound. The asymptotic equivalence for <math|c<rsub|\<nu\>>>
    as <math|\<nu\>\<to\>\<infty\>> follows from Stirling's formula.
  </proof>

  <subsection|The null-space <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>>><label|sec:null-space>

  <big-figure|<with|par-mode|center|<image|Figures/fig_matern_null_basis.pdf|1par|||><label|fig:matern-null-space>>|The
  null-space Matérn--Laguerre functions <math|\<psi\><rsub|m,\<nu\>><rsup|0>>
  in<nbsp><eqref|eq:psi-null> for <math|\<nu\>=2> and <math|\<nu\>=9>.>

  In view of <localize|Proposition><nbsp><reference|prop:matern_laguerre_L2>,
  <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>> is left as the odd set
  out. From<nbsp><eqref|eq:h-hat-matern> and
  <eqref|eq:matern_laguerre_functions> we compute that

  <\equation*>
    <label|eq:nullspace_functions><wide|\<psi\>|^><rsup|0><rsub|m,\<nu\>><around|(|\<omega\>|)>=<around|(|-1|)><rsup|\<nu\>+1>*<wide|h|^><rsub|\<nu\>+1/2><rsup|\<ast\>><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>.
  </equation*>

  Furthermore, the functions

  <\equation*>
    <around|(|i*\<omega\>+1|)><rsup|\<nu\>+1>*<wide|\<psi\>|^><rsup|0><rsub|m,\<nu\>><around|(|\<omega\>|)>,
  </equation*>

  when viewed as functions of <math|i*\<omega\>>, have no poles in the left
  half-plane. Therefore <math|<smash|[>b]<with|math-font|cal*|M><rsub|\<nu\>><rsup|0>>
  are annihilated on the positive real line by the differential operator
  <math|<smash|[>b]<around|(|<math-up|D>+1|)><rsup|\<nu\>+1>>. That is,

  <\equation*>
    <around|(|<math-up|D>+1|)><rsup|\<nu\>+1>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|t|)>=0*<space|1em><text|for
    every ><space|1em>t\<gtr\>0.
  </equation*>

  For this reason we refer to these functions as the null-space functions.
  The null space functions have a symmetry property similar to that of the
  functions <math|<with|math-font|cal*|M><rsub|\<nu\>>> given
  by<nbsp><eqref|eq:psi-positive> and<nbsp><eqref|eq:psi-negative>.

  <\proposition>
    [Null-space symmetry] The null-space functions satisfy

    <\equation*>
      \<psi\><rsup|0><rsub|\<nu\>-m,\<nu\>><around|(|t|)>=<around|(|-1|)><rsup|\<nu\>>*\<psi\><rsup|0><rsub|m,\<nu\>>*<around|(|-t|)>*<space|1em><text|and
      ><space|1em><wide|\<psi\>|^><rsup|0><rsub|\<nu\>-m,\<nu\>><around|(|\<omega\>|)>=<around|(|-1|)><rsup|\<nu\>>*<wide|\<psi\>|^><rsup|0\<ast\>><rsub|m,\<nu\>><around|(|\<omega\>|)>.
    </equation*>

    for <math|m=0,1,\<ldots\>,\<nu\>>.
  </proposition>

  <\proof>
    Starting from <eqref|eq:matern_laguerre_binomial_expression>, using the
    conjugate symmetry of Laguerre functions, and then changing the order of
    summation gives

    <\equation*>
      <\eqsplit>
        <tformat|<table|<row|<cell|<wide|\<psi\>|^><rsup|0><rsub|m,\<nu\>><around|(|\<omega\>|)>>|<cell|=<frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|-\<nu\>-1+m+k><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|-<around|(|\<nu\>-m-k|)>-1><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=-<frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|\<nu\>-m-k><rsup|\<ast\>><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=-<frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|\<nu\>+1-k><around|(|-1|)><rsup|\<nu\>+1-k>*<wide|\<varphi\>|^><rsub|\<nu\>-m-<around|(|\<nu\>+1-k|)>><rsup|\<ast\>><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|\<nu\>><frac|1|<sqrt|<smash|[>b]2>>*<frac|\<nu\>!|<sqrt|<smash|[>b]<around|(|2*\<nu\>|)>!>>*<big|sum><rsub|k=0><rsup|\<nu\>+1><choose|\<nu\>+1|k><around|(|-1|)><rsup|k>*<wide|\<varphi\>|^><rsub|-\<nu\>-1+\<nu\>-m+k><rsup|\<ast\>><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|\<nu\>>*<wide|\<psi\>|^><rsup|0\<ast\>><rsub|\<nu\>-m,\<nu\>><around|(|\<omega\>|)>,>>>>
      </eqsplit>
    </equation*>

    which is the Fourier domain symmetry. The time domain symmetry is then
    obtained from Fourier inversion.
  </proof>

  <\example>
    [Null-space functions]<label|example:null-space>The set
    <math|<with|math-font|cal*|M><rsub|0><rsup|0>> (i.e., <math|\<nu\>=0>)
    consists of the function

    <\equation*>
      \<psi\><rsup|0,<around|(|0|)>><rsub|0><around|(|t|)>=-e<rsup|-<abs*|0|t>>.
    </equation*>

    The set <math|<with|math-font|cal*|M><rsub|1><rsup|0>> (i.e.,
    <math|\<nu\>=1>) consists of the functions

    <\equation*>
      \<psi\><rsup|0><rsub|0,1><around|(|t|)>=<frac|1|<sqrt|<smash|[>b]2>>*<around|(|2*t*e<rsup|t>*<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,0|)>><around|(|t|)>+e<rsup|-<abs*|0|t>>|)>*<space|1em><text|and
      ><space|1em>\<psi\><rsup|0><rsub|1,1><around|(|t|)>=-<frac|1|<sqrt|<smash|[>b]2>>*<around|(|2*t*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>+e<rsup|-<abs*|0|t>>|)>.
    </equation*>

    The set <math|<with|math-font|cal*|M><rsub|2><rsup|0>> (i.e.,
    <math|\<nu\>=2>) consists of the functions

    <\align*>
      <tformat|<table|<row|<cell|\<psi\><rsup|0><rsub|0,2><around|(|t|)>>|<cell|=<frac|2|<sqrt|<smash|[>b]4!>>*<around*|(|2*<around|(|-t<rsup|2>+t|)>*e<rsup|t>*<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,0|)>><around|(|t|)>-e<rsup|-<abs*|0|t>>|)>,>>|<row|<cell|\<psi\><rsup|0><rsub|1,2><around|(|t|)>>|<cell|=<frac|4|<sqrt|<smash|[>b]4!>>*<around|(|<abs*|0|t>+1|)>*e<rsup|-<abs*|0|t>>,>>|<row|<cell|\<psi\><rsup|0><rsub|2,2><around|(|t|)>>|<cell|=<frac|2|<sqrt|<smash|[>b]4!>>*<around*|(|-2*<around|(|t<rsup|2>+t|)>*e<rsup|-t>*<with|math-font-family|bf|1><rsub|<around|[|0,\<infty\>|)>><around|(|t|)>-e<rsup|-<abs*|0|t>>|)>.>>>>
    </align*>
  </example>

  Some null space functions are depicted in
  <localize|Figure><nbsp><reference|fig:matern-null-space>. Unlike the basis
  functions <math|<with|math-font|cal*|M><rsub|\<nu\>><rsup|+>> depicted in
  <localize|Figure><nbsp><reference|fig:matern-non-null-space>, the null
  space functions are supported on the entire real line. For
  <math|d=<abs*|0|t-u>>, a Matérn kernel can be written as

  <\equation*>
    r<rsub|\<nu\>+1/2><around|(|t,u|)>=r<rsub|\<nu\>+1/2><around|(|0,d|)>=<big|sum><rsub|m=0><rsup|\<nu\>>\<psi\><rsub|m,\<nu\>><rsup|0><around|(|0|)>*\<psi\><rsub|m,\<nu\>><rsup|0><around|(|d|)>,
  </equation*>

  where we have used<nbsp><eqref|eq:matern-simplification-positive> and the
  fact that the kernel <math|\<rho\><rsub|\<nu\>+1/2><rsup|+><around|(|t,u|)>>
  vanishes if <math|t=0> or <math|u=0>. Upon substitution of the expressions
  in <localize|Example><nbsp><reference|example:null-space> we obtain the
  well-known explicit forms of Matérn kernels in terms of <math|d>, such as

  <\equation*>
    r<rsub|3/2><around|(|t,u|)>=<around|(|1+d|)>*e<rsup|-d>*<space|1em><text|and
    ><space|1em>r<rsub|5/2><around|(|t,u|)>=<around*|(|1+d+<frac|d<rsup|2>|3>|)>*e<rsup|-d>.
  </equation*>

  <section|Expansions of the Cauchy kernel><label|sec:cauchy>

  The Cauchy kernel and its Fourier transform are

  <\equation>
    <label|eq:cauchy-kernel>r<around|(|t,u|)>=<frac|1|1+<around|(|t-u|)><rsup|2>>*<space|1em><text|and
    ><space|1em><wide|\<Phi\>|^><around|(|\<omega\>|)>=\<pi\>*e<rsup|-<abs*|0|\<omega\>>>.
  </equation>

  The Cauchy kernel is thus a Fourier dual to the Matérn kernel of smoothness
  index <math|\<alpha\>=1/2> (i.e., <math|\<nu\>=0>). In what follows this
  will inform the construction of an RKHS basis. A square-root of
  <math|<wide|\<Phi\>|^><around|(|\<omega\>|)>> is then given by

  <\equation>
    <label|eq:h-cauchy><wide|h|^><around|(|\<omega\>|)>=<wide|\<Phi\>|^><around|(|\<omega\>|)><rsup|1/2>=<sqrt|\<pi\>>*<space|0.17em>e<rsup|-<abs*|0|\<omega\>>/2>.
  </equation>

  <subsection|Expansion in complex-valued Cauchy\ULaguerre
  functions><label|sec:cauchy-complex>

  In view of the Fourier dualism with the Matérn-<math|<frac|1|2>> kernel and
  the fact that the Fourier transform is an isometry from
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>> to
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>,1/2*\<pi\>|)>>, a
  straight-forward way to construct a suitable basis of
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>> for
  Theorem<nbsp><reference|thm:main-theorem> is to modify the Laguerre
  functions from <localize|Section><nbsp><reference|sec:laguerre-functions>
  and consider the functions <math|<sqrt|\<pi\>>*\<varphi\><rsub|m>*<around|(|\<omega\>/2|)>>.
  The Fourier transforms of these functions are an orthonormal basis of
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>>, so that
  Theorem<nbsp><reference|thm:main-theorem> and<nbsp><eqref|eq:h-cauchy>
  yield the RKHS basis functions

  <\equation*>
    <wide|\<psi\>|^><rsub|m><around|(|\<omega\>|)>=<sqrt|\<pi\>>*<space|0.17em>e<rsup|-<abs*|0|\<omega\>>/2>*<sqrt|\<pi\>>*<space|0.17em>\<varphi\><rsub|m>*<around|(|\<omega\>/2|)>
  </equation*>

  in the Fourier domain. Since their inverse Fourier transforms are
  complex-valued, we call these functions the <em|complex-valued
  Cauchy\ULaguerre functions>. For <math|m\<in\><N><rsub|0>>, Fourier
  inversion gives

  <\equation*>
    <\eqsplit>
      <tformat|<table|<row|<cell|\<psi\><rsub|m><around|(|t|)>=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<abs*|0|\<omega\>>/2>*\<varphi\><rsub|m>*<around|(|\<omega\>/2|)>*e<rsup|i*\<omega\>*t><dif>\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<abs*|0|\<omega\>>>*\<varphi\><rsub|m><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*2*t><dif>\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<abs*|0|\<omega\>>>*\<varphi\><rsub|m><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*2*t><dif>\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<abs*|0|\<omega\>>>*\<varphi\><rsub|m><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|-2*t-i|)>><dif>\<omega\>>>|<row|<cell|>|<cell|=<wide|\<varphi\>|^><rsub|m>*<around|(|-2*t-i|)>>>|<row|<cell|>|<cell|=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m>|<around|(|i*t-1|)><rsup|m+1>>.>>>>
    </eqsplit>
  </equation*>

  Similarly, for negative indices we get

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|\<psi\><rsub|-m><around|(|t|)>=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|<around*|\||\<omega\>|\|>|2>>*\<varphi\><rsub|-m>*<around*|(|<frac|\<omega\>|2>|)>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around*|\||\<omega\>|\|>>*\<varphi\><rsub|-m><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*2*t>\<mathd\>\<omega\>>>|<row|<cell|>|<cell|=-<big|int><rsub|-\<infty\>><rsup|0>e<rsup|-<abs*|0|\<omega\>>>*\<varphi\><rsub|m-1>*<around|(|-\<omega\>|)>*e<rsup|i*\<omega\>*2*t><dif>\<omega\>>>|<row|<cell|>|<cell|=-<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<abs*|0|\<omega\>>>*\<varphi\><rsub|m-1><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*2*t><dif>\<omega\>>>|<row|<cell|>|<cell|=-<big|int><rsub|0><rsup|\<infty\>>\<varphi\><rsub|m-1><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|2*t-i|)>><dif>\<omega\>>>|<row|<cell|>|<cell|=-<wide|\<varphi\>|^><rsub|m-1>*<around|(|2*t-i|)>>>|<row|<cell|>|<cell|=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m-1>|<around*|(|i*t+1|)><rsup|m>>.>>>>
    </eqsplit>
  </equation>

  To summarise, the complex valued Cauchy\ULaguerre functions are

  <\subequations>
    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|m><around|(|t|)>>|<cell|=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m>|<around|(|i*t-1|)><rsup|m+1>>*<space|1em>\<forall\>m\<in\>\<bbb-N\><rsub|0><label|eq:cauch-laguerre-funcs><eq-number>>>|<row|<cell|\<psi\><rsub|-m-1><around|(|t|)>>|<cell|=-<frac|1|<sqrt|2>>*<frac|<around|(|i*t|)><rsup|m>|<around|(|i*t+1|)><rsup|m+1>>*<space|1em><text|\<forall\>>m\<in\>\<bbb-N\><rsub|0><eq-number>>>>>
    </align>
  </subequations>

  \ They have the conjugate symmetry property

  <\equation>
    \<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>=-\<psi\><rsub|-m-1><around|(|t|)>=\<psi\><rsub|m>*<around|(|-t|)>*<space|1em><text|for
    ><space|1em>m\<in\>\<bbb-Z\>
  </equation>

  An expansion of the Cauchy kernel<nbsp><eqref|eq:cauchy-kernel> in terms of
  complex-valued Cauchy\ULaguerre functions is thus given by

  <\equation>
    r<around|(|t,u|)>=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>
  </equation>

  This expansion is remarkably easy to verify by independent means since
  geometric summation and conjugate symmetry yield

  <\equation>
    <big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>=<frac|1|2>*<frac|1|<around|(|i*t-1|)>*<around|(|-i*u-1|)>-t*u>
  </equation>

  and

  <\equation>
    <big|sum><rsub|m=-\<infty\>><rsup|-1>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>=<around*|(|<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>|)><rsup|\<ast\>>
  </equation>

  Hence

  <\equation*>
    <\eqsplit>
      <tformat|<table|<row|<cell|<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>=<frac|1|2>*<frac|1|1-i*<around|(|t-u|)>>+<frac|1|2>*<frac|1|1+i*<around|(|t-u|)>>=<frac|1|1+<around|(|t-u|)><rsup|2>>,>>>>
    </eqsplit>
  </equation*>

  which indeed is the Cauchy kernel. An appropriate
  <math|<with|math-font|cal*|L><rsub|2><around|(|<R>,w|)>> space in which the
  complex-valued Cauchy\ULaguerre functions form a complete orthogonal set
  remains elusive to us. However, just as with the Matérn\ULaguerre
  expansions in <localize|Section><nbsp><reference|sec:matern>, the present
  expansion is very good at origin since all but two terms vanish:

  <\equation>
    r<around|(|t,0|)>=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|0|)>=-<around*|(|\<psi\><rsub|-1><around|(|t|)>+\<psi\><rsub|0><around|(|t|)>|)>
  </equation>

  <subsection|Expansion in real-valued Cauchy--Laguerre
  functions><label|sec:cauchy-real>

  <big-figure|<with|par-mode|center|<image|Figures/fig_cauchy_basis.pdf|1par|||><label|fig:cauchy-basis>>|The
  <rev|real-valued Cauchy--Laguerre functions> <math|\<alpha\><rsub|m>> and
  <math|\<beta\><rsub|m>> in<nbsp><eqref|eq:trig-cauchy-laguerre>.>

  It would be desirable to obtain a real-valued basis for the Cauchy RKHS.
  This can be done by scaling the real and imaginary parts of
  <math|<wide|\<psi\>|^><rsub|m>> in a similar manner as was done for the
  Laguerre functions in<nbsp><cite|Christov1982>. This gives the RKHS basis
  functions

  <\equation>
    <label|eq:trig-cauchy-laguerre>\<alpha\><rsub|m><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|(|\<psi\><rsub|m><around|(|t|)>+\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>|)>*<space|1em><text|and
    ><space|1em>\<beta\><rsub|m><around|(|t|)>=<frac|1|i*<sqrt|2>>*<around*|(|\<psi\><rsub|m><around|(|t|)>-\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>|)>
  </equation>

  for <math|m\<in\><N><rsub|0>>, where <math|\<psi\><rsub|m>> are the
  complex-valued Cauchy\ULaguerre functions
  in<nbsp><eqref|eq:cauch-laguerre-funcs>. We call the functions
  <math|\<alpha\><rsub|m>> and <math|\<beta\><rsub|m>> the
  <em|<rev|real-valued Cauchy--Laguerre functions>>. The binomial theorem
  yields the explicit expressions

  <\align*>
    <tformat|<table|<row|<cell|\<alpha\><rsub|m><around|(|t|)>>|<cell|=<frac|1|2>*<frac|<around|(|-1|)><rsup|m>*<around|(|i*t|)><rsup|m>|<around|(|t<rsup|2>+1|)><rsup|m+1>>*<big|sum><rsub|k=0><rsup|m+1><choose|m+1|k><around|(|i*t|)><rsup|k>*<around*|(|1-<around|(|-1|)><rsup|m+1-k>|)>,>>|<row|<cell|\<beta\><rsub|m><around|(|t|)>>|<cell|=<frac|1|i*2>*<frac|<around|(|-1|)><rsup|m>*<around|(|i*t|)><rsup|m>|<around|(|t<rsup|2>+1|)><rsup|m+1>>*<big|sum><rsub|k=0><rsup|m+1><choose|m+1|k><around|(|i*t|)><rsup|k>*<around*|(|1+<around|(|-1|)><rsup|m+1-k>|)>,>>>>
  </align*>

  which can be transformed into expressions of only real parameters by
  considering even and odd <math|m> separately. This yields

  <\subequations>
    <label|eq:real_cauchy_laguerre_explicit>

    <\align>
      <tformat|<table|<row|<cell|\<alpha\><rsub|2*m><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|m>*t<rsup|2*m>|<around|(|t<rsup|2>+1|)><rsup|2*m+1>>*<big|sum><rsub|k=0><rsup|m><choose|2*m+1|2*k><around|(|-1|)><rsup|k>*t<rsup|2*k>,<eq-number>>>|<row|<cell|\<alpha\><rsub|2*m+1><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|m>*t<rsup|2*m+1>|<around|(|t<rsup|2>+1|)><rsup|2*m+2>>*<big|sum><rsub|k=0><rsup|m><choose|2*m+2|2*k+1><around|(|-1|)><rsup|k>*t<rsup|2*k+1>,<eq-number>>>|<row|<cell|\<beta\><rsub|2*m><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|m>*t<rsup|2*m>|<around|(|t<rsup|2>+1|)><rsup|2*m+1>>*<big|sum><rsub|k=0><rsup|m><choose|2*m+1|2*k+1><around|(|-1|)><rsup|k>*t<rsup|2*k+1>,<eq-number>>>|<row|<cell|\<beta\><rsub|2*m+1><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|m+1>*t<rsup|2*m+1>|<around|(|t<rsup|2>+1|)><rsup|2*m+2>>*<big|sum><rsub|k=0><rsup|m+1><choose|2*m+2|2*k><around|(|-1|)><rsup|k>*t<rsup|2*k>.<eq-number>>>>>
    </align>
  </subequations>

  \ An expansion of the Cauchy kernel<nbsp><eqref|eq:cauchy-kernel> in terms
  of real functions is thus given by

  <\equation>
    <label|eq:cauchy-expansion-trig>r<around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<alpha\><rsub|m><around|(|t|)>*\<alpha\><rsub|m><around|(|u|)>+<big|sum><rsub|m=0><rsup|\<infty\>>\<beta\><rsub|m><around|(|t|)>*\<beta\><rsub|m><around|(|u|)>.
  </equation>

  At the origin, this reduces to the finite term expansion

  <\equation*>
    r<around|(|t,0|)>=\<alpha\><rsub|0><around|(|t|)>*\<alpha\><rsub|0><around|(|0|)>.
  </equation*>

  The basis functions <math|\<alpha\><rsub|m>> and <math|\<beta\><rsub|m>>
  and truncations of the expansion<nbsp><eqref|eq:cauchy-expansion-trig> are
  displayed in <localize|Figures><nbsp><reference|fig:cauchy-basis>
  and<nbsp><reference|fig:cauchy-truncation>.

  <big-figure|<with|par-mode|center|<image|Figures/fig_cauchy_truncation.pdf|1par|||><label|fig:cauchy-truncation>>|Truncations
  <math|<big|sum><rsub|m=0><rsup|n-1>\<alpha\><rsub|m><around|(|t|)>*\<alpha\><rsub|m><around|(|u|)>+<big|sum><rsub|m=0><rsup|n-1>\<beta\><rsub|m><around|(|t|)>*\<beta\><rsub|m><around|(|u|)>>
  of the Cauchy expansion in<nbsp><eqref|eq:cauchy-expansion-trig>.>

  <section|Expansion of the Gaussian kernel><label|sec:gaussian>

  The Gaussian kernel and its Fourier transform are

  <\equation>
    <label|eq:gaussian-kernel>r<around|(|t,u|)>=exp
    <around*|(|<space|-0.17em>-<frac|1|2>*<around|(|t-u|)><rsup|2>|)>*<space|1em><text|and
    ><space|1em><wide|\<Phi\>|^><around|(|\<omega\>|)>=<sqrt|2*\<pi\>>*<space|0.17em>e<rsup|-\<omega\><rsup|2>/2>.
  </equation>

  A square-root is

  <\equation*>
    <wide|h|^><around|(|\<omega\>|)>=<wide|\<Phi\>|^><around|(|\<omega\>|)><rsup|1/2>=<around|(|2*\<pi\>|)><rsup|1/4>*e<rsup|-\<omega\><rsup|2>/4>,
  </equation*>

  so that taking the inverse Fourier transform gives the function <math|h> in
  <localize|Theorem><nbsp><reference|thm:main-theorem> as

  <\equation>
    <label|eq:h-gaussian>h<around|(|t|)>=2<rsup|1/4>*\<pi\><rsup|-1/4>*e<rsup|-t<rsup|2>>.
  </equation>

  <subsection|Expansion for the Gaussian kernel><label|sec:gaussian-expansion>

  As an orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>>
  we use the <em|Hermite functions> (for them being an orthonormal basis,
  see<nbsp><cite-detail|Szego1939|Theorem<nbsp>5.7.1>)

  <\equation>
    <label|eq:hermite-function>\<varphi\><rsub|m><around|(|t|)>=<sqrt|<frac|1|2<rsup|m>*m!<sqrt|\<pi\>>>>*<space|0.17em>e<rsup|-t<rsup|2>/2><math-up|H><rsub|m><around|(|t|)>*<space|1em><text|for
    ><space|1em>m\<in\><N><rsub|0>.
  </equation>

  Here <math|<math-up|H><rsub|m>> is the <math|m>th physicist's Hermite
  polynomial given by

  <\equation>
    <label|eq:hermite-polynomial><math-up|H><rsub|m><around|(|t|)>=m!<big|sum><rsub|k=0><rsup|<around|\<lfloor\>|m/2|\<rfloor\>>><frac|<around|(|-1|)><rsup|k>|k!<around|(|m-2*k|)>!>*<around|(|2*t|)><rsup|m-2*k>.
  </equation>

  By <localize|Theorem><nbsp><reference|thm:main-theorem>, the functions

  <\equation*>
    \<psi\><rsub|m><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*\<varphi\><rsub|m><around|(|\<tau\>|)><dif>\<tau\>=<around*|(|<frac|<sqrt|2>|\<pi\>>|)><rsup|1/2><sqrt|<frac|1|2<rsup|m>*m!>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|t-\<tau\>|)><rsup|2>>*e<rsup|-\<tau\><rsup|2>/2><math-up|H><rsub|m><around|(|\<tau\>|)><dif>\<tau\>
  </equation*>

  form an orthonormal basis of the RKHS of the Gaussian
  kernel<nbsp><eqref|eq:gaussian-kernel>. Equation<nbsp>(17) in
  Section<nbsp>16.5 of<nbsp><cite|Erdelyi1954> states that

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|s-\<tau\>|)><rsup|2>><math-up|H><rsub|m><around|(|a*\<tau\>|)><dif>\<tau\>=<sqrt|\<pi\>>*<around|(|1-a<rsup|2>|)><rsup|m/2><math-up|H><rsub|m><around*|(|<frac|a*s|<sqrt|1-a<rsup|2>>>|)>
  </equation*>

  for any reals <math|s> and <math|a>. Completing the square, doing a change
  of variables, and using this equation yields

  <\equation*>
    <\eqsplit>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|t-\<tau\>|)><rsup|2>>*e<rsup|-\<tau\><rsup|2>/2><math-up|H><rsub|m><around|(|\<tau\>|)><dif>\<tau\>>|<cell|=<sqrt|<frac|2|3>>*e<rsup|-t<rsup|2>/3>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<around|(|<sqrt|<smash|[>b]2/3>*<space|0.17em>t-\<tau\>|)><rsup|2>><math-up|H><rsub|m><around*|(|<sqrt|<smash|[>b]2/3>*<space|0.17em>\<tau\>|)><dif>\<tau\>>>|<row|<cell|>|<cell|=<sqrt|<frac|2*\<pi\>|3>>*3<rsup|-m/2>*e<rsup|-t<rsup|2>/3><math-up|H><rsub|m><around*|(|<frac|2*t|<sqrt|3>>|)>.>>>>
    </eqsplit>
  </equation*>

  We thus obtain the basis functions

  <\equation>
    <label|eq:gaussian-basis>\<psi\><rsub|m><around|(|t|)>=<around*|(|<frac|2*<sqrt|2>|3>|)><rsup|1/2><sqrt|<frac|1|6<rsup|m>*m!>>*e<rsup|-t<rsup|2>/3><math-up|H><rsub|m><around*|(|<frac|2*t|<sqrt|3>>|)>*<space|1em><text|for
    ><space|1em>m\<in\><N><rsub|0>
  </equation>

  and the resulting expansion

  <\equation>
    <label|eq:gaussian-expansion>r<around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>
  </equation>

  of the Gaussian kernel in<nbsp><eqref|eq:gaussian-kernel>.
  <localize|Figure><nbsp><reference|fig:gaussian-basis> displays some of the
  basis functions.

  <big-figure|<with|par-mode|center|<image|Figures/fig_gaussian_basis.pdf|1par|||><label|fig:gaussian-basis>>|The
  first six basis functions <math|\<psi\><rsub|m>>
  in<nbsp><eqref|eq:gaussian-basis> of the Gaussian
  kernel<nbsp><eqref|eq:gaussian-kernel>.>

  Note that the basis functions can be written in terms of the Hermite
  functions<nbsp><eqref|eq:hermite-function> by using the multiplication
  theorem

  <\equation*>
    <math-up|H><rsub|m><around|(|b*t|)>=<big|sum><rsub|k=0><rsup|<around|\<lfloor\>|m/2|\<rfloor\>>>b<rsup|m-2*k>*<around|(|b<rsup|2>-1|)><rsup|k><binom|m|2*k><frac|<around|(|2*k|)>!|k!><math-up|H><rsub|m-2*k><around|(|t|)>
  </equation*>

  for Hermite polynomials. Setting <math|b=<sqrt|2>> gives

  <\equation*>
    <math-up|H><rsub|m><around*|(|<frac|2*t|<sqrt|3>>|)>=2<rsup|m/2>*<big|sum><rsub|k=0><rsup|<around|\<lfloor\>|m/2|\<rfloor\>>>2<rsup|-k><binom|m|2*k><frac|<around|(|2*k|)>!|k!><math-up|H><rsub|m-2*k><around*|(|<frac|<sqrt|2>*<space|0.17em>t|<sqrt|3>>|)>,
  </equation*>

  so that

  <\equation*>
    \<psi\><rsub|m><around|(|t|)>=<around*|(|<frac|2*<sqrt|\<pi\>>|<sqrt|3>>|)><rsup|1/2><sqrt|<frac|2<rsup|m>*m!|3<rsup|m>>>*<big|sum><rsub|k=0><rsup|<around|\<lfloor\>|m/2|\<rfloor\>>><frac|1|4<rsup|k>*k!<sqrt|<around|(|m-2*k|)>!>>*<space|0.17em>\<varphi\><rsub|m-2*k><around*|(|<frac|<sqrt|2>*<space|0.17em>t|<sqrt|3>>|)>.
  </equation*>

  It would be interesting to be able to connect <math|\<psi\><rsub|m>> to the
  associated Hermite polynomials<nbsp><cite|AskeyWimp1984> like the
  Matérn\ULaguerre functions are connected to associated Laguerre functions
  in <localize|Section><nbsp><reference|sec:matern-classification>.

  <\remark>
    Observe that (both here and elsewhere) we have used a basis of
    <math|<with|math-font|cal*|L><rsub|2><around|(|<R>|)>> that is
    \Pcompatible\Q with the kernel, having the same scaling in the
    exponential. That is, the Hermite functions
    in<nbsp><eqref|eq:hermite-function> have the exponential term
    <math|e<rsup|-t<rsup|2>/2>> and the kernel is
    <math|e<rsup|-<around|(|t-u|)><rsup|2>/2>>. For any
    <math|\<kappa\>\<in\><around|(|0,<sqrt|2>|)>>, the scaled Hermite
    functions

    <\equation>
      \<varphi\><rsub|m,\<kappa\>><around|(|t|)>=<sqrt|<frac|\<kappa\>|2<rsup|m>*m!<sqrt|\<pi\>>>>*<space|0.17em>e<rsup|-\<kappa\><rsup|2>*t<rsup|2>/2><math-up|H><rsub|m><around|(|\<kappa\>*t|)>
    </equation>

    would yield the RKHS basis functions

    <\equation*>
      \<psi\><rsub|m,\<kappa\>><around|(|t|)>=<around*|(|<frac|<sqrt|2>*\<kappa\>|a<rsup|2>>|)><rsup|1/2><sqrt|<frac|1|2<rsup|m>*m!>>*<around*|(|1-<frac|\<kappa\><rsup|2>|a<rsup|2>>|)><rsup|m/2>*e<rsup|-<around|(|1-1/a<rsup|2>|)>*t<rsup|2>><math-up|H><rsub|m><around*|(|<frac|\<kappa\>*t|a<rsup|2>*<sqrt|<smash|[>b]1-\<kappa\><rsup|2>/a<rsup|2>>>|)>,
    </equation*>

    where <math|a<rsup|2>=1+\<kappa\><rsup|2>/2>.
  </remark>

  <subsection|Mercer basis and Mehler's formula>

  The expansion<nbsp><eqref|eq:gaussian-expansion> that we derived for the
  Gaussian kernel by the use of the basis functions
  in<nbsp><eqref|eq:gaussian-basis> can also be derived by setting

  <\equation>
    \<rho\>=<frac|1|3>,<space|1em>x=<frac|2*t|<sqrt|3>>,<space|1em><text|and
    ><space|1em>y=<frac|2*u|<sqrt|3>>
  </equation>

  in Mehler's formula

  <\equation*>
    <big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|\<rho\>/2|)><rsup|m>|m!><math-up|H><rsub|m><around|(|x|)><math-up|H><rsub|m><around|(|y|)>*e<rsup|-<around|(|x<rsup|2>+y<rsup|2>|)>/2>=<sqrt|<frac|1|1-\<rho\><rsup|2>>>*exp
    <around*|(|<frac|4*x*y*\<rho\>-<around|(|1+\<rho\><rsup|2>|)>*<around|(|x<rsup|2>+y<rsup|2>|)>|2*<around|(|1-\<rho\><rsup|2>|)>>|)>
  </equation*>

  and subsequently multiplying both sides by
  <math|e<rsup|-<around|(|t<rsup|2>+u<rsup|2>|)>/3>>. This suggests that the
  expansion derived in the preceding section is a special case of the
  relatively well known Mercer expansion of the Gaussian kernel, <rev|which
  can also be derived> from Mehler's formula<nbsp><cite-detail|FasshauerMcCourt2015|Section<nbsp>12.2.1>.
  Let <math|\<alpha\>\<gtr\>0> and define the constants

  <\equation*>
    \<beta\>=<around*|(|1+<frac|2|\<alpha\><rsup|2>>|)><rsup|1/4>*<space|1em><text|and
    ><space|1em>\<delta\><rsup|2>=<frac|\<alpha\><rsup|2>|2>*<around|(|\<beta\><rsup|2>-1|)>.
  </equation*>

  The Mercer expansion of the Gaussian kernel with respect to the weight
  function

  <\equation*>
    w<rsub|\<alpha\>><around|(|t|)>=<frac|\<alpha\>|<sqrt|\<pi\>>>*e<rsup|-\<alpha\><rsup|2>*t<rsup|2>>
  </equation*>

  on the real line is

  <\equation>
    <label|eq:gaussian-mercer-expansion>r<around|(|t,u|)>=<big|sum><rsub|m=0><rsup|\<infty\>>\<mu\><rsub|m,\<alpha\>><rev|\<vartheta\>><rsub|m,\<alpha\>><around|(|t|)><rev|\<vartheta\>><rsub|m,\<alpha\>><around|(|u|)>,
  </equation>

  where

  <\equation*>
    \<mu\><rsub|m,\<alpha\>>=<sqrt|<frac|\<alpha\><rsup|2>|\<alpha\><rsup|2>+\<delta\><rsup|2>+1/2>><around*|(|<frac|1/2|\<alpha\><rsup|2>+\<delta\><rsup|2>+1/2>|)><rsup|m>
  </equation*>

  are the eigenvalues and

  <\equation>
    <label|eq:gaussian-basis-mercer><rev|\<vartheta\>><rsub|m,\<alpha\>><around|(|t|)>=<sqrt|<frac|\<beta\>|2<rsup|m>*m!>>*e<rsup|-\<delta\><rsup|2>*t<rsup|2>><math-up|H><rsub|m><around|(|\<alpha\>*\<beta\>*t|)>
  </equation>

  the <math|<with|math-font|cal*|L><rsub|2><around|(|<R>,w<rsub|\<alpha\>>|)>>-orthonormal
  eigenfunctions of the integral operator
  in<nbsp><eqref|eq:mercer-integral-operator>. By requiring that
  <math|\<alpha\>*\<beta\>=2/<sqrt|3>>, so that the Hermite polynomials
  appearing in<nbsp><eqref|eq:gaussian-basis>
  and<nbsp><eqref|eq:gaussian-basis-mercer> have the same scaling, it is
  straight-forward to solve that

  <\equation*>
    \<psi\><rsub|m>=<sqrt|\<mu\><rsub|m,\<alpha\>>><space|0.17em><rev|\<vartheta\>><rsub|m,\<alpha\>>=<sqrt|<frac|2|3<rsup|m+1>>><space|0.17em><rev|\<vartheta\>><rsub|m,\<alpha\>><space|1em><text|when
    ><space|1em>\<alpha\>=<sqrt|<frac|2|3>>,
  </equation*>

  which shows that the basis<nbsp><eqref|eq:gaussian-basis> is a special case
  of the Mercer basis. Results of some of the above computations are
  collected in the following proposition.

  <\proposition>
    [Orthogonality of the Gaussian basis]<label|prop:gaussian-basis-L2>Let
    <math|\<alpha\>=<sqrt|<smash|[>b]2/3>>. The functions

    <\equation*>
      <sqrt|<frac|3<rsup|m+1>|2>>*<space|0.17em>\<psi\><rsub|m><rev|<around|(|t|)>>=2<rsup|1/4>*<sqrt|<frac|1|2<rsup|m>*m!>>*e<rsup|-t<rsup|2>/3><math-up|H><rsub|m><around*|(|<frac|2*t|<sqrt|3>>|)>*<space|1em><text|for
      ><space|1em>m\<in\><N><rsub|0>
    </equation*>

    form an orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|<R>,w<rsub|\<alpha\>>|)>>.
  </proposition>

  Although the Mercer expansion<nbsp><eqref|eq:gaussian-mercer-expansion> has
  been known for some time, apparently originating
  in<nbsp><cite-detail|Zhu1998|Section<nbsp>4>, all its derivations in the
  literature that we are aware of are based on Mehler's formula and integral
  identities for Hermite polynomials (the only detailed derivations that we
  know of are given in<nbsp><cite-detail|FasshauerMcCourt2015|Section<nbsp>12.2.1>
  and<nbsp><cite-detail|Gnewuch2022|Section<nbsp>5.1>). The
  expansion<nbsp><eqref|eq:gaussian-expansion> is therefore the first Mercer
  expansion for the Gaussian kernel that has been derived from some general
  principle, which in this case is <localize|Theorem><nbsp><reference|thm:main-theorem>,
  instead of utilising <em|ad hoc> calculations. The relative simplicity of
  the basis functions<nbsp><eqref|eq:gaussian-basis> and the fact that the
  Hermite functions<nbsp><eqref|eq:hermite-function> have the same
  exponential decay as the kernel suggest that the choice
  <math|\<alpha\>=<sqrt|<smash|[>b]2/3>> for the standard deviation of the
  Gaussian weight <math|w<rsub|\<alpha\>>> may be in some sense the most
  natural one. More discussion on the selection of <math|\<alpha\>> may be
  found in<nbsp><cite-detail|FasshauerMcCourt2012|Section<nbsp>5.3>.

  <subsection|Truncation error>

  <big-figure|<with|par-mode|center|<image|Figures/fig_gaussian_truncation.pdf|1par|||><label|fig:gaussian-truncation>>|The
  Gaussian kernel<nbsp><eqref|eq:gaussian-kernel> with <math|u=0> and its
  truncated expansions in<nbsp><eqref|eq:gaussian-kernel-truncated>. For
  <math|n=3> and <math|n=11> the truncated kernels become negative.>

  Define the truncated kernel

  <\equation>
    <label|eq:gaussian-kernel-truncated>r<rsub|n><around|(|t,u|)>=<big|sum><rsub|m=0><rsup|n-1>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>
  </equation>

  for any <math|n\<in\><N>>. A few truncations are shown in
  <localize|Figure><nbsp><reference|fig:gaussian-truncation>. The truncated
  kernel converges to the full Gaussian kernel <math|r> pointwise on
  <math|<R>\<times\><R>>. The following proposition shows that the
  convergence of<nbsp><eqref|eq:gaussian-kernel-truncated> to <math|r> is
  exponential in <math|<with|math-font|cal*|L><rsub|2><around|(|<R>\<times\><R>,w<rsub|\<alpha\>>\<otimes\>w<rsub|\<alpha\>>|)>>.

  <\proposition>
    [Gaussian truncation]<label|prop:gaussian-truncation-error>Let
    <math|\<alpha\>=<sqrt|<smash|[>b]2/3>>. For every <math|n\<in\><N>> it
    holds that

    <\equation*>
      <around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|r<around|(|t,u|)>-r<rsub|n><around|(|t,u|)>|)><rsup|2>*w<rsub|\<alpha\>><around|(|t|)>*w<rsub|\<alpha\>><around|(|u|)><dif>t<dif>u|)><rsup|1/2>=<frac|1|<sqrt|2>>*<space|0.17em><frac|1|3<rsup|n>>.
    </equation*>
  </proposition>

  <\proof>
    As in the proof of <localize|Proposition><nbsp><reference|prop:matern-truncation-error>,
    we get

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|r<around|(|t,u|)>-r<rsub|n><around|(|t,u|)>|)><rsup|2>*w<rsub|\<alpha\>><around|(|t|)>*w<rsub|\<alpha\>><around|(|u|)><dif>t<dif>u=<big|sum><rsub|m=n><rsup|\<infty\>><norm*|0|\<psi\><rsub|m>><rsub|<with|math-font|cal*|L><rsub|2><around|(|<R>,w<rsub|\<alpha\>>|)>><rsup|4>.
    </equation*>

    By <localize|Proposition><nbsp><reference|prop:gaussian-basis-L2>,

    <\equation*>
      <big|sum><rsub|m=n><rsup|\<infty\>><norm*|0|\<psi\><rsub|m>><rsub|<with|math-font|cal*|L><rsub|2><around|(|<R>,w<rsub|\<alpha\>>|)>><rsup|4>=<big|sum><rsub|m=n><rsup|\<infty\>><frac|4|9<rsup|m+1>>=<frac|1|2>*<space|0.17em><frac|1|9<rsup|n>>.
    </equation*>

    This completes the proof.
  </proof>

  <section|Conclusion>

  In this article, we have demonstrated that
  <localize|Theorem><nbsp><reference|thm:main-theorem> is a simple and
  powerful tool for constructing orthonormal expansions of
  translation-invariant kernels. In particular, using the Cholesky factor of
  the Fourier transform of the kernel together with the Laguerre functions
  led to an interesting decomposition of the RKHS of the Matérn kernel for
  half-integer smoothness parameters in terms of a finite dimensional space
  and a Hilbert space of functions vanishing at the origin. This might be
  deemed unsatisfying, and a possible avenue to obtaining basis functions for
  Matérns in a common space would be to investigate constructions based on
  the symmetric square-root. The expansion for the Cauchy kernel was derived
  from the Fourier duality with the Matérn kernel of smoothness
  <math|\<alpha\>=1/2>. It remains an open problem to find a weighted
  <math|<with|math-font|cal*|L><rsub|2>> space in which the Cauchy basis
  functions are orthogonal. For the Gaussian kernel, our construction is a
  means to reproduce certain Mercer expansions that are typically derived
  from Mehler's formula.

  <section*|Acknowledgements>

  FT was partially supported by the Wallenberg AI, Autonomous Systems and
  Software Program (WASP) funded by the Knut and Alice Wallenberg Foundation,
  and gratefully acknowledge financial support through funds from the
  Ministry of Science, Research and Arts of the State of Baden-Württemberg.TK
  was supported by the Academy of Finland postdoctoral researcher grant
  338567 \PScalable, adaptive and reliable probabilistic integration\Q. Most
  of this article was written while TK was visiting the University of
  Tübingen in May 2022.

  <\bibliography|bib|plain|references>
    <\bib-list|10>
      <bibitem*|1><label|bib-Adler1990>Robert<nbsp>J. Adler.
      <newblock><with|font-shape|italic|An Introduction to Continuity,
      Extrema, and Related Topics for General Gaussian Processes>.
      <newblock>Number<nbsp>12 in Lecture Notes\UMonograph Series. Institute
      of Mathematical Statistics, 1990.

      <bibitem*|2><label|bib-AskeyWimp1984>R.<nbsp>Askey and J.<nbsp>Wimp.
      <newblock>Associated Laguerre and Hermite polynomials.
      <newblock><with|font-shape|italic|Proceedings of the Royal Society of
      Edinburgh Section A: Mathematics>, 96(1\U2):15\U37, 1984.

      <bibitem*|3><label|bib-Bell2004>W.<nbsp>W. Bell.
      <newblock><with|font-shape|italic|Special Functions for Scientists and
      Engineers>. <newblock>Courier Corporation, 2004.

      <bibitem*|4><label|bib-Christov1982>C.<nbsp>Christov. <newblock>A
      complete orthonormal system of functions in
      <math|L<rsup|2><around|(|-\<infty\>,\<infty\>|)>> space.
      <newblock><with|font-shape|italic|SIAM Journal on Applied Mathematics>,
      42(6):1337\U1344, 1982.

      <bibitem*|5><label|bib-Erdelyi1954>A.<nbsp>Erdélyi.
      <newblock><with|font-shape|italic|Tables of Integral Transforms. Volume
      II>. <newblock>McGraw-Hill, 1954.

      <bibitem*|6><label|bib-FasshauerHickernell2012>G.<nbsp>Fasshauer,
      F.<nbsp>Hickernell, and H.<nbsp>Wo¹niakowski. <newblock>On
      dimension-independent rates of convergence for function approximation
      with Gaussian kernels. <newblock><with|font-shape|italic|SIAM Journal
      on Numerical Analysis>, 50(1):247\U271, 2012.

      <bibitem*|7><label|bib-FasshauerMcCourt2015>Gregory Fasshauer and
      Michael McCourt. <newblock><with|font-shape|italic|Kernel-based
      Approximation Methods using MATLAB>. <newblock>Number<nbsp>19 in
      Interdisciplinary Mathematical Sciences. World Scientific Publishing,
      2015.

      <bibitem*|8><label|bib-FasshauerMcCourt2012>Gregory<nbsp>E. Fasshauer
      and Michael<nbsp>J. McCourt. <newblock>Stable evaluation of Gaussian
      radial basis function interpolants.
      <newblock><with|font-shape|italic|SIAM Journal on Scientific
      Computing>, 34(2):A737\UA762, 2012.

      <bibitem*|9><label|bib-Gnewuch2022>M.<nbsp>Gnewuch, M.<nbsp>Hefter,
      A.<nbsp>Hinrichs, and K.<nbsp>Ritter. <newblock>Countable tensor
      products of Hermite spaces and spaces of Gaussian kernels.
      <newblock><with|font-shape|italic|Journal of Complexity>, 71:101654,
      2022.

      <bibitem*|10><label|bib-Hawkins1989>D.<nbsp>L. Hawkins. <newblock>Some
      practical problems in implementing a certain sieve estimator of the
      Gaussian mean function. <newblock><with|font-shape|italic|Communications
      in Statistics - Simulation and Computation>, 18(2):481\U500, 1989.

      <bibitem*|11><label|bib-Higgins1977>J.<nbsp>R. Higgins.
      <newblock><with|font-shape|italic|Completeness and Basis Properties of
      Sets of Special Functions>. <newblock>Number<nbsp>72 in Cambridge
      Tracts in Mathematics. Cambridge University Press, 1977.

      <bibitem*|12><label|bib-IrrgeherLeobacher2015>Christian Irrgeher and
      Gunther Leobacher. <newblock>High-dimensional integration on
      <math|\<bbb-R\><rsup|d>>, weighted Hermite spaces, and orthogonal
      transforms. <newblock><with|font-shape|italic|Journal of Complexity>,
      31(2):174\U205, 2015.

      <bibitem*|13><label|bib-KimeldorfWahba1970>George<nbsp>S. Kimeldorf and
      Grace Wahba. <newblock>A correspondence between Bayesian estimation on
      stochastic processes and smoothing by splines.
      <newblock><with|font-shape|italic|The Annals of Mathematical
      Statistics>, 41(2):495\U502, 1970.

      <bibitem*|14><label|bib-NovakUllrich2018>E.<nbsp>Novak,
      M.<nbsp>Ullrich, H.<nbsp>Wo¹niakowski, and S.<nbsp>Zhang.
      <newblock>Reproducing kernels of Sobolev spaces on
      <math|\<bbb-R\><rsup|d>> and applications to embedding constants and
      tractability. <newblock><with|font-shape|italic|Analysis and
      Applications>, 16(5):693\U715, 2018.

      <bibitem*|15><label|bib-NovakWozniakowski2008>E.<nbsp>Novak and
      H.<nbsp>Wo¹niakowski. <newblock><with|font-shape|italic|Tractability of
      Multivariate Problems. Volume I: Linear Information>.
      <newblock>Number<nbsp>6 in EMS Tracts in Mathematics. European
      Mathematical Society, 2008.

      <bibitem*|16><label|bib-OwhadiScovel2017>H.<nbsp>Owhadi and
      C.<nbsp>Scovel. <newblock>Separability of reproducing kernel spaces.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 145(5):2131\U2138, 2017.

      <bibitem*|17><label|bib-Paulsen2016>V.<nbsp>I. Paulsen and
      M.<nbsp>Raghupathi. <newblock><with|font-shape|italic|An Introduction
      to the Theory of Reproducing Kernel Hilbert Spaces>. <newblock>Number
      152 in Cambridge Studies in Advanced Mathematics. Cambridge University
      Press, 2016.

      <bibitem*|18><label|bib-RahimiRecht2007>A.<nbsp>Rahimi and
      B.<nbsp>Recht. <newblock>Random features for large-scale kernel
      machines. <newblock>In <with|font-shape|italic|Advances in Neural
      Information Processing Systems>, volume<nbsp>20, pages 1177\U1184,
      2007.

      <bibitem*|19><label|bib-RasmussenWilliams2006>C.<nbsp>E. Rasmussen and
      C.<nbsp>K.<nbsp>I. Williams. <newblock><with|font-shape|italic|Gaussian
      Processes for Machine Learning>. <newblock>Adaptive Computation and
      Machine Learning. MIT Press, 2006.

      <bibitem*|20><label|bib-SolinSarkka2020>A.<nbsp>Solin and
      S.<nbsp>Särkkä. <newblock>Hilbert space methods for reduced-rank
      Gaussian process regression. <newblock><with|font-shape|italic|Statistics
      and Computing>, 30(2):419\U446, 2020.

      <bibitem*|21><label|bib-Stein1999>Michael<nbsp>L. Stein.
      <newblock><with|font-shape|italic|Interpolation of Spatial Data: Some
      Theory for Kriging>. <newblock>Springer Series in Statistics. Springer,
      1999.

      <bibitem*|22><label|bib-SteinwartScovel2012>I.<nbsp>Steinwart and
      C.<nbsp>Scovel. <newblock>Mercer's theorem on general domains: On the
      interaction between measures, kernels, and RKHSs.
      <newblock><with|font-shape|italic|Constructive Approximation>,
      35:363\U417, 2012.

      <bibitem*|23><label|bib-Szego1939>G.<nbsp>Szeg®.
      <newblock><with|font-shape|italic|Orthogonal Polynomials>.
      <newblock>Number<nbsp>23 in Colloquium Publications. American
      Mathematical Society, 1939.

      <bibitem*|24><label|bib-VanTrees2001>H.<nbsp>L. Van<nbsp>Trees.
      <newblock><with|font-shape|italic|Detection Estimation and Modulation
      Theory: Part I>. <newblock>Wiley-Interscience, 2001.

      <bibitem*|25><label|bib-Wendland2005>H.<nbsp>Wendland.
      <newblock><with|font-shape|italic|Scattered Data Approximation>.
      <newblock>Number<nbsp>17 in Cambridge Monographs on Applied and
      Computational Mathematics. Cambridge University Press, 2005.

      <bibitem*|26><label|bib-Wiener1949>N.<nbsp>Wiener.
      <newblock><with|font-shape|italic|Extrapolation, Interpolation, and
      Smoothing of Stationary Time Series: With Engineering Applications>.
      <newblock>MIT Press, 1949.

      <bibitem*|27><label|bib-Xiu2010>D.<nbsp>Xiu.
      <newblock><with|font-shape|italic|Numerical Methods for Stochastic
      Computations>. <newblock>Princeton University Press, 2010.

      <bibitem*|28><label|bib-Zhu1998>H.<nbsp>Zhu, C.<nbsp>K.<nbsp>I.
      Williams, R.<nbsp>Rohwer, and M.<nbsp>Morciniec. <newblock>Gaussian
      regression and optimal finite dimensional linear models. <newblock>In
      C.<nbsp>M. Bishop, editor, <with|font-shape|italic|Neural Networks and
      Machine Learning>, volume 168 of <with|font-shape|italic|NATO ASI
      Series. Series F: Computer and Systems Science>, pages 167\U184.
      Springer, 1998.

      <bibitem*|29><label|bib-Zwickngaslc2009>B.<nbsp>Zwicknagl.
      <newblock>Power series kernels. <newblock><with|font-shape|italic|Constructive
      Approximation>, 29(1):61\U84, 2009.
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
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|3.2|9>>
    <associate|auto-11|<tuple|3.3|11>>
    <associate|auto-12|<tuple|1|12>>
    <associate|auto-13|<tuple|3.4|14>>
    <associate|auto-14|<tuple|2|14>>
    <associate|auto-15|<tuple|3|15>>
    <associate|auto-16|<tuple|3.5|16>>
    <associate|auto-17|<tuple|4|16>>
    <associate|auto-18|<tuple|4|18>>
    <associate|auto-19|<tuple|4.1|19>>
    <associate|auto-2|<tuple|1.1|3>>
    <associate|auto-20|<tuple|4.2|21>>
    <associate|auto-21|<tuple|5|21>>
    <associate|auto-22|<tuple|6|22>>
    <associate|auto-23|<tuple|5|22>>
    <associate|auto-24|<tuple|5.1|23>>
    <associate|auto-25|<tuple|7|24>>
    <associate|auto-26|<tuple|5.2|25>>
    <associate|auto-27|<tuple|5.3|26>>
    <associate|auto-28|<tuple|8|26>>
    <associate|auto-29|<tuple|6|27>>
    <associate|auto-3|<tuple|1.2|5>>
    <associate|auto-30|<tuple|6|28>>
    <associate|auto-31|<tuple|6|28>>
    <associate|auto-4|<tuple|2|6>>
    <associate|auto-5|<tuple|2.1|6>>
    <associate|auto-6|<tuple|2.2|7>>
    <associate|auto-7|<tuple|2.3|7>>
    <associate|auto-8|<tuple|3|8>>
    <associate|auto-9|<tuple|3.1|8>>
    <associate|bib-Adler1990|<tuple|1|28>>
    <associate|bib-AskeyWimp1984|<tuple|2|28>>
    <associate|bib-Bell2004|<tuple|3|28>>
    <associate|bib-Christov1982|<tuple|4|28>>
    <associate|bib-Erdelyi1954|<tuple|5|28>>
    <associate|bib-FasshauerHickernell2012|<tuple|6|28>>
    <associate|bib-FasshauerMcCourt2012|<tuple|8|28>>
    <associate|bib-FasshauerMcCourt2015|<tuple|7|28>>
    <associate|bib-Gnewuch2022|<tuple|9|28>>
    <associate|bib-Hawkins1989|<tuple|10|28>>
    <associate|bib-Higgins1977|<tuple|11|28>>
    <associate|bib-IrrgeherLeobacher2015|<tuple|12|28>>
    <associate|bib-KimeldorfWahba1970|<tuple|13|28>>
    <associate|bib-NovakUllrich2018|<tuple|14|28>>
    <associate|bib-NovakWozniakowski2008|<tuple|15|28>>
    <associate|bib-OwhadiScovel2017|<tuple|16|28>>
    <associate|bib-Paulsen2016|<tuple|17|28>>
    <associate|bib-RahimiRecht2007|<tuple|18|29>>
    <associate|bib-RasmussenWilliams2006|<tuple|19|29>>
    <associate|bib-SolinSarkka2020|<tuple|20|29>>
    <associate|bib-Stein1999|<tuple|21|29>>
    <associate|bib-SteinwartScovel2012|<tuple|22|29>>
    <associate|bib-Szego1939|<tuple|23|29>>
    <associate|bib-VanTrees2001|<tuple|24|29>>
    <associate|bib-Wendland2005|<tuple|25|29>>
    <associate|bib-Wiener1949|<tuple|26|29>>
    <associate|bib-Xiu2010|<tuple|27|29>>
    <associate|bib-Zhu1998|<tuple|28|29>>
    <associate|bib-Zwickngaslc2009|<tuple|29|29>>
    <associate|eq:RKHS-fourier|<tuple|7|4>>
    <associate|eq:associated-laguerre|<tuple|43|11>>
    <associate|eq:cauch-laguerre-funcs|<tuple|66|20>>
    <associate|eq:cauchy-expansion-trig|<tuple|79|22>>
    <associate|eq:cauchy-kernel|<tuple|64|18>>
    <associate|eq:gaussian-basis|<tuple|84|23>>
    <associate|eq:gaussian-basis-intro|<tuple|22|7>>
    <associate|eq:gaussian-basis-mercer|<tuple|89|25>>
    <associate|eq:gaussian-expansion|<tuple|85|23>>
    <associate|eq:gaussian-kernel|<tuple|80|22>>
    <associate|eq:gaussian-kernel-truncated|<tuple|90|27>>
    <associate|eq:gaussian-mercer-expansion|<tuple|88|25>>
    <associate|eq:h-cauchy|<tuple|65|19>>
    <associate|eq:h-gaussian|<tuple|81|22>>
    <associate|eq:h-hat-matern|<tuple|28|8>>
    <associate|eq:h-matern|<tuple|29|8>>
    <associate|eq:hermite-function|<tuple|82|23>>
    <associate|eq:hermite-polynomial|<tuple|83|23>>
    <associate|eq:kernel-expansion-intro|<tuple|1|2>>
    <associate|eq:kernel-expansion-mercer|<tuple|11|5>>
    <associate|eq:laguerre-func-ft|<tuple|30|8>>
    <associate|eq:laguerre-inverse-ft|<tuple|31|8>>
    <associate|eq:laguerre-polynomial|<tuple|32|9>>
    <associate|eq:main-theorem-r-expansion|<tuple|4|4>>
    <associate|eq:matern-expansion|<tuple|38|10>>
    <associate|eq:matern-kernel-intro|<tuple|12|6>>
    <associate|eq:matern-laguerre-functions|<tuple|36|9>>
    <associate|eq:matern-simplification-positive|<tuple|50|13>>
    <associate|eq:matern-simplification-sign|<tuple|52|13>>
    <associate|eq:matern-truncation|<tuple|61|15>>
    <associate|eq:matern_laguerre_binomial_expression|<tuple|37|10>>
    <associate|eq:matern_laguerre_conjugate_symmetry|<tuple|35|9>>
    <associate|eq:matern_laguerre_functions|<tuple|34|9>>
    <associate|eq:mercer-integral-operator|<tuple|10|5>>
    <associate|eq:negative_matern_laguerre|<tuple|44|11>>
    <associate|eq:nullspace_functions|<tuple|4|16>>
    <associate|eq:phi-m-matern-non-negative|<tuple|33|9>>
    <associate|eq:psi-negative|<tuple|46|12>>
    <associate|eq:psi-null|<tuple|47|12>>
    <associate|eq:psi-positive|<tuple|45|12>>
    <associate|eq:real_cauchy_laguerre_explicit|<tuple|74|21>>
    <associate|eq:rho-kernel|<tuple|57|14>>
    <associate|eq:rho-kernels|<tuple|49|12>>
    <associate|eq:trig-cauchy-laguerre|<tuple|74|21>>
    <associate|example:null-space|<tuple|6|17>>
    <associate|fig:cauchy-basis|<tuple|5|21>>
    <associate|fig:cauchy-truncation|<tuple|6|22>>
    <associate|fig:gaussian-basis|<tuple|7|24>>
    <associate|fig:gaussian-truncation|<tuple|8|26>>
    <associate|fig:matern-non-null-space|<tuple|1|12>>
    <associate|fig:matern-null-space|<tuple|4|16>>
    <associate|fig:matern-rho-kernel|<tuple|2|14>>
    <associate|fig:matern-truncations|<tuple|3|15>>
    <associate|prop:gaussian-basis-L2|<tuple|8|26>>
    <associate|prop:gaussian-truncation-error|<tuple|9|27>>
    <associate|prop:matern-truncation-error|<tuple|4|15>>
    <associate|prop:matern_laguerre_L2|<tuple|3|13>>
    <associate|prop:matern_laguerre_bound|<tuple|2|10>>
    <associate|sec:cauchy|<tuple|4|18>>
    <associate|sec:cauchy-complex|<tuple|4.1|19>>
    <associate|sec:cauchy-real|<tuple|4.2|21>>
    <associate|sec:gaussian|<tuple|5|22>>
    <associate|sec:gaussian-expansion|<tuple|5.1|23>>
    <associate|sec:introduction|<tuple|1|2>>
    <associate|sec:laguerre-functions|<tuple|3.1|8>>
    <associate|sec:matern|<tuple|3|8>>
    <associate|sec:matern-classification|<tuple|3.3|11>>
    <associate|sec:matern-laguerre|<tuple|3.2|9>>
    <associate|sec:null-space|<tuple|3.5|16>>
    <associate|sec:summary|<tuple|2|6>>
    <associate|thm:main-theorem|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Wendland2005

      Stein1999

      RasmussenWilliams2006

      Paulsen2016

      OwhadiScovel2017

      Paulsen2016

      RahimiRecht2007

      SolinSarkka2020

      FasshauerMcCourt2012

      [

      Hawkins1989

      VanTrees2001

      Xiu2010

      FasshauerMcCourt2015

      [

      FasshauerMcCourt2015

      Zhu1998

      FasshauerMcCourt2015

      [

      Paulsen2016

      Zwickngaslc2009

      IrrgeherLeobacher2015

      NovakUllrich2018

      Wendland2005

      KimeldorfWahba1970

      Wendland2005

      Higgins1977

      Paulsen2016

      RasmussenWilliams2006

      SteinwartScovel2012

      NovakWozniakowski2008

      FasshauerHickernell2012

      Wendland2005

      Adler1990

      FasshauerMcCourt2015

      FasshauerMcCourt2015

      Wendland2005

      Wiener1949

      Higgins1977

      Wiener1949

      Bell2004

      Christov1982

      Szego1939

      Erdelyi1954

      AskeyWimp1984

      FasshauerMcCourt2015

      Zhu1998

      FasshauerMcCourt2015

      Gnewuch2022

      FasshauerMcCourt2012
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||The
      Matérn--Laguerre functions <with|mode|<quote|math>|\<psi\><rsub|m,\<nu\>><rsup|+>>
      in <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:psi-positive>)
      for <with|mode|<quote|math>|m=0,\<ldots\>,6>. Observe that the
      functions vanish on the negative real line.>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Translates
      <with|mode|<quote|math>|\<rho\><rsub|\<nu\>+1/2><around|(|\<cdummy\>,u|)>>
      of the kernel in <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:rho-kernel>)
      for <with|mode|<quote|math>|u\<in\><around|{|-2,-1.2,-0.4,0.4,1.2,2|}>>.
      Observe that each translate is supported on the axis that
      <with|mode|<quote|math>|u> lies on.>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||The truncation in
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:matern-truncation>)
      for two Matérn kernels. Because the second kernel argument has been
      fixed to a positive value, the truncations are exact on the negative
      real line by <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:matern-simplification-sign>).>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||The null-space
      Matérn--Laguerre functions <with|mode|<quote|math>|\<psi\><rsub|m,\<nu\>><rsup|0>>
      in <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:psi-null>)
      for <with|mode|<quote|math>|\<nu\>=2> and
      <with|mode|<quote|math>|\<nu\>=9>.>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|5>||The <error|compound
      rev> <with|mode|<quote|math>|\<alpha\><rsub|m>> and
      <with|mode|<quote|math>|\<beta\><rsub|m>> in
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:trig-cauchy-laguerre>).>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|6>||Truncations
      <with|mode|<quote|math>|<big|sum><rsub|m=0><rsup|n-1>\<alpha\><rsub|m><around|(|t|)>*\<alpha\><rsub|m><around|(|u|)>+<big|sum><rsub|m=0><rsup|n-1>\<beta\><rsub|m><around|(|t|)>*\<beta\><rsub|m><around|(|u|)>>
      of the Cauchy expansion in <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:cauchy-expansion-trig>).>|<pageref|auto-22>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7>||The first six basis
      functions <with|mode|<quote|math>|\<psi\><rsub|m>> in
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:gaussian-basis>)
      of the Gaussian kernel <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:gaussian-kernel>).>|<pageref|auto-25>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8>||The Gaussian kernel
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:gaussian-kernel>)
      with <with|mode|<quote|math>|u=0> and its truncated expansions in
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:gaussian-kernel-truncated>).
      For <with|mode|<quote|math>|n=3> and <with|mode|<quote|math>|n=11> the
      truncated kernels become negative.>|<pageref|auto-28>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Construction of orthonormal
      bases <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>On Mercer expansions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Summary
      of expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Matérn kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Cauchy kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Gaussian kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Expansions
      of Matérn kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Laguerre functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Matérn\ULaguerre functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Classification of
      Matérn\ULaguerre functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Truncation error
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|3.5<space|2spc>The null-space
      <with|mode|<quote|math>|<with|math-font|<quote|cal*>|M><rsub|\<nu\>><rsup|0>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Expansions
      of the Cauchy kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Expansion in complex-valued
      Cauchy\ULaguerre functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Expansion in real-valued
      Cauchy--Laguerre functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Expansion
      of the Gaussian kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Expansion for the Gaussian
      kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Mercer basis and Mehler's
      formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Truncation error
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>