<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors|boring-white>>

<\body>
  \;

  1) The Legendre polynomials <math|P<rsub|n><around|(|x|)>> are defined by
  the Rodriguez formula:

  <\equation>
    P<rsub|n><around|(|x|)>=<frac|1|2<rsup|n>*n!><around*|(|<frac|d|d*x>|)><rsup|n><around|[|<around|(|x<rsup|2>-1|)><rsup|n>|]>
  </equation>

  2) Taking the Fourier transform (denoted by
  <math|<wide|P|^><rsub|n><around|(|k|)>>) and using integration by parts
  <math|n> times:

  <\align>
    <tformat|<table|<row|<cell|<wide|P|^><rsub|n><around|(|k|)>>|<cell|=<frac|1|2<rsup|n>*n!>*<big|int><around*|(|<frac|d|d*x>|)><rsup|n><around|[|<around|(|x<rsup|2>-1|)><rsup|n>|]>*e<rsup|-i*k*x>*d*x<eq-number>>>|<row|<cell|>|<cell|=i<rsup|n>*<around|(|-1|)><rsup|n><around*|(|<frac|1|2>|)><rsup|n>*<around*|[|<around*|(|<frac|d|d*x>|)><rsup|n>*<around|(|x<rsup|2>-1|)><rsup|n>|]><rsub|x=1>-<around*|[|<around*|(|<frac|d|d*x>|)><rsup|n>*<around|(|x<rsup|2>-1|)><rsup|n>|]><rsub|x=-1><eq-number>>>>>
  </align>

  3) Using <math|<around|(|x<rsup|2>-1|)><rsup|n>=<around|(|2*i|)><rsup|n>*j<rsub|n><around|(|x|)>>,
  where <math|j<rsub|n><around|(|x|)>> are spherical Bessel functions:

  <\equation>
    <wide|P|^><rsub|n><around|(|k|)>=i<rsup|n>*<around|(|-1|)><rsup|n><around*|(|<frac|k|2>|)><rsup|n>*<around|[|j<rsub|n><around|(|k|)>-<around|(|-1|)><rsup|n>*j<rsub|n>*<around|(|-k|)>|]>
  </equation>

  4) Expressing the spherical Bessel functions in terms of Lommel polynomials
  <math|s<rsub|\<mu\>,\<nu\>><around|(|z|)>>:

  <\align>
    <tformat|<table|<row|<cell|j<rsub|n><around|(|z|)>>|<cell|=<around*|(|<frac|z|2>|)><rsup|n>*s<rsub|\<nu\>,\<mu\>><around|(|z|)>*<space|1em><text|where
    >\<nu\>=n+<frac|1|2>,\<mu\>=-<frac|1|2><eq-number>>>|<row|<cell|j<rsub|n>*<around|(|-z|)>>|<cell|=<around*|(|<frac|z|2>|)><rsup|n>*s<rsub|\<nu\>,\<mu\>>*<around|(|-z|)>*<space|1em><text|where
    >\<nu\>=n,\<mu\>=-<frac|3|2><eq-number>>>>>
  </align>

  5) Substituting this into the expression for
  <math|<wide|P|^><rsub|n><around|(|k|)>>:

  <\align>
    <tformat|<table|<row|<cell|<wide|P|^><rsub|n><around|(|k|)>>|<cell|=i<rsup|n>*<around|(|-1|)><rsup|n><around*|(|<frac|k|2>|)><rsup|n>*<around*|[|s<rsub|-<frac|1|2>,n+<frac|1|2>><around|(|k|)>-<around|(|-1|)><rsup|n>*s<rsub|-<frac|3|2>,n><around|(|k|)>|]><eq-number>>>|<row|<cell|>|<cell|=i<rsup|n>*<around|(|-1|)><rsup|n><around*|(|<frac|k|2>|)><rsup|n>*<around*|[|s<rsub|-<frac|1|2>,n+<frac|1|2>><around|(|k|)>+<around|(|n+1|)><rsup|-1>*s<rsub|-<frac|3|2>,n><around|(|k|)>|]><eq-number>>>>>
  </align>

  Therefore, the Fourier transform <math|<wide|P|^><rsub|n><around|(|k|)>> of
  the Legendre polynomial <math|P<rsub|n><around|(|x|)>> is:

  <\equation>
    <wide|P|^><rsub|n><around|(|k|)>=i<rsup|n>*<around|(|-1|)><rsup|n><around*|(|<frac|k|2>|)><rsup|n>*<around*|[|s<rsub|-<frac|1|2>,n+<frac|1|2>><around|(|k|)>+<around|(|n+1|)><rsup|-1>*s<rsub|-<frac|3|2>,n><around|(|k|)>|]>
  </equation>

  Where <math|s<rsub|\<mu\>,\<nu\>><around|(|z|)>> are the Lommel polynomials
  defined in terms of the generalized hypergeometric function
  <math|<rsub|p>F<rsub|q>> as:

  <\equation>
    s<rsub|\<mu\>,\<nu\>><around|(|z|)>=<around*|(|<frac|z|2>|)><rsup|\<nu\>><rsub|p>*F<rsub|q><around|(|\<nu\>+1;\<mu\>+\<nu\>+1,\<nu\>+1;-<around*|(|<frac|z|2>|)><rsup|2>|)>
  </equation>
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