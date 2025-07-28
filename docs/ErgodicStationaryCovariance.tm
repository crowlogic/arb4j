<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Covariance of Ergodic Stationary
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This short note presents a fundamental result concerning the covariance
    of real-valued, zero-mean, strictly stationary, and ergodic stochastic
    processes with finite second moments. It is shown that, for such
    processes, the ensemble covariance function can be consistently recovered
    from a single, sufficiently long sample path. Specifically, the temporal
    average of products of observations at time-lagged points converges
    almost surely to the ensemble covariance as the observation window
    extends to infinity. This result relies upon the application of the
    Birkhoff\UKhinchin ergodic theorem to sample paths of the process,
    ensuring that, for almost every realization, the empirical and ensemble
    covariances coincide in the limit.\ 
  </abstract>

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
      <tabular|<tformat|<table|<row|<cell|\<bbb-E\><around|[|<around|\||\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|\|>|]>>|<cell|\<leq\><sqrt|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<cdot\>\<bbb-E\><around|[|\<xi\><rsup|2><around|(|\<tau\>|)>|]>>>>|<row|<cell|>|<cell|=<sqrt|\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<cdot\>\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>>>>|<row|<cell|>|<cell|=\<bbb-E\><around|[|\<xi\><rsup|2><around|(|0|)>|]>\<less\>\<infty\>>>>>>
    </equation>

    Therefore, the random variable <math|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>>
    is integrable.

    <with|font-series|bold|Step 2: Define the measurable function and shift
    operator.><next-line>Consider the function
    <math|f:\<bbb-R\>\<to\>\<bbb-R\>> defined by

    <\equation>
      f<around|(|s|)>=\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>
    </equation>

    \ for fixed <math|\<tau\>>. Let <math|T<rsub|h>> denote the shift
    operator defined by

    <\equation>
      <around|(|T<rsub|h>*\<xi\>|)><around|(|t|)>=\<xi\>*<around|(|t+h|)>
    </equation>

    \ for <math|h\<in\>\<bbb-R\>>. The strict stationarity condition implies
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

    <\equation>
      f<around|(|s|)>=\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>
    </equation>

    the ergodic theorem states that

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>f<around|(|s|)>*<space|0.17em>d*s=\<bbb-E\><around|[|f<around|(|0|)>|]>
    </equation>

    almost surely with respect to the probability measure of the process.
    Substituting our function:

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|<big|int><rsub|-T><rsup|T>\<xi\><around|(|s|)>*\<xi\>*<around|(|s+\<tau\>|)>*<space|0.17em>d*s|2*T>*=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>
    </equation>

    almost surely.

    <with|font-series|bold|Step 5: Connect to sample path
    realization.><next-line>For any particular realization
    <math|x<around|(|t|)>=\<xi\><around|(|t,\<omega\>|)>> where
    <math|\<omega\>> belongs to the set of full measure on which the ergodic
    theorem holds, we have

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|<big|int><rsub|-T><rsup|T>x<around|(|s|)>*x*<around|(|s+\<tau\>|)>*<space|0.17em>d*s|2*T>*=\<bbb-E\>*<around|[|\<xi\><around|(|0|)>*\<xi\><around|(|\<tau\>|)>|]>
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
      <frac|<big|int><rsub|-T><rsup|T>x<around|(|t|)>*x*<around|(|t+\<tau\>|)>*<space|0.17em>d*t|2*T>*
    </equation>

    almost surely. The exceptional set (where this equality fails) has
    probability zero by the ergodic theorem.
  </proof>

  <\remark>
    The almost sure convergence implies that for any specific realization
    drawn from the process, the temporal average will equal the ensemble
    covariance function.
  </remark>

  <\definition>
    Let <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> be a probability space.

    A property is said to hold <em|almost surely> if the set of outcomes
    <math|\<omega\>\<in\>\<Omega\>> for which the property fails has
    probability zero; that is, there exists a measurable set
    <math|A\<subset\>\<Omega\>> with <math|P<around|(|A|)>=0> such that the
    property in question holds for all <math|\<omega\>\<in\>\<Omega\>\<setminus\>A>.

    A sequence of random variables <math|<around|{|X<rsub|n>|}>> is said to
    converge <em|almost surely> to a random variable <math|X> if

    <\equation*>
      P<around*|(|<around*|{|\<omega\>\<in\>\<Omega\>:lim<rsub|n\<to\>\<infty\>>
      X<rsub|n><around|(|\<omega\>|)>=X<around|(|\<omega\>|)>|}>|)>=1.
    </equation*>

    This means the set of outcomes <math|\<omega\>> for which
    <math|X<rsub|n><around|(|\<omega\>|)>> fails to converge to
    <math|X<around|(|\<omega\>|)>> have no probability of occuring.
  </definition>

  <\remark>
    A property holds almost surely if the set of outcomes where it fails has
    probability zero. Formally, any exception set\Vwhere the property does
    not hold\Vis a null set with respect to the probability measure and
    therefore contributes nothing to any probability-weighted quantity such
    as an integral or expectation. In probability theory, such null sets are
    considered to have no meaningful effect; they might as well not exist as
    far as measure-theoretic statements are concerned.

    Analogous to a removable singularity in analysis, these exception sets
    are topologically or measure-theoretically isolated\Vthey have no length,
    area, volume, or, more generally, no measure, and thus do not affect the
    global behavior. The focus is on the behavior on sets of full measure,
    and the definition is constructed so that the presence or absence of such
    exception sets does not alter probabilistic statements.
  </remark>

  <\thebibliography|9>
    <bibitem|doob>Joseph L. Doob, <with|font-shape|italic|Stochastic
    Processes>, Wiley, 1953.

    <bibitem|cornfeld>Ilya P. Cornfeld, Sergei V. Fomin, Yakov G. Sinai,
    <with|font-shape|italic|Ergodic Theory>, Springer, 1982.

    <bibitem|krengel>Ulrich Krengel, <with|font-shape|italic|Ergodic
    Theorems>, de Gruyter, 1985.

    <bibitem|yosida>Kôsaku Yosida, <with|font-shape|italic|Ergodic Theorems>,
    Springer, 1965.

    <bibitem|cohn>Donald L. Cohn, <with|font-shape|italic|Measure Theory>,
    Birkhäuser, 2013. [See Chapter 9 for ergodic theorems in continuous time]
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|5|3>>
    <associate|bib-cohn|<tuple|cohn|3>>
    <associate|bib-cornfeld|<tuple|cornfeld|3>>
    <associate|bib-doob|<tuple|doob|3>>
    <associate|bib-krengel|<tuple|krengel|3>>
    <associate|bib-yosida|<tuple|yosida|3>>
    <associate|thm:covariance|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>