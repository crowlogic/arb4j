<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Bessel function of the first kind of order zero>>

  There is a connection between the series expansion of the Bessel function
  and the creation of an inner product structure which defines a Hilbert
  space of orthogonal functions. Here's a more detailed explanation:

  The Bessel function of the first kind of order 0 can be represented by its
  Taylor series expansion:

  <\equation>
    J<rsub|0><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*n>
  </equation>

  Now, if you consider the space of functions spanned by the monomials
  <math|<around|{|1,x,x<rsup|2>,x<rsup|3>,\<ldots\>|}>>, and you define the
  inner product as

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|a><rsup|b>f<around|(|x|)>*g<around|(|x|)>*d*x
  </equation>

  Then the functions <math|<around|{|1,x,x<rsup|2>,x<rsup|3>,\<ldots\>|}>>
  are orthogonal with respect to this inner product, and you can create an
  orthonormal basis by applying the Gram-Schmidt process.

  The series expansion of the Bessel function can be seen as a special
  combination of these monomials, and so you can think of the Bessel function
  as living in this Hilbert space.

  The inner product structure allows you to describe properties like
  orthogonality and norm in this space, and you can relate the coefficients
  of the Taylor series to the projections of the Bessel function onto the
  various elements of the orthonormal basis.

  By working with the series expansion in this way, you are leveraging the
  structure of the Hilbert space to analyze and represent the Bessel
  function.

  <subsubsection|Hilbert Space of Functions><label|hilbert-space-of-functions><label|hilbert-space-of-functions>

  Consider the Hilbert space <math|H> of square-integrable functions on an
  interval <math|<around|[|a,b|]>>, with the inner product defined as:

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|a><rsup|b>f<around|(|x|)>*g<around|(|x|)>*d*x
  </equation>

  Bessel Function in Hilbert Space: The Bessel function
  <math|J<rsub|0><around|(|x|)>>, being a continuous and bounded function,
  belongs to this Hilbert space.

  Riesz Representation Theorem: Now, consider a bounded linear functional
  <math|f> on this Hilbert space. By the Riesz Representation Theorem, there
  exists a unique element <math|y\<in\>H> such that

  <\equation>
    f<around|(|x|)>=<around|\<langle\>|x,y|\<rangle\>>\<forall\>x\<in\>H
  </equation>

  Application to Bessel Function: In particular, you can apply this linear
  functional to the Bessel function itself:

  <\equation>
    f<around|(|J<rsub|0>|)>=<around|\<langle\>|J<rsub|0>,y|\<rangle\>>=<big|int><rsub|a><rsup|b>J<rsub|0><around|(|x|)>*y<around|(|x|)>*d*x
  </equation>

  This shows a direct application of the Riesz Representation Theorem to the
  Bessel function, connecting the Bessel function to a unique representing
  element in the Hilbert space with respect to any bounded linear functional.

  The Riesz Representation Theorem thus provides a powerful tool for
  understanding the action of linear functionals on functions like the Bessel
  function, translating the problem into one of geometry and analysis in a
  Hilbert space.

  <section|Sturm-Liovulle><label|sturm-liovulle><label|sturm-liovulle>

  The Bessel equation of order <math|n> is given by:

  <\equation>
    x<rsup|2>*y<rprime|''>+x*y<rprime|'>+<around|(|x<rsup|2>-n<rsup|2>|)>*y=0
  </equation>

  For the Bessel function of the first kind of order <math|n=0>, the
  corresponding equation is:

  <\equation>
    x<rsup|2>*y<rprime|''>+x*y<rprime|'>+x<rsup|2>*y=0
  </equation>

  The solution to this differential equation is the Bessel function of the
  first kind of order 0, denoted by <math|J<rsub|0><around|(|x|)>>.

  <subsubsection|The Bessel equation as a Sturm-Liouville Eigenvalue
  Problem><label|the-bessel-equation-as-a-sturm-liouville-eigenvalue-problem><label|the-bessel-equation-as-a-sturm-liouville-eigenvalue-problem>

  The Bessel equation can be written as a Sturm-Liouville problem:

  <\equation>
    <frac|d|d*x>*<around*|(|x*<frac|d*y|d*x>|)>+\<lambda\>*x*y=0
  </equation>

  with the boundary conditions that the solutions are finite at the origin,
  and the normalization condition:

  <\equation>
    <big|int><rsub|0><rsup|1>x*J<rsub|n><rsup|2><around|(|x|)>*<space|0.17em>d*x=<frac|1|2>
  </equation>

  The eigenvalues are determined by the zeros of the Bessel function, and the
  corresponding eigenfunctions are given by:

  <\equation>
    y<rsub|n><around|(|x|)>=J<rsub|n>*<around|(|\<alpha\><rsub|n>*x|)>
  </equation>

  where <math|\<alpha\><rsub|n>> are the positive zeros of the Bessel
  function.

  <subsubsection|Eigenvalues and Eigenfunctions><label|eigenvalues-and-eigenfunctions><label|eigenvalues-and-eigenfunctions>

  <\itemize>
    <item><with|font-series|bold|Eigenvalues>: The eigenvalues are given by
    <math|\<lambda\><rsub|n>=\<alpha\><rsub|n><rsup|2>> where
    <math|\<alpha\><rsub|n>> are the positive zeros of the Bessel function
    <math|J<rsub|0><around*|(|x|)>>.

    <item><with|font-series|bold|Eigenfunctions>: The eigenfunctions
    corresponding to these eigenvalues are
    <math|y<rsub|n><around|(|x|)>=J<rsub|0>*<around|(|\<alpha\><rsub|n>*x|)>>.
  </itemize>

  <subsubsection|Orthogonality><label|orthogonality><label|orthogonality>

  The eigenfunctions are orthogonal with respect to the weight function
  <math|x> on the interval <math|<around|[|0,1|]>>:

  <\equation>
    <big|int><rsub|0><rsup|1>x*J<rsub|0>*<around|(|\<alpha\><rsub|n>*x|)>*J<rsub|0>*<around|(|\<alpha\><rsub|m>*x|)>*d*x=0<text|\<forall\>>n\<neq\>m<space|1em>
  </equation>

  This orthogonal property and the known eigenfunctions and eigenvalues
  provide a complete description of the Hilbert space corresponding to the
  Bessel function of the first kind of order 0. By employing the series
  expansion and Sturm-Liouville theory, you can analyze and represent
  functions in terms of this orthonormal basis, leveraging the well-known
  properties of Bessel functions.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-2|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-3|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-4|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-5|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|eigenvalues-and-eigenfunctions|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|hilbert-space-of-functions|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|orthogonality|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|sturm-liovulle|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|the-bessel-equation-as-a-sturm-liouville-eigenvalue-problem|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Hilbert Space of Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Sturm-Liovulle>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|2tab>|1<space|2spc>The Bessel equation as a
      Sturm-Liouville Eigenvalue Problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|2<space|2spc>Eigenvalues and Eigenfunctions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|3<space|2spc>Orthogonality
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>