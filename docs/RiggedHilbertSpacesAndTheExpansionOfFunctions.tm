<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  I apologize for the oversight. Let me include the formula for the
  eigenfunctions <math|\<psi\><rsub|n><around|(|x|)>> in terms of the Lommel
  polynomials with <math|\<nu\>=1/2> and <math|\<nu\>=3/2>.

  <section|Introduction>

  Rigged Hilbert spaces, also known as equipped Hilbert spaces or Gelfand
  triples, provide a framework that allows for the expansion of functions in
  terms of polynomials forming a complete basis, even when the basis
  functions are orthogonal with respect to a measure consisting of Dirac
  delta functions rather than a continuous measure. This is achieved by
  extending the notion of orthogonality and inner products to distributions,
  which are generalized functions. This paper explores the theory of rigged
  Hilbert spaces and demonstrates their application to the study of
  translation-invariant integral covariance operators and their
  eigenfunctions.

  <section|Rigged Hilbert Spaces>

  In a rigged Hilbert space, there is a triple of spaces:
  <math|\<Phi\>\<subset\>H\<subset\>\<Phi\><rprime|'>>, where:

  <\enumerate>
    <item><math|\<Phi\>> is a dense subspace of the Hilbert space <math|H>,
    consisting of "test functions" that are smooth and rapidly decreasing.

    <item><math|H> is a Hilbert space with an inner product
    <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>.

    <item><math|\<Phi\><rprime|'>> is the dual space of <math|\<Phi\>>,
    consisting of continuous linear functionals on <math|\<Phi\>>, which
    includes distributions.
  </enumerate>

  The key idea is that the polynomials forming the basis are not required to
  be orthogonal with respect to a continuous measure in the Hilbert space
  <math|H>. Instead, they can be orthogonal with respect to a measure
  consisting of Dirac delta functions, which are distributions in
  <math|\<Phi\><rprime|'>>.

  The orthogonality of the polynomial basis
  <math|<around|{|p<rsub|n><around|(|x|)>|}>> with respect to Dirac delta
  functions can be expressed as:

  <\equation>
    <around|\<langle\>|p<rsub|m><around|(|x|)>,\<delta\>*<around|(|x-x<rsub|n>|)>|\<rangle\>>=p<rsub|m><around|(|x<rsub|n>|)>*\<delta\><rsub|m*n>
  </equation>

  where <math|\<delta\><rsub|m*n>> is the Kronecker delta (1 if <math|m=n>,
  and 0 otherwise), and <math|x<rsub|n>> are the points where the Dirac delta
  functions are located.

  <section|Extended Inner Product>

  In a rigged Hilbert space, the inner product is extended to accommodate
  distributions, which are elements of the dual space
  <math|\<Phi\><rprime|'>>. This extended inner product allows for the
  orthogonality of basis functions with respect to a measure consisting of
  Dirac delta functions.

  The extended inner product is denoted as
  <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>. For
  <math|f\<in\>\<Phi\>> and <math|g\<in\>\<Phi\><rprime|'>>, the extended
  inner product is defined as:

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=g<around|(|f|)>
  </equation>

  where <math|g<around|(|f|)>> represents the action of the distribution
  <math|g> on the test function <math|f>.

  In the case of a Dirac delta function <math|\<delta\>*<around|(|x-x<rsub|n>|)>>,
  which is a distribution in <math|\<Phi\><rprime|'>>, the extended inner
  product with a test function <math|f\<in\>\<Phi\>> is given by:

  <\equation>
    <around|\<langle\>|f<around|(|x|)>,\<delta\>*<around|(|x-x<rsub|n>|)>|\<rangle\>>=\<delta\>*<around|(|x-x<rsub|n>|)><around|(|f|)>=f<around|(|x<rsub|n>|)>
  </equation>

  This follows from the defining property of the Dirac delta function:

  <\equation>
    <big|int>f<around|(|x|)>*\<delta\>*<around|(|x-x<rsub|n>|)>*<space|0.17em>d*x=f<around|(|x<rsub|n>|)>
  </equation>

  The extended inner product allows for the expression of the orthogonality
  of the polynomial basis <math|<around|{|p<rsub|n><around|(|x|)>|}>> with
  respect to Dirac delta functions as:

  <\equation>
    <around|\<langle\>|p<rsub|m><around|(|x|)>,\<delta\>*<around|(|x-x<rsub|n>|)>|\<rangle\>>=p<rsub|m><around|(|x<rsub|n>|)>*\<delta\><rsub|m*n>
  </equation>

  where <math|\<delta\><rsub|m*n>> is the Kronecker delta.

  <section|Function Expansions>

  The rigged Hilbert space framework allows for the expansion of functions
  <math|f<around|(|x|)>> in terms of the polynomial basis:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|n>c<rsub|n>*p<rsub|n><around|(|x|)>
  </equation>

  where the coefficients <math|c<rsub|n>> are given by:

  <\equation>
    c<rsub|n>=<around|\<langle\>|f<around|(|x|)>,\<delta\>*<around|(|x-x<rsub|n>|)>|\<rangle\>>=f<around|(|x<rsub|n>|)>
  </equation>

  This expansion is possible because the dual space <math|\<Phi\><rprime|'>>
  includes distributions, and the extended inner product can be used to
  compute the coefficients using the action of the Dirac delta functions on
  the function <math|f<around|(|x|)>>.

  <section|Application to a Translation-Invariant Integral Covariance
  Operator>

  Consider the integral covariance operator <math|T> with a
  translation-invariant kernel <math|K*<around|(|x-y|)>=J<rsub|0>*<around|(|x-y|)>>,
  where <math|J<rsub|0>> is the Bessel function of the first kind of order 0:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*f<around|(|x|)>*<space|0.17em>d*x
  </equation>

  The goal is to study the eigenfunctions of this operator, which are
  orthogonal to the null space functions <math|<around|{|y<rsub|n><around|(|h|)>|}>>
  satisfying:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|h|)>*y<rsub|n><around|(|h|)>*<space|0.17em>d*h=0
  </equation>

  The construction of the rigged Hilbert space
  <math|\<Phi\>\<subset\>H\<subset\>\<Phi\><rprime|'>> proceeds as follows:

  <\enumerate>
    <item><math|\<Phi\>> is chosen as a dense subspace of <math|H> that
    includes the null space functions <math|<around|{|y<rsub|n><around|(|h|)>|}>>
    and is complete with respect to a locally convex topology defined by a
    family of seminorms. For example, <math|\<Phi\>> can be chosen to be the
    space of rapidly decreasing functions, denoted as
    <math|\<cal-S\><around|(|\<bbb-R\>|)>>, which is a common choice in the
    theory of distributions.

    <item>The Hilbert space <math|H> is chosen as the space of
    square-integrable functions on the interval
    <math|<around|[|0,\<infty\>|)>>, denoted as
    <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>|)>>. The inner product
    on <math|H> is defined as:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|0><rsup|\<infty\>>f<around|(|x|)><wide|g<around|(|x|)>|\<bar\>><space|0.17em>d*x
    </equation>

    <item>The dual space <math|\<Phi\><rprime|'>> is the space of continuous
    linear functionals on <math|\<Phi\>>. In this case,
    <math|\<Phi\><rprime|'>> is the space of tempered distributions, denoted
    as <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>.
  </enumerate>

  Now, consider the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>>
  of the integral covariance operator <math|T>. These eigenfunctions satisfy:

  <\equation>
    <around|(|T*\<psi\><rsub|n>|)><around|(|x|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)>
  </equation>

  where <math|\<lambda\><rsub|n>> are the corresponding eigenvalues.

  The eigenfunctions <math|\<psi\><rsub|n><around|(|x|)>> can be expressed in
  terms of the Lommel polynomials <math|R<rsub|n,\<nu\>><around|(|x|)>> with
  <math|\<nu\>=1/2> and <math|\<nu\>=3/2> as follows:

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|x|)>>|<cell|=J<rsub|n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|2|\<pi\>*x>>*<around*|(|R<rsub|n,<frac|1|2>><around|(|x|)>*cos
    <around*|(|x-<frac|n*\<pi\>|2>|)>-R<rsub|n-1,<frac|3|2>><around|(|x|)>*sin
    <around*|(|x-<frac|n*\<pi\>|2>|)>|)>>>>>>
  </equation>

  The Lommel polynomials <math|R<rsub|n,\<nu\>><around|(|x|)>> satisfy a
  three-term recurrence relation:

  <\equation>
    R<rsub|n+1,\<nu\>><around|(|x|)>=<around|(|2*n+1-2*\<nu\>|)>*R<rsub|n,\<nu\>><around|(|x|)>-x<rsup|2>*R<rsub|n-1,\<nu\>><around|(|x|)>
  </equation>

  with initial conditions:

  <\equation>
    R<rsub|0,\<nu\>><around|(|x|)>=1,<space|1em>R<rsub|1,\<nu\>><around|(|x|)>=1-2*\<nu\>
  </equation>

  Therefore, the eigenfunctions <math|\<psi\><rsub|n><around|(|x|)>> of the
  integral covariance operator <math|T> can be expressed in terms of the
  Lommel polynomials with <math|\<nu\>=1/2> and <math|\<nu\>=3/2>, which
  satisfy a three-term recurrence relation.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-5|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Rigged
      Hilbert Spaces> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Extended
      Inner Product> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Function
      Expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Application
      to a Translation-Invariant Integral Covariance Operator>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>