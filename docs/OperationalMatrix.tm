<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  In the context of the Jacobi spectral tau method, an operational matrix is
  a mathematical tool used to represent the operation of differentiation (or
  potentially other operations) on a series of functions, such as
  polynomials, in terms of a matrix operation on the coefficients of those
  functions. Specifically, when functions are expanded in terms of a basis of
  polynomials (e.g., Jacobi polynomials), the derivative of such a function
  can be expressed as a linear combination of the same set of polynomials.
  The operational matrix of differentiation encodes this transformation.

  Given a function <math|f<around|(|x|)>> expanded in terms of a basis
  <math|<around|{|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|}><rsub|n=0><rsup|N>>
  of Jacobi polynomials,

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|n=0><rsup|N>a<rsub|n>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>
  </equation>

  where <math|a<rsub|n>> are the coefficients of the expansion, the
  derivative of <math|f<around|(|x|)>>, denoted by
  <math|f<rprime|'><around|(|x|)>>, can also be expanded in terms of the same
  polynomials:

  <\equation>
    f<rprime|'><around|(|x|)>=<big|sum><rsub|n=0><rsup|N>b<rsub|n>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>
  </equation>

  The operational matrix <math|D> for differentiation is then defined such
  that

  <\equation>
    <math-bf|b>=D<math-bf|a>
  </equation>

  where <math|<math-bf|a>=<around|[|a<rsub|0>,a<rsub|1>,\<ldots\>,a<rsub|N>|]><rsup|T>>
  and <math|<math-bf|b>=<around|[|b<rsub|0>,b<rsub|1>,\<ldots\>,b<rsub|N>|]><rsup|T>>
  are vectors of the coefficients of <math|f<around|(|x|)>> and its
  derivative <math|f<rprime|'><around|(|x|)>>, respectively. The matrix
  <math|D> thus transforms the coefficient vector of the function into the
  coefficient vector of its derivative.

  The elements of <math|D> can be determined by explicitly calculating the
  derivatives of the Jacobi polynomials and expressing these derivatives as
  linear combinations of the polynomials themselves. That is, for each
  polynomial <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>,

  <\equation>
    <frac|d|d*x>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<big|sum><rsub|m=0><rsup|N>D<rsub|m*n>*P<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>
  </equation>

  where <math|D<rsub|m*n>> are the elements of the operational matrix
  <math|D>, encoding how the <math|n>-th polynomial's derivative is
  represented in terms of the polynomial basis.

  This operational matrix <math|D> is crucial in the spectral tau method
  because it enables the analytical representation of differential operators
  on the polynomial basis, thus facilitating the transformation of
  differential equations into algebraic ones. Operational matrices for
  higher-order derivatives or other linear operators can be constructed
  similarly, allowing for the efficient solution of various differential
  equations using polynomial approximations.
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