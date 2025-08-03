<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Shift Group and Fourier Transform of Complex
  Exponentials>|<doc-date|>>

  <\definition>
    [Shift Operator] For <math|t<rsub|0>\<in\>\<bbb-R\>>, the shift operator
    <math|S<rsub|t<rsub|0>>> is defined by

    <\equation*>
      <around|(|S<rsub|t<rsub|0>>*f|)><around|(|t|)>=f*<around|(|t-t<rsub|0>|)>
    </equation*>

    for any function <math|f> in the appropriate function space.
  </definition>

  <\definition>
    [Fourier Transform] For <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>,
    the Fourier transform is defined by

    <\equation*>
      <wide|f|^><around|(|\<omega\>|)>=\<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*e<rsup|-i*\<omega\>*t>*d*t
    </equation*>
  </definition>

  <\theorem>
    [Complex Exponentials as Eigenfunctions of Shift Operators] Let
    <math|\<omega\>\<in\>\<bbb-R\>> and consider the complex exponential
    function <math|e<rsub|\<omega\>><around|(|t|)>=e<rsup|i*\<omega\>*t>>.
    Then for any <math|t<rsub|0>\<in\>\<bbb-R\>>,

    <\equation*>
      S<rsub|t<rsub|0>><around|[|e<rsub|\<omega\>>|]>=e<rsup|-i*\<omega\>*t<rsub|0>>\<cdot\>e<rsub|\<omega\>>
    </equation*>

    That is, <math|e<rsub|\<omega\>>> is an eigenfunction of
    <math|S<rsub|t<rsub|0>>> with eigenvalue
    <math|e<rsup|-i*\<omega\>*t<rsub|0>>>.
  </theorem>

  <\proof>
    By definition of the shift operator:

    <\align>
      <tformat|<table|<row|<cell|<around|(|S<rsub|t<rsub|0>>*e<rsub|\<omega\>>|)><around|(|t|)>>|<cell|=e<rsub|\<omega\>>*<around|(|t-t<rsub|0>|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*<around|(|t-t<rsub|0>|)>><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t-i*\<omega\>*t<rsub|0>><eq-number>>>|<row|<cell|>|<cell|=e<rsup|-i*\<omega\>*t<rsub|0>>\<cdot\>e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=e<rsup|-i*\<omega\>*t<rsub|0>>\<cdot\>e<rsub|\<omega\>><around|(|t|)><eq-number>>>>>
    </align>

    Therefore, <math|S<rsub|t<rsub|0>><around|[|e<rsub|\<omega\>>|]>=e<rsup|-i*\<omega\>*t<rsub|0>>\<cdot\>e<rsub|\<omega\>>>.
  </proof>

  <\theorem>
    [Time Shift Property of Fourier Transform] Let
    <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and
    <math|t<rsub|0>\<in\>\<bbb-R\>>. Then

    <\equation*>
      \<cal-F\>*<around|[|S<rsub|t<rsub|0>>*f|]><around|(|\<omega\>|)>=e<rsup|-i*\<omega\>*t<rsub|0>>*<wide|f|^><around|(|\<omega\>|)>
    </equation*>
  </theorem>

  <\proof>
    Let <math|g<around|(|t|)>=f*<around|(|t-t<rsub|0>|)>=<around|(|S<rsub|t<rsub|0>>*f|)><around|(|t|)>>.
    Then:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|g|]><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*e<rsup|-i*\<omega\>*t>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-t<rsub|0>|)>*e<rsup|-i*\<omega\>*t>*d*t<eq-number>>>>>
    </align>

    Substituting <math|u=t-t<rsub|0>>, so <math|t=u+t<rsub|0>> and
    <math|d*t=d*u>:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|g|]><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-i*\<omega\>*<around|(|u+t<rsub|0>|)>>*d*u<eq-number>>>|<row|<cell|>|<cell|=e<rsup|-i*\<omega\>*t<rsub|0>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-i*\<omega\>*u>*d*u<eq-number>>>|<row|<cell|>|<cell|=e<rsup|-i*\<omega\>*t<rsub|0>>*<wide|f|^><around|(|\<omega\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Frequency Shift Property of Fourier Transform] Let
    <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and
    <math|\<omega\><rsub|0>\<in\>\<bbb-R\>>. Then

    <\equation*>
      \<cal-F\>*<around|[|e<rsup|i*\<omega\><rsub|0>*t>*f<around|(|t|)>|]><around|(|\<omega\>|)>=<wide|f|^>*<around|(|\<omega\>-\<omega\><rsub|0>|)>
    </equation*>
  </theorem>

  <\proof>
    <\align>
      <tformat|<table|<row|<cell|\<cal-F\>*<around|[|e<rsup|i*\<omega\><rsub|0>*t>*f<around|(|t|)>|]><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsub|0>*t>*f<around|(|t|)>*e<rsup|-i*\<omega\>*t>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)>*e<rsup|-i*<around|(|\<omega\>-\<omega\><rsub|0>|)>*t>*d*t<eq-number>>>|<row|<cell|>|<cell|=<wide|f|^>*<around|(|\<omega\>-\<omega\><rsub|0>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Fourier Transform of Complex Exponential] Let
    <math|\<omega\><rsub|0>\<in\>\<bbb-R\>>. In the distributional sense,

    <\equation*>
      \<cal-F\><around|[|e<rsup|i*\<omega\><rsub|0>*t>|]><around|(|\<omega\>|)>=2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>
    </equation*>

    where <math|\<delta\>> is the Dirac delta distribution.
  </theorem>

  <\proof>
    We prove this by showing that for any test function
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>> (Schwartz space):

    <\equation*>
      <around|\<langle\>|\<cal-F\><around|[|e<rsup|i*\<omega\><rsub|0>*t>|]>,\<phi\>|\<rangle\>>=2*\<pi\>*\<phi\><around|(|\<omega\><rsub|0>|)>
    </equation*>

    By definition of the Fourier transform of distributions:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|\<cal-F\><around|[|e<rsup|i*\<omega\><rsub|0>*t>|]>,\<phi\>|\<rangle\>>>|<cell|=<around|\<langle\>|e<rsup|i*\<omega\><rsub|0>*t>,\<cal-F\><around|[|\<phi\>|]>|\<rangle\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsub|0>*t>*<wide|\<phi\>|^><around|(|t|)>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsub|0>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*t>*d*\<omega\>*d*t<eq-number>>>>>
    </align>

    By Fubini's theorem (valid for <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>):

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|\<omega\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|0>-\<omega\>|)>*t>*d*t*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|\<omega\>|)>\<cdot\>2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|0>-\<omega\>|)>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=2*\<pi\>*\<phi\><around|(|\<omega\><rsub|0>|)><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>,\<phi\>|\<rangle\>><eq-number>>>>>
    </align>

    Therefore, <math|\<cal-F\><around|[|e<rsup|i*\<omega\><rsub|0>*t>|]>=2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>>.
  </proof>

  <\theorem>
    [Diagonalization Property] Let <math|T> be a bounded linear operator on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> that commutes with all shift
    operators, i.e., <math|T*S<rsub|t<rsub|0>>=S<rsub|t<rsub|0>>*T> for all
    <math|t<rsub|0>\<in\>\<bbb-R\>>. Then <math|T> is diagonalized by the
    Fourier transform in the sense that there exists a function
    <math|m<around|(|\<omega\>|)>> such that

    <\equation*>
      \<cal-F\>*<around|[|T*f|]>=m\<cdot\>\<cal-F\><around|[|f|]>
    </equation*>

    for all <math|f> in the domain of <math|T>.
  </theorem>

  <\proof>
    Since <math|T> commutes with all shift operators, by Theorem 1, the
    complex exponentials <math|e<rsup|i*\<omega\>*t>> are eigenfunctions of
    <math|T>. Let <math|T*e<rsup|i*\<omega\>*t>=m<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    for some function <math|m<around|(|\<omega\>|)>>.

    For any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> with
    <math|<wide|f|^>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, we can write (by
    the inverse Fourier transform):

    <\equation*>
      f<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation*>

    Applying <math|T> and using linearity:

    <\align>
      <tformat|<table|<row|<cell|T*f<around|(|t|)>>|<cell|=T*<around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*T<around|[|e<rsup|i*\<omega\>*t>|]>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<omega\>|)>*m<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\><eq-number>>>>>
    </align>

    Taking the Fourier transform:

    <\equation*>
      \<cal-F\>*<around|[|T*f|]><around|(|\<omega\>|)>=m<around|(|\<omega\>|)>*<wide|f|^><around|(|\<omega\>|)>=m<around|(|\<omega\>|)>\<cdot\>\<cal-F\><around|[|f|]><around|(|\<omega\>|)>
    </equation*>
  </proof>

  <\corollary>
    The shift operators and multiplication by complex exponentials are the
    fundamental operations that generate all translation-invariant linear
    systems, and the Fourier transform provides the natural basis that
    simultaneously diagonalizes all such systems.
  </corollary>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>