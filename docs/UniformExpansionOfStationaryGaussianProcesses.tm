<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Eigenfunction Construction for Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Preliminaries>

  The Fourier transform <math|\<cal-F\>> and its inverse
  <math|\<cal-F\><rsup|-1>> are defined as:

  <\equation*>
    \<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x
  </equation*>

  <\equation*>
    \<cal-F\><rsup|-1><around|[|g|]><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
  </equation*>

  <section|Theoretical Framework>

  Let <math|K*<around|(|x-y|)>> be a stationary positive-definite kernel. By
  Bochner's theorem:

  <\equation*>
    K*<around|(|x-y|)>=\<cal-F\><rsup|-1><around|[|S|]><around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|x-y|)>>*S<around|(|\<omega\>|)>*d*\<omega\>
  </equation*>

  where <math|S<around|(|\<omega\>|)>*d*\<omega\>> is the spectral measure.

  <section|The Null Space>

  Let <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
  be polynomials orthogonal with respect to <math|S<around|(|\<omega\>|)>>
  with <math|P<rsub|0><around|(|\<omega\>|)>=1>:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|m><around|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=\<delta\><rsub|m*n>
  </equation*>

  Since <math|P<rsub|0><around|(|\<omega\>|)>=1>, for any <math|n\<geq\>1>:

  <\equation*>
    <around|\<langle\>|P<rsub|n>,1|\<rangle\>><rsub|S>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=0
  </equation*>

  Therefore <math|<around|{|\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|}><rsub|n=1><rsup|\<infty\>>>
  is the null space of the kernel integral operator:

  <\equation*>
    <around|\<langle\>|K,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>=<around|\<langle\>|\<cal-F\><rsup|-1><around|[|S|]>,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>=<around|\<langle\>|S,P<rsub|n>|\<rangle\>>=0
  </equation*>

  <section|Uniform Basis of the Kernel>

  Define the null space vectors:

  <\equation*>
    \<eta\><rsub|n><around|(|x|)>=\<cal-F\><rsup|-1><around|[|P<rsub|n><around|(|\<omega\>|)>|]><around|(|x|)>
  </equation*>

  Apply Gram-Schmidt to <math|<around|{|\<eta\><rsub|n>|}>> to obtain
  orthonormal sequence <math|<around|{|\<psi\><rsub|n>|}>> via:

  <\equation*>
    \<psi\><rsub|k><around|(|x|)>=\<eta\><rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|\<eta\><rsub|k>,\<psi\><rsub|j>|\<rangle\>>|<around|\<\|\|\>|\<psi\><rsub|j>|\<\|\|\>><rsup|2>>*\<psi\><rsub|j><around|(|x|)>
  </equation*>

  Let <math|\<cal-N\>> denote the null space. Then with its orthogonal
  complement <math|\<cal-N\><rsup|\<perp\>>>:

  <\equation*>
    L<rsup|2><around|(|\<bbb-R\>|)>=\<cal-N\>\<cup\>\<cal-N\><rsup|\<perp\>>,<space|1em>\<cal-N\>\<cap\>\<cal-N\><rsup|\<perp\>>=<around|{|0|}>
  </equation*>

  The kernel expansion in <math|\<cal-N\><rsup|\<perp\>>> is:

  <\equation*>
    K<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|x|)>
  </equation*>

  with uniform convergence.

  <section|Uniform Basis of the Spectral Factor>

  Let <math|<around|{|Q<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
  be orthogonal polynomials with respect to
  <math|<sqrt|S<around|(|\<omega\>|)>>>:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>Q<rsub|m><around|(|\<omega\>|)>*Q<rsub|n><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|m*n>
  </equation*>

  Define:

  <\equation*>
    \<xi\><rsub|n><around|(|x|)>=\<cal-F\><rsup|-1><around|[|Q<rsub|n><around|(|\<omega\>|)>|]><around|(|x|)>
  </equation*>

  Apply Gram-Schmidt to <math|<around|{|\<xi\><rsub|n>|}>> to obtain
  orthonormal sequence <math|<around|{|\<phi\><rsub|n>|}>> via:

  <\equation*>
    \<phi\><rsub|k><around|(|x|)>=\<xi\><rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|\<xi\><rsub|k>,\<phi\><rsub|j>|\<rangle\>>|<around|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsup|2>>*\<phi\><rsub|j><around|(|x|)>
  </equation*>

  Then:

  <\equation*>
    g<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n><around|(|x|)>
  </equation*>

  where <math|g> is the spectral factor satisfying <math|g\<ast\>g=K> and
  <math|\<cal-F\><around|[|g|]>=<sqrt|S>>.

  <section|Eigenfunction Construction>

  By Fubini's theorem and uniform convergence:

  <\equation*>
    K*<around|(|x-y|)>=<around|(|g\<ast\>g|)>*<around|(|x-y|)>=<big|sum><rsub|m=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|m>|\<rangle\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*<around|(|\<phi\><rsub|m>\<ast\>\<phi\><rsub|n>|)>*<around|(|x-y|)>
  </equation*>

  The eigenfunctions <math|<around|{|f<rsub|n>|}>> can be expressed in the
  uniform basis <math|<around|{|\<psi\><rsub|n>|}>> with finitely many terms:

  <\equation*>
    f<rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>c<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>
  </equation*>

  where coefficients <math|c<rsub|n*k>> are determined by the recurrence
  relations of the underlying orthogonal polynomials.

  Substituting into Mercer's theorem:

  <\equation*>
    K*<around|(|x-y|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x|)>*f<rsub|n><around|(|y|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*<big|sum><rsub|k=0><rsup|n><big|sum><rsub|j=0><rsup|n>c<rsub|n*k>*c<rsub|n*j>*\<psi\><rsub|k><around|(|x|)>*\<psi\><rsub|j><around|(|y|)>
  </equation*>

  This double sum structure with coefficients is precisely the inner product
  representation guaranteed by Moore-Aronszajn's theorem for reproducing
  kernel Hilbert spaces.

  The triangular structure emerges naturally from the polynomial degree
  preservation under convolution in the spectral domain.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_66.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_66.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_66.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_66.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_66.tm>>
    <associate|auto-6|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_66.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Theoretical
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Uniform
      Basis of the Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Uniform
      Basis of the Spectral Factor> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Eigenfunction
      Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>