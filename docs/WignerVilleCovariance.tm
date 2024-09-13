<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <section|Relationship between Wigner-Ville Distribution and Covariance
  Function>

  <\enumerate>
    <item>The Wigner-Ville distribution <math|W<around|(|t,\<omega\>|)>> is
    the Fourier transform of the covariance function
    <math|K<around|(|t+\<tau\>/2,t-\<tau\>/2|)>> with respect to
    <math|\<tau\>>:

    <\equation>
      W<around|(|t,\<omega\>|)>=<big|int>K<around|(|t+<frac|\<tau\>|2>,t-<frac|\<tau\>|2>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation>

    <item>The covariance function <math|K<around|(|s,t|)>> is the inverse
    Fourier transform of the Wigner-Ville distribution
    <math|W<around|(|<around|(|s+t|)>/2,\<omega\>|)>> with respect to
    <math|\<omega\>>:

    <\equation>
      K<around|(|s,t|)>=<big|int>W<around*|(|<frac|s+t|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<omega\>
    </equation>
  </enumerate>

  These two equations establish the direct and inverse relationships between
  the covariance function and the Wigner-Ville distribution, connecting the
  time-domain covariance structure with the time-frequency representation of
  the process.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_43.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Relationship
      between Wigner-Ville Distribution and Covariance Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>