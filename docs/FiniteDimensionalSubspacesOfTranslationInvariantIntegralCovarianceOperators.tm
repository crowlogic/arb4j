<TeXmacs|2.1.4>

<style|generic>

<\body>
  \<cdot\><doc-data|<doc-title|Calculation of Eigenvalues and Eigenfunctions
  for Finite-Rank Operators>>

  <section|Introduction>

  This document outlines the method for constructing the matrix
  representation of finite-rank operators and calculating their eigenvalues
  and eigenfunctions using the spectral theorem.

  <section|Matrix Construction>

  \;

  <subsection|Basis Selection>

  Construct the orthonormal basis <math|<around|{|\<psi\><rsub|n>|}>> for
  your space by orthogonalizing the normalized Fourier transforms of the
  unique orthogonal polynomial sequence whose orthogonality measure is equal
  to the Fourier transform of <math|K<around*|(|t-s|)>> which is the spectral
  density of the corresponding Gaussian process due to Bochers theorem and
  the Wiener-Khinchin theorem. Determine its eigenvalues by projecting
  <math|\<lambda\><rsub|n>=<around|\<langle\>|K,\<psi\><rsub|n>|\<rangle\>>>
  and realize that the orthonormal functions <math|\<psi\><rsub|n>> are
  necessarily the eigenfunctions of the corresponding translation-invariat
  (stationary) integral covariance operator having the kernel <math|K> being
  necessarily equal to the limit function to which the partial sums converge.
  If <math|K> is trace-class then the Hilbert-Schmidt theorem is invoked to
  demonstrate this, otherwises results related to the continuous extension of
  maximas of Gaussian processes affirm the uniqueness and existence. (TODO:
  cite refs)

  <subsection|Defining the Operator>

  Consider a finite-rank operator <math|A<rsub|n>> defined by\ 

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>K<rsub|n><around*|(|t,s|)>\<psi\><rsub|n><around*|(|t|)>\<mathd\>t=\<lambda\><rsub|n>
    \<psi\><rsub|n><around*|(|s|)>
  </equation>

  where <math|K<rsub|n>> is the kernel for the <math|n>-th degree finite
  dimensional subspace

  <\equation>
    K<rsub|n><around|(|t,s|)>=<big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|n>\<psi\><rsub|n><around*|(|t-s|)>
  </equation>

  for which\ 

  <\equation>
    K<around*|(|t,s|)>=lim<rsub|n\<rightarrow\>\<infty\>>K<rsub|n><around*|(|t,s|)>
  </equation>

  (TODO: cite relevant convergence theorem)

  <subsection|Matrix Elements>

  The matrix elements <math|A<rsub|i*j>> of the matrix representation of the
  operator <math|A<rsub|n>> in the orthogonal spectral Fourier basis are
  given by:

  <\equation>
    A<rsub|i*j>=<big|int><big|int>\<phi\><rsub|i><around|(|s|)>*K<rsub|n><around|(|s,t|)>*\<phi\><rsub|j><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t
  </equation>

  Each element <math|A<rsub|i*j>> represents the interaction between the
  basis functions mediated by the kernel <math|K<rsub|n>>.

  <section|Calculating Eigenvalues and Eigenfunctions>

  <subsection|Matrix Construction>

  Construct an <math|n\<times\>n> matrix with the elements
  <math|A<rsub|i*j>>. Each entry of this matrix captures the interaction
  between the basis functions mediated by the kernel <math|K<rsub|n>>.

  <subsection|Diagonalization>

  Diagonalize this matrix to find its eigenvalues and eigenvectors. The
  eigenvalues <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<ldots\>,\<lambda\><rsub|n>>
  of this matrix correspond to the eigenvalues of the operator
  <math|A<rsub|n>>, and the eigenvectors of the matrix correspond to the
  coefficients of the eigenfunctions in terms of the basis
  <math|<around|{|\<phi\><rsub|1>,\<phi\><rsub|2>,\<ldots\>,\<phi\><rsub|n>|}>>.

  <subsection|Reconstruct Eigenfunctions>

  Each eigenvector can be used to reconstruct an eigenfunction of
  <math|A<rsub|n>> in the space spanned by the basis. If an eigenvector
  <math|v<rsub|i>> has components <math|v<rsub|i*1>,v<rsub|i*2>,\<ldots\>,v<rsub|i*n>>,
  then the corresponding eigenfunction <math|\<psi\><rsub|i>> is given by:

  <\equation*>
    \<psi\><rsub|i>=v<rsub|i*1>*\<phi\><rsub|1>+v<rsub|i*2>*\<phi\><rsub|2>+\<cdots\>+v<rsub|i*n>*\<phi\><rsub|n>
  </equation*>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-3|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-4|<tuple|2.2|1|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-5|<tuple|2.3|2|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-6|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-7|<tuple|3.1|2|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-8|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_54.tm>>
    <associate|auto-9|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_54.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Matrix
      Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Defining the Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Basis Selection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Matrix Elements
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Calculating
      Eigenvalues and Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Matrix Construction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Diagonalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Reconstruct Eigenfunctions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>