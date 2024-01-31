<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Aronszajn's Theorem>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Aronszajn's theorem basically states that positive definite kernels are
  reproducing kernels and thereforefore a reproducing kernel Hilbert space
  for the kernel exists. \ <cite-detail|stochasticProcessInferenceTheory|5.1,
  p.252> <cite-detail|functionalAnalysisYosida|9 Theorem 1, p.96>

  <\theorem>
    <strong|Aronszajn's Theorem:>

    Given a kernel function <math|K<around|(|x,y|)>> defined
    <math|\<forall\>><math|x,y\<in\>X> where X is any set

    <\enumerate>
      \;

      <item><with|font-series|bold|Symmetry>:
      <math|K<around|(|x,y|)>=<wide|K<around|(|y,x|)>|\<bar\>>> for all
      <math|x,y\<in\>X>. (Here, <math|<wide|z|\<bar\>>> denotes the complex
      conjugate of <math|z>.) This definition is crucial as it extends the
      theorem to complex-valued functions, going beyond the common
      real-valued case.

      <item><with|font-series|bold|Positive Definiteness>: For any finite set
      of points <math|<around|{|x<rsub|1>,x<rsub|2>,...,x<rsub|n>|}>\<subset\>X>
      and any set of complex numbers <math|<around|{|c<rsub|1>,c<rsub|2>,...,c<rsub|n>|}>>,
      the following inequality holds:
    </enumerate>

    <\equation>
      <big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n>c<rsub|i><wide|c<rsub|j>|\<bar\>>K<around|(|x<rsub|i>,x<rsub|j>|)>\<geq\>0
    </equation>

    Then, a unique Hilbert space of functions
    <math|f:X\<rightarrow\>\<bbb-C\>> (or <math|\<bbb-R\>> in the real case)
    exists, characterized by:

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

      <item><with|font-series|bold|Spanning Property>: The space is spanned
      by the functions <math|K<around|(|x,\<cdot\>|)>>, meaning that every
      function in the Hilbert space can be approximated arbitrarily well by
      finite linear combinations of these basis functions.
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

      <item><with|font-series|bold|Construct the Hilbert Space <math|H>>:

      <\itemize>
        <item>Define <math|K<rsub|x>=K<around|(|x,\<cdot\>|)>> for each
        <math|x> <math|\<in\>> <math|X>. Let <math|H<rsub|0>> be the linear
        span of <math|<around|{|K<rsub|x>:x*\<in\>*X|}>>.

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

    where the convergence is in the norm of <math|H<rsub|0>>.\ 

    <\enumerate>
      <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

      <item><with|font-series|bold|Verification of Reproducing Property>:

      <\itemize>
        <item>\<forall\><math|f> \<in\> <math|H> and
        \<forall\><math|x\<in\>X>:
      </itemize>
    </enumerate>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|f,K<rsub|x>|\<rangle\>><rsub|H>>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*<around|\<langle\>|K<rsub|x<rsub|i>>,K<rsub|x>|\<rangle\>><rsub|H<rsub|0>>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*K<around|(|x<rsub|i>,x|)>>>|<row|<cell|>|<cell|=f<around|(|x|)>>>>>>
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
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|K<rsub|x>,K<rsub|y>|\<rangle\>><rsub|H>>|<cell|=K<around|(|x,y|)>>>|<row|<cell|>|<cell|=<around|\<langle\>|K<rsub|x>,K<rsub|y>|\<rangle\>><rsub|G>>>>>>
    </equation>

    This implies

    <\equation>
      <around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|H>=<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>><rsub|G>
    </equation>

    on the span of <math|<around|{|K<rsub|x>:x*\<in\>*X|}>>, thus
    <math|H\<subset\>G>. To show every element of <math|G> is in <math|H>,
    \<forall\><math|f\<in\>G>, constitute <math|f> by combining
    <math|f<rsub|H>\<in\>H> and <math|f<rsub|H<rsup|\<bot\>>>\<in\>H<rsup|\<bot\>>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|f<around|(|x|)>>|<cell|=<around|\<langle\>|K<rsub|x>,f|\<rangle\>><rsub|G>>>|<row|<cell|>|<cell|=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|G>+<around|\<langle\>|K<rsub|x>,f<rsub|H<rsup|\<bot\>>>|\<rangle\>><rsub|G>>>|<row|<cell|>|<cell|=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|G>>>|<row|<cell|>|<cell|=<around|\<langle\>|K<rsub|x>,f<rsub|H>|\<rangle\>><rsub|H>>>|<row|<cell|>|<cell|=f<rsub|H><around|(|x|)>>>>>>
    </equation>

    The inner product <math|K<rsub|x>> with
    <math|f<rsub|H<rsup|\<bot\>>>>\<in\><math|G> is

    <\equation>
      <around|\<langle\>|K<rsub|x>,f<rsub|H<rsup|\<bot\>>>|\<rangle\>><rsub|G>=0
    </equation>

    \ since <math|K<rsub|x>>\<in\><math|H>. This demonstrates

    <\equation>
      f<around*|(|x|)>=f<rsub|H><around*|(|x|)>\<forall\>x\<in\>X
    </equation>

    <math|>confirming the uniqueness of <math|H>.
  </proof>

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|2>
      <bibitem*|1><label|bib-stochasticProcessInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>

      <bibitem*|2><label|bib-functionalAnalysisYosida><with|font|roman|\<#5409\>\<#7530\>
      \<#8015\>\<#4F5C\>>(K\<#14D\>saku Yosida).
      <newblock><with|font-shape|italic|Functional Analysis>.
      <newblock>Classics in Mathematics. Springer Berlin Heidelberg, Reprint
      of the 1980 Edition<localize| edition>, 1995.<newblock>
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
    <associate|auto-1|<tuple|10|3>>
    <associate|bib-functionalAnalysisYosida|<tuple|2|3>>
    <associate|bib-stochasticProcessInferenceTheory|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticProcessInferenceTheory

      functionalAnalysisYosida
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>