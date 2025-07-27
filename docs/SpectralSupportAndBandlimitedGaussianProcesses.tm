<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Support and Bandlimited Gaussian
  Processes>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Fundamental
    Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>
  </table-of-contents>

  <section|Fundamental Definitions>

  <\definition>
    [Heaviside Step Function] The Heaviside step function
    <math|H:\<bbb-R\>\<to\><around|{|0,1|}>> is defined as

    <\equation>
      H<around|(|x|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
      >x\<geq\>0>>|<row|<cell|0>|<cell|<text|if >x\<less\>0>>>>>
    </equation>
  </definition>

  <\definition>
    [Rectangular Function] The rectangular function
    <math|<math-up|rect><rsub|<around|[|a,b|]>>:\<bbb-R\>\<to\><around|{|0,1|}>>
    for <math|a\<less\>b> is defined as

    <\equation>
      <math-up|rect><rsub|<around|[|a,b|]>><around|(|\<omega\>|)>=H*<around|(|\<omega\>-a|)>-H*<around|(|\<omega\>-b|)>
    </equation>

    which equals 1 for <math|\<omega\>\<in\><around|[|a,b|]>> and 0
    otherwise.
  </definition>

  <\definition>
    [Spectral Density] Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>
    be a zero-mean, stationary Gaussian process with covariance function
    <math|K<around|(|\<tau\>|)>=\<bbb-E\>*<around|[|X<rsub|t>*X<rsub|t+\<tau\>>|]>>.
    The spectral density <math|S:\<bbb-R\>\<to\><around|[|0,\<infty\>|)>> is
    the Fourier transform of the covariance function:

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation>

    provided this integral exists.
  </definition>

  <\definition>
    [Spectral Support] The spectral support of a Gaussian process with
    spectral density <math|S<around|(|\<omega\>|)>> is the set

    <\equation>
      <math-up|supp><around|(|S|)>=<wide|<around|{|\<omega\>\<in\>\<bbb-R\>:S<around|(|\<omega\>|)>\<gtr\>0|}>|\<bar\>>
    </equation>

    where <math|<wide|A|\<bar\>>> denotes the closure of set <math|A>.
  </definition>

  <\definition>
    [Bandlimited Process] A stationary Gaussian process is called bandlimited
    if its spectral support is a compact subset of <math|\<bbb-R\>>, i.e., if
    there exist constants <math|a,b\<in\>\<bbb-R\>> with <math|a\<less\>b>
    such that

    <\equation>
      <math-up|supp><around|(|S|)>\<subseteq\><around|[|a,b|]>
    </equation>

    and <math|<math-up|supp><around|(|S|)>> is closed and bounded.
  </definition>

  <section|Main Results>

  <\theorem>
    [Sinc Kernel Spectral Density] Consider the covariance function

    <\equation>
      K<around|(|\<tau\>|)>=<frac|sin <around|(|2*\<pi\>*\<tau\>|)>|2*\<pi\>*\<tau\>>
    </equation>

    with the convention that <math|K<around|(|0|)>=1>. The corresponding
    spectral density is

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|2><math-up|rect><rsub|<around|[|-1,1|]>><around|(|\<omega\>|)>=<frac|1|2>*<around|[|H*<around|(|\<omega\>+1|)>-H*<around|(|\<omega\>-1|)>|]>
    </equation>
  </theorem>

  <\proof>
    The Fourier transform of <math|K<around|(|\<tau\>|)>=<frac|sin
    <around|(|2*\<pi\>*\<tau\>|)>|2*\<pi\>*\<tau\>>> is computed as follows.
    Using the identity <math|sin <around|(|2*\<pi\>*\<tau\>|)>=<frac|e<rsup|i*2*\<pi\>*\<tau\>>-e<rsup|-i*2*\<pi\>*\<tau\>>|2*i>>,
    one has

    <\align>
      <tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin
      <around|(|2*\<pi\>*\<tau\>|)>|2*\<pi\>*\<tau\>>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|i*2*\<pi\>*\<tau\>>-e<rsup|-i*2*\<pi\>*\<tau\>>|2*i*\<tau\>>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|4*\<pi\>*i>*<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*<around|(|\<omega\>-2*\<pi\>|)>*\<tau\>>|\<tau\>>*d*\<tau\>-<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*<around|(|\<omega\>+2*\<pi\>|)>*\<tau\>>|\<tau\>>*d*\<tau\>|]><eq-number>>>>>
    </align>

    Computing the Fourier transform of <math|<frac|sin
    <around|(|a*\<tau\>|)>|\<pi\>*\<tau\>>> directly: for <math|a\<gtr\>0>,

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin
      <around|(|a*\<tau\>|)>|\<pi\>*\<tau\>>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|i*a*\<tau\>>-e<rsup|-i*a*\<tau\>>|2*i*\<tau\>>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>*i>*<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*<around|(|\<omega\>-a|)>*\<tau\>>|\<tau\>>*d*\<tau\>-<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*<around|(|\<omega\>+a|)>*\<tau\>>|\<tau\>>*d*\<tau\>|]><eq-number>>>>>
    </align>

    Using the fact that <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*\<alpha\>*\<tau\>>|\<tau\>>*d*\<tau\>=-i*\<pi\><text|sgn><around|(|\<alpha\>|)>>
    where sgn is the sign function, this evaluates to
    <math|<math-up|rect><rsub|<around|[|-a,a|]>><around|(|\<omega\>|)>>.
    Therefore,

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|2><math-up|rect><rsub|<around|[|-1,1|]>><around|(|\<omega\>|)>=<frac|1|2>*<around|[|H*<around|(|\<omega\>+1|)>-H*<around|(|\<omega\>-1|)>|]>
    </equation>
  </proof>

  <\proposition>
    [General Bandlimited Spectral Density] A Gaussian process is bandlimited
    with spectral support <math|<around|[|a,b|]>> if and only if its spectral
    density can be written as

    <\equation>
      S<around|(|\<omega\>|)>=f<around|(|\<omega\>|)>\<cdot\><math-up|rect><rsub|<around|[|a,b|]>><around|(|\<omega\>|)>=f<around|(|\<omega\>|)>\<cdot\><around|[|H*<around|(|\<omega\>-a|)>-H*<around|(|\<omega\>-b|)>|]>
    </equation>

    for some non-negative function <math|f:<around|[|a,b|]>\<to\><around|[|0,\<infty\>|)>>.
  </proposition>

  <\proof>
    (<math|\<Rightarrow\>>) If the process is bandlimited with spectral
    support <math|<around|[|a,b|]>>, then <math|S<around|(|\<omega\>|)>=0>
    for <math|\<omega\>\<nin\><around|[|a,b|]>>. Define
    <math|f<around|(|\<omega\>|)>=S<around|(|\<omega\>|)>> for
    <math|\<omega\>\<in\><around|[|a,b|]>> and extend arbitrarily to
    <math|\<bbb-R\>>. Then <math|S<around|(|\<omega\>|)>=f<around|(|\<omega\>|)>\<cdot\><math-up|rect><rsub|<around|[|a,b|]>><around|(|\<omega\>|)>>.

    (<math|\<Leftarrow\>>) If <math|S<around|(|\<omega\>|)>=f<around|(|\<omega\>|)>\<cdot\><math-up|rect><rsub|<around|[|a,b|]>><around|(|\<omega\>|)>>,
    then <math|S<around|(|\<omega\>|)>=0> for
    <math|\<omega\>\<nin\><around|[|a,b|]>>, implying
    <math|<math-up|supp><around|(|S|)>\<subseteq\><around|[|a,b|]>>.
  </proof>

  <\example>
    [Band-pass Process] Consider a bandlimited process with spectral support
    <math|<around|[|-\<Omega\>,-\<omega\><rsub|0>|]>\<cup\><around|[|\<omega\><rsub|0>,\<Omega\>|]>>
    where <math|0\<less\>\<omega\><rsub|0>\<less\>\<Omega\>>. The spectral
    density can be expressed as

    <\align>
      <tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=f<around|(|\<omega\>|)>\<cdot\><around|[|<math-up|rect><rsub|<around|[|-\<Omega\>,-\<omega\><rsub|0>|]>><around|(|\<omega\>|)>+<math-up|rect><rsub|<around|[|\<omega\><rsub|0>,\<Omega\>|]>><around|(|\<omega\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=f<around|(|\<omega\>|)>\<cdot\><around|[|H*<around|(|\<omega\>+\<Omega\>|)>-H*<around|(|\<omega\>+\<omega\><rsub|0>|)>+H*<around|(|\<omega\>-\<omega\><rsub|0>|)>-H*<around|(|\<omega\>-\<Omega\>|)>|]><eq-number>>>>>
    </align>

    for some appropriate function <math|f>.
  </example>

  <section|Conclusion>

  The spectral support serves as the fundamental concept for characterizing
  bandlimited Gaussian processes. The Heaviside step function provides a
  natural mathematical framework for expressing the boundaries of spectral
  support, enabling precise characterization of the frequency domain
  properties of such processes.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Fundamental
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>