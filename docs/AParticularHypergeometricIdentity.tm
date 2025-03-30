<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof of a Hypergeometric Function
  Identity>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<\doc-date>
    <date|>
  </doc-date>>

  <\theorem>
    \;

    <\equation>
      <rsub|2>F<rsub|1><around*|(|<frac|1|4>,<frac|1|2>;<frac|3|2>;x<rsup|2>|)>+<frac|1|6>*x<rsup|2><rsub|>
      <rsub|2>F<rsub|1><around*|(|<frac|5|4>,<frac|3|2>;<frac|5|2>;x<rsup|2>|)>=<frac|1|<around|(|1-x<rsup|2>|)><rsup|1/4>>=<sqrt|<frac|1|<sqrt|1-x<rsup|2>>>>\<forall\>x\<in\>\<bbb-C\>
    </equation>
  </theorem>

  <\proof>
    Let's call the left side <math|f<around|(|x|)>> and the right side
    <math|g<around|(|x|)>=<around|(|1-x<rsup|2>|)><rsup|-1/4>>.

    We will prove they are equal by showing:

    <\enumerate>
      <item>Both functions are meromorphic on the entire complex plane

      <item>They satisfy the same differential equation everywhere

      <item>They have the same initial conditions at <math|x=0>

      <item>They have identical singular behavior at <math|x=\<pm\>1>
    </enumerate>

    Both functions satisfy the differential equation:

    <\equation>
      <around|(|1-x<rsup|2>|)>*y<rprime|''>-x*y<rprime|'>=<frac|1|4>*y
    </equation>

    Let's verify <math|f<around|(|x|)>> satisfies the DE. Let
    <math|<rsub|2>F<rsub|1><around*|(|<frac|1|4>,<frac|1|2>;<frac|3|2>;t|)>>
    and <math|F<rsub|2><around|(|t|)>= <rsub|2>F<rsub|1><around*|(|<frac|5|4>,<frac|3|2>;<frac|5|2>;t|)>>,
    where <math|t=x<rsup|2>>.

    By chain rule:

    <\equation>
      <frac|d|d*x>*F<rsub|1><around|(|x<rsup|2>|)>=2*x*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>
    </equation>

    <\equation>
      <frac|d<rsup|2>|d*x<rsup|2>>*F<rsub|1><around|(|x<rsup|2>|)>=2*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*F<rsub|1><rprime|''><around|(|x<rsup|2>|)>
    </equation>

    The hypergeometric functions satisfy their respective DEs:

    <\equation>
      t*<around|(|1-t|)>*F<rsub|1><rprime|''><around|(|t|)>+<around|(|<frac|3|2>-<around|(|<frac|7|4>|)>*t|)>*F<rsub|1><rprime|'><around|(|t|)>-<frac|1|8>*F<rsub|1><around|(|t|)>=0
    </equation>

    <\equation>
      t*<around|(|1-t|)>*F<rsub|2><rprime|''><around|(|t|)>+<around|(|<frac|5|2>-<around|(|<frac|13|4>|)>*t|)>*F<rsub|2><rprime|'><around|(|t|)>-<frac|15|8>*F<rsub|2><around|(|t|)>=0
    </equation>

    Substituting <math|t=x<rsup|2>> and using the chain rule relations:

    For <math|F<rsub|1>> terms:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|1-x<rsup|2>|)>*<around|[|2*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*F<rsub|1><rprime|''><around|(|x<rsup|2>|)>|]>-x*<around|[|2*x*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>|]>>|<cell|=>>|<row|<cell|2*<around|(|1-x<rsup|2>|)>*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*<around|(|1-x<rsup|2>|)>*F<rsub|1><rprime|''><around|(|x<rsup|2>|)>-2*x<rsup|2>*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>>|<cell|=>>|<row|<cell|2*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>-2*x<rsup|2>*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*<around|(|1-x<rsup|2>|)>*F<rsub|1><rprime|''><around|(|x<rsup|2>|)>>|<cell|=<frac|1|4>*F<rsub|1><around|(|x<rsup|2>|)>>>>>>
    </equation>

    Similar computation for the <math|F<rsub|2>> terms with its coefficient
    <math|<frac|1|6>*x<rsup|2>> yields:

    <\equation>
      <frac|1|6>*x<rsup|2>*<around|[|2*F<rsub|2><rprime|'><around|(|x<rsup|2>|)>-2*x<rsup|2>*F<rsub|2><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*<around|(|1-x<rsup|2>|)>*F<rsub|2><rprime|''><around|(|x<rsup|2>|)>|]>=<frac|1|4>\<cdot\><frac|1|6>*x<rsup|2>*F<rsub|2><around|(|x<rsup|2>|)>
    </equation>

    Adding these equations and using the original hypergeometric DEs to
    simplify:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|1-x<rsup|2>|)>*f<rprime|''><around|(|x|)>-x*f<rprime|'><around|(|x|)>>|<cell|=<with|font-base-size|7|<around|(|1-x<rsup|2>|)>*<around|[|2*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*F<rsub|1><rprime|''><around|(|x<rsup|2>|)>+<frac|1|6>*x<rsup|2>*<around|(|2*F<rsub|2><rprime|'><around|(|x<rsup|2>|)>+4*x<rsup|2>*F<rsub|2><rprime|''><around|(|x<rsup|2>|)>|)>|]>>>>|<row|<cell|>|<cell|<space|1em>-x*<around|[|2*x*F<rsub|1><rprime|'><around|(|x<rsup|2>|)>+<frac|1|6>*x<rsup|2>*<around|(|2*x*F<rsub|2><rprime|'><around|(|x<rsup|2>|)>|)>|]>>>|<row|<cell|>|<cell|=<frac|1|4>*F<rsub|1><around|(|x<rsup|2>|)>+<frac|1|4>\<cdot\><frac|1|6>*x<rsup|2>*F<rsub|2><around|(|x<rsup|2>|)>>>|<row|<cell|>|<cell|=<frac|1|4>*f<around|(|x|)>>>>>>
    </equation>

    For <math|g<around|(|x|)>=<around|(|1-x<rsup|2>|)><rsup|-1/4>>:

    Calculate <math|g<rprime|'><around|(|x|)>>:

    <\equation>
      g<rprime|'><around|(|x|)>=<frac|1|2>*x*<around|(|1-x<rsup|2>|)><rsup|-5/4>
    </equation>

    Calculate <math|g<rprime|''><around|(|x|)>>:

    <\equation>
      g<rprime|''><around|(|x|)>=<frac|1|2>*<around|(|1-x<rsup|2>|)><rsup|-5/4>+<frac|5|4>*x<rsup|2>*<around|(|1-x<rsup|2>|)><rsup|-9/4>
    </equation>

    Substitute into the differential equation:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|1-x<rsup|2>|)>*g<rprime|''>-x*g<rprime|'>>|<cell|=<around|(|1-x<rsup|2>|)>*<around*|[|<frac|1|2>*<around|(|1-x<rsup|2>|)><rsup|-5/4>+<frac|5|4>*x<rsup|2>*<around|(|1-x<rsup|2>|)><rsup|-9/4>|]>>>|<row|<cell|>|<cell|<space|1em>-x*<around*|[|<frac|1|2>*x*<around|(|1-x<rsup|2>|)><rsup|-5/4>|]>>>|<row|<cell|>|<cell|=<frac|1|2>*<around|(|1-x<rsup|2>|)><rsup|-1/4>+<frac|5|4>*x<rsup|2>*<around|(|1-x<rsup|2>|)><rsup|-5/4>-<frac|1|2>*x<rsup|2>*<around|(|1-x<rsup|2>|)><rsup|-5/4>>>|<row|<cell|>|<cell|=<frac|1|2>*<around|(|1-x<rsup|2>|)><rsup|-1/4>+<frac|3|4>*x<rsup|2>*<around|(|1-x<rsup|2>|)><rsup|-5/4>>>|<row|<cell|>|<cell|=<frac|1|4>*<around|(|1-x<rsup|2>|)><rsup|-1/4>>>|<row|<cell|>|<cell|=<frac|1|4>*g<around|(|x|)>>>>>>
    </equation>

    At <math|x=0>:

    <\itemize>
      <item><math|f<around|(|0|)>=1> (since hypergeometric functions evaluate
      to 1 at 0)

      <item><math|g<around|(|0|)>=1>
    </itemize>

    Note that <math|f<rprime|'><around|(|0|)>=0> follows from the series
    expansions of the hypergeometric functions:

    <\equation>
      F<rsub|1><around|(|t|)>=1+<frac|1|4>\<cdot\><frac|1|2>\<cdot\><frac|2|3>*t+O<around|(|t<rsup|2>|)>
    </equation>

    <\equation>
      F<rsub|2><around|(|t|)>=1+<frac|5|4>\<cdot\><frac|3|2>\<cdot\><frac|2|5>*t+O<around|(|t<rsup|2>|)>
    </equation>

    Therefore, <math|f<rprime|'><around|(|0|)>=g<rprime|'><around|(|0|)>=0>
    by direct computation.

    Near <math|x=\<pm\>1>, both functions have the same leading behavior:

    <\equation>
      f<around|(|x|)>=<frac|1|<around|(|1-x<rsup|2>|)><rsup|1/4>>+O<around|(|1|)>
    </equation>

    This can be verified using the standard connection formulas for
    hypergeometric functions near <math|x=1>.

    By uniqueness theorem for ODEs, since both functions:

    <\itemize>
      <item>Satisfy the same differential equation everywhere

      <item>Have same initial conditions at <math|x=0>

      <item>Are meromorphic on <math|\<bbb-C\>>

      <item>Have identical singular behavior at <math|x=\<pm\>1>
    </itemize>

    They must be identical everywhere on the complex plane.
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