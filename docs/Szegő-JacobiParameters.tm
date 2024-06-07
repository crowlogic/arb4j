<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Szeg®-Jacobi Parameters Are A Map From The Moments
  of a Measure to The Corresponding Set of Orthogonal Polynomials Which Have
  That Measure as Their Orthogonalizing Measure
  >|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Szeg®-Jacobi parameters translate the moments of measures into parameters
  that define the orthogonal polynomials relative to that measure. Two
  notable routes to solution are the Golub-Welsch algorithm and the Stieltjes
  procedure.

  <subsection*|Golub-Welsch Algorithm: Finding the Eigenspaces of the Jacobi
  Matrix Constructed From the Szeg®-Jacobi Parameters(Equivalently the 3-term
  Recurrence)>

  This algorithm efficiently computes the eigenvalues and eigenvectors of
  Jacobi matrices, which correspond to the zeros of orthogonal polynomials
  and their weights in the Gaussian quadrature formula, respectively. It
  involves constructing a tridiagonal matrix from the Szeg®-Jacobi
  parameters, then using eigenvalue solvers to find its eigenvalues and
  eigenvectors.

  <\enumerate>
    <item><with|font-series|bold|Construction>: Construct a symmetric
    tridiagonal matrix <math|J> using the recurrence coefficients
    (Szeg®-Jacobi parameters) <math|a<rsub|n>> and <math|b<rsub|n>> as the
    entries, where <math|a<rsub|n>> are the off-diagonal elements and
    <math|b<rsub|n>> the diagonal elements.

    <item><with|font-series|bold|Eigenvalue Problem>: Solve the eigenvalue
    problem

    <\equation*>
      J*v=\<lambda\>*v
    </equation*>

    where <math|v> are the eigenvectors and <math|\<lambda\>> the
    eigenvalues.

    <item><with|font-series|bold|Orthogonal Polynomials Zeros and Weights>:
    The eigenvalues <math|\<lambda\>> represent the zeros of the orthogonal
    polynomials. The first element of the normalized eigenvectors, squared
    and multiplied by the weight of the corresponding orthogonal polynomial,
    gives the weights for the Gaussian quadrature formula.
  </enumerate>

  <subsection*|Stieltjes Procedure: Orthogonalizing Monomial Sequences with
  the Gram-Schmidt Process>

  The Stieltjes procedure is a method for generating orthogonal polynomials
  and their recurrence coefficients from a given measure. It relies on the
  Gram-Schmidt orthogonalization process applied to the sequence of monomials
  with respect to the inner product defined by the measure.

  <\enumerate>
    <item><with|font-series|bold|Orthogonalization>: Starting with a sequence
    of monomials <math|1,x,x<rsup|2>,\<ldots\>>, apply the Gram-Schmidt
    process using the inner product

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int>f<around|(|x|)>*g<around|(|x|)>*d*\<mu\><around|(|x|)>
    </equation>

    where <math|d*\<mu\><around|(|x|)>> is the measure with respect to which
    the polynomials are orthogonal.

    <item><with|font-series|bold|Recurrence Coefficients>: This process
    inherently produces the recurrence coefficients <math|a<rsub|n>> and
    <math|b<rsub|n>>, which are used to construct orthogonal polynomials
    through the three-term recurrence relation\ 

    <\equation>
      P<rsub|n+1><around|(|x|)>=<around|(|x-a<rsub|n>|)>*P<rsub|n><around|(|x|)>-b<rsub|n>*P<rsub|n-1><around|(|x|)>
    </equation>
  </enumerate>

  \;
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-2|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_33.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Golub-Welsch Algorithm: Finding the
      Eigenspaces of the Jacobi Matrix Constructed From the Szeg®-Jacobi
      Parameters(Equivalently the 3-term Recurrence)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|Stieltjes Procedure: Orthogonalizing
      Monomial Sequences with the Gram-Schmidt Process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>