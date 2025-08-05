<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of Stationary and Oscillatory
  Processes on the Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    [Stationary Process] A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called stationary
    if its covariance function satisfies <math|R<around|(|s,t|)>=R*<around|(|t-s|)>>
    for all <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    [Oscillatory Process (Priestley)] A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called
    oscillatory if it possesses an evolutionary spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|A<around|(|t,\<omega\>|)>> is the evolutionary amplitude
    function and <math|Z<around|(|\<omega\>|)>> is an orthogonal increment
    process.
  </definition>

  <\theorem>
    [Eigenfunction Property for Stationary Processes] Let
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> be a stationary
    process with covariance function <math|R<around|(|\<tau\>|)>> and
    covariance operator

    <\equation>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*f<around|(|s|)>*d*s
    </equation>

    Then the complex exponentials <math|e<rsup|i*\<omega\>*t>> are
    eigenfunctions of <math|K> with eigenvalues equal to the power spectral
    density <math|S<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the action of <math|K> on <math|e<rsup|i*\<omega\>*t>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|K*e<rsup|i*\<omega\>*t>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*e<rsup|i*\<omega\>*s>*d*s<eq-number>>>>>
    </align>

    Substituting <math|\<tau\>=t-s>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>\<cdot\>S<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation>

    \ is the power spectral density by the Wiener-Khintchine theorem.
  </proof>

  <\theorem>
    [Eigenfunction Property for Oscillatory Processes] Let
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> be an oscillatory
    process with evolutionary spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    and covariance function

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>
    </equation>

    where <math|F<around|(|\<omega\>|)>> is the spectral measure. Then the
    oscillatory functions <math|>

    <\equation*>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation*>

    are eigenfunctions of the covariance operator

    <\equation>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s
    </equation>

    with eigenvalues <math|d*F<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the action of <math|K> on the oscillatory function
    <math|\<phi\><around|(|s,\<omega\>|)>=A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*d*F<around|(|\<lambda\>|)>|]>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s<eq-number>>>>>
    </align>

    By Fubini's theorem, the order of integration may be exchanged:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    The inner integral represents the orthogonality condition in the
    evolutionary spectral representation. By the fundamental property of
    evolutionary spectral representations:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>
    </equation>

    where <math|\<delta\>*<around|(|\<lambda\>-\<omega\>|)>> is the Dirac
    delta function.

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=A<around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,\<omega\>|)>\<cdot\><frac|d*F<around|(|\<omega\>|)>|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>\<cdot\>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,\<omega\>|)>\<cdot\>d*F<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    This establishes that <math|>

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    \ are eigenfunctions with eigenvalues <math|d*F<around|(|\<omega\>|)>>.
  </proof>

  <\lemma>
    [Orthogonality Property] For the evolutionary spectral representation,
    the orthogonality condition

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>
    </equation>

    follows from the requirement that <math|d*Z<around|(|\<omega\>|)>> be an
    orthogonal increment process.
  </lemma>

  <\proof>
    The orthogonality of <math|d*Z<around|(|\<omega\>|)>> requires

    <\equation>
      \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>|]>=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>
    </equation>

    This condition, combined with the evolutionary spectral representation,
    directly implies the stated orthogonality property for the amplitude
    functions.
  </proof>

  <\theorem>
    [Correspondence Principle] The eigenfunction properties of oscillatory
    processes reduce to those of stationary processes when the evolutionary
    amplitude function becomes constant: <math|>

    <\equation>
      A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    When <math|A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>> is
    independent of time, the oscillatory functions become <math|>

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    which are scalar multiples of the complex exponentials
    <math|e<rsup|i*\<omega\>*t>>. The covariance function reduces to

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<around|(|\<omega\>|)>|\|><rsup|2>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*F<around|(|\<omega\>|)>
    </equation>

    which depends only on <math|s-t>, recovering the stationary case.
  </proof>

  <\theorem>
    <dueto|Real-Valued Oscillatory Processes>Let <math|X<around|(|t|)>> be an
    oscillatory process with evolutionary spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|A<around|(|t,\<omega\>|)>> is the evolutionary amplitude
    function and <math|Z<around|(|\<omega\>|)>> is an orthogonal increment
    process. Then <math|X<around|(|t|)>> is real-valued if and only if the
    following conditions hold:

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=A<rsup|\<ast\>><around|(|t,-\<omega\>|)><space|1em><text|(Amplitude
      Conjugate Symmetry)><eq-number>>>|<row|<cell|d*Z*<around|(|-\<omega\>|)>>|<cell|=d*Z<rsup|\<ast\>><around|(|\<omega\>|)><space|1em><text|(Increment
      Conjugate Symmetry)><eq-number>>>>>
    </align>
  </theorem>

  <\proof>
    <with|font-series|bold|Necessity:> Assume <math|X<around|(|t|)>> is
    real-valued, so <math|X<around|(|t|)>=X<rsup|\<ast\>><around|(|t|)>> for
    all <math|t\<in\>\<bbb-R\>>.

    Taking the complex conjugate of the evolutionary spectral representation:

    <\equation>
      X<rsup|\<ast\>><around|(|t|)>=<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>|]><rsup|\<ast\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation>

    Making the substitution <math|\<omega\>\<mapsto\>-\<omega\>> in this
    integral:

    <\equation>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation>

    Since <math|X<around|(|t|)>=X<rsup|\<ast\>><around|(|t|)>>, we have:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation>

    By the uniqueness of the evolutionary spectral representation, this
    equality holds for all <math|t> if and only if:

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=A<rsup|\<ast\>><around|(|t,-\<omega\>|)><eq-number>>>|<row|<cell|d*Z<around|(|\<omega\>|)>>|<cell|=d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Sufficiency:> Assume the two conjugate symmetry
    conditions hold. Then:

    <\align>
      <tformat|<table|<row|<cell|X<rsup|\<ast\>><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,-\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z*<around|(|-\<omega\>|)><space|1em><text|(by
      condition 1 and 2)><eq-number>>>>>
    </align>

    Substituting <math|\<omega\>\<mapsto\>-\<omega\>>:

    <\align>
      <tformat|<table|<row|<cell|X<rsup|\<ast\>><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>=X<around|(|t|)><eq-number>>>>>
    </align>

    Therefore, <math|X<around|(|t|)>> is real-valued.
  </proof>

  <\theorem>
    <dueto|Eigenfunction Conjugate Pairs>Under the conditions for real-valued
    oscillatory processes, the eigenfunctions
    <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    satisfy the conjugate symmetry relation

    <\equation>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>=\<phi\><around|(|t,-\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    Given that <math|A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>,
    we compute:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>>|<cell|=<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|]><rsup|\<ast\>><eq-number>>>|<row|<cell|>|<cell|=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=A<around|(|t,-\<omega\>|)>*e<rsup|-i*\<omega\>*t><space|1em><text|(by
      amplitude symmetry)><eq-number>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,-\<omega\>|)><eq-number>>>>>
    </align>

    This establishes that eigenfunctions come in conjugate pairs, which is
    the natural structure for real-valued oscillatory processes.
  </proof>

  <\corollary>
    <dueto|Reduction to Stationary Case>For stationary processes where
    <math|A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>> is
    time-independent, the amplitude conjugate symmetry condition reduces to
    <math|A<around|(|\<omega\>|)>=A<rsup|\<ast\>>*<around|(|-\<omega\>|)>>,
    which implies that the power spectral density
    <math|S<around|(|\<omega\>|)>=<around|\||A<around|(|\<omega\>|)>|\|><rsup|2>>
    satisfies <math|S<around|(|\<omega\>|)>=S*<around|(|-\<omega\>|)>>.
  </corollary>

  <\proof>
    When <math|A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>> is constant
    in time, the condition <math|A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>
    becomes <math|A<around|(|\<omega\>|)>=A<rsup|\<ast\>>*<around|(|-\<omega\>|)>>.
    The power spectral density is:

    <\equation>
      S<around|(|\<omega\>|)>=<around|\||A<around|(|\<omega\>|)>|\|><rsup|2>=A<around|(|\<omega\>|)>*A<rsup|\<ast\>><around|(|\<omega\>|)>=A<around|(|\<omega\>|)>*A*<around|(|-\<omega\>|)>=<around|\||A*<around|(|-\<omega\>|)>|\|><rsup|2>=S*<around|(|-\<omega\>|)>
    </equation>

    which is the familiar even symmetry condition for real-valued stationary
    processes.
  </proof>

  \;

  \;
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
    <associate|auto-1|<tuple|40|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|40|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Index>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Glossary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>