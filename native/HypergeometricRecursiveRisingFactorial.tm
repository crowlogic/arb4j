<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  When substituting the rising factorial (Pochhammer Rising Factorials) into
  the recursive form of the hypergeometric function, certain simplifications
  are possible. The general form of a hypergeometric function is given by:

  <\equation>
    <rsub|p>F<rsub|q><around|(|a<rsub|1>,a<rsub|2>,\<ldots\>,a<rsub|p>;b<rsub|1>,b<rsub|2>,\<ldots\>,b<rsub|q>;z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|a<rsub|1>|)><rsub|n><around|(|a<rsub|2>|)><rsub|n>*\<ldots\><around|(|a<rsub|p>|)><rsub|n>|<around|(|b<rsub|1>|)><rsub|n><around|(|b<rsub|2>|)><rsub|n>*\<ldots\><around|(|b<rsub|q>|)><rsub|n>>*<frac|z<rsup|n>|n!>
  </equation>

  where <math|<around|(|x|)><rsub|n>> represents the rising factorial. When
  using the recursive definition of the rising factorial, you can see that
  each term in the series depends on the previous term. Specifically:

  <\equation>
    <around|(|x|)><rsub|n>=<around|(|x|)><rsub|n-1>\<cdot\><around|(|x+n-1|)>
  </equation>

  This means that for each of the <math|a<rsub|i>> and <math|b<rsub|i>> in
  the hypergeometric function, you can use the recursive relationship of the
  rising factorial to simplify the computation of each term in the series.

  For example, if you're computing the <math|n>-th term in the hypergeometric
  series, and you already have the <math|<around|(|n-1|)>>-th term, you can
  use:

  <\align>
    <tformat|<table|<row|<cell|<around|(|a<rsub|i>|)><rsub|n>>|<cell|=<around|(|a<rsub|i>|)><rsub|n-1>\<cdot\><around|(|a<rsub|i>+n-1|)><eq-number>>>|<row|<cell|<around|(|b<rsub|i>|)><rsub|n>>|<cell|=<around|(|b<rsub|i>|)><rsub|n-1>\<cdot\><around|(|b<rsub|i>+n-1|)><eq-number>>>>>
  </align>

  This recursive approach can save computation time, as it avoids
  recalculating the entire product for each term. Instead, it builds upon the
  previously computed value. However, you must start with the base case of
  <math|<around|(|x|)><rsub|0>=1> for each of the <math|a<rsub|i>> and
  <math|b<rsub|i>> parameters.

  In practice, this means keeping track of the previous values for each
  coefficient in the series, update them recursively for each new term. This
  approach is particularly useful in computational implementations due to its
  effeciency.

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
    <associate|auto-1|<tuple|?|?|../../.TeXmacs/texts/scratch/no_name_22.tm>>
  </collection>
</references>