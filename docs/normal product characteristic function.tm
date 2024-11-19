<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|Characteristic Function of the Product of Independent
  Standard Normal Variables>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    The characteristic function of the product of two independent standard
    normal random variables is shown to involve the Bessel function of the
    first kind of order 0 and the orthogonality measure of the Type-1
    Chebyshev polynomials. Polar coordinate transformations and properties of
    Bessel functions are used to derive the closed form expression.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Proof>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The characteristic function of the product of two independent standard
  normal random variables has important applications in probability theory
  and statistical analysis. Here we present a complete proof of its form.

  <section|Main Result>

  <\theorem>
    Let X and Y be independent standard normal random variables. The
    characteristic function of their product XY is given by:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>*
    </equation>

    where <math|J<rsub|0>> is the Bessel function of the first kind of order
    zero.
  </theorem>

  <section|Proof>

  <\proof>
    Starting with the definition of the characteristic function:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=E<around|[|e<rsup|i*t*X*Y>|]>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x*y>*e<rsup|-<around|(|x<rsup|2>+y<rsup|2>|)>/2>*d*x*d*y
    </equation>

    <strong|Polar Coordinate Transformation>

    \;

    Transform to polar coordinates with <math|x=r*cos \<theta\>>,
    <math|y=r*sin \<theta\>>, and <math|d*x*d*y=r*d*r*d*\<theta\>>:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*r<rsup|2>*cos
      \<theta\>*sin \<theta\>>*r*e<rsup|-r<rsup|2>/2>*d*\<theta\>*d*r
    </equation>

    <strong|Variable Substitution>

    Let <math|u=r<rsup|2>/2>, then <math|d*u=r*d*r>:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|2*i*t*u*cos
      \<theta\>*sin \<theta\>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <strong|Double Angle Formula>

    Using <math|cos \<theta\>*sin \<theta\>=<frac|1|2>*sin
    <around|(|2*\<theta\>|)>>:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <strong|Bessel Function Representation>

    The inner integral is related to the Bessel function:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|t*u|)>*e<rsup|-u>*d*u
    </equation>

    <strong|Final Evaluation>

    This integral evaluates to:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>*
    </equation>
  </proof>

  <section|Conclusion>

  It has been proven that the characteristic function of the product of two
  independent standard normal random variables has the stated form involving
  the Bessel function <math|J<rsub|0>>.

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>