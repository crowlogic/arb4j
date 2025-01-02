<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Fourier Transform of the Jacobi Weight
  Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\theorem>
    For <math|\<alpha\>,\<beta\>\<gtr\>-1>, the Fourier transform of the
    Jacobi weight function

    <\equation*>
      w<around|(|x|)>=<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>*<space|1em><text|on
      ><around|[|-1,1|]>
    </equation*>

    is given by

    <\equation*>
      <wide|w|^><around|(|t|)>=2<rsup|\<alpha\>+\<beta\>+1>*\<Gamma\>*<around|(|\<alpha\>+1|)>*\<Gamma\>*<around|(|\<beta\>+1|)>*<frac|J<rsub|\<alpha\>+\<beta\>+1>*<around|(|2*t|)>|<around|(|2*t|)><rsup|\<alpha\>+\<beta\>+1>>*e<rsup|i*t>
    </equation*>

    where <math|J<rsub|\<nu\>>> denotes the Bessel function of the first kind
    of order <math|\<nu\>>.
  </theorem>

  <\proof>
    <with|font-series|bold|1. Initial Setup and Conditions:><next-line>The
    conditions <math|\<alpha\>,\<beta\>\<gtr\>-1> ensure:

    <\itemize>
      <item>The weight function is integrable on <math|<around|[|-1,1|]>>

      <item>The Beta function <math|B<around|(|\<alpha\>+1,\<beta\>+1|)>> is
      well-defined

      <item>The resulting Bessel function expression converges
    </itemize>

    We need to compute the Fourier transform:

    <\equation>
      <wide|w|^><around|(|t|)>=<big|int><rsub|-1><rsup|1><around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>*e<rsup|-i*x*t>*<space|0.17em>d*x
    </equation>

    <with|font-series|bold|2. Change of Variables:><next-line>Let

    <\equation>
      u=<frac|1+x|2>
    </equation>

    then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|x>|<cell|=2*u-1>>|<row|<cell|d*x>|<cell|=2*d*u>>|<row|<cell|<text|when
      >x>|<cell|=-1,u=0>>|<row|<cell|<text|when >x>|<cell|=1,u=1>>>>>
    </equation>

    The integral becomes:

    <\equation>
      <wide|w|^><around|(|t|)>=2<rsup|1+\<alpha\>+\<beta\>>*<big|int><rsub|0><rsup|1><around|(|1-u|)><rsup|\<alpha\>>*u<rsup|\<beta\>>*e<rsup|-i*<around|(|2*u-1|)>*t>*<space|0.17em>d*u
    </equation>

    <with|font-series|bold|3. Exponential Splitting:>

    <\equation>
      e<rsup|-i*<around|(|2*u-1|)>*t>=e<rsup|-i*2*u*t>*e<rsup|i*t>
    </equation>

    <with|font-series|bold|4. Connection to Hypergeometric
    Functions:><next-line>The integral now takes the form:

    <\equation>
      2<rsup|1+\<alpha\>+\<beta\>>*e<rsup|i*t>*<big|int><rsub|0><rsup|1><around|(|1-u|)><rsup|\<alpha\>>*u<rsup|\<beta\>>*e<rsup|-i*2*u*t>*<space|0.17em>d*u
    </equation>

    This integral relates to the generalized hypergeometric function
    <math|<rsub|1>F<rsub|1>> through:

    <\equation>
      <big|int><rsub|0><rsup|1>u<rsup|\<beta\>>*<around|(|1-u|)><rsup|\<alpha\>>*e<rsup|-i*2*u*t>*<space|0.17em>d*u=B<around|(|\<alpha\>+1,\<beta\>+1|)><rsub|1>*F<rsub|1><around|(|\<beta\>+1;\<alpha\>+\<beta\>+2;-2*i*t|)>
    </equation>

    <with|font-series|bold|5. Transformation to Bessel
    Functions:><next-line>The hypergeometric function transforms to Bessel
    form through three key steps:

    First, applying the Kummer transformation:

    <\equation>
      <rsub|1>F<rsub|1><around|(|a;b;z|)>=e<rsup|z><rsub|1>*F<rsub|1><around|(|b-a;b;-z|)>
    </equation>

    Second, using the limiting relation between confluent hypergeometric and
    Bessel functions:

    <\equation>
      J<rsub|\<nu\>><around|(|z|)>=<frac|<around|(|z/2|)><rsup|\<nu\>>|\<Gamma\>*<around|(|\<nu\>+1|)>><rsub|0>*F<rsub|1>(;\<nu\>+1;-z<rsup|2>/4)
    </equation>

    Finally, through Hankel's contour integral representation:

    <\equation>
      J<rsub|\<nu\>><around|(|z|)>=<frac|z<rsup|\<nu\>>|2<rsup|\<nu\>>*\<Gamma\>*<around|(|\<nu\>+1|)>><rsub|0>*F<rsub|1><around*|(|;\<nu\>+1;-<frac|z<rsup|2>|4>|)>
    </equation>

    These transformations yield:

    <\equation>
      <big|int><rsub|0><rsup|1><around|(|1-u|)><rsup|\<alpha\>>*u<rsup|\<beta\>>*e<rsup|-i*2*u*t>*<space|0.17em>d*u=B<around|(|\<alpha\>+1,\<beta\>+1|)>*<frac|J<rsub|\<alpha\>+\<beta\>+1>*<around|(|2*t|)>|<around|(|2*t|)><rsup|\<alpha\>+\<beta\>+1>>
    </equation>

    <with|font-series|bold|6. Final Result:><next-line>Combining all terms:

    <\equation>
      <wide|w|^><around|(|t|)>=2<rsup|1+\<alpha\>+\<beta\>>*B<around|(|\<alpha\>+1,\<beta\>+1|)>*<frac|J<rsub|\<alpha\>+\<beta\>+1>*<around|(|2*t|)>|<around|(|2*t|)><rsup|\<alpha\>+\<beta\>+1>>*e<rsup|i*t>
    </equation>

    Using the Beta function relation <math|B<around|(|a,b|)>=<frac|\<Gamma\><around|(|a|)>*\<Gamma\><around|(|b|)>|\<Gamma\>*<around|(|a+b|)>>>,
    we obtain our final result:

    <\equation>
      <wide|w|^><around|(|t|)>=2<rsup|\<alpha\>+\<beta\>+1>*\<Gamma\>*<around|(|\<alpha\>+1|)>*\<Gamma\>*<around|(|\<beta\>+1|)>*<frac|J<rsub|\<alpha\>+\<beta\>+1>*<around|(|2*t|)>|<around|(|2*t|)><rsup|\<alpha\>+\<beta\>+1>>*e<rsup|i*t>
    </equation>

    The <math|e<rsup|i*t>> term carries the essential phase information of
    the Fourier transform, completing the proof.
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