<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injective Measure-Preserving Time-Changes of
  Stationary Processes are Oscillatory>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|July 24, 2025>>

  <section*|Oscillatory Processes and Normalized Injective Time-Changes>

  <\definition>
    [Oscillatory Process] A complex-valued second-order stochastic process
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>I>> is said to be oscillatory if
    there exists a family of functions <math|\<phi\><rsub|t><around|(|\<omega\>|)>>
    and a complex orthogonal increment process <math|Z<around|(|\<omega\>|)>>
    with <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>
    such that

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)><space|0.17em>
    </equation>

    where <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    and <math|A<rsub|t><around|(|\<omega\>|)>> is quadratically integrable
    with respect to <math|d*\<mu\>>.
  </definition>

  <\definition>
    [Stationary Process] A second-order process
    <math|<around|{|S<rsub|t>|}><rsub|t\<in\>J>> is stationary if it admits
    the spectral representation

    <\equation>
      S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    for some orthogonal increment process <math|Z<around|(|\<omega\>|)>> with
    <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>.
  </definition>

  <\theorem>
    [Time-Varying Filter for Injective Time-Change] Let <math|S<rsub|t>> be a
    stationary process and <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be
    smooth and strictly increasing with <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0>.
    To achieve the transformation

    <\equation>
      X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>
    </equation>

    via convolution <math|X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*d*u>,
    the time-varying impulse response must be

    <\equation>
      h<rsub|t><around|(|u|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>
    </equation>
  </theorem>

  <\proof>
    For the convolution to yield <math|X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>>,
    the argument of <math|S> in the integrand must equal
    <math|\<theta\><around|(|t|)>> when the delta function is activated. This
    requires:

    <\equation*>
      t-u=\<theta\><around|(|t|)>
    </equation*>

    Solving for <math|u>:

    <\equation>
      u=t-\<theta\><around|(|t|)>
    </equation>

    Therefore:

    <\equation>
      h<rsub|t><around|(|u|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>
    </equation>

    Verification by direct computation:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|t-<around|(|t-\<theta\><around|(|t|)>|)>><space|1em><text|(by
      sifting property)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Spectral Envelope for Injective Time-Change] For the time-varying filter
    <math|h<rsub|t><around|(|u|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>>,
    the spectral envelope is

    <\equation*>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|t-\<theta\><around|(|t|)>|)>>
    </equation*>
  </theorem>

  <\proof>
    The spectral envelope is the Fourier transform of
    <math|h<rsub|t><around|(|u|)>>:

    <\align>
      <tformat|<table|<row|<cell|A<rsub|t><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|t-\<theta\><around|(|t|)>|)>><space|1em><text|(by
      sifting property)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Oscillatory Representation of Injective Time-Change] The process
    <math|X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>>
    admits the oscillatory representation

    <\equation*>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>
    </equation*>

    where

    <\equation*>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation*>
  </theorem>

  <\proof>
    Starting from the spectral representation of <math|S<rsub|t>>:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Thus <math|\<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>.
  </proof>

  <\corollary>
    [Envelope in Standard Form] The oscillatory functions can be written in
    the standard form <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    where

    <\equation*>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation*>
  </corollary>

  <\proof>
    Factor the exponential:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>>>
    </align>

    where <math|A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>>.
  </proof>

  <\theorem>
    [Verification of Filter-Envelope Consistency] The spectral envelope

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    \ is the Fourier transform of the time-varying impulse response

    <\equation>
      h<rsub|t><around|(|u|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>
    </equation>
  </theorem>

  <\proof>
    Compute the Fourier transform:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|h<rsub|t>|]><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|t-\<theta\><around|(|t|)>|)>><eq-number>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Compute the inverse Fourier transform:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><rsup|-1><around|[|A<rsub|t>|]><around|(|u|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|<sqrt|\<theta\><rprime|'><around|(|t|)>>|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t-u|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|\<theta\><around|(|t|)>-t-u|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*\<delta\>*<around|(|u-<around|(|t-\<theta\><around|(|t|)>|)>|)><eq-number>>>|<row|<cell|>|<cell|=h<rsub|t><around|(|u|)><eq-number>>>>>
    </align>
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Oscillatory
      Processes and Normalized Injective Time-Changes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>