<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof that the Hardy <math|Z>-function is a Slowly
  Increasing Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    The Hardy <math|Z>-function, defined as
    <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>,
    where <math|\<theta\><around|(|t|)>> is the Riemann-Siegel theta function
    and <math|\<zeta\><around|(|s|)>> is the Riemann Zeta function, is a
    slowly increasing function on the real line.
  </theorem>

  <\proof>
    We start by noting the established bound on the Riemann Zeta function on
    the critical line. For any <math|\<epsilon\>\<gtr\>0>, there exists a
    constant <math|C<rsub|\<epsilon\>>> such that

    <\equation>
      <around|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>\<leq\>C<rsub|\<epsilon\>>*<around|(|1+<around|\||t|\|>|)><rsup|<frac|1|4>+\<epsilon\>>
    </equation>

    for all <math|t\<in\>\<bbb-R\>>. This result follows from the
    Phragmén-Lindelöf principle and the functional equation of the Riemann
    Zeta function.

    The modulus of the Hardy <math|Z>-function can be expressed as

    <\equation>
      <around|\||Z<around|(|t|)>|\|>=<around|\||e<rsup|i*\<theta\><around|(|t|)>>|\|>*<around|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>=<around|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>
    </equation>

    since the modulus of <math|e<rsup|i*\<theta\><around|(|t|)>>> is 1.

    By applying the established bound for
    <math|<around|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>>, we have

    <\equation>
      <around|\||Z<around|(|t|)>|\|>\<leq\>C<rsub|\<epsilon\>>*<around|(|1+<around|\||t|\|>|)><rsup|<frac|1|4>+\<epsilon\>>
    </equation>

    This demonstrates that <math|<around|\||Z<around|(|t|)>|\|>> is bounded
    by a polynomial in <math|t>, which satisfies the definition of a slowly
    increasing function on the real line. Specifically, with
    <math|k=<frac|1|4>+\<epsilon\>> for any chosen
    <math|\<epsilon\>\<gtr\>0>, the Hardy <math|Z>-function is confirmed to
    be slowly increasing.

    Therefore, the Hardy <math|Z>-function <math|Z<around|(|t|)>> is a slowly
    increasing function on the real line, independent of the truth of the
    Riemann Hypothesis.
  </proof>

  TODO: cite Yosida.. not sure if thats the same defintiion used there

  \;

  <documentclass|article> <usepackage|amsmath,amsfonts>

  <with|font-series|bold|Example 2.> A <math|\<sigma\>>-finite, non-negative
  measure <math|\<mu\>*<around|(|d*x|)>> which is <math|\<sigma\>>-additive
  on Baire sets of <math|\<bbb-R\><rsup|N>> is called a
  <with|font-shape|italic|slowly increasing measure>, if, for some
  non-negative <math|k>,

  <\equation>
    <big|int><rsub|\<bbb-R\><rsup|N>><around|(|1+<around|\||x|\|><rsup|2>|)><rsup|-k>*\<mu\>*<around|(|d*x|)>\<less\>\<infty\>.
  </equation>

  Such a measure <math|\<mu\>> defines a tempered distribution by

  <\equation>
    T<rsub|\<mu\>><around|(|\<varphi\>|)>=<big|int><rsub|\<bbb-R\><rsup|N>>\<varphi\><around|(|x|)>*\<mu\>*<around|(|d*x|)>,<space|1em>\<varphi\>\<in\>\<cal-S\><around|(|\<bbb-R\><rsup|N>|)>.
  </equation>

  <with|font-series|bold|Example 3.> As a special case of Example 2, any
  function <math|f\<in\>L<rsup|p><around|(|\<bbb-R\><rsup|N>|)>>,
  <math|p\<geq\>1>, defines a tempered distribution

  <\equation>
    T<rsub|f><around|(|\<varphi\>|)>=<big|int><rsub|\<bbb-R\><rsup|N>>\<varphi\><around|(|x|)>*f<around|(|x|)>*d*x,<space|1em>\<varphi\>\<in\>\<cal-S\><around|(|\<bbb-R\><rsup|N>|)>.
  </equation>

  That an <math|f\<in\>L<rsup|p><around|(|\<bbb-R\><rsup|N>|)>> gives rise to
  a slowly increasing measure <math|\<mu\>*<around|(|d*x|)>=f<around|(|x|)>*d*x>
  may be proved by applying Hölder's inequality to

  <\equation*>
    <big|int><rsub|\<bbb-R\><rsup|N>><around|(|1+<around|\||x|\|><rsup|2>|)><rsup|-k><around|\||f<around|(|x|)>|\|>*d*x.
  </equation*>

  <with|font-series|bold|Definition 2.> A function
  <math|f\<in\>C<rsup|\<infty\>><around|(|\<bbb-R\><rsup|N>|)>> is called
  <with|font-shape|italic|slowly increasing> (at <math|\<infty\>>), if, for
  any differentiation <math|D<rsup|j>>, there exists a non-negative integer
  <math|N> such that

  <\equation>
    lim<rsub|<around|\||x|\|>\<to\>\<infty\>>
    <frac|<around|\||x|\|><rsup|N>*<around|\||D<rsup|j>*f<around|(|x|)>|\|>|1>=0.
  </equation>

  The totality of slowly increasing functions will be denoted by
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>>. It is a locally
  convex linear topological space by the algebraic operations of function sum
  and multiplication of functions by complex numbers, totally of
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>> will be denoted by
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>>.

  <documentclass|article> <usepackage|amsmath,amsfonts>

  <with|font-series|bold|Example 2.> A <math|\<sigma\>>-finite, non-negative
  measure <math|\<mu\>*<around|(|d*x|)>> which is <math|\<sigma\>>-additive
  on Baire sets of <math|\<bbb-R\><rsup|N>> is called a
  <with|font-shape|italic|slowly increasing measure>, if, for some
  non-negative <math|k>,

  <\equation>
    <big|int><rsub|\<bbb-R\><rsup|N>><around|(|1+<around|\||x|\|><rsup|2>|)><rsup|-k>*\<mu\>*<around|(|d*x|)>\<less\>\<infty\>.
  </equation>

  Such a measure <math|\<mu\>> defines a tempered distribution by

  <\equation>
    T<rsub|\<mu\>><around|(|\<varphi\>|)>=<big|int><rsub|\<bbb-R\><rsup|N>>\<varphi\><around|(|x|)>*\<mu\>*<around|(|d*x|)>,<space|1em>\<varphi\>\<in\>\<cal-S\><around|(|\<bbb-R\><rsup|N>|)>.
  </equation>

  <with|font-series|bold|Example 3.> As a special case of Example 2, any
  function <math|f\<in\>L<rsup|p><around|(|\<bbb-R\><rsup|N>|)>>,
  <math|p\<geq\>1>, defines a tempered distribution

  <\equation>
    T<rsub|f><around|(|\<varphi\>|)>=<big|int><rsub|\<bbb-R\><rsup|N>>\<varphi\><around|(|x|)>*f<around|(|x|)>*d*x,<space|1em>\<varphi\>\<in\>\<cal-S\><around|(|\<bbb-R\><rsup|N>|)>.
  </equation>

  That an <math|f\<in\>L<rsup|p><around|(|\<bbb-R\><rsup|N>|)>> gives rise to
  a slowly increasing measure <math|\<mu\>*<around|(|d*x|)>=f<around|(|x|)>*d*x>
  may be proved by applying Hölder's inequality to

  <\equation*>
    <big|int><rsub|\<bbb-R\><rsup|N>><around|(|1+<around|\||x|\|><rsup|2>|)><rsup|-k><around|\||f<around|(|x|)>|\|>*d*x.
  </equation*>

  <with|font-series|bold|Definition 2.> A function
  <math|f\<in\>C<rsup|\<infty\>><around|(|\<bbb-R\><rsup|N>|)>> is called
  <with|font-shape|italic|slowly increasing> (at <math|\<infty\>>), if, for
  any differentiation <math|D<rsup|j>>, there exists a non-negative integer
  <math|N> such that

  <\equation>
    lim<rsub|<around|\||x|\|>\<to\>\<infty\>><around|\||x|\|><rsup|N>*<around|\||D<rsup|j>*f<around|(|x|)>|\|>=0.
  </equation>

  The totality of slowly increasing functions will be denoted by
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>>. It is a locally
  convex linear topological space by the algebraic operations of function sum
  and multiplication of functions by complex numbers, totally of
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>> will be denoted by
  <math|\<cal-O\><rsub|M><around|(|\<bbb-R\><rsup|N>|)>>.
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