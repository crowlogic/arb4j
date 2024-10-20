<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Proof of the Triangular Type Covariance Factorization
  For Translation-Invariant Gaussian Process
  Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Proof: Kernel Spectral Representation>

  We will prove the following equality for a translation-invariant kernel
  <math|K*<around|(|t-s|)>> with even spectral density
  <math|S<around|(|\<omega\>|)>>:

  <\equation>
    K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-u|)>*h*<around|(|s-u|)>*d*u
  </equation>

  where <math|h<around|(|t|)>> is defined as:

  <\equation>
    h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
  </equation>

  <\proof>
    <\enumerate>
      <item>Start with the spectral representation of the kernel:

      <\equation>
        K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
      </equation>

      <item>Factor <math|<sqrt|S<around|(|\<omega\>|)>>>:

      <\equation>
        K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|<sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>|)>*<around|(|<sqrt|S<around|(|\<omega\>|)>>*e<rsup|-i*\<omega\>*s>|)>*d*\<omega\>
      </equation>

      <item>Define <math|h<around|(|t|)>> as the inverse Fourier transform of
      <math|<sqrt|S<around|(|\<omega\>|)>>>:

      <\equation>
        h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
      </equation>

      <item>By the Fourier transform pair property:

      <\equation>
        <sqrt|S<around|(|\<omega\>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
      </equation>

      <item>Substitute into the kernel expression:

      <\align>
        <tformat|<table|<row|<cell|K*<around|(|t-s|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*<around|(|\<tau\>-t|)>>*d*\<tau\>|)>>>|<row|<cell|>|<cell|<space|1em>\<times\><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<sigma\>|)>*e<rsup|-i*\<omega\>*<around|(|\<sigma\>-s|)>>*d*\<sigma\>|)>*d*\<omega\><eq-number>>>>>
      </align>

      <item>Simplify and change order of integration:

      <\equation>
        K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*e<rsup|-i*\<omega\>*<around|(|s-\<sigma\>|)>>*d*\<omega\>|)>*d*\<tau\>*d*\<sigma\>
      </equation>

      <item>The <math|\<omega\>> integral is a Dirac delta function:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*e<rsup|-i*\<omega\>*<around|(|s-\<sigma\>|)>>*d*\<omega\>=2*\<pi\>*\<delta\>*<around|(|<around|(|t-\<tau\>|)>-<around|(|s-\<sigma\>|)>|)>
      </equation>

      <item>Simplify:

      <\equation>
        K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)>*\<delta\>*<around|(|<around|(|t-\<tau\>|)>-<around|(|s-\<sigma\>|)>|)>*d*\<tau\>*d*\<sigma\>
      </equation>

      <item>Evaluate the delta function:

      <\equation>
        K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h*<around|(|\<tau\>+<around|(|s-t|)>|)>*d*\<tau\>
      </equation>

      <item>Change of variables (<math|u=\<tau\>+<around|(|s-t|)>>):

      <\equation>
        K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-u|)>*h*<around|(|s-u|)>*d*u
      </equation>
    </enumerate>

    This completes the proof
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proof:
      Kernel Spectral Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>