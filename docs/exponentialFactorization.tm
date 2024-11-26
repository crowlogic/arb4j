<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Infinite Sum Exponential Factorization>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Finite
    Exponential Equality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Series
    Convergence Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Exponential
    Function Continuity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Product
    Convergence Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  The exponential function, a fundamental concept in mathematics, possesses
  remarkable properties that extend from finite to infinite operations, as
  demonstrated by a lemma exploring the relationship between infinite sums
  and products involving exponentials.

  <section*|Finite Exponential Equality>

  The finite exponential equality forms the foundation for extending the
  exponential relationship to infinite sums and products. This fundamental
  property states that for any finite sequence of real or complex numbers
  <math|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|n>>, the following equality
  holds:

  <\equation>
    e<rsup|<around|(|x<rsub|1>+x<rsub|2>+\<ldots\>+x<rsub|n>|)>>=e<rsup|x<rsub|1>>\<cdot\>e<rsup|x<rsub|2>>\<cdot\>\<ldots\>\<cdot\>e<rsup|x<rsub|n>>
  </equation>

  This equality stems from the basic properties of exponents, specifically
  the law of exponents for multiplication, which states that
  <math|a<rsup|x>\<cdot\>a<rsup|y>=a<rsup|x+y>> for any base <math|a> and
  exponents <math|x> and <math|y> <cite|source1>. The exponential function,
  being defined as <math|e<rsup|x>> where <math|e> is Euler's number,
  inherits this property.

  The finite exponential equality is crucial in the proof of the infinite
  case because it serves as the starting point for induction. By applying
  this property to the partial sums and partial products, we can establish a
  sequence of equalities that hold for any finite <math|n>:

  <\equation>
    e<rsup|<around|(|x<rsub|1>+x<rsub|2>+\<ldots\>+x<rsub|n>|)>>=e<rsup|x<rsub|1>>\<cdot\>e<rsup|x<rsub|2>>\<cdot\>\<ldots\>\<cdot\>e<rsup|x<rsub|n>>
  </equation>

  As <math|n> increases, this equality continues to hold, providing a bridge
  between the finite and infinite cases <cite|source2>. The transition to the
  infinite case relies on taking the limit as <math|n> approaches infinity on
  both sides of this equation. The power series definition of the exponential
  function, which converges for all complex numbers, ensures that this finite
  equality holds regardless of the magnitude or sign of the <math|x<rsub|i>>
  terms <cite|source1|source3>.

  This universal convergence is what allows us to confidently extend the
  finite case to the infinite case, provided that the series
  <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> converges.
  Understanding this finite exponential equality is essential for grasping
  the more complex infinite case, as it illustrates the fundamental
  relationship between exponentials of sums and products of exponentials,
  which persists in the limit.

  <section*|Series Convergence Analysis>

  The convergence of the series <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>>
  is a crucial prerequisite for the validity of the exponential equality in
  the infinite case. This convergence ensures that the partial sums
  <math|S<rsub|n>=<big|sum><rsub|i=1><rsup|n>x<rsub|i>> approach a finite
  limit <math|S=<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> as <math|n>
  tends to infinity. The absolute convergence of the exponential function's
  power series for all complex numbers plays a significant role in this
  analysis <cite|source1|source2>.

  This property allows us to consider the exponential of each term
  <math|x<rsub|i>> individually, regardless of its magnitude or sign. As a
  result, we can confidently apply the exponential function to both sides of
  the equation:

  <\equation>
    <big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>=S\<Longrightarrow\>e<rsup|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>>=e<rsup|S>
  </equation>

  The convergence of the original series also implies that the terms
  <math|x<rsub|i>> must approach zero as <math|i> increases. This behavior is
  essential for the convergence of the infinite product
  <math|<big|prod><rsub|i=1><rsup|\<infty\>>e<rsup|x<rsub|i>>>, as it ensures
  that the factors <math|e<rsup|x<rsub|i>>> approach 1 for large <math|i>.

  Furthermore, the convergence of <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>>
  allows us to leverage the continuity of the exponential function
  <cite|source3>. As the partial sums <math|S<rsub|n>> converge to <math|S>,
  the continuity of <math|e<rsup|x>> guarantees that:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> e<rsup|S<rsub|n>>=e<rsup|lim<rsub|n\<to\>\<infty\>>
    S<rsub|n>>=e<rsup|S>
  </equation>

  This relationship is fundamental in bridging the gap between the finite and
  infinite cases of the exponential equality. It's worth noting that the
  convergence of <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> is a
  sufficient condition for the equality to hold, but it may not be necessary
  in all cases. Some divergent series, when exponentiated term by term, can
  still yield convergent products. However, for the purposes of this proof
  and its general applicability, we focus on convergent series to ensure the
  validity of the exponential equality in the broadest possible context.

  <section*|Exponential Function Continuity>

  The continuity of the exponential function is a fundamental property that
  plays a crucial role in extending the exponential equality from finite to
  infinite sums. This continuity is intimately tied to the function's
  definition as a power series with an infinite radius of convergence
  <cite|source1|source2>.

  The exponential function, defined as <math|e<rsup|x>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|x<rsup|n>|n!>>,
  converges absolutely for all complex numbers <math|x> <cite|source1>. This
  universal convergence ensures that the function is well-defined and
  continuous over its entire domain, including both real and complex numbers
  <cite|source2>.

  The continuity of the exponential function allows us to interchange limits
  and exponentials, a key step in proving the infinite exponential equality.
  In the context of real numbers, the continuity of the exponential function
  can be rigorously proven using <math|\<varepsilon\>>-<math|\<delta\>>
  arguments or through the properties of power series <cite|source3>. For any
  real number <math|a>, given any <math|\<varepsilon\>\<gtr\>0>, there exists
  a <math|\<delta\>\<gtr\>0> such that for all <math|x> satisfying
  <math|<around|\||x-a|\|>\<less\>\<delta\>>, we have
  <math|<around|\||e<rsup|x>-e<rsup|a>|\|>\<less\>\<varepsilon\>>.

  The continuity of the exponential function is particularly important when
  dealing with limits of sequences or series. In our proof of the infinite
  exponential equality, we rely on this continuity when we assert that:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> e<rsup|S<rsub|n>>=e<rsup|lim<rsub|n\<to\>\<infty\>>
    S<rsub|n>>=e<rsup|S>
  </equation>

  where <math|S<rsub|n>> are the partial sums of the series
  <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> and <math|S> is its
  limit. This step is valid precisely because of the continuity of the
  exponential function.

  Moreover, the exponential function's continuity extends to the complex
  plane, making it an entire function <cite|source2>. This property allows
  for the generalization of our results to complex-valued series, broadening
  the applicability of the infinite exponential equality.

  <section*|Product Convergence Proof>

  The convergence of the infinite product
  <math|<big|prod><rsub|i=1><rsup|\<infty\>>e<rsup|x<rsub|i>>> is a crucial
  component in establishing the exponential equality for infinite sums. This
  convergence is intricately linked to the convergence of the series
  <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> and the properties of
  the exponential function.

  To prove the convergence of the infinite product, we first consider the
  partial products:

  <\equation>
    P<rsub|n>=<big|prod><rsub|i=1><rsup|n>e<rsup|x<rsub|i>>=e<rsup|x<rsub|1>>\<cdot\>e<rsup|x<rsub|2>>\<cdot\>\<ldots\>\<cdot\>e<rsup|x<rsub|n>>
  </equation>

  Using the finite exponential equality, we can rewrite this as:

  <\equation>
    P<rsub|n>=e<rsup|<around|(|x<rsub|1>+x<rsub|2>+\<ldots\>+x<rsub|n>|)>>=e<rsup|S<rsub|n>>
  </equation>

  Given that the series <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>>
  converges to some limit <math|S>, we know that the sequence of partial sums
  <math|<around|{|S<rsub|n>|}>> converges to <math|S>. By the continuity of
  the exponential function, which has an infinite radius of convergence
  <cite|source1>, we can conclude that:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> P<rsub|n>=lim<rsub|n\<to\>\<infty\>>
    e<rsup|S<rsub|n>>=e<rsup|lim<rsub|n\<to\>\<infty\>> S<rsub|n>>=e<rsup|S>
  </equation>

  This limit exists and is finite, proving that the infinite product
  <math|<big|prod><rsub|i=1><rsup|\<infty\>>e<rsup|x<rsub|i>>> converges to
  <math|e<rsup|S>>. It's important to note that the convergence of the
  infinite product is conditional on the convergence of the original series.
  If <math|<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>> diverges, the
  infinite product may not converge in the traditional sense.

  The convergence of the infinite product can also be understood through the
  lens of logarithms. Taking the natural logarithm of both sides of the
  equality:

  <\equation>
    ln <around*|(|<big|prod><rsub|i=1><rsup|\<infty\>>e<rsup|x<rsub|i>>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>ln
    <around|(|e<rsup|x<rsub|i>>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>x<rsub|i>
  </equation>

  This relationship further illustrates the connection between the
  convergence of the series and the convergence of the product
  <cite|source2>. The proof of product convergence relies heavily on the
  unique properties of the exponential function, particularly its continuity
  and its behavior under exponentiation. These properties allow us to bridge
  the gap between finite and infinite cases, providing a robust foundation
  for the exponential equality in the realm of infinite sums and products.

  <\thebibliography|3>
    <bibitem|source1><slink|https://personalpages.manchester.ac.uk/staff/donald.robertson/teaching/22-23/29142/exponential.html>

    <bibitem|source2><slink|https://en.wikipedia.org/wiki/Exponential_function>

    <bibitem|source3><slink|https://proofwiki.org/wiki/Exponential_Function_is_Continuous/Real_Numbers>
  </thebibliography>
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
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-source1|<tuple|source1|4|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-source2|<tuple|source2|4|../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-source3|<tuple|source3|4|../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      source1

      source2

      source1

      source3

      source1

      source2

      source3

      source1

      source2

      source1

      source2

      source3

      source2

      source1

      source2
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Finite
      Exponential Equality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Series
      Convergence Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Exponential
      Function Continuity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Product
      Convergence Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>