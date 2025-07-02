<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Covariance of Ergodic Stationary
  Processes>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <\definition>
    A stochastic process <math|\<xi\><around|(|t|)>>,
    <math|t\<in\>\<bbb-R\>>, is called <em|strictly stationary> if for all
    <math|t<rsub|1>,t<rsub|2>,\<ldots\>,t<rsub|n>> and all
    <math|\<tau\>\<in\>\<bbb-R\>>,

    <\equation>
      <around|(|\<xi\>*<around|(|t<rsub|1>+\<tau\>|)>,\<ldots\>,\<xi\>*<around|(|t<rsub|n>+\<tau\>|)>|)><above|=|d><around|(|\<xi\><around|(|t<rsub|1>|)>,\<ldots\>,\<xi\><around|(|t<rsub|n>|)>|)>
    </equation>

    A strictly stationary process is called <em|ergodic> if every invariant
    event under the temporal shift transformation has probability zero or
    one.
  </definition>

  <\theorem>
    <dueto|Exact Covariance Function from a Single Sample
    Path><label|thm:covariance>Let <math|\<xi\><around|(|t|)>> be a
    real-valued, zero-mean, strictly stationary, and ergodic process with
    <math|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<less\>\<infty\>>.
    Let <math|x<around|(|t|)>> be a realization of
    <math|\<xi\><around|(|t|)>>. Then for every fixed
    <math|\<tau\>\<in\>\<bbb-R\>>,

    <\equation>
      r<around|(|\<tau\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>x<around|(|t|)>*x*<around|(|t+\<tau\>|)>*<space|0.17em>d*t
    </equation>

    almost surely, where <math|r<around|(|\<tau\>|)>=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>>
    is the covariance function.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Establish integrability
    conditions.><next-line>Since <math|\<xi\><around|(|t|)>> is strictly
    stationary, <math|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|t|)>|]>=\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<less\>\<infty\>>
    for all <math|t\<in\>\<bbb-R\>>. For any fixed
    <math|\<tau\>\<in\>\<bbb-R\>>, the Cauchy-Schwarz inequality yields

    <\equation>
      \<bbb-E\><around|[|<around|\||\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|\|>|]>\<leq\><sqrt|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<cdot\>\<bbb-E\><around|[|\<xi\><rsup|2><around|(|\<tau\>|)>|]>>=<sqrt|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<cdot\>\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>>=\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<less\>\<infty\>
    </equation>

    Therefore, the random variable <math|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>>
    is integrable.

    <with|font-series|bold|Step 2: Define the measurable function and shift
    operator.><next-line>Consider the function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> defined by
    <math|f<around|(|s|)>=\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>>
    for fixed <math|\<tau\>>. Let <math|T<rsub|h>> denote the shift operator
    defined by <math|<around|(|T<rsub|h>*\<xi\>|)><around|(|t|)>=\<xi\>*<around|(|t+h|)>>
    for <math|h\<in\>\<bbb-R\>>. The strict stationarity condition implies
    that the measure induced by <math|\<xi\>> is invariant under
    <math|T<rsub|h>> for all <math|h>.

    <with|font-series|bold|Step 3: Verify ergodicity
    conditions.><next-line>Since <math|\<xi\><around|(|t|)>> is ergodic, the
    shift-invariant <math|\<sigma\>>-algebra has trivial tail structure:
    every shift-invariant event has probability 0 or 1. This ensures that the
    conditions of the Birkhoff-Khinchin ergodic theorem are satisfied for the
    dynamical system <math|<around|(|\<Omega\>,\<cal-F\>,P,T<rsub|h>|)>>
    where <math|\<Omega\>> is the sample space of the process.

    <with|font-series|bold|Step 4: Apply the Birkhoff-Khinchin ergodic
    theorem.><next-line>For the integrable function
    <math|f<around|(|s|)>=\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>>,
    the ergodic theorem states that

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>f<around|(|s|)>*<space|0.17em>d*s=\<bbb-E\><around|[|f<around|(|0|)>|]>
    </equation>

    almost surely with respect to the probability measure of the process.
    Substituting our function:

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>*<space|0.17em>d*s=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>
    </equation>

    almost surely.

    <with|font-series|bold|Step 5: Connect to sample path
    realization.><next-line>For any particular realization
    <math|x<around|(|t|)>=\<xi\><around|(|t,\<omega\>|)>> where
    <math|\<omega\>> belongs to the set of full measure on which the ergodic
    theorem holds, we have

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>x<around|(|s|)>*x*<around|(|s+\<tau\>|)>*<space|0.17em>d*s=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>
    </equation>

    <with|font-series|bold|Step 6: Establish covariance function
    equality.><next-line>By definition of the covariance function for a
    zero-mean process:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|r<around|(|\<tau\>|)>>|<cell|=<text|Cov><around|(|\<xi\><around|(|0|)>,\<xi\><around|(|\<tau\>|)>|)>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>-\<bbb-E\><around|[|\<xi\><around|(|0|)>|]>*\<bbb-E\><around|[|\<xi\><around|(|\<tau\>|)>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>-0\<cdot\>0>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>>>>>>
    </equation>

    <with|font-series|bold|Step 7: Conclude the main
    result.><next-line>Combining Steps 5 and 6:

    <\equation>
      r<around|(|\<tau\>|)>=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>x<around|(|t|)>*x*<around|(|t+\<tau\>|)>*<space|0.17em>d*t
    </equation>

    almost surely. The exceptional set (where this equality fails) has
    probability zero by the ergodic theorem.
  </proof>

  <\remark>
    The almost sure convergence implies that for any specific realization
    drawn from the process, the temporal average will equal the ensemble
    covariance function, provided the realization belongs to the set of full
    measure guaranteed by ergodicity.
  </remark>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|thm:covariance|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>