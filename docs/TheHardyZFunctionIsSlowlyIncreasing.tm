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