<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Riemann-Siegel Theta Function via Stirling's
  Approximation>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The Riemann-Siegel theta function <math|\<theta\><around|(|t|)>> is defined
  as:

  <\equation*>
    \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
    \<pi\>
  </equation*>

  <\theorem>
    <dueto|Stirling Approximation of <math|\<theta\><around|(|t|)>>>The
    approximation of the Riemann-Siegel theta function is:

    <\equation*>
      \<theta\><around|(|t|)>=<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>
  </theorem>

  <\theorem>
    <dueto|Inverse Formula>The inverse of the Riemann-Siegel theta function
    approximation is:

    <\equation>
      t=2*\<pi\>*exp <around*|(|W<around*|(|<frac|y|\<pi\>*e>|)>|)>+O<around*|(|<frac|log
      y|y>|)>
    </equation>

    where <math|W> is the Lambert W function.
  </theorem>

  <\proof>
    The definition of the theta function gives
    <math|\<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
    \<pi\>>. Stirling's formula for the gamma function states:

    <\equation*>
      log \<Gamma\><around|(|z|)>=<around*|(|z-<frac|1|2>|)>*log
      z-z+<frac|1|2>*log <around|(|2*\<pi\>|)>+<frac|1|12*z>+O<around*|(|<frac|1|z<rsup|3>>|)>
    </equation*>

    Substituting <math|z=<frac|1|4>+<frac|i*t|2>>:

    <\equation*>
      <with|font-base-size|9|log \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>=<around*|(|<frac|1|4>+<frac|i*t|2>-<frac|1|2>|)>*log
      <around*|(|<frac|1|4>+<frac|i*t|2>|)>-<around*|(|<frac|1|4>+<frac|i*t|2>|)>+<frac|1|2>*log
      <around|(|2*\<pi\>|)>+<frac|1|12*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>+O<around*|(|<frac|1|t<rsup|3>>|)>>
    </equation*>

    This simplifies to:

    <\equation*>
      log \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>=<around*|(|-<frac|1|4>+<frac|i*t|2>|)>*log
      <around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|1|4>-<frac|i*t|2>+<frac|1|2>*log
      <around|(|2*\<pi\>|)>+<frac|1|12*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>+O<around*|(|<frac|1|t<rsup|3>>|)>
    </equation*>

    For the complex number <math|<frac|1|4>+<frac|i*t|2>>, the modulus is
    <math|<around*|\||<frac|1|4>+<frac|i*t|2>|\|>=<sqrt|<frac|1|16>+<frac|t<rsup|2>|4>>=<frac|1|2>*<sqrt|<frac|1|4>+t<rsup|2>>>.

    The argument is <math|arg <around*|(|<frac|1|4>+<frac|i*t|2>|)>=arctan
    <around*|(|<frac|t/2|1/4>|)>=arctan <around|(|2*t|)>>.

    The logarithm of <math|<frac|1|4>+<frac|i*t|2>> in polar form equals:

    <\equation*>
      log <around*|(|<frac|1|4>+<frac|i*t|2>|)>=log
      <around*|(|<frac|1|2>*<sqrt|<frac|1|4>+t<rsup|2>>|)>+i*arctan
      <around|(|2*t|)>
    </equation*>

    Taking the imaginary part of the Stirling expression and subtracting
    <math|<frac|t|2>*log \<pi\>> gives:

    <\equation*>
      \<theta\><around|(|t|)>=<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>

    For the inverse formula, set <math|y=\<theta\><around|(|t|)>> and solve
    for <math|t>. The equation:

    <\equation*>
      y=<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>

    With the substitution <math|u=<frac|t|2*\<pi\>>>, this becomes:

    <\equation*>
      y+<frac|\<pi\>|8>=\<pi\>*u*log u+O<around*|(|<frac|1|u>|)>
    </equation*>

    The solution utilizes the Lambert W function:

    <\equation*>
      u=exp <around*|(|W<around*|(|<frac|y+<frac|\<pi\>|8>|\<pi\>>|)>|)>
    </equation*>

    Converting back to <math|t=2*\<pi\>*u>:

    <\equation*>
      t=2*\<pi\>*exp <around*|(|W<around*|(|<frac|y|\<pi\>*e>|)>|)>+O<around*|(|<frac|log
      y|y>|)>
    </equation*>

    The error term follows from the asymptotic behavior of the Lambert W
    function.
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
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Riemann-Siegel
      Theta Function via Stirling's Approximation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>