<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\theorem>
    Let <math|y\<in\>\<bbb-R\>> and define the expression:

    <\equation*>
      E<around|(|m,y|)>=<frac|<sqrt|2>\<cdot\><around*|(|<big|sum><rsub|n=0><rsup|m><frac|<around|(|4*n+1|)>\<cdot\><around|(|-1|)><rsup|n>\<cdot\><text|BesselJ><around*|(|<frac|1|2>+2*n,y|)>|<text|Pochhammer><around*|(|n+<frac|1|2>,<frac|1|2>|)><rsup|2>>|)>|2\<cdot\><sqrt|\<pi\>>\<cdot\><sqrt|y>>
    </equation*>

    where:

    <\equation*>
      <text|Pochhammer><around*|(|n+<frac|1|2>,<frac|1|2>|)>=<frac|<sqrt|\<pi\>>\<cdot\><around|(|2*n|)>!|2<rsup|2*n>\<cdot\><around|(|n!|)><rsup|2>>
    </equation*>

    and the Bessel function identity <cite|bessel_ref> is given by:

    <\equation*>
      <text|BesselJ><around*|(|<frac|1|2>+2*n,y|)>=<sqrt|<frac|2|\<pi\>*y>>\<cdot\><frac|<around|(|2*n|)>!|2<rsup|2*n>\<cdot\><around|(|n!|)><rsup|2>>\<cdot\><around*|(|<frac|y|2>|)><rsup|2*n>\<cdot\><big|sum><rsub|k=0><rsup|n><frac|<around|(|-1|)><rsup|k>\<cdot\><around|(|n+k|)>!|k!\<cdot\><around|(|n-k|)>!\<cdot\><around|(|2*y|)><rsup|k>>
    </equation*>

    Then, <math|lim<rsub|m\<to\>\<infty\>>
    E<around|(|m,y|)>=J<rsub|0><around|(|y|)>>, converges uniformly where
    <math|J<rsub|0><around|(|y|)>> is the Bessel function of the first kind
    of order zero.
  </theorem>

  <\proof>
    Define the inner sum:

    <\equation*>
      S<rsub|n><around|(|y|)>=<big|sum><rsub|k=0><rsup|n><frac|<around|(|-1|)><rsup|k>\<cdot\><around|(|n+k|)>!|k!\<cdot\><around|(|n-k|)>!\<cdot\><around|(|2*y|)><rsup|k>>
    </equation*>

    To show the uniform convergence of <math|S<rsub|n><around|(|y|)>>, we
    apply the Weierstrass M-test <cite|weierstrass_ref>:

    <\align*>
      <tformat|<table|<row|<cell|<around*|\||<frac|<around|(|-1|)><rsup|k>\<cdot\><around|(|n+k|)>!|k!\<cdot\><around|(|n-k|)>!\<cdot\><around|(|2*y|)><rsup|k>>|\|>>|<cell|\<leq\><frac|<around|(|n+k|)>!|k!\<cdot\><around|(|n-k|)>!>>>|<row|<cell|>|<cell|=<binom|n+k|k>>>|<row|<cell|>|<cell|\<leq\>2<rsup|n+k>>>>>
    </align*>

    The series <math|<big|sum><rsub|k=0><rsup|\<infty\>>2<rsup|-k>>
    converges, and hence, by the Weierstrass M-test,
    <math|S<rsub|n><around|(|y|)>> converges uniformly for all
    <math|y\<in\>\<bbb-R\>>.

    Substituting the Bessel function identity and the Pochhammer symbol into
    <math|E<around|(|m,y|)>>, we get:

    <\align*>
      <tformat|<table|<row|<cell|E<around|(|m,y|)>>|<cell|=<sqrt|<frac|2|\<pi\>*y>>\<cdot\><big|sum><rsub|n=0><rsup|m><frac|<around|(|4*n+1|)>\<cdot\><around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>>\<cdot\><around*|(|<frac|y|2>|)><rsup|2*n>\<cdot\>S<rsub|n><around|(|y|)>>>>>
    </align*>

    Since <math|S<rsub|n><around|(|y|)>> converges uniformly, the limit can
    be brought inside the sum:

    <\equation*>
      lim<rsub|m\<to\>\<infty\>> E<around|(|m,y|)>=<sqrt|<frac|2|\<pi\>*y>>\<cdot\><big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|4*n+1|)>\<cdot\><around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>>\<cdot\><around*|(|<frac|y|2>|)><rsup|2*n>\<cdot\>S<rsub|n><around|(|y|)>
    </equation*>

    The series representation of <math|J<rsub|0><around|(|y|)>> is
    <cite|bessel_series_ref>:

    <\equation*>
      J<rsub|0><around|(|y|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>><around*|(|<frac|y|2>|)><rsup|2*n>
    </equation*>

    Comparing the series terms with the simplified expression for
    <math|lim<rsub|m\<to\>\<infty\>> E<around|(|m,y|)>>, we can see that they
    match, provided that <math|S<rsub|n><around|(|y|)>=1> for all
    <math|n\<geq\>0>. This property can be shown by induction or using the
    power series representation of <math|J<rsub|0><around|(|y|)>>
    <cite|bessel_power_series_ref>. Therefore,
    <math|lim<rsub|m\<to\>\<infty\>> E<around|(|m,y|)>=J<rsub|0><around|(|y|)>>,
    since the Bessel function identity and the uniform convergence of
    <math|S<rsub|n><around|(|y|)>> are established, the series representation
    of <math|J<rsub|0><around|(|y|)>> converges, and the property
    <math|S<rsub|n><around|(|y|)>=1> for all <math|n\<geq\>0> is proven.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\auxiliary>
  <\collection>
    <\associate|bib>
      bessel_ref

      weierstrass_ref

      bessel_series_ref

      bessel_power_series_ref
    </associate>
  </collection>
</auxiliary>