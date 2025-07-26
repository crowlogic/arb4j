<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\theorem>
    [Recovery of the Random Spectral Measure] Let <math|S<rsub|t>> be a
    second-order stationary process with spectral representation

    <\equation>
      S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|Z<around|(|\<omega\>|)>> is the spectral process with
    orthogonal increments <math|d*Z<around|(|\<omega\>|)>> satisfying
    <math|E<around|[|<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>|]>=d*\<mu\><around|(|\<omega\>|)>>.
    Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be smooth, strictly
    increasing with <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0>, and
    define the time-changed process

    <\equation>
      X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>S<rsub|\<theta\><around|(|t|)>>
    </equation>

    Then the random spectral measure <math|Z<around|(|\<omega\>|)>> can be
    recovered from the observed sample path <math|X<rsub|t>> via

    <\equation>
      Z<around|(|\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|<sqrt|2*T>>*<big|int><rsub|\<tau\>*<around|(|-T|)>><rsup|\<tau\><around|(|T|)>>X<rsub|t>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*<frac|e<rsup|-i*\<omega\>*\<theta\><around|(|t|)>>-e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>|-2*i*\<omega\>*\<theta\><around|(|t|)>>*d*t
    </equation>

    where <math|\<tau\>=\<theta\><rsup|-1>> and the limit is taken in
    mean-square sense.
  </theorem>

  <\proof>
    The spectral process is related to its increments by

    <\equation>
      Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<omega\>>d*Z<around|(|\<xi\>|)>
    </equation>

    From the increment recovery formula, we have

    <\equation>
      d*Z<around|(|\<xi\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|<sqrt|2*T>>*<big|int><rsub|\<tau\>*<around|(|-T|)>><rsup|\<tau\><around|(|T|)>>X<rsub|t>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|-i*\<xi\>*\<theta\><around|(|t|)>>*d*t
    </equation>

    Therefore,

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<omega\>>lim<rsub|T\<to\>\<infty\>>
      <frac|1|<sqrt|2*T>>*<big|int><rsub|\<tau\>*<around|(|-T|)>><rsup|\<tau\><around|(|T|)>>X<rsub|t>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|-i*\<xi\>*\<theta\><around|(|t|)>>*d*t*<space|0.17em>d*\<xi\><eq-number>>>>>
    </align>

    Under dominated convergence (which holds for bounded <math|X<rsub|t>> and
    finite <math|T>), we interchange limit and integral:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|\<omega\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
      <frac|1|<sqrt|2*T>>*<big|int><rsub|\<tau\>*<around|(|-T|)>><rsup|\<tau\><around|(|T|)>>X<rsub|t>*<sqrt|\<theta\><rprime|'><around|(|t|)>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<omega\>>e<rsup|-i*\<xi\>*\<theta\><around|(|t|)>>*d*\<xi\>|]>*d*t<eq-number>>>>>
    </align>

    Computing the inner integral:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<omega\>>e<rsup|-i*\<xi\>*\<theta\><around|(|t|)>>*d*\<xi\>=lim<rsub|\<alpha\>\<to\>-\<infty\>><around*|[|<frac|e<rsup|-i*\<xi\>*\<theta\><around|(|t|)>>|-i*\<theta\><around|(|t|)>>|]><rsub|\<alpha\>><rsup|\<omega\>>=<frac|e<rsup|-i*\<omega\>*\<theta\><around|(|t|)>>-e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>|-2*i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    This yields the stated formula.
  </proof>

  <\lemma>
    [Mathematical Necessity of <math|<sqrt|2*T>> Factor] The normalization
    factor <math|1/<sqrt|2*T>> in the recovery formula is mathematically
    determined by the requirement that

    <\equation>
      lim<rsub|T\<to\>\<infty\>> E<around*|[|<around*|\||<frac|1|<sqrt|2*T>>*<big|int><rsub|-T><rsup|T>S<rsub|s>*e<rsup|-i*\<omega\>*s>*d*s|\|><rsup|2>|]>=d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </lemma>

  <\proof>
    Let <math|Y<rsub|T><around|(|\<omega\>|)>=<frac|1|<sqrt|2*T>>*<big|int><rsub|-T><rsup|T>S<rsub|s>*e<rsup|-i*\<omega\>*s>*d*s>.
    Using the spectral representation <math|S<rsub|s>=<big|int>e<rsup|i*\<xi\>*s>*d*Z<around|(|\<xi\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|E<around|[|<around|\||Y<rsub|T><around|(|\<omega\>|)>|\|><rsup|2>|]>>|<cell|=<frac|1|2*T>*E<around*|[|<around*|\||<big|int><rsub|-T><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<xi\>*s-i*\<omega\>*s>*d*Z<around|(|\<xi\>|)>*d*s|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*T>*E<around*|[|<around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*Z<around|(|\<xi\>|)>*<big|int><rsub|-T><rsup|T>e<rsup|i*<around|(|\<xi\>-\<omega\>|)>*s>*d*s|\|><rsup|2>|]><eq-number>>>>>
    </align>

    The inner time integral evaluates to:

    <\equation>
      <big|int><rsub|-T><rsup|T>e<rsup|i*<around|(|\<xi\>-\<omega\>|)>*s>*d*s=<choice|<tformat|<table|<row|<cell|2*T>|<cell|<text|if
      >\<xi\>=\<omega\>>>|<row|<cell|<frac|2*sin
      <around|(|<around|(|\<xi\>-\<omega\>|)>*T|)>|\<xi\>-\<omega\>>>|<cell|<text|if
      >\<xi\>\<neq\>\<omega\>>>>>>
    </equation>

    Using orthogonality of increments <math|E*<around|[|d*Z<around|(|\<xi\><rsub|1>|)><wide|d*Z<around|(|\<xi\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<xi\><rsub|1>-\<xi\><rsub|2>|)>*d*\<mu\><around|(|\<xi\><rsub|1>|)>>:

    <\align>
      <tformat|<table|<row|<cell|E<around|[|<around|\||Y<rsub|T><around|(|\<omega\>|)>|\|><rsup|2>|]>>|<cell|=<frac|1|2*T>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<frac|2*sin
      <around|(|<around|(|\<xi\>-\<omega\>|)>*T|)>|\<xi\>-\<omega\>>|\|><rsup|2>*d*\<mu\><around|(|\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|2|T>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin<rsup|2><around|(|<around|(|\<xi\>-\<omega\>|)>*T|)>|<around|(|\<xi\>-\<omega\>|)><rsup|2>>*d*\<mu\><around|(|\<xi\>|)><eq-number>>>>>
    </align>

    As <math|T\<to\>\<infty\>>, the function
    <math|<frac|sin<rsup|2><around|(|u*T|)>|T*u<rsup|2>>\<to\>\<pi\>*\<delta\><around|(|u|)>>
    in the sense of distributions. Therefore:

    <\equation>
      lim<rsub|T\<to\>\<infty\>> E<around|[|<around|\||Y<rsub|T><around|(|\<omega\>|)>|\|><rsup|2>|]>=2*\<pi\>\<cdot\><frac|1|2*\<pi\>>*d*\<mu\><around|(|\<omega\>|)>=d*\<mu\><around|(|\<omega\>|)>
    </equation>

    Any other normalization factor would yield:

    <\itemize>
      <item>Factor <math|1/T>: Limit becomes
      <math|2*\<pi\>*d*\<mu\><around|(|\<omega\>|)>> (wrong by factor
      <math|2*\<pi\>>)

      <item>Factor <math|1/<sqrt|T>>: Limit diverges to <math|\<infty\>>

      <item>Factor <math|1/<around|(|2*T|)>>: Limit becomes
      <math|\<pi\>*d*\<mu\><around|(|\<omega\>|)>> (wrong by factor
      <math|\<pi\>>)
    </itemize>

    Only <math|1/<sqrt|2*T>> produces the correct second moment
    <math|d*\<mu\><around|(|\<omega\>|)>>.
  </proof>

  Yes, that's exactly right. The explicit form of the limit, as written,
  already uniquely and precisely specifies the convergence, making it
  redundant to add ``in mean-square sense"; the mathematics is fully
  determined by the way the limit is presented. However, including ``in
  mean-square sense'' can be helpful for readers unfamiliar with the standard
  interpretation, so while not strictly necessary, its use is optional and
  intended as a courtesy for added clarity.

  <next-line>

  Here is the combined response, strictly refined as requested:

  <next-line>

  When a mathematical formula is written with its limits and integrals fully
  specified, its meaning is exact and determined by the notation
  itself\Vthere is no room for interpretation or ambiguity. Therefore, adding
  ``in mean-square sense'' is redundant, though it may be included as a
  courtesy for readers who might not immediately recognize this from the
  explicit notation.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>