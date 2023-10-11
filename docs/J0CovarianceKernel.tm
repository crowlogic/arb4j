<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|The <math|\<pi\>J<rsub|0><around*|(|2\<pi\><around*|\||x-y|\|>|)>>
  Covariance Kernel>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <subsubsection|Covariance Kernel and Integral
  Operator><label|covariance-kernel-and-integral-operator><label|covariance-kernel-and-integral-operator>

  Given the covariance kernel:

  <\equation>
    K<around|(|x,y|)>=\<pi\>*J<rsub|0>*<around|(|2*\<pi\>*<around|\||x-y|\|>|)>
  </equation>

  the associated integral operator <math|A> acting on a function <math|f> is:

  <\equation>
    <around|(|A*f|)><around|(|x|)>=<big|int><rsub|\<Omega\>>\<pi\>*J<rsub|0>*<around|(|2*\<pi\>*<around|\||x-y|\|>|)>*f<around|(|y|)>*d*y
  </equation>

  <subsubsection|Polynomial Orthonormal Basis and Eigenvalue
  Problem><label|polynomial-orthonormal-basis-and-eigenvalue-problem><label|polynomial-orthonormal-basis-and-eigenvalue-problem>

  Assuming we have a polynomial orthonormal basis
  <math|<around|{|p<rsub|n><around|(|x|)>|}>> which is orthonormal with
  respect to the weight function <math|w<around|(|x|)>=1>, to determine if
  these polynomials are eigenfunctions of <math|A> and to find the
  corresponding eigenvalues, we must solve the following integral equation
  for each <math|n>:

  <\equation>
    <big|int><rsub|\<Omega\>>\<pi\>*J<rsub|0>*<around|(|2*\<pi\>*<around|\||x-y|\|>|)>*p<rsub|n><around|(|y|)>*d*y=\<lambda\><rsub|n>*p<rsub|n><around|(|x|)>
  </equation>

  If the polynomial <math|p<rsub|n><around|(|x|)>> satisfies the above
  equation for a scalar <math|\<lambda\><rsub|n>>, then
  <math|p<rsub|n><around|(|x|)>> is an eigenfunction of <math|A> with
  <math|\<lambda\><rsub|n>> as its corresponding eigenvalue.

  <subsubsection|Karhunen-Loève Expansion><label|karhunen-louxe8ve-expansion><label|karhunen-louxe8ve-expansion>

  Given the eigenfunctions <math|p<rsub|n><around|(|x|)>> and eigenvalues
  <math|\<lambda\><rsub|n>> of the operator <math|A>, the KL expansion of the
  GP <math|X<around|(|t|)>> is:

  <\equation>
    X<around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*p<rsub|n><around|(|t|)>
  </equation>

  where <math|Z<rsub|n>> are independent standard Gaussian random variables.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|covariance-kernel-and-integral-operator|<tuple|1|1>>
    <associate|karhunen-louxe8ve-expansion|<tuple|3|1>>
    <associate|polynomial-orthonormal-basis-and-eigenvalue-problem|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Covariance Kernel and Integral
      Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>Polynomial Orthonormal Basis
      and Eigenvalue Problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|3<space|2spc>Karhunen-Loève Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>