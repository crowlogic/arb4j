<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|The Characteristic Function of the Product of
  Independent Standard Normal Variables>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  \;

  <\abstract>
    This paper demonstrates that the characteristic function of the product
    of two independent standard normal random variables involves the Bessel
    function of the first kind of order 0. Polar coordinate transformations
    and properties of Bessel functions are utilized to obtain the closed form
    expression.
  </abstract>

  \;

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
  normal random variables serves as a fundamental result in probability
  theory and statistical analysis. This paper presents a rigorous derivation
  of its closed form.

  <section|Main Result>

  <\theorem>
    For independent standard normal random variables X and Y, the
    characteristic function of their product XY is given by:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>
    </equation>

    where <math|J<rsub|0>> denotes the Bessel function of the first kind of
    order zero.
  </theorem>

  <section|Proof>

  <\proof>
    The derivation begins with the characteristic function definition:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=E<around|[|e<rsup|i*t*X*Y>|]>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x*y>*e<rsup|-<around|(|x<rsup|2>+y<rsup|2>|)>/2>*d*x*d*y
    </equation>

    <with|font-series|bold|Polar Coordinate Transformation>

    The introduction of polar coordinates where <math|x=r*cos \<theta\>>,
    <math|y=r*sin \<theta\>>, and <math|d*x*d*y=r*d*r*d*\<theta\>> transforms
    the integral to:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*r<rsup|2>*cos
      \<theta\>*sin \<theta\>>*r*e<rsup|-r<rsup|2>/2>*d*\<theta\>*d*r
    </equation>

    <with|font-series|bold|Variable Substitution>

    The substitution <math|u=r<rsup|2>/2>, with <math|d*u=r*d*r>, yields:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|2*i*t*u*cos
      \<theta\>*sin \<theta\>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Double Angle Formula>

    Application of the identity <math|cos \<theta\>*sin
    \<theta\>=<frac|1|2>*sin <around|(|2*\<theta\>|)>> gives:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*e<rsup|-u>*d*\<theta\>*d*u
    </equation>

    <with|font-series|bold|Bessel Function Connection>

    The inner integral relates to the Bessel function through the identity:

    <\equation>
      <big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*t*u*sin
      <around|(|2*\<theta\>|)>>*d*\<theta\>=2*\<pi\>*J<rsub|0>*<around|(|t*u|)>
    </equation>

    This follows from the integral representation of the Bessel function of
    the first kind:

    <\equation>
      J<rsub|0><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*z*sin
      <around|(|\<theta\>|)>>*d*\<theta\>
    </equation>

    The integral thus reduces to:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|t*u|)>*e<rsup|-u>*d*u
    </equation>

    <with|font-series|bold|Final Evaluation>

    The evaluation proceeds through the known Laplace transform of Bessel
    functions:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|a*t|)>*e<rsup|-u*t>*d*t=<frac|1|<sqrt|1+a<rsup|2>>>*J<rsub|0><around*|(|<frac|a|<sqrt|1+a<rsup|2>>>|)>
    </equation>

    This leads to the final result:

    <\equation>
      \<phi\><rsub|X*Y><around|(|t|)>=<frac|J<rsub|0><around*|(|<frac|t|<sqrt|1+t<rsup|2>>>|)>|<sqrt|1+t<rsup|2>>>
    </equation>
  </proof>

  <section|Conclusion>

  The derivation establishes that the characteristic function of the product
  of two independent standard normal random variables takes the form
  <math|J<rsub|0>*<around|(|t/<sqrt|1+t<rsup|2>>|)>/<sqrt|1+t<rsup|2>>>. The
  proof relies on coordinate transformation, properties of Bessel functions,
  and integral transforms. This result holds significance in various
  applications of probability theory and statistical analysis.
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
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_61.tm>>
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