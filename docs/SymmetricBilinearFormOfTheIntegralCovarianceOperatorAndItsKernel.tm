<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  To express the translation-invariant kernel <math|J<rsub|0>> and the
  integral covariance operator in terms of symmetric bilinear forms, given
  <math|J<rsub|0>> acts on <math|L<rsup|2>>, the space of square-integrable
  functions, and considering an RKHS with an orthonormal basis of orthogonal
  polynomials:

  <\enumerate>
    <item><with|font-series|bold|Kernel as a Symmetric Bilinear Form>: The
    kernel <math|J<rsub|0>*<around|(|x-y|)>> itself is a positive definite
    function and represents a symmetric bilinear form
    <math|B<around|(|f,g|)>> for <math|f,g\<in\>L<rsup|2>> as:

    <\equation>
      B<around|(|f,g|)>=<big|int><big|int>J<rsub|0>*<around|(|x-y|)>*f<around|(|x|)>*g<around|(|y|)>*d*x*d*y
    </equation>

    This is symmetric due to the property
    <math|J<rsub|0>*<around|(|x-y|)>=J<rsub|0>*<around|(|y-x|)>>

    <item><with|font-series|bold|Integral Covariance Operator>: The integral
    operator <math|T> associated with <math|J<rsub|0>>, when applied to
    <math|f>, is:

    <\equation>
      <around|(|T*f|)><around|(|x|)>=<big|int>J<rsub|0>*<around|(|x-y|)>*f<around|(|y|)>*d*y
    </equation>

    For functions <math|f,g\<in\>L<rsup|2>>, the operator <math|T> induces a
    symmetric bilinear form through the inner product:

    <\equation>
      <around|\<langle\>|T*f,g|\<rangle\>>=<big|int><around|(|T*f|)><around|(|x|)>*g<around|(|x|)>*d*x=<big|int><big|int>J<rsub|0>*<around|(|x-y|)>*f<around|(|y|)>*g<around|(|x|)>*d*x*d*y
    </equation>

    <item><with|font-series|bold|Orthogonal Polynomials and RKHS>: The
    specific sequence of orthogonal polynomials forms an orthonormal basis in
    the RKHS, allowing any function <math|f\<in\>L<rsup|2>> to be
    approximated by projections onto this basis. The symmetric bilinear form
    associated with <math|J<rsub|0>> and the integral operator <math|T>
    remains symmetric when expressed in this basis, reflecting the inner
    product structure of the RKHS.
  </enumerate>

  The key is understanding that both <math|J<rsub|0>> and <math|T> can be
  represented in symmetric bilinear form, with <math|J<rsub|0>> directly
  defining the covariance structure in the Gaussian process context. The
  RKHS, through its orthonormal basis of orthogonal polynomials, enables the
  decomposition and analysis of functions in <math|L<rsup|2>> with respect to
  <math|J<rsub|0>>.
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