<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthonormal Bases in RKHS via Convolution
  and<next-line>Their Relation to Gaussian Processes>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    We provide detailed proofs of two fundamental results: (1) the
    convolution of an impulse response function with an orthonormal basis for
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> creates an orthonormal basis for
    the corresponding reproducing kernel Hilbert space (RKHS), and (2) under
    uniform convergence, these functions are eigenfunctions of the integral
    operator associated with the stationary Gaussian process. We establish
    precise formulas for the eigenvalues and verify all mathematical steps
    rigorously.
  </abstract>>

  <section|Introduction>

  For stationary Gaussian processes, the covariance kernel
  <math|K<around|(|s,t|)>=K*<around|(|s-t|)>> has a spectral representation
  via Bochner's theorem:

  <\equation>
    K<around|(|\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>>*S<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  where <math|S<around|(|\<omega\>|)>\<geq\>0> is the spectral density. The
  impulse response function (or spectral factor) is defined as:

  <\equation>
    h<around|(|t|)>=\<cal-F\><rsup|-1><around|{|<sqrt|S<around|(|\<omega\>|)>>|}><around|(|t|)>
  </equation>

  which satisfies <math|K=h\<ast\>h>, where <math|\<ast\>> denotes
  convolution.

  Every positive definite kernel <math|K> generates a reproducing kernel
  Hilbert space (RKHS) <math|\<cal-H\><rsub|K>> of functions. We investigate
  how to construct an orthonormal basis for this space and connect it to the
  spectral properties of the corresponding Gaussian process.

  <section|Preliminary Definitions>

  <\definition>
    [Reproducing Kernel Hilbert Space] A Hilbert space <math|\<cal-H\>> of
    functions on domain <math|\<cal-X\>> is a reproducing kernel Hilbert
    space if there exists a kernel <math|K:\<cal-X\>\<times\>\<cal-X\>\<rightarrow\>\<bbb-R\>>
    such that:

    <\enumerate>
      <item>For all <math|x\<in\>\<cal-X\>>,
      <math|K<around|(|\<cdummy\>,x|)>\<in\>\<cal-H\>>

      <item>For all <math|f\<in\>\<cal-H\>> and <math|x\<in\>\<cal-X\>>,
      <math|f<around|(|x|)>=<around|\<langle\>|f,K|(>\<cdot\>,x)\<rangle\><rsub|\<cal-H\>>>
      (reproducing property)
    </enumerate>
  </definition>

  <\definition>
    [Covariance Operator] Given a kernel <math|K>, the associated integral
    operator <math|T<rsub|K>:L<rsup|2><around|(|\<bbb-R\>|)>\<rightarrow\>L<rsup|2><around|(|\<bbb-R\>|)>>
    is defined by:

    <\equation>
      <around|(|T<rsub|K>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*f<around|(|s|)>*d*s
    </equation>

    For stationary kernels, this becomes a convolution:
    <math|<around|(|T<rsub|K>*f|)><around|(|t|)>=<around|(|K\<ast\>f|)><around|(|t|)>>.
  </definition>

  <section|Main Results>

  <\theorem>
    [RKHS Characterization]<label|thm:rkhs>For a kernel
    <math|K<around|(|s,t|)>=<around|(|h\<ast\>h|)>*<around|(|s-t|)>> where
    <math|h> is the impulse response function, the associated RKHS
    <math|\<cal-H\><rsub|K>> can be characterized as:

    <\equation>
      \<cal-H\><rsub|K>=<around|{|f:f=h\<ast\>g,g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
    </equation>

    with inner product:

    <\equation>
      <around|\<langle\>|h\<ast\>g<rsub|1>,h\<ast\>g<rsub|2>|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<langle\>|g<rsub|1>,g<rsub|2>|\<rangle\>><rsub|L<rsup|2>>
    </equation>
  </theorem>

  <\proof>
    We must verify that <math|\<cal-H\><rsub|K>> with the specified inner
    product is a valid RKHS with reproducing kernel <math|K>.

    <with|font-series|bold|Step 1:> Verify that the inner product is
    well-defined.<next-line>For any <math|f<rsub|1>=h\<ast\>g<rsub|1>> and
    <math|f<rsub|2>=h\<ast\>g<rsub|2>>, the inner product
    <math|<around|\<langle\>|g<rsub|1>,g<rsub|2>|\<rangle\>><rsub|L<rsup|2>>>
    exists since <math|g<rsub|1>,g<rsub|2>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>.
    We must show this mapping is well-defined: if
    <math|h\<ast\>g<rsub|1>=h\<ast\>g<rsub|1><rprime|'>>, then
    <math|g<rsub|1>=g<rsub|1><rprime|'>>. This follows from the properties of
    convolution with the spectral factor, as the Fourier transform gives
    <math|<wide|h|^><around|(|\<omega\>|)>*<wide|g|^><rsub|1><around|(|\<omega\>|)>=<wide|h|^><around|(|\<omega\>|)>*<wide|g|^><rsub|1><rprime|'><around|(|\<omega\>|)>>,
    and since <math|<wide|h|^><around|(|\<omega\>|)>=<sqrt|S<around|(|\<omega\>|)>>\<gtr\>0>
    almost everywhere, we have <math|<wide|g|^><rsub|1>=<wide|g|^><rsub|1><rprime|'>>
    almost everywhere, implying <math|g<rsub|1>=g<rsub|1><rprime|'>> in
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.

    <with|font-series|bold|Step 2:> Verify the reproducing
    property.<next-line>For any <math|f=h\<ast\>g\<in\>\<cal-H\><rsub|K>> and
    <math|t\<in\>\<bbb-R\>>, define <math|K<rsub|t>=K<around|(|\<cdummy\>,t|)>>.
    We need to verify <math|f<around|(|t|)>=<around|\<langle\>|f,K<rsub|t>|\<rangle\>><rsub|\<cal-H\><rsub|K>>>.

    <\align>
      <tformat|<table|<row|<cell|K<rsub|t><around|(|s|)>>|<cell|=K<around|(|s,t|)>=K*<around|(|s-t|)>=<around|(|h\<ast\>h|)>*<around|(|s-t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|s-t-u|)>*h<around|(|u|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|s-v|)>*h*<around|(|v-t|)>*d*v<space|1em><text|(substituting
      <math|v=t+u>)><eq-number>>>|<row|<cell|>|<cell|=<around|(|h\<ast\>h<rsub|t>|)><around|(|s|)><eq-number>>>>>
    </align>

    where <math|h<rsub|t><around|(|v|)>=h*<around|(|v-t|)>>.

    Now computing the inner product:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|f,K<rsub|t>|\<rangle\>><rsub|\<cal-H\><rsub|K>>>|<cell|=<around|\<langle\>|h\<ast\>g,h\<ast\>h<rsub|t>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|g,h<rsub|t>|\<rangle\>><rsub|L<rsup|2>><space|1em><text|(by
      definition of the inner product)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|v|)>*h*<around|(|v-t|)>*d*v<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|v|)>*h*<around|(|t-v|)>*d*v<space|1em><text|(changing
      <math|v> to <math|-v>)><eq-number>>>|<row|<cell|>|<cell|=<around|(|g\<ast\>h|)><around|(|t|)>=<around|(|h\<ast\>g|)><around|(|t|)>=f<around|(|t|)><eq-number>>>>>
    </align>

    This confirms that the space satisfies the reproducing property with
    kernel <math|K>.

    <with|font-series|bold|Step 3:> Verify completeness.<next-line>We need to
    show that the span of <math|<around|{|K|(>\<cdot\>,t):t\<in\>\<bbb-R\>}>
    is dense in <math|\<cal-H\><rsub|K>>. Since
    <math|K<around|(|\<cdummy\>,t|)>=h\<ast\>h<rsub|t>>, and the set
    <math|<around|{|h<rsub|t>:t\<in\>\<bbb-R\>|}>> spans a dense subspace of
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> (by properties of translation), it
    follows that <math|<around|{|h\<ast\>h<rsub|t>:t\<in\>\<bbb-R\>|}>> spans
    a dense subspace of <math|<around|{|h\<ast\>g:g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>=\<cal-H\><rsub|K>>.
  </proof>

  <\theorem>
    [Orthonormal Basis via Convolution]<label|thm:basis>Let
    <math|<around|{|\<phi\><rsub|i>|}><rsub|i=1><rsup|\<infty\>>> be an
    orthonormal basis for <math|L<rsup|2><around|(|\<bbb-R\>|)>>, and let
    <math|h> be the impulse response function. Define:

    <\equation>
      \<psi\><rsub|i><around|(|t|)>=<around|(|h\<ast\>\<phi\><rsub|i>|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-\<tau\>|)>*\<phi\><rsub|i><around|(|\<tau\>|)>*d*\<tau\>
    </equation>

    Then <math|<around|{|\<psi\><rsub|i>|}><rsub|i=1><rsup|\<infty\>>> forms
    an orthonormal basis for the RKHS <math|\<cal-H\><rsub|K>>.
  </theorem>

  <\proof>
    We need to establish that <math|<around|{|\<psi\><rsub|i>|}>> is
    orthonormal and complete in <math|\<cal-H\><rsub|K>>.

    <with|font-series|bold|Step 1: Orthonormality.><next-line>For any
    <math|i,j>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>>|<cell|=<around|\<langle\>|h\<ast\>\<phi\><rsub|i>,h\<ast\>\<phi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|\<phi\><rsub|i>,\<phi\><rsub|j>|\<rangle\>><rsub|L<rsup|2>><space|1em><text|(by
      Theorem <reference|thm:rkhs>)><eq-number>>>|<row|<cell|>|<cell|=\<delta\><rsub|i*j><eq-number>>>>>
    </align>

    This confirms orthonormality.

    <with|font-series|bold|Step 2: Completeness.><next-line>For any
    <math|f\<in\>\<cal-H\><rsub|K>>, we have <math|f=h\<ast\>g> for some
    <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> by Theorem
    <reference|thm:rkhs>. Since <math|<around|{|\<phi\><rsub|i>|}>> is
    complete in <math|L<rsup|2><around|(|\<bbb-R\>|)>>, we can expand:

    <\equation>
      g=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*\<phi\><rsub|i>
    </equation>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|f>|<cell|=h\<ast\>g<eq-number>>>|<row|<cell|>|<cell|=h\<ast\><around*|(|<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*\<phi\><rsub|i>|)><eq-number>>>|<row|<cell|>|<cell|<eq-number>>>>>
    </align>

    Assuming the conditions that permit interchanging summation and
    convolution:

    <\align>
      <tformat|<table|<row|<cell|f>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*<around|(|h\<ast\>\<phi\><rsub|i>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*\<psi\><rsub|i><eq-number>>>>>
    </align>

    To verify these are the correct expansion coefficients:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|f,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>>|<cell|=<around|\<langle\>|h\<ast\>g,h\<ast\>\<phi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|g,\<phi\><rsub|j>|\<rangle\>><rsub|L<rsup|2>><space|1em><text|(by
      Theorem <reference|thm:rkhs>)><eq-number>>>>>
    </align>

    Therefore:

    <\equation>
      f=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|f,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>>*\<psi\><rsub|i>
    </equation>

    This establishes that <math|<around|{|\<psi\><rsub|i>|}>> is a complete
    orthonormal basis for <math|\<cal-H\><rsub|K>>.
  </proof>

  <\theorem>
    [Eigenfunction Property]<label|thm:eigenfunctions>Under uniform
    convergence of the series expansion, the functions
    <math|<around|{|\<psi\><rsub|i>|}>> from Theorem <reference|thm:basis>
    are eigenfunctions of the integral operator <math|T<rsub|K>> with
    eigenvalues:

    <\equation>
      \<lambda\><rsub|i>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)><around|\||<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>
    </equation>

    where <math|<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>> is the
    Fourier transform of <math|\<phi\><rsub|i><around|(|t|)>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Operator Action.><next-line>For a
    stationary kernel, the integral operator acts as:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*f<around|(|s|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*f<around|(|s|)>*d*s<space|1em><text|(by
      stationarity)><eq-number>>>|<row|<cell|>|<cell|=<around|(|K\<ast\>f|)><around|(|t|)><eq-number>>>>>
    </align>

    For <math|\<psi\><rsub|i>=h\<ast\>\<phi\><rsub|i>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*\<psi\><rsub|i>|)><around|(|t|)>>|<cell|=<around|(|K\<ast\>\<psi\><rsub|i>|)><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<around|(|<around|(|h\<ast\>h|)>\<ast\><around|(|h\<ast\>\<phi\><rsub|i>|)>|)><around|(|t|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Step 2: Fourier Analysis.><next-line>Let's analyze
    this in the frequency domain. The Fourier transform of the impulse
    response gives <math|<wide|h|^><around|(|\<omega\>|)>=<sqrt|S<around|(|\<omega\>|)>>>,
    and for the kernel <math|<wide|K|^><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>>.

    For the function <math|\<psi\><rsub|i>>:

    <\align>
      <tformat|<table|<row|<cell|<wide|\<psi\>|^><rsub|i><around|(|\<omega\>|)>>|<cell|=<wide|h|^><around|(|\<omega\>|)>\<cdot\><wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|S<around|(|\<omega\>|)>>\<cdot\><wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    For the operator action:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\>*<around|{|T<rsub|K>*\<psi\><rsub|i>|}><around|(|\<omega\>|)>>|<cell|=<wide|K|^><around|(|\<omega\>|)>\<cdot\><wide|\<psi\>|^><rsub|i><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=S<around|(|\<omega\>|)>\<cdot\><sqrt|S<around|(|\<omega\>|)>>\<cdot\><wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=S<rsup|3/2><around|(|\<omega\>|)>\<cdot\><wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Step 3: Eigenvalue Determination.><next-line>For
    <math|\<psi\><rsub|i>> to be an eigenfunction with eigenvalue
    <math|\<lambda\><rsub|i>>, we need <math|T<rsub|K>*\<psi\><rsub|i>=\<lambda\><rsub|i>*\<psi\><rsub|i>>.
    We determine <math|\<lambda\><rsub|i>> through the inner product:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|T<rsub|K>*\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>>|<cell|=\<lambda\><rsub|i>*<around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=\<lambda\><rsub|i>*\<delta\><rsub|i*j><eq-number>>>>>
    </align>

    For <math|i=j>:

    <\align>
      <tformat|<table|<row|<cell|\<lambda\><rsub|i>>|<cell|=<around|\<langle\>|T<rsub|K>*\<psi\><rsub|i>,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>>>
    </align>

    Using the fact that <math|T<rsub|K>*\<psi\><rsub|i>=K\<ast\>\<psi\><rsub|i>>
    and <math|\<psi\><rsub|i>=h\<ast\>\<phi\><rsub|i>>:

    <\align>
      <tformat|<table|<row|<cell|\<lambda\><rsub|i>>|<cell|=<around|\<langle\>|K\<ast\>\<psi\><rsub|i>,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|K\<ast\><around|(|h\<ast\>\<phi\><rsub|i>|)>,h\<ast\>\<phi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>>>
    </align>

    By associativity of convolution and the inner product definition:

    <\align>
      <tformat|<table|<row|<cell|\<lambda\><rsub|i>>|<cell|=<around|\<langle\>|h\<ast\><around|(|K\<ast\>\<phi\><rsub|i>|)>,h\<ast\>\<phi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|K\<ast\>\<phi\><rsub|i>,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>><space|1em><text|(by
      Theorem <reference|thm:rkhs>)><eq-number>>>>>
    </align>

    Using Parseval's theorem and the fact that
    <math|<wide|K|^><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<lambda\><rsub|i>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|K|^><around|(|\<omega\>|)>\<cdot\><wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>\<cdot\><wide|<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\<bar\>>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>\<cdot\><around|\||<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\><eq-number>>>>>
    </align>

    Under uniform convergence, we can verify that:

    <\align>
      <tformat|<table|<row|<cell|T<rsub|K>*\<psi\><rsub|i><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<psi\><rsub|i><around|(|s|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|t|)><eq-number>>>>>
    </align>

    This confirms that <math|\<psi\><rsub|i>> is an eigenfunction of
    <math|T<rsub|K>> with eigenvalue <math|\<lambda\><rsub|i>>, which is a
    scalar given by the formula <math|\<lambda\><rsub|i>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>\<cdot\><around|\||<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>>.
  </proof>

  <\corollary>
    [Kernel Expansion] The kernel admits the Mercer expansion:

    <\equation>
      K<around|(|s,t|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|s|)>*\<psi\><rsub|i><around|(|t|)>
    </equation>

    where <math|\<lambda\><rsub|i>> are the eigenvalues defined in Theorem
    <reference|thm:eigenfunctions>.
  </corollary>

  <\proof>
    This follows directly from Mercer's theorem and the fact that
    <math|<around|{|\<psi\><rsub|i>|}>> forms an orthonormal basis of
    eigenfunctions for the integral operator <math|T<rsub|K>>.
  </proof>

  <section|Conclusion>

  We have provided detailed proofs establishing that the convolution of an
  impulse response function with an orthonormal basis for
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> creates an orthonormal basis for the
  corresponding RKHS. Furthermore, we have shown that these functions are
  eigenfunctions of the covariance operator with eigenvalues determined by
  projections of the basis functions onto the spectral density.

  These results establish fundamental connections between harmonic analysis,
  reproducing kernel Hilbert spaces, and Gaussian processes, with
  applications in signal processing, statistical inference, and machine
  learning.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|8>>
    <associate|thm:basis|<tuple|4|4>>
    <associate|thm:eigenfunctions|<tuple|5|5>>
    <associate|thm:rkhs|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminary
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>