<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|Gram-Schmidt Process><label|gram-schmidt-process><label|gram-schmidt-process>

  The Gram-Schmidt process is a method for orthonormalizing a set of vectors
  in an inner product space, most commonly <math|\<bbb-R\><rsup|n>>. Given a
  set of linearly independent vectors <math|<around|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>>,
  the Gram-Schmidt process produces an orthonormal set
  <math|<around|{|u<rsub|1>,u<rsub|2>,\<ldots\>,u<rsub|n>|}>> that spans the
  same subspace.

  <subsection|Steps><label|steps><label|steps>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Start with the First Vector>: Normalize your
    first vector <math|v<rsub|1>> to get <math|u<rsub|1>>:

    <\equation>
      u<rsub|1>=<frac|v<rsub|1>|<around|\<\|\|\>|v<rsub|1>|\<\|\|\>>>
    </equation>

    <item><with|font-series|bold|Projection and Subtraction>: For each
    subsequent vector <math|v<rsub|k>>, project it onto all the previously
    computed orthonormal vectors <math|u<rsub|1>,u<rsub|2>,\<ldots\>,u<rsub|k-1>>,
    and subtract these projections from <math|v<rsub|k>>:

    <\equation>
      w<rsub|k>=v<rsub|k>-<big|sum><rsub|i=1><rsup|k-1><around|\<langle\>|v<rsub|k>,u<rsub|i>|\<rangle\>>*u<rsub|i>
    </equation>

    <item><with|font-series|bold|Normalization>: Normalize <math|w<rsub|k>>
    to get <math|u<rsub|k>>:

    <\equation>
      u<rsub|k>=<frac|w<rsub|k>|<around|\<\|\|\>|w<rsub|k>|\<\|\|\>>>
    </equation>
  </enumerate>

  Repeat steps 2 and 3 for each vector in your original set to get the
  orthonormal set <math|<around|{|u<rsub|1>,u<rsub|2>,\<ldots\>,u<rsub|n>|}>>.

  <section|Gram-Schmidt Process with First Three Vectors
  Expanded><label|gram-schmidt-process-with-first-three-vectors-expanded><label|gram-schmidt-process-with-first-three-vectors-expanded>

  <subsection|Steps><label|steps-1><label|steps-1>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|First Vector <math|v<rsub|1>>>: Normalize
    <math|v<rsub|1>> to get <math|u<rsub|1>>:

    <\equation>
      u<rsub|1>=<frac|v<rsub|1>|<around|\<\|\|\>|v<rsub|1>|\<\|\|\>>>
    </equation>

    <item><with|font-series|bold|Second Vector <math|v<rsub|2>>>: Project
    <math|v<rsub|2>> onto <math|u<rsub|1>> and subtract to get
    <math|w<rsub|2>>:

    <\equation>
      w<rsub|2>=v<rsub|2>-<around|\<langle\>|v<rsub|2>,u<rsub|1>|\<rangle\>>*u<rsub|1>
    </equation>

    Then normalize <math|w<rsub|2>> to get <math|u<rsub|2>>:

    <\equation>
      u<rsub|2>=<frac|w<rsub|2>|<around|\<\|\|\>|w<rsub|2>|\<\|\|\>>>
    </equation>

    <item><with|font-series|bold|Third Vector <math|v<rsub|3>>>: Project
    <math|v<rsub|3>> onto <math|u<rsub|1>> and <math|u<rsub|2>>, and subtract
    to get <math|w<rsub|3>>:

    <\equation>
      w<rsub|3>=v<rsub|3>-<around|\<langle\>|v<rsub|3>,u<rsub|1>|\<rangle\>>*u<rsub|1>-<around|\<langle\>|v<rsub|3>,u<rsub|2>|\<rangle\>>*u<rsub|2>
    </equation>

    Then normalize <math|w<rsub|3>> to get <math|u<rsub|3>>:

    <\equation>
      u<rsub|3>=<frac|w<rsub|3>|<around|\<\|\|\>|w<rsub|3>|\<\|\|\>>>
    </equation>
  </enumerate>

  After these steps, you'll have an orthonormal set
  <math|<around|{|u<rsub|1>,u<rsub|2>,u<rsub|3>|}>> that spans the same
  subspace as <math|<around|{|v<rsub|1>,v<rsub|2>,v<rsub|3>|}>>.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|papyrus>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|gram-schmidt-process|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|gram-schmidt-process-with-first-three-vectors-expanded|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|steps|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|steps-1|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gram-Schmidt
      Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gram-Schmidt
      Process with First Three Vectors Expanded>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>