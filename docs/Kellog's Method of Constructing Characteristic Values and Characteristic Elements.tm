<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Kellog's Method of Constructing Characteristic Values
  and Characteristic Elements>>

  The following method of constructing the characteristic values different
  from 0 of a completely continuous symmetric transformation <math|A\<neq\>0>
  is due to KELLOGG and communicated in <cite-detail|functionalAnalysisRieszNagy|96>
  by Riesz&Nagy.

  Let <math|f<rsub|0>> be an element such that <math|A*f<rsub|0>\<neq\>0>,
  but otherwise arbitrary. Set

  <\equation>
    f<rsub|n>=A<rsup|n>*f<rsub|0><space|1em><around|(|n=1,2,\<ldots\>|)>
  </equation>

  The relation

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|(|U*f<rsub|n>,f<rsub|n>|)>>|<cell|=<around|(|A*f<rsub|n-1>,f<rsub|n>|)>>>|<row|<cell|>|<cell|=<around|(|f<rsub|n-1>,A*f<rsub|n>|)>>>|<row|<cell|>|<cell|=<around|(|f<rsub|n-1>,f<rsub|n+1>|)>>>>>><space|1em><around|(|n=1,2,\<ldots\>|)>
  </equation>

  makes it clear that if <math|f<rsub|n>\<neq\>0>, then also
  <math|f<rsub|n+1>\<neq\>0>. Since <math|f<rsub|0>\<neq\>0> and
  <math|f<rsub|1>\<neq\>0>, we have <math|\<forall\>><math|n:f<rsub|n>\<neq\>0>.
  Denoting the ratio <math|<frac|<around|\<\|\|\>|f<rsub|n+1>|\<\|\|\>>|<around|\<\|\|\>|f<rsub|n>|\<\|\|\>>>>
  by <math|r<rsub|n>> and setting <math|<around|\<\|\|\>|f<rsub|0>|\<\|\|\>>=v<rsub|0>>
  we have

  <\equation>
    f<rsub|n>=<around|(|v<rsub|0>*r<rsub|1>*\<ldots\>*r<rsub|n-1>|)>*g<rsub|n>
  </equation>

  where <math|g<rsub|n>> is an element of <math|\<frak-S\>> of norm 1. We
  have the equations

  <\equation>
    A*g<rsub|n>=r<rsub|n+1>*g<rsub|n+1>+A<rsup|2>*g<rsub|n>=r<rsub|n+1>*r<rsub|n+2>*g<rsub|n+2>+\<ldots\>
  </equation>

  It follows from the first equation that
  <math|r<rsub|n+1>\<leq\><around|\<\|\|\>|A|\<\|\|\>>>. On the other hand,
  (15) implies that

  <\equation>
    r<rsub|n>=<frac|<around|(|g<rsub|n-1>,f<rsub|n+1>|)>|<around|\<\|\|\>|f<rsub|n>|\<\|\|\>>>\<leq\>r<rsub|n>+1
  </equation>

  Consequently the sequence <math|<around|{|r<rsub|n>|}>> converges to some
  positive quantity <math|r>. Making use of equations (16), we obtain

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|g<rsub|n>-g<rsub|n+2>|\<\|\|\>><rsup|2>>|<cell|=2-2*<around|(|g<rsub|n>,g<rsub|n+2>|)>>>|<row|<cell|>|<cell|=2-<around|(|g<rsub|n+1>+A<rsup|2>*g<rsub|n>,g<rsub|n+1>+A<rsup|2>*g<rsub|n>|)>>>|<row|<cell|>|<cell|=2-2<around*|(|<frac|<around|(|A*g<rsub|n>,A*g<rsub|n>|)>|r<rsub|n+1>*r<rsub|n+2>>|)>>>|<row|<cell|>|<cell|=2-2<around*|(|<frac|r<rsub|n+1><rsup|2>|r<rsub|n+1>*r<rsub|n+2>>|)>>>|<row|<cell|>|<cell|=2*<around|(|1-<frac|r<rsub|n+1>|r<rsub|n+2>>|)>\<to\>0>>>>>
  </equation>

  hence

  <\equation>
    g<rsub|n>-g<rsub|n+2>=g<rsub|n>-<frac|A<rsup|2>*g<rsub|n>|r<rsub|n+1>*r<rsub|n+2>>*\<rightarrow\>0*<text|as
    >n\<rightarrow\>\<infty\>
  </equation>

  Since the sequence of elements

  <\equation>
    h<rsub|n>=<frac|g<rsub|n>|r<rsub|n+1>+r<rsub|n+2>>*
  </equation>

  is bounded, it contains a subsequence for which <math|A<rsup|2>*h<rsub|n>>
  converges to some element <math|\<varphi\>> of <math|\<frak-S\>>. The
  corresponding subsequence of <math|<around|{|g<rsub|n>|}>> converges, by
  (1), to the same element <math|\<varphi\>>, and that of the sequence

  <\equation>
    <around*|{|g<rsub|n>-<frac|A<rsup|2>*g<rsub|n>|r<rsub|n+1>+r<rsub|n+2>>*|}>
  </equation>

  to

  <\equation>
    \<varphi\>-<frac|A<rsup|2>*\<varphi\>|r>*
  </equation>

  therefore we have

  <\equation>
    \<varphi\>-<frac|A<rsup|2>*\<varphi\>|r>*=\<varphi\>
  </equation>

  <\equation>
    A<rsup|2>*\<varphi\>=r*\<varphi\>
  </equation>

  Since <math|><math|\<varphi\>> is the limit of the sequence
  <math|<around|{|g<rsub|n>|}>> of elements of norm 1, <math|\<varphi\>> has
  norm 1 also. Therefore <math|\<varphi\>> is a characteristic element of
  <math|A<rsup|2>>. We obtain a characteristic element of <math|A> from it in
  the following manner. We set

  <\equation>
    A*\<varphi\>=r*\<psi\>
  </equation>

  <\equation>
    A*\<chi\>=-r*\<chi\>
  </equation>

  then

  <\equation>
    A*\<psi\>=r*\<varphi\><text|>
  </equation>

  <\equation>
    <space|1em>A*\<chi\>=-r*\<chi\>
  </equation>

  Since <math|\<varphi\>+\<chi\>=2*\<psi\>\<neq\>0>, the elements
  <math|\<varphi\>> and <math|\<chi\>> cannot be zero simultaneously, hence
  at least one of the values <math|r> and <math|-r> is a characteristic value
  of <math|A>.\ 

  <\note>
    More profound study of the sequence <math|<around|{|g<rsub|n>|}>>, as
    well as an application of the same method to certain non-completely
    continuous symmetric transformations, is found in the Notes [1], [2] of
    R. Wavre. The same method can be applied with success to non-symmetric
    completely continuous linear transformations which can be made symmetric
    if multiplied on the left by a suitable positive symmetric transformation
    (symmetrizable transformations).

    <with|font-shape|italic|Cf. Zaanen [1]. Integral equations with
    "symmetrizable" kernels have been studied by several authors, starting
    with Hilbert (Note 5); see the article in the Encyclopädie by Hellinger
    and Toeplitz [2] (pp. 1536\U1543) and, among recent contributions, see
    Reid [1], where bibliographical references are also found.>
  </note>

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-functionalAnalysisRieszNagy>Frigyes
      Riesz<localize| and >Béla Sz.-Nagy.
      <newblock><with|font-shape|italic|Functional Analysis>. <newblock>Dover
      Books on Mathematics. Dover Publications, unabridged republication of
      1955<localize| edition>, 2012.<newblock>
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
    <associate|auto-1|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-functionalAnalysisRieszNagy|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      functionalAnalysisRieszNagy
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>