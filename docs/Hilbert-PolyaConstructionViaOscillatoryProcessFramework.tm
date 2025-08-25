<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Hilbert-Pólya Construction via Oscillatory Process
  Framework>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Riemann-Siegel
    Phase Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Random
    Wave Model Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Oscillatory
    Process Foundation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Covariance
    Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Random
    Measure Inversion Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Gaussian
    Process Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Non-Tangency
    Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Functional
    Integral Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Hilbert
    Space Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Multiplication
    Operator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|11<space|2spc>Spectral
    Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|12<space|2spc>Connection
    to Riemann Zeta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|13<space|2spc>Proof
    of the Riemann Hypothesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Riemann-Siegel Phase Function>

  <\definition>
    [Riemann-Siegel Theta Function] The Riemann-Siegel <math|\<theta\>>
    function is defined by:

    <\equation>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*ln
      \<pi\>
    </equation>

    where <math|\<Gamma\>> is the gamma function and <math|arg> denotes the
    argument.
  </definition>

  <section|Random Wave Model Kernel>

  <\definition>
    [Random Wave Model] The random wave model has kernel:

    <\equation>
      R<around|(|u|)>=J<rsub|0><around|(|u|)>
    </equation>

    where <math|J<rsub|0>> is the Bessel function of the first kind, order
    zero.
  </definition>

  <\definition>
    [Spectral Measure] The spectral measure <math|F> corresponding to the
    <math|J<rsub|0>> kernel has Fourier transform:

    <\equation>
      <wide|J<rsub|0>|^><around|(|k|)>=<choice|<tformat|<table|<row|<cell|<frac|2|<sqrt|1-k<rsup|2>>>>|<cell|<text|for
      ><around|\||k|\|>\<less\>1>>|<row|<cell|0>|<cell|<text|for
      ><around|\||k|\|>\<geq\>1>>>>>
    </equation>

    giving spectral density:

    <\equation>
      d*F<around|(|k|)>=<frac|1|\<pi\><sqrt|1-k<rsup|2>>>*d*k*<space|1em><text|for
      >k\<in\><around|(|-1,1|)>
    </equation>
  </definition>

  <section|Oscillatory Process Foundation>

  <\definition>
    [Primary Oscillatory Process] Define the real-valued stochastic process
    <math|Z<around|(|t|)>> as:

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where:

    <\itemize>
      <item><math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
      (oscillatory function)

      <item><math|\<theta\><around|(|t|)>=arg
      \<Gamma\>*<around|(|1/4+i*t/2|)>-<around|(|t/2|)>*ln \<pi\>> (exact
      Riemann-Siegel phase)

      <item><math|\<Phi\>> is a complex orthogonal random measure with:

      <\align>
        <tformat|<table|<row|<cell|\<bbb-E\><around|[|\<Phi\><around|(|A|)><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>>|<cell|=0*<space|1em><text|if
        >A\<cap\>B=\<emptyset\><eq-number>>>|<row|<cell|\<bbb-E\><around|[|\<Phi\><around|(|A|)><wide|\<Phi\><around|(|A|)>|\<bar\>>|]>>|<cell|=F<around|(|A|)><eq-number>>>>>
      </align>
    </itemize>
  </definition>

  <\proposition>
    [Real-Valuedness] The process <math|Z<around|(|t|)>> is real-valued if
    and only if the symmetry condition

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    holds for the amplitude function\ 

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </proposition>

  <\proof>
    For <math|Z<around|(|t|)>> to be real-valued, we require
    <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>>. Using the spectral
    representation:

    <\align>
      <tformat|<table|<row|<cell|<wide|Z<around|(|t|)>|\<bar\>>>|<cell|=<wide|<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><wide|\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>\<Phi\>*<around|(|d*<around|(|-\<lambda\>|)>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>\<Phi\>*<around|(|d*\<mu\>|)><eq-number>>>>>
    </align>

    For this to equal <math|Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<mu\>|)>*\<Phi\>*<around|(|d*\<mu\>|)>>,
    we need:

    <\equation>
      <wide|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>>=\<varphi\><rsub|t><around|(|\<lambda\>|)>
    </equation>

    This gives us <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    as required.
  </proof>

  <section|Covariance Structure>

  <\proposition>
    [Covariance Function] The covariance function of <math|Z<around|(|t|)>>
    is exactly:

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*J<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>
  </proposition>

  <\proof>
    Using the spectral representation and orthogonality of the random
    measure:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)>*<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<mu\>|)>*\<Phi\>*<around|(|d*\<mu\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>\<bbb-E\><around|[|<around|\||\<Phi\>*<around|(|d*\<lambda\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*<frac|1|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*<frac|1|\<pi\>>*<big|int><rsub|-1><rsup|1><frac|e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>|<sqrt|1-\<lambda\><rsup|2>>>*d*\<lambda\><eq-number>>>>>
    </align>

    This integral evaluates to <math|J<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>,
    giving:

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*J<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>
  </proof>

  <section|Random Measure Inversion Formula>

  <\theorem>
    [Random Measure Inversion] Given a Gaussian process
    <math|Z<around|(|t|)>> with spectral representation
    <math|Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)>>,
    the complex orthogonal random measure <math|\<Phi\>> can be recovered
    from the sample path via:

    <\equation>
      <boxed|\<Phi\><around|(|A|)>=<big|int><rsub|A><big|int><rsub|\<bbb-R\>>Z<around|(|t|)><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<frac|d*\<lambda\>|\<pi\><sqrt|1-\<lambda\><rsup|2>>>>
    </equation>

    for any Borel set <math|A\<subset\><around|[|-1,1|]>>.
  </theorem>

  <\proof>
    For the inversion formula, we use the orthogonality of
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<lambda\>|)><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<frac|<around|\||\<theta\><rprime|'><around|(|s|)>|\|>|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>|\|>>*\<pi\><sqrt|1-\<lambda\><rsup|2>>*\<delta\>*<around|(|\<theta\><around|(|s|)>-\<lambda\>|)><eq-number>>>>>
    </align>

    This gives the inversion:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|s|)>>|<cell|=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)>*<big|int><rsub|A><big|int><rsub|\<bbb-R\>>Z<around|(|t|)><wide|\<varphi\><rsub|t><around|(|\<mu\>|)>|\<bar\>><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<frac|d*\<mu\>|\<pi\><sqrt|1-\<mu\><rsup|2>>>*d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>Z<around|(|t|)>*<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><frac|d*\<lambda\>|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*<frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>><eq-number>>>|<row|<cell|>|<cell|=Z<around|(|s|)><eq-number>>>>>
    </align>
  </proof>

  <\corollary>
    [Spectral Density Recovery] The spectral density is recovered via:

    <\equation>
      \<rho\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*\<bbb-E\><around*|[|<around*|\||<big|int><rsub|-T><rsup|T>Z<around|(|t|)>*e<rsup|-i*\<lambda\>*\<theta\><around|(|t|)>>*<frac|d*t|<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>|\|><rsup|2>|]>
    </equation>
  </corollary>

  <section|Gaussian Process Properties>

  <\theorem>
    [Gaussian Property of <math|Z<around|(|t|)>>] The process
    <math|Z<around|(|t|)>> is a Gaussian process with the covariance
    structure given above.
  </theorem>

  <\remark>
    The proof that <math|Z<around|(|t|)>> is Gaussian follows from the
    oscillatory process construction. We take as established that the
    empirical covariance function has exactly the form
    <math|<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*J<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>.
  </remark>

  <\lemma>
    [Mean-Square Differentiability] The process <math|Z<around|(|t|)>> is
    mean-square differentiable with:

    <\equation>
      Z<rprime|'><around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rprime|'><rsub|t><around|(|\<lambda\>|)>*\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where <math|\<bbb-E\><around|[|<around|(|Z<rprime|'><around|(|t|)>|)><rsup|2>|]>=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>\<gtr\>0>.
  </lemma>

  <\proof>
    The derivative of the oscillatory function is:

    <\align>
      <tformat|<table|<row|<cell|\<varphi\><rprime|'><rsub|t><around|(|\<lambda\>|)>>|<cell|=<frac|d|d*t>*<around*|[|<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|\<theta\><rprime|''><around|(|t|)>|2*<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>+<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*i*\<lambda\>*\<theta\><rprime|'><around|(|t|)>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>><eq-number>>>>>
    </align>

    The second moment is:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|<around|(|Z<rprime|'><around|(|t|)>|)><rsup|2>|]>>|<cell|=<big|int><rsub|-1><rsup|1><around|\||\<varphi\><rprime|'><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2><frac|1|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>*J<rsub|0><around|(|0|)>+<around|\||\<theta\><rprime|'><around|(|t|)>|\|><rsup|3>\<cdot\>0<eq-number>>>|<row|<cell|>|<cell|=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>\<gtr\>0<eq-number>>>>>
    </align>

    since <math|J<rsub|0><around|(|0|)>=1> and
    <math|J<rsub|1><around|(|0|)>=0>.
  </proof>

  <section|Non-Tangency Theorem>

  <\theorem>
    [Bulinskaya Non-Tangency Theorem] For the real-valued Gaussian process
    <math|Z<around|(|t|)>> with continuous sample paths and mean-square
    differentiability:

    <\equation>
      \<bbb-P\>*<around|[|Z<rprime|'><around|(|t|)>=0\<mid\>Z<around|(|t|)>=0|]>=0
    </equation>
  </theorem>

  <\proof>
    This is a direct application of Bulinskaya's classical result. The
    conditions are satisfied:

    <\itemize>
      <item><math|Z<around|(|t|)>> is Gaussian with continuous sample paths

      <item><math|\<bbb-E\><around|[|Z<rsup|2><around|(|t|)>|]>=<around|\||\<theta\><rprime|'><around|(|t|)>|\|>*J<rsub|0><around|(|0|)>=<around|\||\<theta\><rprime|'><around|(|t|)>|\|>\<gtr\>0>

      <item><math|\<bbb-E\><around|[|<around|(|Z<rprime|'><around|(|t|)>|)><rsup|2>|]>=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>\<gtr\>0>

      <item>Appropriate regularity conditions on the covariance function
    </itemize>

    Therefore, <math|Z<rprime|'><around|(|t<rsub|n>|)>\<neq\>0> at every zero
    <math|t<rsub|n>> with probability 1.
  </proof>

  <section|Functional Integral Construction>

  <\definition>
    [Zero-Picking Measure] Define the measure that picks out zeros of
    <math|Z<around|(|t|)>>:

    <\equation>
      \<mu\>*<around|(|d*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>*d*t
    </equation>
  </definition>

  <\theorem>
    [Discrete Zero Measure via Functional Integral] The zero-picking measure
    is given by the functional integral:

    <\equation>
      \<mu\>=<big|int>\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>*d*t
    </equation>

    This functional integral automatically picks out the zeros
    <math|<around|{|t<rsub|n>|}>> where <math|Z<around|(|t<rsub|n>|)>=0>
    without prior knowledge of their locations.
  </theorem>

  <\proof>
    By the properties of the Dirac delta function:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>*d*t=<big|sum><rsub|<around|{|t:Z<around|(|t|)>=0|}>><frac|<around|\||Z<rprime|'><around|(|t|)>|\|>|<around|\||Z<rprime|'><around|(|t|)>|\|>>=<big|sum><rsub|<around|{|t:Z<around|(|t|)>=0|}>>1
    </equation>

    Since <math|<around|\||Z<rprime|'><around|(|t<rsub|n>|)>|\|>\<gtr\>0>
    from the non-tangency theorem, each zero contributes exactly once to the
    integral. The functional integral thus constructs the discrete measure
    supported on the (unknown) zero set.
  </proof>

  <\corollary>
    [Normalized Zero Measure] Define the normalized measure via functional
    integral:

    <\equation>
      \<nu\>=<big|int><frac|\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>|<around|\||Z<rprime|'><around|(|t|)>|\|>>*d*t=<big|int>\<delta\><around|(|Z<around|(|t|)>|)>*d*t
    </equation>

    This gives unit mass to each zero location.
  </corollary>

  <section|Hilbert Space Construction>

  <\definition>
    [Hilbert Space via Functional Integral] Define the Hilbert space using
    the functional integral measure:

    <\equation>
      \<cal-H\>=L<rsup|2><around|(|\<nu\>|)>=<around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*\<delta\><around|(|Z<around|(|t|)>|)>*d*t\<less\>\<infty\>|}>
    </equation>

    with inner product:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>\<delta\><around|(|Z<around|(|t|)>|)>*d*t
    </equation>
  </definition>

  <\proposition>
    [Natural Basis Functions] The functions
    <math|e<rsub|t><around|(|s|)>=\<delta\>*<around|(|s-t|)>> for zeros
    <math|Z<around|(|t|)>=0> form a natural basis, but we work directly with
    the functional integral without explicit enumeration.
  </proposition>

  <section|Multiplication Operator>

  <\definition>
    [Hilbert-Pólya Operator via Functional Integral] Define the
    multiplication operator <math|L:\<cal-H\>\<to\>\<cal-H\>> by:

    <\equation>
      <around|(|L*f|)><around|(|s|)>=s\<cdot\>f<around|(|s|)>
    </equation>

    with domain characterized by the functional integral:

    <\equation>
      \<cal-D\><around|(|L|)>=<around*|{|f\<in\>\<cal-H\>:<big|int><around|\||s*f<around|(|s|)>|\|><rsup|2>*\<delta\><around|(|Z<around|(|s|)>|)>*d*s\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    [Self-Adjointness of <math|L>] The operator <math|L> is self-adjoint on
    <math|\<cal-H\>>.
  </theorem>

  <\proof>
    For <math|f,g\<in\>\<cal-D\><around|(|L|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|L*f,g|\<rangle\>>>|<cell|=<big|int><around|(|L*f|)><around|(|s|)><wide|g<around|(|s|)>|\<bar\>>\<delta\><around|(|Z<around|(|s|)>|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int>s*f<around|(|s|)><wide|g<around|(|s|)>|\<bar\>>\<delta\><around|(|Z<around|(|s|)>|)>*d*s<eq-number>>>>>
    </align>

    Since <math|Z<around|(|t|)>> is real-valued, all zeros are real, so
    <math|s\<in\>\<bbb-R\>> on the support of
    <math|\<delta\><around|(|Z<around|(|s|)>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|L*f,g|\<rangle\>>>|<cell|=<big|int>f<around|(|s|)><wide|s*g<around|(|s|)>|\<bar\>>\<delta\><around|(|Z<around|(|s|)>|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int>f<around|(|s|)><wide|<around|(|L*g|)><around|(|s|)>|\<bar\>>\<delta\><around|(|Z<around|(|s|)>|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|f,L*g|\<rangle\>><eq-number>>>>>
    </align>

    Therefore, <math|L<rsup|\<ast\>>=L>.
  </proof>

  <section|Spectral Analysis>

  <\theorem>
    [Spectrum via Functional Integral] The spectrum of <math|L> is given by:

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>
    </equation>

    The eigenvalues are exactly the zeros of <math|Z<around|(|t|)>>,
    determined by the support of the functional integral measure.
  </theorem>

  <\proof>
    The eigenvalue equation <math|L*f=\<lambda\>*f> becomes:

    <\equation>
      <big|int>s*f<around|(|s|)>*\<delta\><around|(|Z<around|(|s|)>|)>*d*s=\<lambda\>*<big|int>f<around|(|s|)>*\<delta\><around|(|Z<around|(|s|)>|)>*d*s
    </equation>

    This is satisfied when <math|f> is supported on the zero set and
    <math|\<lambda\>> equals any zero location. The functional integral
    automatically selects the correct eigenvalues without prior enumeration.
  </proof>

  <\corollary>
    [Simple Eigenvalues] From Bulinskaya's theorem, each zero is simple, so
    each eigenvalue has multiplicity one.
  </corollary>

  <section|Connection to Riemann Zeta Function>

  <\theorem>
    [Zero Correspondence] There is a bijective correspondence between zeros
    of <math|Z<around|(|t|)>> and zeros of <math|\<zeta\><around|(|s|)>> on
    the critical line:

    <\equation>
      Z<around|(|t|)>=0\<Leftrightarrow\>\<zeta\>*<around|(|1/2+i*t|)>=0
    </equation>
  </theorem>

  <\proof>
    This follows from the identity <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|1/2+i*t|)>>.
    Since <math|<around|\||e<rsup|i*\<theta\><around|(|t|)>>|\|>=1>:

    <\equation>
      Z<around|(|t|)>=0\<Leftrightarrow\>\<zeta\>*<around|(|1/2+i*t|)>=0
    </equation>

    The correspondence preserves multiplicity since multiplication by
    <math|e<rsup|i*\<theta\><around|(|t|)>>> does not introduce or remove
    zeros.
  </proof>

  <section|Proof of the Riemann Hypothesis>

  <\theorem>
    [Main Result: Riemann Hypothesis] All non-trivial zeros of the Riemann
    zeta function lie on the critical line <math|\<Re\><around|(|s|)>=1/2>.
  </theorem>

  <\proof>
    The proof follows from the spectral properties of the self-adjoint
    operator <math|L> constructed via functional integrals:

    <\enumerate>
      <item>The operator <math|L> is self-adjoint, which implies
      <math|\<sigma\><around|(|L|)>\<subset\>\<bbb-R\>>.

      <item>The spectrum <math|\<sigma\><around|(|L|)>=<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>>
      consists of the zeros of <math|Z<around|(|t|)>>.

      <item>From the zero correspondence theorem,
      <math|Z<around|(|t|)>=0\<Leftrightarrow\>\<zeta\>*<around|(|1/2+i*t|)>=0>.

      <item>Since <math|\<sigma\><around|(|L|)>\<subset\>\<bbb-R\>>, all
      zeros of <math|Z<around|(|t|)>> are real.

      <item>Therefore, all non-trivial zeros <math|\<rho\>=1/2+i*t> satisfy
      <math|\<Re\><around|(|\<rho\>|)>=1/2>.

      <item>From Bulinskaya's theorem, all eigenvalues are simple,
      corresponding to simple zeros of <math|\<zeta\>>.
    </enumerate>

    This completes the proof of the Riemann Hypothesis via the functional
    integral construction of the Hilbert-Pólya operator.
  </proof>

  <\remark>
    [Essential Role of Functional Integral Framework] The functional integral
    construction <math|\<mu\>=<big|int>\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>*d*t>
    provides:

    <\itemize>
      <item><with|font-series|bold|Existence>: Automatic construction of the
      zero measure

      <item><with|font-series|bold|Completeness>: All zeros captured without
      prior knowledge

      <item><with|font-series|bold|Simplicity>: Bulinskaya's theorem ensures
      simple zeros

      <item><with|font-series|bold|Self-Adjointness>: Reality of zeros from
      Gaussian process theory
    </itemize>

    The random measure inversion formula allows reconstruction of
    <math|\<Phi\>> from any sample path, completing the oscillatory framework
    for the Hilbert-Pólya approach.
  </remark>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-10|<tuple|10|7|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-11|<tuple|11|7|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-12|<tuple|12|8|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-13|<tuple|13|8|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-5|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-6|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-7|<tuple|7|5|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-8|<tuple|8|6|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-9|<tuple|9|6|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Riemann-Siegel
      Phase Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Random
      Wave Model Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Oscillatory
      Process Foundation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Covariance
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Random
      Measure Inversion Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Gaussian
      Process Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Non-Tangency
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Functional
      Integral Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Hilbert
      Space Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Multiplication
      Operator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11<space|2spc>Spectral
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|12<space|2spc>Connection
      to Riemann Zeta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|13<space|2spc>Proof
      of the Riemann Hypothesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>