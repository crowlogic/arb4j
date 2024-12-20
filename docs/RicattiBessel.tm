<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Logarithmic Derivative of Bessel
  Functions>|<doc-date|>>

  The Bessel function <math|J<rsub|n><around|(|t|)>> satisfies:

  <\equation*>
    t<rsup|2>*J<rsub|n><rprime|''><around|(|t|)>+t*J<rsub|n><rprime|'><around|(|t|)>+<around|(|t<rsup|2>-n<rsup|2>|)>*J<rsub|n><around|(|t|)>=0
  </equation*>

  Its logarithmic derivative is:

  <\equation*>
    w<around|(|t|)>=<frac|J<rsub|n><rprime|'><around|(|t|)>|J<rsub|n><around|(|t|)>>
  </equation*>

  The logarithmic derivative satisfies a Riccati equation, as follows:

  <\enumerate>
    <item>The definition directly implies:

    <\equation*>
      J<rsub|n><rprime|'><around|(|t|)>=w<around|(|t|)>*J<rsub|n><around|(|t|)>
    </equation*>

    <item>The derivative of this equation is:

    <\equation*>
      J<rsub|n><rprime|''><around|(|t|)>=w<rprime|'><around|(|t|)>*J<rsub|n><around|(|t|)>+w<around|(|t|)><rsup|2>*J<rsub|n><around|(|t|)>
    </equation*>

    <item>These expressions in the Bessel equation yield:

    <\equation*>
      t<rsup|2>*<around|(|w<rprime|'><around|(|t|)>*J<rsub|n><around|(|t|)>+w<around|(|t|)><rsup|2>*J<rsub|n><around|(|t|)>|)>+t*<around|(|w<around|(|t|)>*J<rsub|n><around|(|t|)>|)>+<around|(|t<rsup|2>-n<rsup|2>|)>*J<rsub|n><around|(|t|)>=0
    </equation*>

    <item>Division by <math|J<rsub|n><around|(|t|)>> produces:

    <\equation*>
      t<rsup|2>*w<rprime|'><around|(|t|)>+t<rsup|2>*w<around|(|t|)><rsup|2>+t*w<around|(|t|)>+<around|(|t<rsup|2>-n<rsup|2>|)>=0
    </equation*>

    <item>The equation rearranges to:

    <\equation*>
      w<rprime|'><around|(|t|)>=-w<around|(|t|)><rsup|2>-<frac|w<around|(|t|)>|t>-<around|(|1-<frac|n<rsup|2>|t<rsup|2>>|)>
    </equation*>
  </enumerate>

  The logarithmic derivative of <math|J<rsub|n><around|(|t|)>> satisfies this
  Riccati equation.
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