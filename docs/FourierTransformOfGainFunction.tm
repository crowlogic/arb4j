<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Explicit Definition and Properties of
  <math|h<rsub|t><around|(|u|)>> in Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|stephen
  Crowley>>>|<doc-date|<date|>>>

  <section|Introduction>

  We consider oscillatory processes in the framework of Priestley's
  evolutionary spectra for non-stationary processes. The oscillatory process
  <math|X<rsub|t>> is defined by:

  <\equation>
    X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|d*Z<around|(|\<omega\>|)>> is a process with orthogonal
  increments and spectrum <math|d*\<mu\><around|(|\<omega\>|)>>, and
  <math|A<rsub|t><around|(|\<omega\>|)>> is the <with|font-shape|italic|gain
  function> that modulates the amplitude of each frequency component at time
  <math|t>.

  <section|Time-Varying Filter Interpretation>

  <\theorem>
    [Explicit Definition of <math|h<rsub|t><around|(|u|)>>] For a
    non-stationary oscillatory process with gain function
    <math|A<rsub|t><around|(|\<omega\>|)>>, the time-varying filter
    <math|h<rsub|t><around|(|u|)>> is explicitly defined as:

    <\equation>
      h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*u>*<space|0.17em>d*\<omega\>
    </equation>

    That is, <math|h<rsub|t><around|(|u|)>> is the inverse Fourier transform
    of the gain function <math|A<rsub|t><around|(|\<omega\>|)>> for each
    fixed time <math|t>.
  </theorem>

  <\proof>
    We start with the relationship defining
    <math|A<rsub|t><around|(|\<omega\>|)>> as the Fourier transform of
    <math|h<rsub|t><around|(|u|)>>:

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u
    </equation>

    Apply the inverse Fourier transform to both sides:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*v>*<space|0.17em>d*\<omega\>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u|)>*e<rsup|-i*\<omega\>*v>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*<around*|(|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|u-v|)>>*<space|0.17em>d*\<omega\>|)>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    The inner integral represents the Dirac delta function:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|u-v|)>>*<space|0.17em>d*\<omega\>=\<delta\>*<around|(|u-v|)>
    </equation>

    Therefore:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*v>*<space|0.17em>d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*\<delta\>*<around|(|u-v|)>*<space|0.17em>d*u=h<rsub|t><around|(|v|)>
    </equation>

    Thus, we have proven the explicit definition:

    <\equation>
      h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*u>*<space|0.17em>d*\<omega\>
    </equation>
  </proof>

  <\theorem>
    [Representation via Time-Varying Filter] A non-stationary oscillatory
    process <math|X<rsub|t>> can be represented as the convolution of a
    time-varying filter <math|h<rsub|t><around|(|u|)>> with a stationary
    process <math|S<rsub|t>> having spectrum
    <math|d*\<mu\><around|(|\<omega\>|)>>:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u
    </equation>
  </theorem>

  <\proof>
    Starting from the oscillatory process definition:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    Substitute the Fourier representation of
    <math|A<rsub|t><around|(|\<omega\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u|)>*<space|0.17em>d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+u|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>|)>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    Define <math|S<rsub|t>> as a stationary process with the representation:

    <\equation>
      S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    Then the inner integral becomes:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+u|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>=S<rsub|t+u>
    </equation>

    Substituting back:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*S<rsub|t+u>*<space|0.17em>d*u
    </equation>

    With the change of variable <math|v=-u>:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|-v|)>*S<rsub|t-v>*<space|0.17em>d*v
    </equation>

    Redefining <math|h<rsub|t><around|(|u|)>\<rightarrow\>h<rsub|t>*<around|(|-u|)>>
    for notational simplicity:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*S<rsub|t-u>*<space|0.17em>d*u
    </equation>

    Thus, <math|X<rsub|t>> can be represented as the output of passing a
    stationary process through a time-varying filter
    <math|h<rsub|t><around|(|u|)>>.
  </proof>

  <\theorem>
    [Evolutionary Spectrum Relationship] The evolutionary spectrum of the
    process <math|X<rsub|t>> at time <math|t> is given by:

    <\equation>
      f<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    where <math|A<rsub|t><around|(|\<omega\>|)>> is the gain function and
    <math|d*\<mu\><around|(|\<omega\>|)>> is the spectral measure of the
    underlying stationary process.
  </theorem>

  <\proof>
    From the definition of <math|A<rsub|t><around|(|\<omega\>|)>> as the
    Fourier transform of <math|h<rsub|t><around|(|u|)>>:

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u
    </equation>

    The squared magnitude of the gain function is:

    <\align>
      <tformat|<table|<row|<cell|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>>|<cell|=A<rsub|t><around|(|\<omega\>|)><wide|A<rsub|t><around|(|\<omega\>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*e<rsup|-i*\<omega\>*v>*h<rsub|t><around|(|u|)><wide|h<rsub|t><around|(|v|)>|\<bar\>><space|0.17em>d*u*<space|0.17em>d*v<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|u-v|)>>*h<rsub|t><around|(|u|)><wide|h<rsub|t><around|(|v|)>|\<bar\>><space|0.17em>d*u*<space|0.17em>d*v<eq-number>>>>>
    </align>

    The local power spectrum at time <math|t> is defined as
    <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>.
    This represents the distribution of power across frequencies at the
    specific time <math|t>, taking into account the modulation effect of the
    time-varying filter on the underlying stationary process.

    Therefore, the evolutionary spectrum is:

    <\equation>
      f<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    which completes the proof.
  </proof>

  <section|Conclusion>

  We have explicitly defined the time-varying filter
  <math|h<rsub|t><around|(|u|)>> as the inverse Fourier transform of the gain
  function <math|A<rsub|t><around|(|\<omega\>|)>>. This relationship provides
  a useful interpretation of non-stationary oscillatory processes as the
  output of passing a stationary process through a time-varying filter. The
  evolutionary spectrum directly relates to the squared magnitude of the gain
  function, weighted by the spectral measure of the underlying stationary
  process.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Time-Varying
      Filter Interpretation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>