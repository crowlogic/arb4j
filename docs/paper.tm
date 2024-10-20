<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|Mercer Expansions for Translation-Invariant
  Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|An extension of the method for deriving
  orthonormal expansions for kernels <math|K<around*|(|t-s|)>> of
  translation-invariant \ Gaussian processes detailed by Tronarp and
  Karvonen<cite|orthonormalExpansionsForTranslationInvariantKernels> is
  derived by showing selecting the orthonormal base of <math|L<rsup|2>> to be
  such that <math|K<around*|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<varphi\><rsub|m><around|(|t-s|)>>
  converges uniformly. That is, instead of just choosing any orthnormal basis
  of <math|L<rsup|2>>, a basis whose partial sums uniformly converge to the
  kernel itself is constructed.>>

  \;

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

    <with|par-left|1tab|2.1<space|2spc>Gaussian kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Expansion
    of the Gaussian kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:introduction>

  <cite|orthonormalExpansionsForTranslationInvariantKernels>Let
  <math|\<Omega\>> be a vector space.

  <\definition>
    \ A symmetric positive-semidefinite kernel
    <math|r:\<Omega\>\<times\>\<Omega\>\<to\>\<bbb-R\>> is
    <em|translation-invariant> if <math|r<around|(|t,u|)>=K<around|(|t-u|)>>
    for some <math|K:\<Omega\>\<to\>\<bbb-R\>> and
    \<forall\><math|t,u\<in\>\<Omega\>>.\ 
  </definition>

  Each positive-semidefinite kernel induces a unique reproducing kernel
  Hilbert space (RKHS), <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>>,
  which is equipped with an inner product
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|r>> and the
  associated norm <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>><rsub|r>>
  <cite|Paulsen2016>. Any kernel that induces a seperable
  infinite-dimensional RKHS <math|<with|math-font|cal*|H><rsub|r><around|(|\<Omega\>|)>>
  has an orthonormal basis <math|<around|{|\<psi\><rsub|m>|}><rsub|m\<in\>I>>
  for some countably infinite index set <math|I> (e.g., <math|I=\<bbb-N\>>)
  and that the kernel admits the pointwise convergent orthonormal expansion

  <\equation>
    <label|eq:kernel-expansion-intro>r<around|(|t,u|)>=<big|sum><rsub|m\<in\>I>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>*<space|1em>\<forall\>t,u\<in\>\<Omega\>
  </equation>

  where <math|z<rsup|\<ast\>>> denotes the complex conjugate
  of<math|z\<in\>C> If <math|\<Omega\>> is a compact subset of
  <math|\<bbb-R\><rsup|d>> and <math|r> is continuous, the
  expansion<nbsp><eqref|eq:kernel-expansion-intro> converges
  uniformly<cite|Paulsen2016>.<space|1em>

  <subsection|Construction of orthonormal bases>

  Let <math|<around*|\||z|\|>> denote the modulus of <math|z\<in\>\<bbb-C\>>
  and recall that <math|z<rsup|\<ast\>>> is the complex conjugate. The spaces
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> and
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>
  consist of all square-integrable functions
  <math|f:\<bbb-R\>\<to\>\<bbb-C\>> and are equipped with the inner products

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t
  </equation>

  and

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t|2*\<pi\>>*
  </equation>

  The Fourier transform and the corresponding inverse transform for any
  integrable or square-integrable function <math|f> are defined as

  <\equation>
    <wide|f|^><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*e<rsup|-i*\<omega\>*t>\<mathd\>t
  </equation>

  and

  <\equation>
    f<around|(|t|)>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>|2*\<pi\>>*
  </equation>

  The Fourier transform defines an isometry between
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> and
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,1/2*\<pi\>|)>> via
  the Plancherel theorem

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsup|\<ast\>><space|-0.17em><around|(|t|)>*g<around|(|t|)>\<mathd\>t=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>\<mathd\>\<omega\>|2*\<pi\>>*
  </equation>

  The functions <math|f> and <math|<wide|f|^>> are referred to as the
  spatiotemporal and spectral representations, respectively. The
  <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>>-orthonormal
  expansions are derived from the following rather straight-forward theorem.
  Let <math|I> be a countably infinite index set, typically either
  <math|\<bbb-N\>> or <math|\<bbb-Z\>>.

  <\theorem>
    <samp|[Construction of orthonormal bases]<label|thm:main-theorem> >Let
    the translation-invariant symmetric positive-definite kernel kernel
    <math|K\<in\>C<around|(|\<bbb-R\>|)>\<cap\><with|math-font|cal*|L><rsub|1><around|(|\<bbb-R\>|)>>
    be\ 

    <\equation>
      r<around|(|t,u|)>=K*<around|(|t-u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around*|(|\<omega\>|)>e<rsup|i
      \<omega\>h >\<mathd\>h
    </equation>

    where its corresponding spectral density is\ 

    <\equation>
      S<around*|(|\<omega\>|)>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|x|)>e<rsup|-i
      \<omega\>x >\<mathd\>h|2 \<pi\>>
    </equation>

    and <math|<around|{|\<varphi\><rsub|m>|}><rsub|m\<in\>I>> \ 

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<varphi\><rsub|m><around*|(|x|)>\<varphi\><rsub|n><around*|(|x|)>\<mathd\>x=\<delta\><rsub|n,m>=<choice|<tformat|<table|<row|<cell|1>|<cell|m=n>>|<row|<cell|0>|<cell|m\<neq\>n>>>>>
    </equation>

    is an orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>.
    Now, let

    <\equation>
      h<around*|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around*|(|\<omega\>|)>>e<rsup|i
      \<omega\>h >\<mathd\>h
    </equation>

    \ be the Fourier transform of the square root of the spectral density

    <\equation>
      <wide|h|^><around|(|\<omega\>|)>=<sqrt|S<around|(|\<omega\>|)>>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around*|(|x|)>e<rsup|-i
      \<omega\>x >\<mathd\>x|2 \<pi\>>
    </equation>

    Then the convolutions of the orthonormal basis
    <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> with
    <math|h>

    <\equation>
      \<psi\><rsub|m><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*\<varphi\><rsub|m><around|(|\<tau\>|)>\<mathd\>\<tau\>*
    </equation>

    form an orthonormal basis of <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>>
    and the kernel <math|r> has the pointwise convergent expansion

    <\equation>
      <label|eq:main-theorem-r-expansion>r<around|(|t,u|)>=<big|sum><rsub|m\<in\>I>\<psi\><rsub|m><rsup|\<ast\>><around|(|t|)>*\<psi\><rsub|m><around|(|u|)>*<space|1em>\<forall\>t,u\<in\>\<bbb-R\>
    </equation>
  </theorem>

  <\proof>
    The fact that <math|r<around*|(|\<nosymbol\>\<cdummy\>\<nocomma\>\<comma\>\<cdummy\>|)>>
    is symmetric positive-definite implies that the spectral density
    <math|S<around*|(|\<omega\>|)>> is real-valued and
    positive<nbsp><cite-detail|Wendland2005|Theorem<nbsp>6.11> therefore the
    convolution theorem yields\ 

    <\equation>
      <wide|\<cal-H\>*f|^><around|(|\<omega\>|)>=<wide|h|^><around|(|\<omega\>|)>*<wide|f|^><around|(|\<omega\>|)>
    </equation>

    <math|\<forall\>h> such that\ 

    <\equation>
      <around*|\||<wide|h|^><around|(|\<omega\>|)>|\|>=<sqrt|S<around|(|\<omega\>|)>>\<gtr\>0\<forall\>\<omega\>\<in\>\<bbb-R\>
    </equation>

    \ 

    where the convolution operator <math|\<cal-H\>:<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>\<to\><with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>
    is defined via

    <\equation>
      <around|(|\<cal-H\>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*f<around|(|\<tau\>|)>\<mathd\>\<tau\>*<space|1em><text|\<forall\>>t\<in\>\<bbb-R\>
    </equation>

    \;

    By the standard characterisation (see<nbsp><cite|KimeldorfWahba1970>
    or<nbsp><cite-detail|Wendland2005|Theorem<nbsp>10.12>) of the RKHS of a
    translation-invariant kernel,

    <\equation>
      <label|eq:RKHS-fourier><around|\<langle\>|f,g|\<rangle\>><rsub|r>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>|<wide|\<Phi\>|^><around|(|\<omega\>|)>>\<mathd\>\<omega\>|2*\<pi\>>**<space|1em>\<forall\>f,g\<in\><with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>
    </equation>

    For any <math|f,g\<in\><with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>
    the convolution theorem and Plancherel theorem thus give

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<cal-H\>*f,\<cal-H\>*g|\<rangle\>><rsub|r>>|<cell|=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<around*|\||<wide|h|^><around|(|\<omega\>|)>|\|><rsup|2><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>|<wide|\<Phi\>|^><around|(|\<omega\>|)>>\<mathd\>\<omega\>|2*\<pi\>>*>>|<row|<cell|>|<cell|=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><rsup|\<ast\>><space|-0.17em><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>\<mathd\>\<omega\>|2*\<pi\>>*>>|<row|<cell|>|<cell|=<around|\<langle\>|f,g|\<rangle\>><rsub|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>>>>>>
    </equation>

    which shows that <math|\<cal-H\>> is an isometry between
    <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> and
    <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>>. It follows
    from<nbsp><eqref|eq:RKHS-fourier> that the inverse Fourier transform

    <\equation>
      <around|(|\<cal-H\><rsup|-1>*f|)><around|(|t|)>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<wide|f|^><around|(|\<omega\>|)>|<wide|h|^><around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>\<mathd\>\<omega\>|2*\<pi\>>**<space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    defines the inverse of <math|\<cal-H\>>. Therefore <math|\<cal-H\>> and
    its inverse are constitute an isometric isomorphism and thus maps
    orthonormal basis of <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>>
    and <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>> to each
    other. <cite-detail|Higgins1977|Section<nbsp>2.6> Therefore, the kernel
    has a pointwise convergent expansion of the
    form<nbsp><eqref|eq:main-theorem-r-expansion> for every orthonormal basis
    of <math|<with|math-font|cal*|H><rsub|r><around|(|\<bbb-R\>|)>><nbsp><cite|Paulsen2016>
  </proof>

  To obtain the spatiotemporal basis functions <math|\<psi\><rsub|m>> using
  <localize|Theorem><nbsp><reference|thm:main-theorem> either the convolution
  <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>\<varphi\><rsub|m><around*|(|\<tau\>|)>\<mathd\>\<tau\>>
  or the inverse Fourier transform of <math|<wide|h|^><around|(|\<omega\>|)>*<wide|\<varphi\>|^><rsub|m><around|(|\<omega\>|)>>
  has to be computed. It is therefore necessary to select a basis of
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>|)>> for which
  either of these operations can be done in closed form.\ 

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
  operator<nbsp><eqref|eq:mercer-integral-operator> can be rather involved.
  <strong|What makes <localize|Theorem><nbsp><reference|thm:main-theorem>
  convenient is therefore that it does <em|not> require that the expansion be
  Mercer for some weight.> However, identifying a weight <math|w> for which
  the basis function <math|\<psi\><rsub|m>> constructed via
  <localize|Theorem><nbsp><reference|thm:main-theorem> are
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w|)>>-orthogonal
  shows that the expansion is Mercer because the
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w|)>>-normalised
  versions of <math|\<psi\><rsub|m>> are the eigenfunctions of
  <math|\<cal-T\><rsub|r,w>>. <section|Summary of
  expansions><label|sec:summary>

  This section summarises the expansions that we derive using
  <localize|Theorem><nbsp><reference|thm:main-theorem>. Each expansion
  converges pointwise for all <math|t,u\<in\>\<bbb-R\>>. All expansions are
  for kernels with unit scaling. Expansions of arbitrary scalings,
  <math|\<lambda\>>, may be obtained by considering the kernel
  <math|r<around|(|\<lambda\>*t,\<lambda\>*u|)>>, for which the corresponding
  basis functions are <math|\<psi\><rsub|m>*<around|(|\<lambda\>*t|)>>.

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

  for all <math|t,u\<in\>\<bbb-R\>>. This expansion is a special case of the
  well-known Mercer expansion of the Gaussian
  kernel<nbsp><cite-detail|FasshauerMcCourt2015|Section<nbsp>12.2.1>. The
  basis functions<nbsp><eqref|eq:gaussian-basis-intro> are orthogonal in
  <math|<with|math-font|cal*|L><rsub|2><around|(|\<bbb-R\>,w<rsub|\<alpha\>>|)>>
  for the weight function

  <\equation>
    w<rsub|\<alpha\>><around|(|t|)>=<frac|\<alpha\>|<sqrt|\<pi\>>>**e<rsup|-\<alpha\><rsup|2>*t<rsup|2>>
  </equation>

  \;

  \ with

  <\equation>
    \<alpha\>=<sqrt|<frac|<smash|[>b]2|3>>
  </equation>

  <section|Expansion of the Gaussian kernel><label|sec:gaussian>

  The Gaussian kernel and its Fourier transform are

  <\equation>
    <label|eq:gaussian-kernel>r<around|(|t,u|)>=e<rsup|-<frac|<around|(|t-u|)><rsup|2>|2>*>*<space|1em><text|and
    ><space|1em>S<around|(|\<omega\>|)>=<sqrt|2*\<pi\>>*<space|0.17em>e<rsup|-<frac|\<omega\><rsup|2>|2>>
  </equation>

  A square-root is

  <\equation>
    <wide|h|^><around|(|\<omega\>|)>=<sqrt|S<around*|(|\<omega\>|)>>=<around|(|2*\<pi\>|)><rsup|1/4>*e<rsup|-<frac|\<omega\><rsup|2>|4>>
  </equation>

  so that taking the inverse Fourier transform gives the function <math|h> in
  <localize|Theorem><nbsp><reference|thm:main-theorem> as

  <\equation>
    <label|eq:h-gaussian>h<around|(|t|)>=2<rsup|1/4>*\<pi\><rsup|-1/4>*e<rsup|-t<rsup|2>>
  </equation>

  \;
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|4>>
    <associate|auto-4|<tuple|2|5>>
    <associate|auto-5|<tuple|2.1|5>>
    <associate|auto-6|<tuple|3|6>>
    <associate|eq:RKHS-fourier|<tuple|17|4>>
    <associate|eq:gaussian-basis-intro|<tuple|24|6>>
    <associate|eq:gaussian-kernel|<tuple|28|6>>
    <associate|eq:h-gaussian|<tuple|30|6>>
    <associate|eq:kernel-expansion-intro|<tuple|1|1>>
    <associate|eq:kernel-expansion-mercer|<tuple|22|5>>
    <associate|eq:main-theorem-r-expansion|<tuple|13|3>>
    <associate|eq:mercer-integral-operator|<tuple|21|5>>
    <associate|sec:gaussian|<tuple|3|6>>
    <associate|sec:introduction|<tuple|1|1>>
    <associate|sec:summary|<tuple|2|5>>
    <associate|thm:main-theorem|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      orthonormalExpansionsForTranslationInvariantKernels

      orthonormalExpansionsForTranslationInvariantKernels

      Paulsen2016

      Paulsen2016

      Wendland2005

      KimeldorfWahba1970

      Wendland2005

      Higgins1977

      Paulsen2016

      SteinwartScovel2012

      NovakWozniakowski2008

      FasshauerHickernell2012

      Wendland2005

      Adler1990

      FasshauerMcCourt2015
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

      <with|par-left|<quote|1tab>|2.1<space|2spc>Gaussian kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Expansion
      of the Gaussian kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>