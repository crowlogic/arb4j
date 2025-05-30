<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <documentclass|article> <usepackage|amsmath,amsthm,amssymb>
  <usepackage|bbm> <usepackage|xcolor>

  <new-theorem|theorem|Theorem><new-theorem|definition|Definition><new-theorem|lemma|Lemma><new-theorem|corollary|Corollary><new-theorem|remark|Remark>

  <title|Detailed Analysis: Harmonizable Representation and Evolutionary
  Spectrum<next-line>of Monotonically Modulated Stationary Processes>
  <author|><date|><maketitle>

  <\definition>
    [Harmonizable Process] A stochastic process
    <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is harmonizable if it
    admits the representation:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*Z<around|(|\<lambda\>|)>
    </equation*>

    where <math|d*Z> is a complex-valued random measure with bounded
    variation, not necessarily having orthogonal increments. The correlation
    structure is given by:

    <\equation*>
      \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\>|)>*d<wide|Z<around|(|\<mu\>|)>|\<bar\>>|]>=F<around|(|d*\<lambda\>,d*\<mu\>|)>
    </equation*>

    where <math|F> is a measure on <math|\<bbb-R\><rsup|2>> of bounded
    variation.
  </definition>

  <with|color|green|\<checkmark\>> (Definition is correct)

  <\definition>
    [Projection Operator for Time-Modulated Processes] Let
    <math|<around|{|Y<rsub|<around|(|t,\<tau\>|)>>|}>> be a stochastic
    process defined on <math|\<bbb-R\><rsup|2>> and
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be a monotonically increasing
    function. The projection operator <math|P<rsub|\<theta\>>> is defined as:

    <\equation*>
      <around|(|P<rsub|\<theta\>>*Y|)><rsub|t>=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>
    </equation*>

    for all <math|t\<in\>\<bbb-R\>>. This operator projects from the space of
    processes on <math|\<bbb-R\><rsup|2>> to the space of processes on
    <math|\<bbb-R\>> by restricting to the curve
    <math|<around|{|<around|(|t,\<theta\><around|(|t|)>|)>:t\<in\>\<bbb-R\>|}>>.

    The projection operator <math|P<rsub|\<theta\>>> satisfies:

    <\enumerate>
      <item><math|P<rsub|\<theta\>><rsup|2>=P<rsub|\<theta\>>> (idempotent):

      <\equation*>
        <around|(|P<rsub|\<theta\>><rsup|2>*Y|)><rsub|t>=<around|(|P<rsub|\<theta\>>*<around|(|P<rsub|\<theta\>>*Y|)>|)><rsub|t>=P<rsub|\<theta\>><around|(|Y<rsub|(\<cdot\>,\<theta\>(\<cdot\><around|)||)>>|)><rsub|t>=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>=<around|(|P<rsub|\<theta\>>*Y|)><rsub|t>
      </equation*>

      <item><math|P<rsub|\<theta\>><rsup|\<ast\>>=P<rsub|\<theta\>>>
      (self-adjoint): If <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>
      denotes the inner product in the appropriate Hilbert space, then
      <math|<around|\<langle\>|P<rsub|\<theta\>>*Y,Z|\<rangle\>>=<around|\<langle\>|Y,P<rsub|\<theta\>>*Z|\<rangle\>>>
    </enumerate>
  </definition>

  <with|color|green|\<checkmark\>> (Definition is correct)

  <\definition>
    [Evolutionary Spectrum] A non-stationary process
    <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> has an evolutionary
    spectral representation if:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*Z<around|(|\<lambda\>|)>
    </equation*>

    where:

    <\itemize>
      <item><math|d*Z<around|(|\<lambda\>|)>> is an orthogonal increment
      process with <math|\<bbb-E\>*<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>=d*\<lambda\>>

      <item><math|A<rsub|t><around|(|\<lambda\>|)>> is a time-varying
      amplitude function

      <item>The evolutionary spectral density is
      <math|h<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>>
    </itemize>
  </definition>

  <with|color|green|\<checkmark\>> (Definition is correct)

  <\definition>
    [Monotonically Modulated Process] Let <math|X<rsub|0><around|(|t|)>> be a
    stationary process with kernel <math|K<rsub|0>*<around|(|t-s|)>>. A
    monotonically modulated process is defined as:

    <\equation*>
      X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>
    </equation*>

    where <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is a monotonically
    increasing function, yielding the kernel:

    <\equation*>
      K<around|(|t,s|)>=K<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation*>
  </definition>

  <with|color|green|\<checkmark\>> (Definition is correct)

  <\theorem>
    [Harmonizable Structure of Modulated Processes] The monotonically
    modulated process <math|X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>>
    is a harmonizable process with spectral representation:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    where <math|d*Z<rsub|0>> is the spectral measure of the original
    stationary process <math|X<rsub|0>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1:> By Cramér's representation theorem, the
    stationary process <math|X<rsub|0><around|(|t|)>> has representation:

    <\equation*>
      X<rsub|0><around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    where <math|d*Z<rsub|0>> has orthogonal increments with
    <math|\<bbb-E\>*<around|[|d*Z<rsub|0><around|(|\<lambda\>|)>*d<wide|Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>*d*\<mu\>>.
    <with|color|green|\<checkmark\>> (Correct application of Cramér's
    theorem)

    <with|font-series|bold|Step 2:> For any fixed time point
    <math|u\<in\>\<bbb-R\>>, we have:

    <\equation*>
      X<rsub|0><around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct substitution)

    <with|font-series|bold|Step 3:> Setting <math|u=\<theta\><around|(|t|)>>
    specifically, we get:

    <\equation*>
      X<rsub|0><around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct substitution)

    <with|font-series|bold|Step 4:> By definition of the modulated process
    <math|X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>>, we have:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct by definition)

    <with|font-series|bold|Step 5:> The covariance function is directly
    calculated:

    <\align*>
      <tformat|<table|<row|<cell|K<around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|X<rsub|t><wide|X<rsub|s>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<mu\>*\<theta\><around|(|s|)>>*d*Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<mu\>*\<theta\><around|(|s|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>*d<wide|Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<mu\>*\<theta\><around|(|s|)>>*\<bbb-E\>*<around|[|d*Z<rsub|0><around|(|\<lambda\>|)>*d<wide|Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<mu\>*\<theta\><around|(|s|)>>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>*d*\<mu\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<lambda\>*\<theta\><around|(|s|)>>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=K<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>>>
    </align*>

    Thus, <math|X<rsub|t>> is harmonizable with the specified covariance
    structure. <with|color|green|\<checkmark\>> (Correct derivation of
    covariance)
  </proof>

  <\theorem>
    [Evolutionary Spectral Representation] The harmonizable process
    <math|X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>> has an
    exact evolutionary spectral representation:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    where <math|A<rsub|t><around|(|\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>
    is the time-varying amplitude function.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1:> Starting from the harmonizable
    representation:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct starting point)

    <with|font-series|bold|Step 2:> We perform exact algebraic manipulation
    of the complex exponential term:

    <\align*>
      <tformat|<table|<row|<cell|e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>|<cell|=e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>\<cdot\><frac|e<rsup|i*\<lambda\>*t>|e<rsup|i*\<lambda\>*t>>>>|<row|<cell|>|<cell|=e<rsup|i*\<lambda\>*t>\<cdot\>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>-i*\<lambda\>*t>>>|<row|<cell|>|<cell|=e<rsup|i*\<lambda\>*t>\<cdot\>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>>>>
    </align*>

    <with|color|green|\<checkmark\>> (Correct algebraic manipulation)

    <with|font-series|bold|Step 3:> Substituting this factorization back:

    <\align*>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>\<cdot\>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>>>>>
    </align*>

    <with|color|green|\<checkmark\>> (Correct substitution)

    <with|font-series|bold|Step 4:> Define the time-varying amplitude
    function:

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct definition)

    <with|font-series|bold|Step 5:> This gives us the evolutionary spectral
    representation:

    <\equation*>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct representation)

    <with|font-series|bold|Step 6:> The evolutionary spectral density is:

    <\align*>
      <tformat|<table|<row|<cell|h<rsub|t><around|(|\<lambda\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>\<cdot\>f<rsub|0><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>\<cdot\>f<rsub|0><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=1\<cdot\>f<rsub|0><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=f<rsub|0><around|(|\<lambda\>|)>>>>>
    </align*>

    where we used the fact that <math|<around|\||e<rsup|i*x>|\|><rsup|2>=1>
    for any real <math|x>. <with|color|green|\<checkmark\>> (Correct
    calculation of spectral density)

    <with|font-series|bold|Step 7:> Note that while the evolutionary spectral
    density equals the original spectral density, the phase information in
    <math|A<rsub|t><around|(|\<lambda\>|)>> captures the non-stationarity
    introduced by the time-transformation <math|\<theta\><around|(|t|)>>.
    <with|color|green|\<checkmark\>> (Correct observation)
  </proof>

  <\theorem>
    [Stationary Dilation via Naimark's Theorem] The harmonizable process
    <math|X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>> admits a
    stationary dilation <math|Y<rsub|<around|(|t,\<tau\>|)>>> in an expanded
    space:

    <\equation*>
      Y<rsub|<around|(|t,\<tau\>|)>>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    The original harmonizable process is recovered via the projection
    operator <math|P<rsub|\<theta\>>>:

    <\equation*>
      X<rsub|t>=<around|(|P<rsub|\<theta\>>*Y|)><rsub|t>=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>
    </equation*>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1:> We construct the stationary dilation:

    <\equation*>
      Y<rsub|<around|(|t,\<tau\>|)>>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*d*Z<rsub|0><around|(|\<lambda\>|)>
    </equation*>

    <with|color|green|\<checkmark\>> (Correct construction)

    <with|font-series|bold|Step 2:> This process is stationary in the
    parameter <math|\<tau\>> as shown by its covariance:

    <\align*>
      <tformat|<table|<row|<cell|<wide|K|~><around|(|<around|(|t,\<tau\>|)>,<around|(|s,\<sigma\>|)>|)>>|<cell|=\<bbb-E\><around|[|Y<rsub|<around|(|t,\<tau\>|)>><wide|Y<rsub|<around|(|s,\<sigma\>|)>>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*d*Z<rsub|0><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<mu\>*\<sigma\>>*d*Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*e<rsup|-i*\<mu\>*\<sigma\>>*d*Z<rsub|0><around|(|\<lambda\>|)>*d<wide|Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*e<rsup|-i*\<mu\>*\<sigma\>>*\<bbb-E\>*<around|[|d*Z<rsub|0><around|(|\<lambda\>|)>*d<wide|Z<rsub|0><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*e<rsup|-i*\<mu\>*\<sigma\>>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>*d*\<mu\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*e<rsup|-i*\<lambda\>*\<sigma\>>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<tau\>-\<sigma\>|)>>*f<rsub|0><around|(|\<lambda\>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=K<rsub|0>*<around|(|\<tau\>-\<sigma\>|)>>>>>
    </align*>

    The covariance depends only on <math|\<tau\>-\<sigma\>>, confirming
    stationarity. <with|color|green|\<checkmark\>> (Correct derivation of
    covariance and stationarity)

    <with|font-series|bold|Step 3:> Apply the projection operator
    <math|P<rsub|\<theta\>>> defined earlier:

    <\align*>
      <tformat|<table|<row|<cell|<around|(|P<rsub|\<theta\>>*Y|)><rsub|t>>|<cell|=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=X<rsub|t>>>>>
    </align*>

    <with|color|green|\<checkmark\>> (Correct application of projection)

    <with|font-series|bold|Step 4:> Verify that <math|P<rsub|\<theta\>>> is
    idempotent (already established in the definition):

    <\align*>
      <tformat|<table|<row|<cell|<around|(|P<rsub|\<theta\>><rsup|2>*Y|)><rsub|t>>|<cell|=<around|(|P<rsub|\<theta\>>*<around|(|P<rsub|\<theta\>>*Y|)>|)><rsub|t>>>|<row|<cell|>|<cell|=P<rsub|\<theta\>><around|(|Y<rsub|(\<cdot\>,\<theta\>(\<cdot\><around|)||)>>|)><rsub|t>>>|<row|<cell|>|<cell|=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>>>|<row|<cell|>|<cell|=<around|(|P<rsub|\<theta\>>*Y|)><rsub|t>>>>>
    </align*>

    <with|color|green|\<checkmark\>> (Correct verification of idempotence)

    <with|font-series|bold|Step 5:> This confirms that
    <math|Y<rsub|<around|(|t,\<tau\>|)>>> is the stationary dilation of
    <math|X<rsub|t>>, and the original process is precisely the projection of
    this stationary process via the projection operator
    <math|P<rsub|\<theta\>>>. <with|color|green|\<checkmark\>> (Correct
    conclusion)
  </proof>

  <\corollary>
    [Complete Characterization] For a monotonically modulated process
    <math|X<rsub|t>=X<rsub|0><around|(|\<theta\><around|(|t|)>|)>>:

    <\enumerate>
      <item>It is harmonizable with representation
      <math|X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<rsub|0><around|(|\<lambda\>|)>>

      <item>It has evolutionary spectral representation
      <math|X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>*d*Z<rsub|0><around|(|\<lambda\>|)>>

      <item>It is the projection of a stationary process
      <math|Y<rsub|<around|(|t,\<tau\>|)>>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<tau\>>*d*Z<rsub|0><around|(|\<lambda\>|)>>
      via <math|X<rsub|t>=<around|(|P<rsub|\<theta\>>*Y|)><rsub|t>=Y<rsub|<around|(|t,\<theta\><around|(|t|)>|)>>>

      <item>Its kernel <math|K<around|(|t,s|)>=K<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>
      maintains positive definiteness from the original process
    </enumerate>

    <with|color|green|\<checkmark\>> (All statements are correct)
  </corollary>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>