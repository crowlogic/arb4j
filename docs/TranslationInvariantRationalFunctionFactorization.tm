<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <\theorem>
    For any rational function <math|f*<around|(|t-s|)>=<frac|P*<around|(|t-s|)>|Q*<around|(|t-s|)>>>,
    where <math|P> and <math|Q> are polynomials, there exist rational
    functions <math|g<around|(|t|)>> and <math|g<around|(|s|)>> such that
    <math|f*<around|(|t-s|)>=g<around|(|t|)>*g<around|(|s|)>>.
  </theorem>

  <\proof>
    Let

    <\equation>
      P*<around|(|t-s|)>=c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|t-s-\<alpha\><rsub|i>|)>
    </equation>

    \ and

    <\equation>
      Q*<around|(|t-s|)>=c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|t-s-\<beta\><rsub|j>|)>
    </equation>

    \ be the complete factorizations over <math|\<bbb-C\>>. Define:

    <\equation*>
      g<around|(|t|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>
    </equation*>

    Then:

    <\align*>
      <tformat|<table|<row|<cell|g<around|(|t|)>*g<around|(|s|)>>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>\<cdot\><frac|<big|prod><rsub|i=1><rsup|n><around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>*<around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>*<around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|<around|(|t-s|)>-\<alpha\><rsub|i>|)>|c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|<around|(|t-s|)>-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=f*<around|(|t-s|)>>>>>
    </align*>

    For complex roots, we pair each <math|\<alpha\><rsub|i>> or
    <math|\<beta\><rsub|j>> with its complex conjugate in the factorization
    of <math|g<around|(|t|)>>. This ensures that the product
    <math|<around|(|t-\<alpha\><rsub|i>|)>*<around|(|t-<wide|\<alpha\><rsub|i>|\<bar\>>|)>>
    results in a quadratic polynomial with real coefficients, making
    <math|g<around|(|t|)>> a real-valued function.
  </proof>
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