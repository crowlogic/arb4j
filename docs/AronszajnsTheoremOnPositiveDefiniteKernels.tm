<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Aronszajn's Theorem>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Aronszajn's Theorem><label|aronszajns-theorem><label|aronszajns-theorem>

  Given a kernel function <math|K<around|(|x,y|)>> defined for all <math|x,y>
  in a non-empty set <math|X> and satisfying:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Symmetry>:
    <math|K<around|(|x,y|)>=<wide|K<around|(|y,x|)>|\<bar\>>> for all
    <math|x,y\<in\>X>. (Here, <math|<wide|z|\<bar\>>> denotes the complex
    conjugate of <math|z>.) This definition is crucial as it extends the
    theorem to complex-valued functions, going beyond the common real-valued
    case.

    <item><with|font-series|bold|Positive Definiteness>: For any finite set
    of points <math|<around|{|x<rsub|1>,x<rsub|2>,...,x<rsub|n>|}>\<subset\>X>
    and any set of complex numbers <math|<around|{|c<rsub|1>,c<rsub|2>,...,c<rsub|n>|}>>,
    the following inequality holds:
  </enumerate>

  <\equation>
    <big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n>c<rsub|i><wide|c<rsub|j>|\<bar\>>K<around|(|x<rsub|i>,x<rsub|j>|)>\<geq\>0
  </equation>

  Positive definiteness is key for constructing a Hilbert space as it ensures
  the non-negativity and non-degeneracy of the inner product.

  Then, a unique Hilbert space of functions <math|f:X\<rightarrow\>\<bbb-C\>>
  (or <math|\<bbb-R\>> in the real case) exists, characterized by:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Reproducing Kernel Property>:
    <math|K<around|(|x,\<cdot\>|)>> is in the Hilbert space for every
    <math|x> in <math|X>, and for every function <math|f> in the Hilbert
    space and for all <math|x\<in\>X>, the reproducing property holds:
  </enumerate>

  <\equation>
    f<around|(|x|)>=\<langle\>f,K(x,\<cdot\><around|)||\<rangle\>>
  </equation>

  This property enables the evaluation of functions in the Hilbert space at
  any point in <math|X> through inner products.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|Spanning Property>: The space is spanned by
    the functions <math|K<around|(|x,\<cdot\>|)>>, meaning that every
    function in the Hilbert space can be approximated arbitrarily well by
    finite linear combinations of these basis functions.
  </enumerate>

  <section|Enhanced Proof><label|enhanced-proof><label|enhanced-proof>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Construct the Hilbert Space <math|H>>:

    <\itemize>
      <item>Define <math|K<rsub|x>=K<around|(|x,\<cdot\>|)>> for each
      <math|x> in <math|X>. Let <math|H<rsub|0>> be the linear span of
      <math|<around|{|K<rsub|x>:x*\<in\>*X|}>>.

      <item>Define an inner product on <math|H<rsub|0>> by:
    </itemize>
  </enumerate>

  <\equation>
    <around*|\<langle\>|<big|sum><rsub|j=1><rsup|n>b<rsub|j>*K<rsub|y<rsub|j>>,<big|sum><rsub|i=1><rsup|m>a<rsub|i>*K<rsub|x<rsub|i>>|\<rangle\>><rsub|H<rsub|0>>=<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|n>a<rsub|i>*b<rsub|j>*K<around|(|y<rsub|j>,x<rsub|i>|)>
  </equation>

  This inner product is symmetric due to the symmetry of <math|K>, and its
  non-degeneracy stems from <math|K> being positive definite. - The
  completion of <math|H<rsub|0>> with respect to this inner product forms
  <math|H>, consisting of functions like:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*K<rsub|x<rsub|i>><around|(|x|)>
  </equation>

  where the convergence is in the norm of <math|H<rsub|0>>. This completion
  step ensures <math|H> is a complete space, thus a true Hilbert space.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|Verification of Reproducing Property>:

    <\itemize>
      <item>For any <math|f> in <math|H> and any <math|x\<in\>X>:
    </itemize>
  </enumerate>

  <\equation>
    <around|\<langle\>|f,K<rsub|x>|\<rangle\>><rsub|H>=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*<around|\<langle\>|K<rsub|x<rsub|i>>,K<rsub|x>|\<rangle\>><rsub|H<rsub|0>>=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*K<around|(|x<rsub|i>,x|)>=f<around|(|x|)>
  </equation>

  This shows how the inner product in <math|H> can be used to evaluate
  functions at any point in <math|X>.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|2>

    <item><with|font-series|bold|Proof of Uniqueness>:

    <\itemize>
      <item>Assume <math|G> is another Hilbert space with <math|K> as its
      reproducing kernel. For every <math|x,y\<in\>X>:
    </itemize>
  </enumerate>

  <\equation>
    <around|\<langle\>|K<rsub|x>,K<rsub|y>|\<rangle\>><rsub|H>=K<around|(|x,y|)>=<around|\<langle\>|K<rsub|x>,K<rsub|y>|\<rangle\>><rsub|G>
  </equation>

  This implies <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|H>=<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|G>>
  on the span of <math|<around|{|K<rsub|x>:x*i*n*X|}>>, leading to
  <math|H\<subset\>G>. - To show every element of <math|G> is in <math|H>,
  for any <math|f\<in\>G>, decompose <math|f> into <math|f<rsub|H>\<in\>H>
  and <math|f<rsub|H<rsup|\<bot\>>>\<in\>H<rsup|\<bot\>>>:

  <\equation>
    f<around|(|x|)>=<around|\<langle\>|K<rsub|x>,f|\<rangle\>><rsub|G>=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|G>+<around|\<langle\>|K<rsub|x>,f<rsub|H<rsup|\<bot\>>>|\<rangle\>><rsub|G>=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|G>=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|H>=f<rsub|H><around|(|x|)>
  </equation>

  Since <math|K<rsub|x>> is in <math|H>, the inner product with
  <math|f<rsub|H<rsup|\<bot\>>>> in <math|G> is zero. This demonstrates
  <math|f=f<rsub|H>> in <math|G>, confirming the uniqueness of <math|H>.
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
    <associate|aronszajns-theorem|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|enhanced-proof|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Aronszajn's
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Enhanced
      Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>