<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Canonical Metric of Stationary Gaussian Processes:
  A Mathematical Exposition>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction
    and Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Variance Structure Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Canonical Metric> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Implications
    and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Examples>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction and Preliminaries>

  Let <math|<around|{|X<around|(|t|)>,t\<in\>T|}>> be a stationary Gaussian
  process defined on an index set <math|T> (typically
  <math|T\<subseteq\>\<bbb-R\><rsup|d>>). By stationarity, we mean that:

  <\itemize>
    <item>The mean function <math|\<mu\><around|(|t|)>=\<bbb-E\><around|[|X<around|(|t|)>|]>>
    is constant

    <item>The covariance function <math|C<around|(|s,t|)>=<text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>>
    depends only on the difference <math|s-t>
  </itemize>

  For simplicity, we assume the process is centered
  (<math|\<mu\><around|(|t|)>=0>) and normalized
  (Var<math|<around|[|X<around|(|t|)>|]>=1>). The covariance function can
  thus be written as <math|C<around|(|h|)>=\<bbb-E\>*<around|[|X*<around|(|t+h|)>*X<around|(|t|)>|]>>,
  depending only on the lag <math|h>.

  <section|The Variance Structure Function>

  <\definition>
    The variance structure function (also called variogram) of a stationary
    Gaussian process is defined as:

    <\equation>
      D<around|(|h|)>=<text|Var><around|[|X*<around|(|t+h|)>-X<around|(|t|)>|]>
    </equation>
  </definition>

  <\proposition>
    The variance structure function can be expressed in terms of the
    covariance function as:

    <\equation>
      D<around|(|h|)>=2*<around|(|C<around|(|0|)>-C<around|(|h|)>|)>
    </equation>
  </proposition>

  <\proof>
    <\align>
      <tformat|<table|<row|<cell|D<around|(|h|)>>|<cell|=<text|Var><around|[|X*<around|(|t+h|)>-X<around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around|[|<around|(|X*<around|(|t+h|)>-X<around|(|t|)>|)><rsup|2>|]><space|1em><text|(since
      <math|\<bbb-E\>*<around|[|X*<around|(|t+h|)>-X<around|(|t|)>|]>=0>)><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|X*<around|(|t+h|)><rsup|2>|]>-2*\<bbb-E\>*<around|[|X*<around|(|t+h|)>*X<around|(|t|)>|]>+\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<text|Var><around|[|X*<around|(|t+h|)>|]>+<text|Var><around|[|X<around|(|t|)>|]>-2*<text|Cov><around|(|X*<around|(|t+h|)>,X<around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=C<around|(|0|)>+C<around|(|0|)>-2*C<around|(|h|)><eq-number>>>|<row|<cell|>|<cell|=2*<around|(|C<around|(|0|)>-C<around|(|h|)>|)><eq-number>>>>>
    </align>
  </proof>

  <section|The Canonical Metric>

  <\definition>
    The canonical metric associated with a stationary Gaussian process is
    defined as:

    <\equation>
      d<around|(|h|)>=<sqrt|D<around|(|h|)>>=<sqrt|2*<around|(|C<around|(|0|)>-C<around|(|h|)>|)>>
    </equation>
  </definition>

  <\theorem>
    The function <math|d<around|(|h|)>=<sqrt|D<around|(|h|)>>> is a metric on
    the index set <math|T>.
  </theorem>

  <\proof>
    We need to verify the four metric axioms:

    <vspace*|1fn><no-indent>1. <with|font-series|bold|Non-negativity>: Since
    <math|D<around|(|h|)>> is a variance, <math|D<around|(|h|)>\<geq\>0>,
    thus <math|d<around|(|h|)>=<sqrt|D<around|(|h|)>>\<geq\>0>.

    <vspace*|1fn><no-indent>2. <with|font-series|bold|Identity of
    indiscernibles>:

    <\itemize>
      <item>If <math|h=0>, then <math|D<around|(|0|)>=<text|Var><around|[|X<around|(|t|)>-X<around|(|t|)>|]>=0>,
      thus <math|d<around|(|0|)>=0>.

      <item>Conversely, if <math|d<around|(|h|)>=0>, then
      <math|D<around|(|h|)>=0>, which means
      Var<math|<around|[|X*<around|(|t+h|)>-X<around|(|t|)>|]>=0>. This
      implies <math|X*<around|(|t+h|)>-X<around|(|t|)>> is constant almost
      surely. Since we're dealing with a stationary Gaussian process with
      continuous paths, this constant must be zero, which can only happen
      when <math|h=0>.
    </itemize>

    <no-indent>3. <with|font-series|bold|Symmetry>: Since
    <math|D*<around|(|-h|)>=<text|Var><around|[|X*<around|(|t-h|)>-X<around|(|t|)>|]>=<text|Var><around|[|X<around|(|t|)>-X*<around|(|t+h|)>|]>=D<around|(|h|)>>
    by stationarity, we have <math|d*<around|(|-h|)>=d<around|(|h|)>>.

    <vspace*|1fn><no-indent>4. <with|font-series|bold|Triangle inequality>:
    This is the most challenging part to prove. We need to show:

    <\equation>
      d*<around|(|h<rsub|1>+h<rsub|2>|)>\<leq\>d<around|(|h<rsub|1>|)>+d<around|(|h<rsub|2>|)>
    </equation>

    Let's approach this via the Hilbert space structure underlying Gaussian
    processes.

    Consider the Hilbert space <math|H> generated by the random variables
    <math|<around|{|X<around|(|t|)>,t\<in\>T|}>> with inner product
    <math|<around|\<langle\>|X<around|(|s|)>,X<around|(|t|)>|\<rangle\>>=\<bbb-E\>*<around|[|X<around|(|s|)>*X<around|(|t|)>|]>=C*<around|(|s-t|)>>.

    The squared distance between <math|X<around|(|s|)>> and
    <math|X<around|(|t|)>> in this Hilbert space is:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|X<around|(|s|)>-X<around|(|t|)>|\<\|\|\>><rsup|2>>|<cell|=\<bbb-E\><around|[|<around|(|X<around|(|s|)>-X<around|(|t|)>|)><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<text|Var><around|[|X<around|(|s|)>-X<around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=D*<around|(|s-t|)><eq-number>>>>>
    </align>

    Therefore, <math|d*<around|(|s-t|)>=<around|\<\|\|\>|X<around|(|s|)>-X<around|(|t|)>|\<\|\|\>>>.

    Using the triangle inequality in Hilbert space:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|X*<around|(|t+h<rsub|1>+h<rsub|2>|)>-X<around|(|t|)>|\<\|\|\>>>|<cell|\<leq\><around|\<\|\|\>|X*<around|(|t+h<rsub|1>+h<rsub|2>|)>-X*<around|(|t+h<rsub|1>|)>|\<\|\|\>>+<around|\<\|\|\>|X*<around|(|t+h<rsub|1>|)>-X<around|(|t|)>|\<\|\|\>><eq-number>>>|<row|<cell|d*<around|(|h<rsub|1>+h<rsub|2>|)>>|<cell|\<leq\>d<around|(|h<rsub|2>|)>+d<around|(|h<rsub|1>|)><eq-number>>>>>
    </align>

    The last step follows from stationarity, which gives:

    <\itemize>
      <item><math|<around|\<\|\|\>|X*<around|(|t+h<rsub|1>+h<rsub|2>|)>-X*<around|(|t+h<rsub|1>|)>|\<\|\|\>>=<around|\<\|\|\>|X*<around|(|t+h<rsub|2>|)>-X<around|(|t|)>|\<\|\|\>>=d<around|(|h<rsub|2>|)>>

      <item><math|<around|\<\|\|\>|X*<around|(|t+h<rsub|1>|)>-X<around|(|t|)>|\<\|\|\>>=d<around|(|h<rsub|1>|)>>
    </itemize>

    Therefore, <math|d<around|(|h|)>> satisfies the triangle inequality,
    completing the proof that it is a metric.
  </proof>

  <section|Implications and Applications>

  <\theorem>
    [Dudley] Let <math|<around|{|X<around|(|t|)>,t\<in\>T|}>> be a centered
    Gaussian process with canonical metric <math|d>. If the metric entropy
    integral converges:

    <\equation>
      <big|int><rsub|0><rsup|\<delta\>><sqrt|log
      N<around|(|T,d,\<varepsilon\>|)>>*<space|0.17em>d*\<varepsilon\>\<less\>\<infty\>
    </equation>

    where <math|N<around|(|T,d,\<varepsilon\>|)>> is the minimum number of
    <math|d>-balls of radius <math|\<varepsilon\>> needed to cover <math|T>,
    then the process has continuous sample paths almost surely.
  </theorem>

  This theorem connects the canonical metric to sample path regularity,
  demonstrating why this metric is fundamental in Gaussian process theory.

  <\corollary>
    If <math|D<around|(|h|)>\<sim\><around|\||h|\|><rsup|2*\<alpha\>>> as
    <math|h\<to\>0> for some <math|\<alpha\>\<gtr\>0>, then the sample paths
    of the process are Hölder continuous with exponent <math|\<beta\>> for
    any <math|\<beta\>\<less\>\<alpha\>>.
  </corollary>

  <section|Examples>

  <\enumerate>
    <item><with|font-series|bold|Brownian motion>:
    <math|D<around|(|h|)>=<around|\||h|\|>>, thus
    <math|d<around|(|h|)>=<sqrt|<around|\||h|\|>>>. This corresponds to
    sample paths that are Hölder continuous with exponent
    <math|\<beta\>\<less\>1/2>.

    <item><with|font-series|bold|Ornstein-Uhlenbeck process>:
    <math|D<around|(|h|)>=2*<around|(|1-e<rsup|-\<lambda\><around|\||h|\|>>|)>\<sim\>2*\<lambda\><around|\||h|\|>>
    as <math|h\<to\>0>, resulting in the same regularity as Brownian motion.

    <item><with|font-series|bold|Squared exponential covariance>:
    <math|C<around|(|h|)>=e<rsup|-<around|\||h|\|><rsup|2>/2>>, thus
    <math|D<around|(|h|)>=2*<around|(|1-e<rsup|-<around|\||h|\|><rsup|2>/2>|)>\<sim\><around|\||h|\|><rsup|2>>
    as <math|h\<to\>0>, corresponding to differentiable sample paths.
  </enumerate>

  <section|Conclusion>

  We have established that the square root of the variance structure function
  of a stationary Gaussian process indeed defines a canonical metric
  associated with the process. This metric not only provides a natural
  distance measure in the parameter space but also characterizes fundamental
  properties of the process, including sample path regularity, continuity,
  and differentiability.

  The canonical metric forms a bridge between the probabilistic properties of
  Gaussian processes and the geometry of their index sets, making it a
  central concept in the theory of Gaussian processes with applications
  ranging from stochastic analysis to spatial statistics and machine
  learning.
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

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-6|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      and Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Variance Structure Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Canonical Metric> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Implications
      and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>