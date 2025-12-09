<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Approximate Riemann-Siegel Theta Function Via
  Stirling's Gamma Function Approximation
  >|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The Riemann-Siegel theta function <math|\<theta\><around|(|t|)>> is defined
  as:

  <\equation*>
    \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
    \<pi\>
  </equation*>

  <\theorem*>
    <dueto|Stirling Approximation of <math|\<theta\><around|(|t|)>>>The
    approximation of the Riemann-Siegel theta function is:

    <\equation*>
      \<theta\><around|(|t|)>=<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>
  </theorem*>

  <\theorem>
    <dueto|Inverse Formula>The inverse theta function
    <math|\<theta\><rsup|-1>> is:

    <\equation*>
      \<theta\><rsup|-1><around|(|x|)>=2*\<pi\>*exp
      <around*|(|W<around*|(|<frac|x|\<pi\>*e>|)>|)>+O<around*|(|<frac|log
      x|x>|)>
    </equation*>

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
      log \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>=<around*|(|-<frac|1|4>+<frac|i*t|2>|)>*log
      <around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|1|4>-<frac|i*t|2>+<frac|1|2>*log
      <around|(|2*\<pi\>|)>+<frac|1|12*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>+O<around*|(|<frac|1|t<rsup|3>>|)>
    </equation*>

    For the complex number <math|<frac|1|4>+<frac|i*t|2>>, the modulus equals
    <math|<frac|1|2>*<sqrt|<frac|1|4>+t<rsup|2>>> and the argument equals
    <math|arctan <around|(|2*t|)>>.

    The logarithm in polar form equals:

    <\equation*>
      log <around*|(|<frac|1|4>+<frac|i*t|2>|)>=log
      <around*|(|<frac|1|2>*<sqrt|<frac|1|4>+t<rsup|2>>|)>+i*arctan
      <around|(|2*t|)>
    </equation*>

    Taking the imaginary part and subtracting <math|<frac|t|2>*log \<pi\>>
    gives:

    <\equation*>
      \<theta\><around|(|t|)>=<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>

    For the inverse theta function, given <math|x=\<theta\><around|(|t|)>>:

    <\equation*>
      x=<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|t>|)>
    </equation*>

    Rearranging terms:

    <\equation*>
      x+<frac|\<pi\>|8>=<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>+O<around*|(|<frac|1|t>|)>
    </equation*>

    Substituting <math|u=<frac|t|2*\<pi\>>>:

    <\equation*>
      x+<frac|\<pi\>|8>=\<pi\>*u*log <around|(|u|)>-\<pi\>*u+O<around*|(|<frac|1|u>|)>
    </equation*>

    This equation has the form <math|\<pi\>*u*log
    <around|(|u|)>-\<pi\>*u=x+<frac|\<pi\>|8>>. Dividing by <math|\<pi\>>:

    <\equation*>
      u*log <around|(|u|)>-u=<frac|x+<frac|\<pi\>|8>|\<pi\>>=<frac|x|\<pi\>>+<frac|1|8>
    </equation*>

    The Lambert W function directly gives:

    <\equation*>
      u=exp <around*|(|W<around*|(|<frac|x|\<pi\>*e>|)>|)>
    </equation*>

    Therefore, the inverse theta function is:

    <\equation*>
      \<theta\><rsup|-1><around|(|x|)>=2*\<pi\>*exp
      <around*|(|W<around*|(|<frac|x|\<pi\>*e>|)>|)>+O<around*|(|<frac|log
      x|x>|)>
    </equation*>
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
    <associate|auto-1|<tuple|1|?|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>