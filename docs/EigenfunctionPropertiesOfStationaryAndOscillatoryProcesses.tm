<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunction Properties of Stationary and Oscillatory
  Stochastic Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <section*|Introduction>

  Oscillatory processes generalize stationary stochastic processes by
  allowing their spectral properties to evolve over time. Central to this
  representation is the <em|gain function> <math|A<around|(|t,\<omega\>|)>>,
  a complex-valued function that works in conjunction with an underlying
  spectral density <math|f<around|(|\<omega\>|)>> to produce time-varying
  spectral characteristics. The magnitude
  <math|<around|\||A<around|(|t,\<omega\>|)>|\|>> scales the spectral power
  at each frequency and time, while the argument <math|arg
  <around|(|A<around|(|t,\<omega\>|)>|)>> introduces frequency-dependent
  phase shifts. The effective spectral density at time <math|t> becomes
  <math|<around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*f<around|(|\<omega\>|)>>,
  showing how the gain function and underlying spectral density work together
  multiplicatively.

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

    where <math|A<around|(|t,\<omega\>|)>> is the gain function and
    <math|Z<around|(|\<omega\>|)>> is an orthogonal increment process with
    spectral measure <math|d*F<around|(|\<omega\>|)>=f<around|(|\<omega\>|)>*d*\<omega\>>,
    where <math|f<around|(|\<omega\>|)>> is the underlying spectral density.
  </definition>

  <\theorem>
    [Covariance Structure of Oscillatory Processes] For an oscillatory
    process with gain function <math|A<around|(|t,\<omega\>|)>> and
    underlying spectral density <math|f<around|(|\<omega\>|)>>, the
    covariance function is given by

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*f<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    This shows that the gain function works in conjunction with the
    underlying spectral density, with the effective spectral density at times
    <math|s> and <math|t> being the product
    <math|A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*f<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    From the evolutionary spectral representation and the orthogonality
    property <math|\<bbb-E\>*<around|[|d*Z<around|(|\<omega\><rsub|1>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]>=\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*f<around|(|\<omega\><rsub|1>|)>*d*\<omega\><rsub|1>>:

    <\align>
      <tformat|<table|<row|<cell|C<around|(|s,t|)>>|<cell|=\<bbb-E\>*<around|[|X<around|(|s|)>*X<rsup|\<ast\>><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\><rsub|1>|)>*e<rsup|i*\<omega\><rsub|1>*s>*d*Z<around|(|\<omega\><rsub|1>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\><rsub|2>|)>*e<rsup|-i*\<omega\><rsub|2>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\><rsub|1>|)>*A<rsup|\<ast\>><around|(|t,\<omega\><rsub|2>|)>*e<rsup|i*\<omega\><rsub|1>*s>*e<rsup|-i*\<omega\><rsub|2>*t>*\<bbb-E\>*<around|[|d*Z<around|(|\<omega\><rsub|1>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*f<around|(|\<omega\>|)>*d*\<omega\><eq-number>>>>>
    </align>
  </proof>

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
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    and covariance function

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<omega\>|)>*A<rsup|\<ast\>><rsub|t><around|(|\<omega\>|)>*f<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    where <math|f<around|(|\<omega\>|)>> is the underlying spectral density.
    Then the oscillatory functions <math|>

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>

    \ are eigenfunctions of the covariance operator

    <\equation>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s
    </equation>

    with eigenvalues <math|f<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the action of <math|K> on the oscillatory function
    <math|\<phi\><around|(|s,\<omega\>|)>=A<rsub|s><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*s>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*f<around|(|\<lambda\>|)>*d*\<lambda\>|]>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s<eq-number>>>>>
    </align>

    By Fubini's theorem, the order of integration may be exchanged:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*f<around|(|\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*\<lambda\><eq-number>>>>>
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
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*f<around|(|\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=A<around|(|t,\<omega\>|)>*f<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,\<omega\>|)>\<cdot\>f<around|(|\<omega\>|)><eq-number>>>>>
    </align>

    This establishes that <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    are eigenfunctions with eigenvalues <math|f<around|(|\<omega\>|)>>.
  </proof>

  <\theorem>
    [Reality Conditions for Oscillatory Processes] Let

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    with gain function <math|A<around|(|t,\<omega\>|)>> and orthogonal
    increment process <math|d*Z<around|(|\<omega\>|)>>. The process
    <math|X<around|(|t|)>> is real-valued for all <math|t> if and only if the
    following conditions hold for all <math|t> and almost all
    <math|\<omega\>>:

    <\enumerate>
      <item><math|A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>
      <htab|0pt>(conjugate symmetry of the gain function),

      <item><math|d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>>
      <htab|0pt>(conjugate symmetry of the increments).
    </enumerate>
  </theorem>

  <\proof>
    The process <math|X<around|(|t|)>> is real-valued if and only if
    <math|X<rsup|\<ast\>><around|(|t|)>=X<around|(|t|)>> for each <math|t>.

    Compute the complex conjugate:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>|)><rsup|\<ast\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation*>

    Make the substitution <math|\<omega\><rprime|'>=-\<omega\>> (so
    <math|d*\<omega\><rprime|'>=-d*\<omega\>>), and note that as the limits
    are infinite, the domain is unchanged under sign reversal:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation*>

    For the process to be real-valued for all <math|t>, it must hold that
    <math|X<rsup|\<ast\>><around|(|t|)>=X<around|(|t|)>> for all <math|t>,
    i.e.,

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation*>

    This equality holds if and only if the integrands are equal for all
    <math|\<omega\>>, up to a set of measure zero. Thus, the following must
    hold:

    <\equation*>
      A<around|(|t,\<omega\>|)>*d*Z<around|(|\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>*d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation*>

    for all <math|t> and <math|\<omega\>>. This is equivalent to demanding:

    <\align*>
      <tformat|<table|<row|<cell|A<rsup|\<ast\>><around|(|t,-\<omega\>|)>>|<cell|=A<around|(|t,\<omega\>|)>>>|<row|<cell|d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>>|<cell|=d*Z<around|(|\<omega\>|)>>>>>
    </align*>

    Taking complex conjugates of both sides in the second line:

    <\equation*>
      d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation*>

    So, the process is real-valued if and only if the gain function and the
    increment process each have conjugate symmetry:

    <\equation*>
      A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>,<space|1em>d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation*>
  </proof>

  <\theorem>
    [Equivalence of Evolutionary Spectral and Filter Representations] Let
    <math|X<around|(|t|)>> be a stochastic process. The evolutionary spectral
    representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|A<around|(|t,\<omega\>|)>> is the gain function and
    <math|d*Z<around|(|\<omega\>|)>> is an orthogonal increment process, is
    equivalent to the time-domain filter representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*d*W<around|(|s|)>
    </equation>

    where <math|h<rsub|t>*<around|(|t-s|)>> is a time-dependent filter kernel
    and <math|d*W<around|(|s|)>> is an orthogonal increment process.
  </theorem>

  <\proof>
    The filter kernel <math|h<rsub|t>*<around|(|t-s|)>> relates to the gain
    function and the oscillatory function via Fourier transform
    relationships:

    <\align>
      <tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\><eq-number>>>>>
    </align>

    where <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    is the oscillatory function.

    To establish equivalence, substitute the orthogonal increment
    relationship <math|d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*s>*d*W<around|(|s|)>>
    into the evolutionary spectral representation:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*s>*d*W<around|(|s|)>|]>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*s>*d*\<omega\>|]>*d*W<around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>|]>*d*W<around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*d*W<around|(|s|)><eq-number>>>>>
    </align>

    where the last equality follows from the definition of
    <math|h<rsub|t>*<around|(|t-s|)>> with <math|u=t-s>.
  </proof>

  <\theorem>
    [Fourier Transform Relationships] The gain function
    <math|A<around|(|t,\<omega\>|)>>, oscillatory function
    <math|\<phi\><around|(|t,\<omega\>|)>>, and filter kernel
    <math|h<rsub|t><around|(|u|)>> satisfy the following Fourier transform
    relationships:

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s<eq-number>>>|<row|<cell|\<phi\><around|(|t,\<omega\>|)>>|<cell|=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u<eq-number>>>|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>>>
    </align>
  </theorem>

  <\proof>
    For the first relationship, apply the inverse Fourier transform to
    <math|h<rsub|t>*<around|(|t-s|)>>:

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=\<cal-F\><rsub|s><rsup|-1>*<around|[|h<rsub|t>*<around|(|t-s|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s<eq-number>>>>>
    </align>

    For the oscillatory function relationship, substitute the definition
    <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><around|(|t,\<omega\>|)>>|<cell|=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s|]>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*e<rsup|i*\<omega\>*t>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*<around|(|s-t|)>>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u<eq-number>>>>>
    </align>

    where <math|u=t-s> in the last step.

    For the inverse relationships, apply the Fourier transform to recover
    <math|h<rsub|t>*<around|(|t-s|)>>:

    <\align>
      <tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=\<cal-F\><rsub|\<omega\>><rsup|-1>*<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\><eq-number>>>>>
    </align>

    Similarly:

    <\align>
      <tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=\<cal-F\><rsub|\<omega\>><rsup|-1>*<around|[|\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>>>
    </align>
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
    <math|\<bbb-E\>*<around|[|d*Z<around|(|\<lambda\>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>|]>=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*f<around|(|\<lambda\>|)>*d*\<lambda\>>.
    This condition, combined with the evolutionary spectral representation,
    directly implies the stated orthogonality property for the gain
    functions.
  </proof>

  <\theorem>
    [Correspondence Principle] The eigenfunction properties of oscillatory
    processes reduce to those of stationary processes when the gain function
    becomes constant: <math|A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    When <math|A<around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>> is
    independent of time, the oscillatory functions become
    <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>,
    which are scalar multiples of the complex exponentials
    <math|e<rsup|i*\<omega\>*t>>. The covariance function reduces to

    <\equation>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<around|(|\<omega\>|)>|\|><rsup|2>*f<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<omega\>
    </equation>

    which depends only on <math|s-t>, recovering the stationary case with
    effective spectral density <math|<around|\||A<around|(|\<omega\>|)>|\|><rsup|2>*f<around|(|\<omega\>|)>>.
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

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>