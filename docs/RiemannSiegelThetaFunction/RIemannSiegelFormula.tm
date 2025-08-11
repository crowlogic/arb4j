<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section*|Riemann-Siegel Formula>

  The exact Riemann-Siegel formula for the Riemann zeta function on the
  critical line, with the remainder term as an infinite sum, is:

  <\equation>
    \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2+i*t>>+\<chi\><around|(|t|)>*<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2-i*t>>+R<around|(|t|)>
  </equation>

  Where:

  <\itemize>
    <item><math|N=<around*|\<lfloor\>|<sqrt|<dfrac|t|2*\<pi\>>>|\<rfloor\>>>

    <item><math|\<chi\><around|(|t|)>=\<pi\><rsup|-<frac|1|2>-i*t>*<frac|\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|\<Gamma\>*<around*|(|<frac|1|4>-<frac|i*t|2>|)>>>

    <\equation*>
      \;
    </equation*>
  </itemize>

  The remainder term <math|R<around|(|t|)>> is given by the exact infinite
  sum:

  <\equation>
    R<around|(|t|)>=<frac|<around|(|-1|)><rsup|N+1>|2*<sqrt|N>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|k!><around*|\<nobracket\>|<frac|d<rsup|k>*\<Phi\>|d*z<rsup|k>>|\|><rsub|z=2*<around*|(|<sqrt|<dfrac|t|2*\<pi\>>>-N|)>-1><around*|(|<dfrac|1|2*\<pi\>>|)><rsup|k/2>*t<rsup|-k/2>
  </equation>

  Where <math|\<Phi\><around|(|z|)>> is defined as:

  <\equation>
    \<Phi\><around|(|z|)>=<frac|cos <around*|(|\<pi\>*<around*|(|<frac|z<rsup|2>|2>+<frac|3|8>|)>|)>|cos
    <around|(|\<pi\>*z|)>>
  </equation>

  <section*|Derivation>

  Starting with Riemann's integral representation:

  <\equation>
    \<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s/2-1>*e<rsup|-\<pi\>*x>*<space|0.17em>d*x+<big|int><rsub|0\<swarrow\>1><frac|x<rsup|-s>*e<rsup|\<pi\>*i*x<rsup|2>>|e<rsup|\<pi\>*i*x>-e<rsup|-\<pi\>*i*x>>*<space|0.17em>d*x
  </equation>

  The saddle point occurs where:

  <\equation>
    <frac|d|d*x>*<around*|(|-s*log x+\<pi\>*i*x<rsup|2>|)>=0
  </equation>

  giving <math|x=<sqrt|<dfrac|t|2*\<pi\>>>>. The integral from <math|N> to
  <math|\<infty\>> transforms under <math|u=x-N> to:

  <\equation>
    <big|int><rsub|N><rsup|\<infty\>>e<rsup|-2*\<pi\>*i*<around|(|x<rsup|2>-t*x|)>>*<space|0.17em>d*x=e<rsup|2*\<pi\>*i*<around|(|N<rsup|2>-t*N|)>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-2*\<pi\>*i*<around|(|u<rsup|2>+2*N*u|)>>*<space|0.17em>d*u
  </equation>

  By Watson's lemma:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-2*\<pi\>*i*<around|(|u<rsup|2>+2*N*u|)>>*<space|0.17em>d*u=<frac|e<rsup|-\<pi\>*i/4>|2*<sqrt|\<pi\>>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\>*<around*|(|k+<frac|1|2>|)>|k!<space|0.17em><around|(|4*\<pi\>*i*N|)><rsup|k>>
  </equation>

  The phase factor combines as:

  <\equation>
    e<rsup|2*\<pi\>*i*<around|(|N<rsup|2>-t*N|)>>\<cdot\><frac|e<rsup|-\<pi\>*i/4>|2*<sqrt|\<pi\>>>=e<rsup|\<pi\>*i*<around*|(|2*N<rsup|2>-2*t*N-<frac|1|4>|)>>
  </equation>

  This leads to the function <math|\<Phi\><around|(|z|)>> through the
  substitution <math|z=2*<around*|(|<sqrt|<dfrac|t|2*\<pi\>>>-N|)>-1>, and
  the remainder term <math|R<around|(|t|)>> emerges in its final form as
  given above. The functional equation of zeta provides the second main sum
  term:

  <\equation>
    \<chi\><around|(|t|)>*<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2-i*t>>
  </equation>

  Combining all terms gives the complete Riemann-Siegel formula.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-2|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Riemann-Siegel
      Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Derivation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>