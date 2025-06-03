<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|R|<macro|<math|\<bbb-R\>>>>

    <assign|Hilbert|<macro|<with|math-font|cal*|H>>>

    <assign|sinc|<macro|<math-up|sinc>>>

    <assign|E|<macro|\<bbb-E\>>>

    <assign|Var|<macro|<math-up|Var>>>

    <assign|Cov|<macro|<math-up|Cov>>>

    <assign|FT|<macro|\<cal-F\>>>

    <assign|norm|<macro|1|\<lVert\><arg|1> \<rVert\>>>

    <assign|inner|<macro|1|2|\<langle\><arg|1>, <arg|2> \<rangle\>>>

    \;
  </hide-preamble>

  <doc-data|<doc-title|Spectral Theory of Oscillatory Non-Stationary
  Processes and RKHS Framework>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction
    and Fundamental Concepts> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Priestley's
    Theory of Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Reproducing
    Kernel Hilbert Spaces for Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Bandlimited
    Processes and the Sinc Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Frame
    Theory and Analysis-Synthesis Operators>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Continuous
    Frames and Integral Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Deterministic-Stochastic
    Duality for Fixed Sample Paths> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Computational
    Implementation and Discretization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Applications
    to Accelerometer Data and Physical Interpretation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction and Fundamental Concepts>

  <\definition>
    [Stochastic Process] A stochastic process
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>T>> on a probability space
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is a collection of
    random variables indexed by <math|t\<in\>T\<subseteq\><R>>, where for
    each <math|\<omega\>\<in\>\<Omega\>>, the function
    <math|t\<mapsto\>X<around|(|t,\<omega\>|)>> is called a sample path or
    realization.
  </definition>

  <\definition>
    [Spectral Measure] For a second-order stationary process
    <math|<around|{|X<around|(|t|)>|}>>, the spectral measure <math|\<mu\>>
    is a finite, non-negative measure on <math|<R>> such that the covariance
    function admits the representation:

    <\equation>
      R<around|(|s,t|)>=\<bbb-E\><around*|[|X<around|(|s|)>,X<around|(|t|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    The spectral measure is deterministic and characterizes the second-order
    properties of the entire process.
  </definition>

  <\definition>
    [Random Measure] Let <math|d*Z<around|(|\<omega\>|)>> be a
    complex-valued, orthogonal increment process on <math|\<bbb-R\>>
    satisfying:

    <\enumerate>
      <item><math|\<bbb-E\><around|[|d*Z<around|(|\<omega\>|)>|]>=0> for all
      <math|\<omega\>>

      <item><math|\<bbb-E\><around|[|d*Z<around|(|\<omega\><rsub|1>|)><wide|d*Z<around|(|\<omega\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<mu\><around|(|\<omega\><rsub|1>|)>>

      <item>For disjoint intervals <math|I<rsub|1>,I<rsub|2>>:
      <math|\<bbb-E\><around|[|Z<around|(|I<rsub|1>|)><wide|Z<around|(|I<rsub|2>|)>|\<bar\>>|]>=0>
    </enumerate>

    This random measure <math|d*Z<around|(|\<omega\>|)>> varies between
    sample paths and uniquely determines each realization.
  </definition>

  <\theorem>
    [Spectral Representation Theorem] Every second-order stationary process
    <math|<around|{|X<around|(|t|)>|}>> admits the representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|d*Z<around|(|\<omega\>|)>> is the random measure and the
    integral converges in mean-square.
  </theorem>

  <\proof>
    Let <math|<around|{|e<rsub|n>|}>> be an orthonormal basis for
    <math|L<rsup|2><around|(|\<mu\>|)>>. Define\ 

    <\equation>
      Z<rsub|n>=<around*|\<langle\>|X,e<rsub|n>|\<rangle\>><rsub|L<rsup|2><around|(|\<bbb-P\>|)>>
    </equation>

    Then:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>>Z<rsub|n>*e<rsub|n><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>>Z<rsub|n>*<big|int><rsub|\<bbb-R\>>e<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t><around*|(|<big|sum><rsub|n=1><rsup|\<infty\>>Z<rsub|n>*e<rsub|n><around|(|\<omega\>|)>|)>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where

    <\equation>
      d*Z<around|(|\<omega\>|)>=<around*|(|<big|sum>Z<rsub|n>*e<rsub|n><around|(|\<omega\>|)>|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    defines the random measure.
  </proof>

  <section|Priestley's Theory of Oscillatory Processes>

  <\definition>
    [Oscillatory Function] A function <math|\<phi\><rsub|t><around|(|\<omega\>|)>:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>>
    is oscillatory if it can be written as:

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>t>
    </equation>

    where <math|A<rsub|t><around|(|\<omega\>|)>> is a quadratically
    integrable gain-function.\ 
  </definition>

  <\definition>
    [Oscillatory Process] A stochastic process
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> is oscillatory
    if there exists a family of oscillatory functions
    <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>> and a random
    measure <math|d*Z<around|(|\<omega\>|)>> such that:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where the integral converges in mean-square for each <math|t>.
  </definition>

  <\theorem>
    [Evolutionary Spectrum] For an oscillatory process with slowly varying
    amplitude <math|A<rsub|t><around|(|\<omega\>|)>>, the evolutionary power
    spectrum is defined by:

    <\equation>
      d*H<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    where <math|\<mu\>> is the spectral measure of the random measure
    <math|d*Z<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    The second moment of the process at time <math|t> is:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>\<bbb-E\><around|[|<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>d*H<rsub|t><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    The evolutionary spectrum <math|d*H<rsub|t><around|(|\<omega\>|)>> thus
    captures the time-varying spectral content.
  </proof>

  <section|Reproducing Kernel Hilbert Spaces for Stochastic Processes>

  <\definition>
    [RKHS] A Hilbert space <math|\<bbb-H\>> of functions
    <math|f:\<Omega\>\<to\>\<bbb-C\>> is a reproducing kernel Hilbert space
    if there exists a function <math|K:\<Omega\>\<times\>\<Omega\>\<to\>\<bbb-C\>>
    (the reproducing kernel) such that:

    <\enumerate>
      <item>For each <math|x\<in\>\<Omega\>>,
      <math|K<around|(|\<cdummy\>,x|)>\<in\>\<bbb-H\>>

      <item>For all <math|f\<in\>\<bbb-H\>> and <math|x\<in\>\<Omega\>>:
      <math|f<around|(|x|)>=<around*|\<langle\>|f,K<around|(|\<cdummy\>,x|)>|\<rangle\>><rsub|\<bbb-H\>>>
      (reproducing property)
    </enumerate>
  </definition>

  <\theorem>
    [Moore-Aronszajn Theorem] Every positive definite kernel
    <math|K:\<Omega\>\<times\>\<Omega\>\<to\>\<bbb-C\>> uniquely determines
    an RKHS <math|\<bbb-H\><rsub|K>> with reproducing kernel <math|K>.
  </theorem>

  <\proof>
    Define the pre-Hilbert space as the span of
    <math|<around|{|K|(>\<cdot\>,x):x\<in\>\<Omega\>}> with inner product:

    <\equation>
      <around*|\<nobracket\>|<around*|\<langle\>|<big|sum><rsub|i=1><rsup|n>a<rsub|i>*K|(>*\<cdummy\>,x<rsub|i>),<big|sum><rsub|j=1><rsup|m>b<rsub|j>*K<around|(|\<cdummy\>,y<rsub|j>|)>|\<rangle\>>=<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|m>a<rsub|i><wide|b<rsub|j>|\<bar\>>K<around|(|x<rsub|i>,y<rsub|j>|)>
    </equation>

    Complete this space to obtain <math|\<bbb-H\><rsub|K>>. The reproducing
    property follows by construction.
  </proof>

  <\definition>
    <dueto|Inverse Covariance Operator for Oscillatory Processes>For an
    oscillatory process with representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    and covariance function

    <\equation>
      R*<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<omega\>|)><wide|A<rsub|t><around|(|\<omega\>|)>|\<bar\>>e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    the inverse covariance operator <math|R<rsup|-1>> acts on functions
    <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> by

    <\equation>
      <around|\<langle\>|f,R<rsup|-1>*g|\<rangle\>><rsub|L<rsup|2><around|(|\<bbb-R\>|)>>=<big|int><rsub|\<bbb-R\>><frac|<wide|f|~><around|(|\<omega\>|)><wide|<wide|g|~><around|(|\<omega\>|)>|\<bar\>>|M<around|(|\<omega\>|)>>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    where

    <\equation>
      <wide|f|~><around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>f<around|(|t|)><wide|A<rsub|t><around|(|\<omega\>|)>|\<bar\>>e<rsup|-i*\<omega\>*t>*d*t
    </equation>

    and the time-averaged squared amplitude <math|M<around|(|\<omega\>|)>> is
    given by

    <\equation>
      M<around|(|\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*t
    </equation>
  </definition>

  <\definition>
    [Covariance Kernel RKHS] For a stochastic process
    <math|<around|{|X<around|(|t|)>|}>> with covariance function
    <math|R<around|(|s,t|)>=<Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>>,
    the associated RKHS <math|<Hilbert><rsub|R>> consists of functions with
    finite norm:

    <\equation>
      <norm|f><rsub|<Hilbert><rsub|R>><rsup|2>=<big|iint><rsub|<R><rsup|2>>f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>d*R<rsup|-1><around|(|s,t|)>
    </equation>

    where <math|R<rsup|-1>> is the inverse covariance operator.
  </definition>

  <\theorem>
    [Sample Paths in RKHS] For a Gaussian process
    <math|<around|{|X<around|(|t|)>|}>> with continuous covariance
    <math|R<around|(|s,t|)>>, the sample paths belong to
    <math|<Hilbert><rsub|R>> almost surely if and only if:

    <\equation>
      <big|int><rsub|<R>><frac|d*\<mu\><around|(|\<omega\>|)>|1+\<omega\><rsup|2>>\<less\>\<infty\>
    </equation>

    where <math|\<mu\>> is the spectral measure.
  </theorem>

  <\proof>
    The condition ensures that <math|<E><around|[|<norm|X><rsub|<Hilbert><rsub|R>><rsup|2>|]>\<less\>\<infty\>>.
    For Gaussian processes, this implies almost sure membership in
    <math|<Hilbert><rsub|R>> by the Fernique theorem and properties of
    Gaussian measures on Banach spaces.
  </proof>

  <section|Bandlimited Processes and the Sinc Kernel>

  <\definition>
    [Bandlimited Process] A stochastic process
    <math|<around|{|X<around|(|t|)>|}>> is <math|\<Omega\>>-bandlimited if
    its spectral measure <math|\<mu\>> is supported on
    <math|<around|[|-\<Omega\>,\<Omega\>|]>>.
  </definition>

  <\theorem>
    [Sinc Kernel RKHS] The space of <math|\<pi\>>-bandlimited functions forms
    an RKHS with reproducing kernel:

    <\equation>
      K<around|(|s,t|)>=<sinc><around|(|s-t|)>=<frac|sin
      \<pi\>*<around|(|s-t|)>|\<pi\>*<around|(|s-t|)>>
    </equation>

    and inner product:

    <\equation>
      <inner|f,g|_><Hilbert>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*t=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><wide|f|^><around|(|\<omega\>|)><wide|<wide|g|^><around|(|\<omega\>|)>|\<bar\>>d*\<omega\>
    </equation>
  </theorem>

  <\proof>
    For any <math|\<pi\>>-bandlimited function <math|f>:

    <\align>
      <tformat|<table|<row|<cell|f<around|(|t|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|s|)>*e<rsup|-i*\<omega\>*s>*d*s|)>*e<rsup|i*\<omega\>*t>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|s|)>*<around*|(|<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|s|)><sinc><around|(|t-s|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<inner|f,<sinc><around|(|\<cdummy\>-t|)>|_><Hilbert><eq-number>>>>>
    </align>

    Thus the sinc function serves as the reproducing kernel.
  </proof>

  <\corollary>
    [Sampling Theorem in RKHS] Every <math|\<pi\>>-bandlimited function
    <math|f> can be perfectly reconstructed from its samples:

    <\equation>
      f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>f<around|(|n|)><sinc><around|(|t-n|)>
    </equation>
  </corollary>

  <\theorem>
    [Bandlimited Random Process Reconstruction] For a
    <math|\<pi\>>-bandlimited stochastic process
    <math|<around|{|X<around|(|t|)>|}>>, each sample path can be
    reconstructed from its samples:

    <\equation>
      X<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>X<around|(|n|)><sinc><around|(|t-n|)>
    </equation>

    with probability 1, provided <math|<E><around|[|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||X<around|(|n|)>|\|><rsup|2>|]>\<less\>\<infty\>>.
  </theorem>

  <section|Frame Theory and Analysis-Synthesis Operators>

  <\definition>
    [Frame] A sequence <math|<around|{|f<rsub|k>|}><rsub|k\<in\>\<cal-I\>>>
    in a Hilbert space <math|<Hilbert>> is a frame if there exist constants
    <math|A,B\<gtr\>0> such that:

    <\equation>
      A<norm|f><rsup|2>\<leq\><big|sum><rsub|k\<in\>\<cal-I\>>\|<inner|f,f<rsub|k>|\|><rsup|2>\<leq\>B<norm|f><rsup|2>
    </equation>

    for all <math|f\<in\><Hilbert>>. The constants <math|A> and <math|B> are
    called frame bounds.
  </definition>

  <\definition>
    <dueto|Analysis Operator>For a frame <math|<around|{|f<rsub|k>|}>>, the
    analysis operator <math|T:<Hilbert>\<to\>\<ell\><rsup|2><around|(|\<cal-I\>|)>>
    is defined by:

    <\equation>
      T*f=<around|{|c<rsub|k>|}><rsub|k\<in\>\<cal-I\>>*<space|1em><text|where><space|1em>c<rsub|k>=<around|\<langle\>|f,f<rsub|k>|\<rangle\>>
    </equation>
  </definition>

  <\definition>
    <dueto|Synthesis Operator>The synthesis operator
    <math|T<rsup|\<ast\>>:\<ell\><rsup|2><around|(|\<cal-I\>|)>\<to\><Hilbert>>
    is the adjoint of the analysis operator:

    <\equation>
      T<rsup|\<ast\>><around|{|c<rsub|k>|}>=<big|sum><rsub|k\<in\>\<cal-I\>>c<rsub|k>*f<rsub|k>
    </equation>
  </definition>

  <\theorem>
    [Frame Operator Properties] The frame operator
    <math|S=T<rsup|\<ast\>>*T:<Hilbert>\<to\><Hilbert>> satisfies:

    <\enumerate>
      <item><math|S*f=<big|sum><rsub|k\<in\>\<cal-I\>><inner|f,f<rsub|k>|f><rsub|k>>

      <item><math|S> is positive, self-adjoint, and invertible

      <item><math|A<math-bf|I>\<leq\>S\<leq\>B<math-bf|I>> where <math|A,B>
      are the frame bounds

      <item>The canonical dual frame is <math|<around|{|f<rsub|k><rsup|\<sim\>>|}>=<around|{|S<rsup|-1>*f<rsub|k>|}>>
    </enumerate>
  </theorem>

  <\proof>
    For any <math|f,g\<in\><Hilbert>>:

    For any <math|f,g\<in\><Hilbert>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|S*f,g|\<rangle\>>>|<cell|=<around|\<langle\>|T<rsup|\<ast\>>*T*f,g|\<rangle\>><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|T*f,T*g|\<rangle\>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<cal-I\>><around|\<langle\>|f,f<rsub|k>|\<rangle\>><wide|<around|\<langle\>|g,f<rsub|k>|\<rangle\>>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<cal-I\>><around|\<langle\>|f,f<rsub|k>|\<rangle\>><around|\<langle\>|f<rsub|k>,g|\<rangle\>><eq-number>>>|<row|<cell|>|<cell|=<around*|\<langle\>|f,<big|sum><rsub|k\<in\>\<cal-I\>><around|\<langle\>|g,f<rsub|k>|\<rangle\>>*f<rsub|k>|\<rangle\>><eq-number>>>>>
    </align>

    Thus <math|S*f=<big|sum><rsub|k\<in\>\<cal-I\>><around|\<langle\>|f,f<rsub|k>|\<rangle\>>*f<rsub|k>>.
    The frame condition gives:

    <\equation>
      A<norm|f><rsup|2>\<leq\><inner|S*f,f|\<leq\>>B<norm|f><rsup|2>
    </equation>

    implying <math|A<math-bf|I>\<leq\>S\<leq\>B<math-bf|I>>, so <math|S> is
    invertible.
  </proof>

  <\corollary>
    [Perfect Reconstruction] For any <math|f\<in\><Hilbert>>:

    <\equation>
      f=<big|sum><rsub|k\<in\>\<cal-I\>><inner|f,f<rsub|k>|f><rsub|k><rsup|\<sim\>>=<big|sum><rsub|k\<in\>\<cal-I\>><inner|f,f<rsub|k><rsup|\<sim\>>|f><rsub|k>
    </equation>

    where <math|<around|{|f<rsub|k><rsup|\<sim\>>|}>> is the canonical dual
    frame.
  </corollary>

  <section|Continuous Frames and Integral Representations>

  <\definition>
    [Continuous Frame] A family <math|<around|{|f<rsub|\<omega\>>|}><rsub|\<omega\>\<in\>\<Omega\>>>
    in <math|<Hilbert>> is a continuous frame if there exist
    <math|A,B\<gtr\>0> such that:

    <\equation>
      A<norm|f><rsup|2>\<leq\><big|int><rsub|\<Omega\>>\|<inner|f,f<rsub|\<omega\>>|\|><rsup|2>d*\<nu\><around|(|\<omega\>|)>\<leq\>B<norm|f><rsup|2>
    </equation>

    for all <math|f\<in\><Hilbert>>, where <math|\<nu\>> is a measure on
    <math|\<Omega\>>.
  </definition>

  <\theorem>
    [Continuous Frame Decomposition] For a continuous frame
    <math|<around|{|f<rsub|\<omega\>>|}>>, every <math|f\<in\><Hilbert>> can
    be represented as:

    <\equation>
      f=<big|int><rsub|\<Omega\>><inner|f,f<rsub|\<omega\>>|f><rsub|\<omega\>><rsup|\<sim\>>d*\<nu\><around|(|\<omega\>|)>
    </equation>

    where <math|<around|{|f<rsub|\<omega\>><rsup|\<sim\>>|}>> is the
    canonical dual frame.
  </theorem>

  <\example>
    [Fourier Transform as Continuous Frame] The family
    <math|<around|{|e<rsup|i*\<omega\>\<cdot\>>|}><rsub|\<omega\>\<in\><R>>>
    forms a continuous frame for <math|L<rsup|2><around|(|<R>|)>> with:

    <\equation>
      f<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|<R>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    where <math|<wide|f|^><around|(|\<omega\>|)>=<big|int><rsub|<R>>f<around|(|t|)>*e<rsup|-i*\<omega\>*t>*d*t>.
  </example>

  <section|Deterministic-Stochastic Duality for Fixed Sample Paths>

  <\theorem>
    [Sample Path Determinization] For an oscillatory process
    <math|X<around|(|t|)>=<big|int><rsub|<R>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>>
    with fixed analytic sample path <math|X<around|(|t,\<omega\><rsub|0>|)>>,
    the random measure becomes deterministic:

    <\equation>
      d*Z<around|(|\<omega\>|)>\<to\>d*Z<rsub|\<omega\><rsub|0>><around|(|\<omega\>|)>=\<cal-A\><rsup|-1><around|[|X|(>\<cdot\>,\<omega\><rsub|0>)]<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    where <math|\<cal-A\><rsup|-1>> is the inverse analysis operator.
  </theorem>

  <\proof>
    Given the fixed sample path <math|X<around|(|t,\<omega\><rsub|0>|)>>,
    apply the analysis operator:

    <\align>
      <tformat|<table|<row|<cell|c<around|(|\<omega\>|)>>|<cell|=<inner|X<around|(|\<cdummy\>,\<omega\><rsub|0>|)>,A<rsub|\<cdot\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>\<cdot\>>|_><Hilbert><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|<R>>X<around|(|t,\<omega\><rsub|0>|)><wide|A<rsub|t><around|(|\<omega\>|)>|\<bar\>>e<rsup|-i*\<omega\>*t>*d*t<eq-number>>>>>
    </align>

    Then <math|d*Z<rsub|\<omega\><rsub|0>><around|(|\<omega\>|)>=c<around|(|\<omega\>|)>*d*\<omega\>>
    provides the deterministic measure corresponding to this path.
  </proof>

  <\corollary>
    [Perfect Reconstruction from Deterministic Measure] Given the
    deterministic measure <math|d*Z<rsub|\<omega\><rsub|0>><around|(|\<omega\>|)>>,
    the original sample path is recovered via:

    <\equation>
      X<around|(|t,\<omega\><rsub|0>|)>=<big|int><rsub|<R>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsub|\<omega\><rsub|0>><around|(|\<omega\>|)>
    </equation>
  </corollary>

  <\theorem>
    [Isomorphism Between Paths and Measures] For oscillatory processes in the
    RKHS <math|<Hilbert><rsub|K>>, there exists a bijective correspondence
    between sample paths and their associated deterministic measures via the
    analysis-synthesis operator pair <math|<around|(|T,T<rsup|\<ast\>>|)>>.
  </theorem>

  <section|Computational Implementation and Discretization>

  <\theorem>
    [Discretization Convergence] For a continuous frame representation:

    <\equation>
      f=<big|int><rsub|\<Omega\>><inner|f,f<rsub|\<omega\>>|f><rsub|\<omega\>><rsup|\<sim\>>d*\<nu\><around|(|\<omega\>|)>
    </equation>

    the discretized approximation:

    <\equation>
      f<rsub|N>=<big|sum><rsub|k=1><rsup|N><inner|f,f<rsub|\<omega\><rsub|k>>|f><rsub|\<omega\><rsub|k>><rsup|\<sim\>>\<Delta\>*\<omega\><rsub|k>
    </equation>

    converges to <math|f> as <math|max<rsub|k>
    \<Delta\>*\<omega\><rsub|k>\<to\>0>, provided the frame bounds are
    preserved.
  </theorem>

  <\proof>
    Let <math|\<epsilon\><rsub|N>=<norm|f-f<rsub|N>>>. By the frame property:

    <\align>
      <tformat|<table|<row|<cell|\<epsilon\><rsub|N><rsup|2>>|<cell|=<around*|\||f-<big|sum><rsub|k=1><rsup|N><inner|f,f<rsub|\<omega\><rsub|k>>|f><rsub|\<omega\><rsub|k>><rsup|\<sim\>>\<Delta\>*\<omega\><rsub|k>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|\<leq\>C*<big|int><rsub|\<Omega\>><around*|\||<inner|f,f<rsub|\<omega\>>|-><big|sum><rsub|k:\<omega\><rsub|k>\<in\>I<rsub|\<omega\>>><inner|f,f<rsub|\<omega\><rsub|k>>|\<chi\>><rsub|I<rsub|\<omega\>>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<nu\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where <math|<around|{|I<rsub|\<omega\>>|}>> are the discretization
    intervals. As <math|max<rsub|k> \<Delta\>*\<omega\><rsub|k>\<to\>0>, the
    continuity of the frame elements ensures
    <math|\<epsilon\><rsub|N>\<to\>0>.
  </proof>

  <\lemma>
    [Numerical Stability] For well-conditioned frames with frame bounds
    <math|A> and <math|B>, the condition number of the discretized frame
    operator satisfies:

    <\equation>
      \<kappa\><around|(|S<rsub|N>|)>\<leq\><frac|B|A>+O<around|(|max<rsub|k>
      \<Delta\>*\<omega\><rsub|k>|)>
    </equation>

    ensuring numerical stability in the discretization limit.
  </lemma>

  <section|Applications to Accelerometer Data and Physical Interpretation>

  <\theorem>
    [Accelerometer-Velocity-Position Duality] For accelerometer data
    <math|a<around|(|t|)>> modeled as a sample path of an oscillatory
    process, the velocity and position are obtained via spectral integration:

    <\align>
      <tformat|<table|<row|<cell|v<around|(|t|)>>|<cell|=<big|int><rsub|<R>><frac|A<rsub|t><around|(|\<omega\>|)>|i*\<omega\>>*e<rsup|i*\<omega\>*t>*d*Z<rsub|a><around|(|\<omega\>|)><eq-number>>>|<row|<cell|x<around|(|t|)>>|<cell|=<big|int><rsub|<R>><frac|A<rsub|t><around|(|\<omega\>|)>|<around|(|i*\<omega\>|)><rsup|2>>*e<rsup|i*\<omega\>*t>*d*Z<rsub|a><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where <math|d*Z<rsub|a><around|(|\<omega\>|)>> is the deterministic
    measure corresponding to the acceleration path.
  </theorem>

  <\corollary>
    [Quantum-Classical Analogy] The Fourier duality between position and
    momentum in quantum mechanics is precisely mirrored in the classical
    accelerometer system, where the analysis-synthesis operators play the
    role of the quantum Fourier transform between position and momentum
    representations.
  </corollary>

  <section|Conclusion>

  This comprehensive framework establishes the rigorous mathematical
  foundations for:

  <\enumerate>
    <item>The distinction between spectral measures (deterministic,
    process-characterizing) and random measures (stochastic,
    path-determining)

    <item>Priestley's theory of oscillatory processes with evolutionary
    spectra

    <item>RKHS representations of bandlimited and oscillatory processes

    <item>Frame theory with continuous analysis-synthesis operators

    <item>The fundamental duality between deterministic and stochastic
    representations

    <item>Computational methods for discretization with convergence
    guarantees

    <item>Applications to physical systems exhibiting quantum-classical
    analogies
  </enumerate>

  The mathematical structure reveals the deep connections between stochastic
  process theory, functional analysis, and quantum mechanics, providing both
  theoretical insight and practical computational methods for analyzing
  complex oscillatory phenomena.

  <\thebibliography|99>
    <bibitem|priestley1965>Priestley, M.B. (1965). Evolutionary Spectra and
    Non-Stationary Processes. <with|font-shape|italic|Journal of the Royal
    Statistical Society>, 27(2), 204-237.

    <bibitem|aronszajn1950>Aronszajn, N. (1950). Theory of Reproducing
    Kernels. <with|font-shape|italic|Transactions of the American
    Mathematical Society>, 68(3), 337-404.

    <bibitem|daubechies1992>Daubechies, I. (1992).
    <with|font-shape|italic|Ten Lectures on Wavelets>. SIAM.

    <bibitem|christensen2003>Christensen, O. (2003).
    <with|font-shape|italic|An Introduction to Frames and Riesz Bases>.
    Birkhäuser.

    <bibitem|carmeli2010>Carmeli, C., De Vito, E., Toigo, A. (2010). Vector
    Valued Reproducing Kernel Hilbert Spaces of Integrable Functions and
    Mercer Theorem. <with|font-shape|italic|Analysis and Applications>, 8(1),
    19-37.

    <bibitem|loeve1978>Loève, M. (1978). <with|font-shape|italic|Probability
    Theory II>. 4th Edition, Springer-Verlag.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|global-title|Spectral Theory of Oscillatory Non-Stationary
    Processes and RKHS Framework>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|10|11>>
    <associate|auto-11|<tuple|7|12>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|7>>
    <associate|auto-6|<tuple|6|8>>
    <associate|auto-7|<tuple|7|9>>
    <associate|auto-8|<tuple|8|10>>
    <associate|auto-9|<tuple|9|11>>
    <associate|bib-aronszajn1950|<tuple|aronszajn1950|12>>
    <associate|bib-carmeli2010|<tuple|carmeli2010|12>>
    <associate|bib-christensen2003|<tuple|christensen2003|12>>
    <associate|bib-daubechies1992|<tuple|daubechies1992|12>>
    <associate|bib-loeve1978|<tuple|loeve1978|12>>
    <associate|bib-priestley1965|<tuple|priestley1965|12>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      and Fundamental Concepts> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Priestley's
      Theory of Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Reproducing
      Kernel Hilbert Spaces for Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Bandlimited
      Processes and the Sinc Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Frame
      Theory and Analysis-Synthesis Operators>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Continuous
      Frames and Integral Representations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Deterministic-Stochastic
      Duality for Fixed Sample Paths> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Computational
      Implementation and Discretization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Applications
      to Accelerometer Data and Physical Interpretation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>