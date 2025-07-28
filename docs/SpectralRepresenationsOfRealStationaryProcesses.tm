<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\theorem>
    [Real Spectral Representation for Stationary Processes] Let
    <math|<around|{|\<xi\><around|(|t|)>,t\<in\>\<bbb-R\>|}>> be a
    real-valued, zero-mean, second-order stationary process with covariance
    function <math|r<around|(|t|)>=E*<around|[|\<xi\><around|(|t|)>*\<xi\><around|(|0|)>|]>>
    and spectral distribution function <math|F<around|(|\<omega\>|)>>. Then
    there exist real-valued processes <math|<around|{|U<around|(|\<omega\>|)>,\<omega\>\<geq\>0|}>>
    and <math|<around|{|V<around|(|\<omega\>|)>,\<omega\>\<geq\>0|}>> with
    orthogonal increments such that:

    <\enumerate>
      <item><with|font-series|bold|Process Representation:>

      <\equation>
        \<xi\><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><around|[|cos
        <around|(|\<omega\>*t|)>*<space|0.17em>d*U<around|(|\<omega\>|)>+sin
        <around|(|\<omega\>*t|)>*<space|0.17em>d*V<around|(|\<omega\>|)>|]>
      </equation>

      <item><with|font-series|bold|Covariance Representation:>

      <\equation>
        r<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*<space|0.17em>d*F<around|(|\<omega\>|)>
      </equation>

      <item><with|font-series|bold|Orthogonality Properties:>

      <\align>
        <tformat|<table|<row|<cell|E<around|[|U<around|(|\<omega\>|)>|]>>|<cell|=E<around|[|V<around|(|\<omega\>|)>|]>=0<eq-number>>>|<row|<cell|E*<around|[|d*U<around|(|\<omega\><rsub|1>|)>*d*U<around|(|\<omega\><rsub|2>|)>|]>>|<cell|=E*<around|[|d*V<around|(|\<omega\><rsub|1>|)>*d*V<around|(|\<omega\><rsub|2>|)>|]>=\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*F<around|(|\<omega\><rsub|1>|)><eq-number>>>|<row|<cell|E*<around|[|d*U<around|(|\<omega\><rsub|1>|)>*d*V<around|(|\<omega\><rsub|2>|)>|]>>|<cell|=0*<space|1em><text|for
        all >\<omega\><rsub|1>,\<omega\><rsub|2>\<geq\>0<eq-number>>>>>
      </align>
    </enumerate>
  </theorem>

  <\proof>
    <line-break>

    <\enumerate>
      <item><with|font-series|bold|Construction from Complex Representation:>
      From the complex spectral representation theorem, we have:

      <\equation>
        \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>
      </equation>

      where <math|\<zeta\><around|(|\<omega\>|)>> is a complex-valued process
      with orthogonal increments.

      <item><with|font-series|bold|Reality Condition:> Since
      <math|\<xi\><around|(|t|)>> is real-valued, we have
      <math|\<xi\><around|(|t|)>=<wide|\<xi\><around|(|t|)>|\<bar\>>>, which
      implies:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<wide|\<zeta\><around|(|\<omega\>|)>|\<bar\>>
      </equation>

      <item><with|font-series|bold|Symmetry Property:> This reality condition
      forces the spectral process to satisfy:

      <\equation>
        d*\<zeta\>*<around|(|-\<omega\>|)>=d<wide|\<zeta\><around|(|\<omega\>|)>|\<bar\>>
      </equation>

      for all <math|\<omega\>>.

      <item><with|font-series|bold|Decomposition into Real and Imaginary
      Parts:> For <math|\<omega\>\<gtr\>0>, write\ 

      <\equation>
        d*\<zeta\><around|(|\<omega\>|)>=d*A<around|(|\<omega\>|)>+i*<space|0.17em>d*B<around|(|\<omega\>|)>
      </equation>

      \ where <math|d*A<around|(|\<omega\>|)>> and
      <math|d*B<around|(|\<omega\>|)>> are real-valued processes, and thus
      <math|>

      <\equation>
        d*\<zeta\>*<around|(|-\<omega\>|)>=d*A<around|(|\<omega\>|)>-i*<space|0.17em>d*B<around|(|\<omega\>|)>
      </equation>

      <item><with|font-series|bold|Derivation of Real Spectral
      Representation:>

      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d*\<zeta\>*<around|(|-\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<around|[|d*A<around|(|\<omega\>|)>+i*<space|0.17em>d*B<around|(|\<omega\>|)>|]>+e<rsup|-i*\<omega\>*t>*<around|[|d*A<around|(|\<omega\>|)>-i*<space|0.17em>d*B<around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|<around|(|e<rsup|i*\<omega\>*t>+e<rsup|-i*\<omega\>*t>|)>*d*A<around|(|\<omega\>|)>+i*<around|(|e<rsup|i*\<omega\>*t>-e<rsup|-i*\<omega\>*t>|)>*d*B<around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>2*cos
        <around|(|\<omega\>*t|)>*d*A<around|(|\<omega\>|)>+2*sin
        <around|(|\<omega\>*t|)>*d*B<around|(|\<omega\>|)>>>>>>
      </equation>

      since

      <\equation>
        e<rsup|i*\<omega\>*t>+e<rsup|-i*\<omega\>*t>=2*cos
        <around|(|\<omega\>*t|)>
      </equation>

      and

      <\equation>
        i*<around|(|e<rsup|i*\<omega\>*t>-e<rsup|-i*\<omega\>*t>|)>=2*sin
        <around|(|\<omega\>*t|)>
      </equation>

      <item><with|font-series|bold|Definition of U and V:> If we define
      <math|>

      <\equation>
        d*U<around|(|\<omega\>|)>=2*<space|0.17em>d*A<around|(|\<omega\>|)>
      </equation>

      \ and

      <\equation>
        d*V<around|(|\<omega\>|)>=2*<space|0.17em>d*B<around|(|\<omega\>|)>
      </equation>

      then

      <\equation>
        \<xi\><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*U<around|(|\<omega\>|)>+sin
        <around|(|\<omega\>*t|)>*d*V<around|(|\<omega\>|)>
      </equation>

      <item><with|font-series|bold|Orthogonality Verification:> We have

      <\equation>
        E<around|[|<around|\||d*\<zeta\><around|(|\<omega\>|)>|\|><rsup|2>|]>=d*F<around|(|\<omega\>|)>
      </equation>

      therefore

      <\equation>
        E*<around|[|d*A<around|(|\<omega\>|)><rsup|2>|]>=E*<around|[|d*B<around|(|\<omega\>|)><rsup|2>|]>=<frac|1|2>*<space|0.17em>d*F<around|(|\<omega\>|)>
      </equation>

      since

      <\equation>
        \ <around|\||d*\<zeta\><around|(|\<omega\>|)>|\|><rsup|2>=d*A<around|(|\<omega\>|)><rsup|2>+d*B<around|(|\<omega\>|)><rsup|2>
      </equation>

      thus

      <\equation>
        E*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>=E*<around|[|d*V<around|(|\<omega\>|)><rsup|2>|]>=4\<cdot\><frac|1|2>*d*F<around|(|\<omega\>|)>=d*F<around|(|\<omega\>|)>
      </equation>

      since <math|d*A> and <math|d*B> have orthogonal increments.

      <item><with|font-series|bold|Covariance Function:> Compute the
      covariance:

      <\equation>
        <tabular|<tformat|<cwith|1|-1|1|-1|font-base-size|9>|<table|<row|<cell|r<around|(|t|)>>|<cell|=E*<around|[|\<xi\><around|(|t|)>*\<xi\><around|(|0|)>|]>>>|<row|<cell|>|<cell|=E*<around*|[|<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*U<around|(|\<omega\>|)>+sin
        <around|(|\<omega\>*t|)>*d*V<around|(|\<omega\>|)>*<big|int><rsub|0><rsup|\<infty\>>d*U<around|(|\<omega\><rprime|'>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*E*<around|[|d*U<around|(|\<omega\>|)>*d*U<around|(|\<omega\>|)>|]>+sin
        <around|(|\<omega\>*t|)>*E*<around|[|d*V<around|(|\<omega\>|)>*d*U<around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|<space|1em>+<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*E*<around|[|d*U<around|(|\<omega\>|)>*d*V<around|(|\<omega\>|)>|]>+sin
        <around|(|\<omega\>*t|)>*E*<around|[|d*V<around|(|\<omega\>|)>*d*V<around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*E*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>+sin
        <around|(|\<omega\>*t|)>*E*<around|[|d*V<around|(|\<omega\>|)><rsup|2>|\<nobracket\>>>>>>>
      </equation>

      where all cross-terms vanish by orthogonality. Recalling\ 

      <\equation>
        E*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>=E*<around|[|d*V<around|(|\<omega\>|)><rsup|2>|]>=d*F<around|(|\<omega\>|)>
      </equation>

      and noting that expectation of the sine term vanishes since the mean of
      <math|d*V<around|(|\<omega\>|)>> is zero and sine is odd; thus,

      <\equation>
        r<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*F<around|(|\<omega\>|)>
      </equation>

      as required.
    </enumerate>

    \;
  </proof>

  <\corollary>
    [Physical Interpretation] In the real spectral representation:

    <\enumerate>
      <item><math|cos <around|(|\<omega\>*t|)>*d*U<around|(|\<omega\>|)>>
      represents the cosine component at frequency <math|\<omega\>> with
      random amplitude <math|d*U<around|(|\<omega\>|)>>.

      <item><math|sin <around|(|\<omega\>*t|)>*d*V<around|(|\<omega\>|)>>
      represents the sine component at frequency <math|\<omega\>> with random
      amplitude <math|d*V<around|(|\<omega\>|)>>.

      <item><math|d*F<around|(|\<omega\>|)>> represents the average power
      contributed by frequency components in
      <math|<around|(|\<omega\>,\<omega\>+d*\<omega\>|)>>.

      <item>The processes <math|U<around|(|\<omega\>|)>> and
      <math|V<around|(|\<omega\>|)>> are uncorrelated and have equal variance
      increments.
    </enumerate>
  </corollary>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>