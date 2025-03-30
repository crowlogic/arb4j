<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\definition>
    <dueto|Convex Function>A function <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is
    convex if for any <math|x,y\<in\>\<bbb-R\>> and
    <math|t\<in\><around|[|0,1|]>>:

    <\equation*>
      f*<around|(|t*x+<around|(|1-t|)>*y|)>\<leq\>t*f<around|(|x|)>+<around|(|1-t|)>*f<around|(|y|)>
    </equation*>
  </definition>

  <\definition>
    <dueto|Convex Functional>A functional <math|J:X\<to\>\<bbb-R\>> on a
    function space <math|X> is convex if for any
    <math|f<around|(|x|)>,g<around|(|x|)>\<in\>X> and
    <math|t\<in\><around|[|0,1|]>>:

    <\equation*>
      J*<around|(|t\<cdot\>f<around|(|x|)>+<around|(|1-t|)>\<cdot\>g<around|(|x|)>|)>\<leq\>t\<cdot\>J<around|(|f<around|(|x|)>|)>+<around|(|1-t|)>\<cdot\>J<around|(|g<around|(|x|)>|)>
    </equation*>
  </definition>

  <\definition>
    <dueto|Monotonically Increasing Function>A function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is monotonically increasing if:

    <\equation*>
      x\<less\>y\<Longrightarrow\>f<around|(|x|)>\<less\>f<around|(|y|)><space|1em>\<forall\>x,y\<in\>\<bbb-R\>
    </equation*>
  </definition>

  <\definition>
    <dueto|Monotonically Decreasing Function>A function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is monotonically decreasing if:

    <\equation*>
      x\<less\>y\<Longrightarrow\>f<around|(|x|)>\<gtr\>f<around|(|y|)><space|1em>\<forall\>x,y\<in\>\<bbb-R\>
    </equation*>
  </definition>

  <\definition>
    <dueto|Non-decreasing Function>A function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is non-decreasing if:

    <\equation*>
      x\<leq\>y\<Longrightarrow\>f<around|(|x|)>\<leq\>f<around|(|y|)><space|1em>\<forall\>x,y\<in\>\<bbb-R\>
    </equation*>
  </definition>

  <\definition>
    <dueto|Non-increasing Function>A function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is non-increasing if:

    <\equation*>
      x\<leq\>y\<Longrightarrow\>f<around|(|x|)>\<geq\>f<around|(|y|)><space|1em>\<forall\>x,y\<in\>\<bbb-R\>
    </equation*>
  </definition>

  <\theorem>
    <dueto|Convexity and Monotonicity>If a function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> is twice differentiable and
    <math|<frac|d<rsup|2>*f|d*x<rsup|2>><around|(|x|)>\<gtr\>0> for all
    <math|x>, then <math|f> is convex and monotonically increasing.
  </theorem>

  <\remark>
    A function that is not monotonic may have points where a line cannot be
    drawn through its graph without intersecting it at more than two points,
    violating the definition of convexity.
  </remark>

  <\theorem>
    <dueto|Jensen's Inequality>For a convex function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>>, real numbers
    <math|x<rsub|1>,\<ldots\>,x<rsub|n>>, and non-negative weights
    <math|\<alpha\><rsub|1>,\<ldots\>,\<alpha\><rsub|n>> with
    <math|<big|sum><rsub|i=1><rsup|n>\<alpha\><rsub|i>=1>:

    <\equation>
      f<around*|(|<big|sum><rsub|i=1><rsup|n>\<alpha\><rsub|i>*x<rsub|i>|)>\<leq\><big|sum><rsub|i=1><rsup|n>\<alpha\><rsub|i>*f<around|(|x<rsub|i>|)>
    </equation>

    Equality holds if and only if all <math|x<rsub|i>> are equal or <math|f>
    is linear.
  </theorem>

  <\corollary>
    For a convex function <math|f> and a random variable <math|X>:

    <\equation>
      f<around|(|\<bbb-E\><around|[|X|]>|)>\<leq\>\<bbb-E\><around|[|f<around|(|X|)>|]>
    </equation>
  </corollary>

  <\theorem>
    <dueto|Convexity and Local Minima>If <math|f:\<bbb-R\><rsup|n>\<to\>\<bbb-R\>>
    is convex, then any local minimum of <math|f> is also a global minimum.
  </theorem>

  <\theorem>
    <dueto|Karush-Kuhn-Tucker (KKT) Conditions>For a convex optimization
    problem:

    <\equation>
      min<rsub|x\<in\>\<bbb-R\><rsup|n>> f<around|(|x|)>*<text|subject to
      >g<rsub|i><around|(|x|)>\<leq\>0,h<rsub|j><around|(|x|)>=0
    </equation>

    where <math|f> and <math|g<rsub|i>> are convex and <math|h<rsub|j>> are
    affine, the KKT conditions are necessary and sufficient for optimality.
  </theorem>

  <\definition>
    <dueto|Affine Function>A function <math|f:\<bbb-R\><rsup|n>\<to\>\<bbb-R\><rsup|m>>
    is affine if it can be expressed as:

    <\equation>
      f<around|(|x|)>=A*x+b
    </equation>

    where <math|A> is an <math|m\<times\>n> matrix and <math|b> is an
    <math|m>-dimensional vector.
  </definition>

  <\theorem>
    <dueto|Properties of Affine Functions>

    <\enumerate-numeric>
      <item>Every affine function is both convex and concave.

      <item>The composition of an affine function with a convex function is
      convex.\ 

      <item>The sum of an affine function and a convex function is convex.
    </enumerate-numeric>
  </theorem>

  <\theorem>
    <dueto|Affine Hull>The affine hull of a set
    <math|S\<subset\>\<bbb-R\><rsup|n>> is the smallest affine set containing
    <math|S>:

    <\equation>
      <text|aff><around|(|S|)>=<around*|{|<big|sum><rsub|i=1><rsup|k>\<alpha\><rsub|i>*x<rsub|i>:x<rsub|i>\<in\>S,<big|sum><rsub|i=1><rsup|k>\<alpha\><rsub|i>=1|}>
    </equation>
  </theorem>

  <\theorem>
    <dueto|Affine Independence>Vectors <math|<around*|{|v<rsub|n>|}><rsub|n=1><rsup|k>>
    are affinely independent if and only if
    <math|<around*|{|v<rsub|n>-v<rsub|1>|}><rsub|n=1><rsup|k><rsub|>> are
    linearly independent.
  </theorem>
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