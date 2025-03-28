<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Solving Positive Definite Integral Covariance
  Operators>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    The eigenfunctions <math|<around|{|\<psi\><rsub|n>|}>> of the covariance
    operator <math|T> of a Gaussian process having a translation-invariant
    kernel <math|K<around*|(|x,y|)>=K<around*|(|x-y|)>> can be obtained by
    orthogonalizing and projection the normalized Fourier transforms of the
    orthogonal polynomials corresponding to the Gaussian processes spectral
    density <math|S>(given by the Fourier transform of the positive-definite
    translation-invariant kernel K) uniformly converges to <math|K> and
    constitutes the unique eigenfunctions of <math|T>.
  </abstract>>

  <subsection*|Assumptions and Setup>

  <with|font-series|bold|Kernel <math|K>>:
  <math|K<around|(|x,y|)>=K*<around|(|x-y|)>> is a positive definite,
  symmetric, translation-invariant kernel

  <with|font-series|bold|Orthogonal Polynomials
  <math|<around|{|\<phi\><rsub|n>|}>>>: Identify the set of polynomials
  <math|<around|{|\<phi\><rsub|n>|}> >whose ortogonality measuring weight
  function is the spectral density \ <math|S<around|(|\<omega\>|)>> defined
  by the Fourier transform of the kernel <math|K> over the positive half-line

  <\equation>
    S<around*|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>K<around*|(|x|)>e<rsup|i
    x \<omega\>>\<mathd\>x
  </equation>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|m><around|(|\<omega\>|)>*\<phi\><rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>=\<delta\><rsub|m*n>
  </equation>

  Such a set always exists, if it does not correspond to a standard set of
  classical orthogonal polynomials then calculate it.

  <with|font-series|bold|Fourier Transforms <math|<around|{|Y<rsub|n>|}>>>:
  The unweighted Fourier transforms of <math|<around|{|\<phi\><rsub|n>|}>>
  are\ 

  <\equation>
    Y<rsub|n><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*\<phi\><rsub|n><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>
  </equation>

  <subsection*|Objective>

  Demonstrate that the sequence <math|<around|{|\<psi\><rsub|n>|}>>, obtained
  by orthogonalizing <math|<around|{|Y<rsub|n>|}>> and weighting by their
  projections onto <math|K>, converges uniformly to <math|K> and constitutes
  the unique eigenfunctions of the covariance operator <math|T>.

  <subsection*|Proof Steps>

  <subsubsection*|Step 1: Orthogonalization>

  Apply the Gram-Schmidt process to <math|<around|{|Y<rsub|n>|}>> within
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> to obtain an orthogonal sequence
  <math|<around|{|Y<rsub|n><rsup|\<perp\>>|}>>:

  <\equation>
    Y<rsub|n><rsup|\<perp\>>=Y<rsub|n>-<big|sum><rsub|j=0><rsup|n-1><frac|<around|\<langle\>|Y<rsub|j>,Y<rsub|j><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|Y<rsub|j><rsup|\<perp\>>,Y<rsub|j><rsup|\<perp\>>|\<rangle\>>>*Y<rsub|j><rsup|\<perp\>>
  </equation>

  where <math|<around|\<langle\>|f,g|\<rangle\>>> denotes the
  <math|L<rsup|2>> inner product.

  <subsubsection*|Step 2: Weighting by Projections onto <math|K>>

  Define <math|\<psi\><rsub|n>> as the scaled orthogonalized functions
  <math|Y<rsub|n><rsup|\<perp\>>> using their projections onto <math|K>:

  <\equation>
    \<psi\><rsub|n><around*|(|y|)>=<frac|<around|\<langle\>|K,Y<rsub|n><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|Y<rsub|n><rsup|\<perp\>>,Y<rsub|n><rsup|\<perp\>>|\<rangle\>>>*Y<rsub|n><rsup|\<perp\>><around*|(|y|)>
  </equation>

  <subsubsection*|Step 3: Uniform Convergence to <math|K>>

  Utilize Parseval's theorem and the completeness of the orthogonal set
  <math|<around|{|Y<rsub|n><rsup|\<perp\>>|}>> in <math|L<rsup|2>> to show
  that:

  <\equation>
    <big|sum><rsub|n=1><rsup|\<infty\>><around|\<\|\|\>|K-<big|sum><rsub|j=1><rsup|n>\<psi\><rsub|j>|\<\|\|\>><rsub|L<rsup|2>><rsup|2>\<to\>0*<space|1em><text|as><space|1em>n\<to\>\<infty\>
  </equation>

  \ guarantees the uniform convergence of
  <math|lim<rsub|N\<rightarrow\>\<infty\>><big|sum><rsub|n=0><rsup|N>\<psi\><rsub|n><around|(|x|)>=K<around|(|x|)>>

  <subsubsection*|Step 4: Eigenfunction Property>

  Each <math|\<psi\><rsub|n>> satisfies the eigenfunction equation for the
  covariance operator <math|T> associated with <math|K>:

  <\equation>
    T*\<psi\><rsub|n>=\<lambda\><rsub|n>*\<psi\><rsub|n>
  </equation>

  where\ 

  <\equation>
    \<lambda\><rsub|n>=<frac|<around|\<langle\>|K,Y<rsub|n><rsup|\<perp\>>|\<rangle\>>|<around|\<langle\>|Y<rsub|n><rsup|\<perp\>>,Y<rsub|n><rsup|\<perp\>>|\<rangle\>>>
  </equation>

  <subsubsection*|Step 5: Uniqueness of Eigenfunctions>

  As <math|<around|{|\<psi\><rsub|n>|}>> forms an orthogonal basis in
  <math|L<rsup|2>>, any function orthogonal to all <math|\<psi\><rsub|n>>
  must be the zero function, establishing the uniqueness of
  <math|<around|{|\<psi\><rsub|n>|}>> as the eigenfunctions of <math|T>.

  <subsection*|Conclusion>

  The proof demonstrates that the sequence
  <math|<around|{|\<psi\><rsub|n>|}>>, obtained through orthogonalization and
  weighting of Fourier transforms of orthogonal polynomials corresponding to
  a Gaussian processes spectral density <math|S>, uniformly converges to
  <math|K> and constitutes the unique eigenfunctions of the
  translation-invariant covariance operator <math|T>.\ 
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|3|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|3|2>>
    <associate|auto-5|<tuple|4|2>>
    <associate|auto-6|<tuple|5|2>>
    <associate|auto-7|<tuple|6|2>>
    <associate|auto-8|<tuple|8|2>>
    <associate|auto-9|<tuple|8|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Assumptions and Setup
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|Objective
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Proof Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|Step 1: Orthogonalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|Step 2: Weighting by Projections onto
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|Step 3: Uniform Convergence to
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|Step 4: Eigenfunction Property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|Step 5: Uniqueness of Eigenfunctions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>