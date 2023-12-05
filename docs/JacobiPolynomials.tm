<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <em|>

  <doc-data|<doc-title|A More Concise Form of the Jacobi Polynomial
  Recursion>|<doc-author|<author-data|<author-name|stephen Crowley
  \<less\>crow@outsider.trading\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The traditional definition of Jacobi polynomials uses the following
  recurrence relation:

  <\equation>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<around|(|A<rsub|n-1>*x+B<rsub|n-1>|)>*P<rsub|n-1><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>-C<rsub|n-1>*P<rsub|n-2><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>
  </equation>

  where

  <\equation>
    A<rsub|n>=<frac|<around|(|2*n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>+2|)>|2*<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>>
  </equation>

  <\equation>
    B<rsub|n>=<frac|<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>*<around|(|2*n+\<alpha\>+\<beta\>+1|)>|2*<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>>
  </equation>

  <\equation>
    C<rsub|n>=<frac|<around|(|n+\<alpha\>|)>*<around|(|n+\<beta\>|)>*<around|(|2*n+\<alpha\>+\<beta\>+2|)>|<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>>
  </equation>

  A more concise alternative definition of the Jacobi polynomials that is
  better suited for computation is given by

  <\equation>
    P<rsub|n><around|(|x|)>=a<rsub|n>*x*P<rsub|n-1><around|(|x|)>+b<rsub|n>*P<rsub|n-2><around|(|x|)>
  </equation>

  where

  <\equation>
    a<rsub|n>=<frac|b<rsub|n>|c<rsub|n>>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>
  </equation>

  <\equation>
    b<rsub|n>=<frac|c<rsub|n>-1|c<rsub|n-1>>
  </equation>

  <\equation>
    c<rsub|n>=2*n+\<alpha\>+\<beta\>
  </equation>

  It can be shown that these two recurrence relations are equivalent by
  substituting the expressions for <math|a<rsub|n>,b<rsub|n>,c<rsub|n>> into
  the alternative definition and simplifying. Starting with the alternative
  definition:

  <\equation>
    P<rsub|n><around|(|x|)>=a<rsub|n>*x*P<rsub|n-1><around|(|x|)>+b<rsub|n>*P<rsub|n-2><around|(|x|)>
  </equation>

  Substituting the expressions for <math|a<rsub|n>,b<rsub|n>,c<rsub|n>>:

  <\equation>
    P<rsub|n><around|(|x|)>=<around*|(|<frac|b<rsub|n>|c<rsub|n>>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>|)>*x*P<rsub|n-1><around|(|x|)>+<around*|(|<frac|c<rsub|n>-1|c<rsub|n-1>>|)>*P<rsub|n-2><around|(|x|)>
  </equation>

  <\equation>
    P<rsub|n><around|(|x|)>=<around*|(|<frac|<around|(|c<rsub|n>-1|)>|c<rsub|n-1>>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>|)>*x*P<rsub|n-1><around|(|x|)>+<around*|(|<frac|c<rsub|n>-1|c<rsub|n-1>>|)>*P<rsub|n-2><around|(|x|)>
  </equation>

  Factoring out <math|<around|(|c<rsub|n>-1|)>/c<rsub|n-1>>:

  <\equation>
    P<rsub|n><around|(|x|)>=<frac|<around|(|c<rsub|n>-1|)>|c<rsub|n-1>>*<around*|(|<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>*x*P<rsub|n-1><around|(|x|)>+P<rsub|n-2><around|(|x|)>|)>
  </equation>

  Substituting <math|c<rsub|n>=2*n+\<alpha\>+\<beta\>>:

  <\equation>
    P<rsub|n><around|(|x|)>=<frac|<around|(|2*n+\<alpha\>+\<beta\>-1|)>|2*n+\<alpha\>+\<beta\>-1>*<around*|(|<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>*x*P<rsub|n-1><around|(|x|)>+P<rsub|n-2><around|(|x|)>|)>
  </equation>

  Cancelling common factors:

  <\equation>
    P<rsub|n><around|(|x|)>=<around|(|A<rsub|n-1>*x+B<rsub|n-1>|)>*P<rsub|n-1><around|(|x|)>-C<rsub|n-1>*P<rsub|n-2><around|(|x|)>
  </equation>

  Therefore, the alternative definition of Jacobi polynomials using the
  parameters <math|c<rsub|n>,a<rsub|n>,b<rsub|n>> is equivalent to the
  standard definition in terms of <math|A<rsub|n>,B<rsub|n>,C<rsub|n>>.
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