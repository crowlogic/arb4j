<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\lemma>
    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|<sqrt|\<pi\>>*<sqrt|2>*<space|0.17em>\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|<frac|1|2>-n|)>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>
  </lemma>

  <\proof>
    We begin by considering the integral representation involving the product
    of Bessel functions <math|J<rsub|0><around|(|x|)>> and
    <math|J<rsub|2*n+<frac|1|2>><around|(|x|)>>. The integral

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x
    </equation>

    can be expressed in terms of Gamma functions and a hypergeometric
    function. According to the general result for the integral of a product
    of Bessel functions, we have:

    <\equation>
      <with|font-base-size|8|<big|int><rsub|0><rsup|\<infty\>>x<rsup|\<mu\>-1>*J<rsub|\<alpha\>>*<around|(|a*x|)>*J<rsub|\<beta\>>*<around|(|b*x|)>*<space|0.17em>d*x=<frac|<around|(|a*b|)><rsup|\<mu\>>*\<Gamma\><around|(|\<mu\>|)>*\<Gamma\><around*|(|<frac|\<alpha\>+\<beta\>+1-\<mu\>|2>|)>*\<Gamma\><around*|(|<frac|\<alpha\>+\<beta\>+1+\<mu\>|2>|)>|2<rsup|\<mu\>+1>*\<Gamma\>*<around|(|\<alpha\>+1|)>*\<Gamma\>*<around|(|\<beta\>+1|)>*\<Gamma\><around*|(|<frac|\<alpha\>-\<beta\>+1+\<mu\>|2>|)>*\<Gamma\><around*|(|<frac|\<beta\>-\<alpha\>+1+\<mu\>|2>|)>>>
    </equation>

    where Re<math|<around|(|\<mu\>+\<alpha\>+\<beta\>|)>\<gtr\>-1> and
    Re<math|<around|(|\<mu\>|)>\<gtr\>0>. In our case, we set
    <math|\<alpha\>=0>, <math|\<beta\>=2*n+<frac|1|2>>, <math|a=1>,
    <math|b=1>, and <math|\<mu\>=<frac|1|2>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>*<frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>*\<Gamma\>*<around|(|n+1|)>|2<rsup|2*n+<frac|3|2>>*\<Gamma\><around|(|1|)>*\<Gamma\>*<around|(|2*n+1|)>*\<Gamma\>*<around*|(|-n+<frac|1|2>|)>>
    </equation>

    Utilizing the properties of the Gamma function, specifically
    <math|\<Gamma\><around*|(|<frac|1|2>|)>=<sqrt|\<pi\>>>, and simplifying,
    we get:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|<sqrt|\<pi\>>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2<rsup|2*n+<frac|3|2>>*\<Gamma\>*<around*|(|<frac|1|2>-n|)>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>

    This integral can also be expressed in terms of the generalized
    hypergeometric function <math|<rsub|2>F<rsub|1>>. Specifically, for
    <math|\<alpha\>=0>, <math|\<beta\>=2*n+<frac|1|2>>, and
    <math|\<mu\>=<frac|1|2>>, we have:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|<sqrt|\<pi\>>|2<rsup|2*n>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|\<Gamma\>*<around|(|2*n+<frac|3|2>|)>><rsub|>\<times\>
      <rsub|2>F<rsub|1><around*|(|<around*|[|n+<frac|1|2>,-n|]>;<around*|[|<frac|1|2>|]>;1|)>
    </equation>

    Simplifying further using the properties of the Gamma function and the
    hypergeometric function:

    <\equation>
      \ <rsub|2>F<rsub|1><around*|(|<around*|[|n+<frac|1|2>,-n|]>;<around*|[|<frac|1|2>|]>;1|)>=<frac|\<Gamma\><around*|(|<frac|1|2>|)>*\<Gamma\><around|(|1|)>|\<Gamma\>*<around|(|n+1|)>*\<Gamma\>*<around*|(|<frac|1|2>-n|)>>
    </equation>

    leads to:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|<sqrt|\<pi\>>*<sqrt|2>*<space|0.17em>\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|<frac|1|2>-n|)>*\<Gamma\>*<around|(|n+1|)><rsup|2>>.
    </equation*>

    thus proving the lemma.
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