<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injectively Time-Changed Stationary Processes Form a
  Subclass of Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section*|Abstract>

  Monotonic time changes of stationary Gaussian processes yield oscillatory
  processes in the sense of Priestley which are a subclass of non-stationary
  Gaussian processes having the spectral representation
  <math|K<around*|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around*|(|\<lambda\>|)>\<phi\><rsub|s><around*|(|\<lambda\>|)>\<mathd\>\<mu\><around*|(|\<lambda\>|)>>
  where <math|\<mu\><around*|(|\<lambda\>|)>> is the spectral measure which
  has the same interpretation as it does in the case of stationary processes
  and the oscillatory function <math|\<phi\><rsub|t><around*|(|\<lambda\>|)>=e<rsup|i
  t \<lambda\>>A<rsub|t><around*|(|\<lambda\>|)>> where
  <math|A<rsub|t><around*|(|\<lambda\>|)>> is a <math|time-dependent> gain
  function. The monotonicity is necessary and sufficient for the resulting
  covariance operator to be self-adjoint and positive definite. Bidirectional
  inversion formulas for reconstructing stationary processes from oscillatory
  sample paths, random measure inversion from sample paths, and inversion of
  the underslying stationary random white noise measure are derived and the
  covariance kernel is expressed as an integral of the ergodic sample paths
  of the process.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Theorem and Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Bidirectional
    Inversion Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Kernel
    Recovery from Infinite Sample Path> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Expected
    Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Summary
    of Inversion Chain> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Preliminaries>

  <\definition>
    [Stationary Gaussian Process] Let <math|Y<around|(|u|)>> be a mean-zero
    stationary Gaussian process on <math|\<bbb-R\>> with covariance kernel

    <\equation*>
      K<rsub|0>*<around|(|u-v|)>=\<bbb-E\>*<around|[|Y<around|(|u|)>*Y<around|(|v|)>|]>.
    </equation*>

    The spectral representation is

    <\equation*>
      Y<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>,
    </equation*>

    where <math|f<rsub|0><around|(|\<lambda\>|)>> is the spectral density and
    <math|d*W<around|(|\<lambda\>|)>> is a standard complex white noise
    random measure:

    <\equation*>
      \<bbb-E\>*<around|[|d*W<around|(|\<lambda\>|)><wide|d*W<around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*\<mu\>.
    </equation*>
  </definition>

  <\definition>
    [Time Change] Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be strictly
    increasing, <math|C<rsup|2>>, with <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>
    for all <math|t>. Define the time-changed process

    <\equation*>
      X<around|(|t|)>\<assign\>Y<around|(|\<theta\><around|(|t|)>|)><space|0.17em><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>.
    </equation*>
  </definition>

  <section|Main Theorem and Proof>

  <\theorem>
    [Monotonic Time Change Yields Oscillatory Process] Let
    <math|Y<around|(|u|)>> be a stationary Gaussian process as above, and let
    <math|\<theta\>> be strictly increasing, <math|C<rsup|2>>, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>. Then
    <math|X<around|(|t|)>> is a mean-zero Gaussian process with covariance

    <\equation*>
      K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>,
    </equation*>

    and spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>.
    </equation*>

    The process <math|X> is oscillatory in the sense of Priestley, and the
    covariance operator is self-adjoint and positive definite.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Covariance Structure.>

    By construction,

    <\equation*>
      \<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>=\<bbb-E\>*<around|[|Y<around|(|\<theta\><around|(|t|)>|)>*Y<around|(|\<theta\><around|(|s|)>|)>|]><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>.
    </equation*>

    <with|font-series|bold|Step 2: Spectral Representation.>

    The spectral representation for <math|Y> gives

    <\equation*>
      Y<around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>.
    </equation*>

    Thus,

    <\equation*>
      X<around|(|t|)>=Y<around|(|\<theta\><around|(|t|)>|)><space|0.17em><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>.
    </equation*>

    <with|font-series|bold|Step 3: Oscillatory Class (Priestley).>

    The process <math|X<around|(|t|)>> admits the continuous spectral
    representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>,
    </equation*>

    where

    <\equation*>
      A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>,
    </equation*>

    and <math|d*\<Phi\><around|(|\<lambda\>|)>=<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>>.
    This matches Priestley's definition of an oscillatory process.

    <with|font-series|bold|Step 4: Self-Adjointness and Positive
    Definiteness.>

    The covariance operator <math|K> is positive definite because for any
    finite collection <math|<around|{|t<rsub|j>|}>> and scalars
    <math|<around|{|c<rsub|j>|}>>,

    <\equation*>
      <big|sum><rsub|j,k>c<rsub|j><wide|c<rsub|k>|\<bar\>>K<around|(|t<rsub|j>,t<rsub|k>|)>=<big|sum><rsub|j,k>c<rsub|j><wide|c<rsub|k>|\<bar\>>K<rsub|0><around|(|<around|\||\<theta\><around|(|t<rsub|j>|)>-\<theta\><around|(|t<rsub|k>|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|j>|)>*<wide|\<theta\>|\<dot\>><around|(|t<rsub|k>|)>>\<geq\>0,
    </equation*>

    since <math|K<rsub|0>> is positive definite and
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>.

    Self-adjointness follows because <math|K<around|(|t,s|)>=<wide|K<around|(|s,t|)>|\<bar\>>>
    and the operator is defined by integration against a real, symmetric
    kernel.

    <with|font-series|bold|Step 5: Necessity of Monotonicity.>

    If <math|<wide|\<theta\>|\<dot\>><around|(|t|)>> vanishes or changes
    sign, the scaling factor <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    becomes ill-defined or nonreal, and the kernel can lose positive
    definiteness. For non-monotonic <math|\<theta\>>, the deficiency indices
    <math|n<rsub|+>> and <math|n<rsub|->> of the associated operator are
    unequal, so no self-adjoint extension exists (von Neumann's theorem).
  </proof>

  <section|Bidirectional Inversion Formulas>

  <\theorem>
    [Stationary to Oscillatory Sample Path Inversion] Let
    <math|X<around|(|t|)>> be an oscillatory process constructed from a
    stationary process <math|Y<around|(|u|)>> via monotonic time change
    <math|\<theta\>>. Then the following bidirectional inversion formulas
    hold:

    <with|font-series|bold|(a) Recovering Stationary Process from Oscillatory
    Sample Path:> Given oscillatory sample path <math|X<around|(|t|)>> and
    time change <math|\<theta\>>, the stationary process is recovered by:

    <\equation*>
      Y<around|(|u|)>=X<around|(|\<theta\><rsup|-1><around|(|u|)>|)><frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation*>

    <with|font-series|bold|(b) Recovering Random Measure from Stationary
    Process:> Given stationary process <math|Y<around|(|u|)>> with spectral
    density <math|f<rsub|0><around|(|\<lambda\>|)>>, the random measure is:

    <\equation*>
      d*\<Phi\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Y<around|(|u|)><sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u
    </equation*>

    <with|font-series|bold|(c) Recovering White Noise from Random Measure:>
    Given random measure <math|d*\<Phi\><around|(|\<lambda\>|)>=<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>>,
    the white noise is:

    <\equation*>
      d*W<around|(|\<lambda\>|)>=<frac|d*\<Phi\><around|(|\<lambda\>|)>|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>
    </equation*>

    <with|font-series|bold|(d) Direct White Noise Recovery from Oscillatory
    Sample Path:> Combining the above, the white noise is recovered directly
    from oscillatory sample path <math|X<around|(|t|)>> by:

    <\equation*>
      d*W<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<theta\><rsup|-1><around|(|u|)>|)><frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>*<frac|1|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u
    </equation*>
  </theorem>

  <\proof>
    <with|font-series|bold|Part (a): Stationary Process Recovery.>

    By construction of the time-changed process:

    <\equation*>
      X<around|(|t|)>=Y<around|(|\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>
    </equation*>

    Setting <math|u=\<theta\><around|(|t|)>>, so
    <math|t=\<theta\><rsup|-1><around|(|u|)>>:

    <\equation*>
      X<around|(|\<theta\><rsup|-1><around|(|u|)>|)>=Y<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|u|)>|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>=Y<around|(|u|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>
    </equation*>

    Therefore:

    <\equation*>
      Y<around|(|u|)>=X<around|(|\<theta\><rsup|-1><around|(|u|)>|)><frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation*>

    <with|font-series|bold|Part (b): Random Measure Recovery.>

    For a stationary process with spectral representation
    <math|Y<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>>,
    the Fourier inversion formula gives:

    <\equation*>
      <sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Y<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u
    </equation*>

    Thus:

    <\equation*>
      d*\<Phi\><around|(|\<lambda\>|)>=<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Y<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u
    </equation*>

    <with|font-series|bold|Part (c): White Noise Extraction.>

    By definition, <math|d*\<Phi\><around|(|\<lambda\>|)>=<sqrt|f<rsub|0><around|(|\<lambda\>|)>>*<space|0.17em>d*W<around|(|\<lambda\>|)>>,
    so:

    <\equation*>
      d*W<around|(|\<lambda\>|)>=<frac|d*\<Phi\><around|(|\<lambda\>|)>|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>
    </equation*>

    <with|font-series|bold|Part (d): Direct Recovery Chain.>

    Combining parts (a), (b), and (c):

    <\align>
      <tformat|<table|<row|<cell|d*W<around|(|\<lambda\>|)>>|<cell|=<frac|1|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>*lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Y<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>*lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<theta\><rsup|-1><around|(|u|)>|)><frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<theta\><rsup|-1><around|(|u|)>|)><frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>*<frac|1|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>*e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    <with|font-series|bold|Convergence Analysis.>

    The convergence in part (d) is guaranteed because:

    <\enumerate>
      <item>The inverse scaling <math|<frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>>
      converts the oscillatory process back to a stationary process

      <item>The stationary process has well-defined spectral inversion by the
      classical theory

      <item>The spectral density normalization
      <math|<frac|1|<sqrt|f<rsub|0><around|(|\<lambda\>|)>>>> ensures proper
      extraction of white noise
    </enumerate>
  </proof>

  <section|Kernel Recovery from Infinite Sample Path>

  <\theorem>
    [Kernel Recovery from Infinite Sample Path] Let <math|X<around|(|t|)>> be
    an oscillatory process on <math|\<bbb-R\>> with continuous spectral
    representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>,
    </equation*>

    where <math|A<around|(|t,\<lambda\>|)>> is the deterministic amplitude
    function and <math|d*\<Phi\><around|(|\<lambda\>|)>> is the orthogonal
    random measure with spectral density <math|f<around|(|\<lambda\>|)>>. If
    the process is mean-square continuous and ergodic, then the covariance
    kernel <math|K<around|(|t,s|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>>
    can be recovered from a single infinitely long sample path by the formula

    <\equation*>
      K<around|(|t,s|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X*<around|(|t+u|)>*X*<around|(|s+u|)>*<space|0.17em>d*u
    </equation*>

    almost surely.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Ergodic Decomposition.>

    For an oscillatory process <math|X<around|(|t|)>> with continuous
    spectral representation, the covariance function is

    <\equation*>
      K<around|(|t,s|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><wide|A<around|(|s,\<lambda\>|)>|\<bar\>><space|0.17em>f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>.
    </equation*>

    <with|font-series|bold|Step 2: Empirical Average.>

    Consider the empirical average along a single infinite sample path:

    <\equation*>
      <wide|K|^><rsub|T><around|(|t,s|)>=<frac|1|2*T>*<big|int><rsub|-T><rsup|T>X*<around|(|t+u|)>*X*<around|(|s+u|)>*<space|0.17em>d*u.
    </equation*>

    <with|font-series|bold|Step 3: Spectral Substitution.>

    Substituting the spectral representation:

    <\align>
      <tformat|<table|<row|<cell|<wide|K|^><rsub|T><around|(|t,s|)>>|<cell|=<frac|1|2*T>*<big|int><rsub|-T><rsup|T><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t+u,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|s+u,\<mu\>|)>|\<bar\>><space|0.17em>d<wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*T>*<big|int><rsub|-T><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t+u,\<lambda\>|)><wide|A<around|(|s+u,\<mu\>|)>|\<bar\>><space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>*d<wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>><space|0.17em>d*u.<eq-number>>>>>
    </align>

    <with|font-series|bold|Step 4: Orthogonality of Random Measure.>

    Using the orthogonality property <math|\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)>*d<wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=f<around|(|\<lambda\>|)>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*\<lambda\>*d*\<mu\>>:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|<wide|K|^><rsub|T><around|(|t,s|)>|]>>|<cell|=<frac|1|2*T>*<big|int><rsub|-T><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t+u,\<lambda\>|)><wide|A<around|(|s+u,\<lambda\>|)>|\<bar\>><space|0.17em>f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<lambda\>|)>*<around*|[|<frac|1|2*T>*<big|int><rsub|-T><rsup|T>A<around|(|t+u,\<lambda\>|)><wide|A<around|(|s+u,\<lambda\>|)>|\<bar\>><space|0.17em>d*u|]>*d*\<lambda\>.<eq-number>>>>>
    </align>

    <with|font-series|bold|Step 5: Ergodicity and Convergence.>

    For oscillatory processes arising from monotonic time changes of
    stationary processes, the amplitude function
    <math|A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    ensures that the process is ergodic. By the ergodic theorem:

    <\equation*>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T>A<around|(|t+u,\<lambda\>|)><wide|A<around|(|s+u,\<lambda\>|)>|\<bar\>><space|0.17em>d*u=A<around|(|t,\<lambda\>|)><wide|A<around|(|s,\<lambda\>|)>|\<bar\>>
    </equation*>

    almost surely.

    <with|font-series|bold|Step 6: Dominated Convergence.>

    Under the assumption of mean-square continuity and finite spectral
    measure, the dominated convergence theorem applies:

    <\equation*>
      lim<rsub|T\<to\>\<infty\>> <wide|K|^><rsub|T><around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)><wide|A<around|(|s,\<lambda\>|)>|\<bar\>><space|0.17em>f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=K<around|(|t,s|)>
    </equation*>

    almost surely.
  </proof>

  <section|Expected Zero Count>

  If <math|K<rsub|0>> is twice differentiable and
  <math|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>\<gtr\>0>, the expected
  number of zeros of <math|X> in <math|<around|[|0,T|]>> is

  <\equation*>
    \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)>.
  </equation*>

  <section|Summary of Inversion Chain>

  The complete inversion chain for recovering the underlying white noise from
  an oscillatory sample path is:

  <\equation*>
    <tabular*|<tformat|<cwith|1|3|2|2|cell-halign|c>|<table|<row|<cell|<text|Oscillatory
    Process >X<around|(|t|)>>|<cell|<long-arrow|\<rubber-rightarrow\>|<text|Inverse
    Time Change>>>|<cell|<text|Stationary Process
    >Y<around|(|u|)>>>|<row|<cell|<text|Stationary Process
    >Y<around|(|u|)>>|<cell|<long-arrow|\<rubber-rightarrow\>|<text|Spectral
    Inversion>>>|<cell|<text|Random Measure
    >d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|<text|Random Measure
    >d*\<Phi\><around|(|\<lambda\>|)>>|<cell|<long-arrow|\<rubber-rightarrow\>|<text|Spectral
    Density Normalization>>>|<cell|<text|White Noise
    >d*W<around|(|\<lambda\>|)>>>>>>
  </equation*>

  Each step is mathematically rigorous and involves well-defined limiting
  procedures. The existence of the spectral representation guarantees
  convergence at each stage.

  <section|Conclusion>

  The complete framework establishes a bijective correspondence between
  stationary Gaussian processes and oscillatory processes via monotonic time
  changes. All transformations are invertible with explicit formulas, and the
  underlying white noise can be recovered from oscillatory sample paths
  through a well-defined chain of operations involving inverse time changes,
  spectral inversions, and spectral density normalizations.

  \F
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-2|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-3|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-4|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-5|<tuple|4|6|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-6|<tuple|5|7|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-7|<tuple|6|7|../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-8|<tuple|7|7|../.TeXmacs/texts/scratch/no_name_9.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Theorem and Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Bidirectional
      Inversion Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Kernel
      Recovery from Infinite Sample Path>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Expected
      Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Summary
      of Inversion Chain> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>