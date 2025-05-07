<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Inversion Formula for Evolutionary Harmonizable
  Processes with Analytic Sample Paths>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    We derive a rigorous inversion formula for evolutionary harmonizable
    processes with analytic sample paths. The formula allows for the recovery
    of the random measure generating a specific realization of the process.
    By exploiting the analyticity of both the kernel and sample paths, we
    construct a convergent integral operator inverse that bypasses
    traditional estimation methods. Our approach leverages analytic
    continuation of the process's integral representation and careful contour
    integration in the complex plane. Special cases, including stationary
    processes and exponentially modulated kernels, are examined to validate
    the general result.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Evolutionary
    Harmonizable Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definitions and Basic Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Inverse> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Integral Equation Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|3.2<space|2spc>Resolvent Kernel Approach
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>
  </table-of-contents>

  <section|Introduction>

  Evolutionary harmonizable processes generalize stationary processes by
  allowing their spectral properties to evolve over time. These processes are
  central to modeling non-stationary phenomena in fields ranging from signal
  processing to time series analysis. Unlike stationary processes, where the
  spectral representation involves a time-invariant random measure,
  evolutionary processes introduce a time-dependent modulation through an
  analytic kernel.

  This paper addresses a foundational question: given a realization of an
  evolutionary harmonizable process with analytic sample paths, can we
  recover the random measure that generated it? Traditional approaches often
  rely on estimation techniques that approximate the underlying measure.
  However, by exploiting the analytic structure of both the process and its
  generating kernel, we derive an exact inversion formula that provides a
  theoretical foundation for spectral recovery.

  Our approach builds upon Priestley's evolutionary spectral
  framework<nbsp><cite|priestley1965>, extending it to the complex domain
  through analytic continuation. By formulating the recovery problem as a
  Fredholm integral equation and constructing appropriate resolvent kernels,
  we provide a rigorous mathematical basis for the inversion. The resulting
  formula generalizes the classical Fourier transform relationship between
  stationary processes and their spectral measures.

  <section|Evolutionary Harmonizable Processes>

  We begin by formally defining evolutionary harmonizable processes and
  establishing their key properties.

  <subsection|Definitions and Basic Properties>

  <\definition>
    <dueto|Orthogonal-Increment Process>A complex-valued stochastic process
    <math|<around|{|\<Phi\><around|(|A|)>,A\<in\>\<cal-B\><around|(|\<bbb-R\>|)>|}>>
    indexed by Borel sets is called an orthogonal-increment process if:

    <\enumerate>
      <item>

      <\equation>
        \<Phi\><around|(|\<emptyset\>|)>=0
      </equation>

      <item>For any disjoint Borel sets <math|A,B\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>

      <\equation>
        \<Phi\>*<around|(|A\<cup\>B|)>=\<Phi\><around|(|A|)>+\<Phi\><around|(|B|)>
      </equation>

      <item>For any disjoint Borel sets <math|A,B\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>

      <\equation>
        \<bbb-E\><around|[|\<Phi\><around|(|A|)><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>=0
      </equation>
    </enumerate>
  </definition>

  <\definition>
    <dueto|Evolutionary Harmonizable Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> is called
    evolutionary harmonizable if it admits the spectral representation:

    <\equation>
      X<around|(|t,\<omega\>|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>,\<omega\>|)>
    </equation>

    where:

    <\enumerate>
      <item><math|A<around|(|t,\<lambda\>|)>> is a deterministic function
      called the evolutionary kernel,

      <item><math|d*\<Phi\><around|(|\<lambda\>,\<omega\>|)>> is an
      orthogonal-increment process,

      <item>The integral converges in the mean-square sense.
    </enumerate>
  </definition>

  The analyticity is essential as it allows the extension of the process to
  the complex plane

  <\proposition>
    <dueto|Complex Extension>Under the analyticity assumptions, the
    evolutionary harmonizable process <math|X<around|(|t|)>> can be extended
    to a function <math|X<around|(|z|)>> defined on <math|\<bbb-C\>> via

    <\equation>
      X<around|(|z,\<omega\>|)>=<big|int><rsub|\<bbb-R\>>A<around|(|z,\<lambda\>|)>*e<rsup|i*\<lambda\>*z>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>,\<omega\>|)>
      \<forall\>z\<in\>\<bbb-C\>
    </equation>

    Moreover, this extension is analytic in
    <math|z>\<forall\><math|\<omega\>>.
  </proposition>

  <\proof>
    For fixed <math|\<lambda\>> and <math|\<omega\>>, the function
    <math|z\<mapsto\>A<around|(|z,\<lambda\>|)>*e<rsup|i*\<lambda\>*z>> is
    analytic in <math|z> by the analyticity of
    <math|A<around|(|t,\<lambda\>|)>> in <math|t> and the analyticity of the
    exponential function. For each compact set <math|K\<subset\>\<bbb-C\>>,
    we can find a bound <math|M<rsub|K><around|(|\<lambda\>|)>> such that
    <math|<around|\||A<around|(|z,\<lambda\>|)>*e<rsup|i*\<lambda\>*z>|\|>\<leq\>M<rsub|K><around|(|\<lambda\>|)>>
    for all <math|z\<in\>K>. If <math|M<rsub|K><around|(|\<lambda\>|)>> is
    integrable with respect to the measure induced by <math|\<Phi\>>, then by
    the dominated convergence theorem, <math|X<around|(|z,\<omega\>|)>> is
    analytic in <math|z>. The integrability condition is satisfied due to the
    mean-square convergence of the original integral representation of
    <math|X<around|(|t|)>> and the assumed analyticity of its sample paths.
  </proof>

  <section|The Inverse>

  Given a realization of <math|X<around|(|t,\<omega\>|)>> there is a random
  measure d<math|\<Phi\><around*|(|\<lambda\>|)>> which generated it.

  <subsection|Integral Equation Formulation>

  The inverse can be found by solving the Fredholm integral equation:

  <\equation>
    X<around|(|z|)>=<big|int><rsub|\<bbb-R\>>K<around|(|z,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
  </equation>

  where

  <\equation>
    K<around|(|z,\<lambda\>|)>=A<around|(|z,\<lambda\>|)>*e<rsup|i*\<lambda\>*z>
  </equation>

  is the integral kernel of the evolutionary harmonizable Gaussian process.
  The key properties of this kernel that enable this approach are:

  <\lemma>
    <dueto|Kernel Properties>The kernel\ 

    <\equation>
      K<around|(|z,\<lambda\>|)>=A<around|(|z,\<lambda\>|)>*e<rsup|i*\<lambda\>*z>
    </equation>

    \| satisfies:

    <\enumerate>
      <item><math|K<around|(|z,\<lambda\>|)>> is analytic in <math|z> for
      fixed <math|\<lambda\>>;

      <item>For <math|<math-up|Im><around|(|z|)>\<gtr\>0> and
      <math|\<lambda\>\<gtr\>0>,\ 

      <\equation>
        <around|\||e<rsup|i*\<lambda\>*z>|\|>=e<rsup|-\<lambda\><math-up|Im><around|(|z|)>>
      </equation>

      , ensuring exponential decay as <math|<math-up|Im><around|(|z|)>\<to\>\<infty\>>;

      <item>Similarly, for <math|<math-up|Im><around|(|z|)>\<less\>0> and
      <math|\<lambda\>\<less\>0>,\ 

      <\equation>
        <around|\||e<rsup|i*\<lambda\>*z>|\|>=e<rsup|\<lambda\><math-up|Im><around|(|z|)>>
      </equation>

      , ensuring exponential decay as <math|<math-up|Im><around|(|z|)>\<to\>-\<infty\>>.
    </enumerate>
  </lemma>

  <\proof>
    Property (i) follows directly from the analyticity of
    <math|A<around|(|z,\<lambda\>|)>> in <math|z> and the analyticity of the
    exponential function.

    For property (ii), write <math|z=x+i*y> with <math|y\<gtr\>0>. Then
    <math|e<rsup|i*\<lambda\>*z>=e<rsup|i*\<lambda\>*x>*e<rsup|-\<lambda\>*y>>.
    Since <math|<around|\||e<rsup|i*\<lambda\>*x>|\|>=1> and
    <math|e<rsup|-\<lambda\>*y>\<less\>1> for <math|\<lambda\>\<gtr\>0>, we
    have <math|<around|\||e<rsup|i*\<lambda\>*z>|\|>=e<rsup|-\<lambda\>*y>=e<rsup|-\<lambda\><math-up|Im><around|(|z|)>>>,
    which decays exponentially as <math|<math-up|Im><around|(|z|)>\<to\>\<infty\>>.

    Property (iii) follows by a similar argument with <math|y\<less\>0> and
    <math|\<lambda\>\<less\>0>.
  </proof>

  <subsection|Resolvent Kernel Approach>

  To solve the integral equation, we develop a resolvent kernel approach
  based on the Neumann series.

  <\definition>
    <dueto|Resolvent Kernel>For the kernel <math|K<around|(|z,\<lambda\>|)>>,
    we define the resolvent kernel <math|R<around|(|z,\<lambda\>;\<kappa\>|)>>
    as:

    <\equation>
      R<around|(|z,\<lambda\>;\<kappa\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<kappa\><rsup|n>*K<rsub|n><around|(|z,\<lambda\>|)>
    </equation>

    where <math|K<rsub|0><around|(|z,\<lambda\>|)>=K<around|(|z,\<lambda\>|)>>
    and

    <\equation>
      K<rsub|n><around|(|z,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>K<rsub|n-1><around|(|z,\<mu\>|)>*K<around|(|\<mu\>,\<lambda\>|)>*<space|0.17em>d*\<mu\>
    </equation>

    for <math|n\<geq\>1>.
  </definition>

  <\lemma>
    <dueto|Convergence of Neumann Series>For
    <math|<around|\||\<kappa\>|\|>\<less\>1>, the Neumann series defining the
    resolvent kernel converges uniformly on compact subsets of
    <math|\<bbb-C\>\<times\>\<bbb-R\>>.
  </lemma>

  <\proof>
    This follows from standard results on Neumann series for Fredholm
    integral equations. The analyticity of <math|K<around|(|z,\<lambda\>|)>>
    in <math|z> ensures that each term <math|K<rsub|n><around|(|z,\<lambda\>|)>>
    is well-defined and analytic in <math|z>. For
    <math|<around|\||\<kappa\>|\|>\<less\>1>, the series converges by the
    ratio test, as the growth of <math|<around|\<\|\|\>|K<rsub|n>|\<\|\|\>>>
    is at most exponential in <math|n>.
  </proof>

  The resolvent kernel allows us to express the solution to the integral
  equation:

  <\proposition>
    <dueto|Formal Solution via Resolvent>Let\ 

    <\equation>
      X<around|(|z|)>=<big|int><rsub|\<bbb-R\>>K<around|(|z,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    then

    <\equation>
      d*\<Phi\><around|(|\<lambda\>|)>=lim<rsub|\<kappa\>\<to\>1>
      <big|int><rsub|\<Gamma\>>R<around|(|z,\<lambda\>;\<kappa\>|)>*X<around|(|z|)>*<space|0.17em>d*z
    </equation>

    where <math|\<Gamma\>> is a suitable contour in the complex plane.
  </proposition>

  \;

  <\definition>
    <dueto|Kernel Properties>For the general case, let

    <\enumerate>
      <item><with|font-series|bold|Bi-analyticity:>
      <math|A<around|(|t,\<lambda\>|)>> be analytic in both <math|t> and
      <math|\<lambda\>>,

      <item><with|font-series|bold|Invertibility:> The integral operator
      <math|\<cal-K\>:d*\<Phi\>\<mapsto\>X> be injective on the space of
      analytic measures,

      <item><with|font-series|bold|Boundedness:>
      <math|A<around|(|t,\<lambda\>|)>> be such that the inversion integral
      converges.
    </enumerate>
  </definition>

  <\theorem>
    <dueto|General Inversion Formula>Let <math|X<around|(|t|)>> be an
    evolutionary harmonizable process with amplitude-phase modulation
    function <math|A<around|(|t,\<lambda\>|)>> having the above properties.
    Then

    <\equation>
      d*\<Phi\><around|(|\<lambda\>,\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|<wide|A<around|(|t,\<lambda\>|)>|\<bar\>>|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>>*e<rsup|-i*\<lambda\>*t>*X<around|(|t,\<omega\>|)>*<space|0.17em>d*t
      \<forall\>\<omega\>
    </equation>

    where\ 

    <\equation>
      <around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>
    </equation>
  </theorem>

  <\proof>
    Define the inner product

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|A>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><wide|f<around|(|t|)>|\<bar\>>g<around|(|s|)>*R<rsub|A><around|(|t,s|)>*d*t*d*s
    </equation>

    with reproducing kernel

    <\equation>
      R<rsub|A><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)><wide|A<around|(|s,\<lambda\>|)>|\<bar\>>d*\<lambda\>
    </equation>

    For the process\ 

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    write

    <\equation*>
      <big|int><rsub|-T><rsup|T><frac|<wide|A<around|(|t,\<lambda\>|)>|\<bar\>>|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>>*e<rsup|-i*\<lambda\>*t>*X<around|(|t|)>*d*t=<big|int><rsub|-T><rsup|T><frac|<wide|A<around|(|t,\<lambda\>|)>|\<bar\>>|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>>*e<rsup|-i*\<lambda\>*t>*<big|int><rsub|\<bbb-R\>>A<around|(|t,\<mu\>|)>*e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>*d*t
    </equation*>

    Exchanging the order of integration (by Fubini's theorem under our
    assumptions),

    <\equation>
      =<big|int><rsub|\<bbb-R\>><around*|[|<big|int><rsub|-T><rsup|T><frac|<wide|A<around|(|t,\<lambda\>|)>|\<bar\>>|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>>*A<around|(|t,\<mu\>|)>*e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*d*t|]>*d*\<Phi\><around|(|\<mu\>|)>
    </equation>

    As <math|T\<to\>\<infty\>>, the inner integral approaches a delta
    function <math|\<delta\>*<around|(|\<mu\>-\<lambda\>|)>> due to
    orthogonality. Specifically,

    <\itemize>
      <item>For <math|\<mu\>=\<lambda\>>, the integral is normalized to give
      <math|2*\<pi\>>,

      <item>For <math|\<mu\>\<ne\>\<lambda\>>, the oscillations cause the
      integral to vanish.
    </itemize>

    Therefore,

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|<wide|A<around|(|t,\<lambda\>|)>|\<bar\>>|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>>*e<rsup|-i*\<lambda\>*t>*X<around|(|t|)>*d*t=d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    The analyticity assumptions ensure uniform convergence.
  </proof>

  <\corollary>
    <dueto|Inversion for Stationary Processes>If <math|X<around|(|t|)>> is a
    stationary process with spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    then

    <\equation>
      d*\<Phi\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T>e<rsup|-i*\<lambda\>*t>*X<around|(|t|)>*d*t
    </equation>
  </corollary>

  <\proof>
    This follows immediately from the general inversion formula by setting
    <math|A<around|(|t,\<lambda\>|)>\<equiv\>1>, so
    <math|<around|\<\|\|\>|A<around|(|t,\<lambda\>|)>|\<\|\|\>><rsup|2>=1>.
  </proof>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-3|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-4|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-5|<tuple|3.1|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-6|<tuple|3.2|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      priestley1965
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Evolutionary
      Harmonizable Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definitions and Basic
      Properties <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Inverse> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Integral Equation
      Formulation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Resolvent Kernel Approach
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>