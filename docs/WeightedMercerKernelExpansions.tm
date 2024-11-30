<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white>>

<\body>
  <doc-data|<doc-title|Weighted Integral Covariance Operators for Mercer
  Kernels>|<doc-author|<author-data|<author-name|S.A.C.>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Rigorous
    Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Initial Assumptions and Setup
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Step 1: Weighted Operator Construction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Step 2: Spectral Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Step 3: Eigenfunction Recovery
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.5<space|2spc>Step 4: Completeness and Orthogonality
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.6<space|2spc>Step 5: Convergence Analysis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.7<space|2spc>Step 6: Boundedness
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.8<space|2spc>Regularity Conditions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Rigorous Proof>

  <subsection|Initial Assumptions and Setup>

  Let <math|<around|(|X,\<mu\>|)>> be a compact measure space and
  <math|K<around|(|x,y|)>> be a kernel with the following properties:

  <\enumerate>
    <item>Symmetric: <math|K<around|(|x,y|)>=K<around|(|y,x|)>>

    <item>Positive definite in the weighted space
    <math|L<rsup|2><around|(|X,w\<cdot\>\<mu\>|)>>

    <item>Continuous on <math|X\<times\>X>
  </enumerate>

  Let <math|w:X\<to\><around|(|0,\<infty\>|)>> be a continuous weight
  function satisfying:

  <\itemize>
    <item><math|w<around|(|x|)>\<geq\>\<varepsilon\>\<gtr\>0> for some
    <math|\<varepsilon\>> and all <math|x\<in\>X>

    <item><math|K<around|(|x,y|)>/<sqrt|w<around|(|x|)>>*<sqrt|w<around|(|y|)>>>
    is square integrable
  </itemize>

  <subsection|Step 1: Weighted Operator Construction>

  Define the weighted kernel:

  <\equation>
    K<rsub|w><around|(|x,y|)>=K<around|(|x,y|)><sqrt|w<around|(|x|)>>*<sqrt|w<around|(|y|)>>
  </equation>

  The weighted integral operator <math|T<rsub|w>:L<rsup|2><around|(|X,\<mu\>|)>\<to\>L<rsup|2><around|(|X,\<mu\>|)>>
  is:

  <\equation>
    T<rsub|w>*f<around|(|x|)>=<big|int>K<around|(|x,y|)><sqrt|w<around|(|x|)>>*<sqrt|w<around|(|y|)>>*f<around|(|y|)>*d*\<mu\><around|(|y|)>
  </equation>

  <subsection|Step 2: Spectral Properties>

  By Mercer's theorem (since <math|X> is compact and <math|K<rsub|w>> is
  continuous), we have:

  <\equation>
    K<rsub|w><around|(|x,y|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<phi\><rsub|i><around|(|x|)>*\<phi\><rsub|i><around|(|y|)>
  </equation>

  where:

  <\enumerate>
    <item><math|<around|{|\<lambda\><rsub|i>|}><rsub|i\<geq\>1>> are positive
    eigenvalues in decreasing order

    <item><math|<around|{|\<phi\><rsub|i>|}><rsub|i\<geq\>1>> are continuous
    orthonormal eigenfunctions in <math|L<rsup|2><around|(|X,\<mu\>|)>>

    <item>The series converges absolutely and uniformly on <math|X\<times\>X>
  </enumerate>

  <subsection|Step 3: Eigenfunction Recovery>

  Define <math|\<psi\><rsub|i><around|(|x|)>=\<phi\><rsub|i><around|(|x|)>/<sqrt|w<around|(|x|)>>>.
  Then:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int>K<around|(|x,y|)>*\<psi\><rsub|i><around|(|y|)>*d*\<mu\><around|(|y|)>>|<cell|=<big|int>K<around|(|x,y|)>*<around|[|\<phi\><rsub|i><around|(|y|)>/<sqrt|w<around|(|y|)>>|]>*d*\<mu\><around|(|y|)>>>|<row|<cell|>|<cell|=1/<sqrt|w<around|(|x|)>>*<big|int><around|[|K<around|(|x,y|)><sqrt|w<around|(|x|)>>*<sqrt|w<around|(|y|)>>|]><around|[|\<phi\><rsub|i><around|(|y|)>|]>*d*\<mu\><around|(|y|)>>>|<row|<cell|>|<cell|=1/<sqrt|w<around|(|x|)>>*<big|int>K<rsub|w><around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*\<mu\><around|(|y|)>>>|<row|<cell|>|<cell|=1/<sqrt|w<around|(|x|)>>*<around|[|\<lambda\><rsub|i>*\<phi\><rsub|i><around|(|x|)>|]>>>|<row|<cell|>|<cell|=\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|x|)>>>>>>
  </equation>

  <subsection|Step 4: Completeness and Orthogonality>

  For the weighted inner product <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|w>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|w>>|<cell|=<big|int>\<psi\><rsub|i><around|(|x|)>*\<psi\><rsub|j><around|(|x|)>*w<around|(|x|)>*d*\<mu\><around|(|x|)>>>|<row|<cell|>|<cell|=<big|int><around|[|\<phi\><rsub|i><around|(|x|)>/<sqrt|w<around|(|x|)>>|]>*<around|[|\<phi\><rsub|j><around|(|x|)>/<sqrt|w<around|(|x|)>>|]>*w<around|(|x|)>*d*\<mu\><around|(|x|)>>>|<row|<cell|>|<cell|=<big|int>\<phi\><rsub|i><around|(|x|)>*\<phi\><rsub|j><around|(|x|)>*d*\<mu\><around|(|x|)>>>|<row|<cell|>|<cell|=\<delta\><rsub|i*j>>>>>>
  </equation>

  Completeness follows from the completeness of
  <math|<around|{|\<phi\><rsub|i>|}>> in <math|L<rsup|2><around|(|X,\<mu\>|)>>.

  <subsection|Step 5: Convergence Analysis>

  For <math|f\<in\>L<rsup|2><around|(|X,w\<cdot\>\<mu\>|)>>, the Parseval
  identity holds:

  <\equation>
    <around|\<\|\|\>|f|\<\|\|\>><rsup|2><rsub|w>=<big|sum><rsub|i=1><rsup|\<infty\>><around|\||<around|\<langle\>|f,\<psi\><rsub|i>|\<rangle\>><rsub|w>|\|><rsup|2>
  </equation>

  The kernel expansion:

  <\equation>
    K<around|(|x,y|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|x|)>*\<psi\><rsub|i><around|(|y|)>
  </equation>

  converges:

  <\enumerate>
    <item>Absolutely in the weighted norm

    <item>Uniformly on compact subsets where <math|w> is bounded away from
    zero

    <item>In the operator norm topology
  </enumerate>

  <subsection|Step 6: Boundedness>

  For the original operator <math|T>:

  <\equation>
    <around|\<\|\|\>|T*f|\<\|\|\>><rsup|2><rsub|w>\<leq\><around|\<\|\|\>|K|\<\|\|\>><rsub|\<infty\>,w><around|\<\|\|\>|f|\<\|\|\>><rsup|2><rsub|w>
  </equation>

  where:

  <\equation>
    <around|\<\|\|\>|K|\<\|\|\>><rsub|\<infty\>,w>=<text|ess
    sup><big|int><big|int><around|\||K<around|(|x,y|)>|\|><rsup|2>*w<around|(|x|)>*w<around|(|y|)>*d*\<mu\><around|(|x|)>*d*\<mu\><around|(|y|)>
  </equation>

  <subsection|Regularity Conditions>

  The interchange of integration and summation is justified by:

  <\enumerate>
    <item>Uniform convergence on compact sets

    <item>Dominated convergence theorem applied to the weighted space

    <item>Continuity of <math|w<around|(|x|)>> ensuring well-behaved weight
    function
  </enumerate>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|0>
      \;
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-10|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|1.3|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|1.4|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-6|<tuple|1.5|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-7|<tuple|1.6|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-8|<tuple|1.7|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-9|<tuple|1.8|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Rigorous
      Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Initial Assumptions and
      Setup <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Step 1: Weighted Operator
      Construction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Step 2: Spectral Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Step 3: Eigenfunction
      Recovery <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Step 4: Completeness and
      Orthogonality <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Step 5: Convergence Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.7<space|2spc>Step 6: Boundedness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.8<space|2spc>Regularity Conditions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>