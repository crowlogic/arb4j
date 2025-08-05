<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of Stationary and Oscillatory
  Processes on the Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    <dueto|Stationary Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called stationary
    if its covariance function satisfies

    <\equation*>
      R<around|(|s,t|)>=R*<around|(|t-s|)>
    </equation*>

    for all <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    <dueto|Oscillatory Process (Priestley)>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called
    oscillatory if it possesses an evolutionary spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    where <math|A<around|(|t,\<omega\>|)>> is the evolutionary amplitude
    function and <math|Z<around|(|\<omega\>|)>> is an orthogonal increment
    process.
  </definition>

  <\theorem>
    <dueto|Eigenfunction Property for Stationary Processes>Let
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> be a stationary
    process with covariance function <math|R<around|(|\<tau\>|)>> and
    covariance operator

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*f<around|(|s|)>*d*s
    </equation*>

    Then the complex exponentials <math|e<rsup|i*\<omega\>*t>> are
    eigenfunctions of <math|K> with eigenvalues equal to the power spectral
    density <math|S<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the action of <math|K> on <math|e<rsup|i*\<omega\>*t>>:

    <\equation*>
      <around|(|K*e<rsup|i*\<omega\>*t>|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*e<rsup|i*\<omega\>*s>*d*s
    </equation*>

    Substituting <math|\<tau\>=t-s>:

    <\align*>
      <tformat|<table|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>\<cdot\>S<around|(|\<omega\>|)>>>>>
    </align*>

    where

    <\equation*>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation*>

    is the power spectral density by the Wiener-Khintchine theorem.
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Oscillatory Processes>Let
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> be an oscillatory
    process with evolutionary spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    and covariance function

    <\equation*>
      C<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|s,\<omega\>|)>*A<rsup|\<ast\>><around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>
    </equation*>

    where <math|F<around|(|\<omega\>|)>> is the spectral measure. Then the
    oscillatory functions

    <\equation*>
      \<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation*>

    are eigenfunctions of the covariance operator

    <\equation*>
      <around|(|K*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*f<around|(|s|)>*d*s
    </equation*>

    with eigenvalues <math|d*F<around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the action of <math|K> on the oscillatory function
    <math|\<phi\><around|(|s,\<omega\>|)>=A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>>:

    <\equation*>
      <around|(|K*\<phi\>|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s
    </equation*>

    Substitute <math|C<around|(|t,s|)>=<big|int>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*d*F<around|(|\<lambda\>|)>>:

    <\align*>
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*d*F<around|(|\<lambda\>|)>|]>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*F<around|(|\<lambda\>|)>>>>>
    </align*>

    By Fubini's theorem, the order of integration may be exchanged:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s|]>*d*F<around|(|\<lambda\>|)>
    </equation*>

    The inner integral represents the orthogonality condition in the
    evolutionary spectral representation:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>
    </equation*>

    Therefore

    <\equation*>
      <around|(|K*\<phi\>|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>=A<around|(|t,\<omega\>|)>*d*F<around|(|\<omega\>|)>=\<phi\><around|(|t,\<omega\>|)>\<cdot\>d*F<around|(|\<omega\>|)>
    </equation*>
  </proof>

  <\lemma>
    <dueto|Orthogonality Property>For the evolutionary spectral
    representation, the orthogonality condition

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s,\<lambda\>|)>*A<around|(|s,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*s=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>
    </equation*>

    follows from the requirement that <math|d*Z<around|(|\<omega\>|)>> be an
    orthogonal increment process.
  </lemma>

  <\proof>
    The orthogonality of <math|d*Z<around|(|\<omega\>|)>> requires

    <\equation*>
      \<bbb-E\><around|[|d*Z<around|(|\<lambda\>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>|]>=\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*d*F<around|(|\<lambda\>|)>
    </equation*>

    This condition, with the evolutionary spectral representation, directly
    implies the stated orthogonality property for the amplitude functions.
  </proof>

  <\theorem>
    <dueto|Real-Valued Oscillatory Processes>Let <math|Z<around|(|t|)>> be a
    sample path realization of an oscillatory process (with evolutionary
    spectral representation)

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|\<lambda\>><around|(|t|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|A<rsub|t><around|(|\<omega\>|)>> is the gain function and
    <math|\<Phi\><around|(|\<omega\>|)>> is an orthogonal increment process.
    Then <math|X<around|(|t|)>> is real-valued if and only if the following
    conditions hold:

    <\equation>
      A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)><space|2em><text|(Gain
      Conjugate Symmetry)>
    </equation>

    <\equation>
      d*Z*<around|(|-\<omega\>|)>=d*Z<rsup|\<ast\>><around|(|\<omega\>|)><space|2em><text|(Increment
      Conjugate Symmetry)>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Necessity:> Assume <math|X<around|(|t|)>> is
    real-valued, so

    <\equation>
      X<around|(|t|)>=X<rsup|\<ast\>><around|(|t|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

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

    <\equation>
      A<around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,-\<omega\>|)>
    </equation>

    <\equation>
      d*Z<around|(|\<omega\>|)>=d*Z<rsup|\<ast\>>*<around|(|-\<omega\>|)>
    </equation>

    <with|font-series|bold|Sufficiency:> Assume the two conjugate symmetry
    conditions hold. Then:

    <\equation>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation>

    <\equation>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,-\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*Z*<around|(|-\<omega\>|)>
    </equation>

    Substituting <math|\<omega\>\<mapsto\>-\<omega\>>:

    <\equation*>
      X<rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>=X<around|(|t|)>
    </equation*>

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

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)>>|<cell|=<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|]><rsup|\<ast\>>>>|<row|<cell|>|<cell|=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>>>|<row|<cell|>|<cell|=A<around|(|t,-\<omega\>|)>*e<rsup|-i*\<omega\>*t><space|1em><text|(by
      amplitude symmetry)>>>|<row|<cell|>|<cell|=\<phi\><around|(|t,-\<omega\>|)>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    <dueto|Equivalence of Evolutionary Spectral and Filter
    Representations>Let <math|X<around|(|t|)>> be a stochastic process. The
    evolutionary spectral representation

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
    The filter kernel <math|h<rsub|t>*<around|(|t-s|)>> is related to the
    gain function and oscillatory function by the Fourier transform
    relationships:

    <align|<tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\><eq-number>>>>>>

    where <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    is the oscillatory function.

    The inverse relationships are:

    <\equation>
      A<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s
    </equation>

    <\equation>
      \<phi\><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u
    </equation>

    To establish the equivalence of the two representations, substitute the
    orthogonal increment relationship <math|d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*s>*d*W<around|(|s|)>>
    into the evolutionary spectral representation:

    <align|<tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*s>*d*W<around|(|s|)>|]>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*e<rsup|-i*\<omega\>*s>*d*\<omega\>|]>*d*W<around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>|]>*d*W<around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*d*W<around|(|s|)><eq-number>>>>>>

    where the last equality follows from the definition of
    <math|h<rsub|t>*<around|(|t-s|)>> with <math|u=t-s>.
  </proof>

  <\theorem>
    <dueto|Fourier Transform Relationships>The gain function
    <math|A<around|(|t,\<omega\>|)>>, oscillatory function
    <math|\<phi\><around|(|t,\<omega\>|)>>, and filter kernel
    <math|h<rsub|t><around|(|u|)>> satisfy the following Fourier transform
    relationships:

    <align|<tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s<eq-number>>>|<row|<cell|\<phi\><around|(|t,\<omega\>|)>>|<cell|=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u<eq-number>>>|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>>>>
  </theorem>

  <\proof>
    The proof establishes each transform relationship directly.

    For the first relationship, apply the inverse Fourier transform to
    <math|h<rsub|t>*<around|(|t-s|)>>:

    <align|<tformat|<table|<row|<cell|A<around|(|t,\<omega\>|)>>|<cell|=\<cal-F\><rsub|s><rsup|-1>*<around|[|h<rsub|t>*<around|(|t-s|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s<eq-number>>>>>>

    For the oscillatory function relationship, substitute the definition
    <math|\<phi\><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>:

    <align|<tformat|<table|<row|<cell|\<phi\><around|(|t,\<omega\>|)>>|<cell|=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*d*s|]>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*s>*e<rsup|i*\<omega\>*t>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t>*<around|(|t-s|)>*e<rsup|-i*\<omega\>*<around|(|s-t|)>>*d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|t><around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*d*u<eq-number>>>>>>

    where <math|u=t-s> in the last step.

    For the inverse relationships, apply the Fourier transform to recover
    <math|h<rsub|t>*<around|(|t-s|)>>:

    <align|<tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=\<cal-F\><rsub|\<omega\>><rsup|-1>*<around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*s>*d*\<omega\><eq-number>>>>>>

    Similarly:

    <align|<tformat|<table|<row|<cell|h<rsub|t>*<around|(|t-s|)>>|<cell|=\<cal-F\><rsub|\<omega\>><rsup|-1>*<around|[|\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*<around|(|t-s|)>>*d*\<omega\><eq-number>>>>>>
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