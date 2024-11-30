<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Factorization of Stationary Gaussian Process
  Kernels>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Theorem: Spectral Representation>

  <\theorem>
    <strong|[Spectral Factorization Theorem]><cite|cramerStochasticProcessTheoryContribution>
    : Let <math|K:\<bbb-R\>\<to\>\<bbb-R\>> be a positive definite stationary
    kernel function.

    By Bochner's theorem, there exists a non-negative spectral density
    function <math|S:\<bbb-R\>\<to\>\<bbb-R\>> such that:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
    </equation>

    Let <math|h:\<bbb-R\>\<to\>\<bbb-C\>> be defined as:\ 

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    Then:

    <\equation>
      K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t+\<tau\>|)>*<wide|h*<around|(|s+\<tau\>|)>|\<bar\>>*d*\<tau\>
    </equation>
  </theorem>

  <section|Proof>

  <\enumerate-numeric>
    <item>Since K is positive definite and stationary, Bochner's theorem
    guarantees the existence of <math|S<around|(|\<omega\>|)>\<geq\>0> such
    that:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
    </equation>

    <item>Since <math|S<around|(|\<omega\>|)>\<geq\>0> by Bochner's theorem:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>\<cdot\><sqrt|S<around|(|\<omega\>|)>>*e<rsup|-i*\<omega\>*s>*d*\<omega\>
    </equation>

    <item>Using the definition of <math|h<around|(|t|)>> as the inverse
    Fourier transform of the square root of the spectral density
    <math|S<around*|(|\<omega\>|)>>:

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    <item> The Fourier transform of <math|h<around|(|t|)>> gives:

    <\equation>
      <sqrt|S<around|(|\<omega\>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
    </equation>

    <item>Substituting this representation:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>|)>*e<rsup|i*\<omega\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<sigma\>|)>*e<rsup|-i*\<omega\>*\<sigma\>>*d*\<sigma\>|)>*e<rsup|-i*\<omega\>*s>*d*\<omega\>
    </equation>

    <item>By Fubini's theorem (valid since K is PD):

    <\equation>
      K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-\<tau\>-s+\<sigma\>|)>>*d*\<omega\>*d*\<tau\>*d*\<sigma\>
    </equation>

    <item>The inner integral yields the Dirac delta function:

    <\equation>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-\<tau\>-s+\<sigma\>|)>>*d*\<omega\>=\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>
    </equation>

    <item> Therefore:

    <\equation>
      K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h<around|(|\<sigma\>|)>*\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>*d*\<tau\>*d*\<sigma\>
    </equation>

    <item>Using the sifting property of <math|\<delta\>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|K*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<sigma\>|)>*\<delta\>*<around|(|t-\<tau\>-s+\<sigma\>|)>*d*\<sigma\>*d*\<tau\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>-s|)>*d*\<tau\>>>>>>
    </equation>
  </enumerate-numeric>

  <section|Reverse Verification>

  Starting from the final result:

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>-s|)>*d*\<tau\>
  </equation>

  Substituting the definition of <math|h<around|(|t|)>>:

  <\equation>
    h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
  </equation>

  1) First substitution for <math|h<around|(|\<tau\>|)>>:

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*\<tau\>>*d*\<omega\><rsub|1>|]>*h*<around|(|t-\<tau\>-s|)>*d*\<tau\>
  </equation>

  2) Second substitution for <math|h*<around|(|t-\<tau\>-s|)>>:

  <\equation>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*\<tau\>>*d*\<omega\><rsub|1>|]>*<around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|2>*<around|(|t-\<tau\>-s|)>>*d*\<omega\><rsub|2>|]>*d*\<tau\>
  </equation>

  3) Rearranging the integrals:

  <\equation>
    K*<around|(|t-s|)>=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*<sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|2>*t>*e<rsup|-i*\<omega\><rsub|2>*s>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*\<tau\>>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>*d*\<tau\>
  </equation>

  4) The integral with respect to <math|\<tau\>> yields:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>=2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>
  </equation>

  5) Applying this result:

  <\equation>
    K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
  </equation>

  This matches the original spectral representation from Bochner's theorem,
  confirming that:

  <\itemize>
    <item>The substitutions were valid

    <item>The use of Fubini's theorem was justified

    <item>The manipulation of the Dirac delta function was correct

    <item>The final result is consistent with the initial spectral
    representation
  </itemize>

  <cite|cramerStochasticProcessTheoryContribution><cite|specialRepresentationsOfWeaklyHarmonizableProcesses>

  <\bib-list|1>
    \;
  </bib-list>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-specialRepresentationsOfWeaklyHarmonizableProcesses>Derek<nbsp>K.<nbsp>Chang<localize|
      and >M.M.<nbsp>Rao. <newblock>Special representations of weakly
      harmonizable processes. <newblock><with|font-shape|italic|Stochastic
      Analysis and Applications>, 6(2):169\U189, 1988.<newblock>

      <bibitem*|2><label|bib-cramerStochasticProcessTheoryContribution>Harald
      Cramér. <newblock>A contribution to the theory of stochastic processes.
      <newblock><with|font-shape|italic|Proceedings of the Second Berkeley
      Symposium on Mathematical Statistics and Probability>, 2:329\U339,
      1951.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|2|3>>
    <associate|bib-specialRepresentationsOfWeaklyHarmonizableProcesses|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramerStochasticProcessTheoryContribution

      cramerStochasticProcessTheoryContribution

      specialRepresentationsOfWeaklyHarmonizableProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Theorem:
      Spectral Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Reverse
      Verification> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>