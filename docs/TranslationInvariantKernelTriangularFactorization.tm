<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Proof of the Triangular Factorization of Stationary
  Gaussian Process Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Theorem: Spectral Representation>

  Let <math|K*<around|(|t-s|)>> be a stationary kernel function. Then
  <math|K*<around|(|t-s|)>> can be expressed in the form:

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>-s|)>*d*\<tau\>
  </equation>

  where <math|h<around|(|t|)>> is defined as:

  <\equation>
    h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
  </equation>

  and <math|S<around|(|\<omega\>|)>> is the spectral density function.

  <section|Proof>

  1. Start with the spectral representation:

  <\equation>
    K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
  </equation>

  2. Factor <math|S<around|(|\<omega\>|)>>:

  <\equation>
    K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t><sqrt|S<around|(|\<omega\>|)>>*e<rsup|-i*\<omega\>*s>*d*\<omega\>
  </equation>

  3. Define <math|h<around|(|t|)>>:

  <\equation>
    h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
  </equation>

  4. Express <math|<sqrt|S<around|(|\<omega\>|)>>>:

  <\equation*>
    <sqrt|S<around|(|\<omega\>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><space|1em><text|(by
    inverse Fourier transform)>
  </equation*>

  5. Substitute into the kernel equation:

  <\equation>
    K*<around|(|t-s|)>=<frac|*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>|)>*e<rsup|i*\<omega\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<sigma\>|)>*e<rsup|-i*\<omega\>*\<sigma\>>*d*\<sigma\>|)>*e<rsup|-i*\<omega\>*s>*d*\<omega\>|2*\<pi\>>
  </equation>

  6. Apply Fubini's theorem to change the order of integration

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)>*<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>-s+\<sigma\>|)>>*d*\<omega\>|2*\<pi\>>**d*\<tau\>*d*\<sigma\>
  </equation>

  7. Evaluate the inner <math|\<omega\>> integral by the Fourier integral
  representation of the delta function:

  <\equation>
    <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>-s+\<sigma\>|)>>*d*\<omega\>=\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>
  </equation>

  8. Apply the delta function:

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)>*\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>*d*\<tau\>*d*\<sigma\>
  </equation>

  9. Integrate with respect to <math|\<sigma\>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|K*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<tau\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>*h<around|(|\<sigma\>|)>*\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>*d*\<sigma\>*d*\<tau\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>-s|)>*d*\<tau\>>>>>>
  </equation>

  This completes the proof of the spectral representation theorem.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_60.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Theorem:
      Spectral Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>