<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Burkholder-Davis-Gundy Inequality>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Stochastic
    Process Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Martingales
    versus Markov Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Core Conceptual Differences
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Independence of Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>Intersection: Brownian Motion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Burkholder-Davis-Gundy Inequality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Proofs>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Proof: Local Martingale is Locally a
    Martingale <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|4.2<space|2spc>Proof: Markov and Martingale
    Properties are Independent <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|4.3<space|2spc>Proof: Burkholder-Davis-Gundy
    Inequality <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Examples:
    Gauss-Markov Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Application
    of the Inequality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Stochastic Process Definitions>

  <\definition>
    [Stochastic Process] A stochastic process
    <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>> is a collection of random
    variables indexed by time <math|t>, defined on a probability space
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> with a filtration
    <math|<around|(|\<cal-F\><rsub|t>|)><rsub|t\<geq\>0>>.
  </definition>

  <\definition>
    [Fair Game] A process is called a "fair game" if, at any time, the best
    prediction for its future value, given all current information, is its
    present value. Mathematical form: <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    is a martingale if for all <math|0\<leq\>s\<leq\>t>,

    <\equation*>
      \<bbb-E\><around|[|X<rsub|t>\<mid\>\<cal-F\><rsub|s>|]>=X<rsub|s>.
    </equation*>
  </definition>

  <\definition>
    [Local Martingale] A process <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    is a local martingale if there exists an increasing sequence of stopping
    times <math|<around|(|\<tau\><rsub|n>|)>> with
    <math|\<tau\><rsub|n>*\<uparrow\>*\<infty\>> almost surely, such that for
    each <math|n>, the stopped process <math|X<rsub|t\<wedge\>\<tau\><rsub|n>>>
    is a martingale.
  </definition>

  <\definition>
    [Gaussian Process] A process <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    is Gaussian if every finite collection
    <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>> has a
    multivariate normal distribution.
  </definition>

  <\definition>
    [Markov Process] A process <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    is Markov if for all <math|s\<less\>t> and all bounded measurable
    <math|f>,

    <\equation*>
      \<bbb-E\><around|[|f<around|(|X<rsub|t>|)>\<mid\>\<cal-F\><rsub|s>|]>=\<bbb-E\><around|[|f<around|(|X<rsub|t>|)>\<mid\>X<rsub|s>|]>.
    </equation*>
  </definition>

  <section|Martingales versus Markov Processes>

  The distinction between martingales and Markov processes represents one of
  the most fundamental conceptual separations in stochastic process theory.

  <subsection|Core Conceptual Differences>

  <with|font-series|bold|Memory Structure:> Markov processes exhibit the
  memoryless property\Vfuture evolution depends only on the current state,
  completely independent of the historical path. Martingales, conversely, can
  possess infinite memory while maintaining the fairness property that
  expected future values equal current values given all historical
  information.

  <with|font-series|bold|Conditioning Information:> For Markov processes,
  conditioning on the entire filtration <math|\<cal-F\><rsub|s>> yields the
  same result as conditioning solely on the current state <math|X<rsub|s>>.
  Martingales require conditioning on the complete filtration
  <math|\<cal-F\><rsub|s>> to maintain the expectation property.

  <with|font-series|bold|Mathematical Constraints:> The Markov property
  constrains the probabilistic dependence structure of the process, while the
  martingale property constrains the conditional expectation structure.

  <subsection|Independence of Properties>

  Neither property implies the other:

  <\enumerate>
    <item><with|font-series|bold|Martingales that are not Markov:> Consider
    <math|X<rsub|n+1>=X<rsub|n>+\<epsilon\><rsub|n+1>*X<rsub|0>> where
    <math|\<epsilon\><rsub|n>> are independent with
    <math|\<bbb-E\><around|[|\<epsilon\><rsub|n>|]>=0>. This process
    satisfies <math|\<bbb-E\><around|[|X<rsub|n+1>\|X<rsub|0>,\<ldots\>,X<rsub|n>|]>=X<rsub|n>>
    (martingale property), but determining <math|X<rsub|n+1>> requires
    knowledge of the initial value <math|X<rsub|0>>, not just
    <math|X<rsub|n>> (violates Markov property).

    <item><with|font-series|bold|Markov processes that are not martingales:>
    The Ornstein-Uhlenbeck process <math|d*X<rsub|t>=-\<alpha\>*X<rsub|t>*d*t+d*W<rsub|t>>
    satisfies the Markov property but <math|\<bbb-E\><around|[|X<rsub|t>\|X<rsub|s>|]>=e<rsup|-\<alpha\>*<around|(|t-s|)>>*X<rsub|s>\<neq\>X<rsub|s>>
    for <math|\<alpha\>\<neq\>0>.
  </enumerate>

  <subsection|Intersection: Brownian Motion>

  Standard Brownian motion represents the canonical example of a process that
  is simultaneously Markov and martingale. However, this confluence occurs
  due to the specific mathematical structure of Brownian motion, not because
  one property implies the other.

  <section|The Burkholder-Davis-Gundy Inequality>

  <\theorem>
    [Burkholder-Davis-Gundy] Let <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    be a real-valued local martingale with <math|X<rsub|0>=0> and quadratic
    variation process <math|<around|[|X|]><rsub|t>>. For any
    <math|p\<in\><around|(|1,\<infty\>|)>>, there exist constants
    <math|c<rsub|p>,C<rsub|p>\<gtr\>0> such that for any stopping time
    <math|\<tau\>>,

    <\equation*>
      c<rsub|p>*<space|0.17em>\<bbb-E\><around*|(|<around|[|X|]><rsub|\<tau\>><rsup|p/2>|)>\<leq\>\<bbb-E\><around*|(|<around|(|X<rsup|\<ast\>><rsub|\<tau\>>|)><rsup|p>|)>\<leq\>C<rsub|p>*<space|0.17em>\<bbb-E\><around*|(|<around|[|X|]><rsub|\<tau\>><rsup|p/2>|)>,
    </equation*>

    where <math|X<rsup|\<ast\>><rsub|\<tau\>>=sup<rsub|0\<leq\>t\<leq\>\<tau\>><around|\||X<rsub|t>|\|>>.
  </theorem>

  <section|Proofs>

  <subsection|Proof: Local Martingale is Locally a Martingale>

  Let <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>> be a local martingale. By
  definition, there exists a sequence of stopping times
  <math|<around|(|\<tau\><rsub|n>|)>> with
  <math|\<tau\><rsub|n>*\<uparrow\>*\<infty\>> almost surely such that for
  each <math|n>, <math|X<rsub|t\<wedge\>\<tau\><rsub|n>>> is a martingale.
  For each <math|n>, the stopped process is adapted and integrable, and the
  martingale property follows from the definition. The local martingale
  property is thus a weakening of the martingale property, requiring it only
  after random stopping.

  <subsection|Proof: Markov and Martingale Properties are Independent>

  <\enumerate>
    <item>The process <math|X<rsub|n+1>=X<rsub|n>+\<epsilon\><rsub|n+1>*X<rsub|0>>
    (as above) is a martingale but not Markov, since the conditional
    distribution of <math|X<rsub|n+1>> depends on <math|X<rsub|0>> and not
    just <math|X<rsub|n>>.

    <item>The Ornstein-Uhlenbeck process is Markov but not a martingale,
    since <math|\<bbb-E\><around|[|X<rsub|t>\|X<rsub|s>|]>=e<rsup|-\<alpha\>*<around|(|t-s|)>>*X<rsub|s>>
    for <math|t\<gtr\>s> and <math|\<alpha\>\<neq\>0>.

    <item>Brownian motion is both Markov and martingale, since increments are
    independent and mean zero, and the conditional expectation property holds
    for both definitions.
  </enumerate>

  <subsection|Proof: Burkholder-Davis-Gundy Inequality>

  <with|font-series|bold|Step 1: Reduction to Bounded Martingales>

  Let <math|X> be a local martingale. Define the sequence
  <math|\<tau\><rsub|n>=inf <around|{|t\<geq\>0:<around|\||X<rsub|t>|\|>\<geq\>n<text|or
  ><around|[|X|]><rsub|t>\<geq\>n<rsup|2>|}>>, so
  <math|X<rsup|\<tau\><rsub|n>>> is a bounded martingale. By monotone
  convergence, the result for <math|X<rsup|\<tau\><rsub|n>>> implies the
  result for <math|X>.

  <with|font-series|bold|Step 2: Upper Bound>

  For <math|p\<gtr\>1>, define <math|\<sigma\><rsub|\<lambda\>>=inf
  <around|{|t\<geq\>0:<around|[|X|]><rsub|t>\<geq\>\<lambda\>|}>>. By Doob's
  maximal inequality for the stopped martingale
  <math|X<rsup|\<sigma\><rsub|\<lambda\>>>>,

  <\equation*>
    \<bbb-P\>*<around|(|X<rsup|\<ast\>><rsub|\<sigma\><rsub|\<lambda\>>>\<geq\>\<alpha\>|)>\<leq\><frac|\<bbb-E\><around|[|<around|(|X<rsub|\<sigma\><rsub|\<lambda\>>>|)><rsup|2>|]>|\<alpha\><rsup|2>>.
  </equation*>

  Since <math|X<rsub|\<sigma\><rsub|\<lambda\>>><rsup|2>-<around|[|X|]><rsub|\<sigma\><rsub|\<lambda\>>>>
  is a martingale,

  <\equation*>
    \<bbb-E\><around|[|<around|(|X<rsub|\<sigma\><rsub|\<lambda\>>>|)><rsup|2>|]>=\<bbb-E\><around|[|<around|[|X|]><rsub|\<sigma\><rsub|\<lambda\>>>|]>\<leq\>\<lambda\>.
  </equation*>

  Hence,

  <\equation*>
    \<bbb-P\>*<around|(|X<rsup|\<ast\>><rsub|\<sigma\><rsub|\<lambda\>>>\<geq\>\<alpha\>|)>\<leq\><frac|\<lambda\>|\<alpha\><rsup|2>>.
  </equation*>

  Integrating over <math|\<alpha\>> and <math|\<lambda\>> yields the upper
  bound.

  <with|font-series|bold|Step 3: Lower Bound>

  Define <math|T<rsub|\<lambda\>>=inf <around|{|t\<geq\>0:X<rsup|\<ast\>><rsub|t>\<geq\>\<lambda\>|}>>.
  On <math|<around|{|T<rsub|\<lambda\>>\<less\>\<infty\>|}>>,
  <math|<around|\||X<rsub|T<rsub|\<lambda\>>>|\|>=\<lambda\>>. The optional
  stopping theorem and properties of quadratic variation yield

  <\equation*>
    \<lambda\><rsup|2>*\<bbb-P\>*<around|(|T<rsub|\<lambda\>>\<less\>\<infty\>|)>\<leq\>\<bbb-E\>*<around|[|<around|[|X|]><rsub|T<rsub|\<lambda\>>>*<with|math-font-family|bf|1><rsub|<around|{|T<rsub|\<lambda\>>\<less\>\<infty\>|}>>|]>.
  </equation*>

  Integration and appropriate test functions give the lower bound.

  <with|font-series|bold|Step 4: Extension to Continuous Martingales>

  For continuous martingales, Itô's formula for
  <math|<around|\||X<rsub|t>|\|><rsup|p>> and <math|<around|[|X|]><rsub|t>>
  allows the argument to extend to all <math|p\<gtr\>0>.

  <section|Examples: Gauss-Markov Processes>

  <\example>
    [Standard Brownian Motion] Let <math|<around|(|W<rsub|t>|)><rsub|t\<geq\>0>>
    denote standard Brownian motion. <math|W> is a continuous Gaussian
    martingale and Markov process, with <math|<around|[|W|]><rsub|t>=t>.

    <with|font-series|bold|Proof:> Brownian motion has independent
    increments, <math|\<bbb-E\><around|[|W<rsub|t>\|\<cal-F\><rsub|s>|]>=W<rsub|s>>
    for <math|t\<geq\>s>, and for any <math|0\<leq\>s\<less\>t>,
    <math|W<rsub|t>-W<rsub|s>> is independent of <math|\<cal-F\><rsub|s>> and
    normally distributed, satisfying both the martingale and Markov
    properties.
  </example>

  <\example>
    [Ornstein-Uhlenbeck Process] Let <math|<around|(|X<rsub|t>|)><rsub|t\<geq\>0>>
    satisfy <math|d*X<rsub|t>=-\<alpha\>*X<rsub|t>*d*t+d*W<rsub|t>>,
    <math|X<rsub|0>=0>. <math|X> is a continuous Gaussian Markov process but
    not a martingale.

    <with|font-series|bold|Proof:> The process is Gaussian and Markov by
    construction. The conditional expectation is
    <math|\<bbb-E\><around|[|X<rsub|t>\|X<rsub|s>|]>=e<rsup|-\<alpha\>*<around|(|t-s|)>>*X<rsub|s>>,
    which is not <math|X<rsub|s>> unless <math|\<alpha\>=0>, so it is not a
    martingale for <math|\<alpha\>\<neq\>0>.

    <with|font-series|bold|Uniqueness Property:> The Ornstein-Uhlenbeck
    process is the unique stationary Gauss-Markov process (up to scaling and
    shifting). This remarkable uniqueness theorem states that among all
    continuous-time Gaussian processes that are both Markov and stationary,
    only the OU process exists. The proof follows from the fact that
    stationarity requires the covariance function to depend only on time
    differences, while the Markov property constrains the correlation
    structure to be exponentially decaying. These two constraints together
    uniquely determine the OU covariance structure
    Cov<math|<around|(|X<rsub|s>,X<rsub|t>|)>=\<sigma\><rsup|2>*e<rsup|-\<alpha\>*<around|\||t-s|\|>>>,
    making the OU process the sole inhabitant of the intersection of
    stationary and Gauss-Markov processes.
  </example>

  <section|Application of the Inequality>

  <\example>
    [Brownian Motion] For <math|W<rsub|0>=0>,
    <math|<around|[|W|]><rsub|\<tau\>>=\<tau\>>, so

    <\equation*>
      c<rsub|p>*<space|0.17em>\<bbb-E\><around|[|\<tau\><rsup|p/2>|]>\<leq\>\<bbb-E\><around*|(|<around|(|sup<rsub|0\<leq\>t\<leq\>\<tau\>><around|\||W<rsub|t>|\|>|)><rsup|p>|)>\<leq\>C<rsub|p>*<space|0.17em>\<bbb-E\><around|[|\<tau\><rsup|p/2>|]>.
    </equation*>

    <with|font-series|bold|Proof:> Apply the Burkholder-Davis-Gundy
    inequality to <math|W> with <math|<around|[|W|]><rsub|\<tau\>>=\<tau\>>
    as above.
  </example>

  <\example>
    [General Continuous Gaussian Martingale] If
    <math|X<rsub|t>=<big|int><rsub|0><rsup|t>\<sigma\><around|(|s|)>*d*W<rsub|s>>
    with deterministic <math|\<sigma\><around|(|s|)>>, then
    <math|<around|[|X|]><rsub|t>=<big|int><rsub|0><rsup|t>\<sigma\><rsup|2><around|(|s|)>*d*s>.
    The inequality gives

    <\equation*>
      c<rsub|p>*<space|0.17em>\<bbb-E\><around*|(|<around*|(|<big|int><rsub|0><rsup|\<tau\>>\<sigma\><rsup|2><around|(|s|)>*d*s|)><rsup|p/2>|)>\<leq\>\<bbb-E\><around*|(|sup<rsub|0\<leq\>t\<leq\>\<tau\>><around|\||X<rsub|t>|\|><rsup|p>|)>\<leq\>C<rsub|p>*<space|0.17em>\<bbb-E\><around*|(|<around*|(|<big|int><rsub|0><rsup|\<tau\>>\<sigma\><rsup|2><around|(|s|)>*d*s|)><rsup|p/2>|)>.
    </equation*>

    <with|font-series|bold|Proof:> <math|X> is a continuous Gaussian
    martingale by Itô integration, with quadratic variation as stated. The
    Burkholder-Davis-Gundy inequality applies directly
  </example>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|4.3|3>>
    <associate|auto-11|<tuple|5|4>>
    <associate|auto-12|<tuple|6|5>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|3>>
    <associate|auto-6|<tuple|3|3>>
    <associate|auto-7|<tuple|4|3>>
    <associate|auto-8|<tuple|4.1|3>>
    <associate|auto-9|<tuple|4.2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Stochastic
      Process Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Martingales
      versus Markov Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Core Conceptual Differences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Independence of Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Intersection: Brownian
      Motion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Burkholder-Davis-Gundy Inequality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Proofs>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Proof: Local Martingale is
      Locally a Martingale <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Proof: Markov and Martingale
      Properties are Independent <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Proof:
      Burkholder-Davis-Gundy Inequality <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Examples:
      Gauss-Markov Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Application
      of the Inequality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>