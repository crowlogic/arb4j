<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    [Unitary time change operator on <math|L<rsup|2><around|(|\<bbb-R\>|)>>]
    Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous
    with <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0> almost everywhere.
    The unitary time change operator <math|U<rsub|\<theta\>>> on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> is defined by

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>\<assign\><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>*<space|2em><text|for
      >f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>
    </equation>
  </definition>

  <\theorem>
    [Unitarity of <math|U<rsub|\<theta\>>>] The operator
    <math|U<rsub|\<theta\>>> defined above is unitary on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Absolute continuity with <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0>
    a.e. implies the change-of-variables formula

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*\<theta\><rprime|'><around|(|t|)><around|\||<space|0.17em>|\|>*f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|u|)>|\|><rsup|2>*<space|0.17em>d*u
    </equation>

    so <math|U<rsub|\<theta\>>> is isometric. Surjectivity follows from the
    same change-of-variables applied to <math|U<rsub|\<theta\><rsup|-1>>>,
    which exists almost everywhere under these hypotheses. Hence
    <math|U<rsub|\<theta\>>> is unitary.
  </proof>

  <\definition>
    [Oscillatory processes in the sense of Priestley] An oscillatory process
    <math|Z> is specified by a measurable gain function
    <math|A<rsub|t><around|(|\<lambda\>|)>> and has oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>
    </equation>

    The process <math|Z> has spectral representation

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure on
    <math|\<bbb-R\>> with spectral measure <math|F> satisfying

    <\equation>
      E*<around*|[|\<Phi\>*<around|(|d*\<lambda\>|)><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>=<with|math-font-family|bf|1><rsub|<around|{|\<lambda\>=\<mu\>|}>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    The covariance kernel of <math|Z> is

    <\equation>
      R<rsub|Z><around|(|t,s|)>\<assign\>E<around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\remark>
    [Real-valuedness condition] The oscillatory process <math|Z> is
    real-valued if and only if the gain satisfies conjugate symmetry:

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      <math|F>-almost every >\<lambda\>,<text|for each fixed >t
    </equation>
  </remark>

  <\theorem>
    [Unitary time change of stationary process yields oscillatory process]
    Let <math|X> be a zero-mean stationary Gaussian process with Cramér
    spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is the same complex orthogonal random measure with
    spectral measure <math|F> as in the oscillatory definition. Let
    <math|U<rsub|\<theta\>>> be a unitary time change operator as defined
    above. Then the transformed process

    <\equation>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    is an oscillatory process in the sense of Priestley with oscillatory
    function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>
  </theorem>

  <\proof>
    Starting from the stationary representation, we compute

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>>>
    </align>

    Defining <math|>

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    we have

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation*>

    which is precisely the oscillatory form. The covariance kernel becomes

    <\equation*>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)><around|\|||\|>*\<theta\><rprime|'><around|(|s|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation*>
  </proof>

  <\theorem>
    [Explicit gain function for unitary time change] In the setting of the
    previous theorem, the gain function for the oscillatory process <math|>

    <\equation>
      Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>
    </equation>

    \ is given by

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    The oscillatory function is

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    and the covariance kernel takes the form

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    From the previous theorem, we have <math|>

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    Since the oscillatory function must satisfy <math|>

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    one solves for the gain:

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=<frac|\<varphi\><rsub|t><around|(|\<lambda\>|)>|e<rsup|i*\<lambda\>*t>>=<frac|<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|e<rsup|i*\<lambda\>*t>>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation*>

    and substitutes back into the covariance formula:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em><wide|\<varphi\>|\<bar\>><rsub|s><around|(|\<lambda\>|)>}<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  -----<hrule>

  \;

  <\theorem>
    [Unitary time change on <math|L<rsup|2><around|(|\<bbb-R\>|)>>] Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous with
    <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0> almost everywhere.
    Define the operator

    <\equation*>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>\<assign\><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>*<space|2em><text|for
      >f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>.
    </equation*>

    Then <math|U<rsub|\<theta\>>> is unitary on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    By absolute continuity and <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0>
    a.e., the change-of-variables formula gives

    <\equation*>
      <big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*\<theta\><rprime|'><around|(|t|)><around|\||<space|0.17em>|\|>*f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|u|)>|\|><rsup|2>*<space|0.17em>d*u,
    </equation*>

    so <math|U<rsub|\<theta\>>> is an isometry. The inverse time change
    <math|\<theta\><rsup|-1>> exists a.e. and is absolutely continuous,
    yielding an isometric inverse by the same computation; hence
    <math|U<rsub|\<theta\>>> is unitary.
  </proof>

  <\theorem>
    [Oscillatory processes (Priestley framework)] Fix a finite nonnegative
    measure <math|F> on <math|\<bbb-R\>>. For each <math|t\<in\>\<bbb-R\>>,
    let <math|A<rsub|t>:\<bbb-R\>\<to\>\<bbb-C\>> be measurable with

    <\equation*>
      <big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>\<less\>\<infty\>.
    </equation*>

    Define the oscillatory function by

    <\equation*>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>.
    </equation*>

    There exists a complex orthogonal random measure <math|\<Phi\>> on
    <math|\<bbb-R\>> with spectral measure <math|F> such that the stochastic
    integral

    <\equation*>
      Z<around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation*>

    is well-defined for each <math|t>, and the covariance kernel satisfies

    <\equation*>
      R<rsub|Z><around|(|t,s|)>\<assign\>\<bbb-E\><around*|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>

    Moreover, if <math|X> is a zero-mean stationary process with spectral
    representation <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>
    for the same <math|F> and <math|\<Phi\>>, then <math|Z> reduces to
    <math|X> when <math|A<rsub|t><around|(|\<lambda\>|)>\<equiv\>1>.
  </theorem>

  <\proof>
    Given <math|F>, there exists a complex orthogonal random measure
    <math|\<Phi\>> with spectral measure <math|F>, i.e.,

    <\equation*>
      \<bbb-E\>*<around*|[|\<Phi\>*<around|(|d*\<lambda\>|)><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>=<with|math-font-family|bf|1><rsub|<around|{|\<lambda\>=\<mu\>|}>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>

    Square-integrability of <math|\<varphi\><rsub|t>> with respect to
    <math|F> ensures the stochastic integral isometric definition of
    <math|Z<around|(|t|)>> and yields

    <\equation*>
      \<bbb-E\><around*|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>

    Substituting <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    gives the stated kernel. If <math|A<rsub|t>\<equiv\>1>, then
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=e<rsup|i*\<lambda\>*t>>
    and <math|Z> coincides with the stationary Cramér form <math|X> built
    from the same <math|\<Phi\>>.
  </proof>

  <\theorem>
    [Real-valuedness condition] Let <math|Z> be as above with oscillatory
    function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.
    The process <math|Z> is real-valued if and only if, for each fixed
    <math|t>,

    <\equation*>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-almost every >\<lambda\>,
    </equation*>

    equivalently,

    <\equation*>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-almost every >\<lambda\>.
    </equation*>
  </theorem>

  <\proof>
    Write <math|Z<around|(|t|)>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>.
    Real-valuedness of <math|Z<around|(|t|)>> is equivalent to
    <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>> in
    <math|L<rsup|2><around|(|\<Omega\>|)>>, i.e.,

    <\equation*>
      <big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>=<wide|<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>>=<big|int><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em><wide|\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>>.
    </equation*>

    Using the standard symmetry relation for complex orthogonal random
    measures associated with real processes (the negative-frequency part is
    the complex conjugate of the positive-frequency part in the
    <math|L<rsup|2>> sense), one arrives at the necessary and sufficient
    Hermitian symmetry of the integrand: <math|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    <math|F>-a.e. As <math|e<rsup|i*<around|(|-\<lambda\>|)>*t>=<wide|e<rsup|i*\<lambda\>*t>|\<bar\>>>,
    this is equivalent to <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    <math|F>-a.e.
  </proof>

  <\theorem>
    [Unitary time change of a stationary process is oscillatory; explicit
    gain] Let <math|X> be a zero-mean stationary Gaussian process with
    spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>,
    </equation*>

    for a complex orthogonal random measure <math|\<Phi\>> with spectral
    measure <math|F>. Let <math|\<theta\>> satisfy the hypotheses of the
    unitary theorem, and define

    <\equation*>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>.
    </equation*>

    Then <math|Z> is an oscillatory process in the sense above with
    oscillatory function

    <\equation*>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>,
    </equation*>

    and gain

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>.
    </equation*>

    Its covariance kernel is

    <\equation*>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>

    Moreover, <math|Z> is real-valued if and only if

    <\equation*>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-almost every >\<lambda\>,<text|for each >t.
    </equation*>
  </theorem>

  <\proof>
    From the previous theorem, we have <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>.
    Since the oscillatory function must satisfy
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>,
    we solve for the gain:

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=<frac|\<varphi\><rsub|t><around|(|\<lambda\>|)>|e<rsup|i*\<lambda\>*t>>=<frac|<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|e<rsup|i*\<lambda\>*t>>.
    </equation*>

    Using the exponential division rule <math|<frac|e<rsup|a>|e<rsup|b>>=e<rsup|a-b>>,
    we get:

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em><frac|e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|e<rsup|i*\<lambda\>*t>>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>-i*\<lambda\>*t>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>.
    </equation*>

    Substituting back into the covariance formula:

    <\align*>
      <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em><wide|e<rsup|i*\<lambda\>*s>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|-i*\<lambda\>*s>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>e<rsup|-i*\<lambda\>*s>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*t-i*\<lambda\>*s>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.>>>>
    </align*>
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