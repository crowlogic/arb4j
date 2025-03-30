<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|Resolutions of Identities Are Spectral Eigenfunction
  Representations>>

  In the case of a spectral decomposition of an operator with a discrete
  spectrum, the discrete measure can be represented as an integral over Dirac
  delta functions shifted by the eigenvalues of the operator. This integral
  representation uses the spectral measure associated with the operator.

  For an operator <math|A> with eigenvalues
  <math|<around|{|\<lambda\><rsub|n>|}>> and corresponding eigenfunctions
  <math|<around|{|\<psi\><rsub|n>|}>>, the spectral measure <math|E> can be
  written as:

  <\equation>
    E<around|(|\<lambda\>|)>=<big|sum><rsub|n>\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|n>|)>\|\<psi\><rsub|n>\<rangle\><around|\<langle\>|\<psi\><rsub|n>|\|>
  </equation>

  Here, <math|\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|n>|)>> is the
  Dirac delta function centered at <math|\<lambda\><rsub|n>>. This expression
  represents the spectral projection operator for the eigenvalue
  <math|\<lambda\><rsub|n>>, and the integral of any function <math|f> over
  this spectral measure gives the operator:

  <\equation>
    f<around|(|A|)>=<big|int>f<around|(|\<lambda\>|)>*<space|0.17em>d*E<around|(|\<lambda\>|)>=<big|sum><rsub|n>f<around|(|\<lambda\><rsub|n>|)>\|\<psi\><rsub|n>\<rangle\><around|\<langle\>|\<psi\><rsub|n>|\|>
  </equation>

  This integral sums over the eigenvalues, applying the function <math|f> to
  each eigenvalue and weighting by the corresponding spectral projection.
  This representation is particularly useful in quantum mechanics and
  functional analysis for defining functions of operators and studying their
  properties.
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