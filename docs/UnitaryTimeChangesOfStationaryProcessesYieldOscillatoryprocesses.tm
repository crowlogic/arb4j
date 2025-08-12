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