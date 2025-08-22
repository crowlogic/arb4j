<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Generation of Oscillatory Processes via Unitarily
  Time-Changed Stationary Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    [Time Change Function] Let <math|T<around|(|t|)>> be a function that is
    strictly increasing except possibly on a set of Lebesgue measure zero.
  </definition>

  <\definition>
    [Stationary Gaussian Process] Let <math|X<around|(|t|)>> be a stationary
    Gaussian process with spectral representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|d*\<Phi\><around|(|\<lambda\>|)>> is an orthogonal increment
    process and <math|S<around|(|\<lambda\>|)>> is the spectral density of
    <math|X<around|(|t|)>>.
  </definition>

  <\definition>
    [Unitarity-Preserving Time Change] The unitarily time-changed process is
    defined as:

    <\equation>
      Z<around|(|t|)>=<sqrt|T<rprime|'><around|(|t|)>>\<cdot\>X<around|(|T<around|(|t|)>|)>
    </equation>

    where <math|T<rprime|'><around|(|t|)>> is the derivative of
    <math|T<around|(|t|)>>.
  </definition>

  <\theorem>
    [Oscillatory Function Representation] The oscillatory function for the
    unitarily time-changed process is:

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*T<around|(|t|)>>
    </equation>
  </theorem>

  <\proof>
    Substituting the spectral representation of <math|X<around|(|t|)>> into
    the definition of <math|Z<around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<sqrt|T<rprime|'><around|(|t|)>>\<cdot\>X<around|(|T<around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|T<rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*T<around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*T<around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Priestley Gain Function] The gain function in Priestley's oscillatory
    process representation is:

    <\equation>
      A<around|(|t,\<lambda\>|)>=<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|T<around|(|t|)>-t|)>>
    </equation>
  </theorem>

  <\proof>
    The Priestley representation requires:

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Comparing with the oscillatory function representation:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Therefore:

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    Solving for <math|A<around|(|t,\<lambda\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<lambda\>|)>>|<cell|=\<phi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*T<around|(|t|)>>*e<rsup|-i*\<lambda\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|T<around|(|t|)>-t|)>><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Covariance Kernel] The covariance kernel <math|R<around|(|s,t|)>> of the
    unitarily time-changed process <math|Z<around|(|t|)>> is:

    <\equation*>
      R<around|(|s,t|)>=<sqrt|T<rprime|'><around|(|s|)>*T<rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|T<around|(|s|)>-T<around|(|t|)>|)>>*S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
    </equation*>
  </theorem>

  <\proof>
    The covariance kernel is defined as:

    <\equation>
      R<around|(|s,t|)>=<text|Cov><around|[|Z<around|(|s|)>,Z<around|(|t|)>|]>=E<around|[|Z<around|(|s|)><wide|Z<around|(|t|)>|\<bar\>>|]>
    </equation>

    Using the oscillatory function representation:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=E<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<phi\><rsub|t><around|(|\<mu\>|)>|\<bar\>><space|0.17em><wide|d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<lambda\>|)><wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|T<rprime|'><around|(|s|)>>*e<rsup|i*\<lambda\>*T<around|(|s|)>>*<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|-i*\<lambda\>*T<around|(|t|)>>*S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<sqrt|T<rprime|'><around|(|s|)>*T<rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|T<around|(|s|)>-T<around|(|t|)>|)>>*S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Variance Function] The variance function of the unitarily time-changed
    process is:

    <\equation*>
      \<sigma\><rsub|Z><rsup|2><around|(|t|)>=<text|Var><around|[|Z<around|(|t|)>|]>=T<rprime|'><around|(|t|)>\<cdot\>\<sigma\><rsub|X><rsup|2>
    </equation*>

    where <math|\<sigma\><rsub|X><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>>.
  </theorem>

  <\proof>
    Setting <math|s=t> in the covariance kernel:

    <\align>
      <tformat|<table|<row|<cell|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>|<cell|=R<around|(|t,t|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|T<rprime|'><around|(|t|)>*T<rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|T<around|(|t|)>-T<around|(|t|)>|)>>*S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=T<rprime|'><around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>\<cdot\>0>*S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=T<rprime|'><around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=T<rprime|'><around|(|t|)>\<cdot\>\<sigma\><rsub|X><rsup|2><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Time-Dependent Spectral Density] The time-dependent spectral density
    (evolutionary spectral density) is:

    <\equation*>
      S<rsub|Z><around|(|t,\<lambda\>|)>=T<rprime|'><around|(|t|)>\<cdot\>S<around|(|\<lambda\>|)>
    </equation*>
  </theorem>

  <\proof>
    The time-dependent spectral density is defined as:

    <\equation>
      S<rsub|Z><around|(|t,\<lambda\>|)>=<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>\<cdot\>S<around|(|\<lambda\>|)>
    </equation>

    Computing the modulus squared of the gain function:

    <\align>
      <tformat|<table|<row|<cell|<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>>|<cell|=<around*|\||<sqrt|T<rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|T<around|(|t|)>-t|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|T<rprime|'><around|(|t|)>>|\|><rsup|2><around*|\||e<rsup|i*\<lambda\>*<around|(|T<around|(|t|)>-t|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=T<rprime|'><around|(|t|)>\<cdot\>1<eq-number>>>|<row|<cell|>|<cell|=T<rprime|'><around|(|t|)><eq-number>>>>>
    </align>

    Therefore:

    <\equation>
      S<rsub|Z><around|(|t,\<lambda\>|)>=T<rprime|'><around|(|t|)>\<cdot\>S<around|(|\<lambda\>|)>
    </equation>
  </proof>

  <\theorem>
    [Expected Zero Count via Kac-Rice Formula] The expected zero count of the
    unitarily time-changed process <math|Z<around|(|t|)>> in the interval
    <math|<around|[|a,b|]>> is:

    <\equation>
      E<around|[|N<rsub|Z><around|[|a,b|]>|]>=\<rho\><rsub|X>\<cdot\><around|(|T<around|(|b|)>-T<around|(|a|)>|)>
    </equation>

    where

    <\equation>
      \<rho\><rsub|X>=<frac|1|\<pi\>>*<sqrt|<frac|-R<rsub|X><rprime|''><around|(|0|)>|\<sigma\><rsub|X><rsup|2>>>
    </equation>

    \ is the constant zero-crossing rate of the stationary process
    <math|X<around|(|t|)>>.
  </theorem>

  <\proof>
    TODO: merge with other paper where I stated this most excellently\ 
  </proof>
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