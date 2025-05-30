<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  An oscilatory process (Priestley 1965)<math|X<rsub|t>> can be represented
  as:

  <\equation>
    X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|A<rsub|t><around|(|\<omega\>|)>> is the time-varying gain
  function and <math|d*Z<around|(|\<omega\>|)>> represents a process with
  orthogonal increments.

  <\theorem>
    [Fourier Domain Relationship] The relationship between the gain function
    <math|A<rsub|t><around|(|\<omega\>|)>> and the time-varying filter
    <math|h<rsub|t><around|(|u|)>> is given by:

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|i*\<omega\>*u>*<space|0.17em>d*u
    </equation>
  </theorem>

  <\remark>
    Note that in some literature, <math|h<rsub|t><around|(|u|)>> may be
    denoted as <math|a<around|(|t,\<tau\>|)>>, where <math|t> is the time
    parameter and <math|\<tau\>=><math|u> represents the lag parameter.
  </remark>

  <\theorem>
    [Explicit Definition of <math|h<rsub|t><around|(|u|)>>] The time-varying
    filter <math|h<rsub|t><around|(|u|)>> is explicitly defined as:

    <\equation>
      h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*\<omega\>
    </equation>
  </theorem>

  <\proof>
    We start with the Fourier domain relationship:

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|i*\<omega\>*u>*<space|0.17em>d*u
    </equation>

    To isolate <math|h<rsub|t><around|(|u|)>>, we apply the inverse Fourier
    transform by multiplying both sides by <math|e<rsup|-i*\<omega\>*v>> and
    integrating with respect to <math|\<omega\>>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*v>*<space|0.17em>d*\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|i*\<omega\>*u>*<space|0.17em>d*u|)>*e<rsup|-i*\<omega\>*v>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-v|)>>*<space|0.17em>d*\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|u-v|)>>*<space|0.17em>d*\<omega\>|)>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    The inner integral on the right-hand side is:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|u-v|)>>*<space|0.17em>d*\<omega\>=2*\<pi\>*\<delta\>*<around|(|u-v|)>
    </equation>

    where <math|\<delta\><around|(|\<cdummy\>|)>> is the Dirac delta
    function.

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-v|)>>*<space|0.17em>d*\<omega\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>\<cdot\>2*\<pi\>*\<delta\>*<around|(|u-v|)>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=2*\<pi\>*h<rsub|t><around|(|v|)><eq-number>>>>>
    </align>

    Solving for <math|h<rsub|t><around|(|v|)>> and replacing <math|v> with
    <math|u>:

    <\equation>
      h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*\<omega\>
    </equation>

    This gives the explicit definition of <math|h<rsub|t><around|(|u|)>>.
  </proof>

  <\theorem>
    [Alternative Process Representation] The process <math|X<rsub|t>> can
    also be represented as:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*X<rsub|S>*<around|(|t-u|)>*<space|0.17em>d*u
    </equation>

    where <math|X<rsub|S><around|(|t|)>> is a stationary process with power
    spectral density <math|S<rsub|X*X><around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Starting from the original spectral representation:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    We substitute the Fourier relationship:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|e<rsup|i*\<omega\>*t>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|i*\<omega\>*u>*<space|0.17em>d*u|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|i*\<omega\>*u>*<space|0.17em>d*u*<space|0.17em>d*Z<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Interchanging the order of integration:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*<space|0.17em>d*Z<around|(|\<omega\>|)>|)>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-<around|[|t-u|]>|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>|)>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    Define the stationary process:

    <\equation>
      X<rsub|S>*<around|(|t-u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    Therefore:

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*X<rsub|S>*<around|(|t-u|)>*<space|0.17em>d*u
    </equation>

    This demonstrates that <math|X<rsub|t>> can be represented as the output
    of a time-varying filter <math|h<rsub|t><around|(|u|)>> applied to a
    stationary process <math|X<rsub|S><around|(|t|)>>.
  </proof>

  <section|Conclusion>

  The explicit definition of the time-varying filter
  <math|h<rsub|t><around|(|u|)>> in terms of the gain function
  <math|A<rsub|t><around|(|\<omega\>|)>> is:

  <\equation>
    h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*\<omega\>
  </equation>

  This relationship provides a critical link between the frequency-domain
  representation using the gain function and the time-domain representation
  using the time-varying filter. The presence of the factor
  <math|e<rsup|i*\<omega\>*<around|(|t-u|)>>> in the integrand is essential
  and distinguishes this from a simple inverse Fourier transform.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>