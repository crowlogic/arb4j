<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|bluish|framed-theorems>>

<\body>
  <doc-data|<doc-title|Convergence In Reproducing Kernel Hilbert
  Spaces>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>crow@outsider.trading\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <with|font-series|bold|Pointwise Convergence:><next-line>In an RKHS, a
  sequence of functions <math|f<rsub|n>> converges pointwise to a function
  <math|f> if, for each <math|x> in the domain and for every
  <math|\<epsilon\>\<gtr\>0>, there exists an <math|N> such that for all
  <math|n\<geq\>N>, <math|<around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<less\>\<epsilon\>>.
  The RKHS's reproducing kernel guarantees that the evaluation at each point
  is a continuous linear functional, thus ensuring pointwise convergence.

  <with|font-series|bold|Mean-Square Convergence:><next-line>A sequence
  <math|f<rsub|n>> in an RKHS converges in mean-square to <math|f> if
  <math|<big|int><around|\||f<rsub|n>-f|\|><rsup|2>\<to\>0> as
  <math|n\<to\>\<infty\>>. This is a precise measure that does not imply
  pointwise convergence.

  <with|font-series|bold|Absolute Convergence:><next-line>While absolute
  convergence typically relates to series, if we consider a sequence of
  functions <math|f<rsub|n>> in an RKHS that are also integrable, the
  sequence converges absolutely to <math|f> if
  <math|<big|int><around|\||f<rsub|n>-f|\|>\<to\>0> as
  <math|n\<to\>\<infty\>>.

  <with|font-series|bold|Uniform Convergence:><next-line>A sequence
  <math|f<rsub|n>> in an RKHS converges uniformly to <math|f> if, for every
  <math|\<epsilon\>\<gtr\>0>, there exists an <math|N> such that for all
  <math|n\<geq\>N> and for all <math|x> in the domain,
  <math|<around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<less\>\<epsilon\>>.
  Uniform convergence implies pointwise convergence and is a sufficient
  condition for the convergence of integrals and the preservation of
  continuity.

  <with|font-series|bold|Conditions for Uniform Convergence in an RKHS:>

  <\enumerate>
    \;

    <item><with|font-series|bold|Compact Operators:> If the evaluation
    functionals are compact operators, meaning that for any bounded sequence
    <math|f<rsub|n>> in the RKHS, the image sequence
    <math|T<rsub|x><around|(|f<rsub|n>|)>> has a convergent subsequence in
    the space of continuous functions, then the original sequence converges
    uniformly to <math|f>.

    <item><with|font-series|bold|Arzelà-Ascoli Theorem:> A sequence
    <math|f<rsub|n>> in an RKHS is uniformly convergent if it is pointwise
    bounded and equicontinuous, which means for every
    <math|\<epsilon\>\<gtr\>0>, there exists a <math|\<delta\>\<gtr\>0> such
    that for all <math|x,y> in the domain with
    <math|<around|\||x-y|\|>\<less\>\<delta\>>,
    <math|<around|\||f<rsub|n><around|(|x|)>-f<rsub|n><around|(|y|)>|\|>\<less\>\<epsilon\>>
    for all <math|n>.

    <item><with|font-series|bold|Montel's Theorem:> In an RKHS of holomorphic
    functions, every bounded sequence <math|f<rsub|n>>, where boundedness
    means there exists a <math|M\<gtr\>0> such that
    <math|<around|\<\|\|\>|f<rsub|n>|\<\|\|\>><rsub|R*K*H*S>\<less\>M> for
    all <math|n>, contains a subsequence that converges uniformly on every
    compact subset of the domain.

    <item><with|font-series|bold|Kernel Properties:> The kernel must produce
    functions that are both bounded and uniformly continuous. A kernel
    <math|K> allows for uniform convergence if, for every
    <math|\<epsilon\>\<gtr\>0>, there exists a <math|\<delta\>\<gtr\>0> such
    that for all <math|x,y> in the domain with
    <math|<around|\||x-y|\|>\<less\>\<delta\>>,
    <math|\|K*<around|(|x,\<cdummy\>|)>-K(y,\<cdummy\><around|)||\|><rsub|R*K*H*S>\<less\>\<epsilon\>>.

    <item><with|font-series|bold|Boundedness of the Sequence:> If a sequence
    <math|f<rsub|n>> is uniformly bounded in the RKHS norm, i.e., there
    exists a <math|M\<gtr\>0> such that <math|<around|\<\|\|\>|f<rsub|n>|\<\|\|\>><rsub|R*K*H*S>\<less\>M>
    for all <math|n>, and it converges pointwise to <math|f>, then it
    converges uniformly to <math|f>.
  </enumerate>

  It is important to note that these conditions are sufficient, but not
  necessary for uniform convergence. There may be sequences of functions in
  an RKHS that converge uniformly without satisfying all these conditions.
  Nonetheless, these conditions are widely used in practice to verify uniform
  convergence.

  Uniform convergence is a desirable property for sequences of functions in
  an RKHS because it implies pointwise convergence and ensures the
  convergence of integrals and the preservation of continuity.
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