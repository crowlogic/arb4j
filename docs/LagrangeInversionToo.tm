<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|Lagrange Inversion>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Detailed
    Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Corollaries
    and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Lagrange Inversion Theorem is a fundamental result in complex analysis
  that provides explicit formulas for the coefficients in the power series
  expansion of the inverse of an analytic function. This theorem is
  particularly useful for finding series expansions of inverse functions when
  the forward function's expansion is known.

  <section|Main Theorem>

  <\theorem>
    [Lagrange Inversion Theorem] Let <math|f<around|(|z|)>> be an analytic
    function in a neighborhood of <math|z=a> with
    <math|f<rprime|'><around|(|a|)>\<neq\>0>. Define
    <math|\<phi\><around|(|z|)>=z-a> and <math|\<psi\><around|(|z|)>=f<around|(|z|)>-f<around|(|a|)>>.
    If <math|g<around|(|w|)>> is the inverse function of
    <math|f<around|(|z|)>> near <math|z=a>, meaning
    <math|f<around|(|g<around|(|w|)>|)>=w> for <math|w> near
    <math|f<around|(|a|)>>, then for any function <math|h<around|(|z|)>>
    analytic near <math|z=a>:

    <\equation>
      <around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>=<frac|1|n><around|[|z<rsup|n-1>|]>*h<rprime|'><around|(|z|)><around*|(|<frac|\<phi\><around|(|z|)>|\<psi\><around|(|z|)>>|)><rsup|n>
    </equation>

    where <math|<around|[|w<rsup|n>|]>> denotes the coefficient of
    <math|w<rsup|n>> in the power series expansion around
    <math|w=f<around|(|a|)>>.

    In particular, taking <math|h<around|(|z|)>=z>:

    <\equation>
      <around|[|w<rsup|n>|]>*g<around|(|w|)>=<frac|1|n><around|[|z<rsup|n-1>|]><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n>
    </equation>
  </theorem>

  <section|Detailed Proof>

  <\proof>
    We proceed using the Cauchy integral formula and residue calculus.

    <with|font-series|bold|Step 1: Setup and Cauchy Integral Formula>

    Since <math|g<around|(|w|)>> is the inverse of <math|f<around|(|z|)>>, we
    have <math|f<around|(|g<around|(|w|)>|)>=w>. We want to find the
    coefficient <math|<around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>>
    for an analytic function <math|h>.

    By the Cauchy integral formula:

    <\equation>
      <around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|<around|\||w-f<around|(|a|)>|\|>=r><frac|h<around|(|g<around|(|w|)>|)>|w<rsup|n+1>>*d*w
    </equation>

    where the contour is a small circle around <math|w=f<around|(|a|)>>.

    <with|font-series|bold|Step 2: Change of Variables>

    Since <math|w=f<around|(|z|)>>, we have
    <math|d*w=f<rprime|'><around|(|z|)>*d*z>. When <math|w> traces the circle
    <math|<around|\||w-f<around|(|a|)>|\|>=r>, <math|z> traces a
    corresponding curve around <math|z=a>. The integral becomes:

    <\equation>
      <around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|h<around|(|z|)>|<around|[|f<around|(|z|)>|]><rsup|n+1>>*f<rprime|'><around|(|z|)>*d*z
    </equation>

    where <math|C> is the image curve in the <math|z>-plane.

    <with|font-series|bold|Step 3: Deformation of Contour>

    Since <math|f> is analytic and <math|f<rprime|'><around|(|a|)>\<neq\>0>,
    by the inverse function theorem, <math|f> has a local analytic inverse
    near <math|z=a>. We can deform the contour <math|C> to a small circle
    <math|<around|\||z-a|\|>=\<rho\>> around <math|z=a>.

    <with|font-series|bold|Step 4: Residue Calculation>

    To compute:

    <\equation>
      <frac|1|2*\<pi\>*i>*<big|oint><rsub|<around|\||z-a|\|>=\<rho\>><frac|h<around|(|z|)>*f<rprime|'><around|(|z|)>|<around|[|f<around|(|z|)>|]><rsup|n+1>>*d*z
    </equation>

    rite

    <\equation>
      f<around|(|z|)>-f<around|(|a|)>=<around|(|z-a|)>\<cdot\>u<around|(|z|)>
    </equation>

    \ where <math|u<around|(|z|)>> is analytic near <math|z=a> and
    <math|u<around|(|a|)>=f<rprime|'><around|(|a|)>\<neq\>0>.

    Then <math|f<rprime|'><around|(|z|)>=u<around|(|z|)>+<around|(|z-a|)>*u<rprime|'><around|(|z|)>>,
    so:

    <\equation>
      <frac|f<rprime|'><around|(|z|)>|<around|[|f<around|(|z|)>|]><rsup|n+1>>=<frac|f<rprime|'><around|(|z|)>|<around|[|f<around|(|a|)>+<around|(|z-a|)>*u<around|(|z|)>|]><rsup|n+1>>
    </equation>

    <with|font-series|bold|Step 5: Series Expansion>

    Near <math|z=a>, we can write:

    <\equation>
      <frac|1|<around|[|f<around|(|z|)>|]><rsup|n+1>>=<frac|1|<around|[|f<around|(|a|)>|]><rsup|n+1>>*<around*|(|1+<frac|f<around|(|z|)>-f<around|(|a|)>|f<around|(|a|)>>|)><rsup|-<around|(|n+1|)>>
    </equation>

    For <math|n\<geq\>1> and considering the case <math|f<around|(|a|)>=0>
    (by translation), we have:

    <\equation>
      <frac|f<rprime|'><around|(|z|)>|<around|[|f<around|(|z|)>|]><rsup|n+1>>=<frac|f<rprime|'><around|(|z|)>|<around|[|<around|(|z-a|)>*u<around|(|z|)>|]><rsup|n+1>>=<frac|f<rprime|'><around|(|z|)>|<around|(|z-a|)><rsup|n+1><around|[|u<around|(|z|)>|]><rsup|n+1>>
    </equation>

    <with|font-series|bold|Step 6: Evaluating the Residual>

    The integrand becomes:

    <\equation>
      <frac|h<around|(|z|)>*f<rprime|'><around|(|z|)>|<around|(|z-a|)><rsup|n+1><around|[|u<around|(|z|)>|]><rsup|n+1>>=<frac|h<around|(|z|)>|<around|(|z-a|)><rsup|n+1>>\<cdot\><frac|f<rprime|'><around|(|z|)>|<around|[|u<around|(|z|)>|]><rsup|n+1>>
    </equation>

    Since

    <\equation>
      u<around|(|z|)>=<frac|f<around|(|z|)>-f<around|(|a|)>|z-a>
    </equation>

    we have:

    <\equation>
      <frac|f<rprime|'><around|(|z|)>|<around|[|u<around|(|z|)>|]><rsup|n+1>>=<frac|f<rprime|'><around|(|z|)>|<around*|[|<frac|f<around|(|z|)>-f<around|(|a|)>|z-a>|]><rsup|n+1>>=f<rprime|'><around|(|z|)><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n+1>
    </equation>

    <with|font-series|bold|Step 7: Final Calculation>

    The coefficient we seek is the residue at <math|z=a>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>>|<cell|=<text|Res><rsub|z=a><around*|[|<frac|h<around|(|z|)>*f<rprime|'><around|(|z|)>|<around|(|z-a|)><rsup|n+1>><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n+1>|]>>>|<row|<cell|>|<cell|=<text|Res><rsub|z=a><around*|[|<frac|h<around|(|z|)>*f<rprime|'><around|(|z|)>|<around|(|z-a|)><rsup|n+1>>\<cdot\><frac|<around|(|z-a|)><rsup|n+1>|<around|[|f<around|(|z|)>-f<around|(|a|)>|]><rsup|n+1>>|]>>>|<row|<cell|>|<cell|=<text|Res><rsub|z=a><around*|[|<frac|h<around|(|z|)>*f<rprime|'><around|(|z|)>|<around|[|f<around|(|z|)>-f<around|(|a|)>|]><rsup|n+1>>|]>>>>>>
    </equation>

    <\equation*>
      \;
    </equation*>

    Using the fact that for <math|n\<geq\>1>:

    <\equation>
      <frac|d|d*z><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n>=n<around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n-1>\<cdot\><frac|d|d*z><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)>
    </equation>

    And applying the residue theorem:

    <\equation>
      <around|[|w<rsup|n>|]>*h<around|(|g<around|(|w|)>|)>=<frac|1|n><around|[|z<rsup|n-1>|]>*h<rprime|'><around|(|z|)><around*|(|<frac|z-a|f<around|(|z|)>-f<around|(|a|)>>|)><rsup|n>
    </equation>

    This completes the proof.
  </proof>

  <section|Corollaries and Applications>

  <\corollary>
    If <math|f<around|(|z|)>=z+a<rsub|2>*z<rsup|2>+a<rsub|3>*z<rsup|3>+\<cdots\>>
    and <math|g<around|(|w|)>> is its inverse, then:

    <\equation>
      g<around|(|w|)>=w-a<rsub|2>*w<rsup|2>+<around|(|2*a<rsub|2><rsup|2>-a<rsub|3>|)>*w<rsup|3>+\<cdots\>
    </equation>
  </corollary>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Detailed
      Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Corollaries
      and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>