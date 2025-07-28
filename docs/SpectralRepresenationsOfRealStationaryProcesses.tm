<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Spectral Representation for Real-Valued Stationary
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    <dueto|Real Spectral Representation for Stationary Processes>Let
    <math|<around|{|\<xi\><around|(|t|)>,t\<in\>\<bbb-R\>|}>> be a
    real-valued, zero-mean, second-order stationary process with covariance
    function <math|r<around|(|t|)>=\<bbb-E\>*<around|[|\<xi\><around|(|t|)>*\<xi\><around|(|0|)>|]>>
    and spectral distribution function <math|F<around|(|\<omega\>|)>>. Then
    there exist real-valued random measures
    <math|<around|{|U<around|(|\<omega\>|)>,\<omega\>\<geq\>0|}>> and
    <math|<around|{|V<around|(|\<omega\>|)>,\<omega\>\<geq\>0|}>> with
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
        <tformat|<table|<row|<cell|\<bbb-E\><around|[|U<around|(|\<omega\>|)>|]>>|<cell|=\<bbb-E\><around|[|V<around|(|\<omega\>|)>|]>=0<eq-number>>>|<row|<cell|\<bbb-E\>*<around|[|d*U<around|(|\<omega\><rsub|1>|)>*<space|0.17em>d*U<around|(|\<omega\><rsub|2>|)>|]>>|<cell|=\<bbb-E\>*<around|[|d*V<around|(|\<omega\><rsub|1>|)>*<space|0.17em>d*V<around|(|\<omega\><rsub|2>|)>|]>=\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*F<around|(|\<omega\><rsub|1>|)><eq-number>>>|<row|<cell|\<bbb-E\>*<around|[|d*U<around|(|\<omega\><rsub|1>|)>*<space|0.17em>d*V<around|(|\<omega\><rsub|2>|)>|]>>|<cell|=0*<space|1em><text|for
        all >\<omega\><rsub|1>,\<omega\><rsub|2>\<geq\>0<eq-number>>>>>
      </align>
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-series|bold|Construction from Complex Representation:>
      From the complex spectral representation theorem, there holds

      <\equation>
        \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>
      </equation>

      where <math|\<zeta\><around|(|\<omega\>|)>> is a complex-valued random
      measure with orthogonal increments and
      <math|\<bbb-E\>*<around|[|d*\<zeta\><around|(|\<omega\><rsub|1>|)>*d<wide|\<zeta\><around|(|\<omega\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*F<rsub|t*w*o><around|(|\<omega\>|)>>
      for the two-sided spectral distribution function
      <math|F<rsub|t*w*o><around|(|\<omega\>|)>>.

      <item><with|font-series|bold|Reality Condition:> As
      <math|\<xi\><around|(|t|)>> is real-valued,

      <\equation>
        \<xi\><around|(|t|)>=<wide|\<xi\><around|(|t|)>|\<bar\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<wide|\<zeta\><around|(|\<omega\>|)>|\<bar\>>
      </equation>

      <item><with|font-series|bold|Symmetry Property:> This reality condition
      requires the spectral random measure to satisfy

      <\equation>
        d*\<zeta\>*<around|(|-\<omega\>|)>=d<wide|\<zeta\><around|(|\<omega\>|)>|\<bar\>>
      </equation>

      for all <math|\<omega\>>.

      <item><with|font-series|bold|Factorization into Real Random Measures:>
      For <math|\<omega\>\<gtr\>0>, define

      <\align>
        <tformat|<table|<row|<cell|d*U<around|(|\<omega\>|)>>|<cell|=d*\<zeta\><around|(|\<omega\>|)>+d*\<zeta\>*<around|(|-\<omega\>|)>=2*<space|0.17em>\<Re\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]><eq-number>>>|<row|<cell|d*V<around|(|\<omega\>|)>>|<cell|=i*<around|[|d*\<zeta\><around|(|\<omega\>|)>-d*\<zeta\>*<around|(|-\<omega\>|)>|]>=-2*<space|0.17em>\<Im\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]><eq-number>>>>>
      </align>

      where <math|\<Re\>> and <math|\<Im\>> denote the real and imaginary
      parts.

      <item><with|font-series|bold|Derivation of Real Spectral
      Representation:>

      <\equation>
        <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d*\<zeta\>*<around|(|-\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<zeta\><around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<wide|\<zeta\><around|(|\<omega\>|)>|\<bar\>>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|e<rsup|i*\<omega\>*t>+e<rsup|-i*\<omega\>*t>|]>*\<Re\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>+<big|int><rsub|0><rsup|\<infty\>>i*<around|[|e<rsup|i*\<omega\>*t>-e<rsup|-i*\<omega\>*t>|]>*\<Im\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>2*cos
        <around|(|\<omega\>*t|)>*\<Re\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>-<big|int><rsub|0><rsup|\<infty\>>2*sin
        <around|(|\<omega\>*t|)>*\<Im\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*U<around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>sin
        <around|(|\<omega\>*t|)>*d*V<around|(|\<omega\>|)>>>>>>
      </equation>

      <item><with|font-series|bold|Orthogonality Verification:> For the
      real-valued process with one-sided representation, the spectral
      distribution function <math|F<around|(|\<omega\>|)>> is related to the
      two-sided function by <math|d*F<around|(|\<omega\>|)>=2*d*F<rsub|t*w*o><around|(|\<omega\>|)>>
      for <math|\<omega\>\<gtr\>0>. Since the real and imaginary parts of
      <math|d*\<zeta\><around|(|\<omega\>|)>> are orthogonal with equal
      variances:

      <\equation>
        \<bbb-E\><around|[|<around|[|\<Re\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>|]><rsup|2>|]>=\<bbb-E\><around|[|<around|[|\<Im\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>|]><rsup|2>|]>=<frac|1|2>*d*F<rsub|t*w*o><around|(|\<omega\>|)>=<frac|1|4>*d*F<around|(|\<omega\>|)>
      </equation>

      Therefore,

      <\equation>
        \<bbb-E\>*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>=\<bbb-E\>*<around|[|d*V<around|(|\<omega\>|)><rsup|2>|]>=4\<cdot\><frac|1|4>*d*F<around|(|\<omega\>|)>=d*F<around|(|\<omega\>|)>
      </equation>

      <item><with|font-series|bold|Covariance Function:> The covariance is
      given by

      <\equation>
        <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|r<around|(|t|)>>|<cell|=\<bbb-E\>*<around|[|\<xi\><around|(|t|)>*\<xi\><around|(|0|)>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<around*|(|<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*U<around|(|\<omega\>|)>+sin
        <around|(|\<omega\>*t|)>*d*V<around|(|\<omega\>|)>|)>*<big|int><rsub|0><rsup|\<infty\>>d*U<around|(|\<omega\><rprime|'>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*\<bbb-E\>*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>>>>>>
      </equation>

      where cross-terms vanish by orthogonality and the sine term vanishes
      since <math|sin <around|(|\<omega\>\<cdot\>0|)>=0>. Using
      <math|\<bbb-E\>*<around|[|d*U<around|(|\<omega\>|)><rsup|2>|]>=d*F<around|(|\<omega\>|)>>:

      <\equation>
        r<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
        <around|(|\<omega\>*t|)>*d*F<around|(|\<omega\>|)>
      </equation>
    </enumerate>
  </proof>

  <\corollary>
    <dueto|Physical Interpretation>In the real spectral representation:

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

      <item>The random measures <math|U<around|(|\<omega\>|)>> and
      <math|V<around|(|\<omega\>|)>> are uncorrelated and have equal variance
      increments.
    </enumerate>
  </corollary>

  <\theorem>
    <dueto|U and V Random Measures>For a real-valued stationary process
    <math|\<xi\><around|(|t|)>> with mean-square continuous sample paths and
    spectral representation

    <\equation>
      \<xi\><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><around|[|cos
      <around|(|\<omega\>*t|)>*<space|0.17em>d*U<around|(|\<omega\>|)>+sin
      <around|(|\<omega\>*t|)>*<space|0.17em>d*V<around|(|\<omega\>|)>|]>
    </equation>

    the random measures <math|U<around|(|\<omega\>|)>> and
    <math|V<around|(|\<omega\>|)>> are given explicitly by:

    <\enumerate>
      <item><with|font-series|bold|U-process formula:>

      <\equation>
        U<around|(|\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
        <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
        <around|(|\<omega\>*t|)>|t>*\<xi\><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item><with|font-series|bold|V-process formula:>

      <\equation>
        V<around|(|\<omega\>|)>=-lim<rsub|T\<to\>\<infty\>>
        <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-cos
        <around|(|\<omega\>*t|)>|t>*\<xi\><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item><with|font-series|bold|Incremental form:>

      <\align>
        <tformat|<table|<row|<cell|U<around|(|\<omega\><rsub|2>|)>-U<around|(|\<omega\><rsub|1>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
        <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
        <around|(|\<omega\><rsub|2>*t|)>-sin
        <around|(|\<omega\><rsub|1>*t|)>|t>*\<xi\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|V<around|(|\<omega\><rsub|2>|)>-V<around|(|\<omega\><rsub|1>|)>>|<cell|=-lim<rsub|T\<to\>\<infty\>>
        <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|cos
        <around|(|\<omega\><rsub|1>*t|)>-cos
        <around|(|\<omega\><rsub|2>*t|)>|t>*\<xi\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>>>
      </align>
    </enumerate>
  </theorem>

  <\proof>
    The formulas follow from the Fourier inversion theorem applied to the
    complex spectral measure. Starting from the complex inversion formula:

    <\equation>
      \<zeta\><around|(|\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-e<rsup|-i*\<omega\>*t>|-i*t>*\<xi\><around|(|t|)>*d*t
    </equation>

    Using the definitions <math|d*U<around|(|\<omega\>|)>=2*\<Re\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>>
    and <math|d*V<around|(|\<omega\>|)>=-2*\<Im\>*<around|[|d*\<zeta\><around|(|\<omega\>|)>|]>>,
    and the identity <math|1-e<rsup|-i*\<omega\>*t>=<around|(|1-cos
    <around|(|\<omega\>*t|)>|)>+i*sin <around|(|\<omega\>*t|)>>, we obtain:

    <\align>
      <tformat|<table|<row|<cell|U<around|(|\<omega\>|)>>|<cell|=2*\<Re\>*<around*|[|lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-e<rsup|-i*\<omega\>*t>|-i*t>*\<xi\><around|(|t|)>*d*t|]>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
      <around|(|\<omega\>*t|)>|t>*\<xi\><around|(|t|)>*d*t<eq-number>>>|<row|<cell|V<around|(|\<omega\>|)>>|<cell|=-2*\<Im\>*<around*|[|lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-e<rsup|-i*\<omega\>*t>|-i*t>*\<xi\><around|(|t|)>*d*t|]>=-lim<rsub|T\<to\>\<infty\>>
      <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-cos
      <around|(|\<omega\>*t|)>|t>*\<xi\><around|(|t|)>*d*t<eq-number>>>>>
    </align>
  </proof>

  <\remark>
    The objects <math|U<around|(|\<omega\>|)>> and
    <math|V<around|(|\<omega\>|)>> appearing in the real spectral
    representation of a stationary process,

    <\equation>
      \<xi\><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<omega\>*t|)>*<space|0.17em>d*U<around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<omega\>*t|)>*<space|0.17em>d*V<around|(|\<omega\>|)>
    </equation>

    are <with|font-shape|italic|random measures> (or random set functions) on
    the frequency axis <math|<around|[|0,\<infty\>|)>>. Their main property
    is that their increments over disjoint frequency intervals are
    orthogonal, i.e., uncorrelated (and independent if Gaussian). The
    notation <math|U<around|(|\<omega\>|)>> denotes the cumulative random
    measure up to frequency <math|\<omega\>>:

    <\equation>
      U<around|(|\<omega\>|)>=U<around|(|<around|[|0,\<omega\>|]>|)>*<space|2em>V<around|(|\<omega\>|)>=V<around|(|<around|[|0,\<omega\>|]>|)>
    </equation>

    For a stationary process with mean-square continuous sample paths, each
    sample path uniquely determines the corresponding random measures through
    the inversion formulas given above.
  </remark>
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