<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Theorem: Caputo Fractional Derivative of the Sine
  Function>|<doc-date|>>

  <\definition>
    [Caputo Fractional Derivative] For <math|n-1\<less\>\<alpha\>\<less\>n>
    where <math|n\<in\>\<bbb-N\>>, the Caputo fractional derivative of order
    <math|\<alpha\>> is defined as:

    <\equation>
      <label|eq:caputo_def><rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>=<frac|*<big|int><rsub|0><rsup|t><frac|f<rsup|<around|(|n|)>><around|(|\<tau\>|)>|<around|(|t-\<tau\>|)><rsup|\<alpha\>-n+1>>*d*\<tau\>|\<Gamma\>*<around|(|n-\<alpha\>|)>>
    </equation>
  </definition>

  <\definition>
    [Two-Parameter Mittag-Leffler Function]<label|def:mittag_leffler>The
    Mittag-Leffler function is defined as:

    <\equation>
      E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|z<rsup|k>|\<Gamma\>*<around|(|\<alpha\>*k+\<beta\>|)>>,<space|1em>\<alpha\>,\<beta\>\<gtr\>0
    </equation>
  </definition>

  <\theorem>
    For <math|0\<less\>\<alpha\>\<less\>1>, the Caputo fractional derivative
    of <math|sin <around|(|t|)>> is:

    <\equation>
      <label|eq:main_result><rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=t<rsup|1-\<alpha\>>*E<rsub|2,2-\<alpha\>>*<around|(|-t<rsup|2>|)>
    </equation>
  </theorem>

  <\proof>
    Let <math|f<around|(|t|)>=sin <around|(|t|)>>. Since
    <math|\<alpha\>\<in\><around|(|0,1|)>>, we have <math|n=1> in Definition
    1. The first derivative is:

    <\equation>
      f<rsup|<around|(|1|)>><around|(|t|)>=cos <around|(|t|)>
    </equation>

    Substitute into the Caputo definition (<reference|eq:caputo_def>):

    <\equation>
      <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=<frac|<big|int><rsub|0><rsup|t><frac|cos
      <around|(|\<tau\>|)>|<around|(|t-\<tau\>|)><rsup|\<alpha\>>>*d*\<tau\>|\<Gamma\>*<around|(|1-\<alpha\>|)>>*
    </equation>

    Substitute the Taylor series of <math|cos
    <around|(|\<tau\>|)>><space|1em>

    <\equation>
      cos <around|(|\<tau\>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*\<tau\><rsup|2*k>|<around|(|2*k|)>!>
    </equation>

    then make the substitution

    <\equation>
      u=<frac|\<tau\>|t>
    </equation>

    such that

    <\align>
      <tformat|<table|<row|<cell|<rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>>|<cell|=<frac|1|\<Gamma\>*<around|(|1-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k|)>!>*<big|int><rsub|0><rsup|t><frac|\<tau\><rsup|2*k>|<around|(|t-\<tau\>|)><rsup|\<alpha\>>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<Gamma\>*<around|(|1-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k|)>!>*t<rsup|2*k+1-\<alpha\>>*<big|int><rsub|0><rsup|1>u<rsup|2*k>*<around|(|1-u|)><rsup|-\<alpha\>>*d*u<eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<Gamma\>*<around|(|1-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k|)>!>*t<rsup|2*k+1-\<alpha\>>B<around|(|2*k+1,1-\<alpha\>|)>>>|<row|<cell|>|<cell|=<frac|1|\<Gamma\>*<around|(|1-\<alpha\>|)>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|2*k|)>!>*t<rsup|2*k+1-\<alpha\>>*<frac|\<Gamma\>*<around|(|2*k+1|)>*\<Gamma\>*<around|(|1-\<alpha\>|)>|\<Gamma\>*<around|(|2*k+2-\<alpha\>|)>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*t<rsup|2*k+1-\<alpha\>>|\<Gamma\>*<around|(|2*k+2-\<alpha\>|)>>>>>>
    </align>

    Factor out <math|t<rsup|1-\<alpha\>>>:

    <\equation>
      =t<rsup|1-\<alpha\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-t<rsup|2>|)><rsup|k>|\<Gamma\>*<around|(|2*k+2-\<alpha\>|)>>
    </equation>

    Compare with Definition <reference|def:mittag_leffler>:

    <\equation>
      <big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-t<rsup|2>|)><rsup|k>|\<Gamma\>*<around|(|2*k+2-\<alpha\>|)>>=E<rsub|2,2-\<alpha\>>*<around|(|-t<rsup|2>|)>
    </equation>

    Thus yielding the result:

    <\equation>
      <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin
      <around|(|t|)>=t<rsup|1-\<alpha\>>*E<rsub|2,2-\<alpha\>>*<around|(|-t<rsup|2>|)>*<space|1em>\<blacksquare\>
    </equation>
  </proof>

  For <math|1\<less\>\<alpha\>\<less\>2> (<math|n=2>), repeating the process
  with <math|f<rsup|<around|(|2|)>><around|(|t|)>=-sin <around|(|t|)>>
  yields:

  <\equation>
    <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin <around|(|t|)>=cos
    <around|(|t|)>-<frac|t<rsup|2-\<alpha\>>|\<Gamma\>*<around|(|3-\<alpha\>|)>>+<big|sum><rsub|k=1><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*t<rsup|2*k+2-\<alpha\>>|\<Gamma\>*<around|(|2*k+3-\<alpha\>|)>>
  </equation>

  which simplifies to:

  <\equation>
    <rsub|0><rsup|C>D<rsub|t><rsup|\<alpha\>>*sin <around|(|t|)>=cos
    <around|(|t|)>-t<rsup|2-\<alpha\>>*E<rsub|2,3-\<alpha\>>*<around|(|-t<rsup|2>|)>
  </equation>

  \F
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
    <associate|def:mittag_leffler|<tuple|2|1>>
    <associate|eq:caputo_def|<tuple|1|1>>
    <associate|eq:main_result|<tuple|3|1>>
  </collection>
</references>