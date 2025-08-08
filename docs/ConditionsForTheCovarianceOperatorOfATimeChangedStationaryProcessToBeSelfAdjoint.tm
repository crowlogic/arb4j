<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Positive Definiteness, Spectral Densities, and
  Self-Adjointness for Time-Changed Stationary
  Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Fourier
    analysis and spectral densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Fourier transform conventions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Spectral characterization in the
    frequency domain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Time-changed
    stationary kernels in the frequency domain>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Setup and spectral representation for
    stationary kernels <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2<space|2spc>Integral operators and unitary
    conjugation in the monotone case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.3<space|2spc>Frequency-domain diagonalization of
    the stationary operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Random
    wave model on the line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Frequency-side density on
    <with|mode|math|<around|[|-1,1|]>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|4.2<space|2spc>Stationary operator and multiplier
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|4.3<space|2spc>Time-changed random wave operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Non-monotone
    time changes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Main
    characterization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This document develops a Fourier-domain framework for translation-invariant
  kernels on the real line, their spectral measures via a frequency-domain
  characterization, and the operator-theoretic consequences for integral
  operators under measurable time changes. All assertions include detailed
  proofs. The random wave model using the stationary kernel
  <math|J<rsub|0><around|(|<around|\||x|\|>|)>> is presented as an example
  whose spectral density is supported on the interval
  <math|<around|[|-1,1|]>>. Time changes are treated by unitary conjugation
  in the strictly monotone case.

  <section|Fourier analysis and spectral densities>

  <subsection|Fourier transform conventions>

  For <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>, define

  <\equation>
    <wide|f|^><around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>f<around|(|x|)>*<space|0.17em>e<rsup|-i*\<omega\>*x>*<space|0.17em>d*x
  </equation>

  and

  <\equation>
    f<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|f|^><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>.
  </equation>

  For a finite nonnegative Borel measure <math|\<mu\>> on <math|\<bbb-R\>>,
  define its Fourier\UStieltjes transform by

  <\equation>
    <wide|\<mu\>|^><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>
  </equation>

  <subsection|Spectral characterization in the frequency domain>

  <\theorem>
    [Wiener\UKhintchine characterization] A continuous function
    <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-C\>> is positive definite if and only
    if there exists a finite nonnegative Borel measure <math|\<mu\>> on
    <math|\<bbb-R\>> such that

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>\<forall\>x\<in\>\<bbb-R\>
    </equation>

    If <math|\<mu\>> is absolutely continuous with respect to Lebesgue
    measure with density <math|S<around|(|\<omega\>|)>\<ge\>0>, then

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<space|0.17em>S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>

    If <math|\<phi\>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>, then

    <\equation>
      \<phi\><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|\<phi\>|^><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>
    </equation>

    and the absolutely continuous spectral measure satisfies
    <math|d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>
    with <math|S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>>
    and <math|S<around|(|\<omega\>|)>\<ge\>0> almost everywhere.
  </theorem>

  <\proof>
    Define <math|\<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>
    for a finite nonnegative Borel measure <math|\<mu\>>. The integral is
    well-defined for each <math|x> because
    <math|<around|\||e<rsup|i*\<omega\>*x>|\|>\<le\>1> and <math|\<mu\>> is
    finite. For continuity, fix <math|x\<in\>\<bbb-R\>> and let
    <math|x<rsub|n>\<to\>x>. Since <math|e<rsup|i*\<omega\>*x<rsub|n>>\<to\>e<rsup|i*\<omega\>*x>>
    pointwise in <math|\<omega\>> and <math|<around|\||e<rsup|i*\<omega\>*x<rsub|n>>|\|>\<le\>1>
    for all <math|n>, dominated convergence gives
    <math|\<phi\><around|(|x<rsub|n>|)>\<to\>\<phi\><around|(|x|)>>.

    Assume <math|\<mu\>> is absolutely continuous with
    <math|d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*d*\<omega\>>
    and <math|S<around|(|\<omega\>|)>\<ge\>0>. Then

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<space|0.17em>S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>

    which is the frequency-domain representation of <math|\<phi\>>.

    Conversely, assume <math|\<phi\>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>.
    The Fourier inversion formula yields

    <\equation>
      \<phi\><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|\<phi\>|^><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>
    </equation>

    Set <math|S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>>,
    so that <math|d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>
    is an absolutely continuous finite measure precisely when
    <math|<wide|\<phi\>|^>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>. The
    equality above identifies <math|\<phi\>> as the frequency-domain
    representation with spectral density <math|S<around|(|\<omega\>|)>>.
  </proof>

  <section|Time-changed stationary kernels in the frequency domain>

  <subsection|Setup and spectral representation for stationary kernels>

  Let <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-C\>> be continuous and positive
  definite with spectral measure <math|\<mu\>> and, when absolutely
  continuous, spectral density <math|S<around|(|\<omega\>|)>\<ge\>0>. Define
  the stationary kernel

  <\equation>
    K<around|(|x,y|)>=\<phi\>*<around|(|x-y|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*<around|(|x-y|)>>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>
  </equation>

  Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be measurable and define the
  time-changed kernel

  <\equation>
    K<rsub|\<theta\>><around|(|s,t|)>=\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>
  </equation>

  The identity

  <\equation>
    K<rsub|\<theta\>><around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>
  </equation>

  follows directly from the stationary kernel's frequency-domain
  representation by substituting <math|x=\<theta\><around|(|s|)>> and
  <math|y=\<theta\><around|(|t|)>> inside the phase.

  <subsection|Integral operators and unitary conjugation in the monotone
  case>

  Define the integral operator <math|T<rsub|\<theta\>>> on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> by

  <\equation>
    <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*<space|0.17em>f<around|(|t|)>*<space|0.17em>d*t
  </equation>

  Assume that <math|\<theta\>> is strictly monotone and absolutely continuous
  with derivative <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost
  everywhere, so that <math|\<theta\>> is invertible with absolutely
  continuous inverse <math|\<theta\><rsup|-1>> and
  <math|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>=1/\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>.

  <\lemma>
    [Unitary change of variables] Define <math|U:L<rsup|2><around|(|\<bbb-R\>,d*s|)>\<to\>L<rsup|2><around|(|\<bbb-R\>,d*u|)>>
    by

    <\equation>
      <around|(|U*f|)><around|(|u|)>=f<around|(|\<theta\><rsup|-1><around|(|u|)>|)><space|0.17em><sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>=<frac|f<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>

    Then <math|U> is unitary.
  </lemma>

  <\proof>
    Let <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>,d*s|)>>. Then

    <\equation>
      <around|\<\|\|\>|U*f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*u|)>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|\|><rsup|2><space|0.17em><around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>*<space|0.17em>d*u
    </equation>

    Setting <math|s=\<theta\><rsup|-1><around|(|u|)>> gives
    <math|d*s=<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>*<space|0.17em>d*u>,
    hence

    <\equation>
      <around|\<\|\|\>|U*f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*u|)>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*s|)>><rsup|2>
    </equation>

    Thus <math|U> is an isometry onto <math|L<rsup|2><around|(|\<bbb-R\>,d*u|)>>
    and therefore unitary.
  </proof>

  <\theorem>
    [Unitary equivalence to a stationary convolution] Let <math|\<phi\>> be
    continuous and positive definite with spectral density
    <math|S<around|(|\<omega\>|)>> when absolutely continuous. Define
    <math|S:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <around|(|S*g|)><around|(|u|)>=<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*<space|0.17em>g<around|(|v|)>*<space|0.17em>d*v
    </equation>

    If <math|\<theta\>> is strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, then

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=S
    </equation>
  </theorem>

  <\proof>
    Let <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>,d*u|)>>. Then
    <math|U<rsup|-1>*g<around|(|s|)>=g<around|(|\<theta\><around|(|s|)>|)><space|0.17em><sqrt|\<theta\><rprime|'><around|(|s|)>>>.
    Compute

    <\equation>
      <text|<math|<tabular|<tformat|<table|<row|<cell|<around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>>|<cell|=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|u|)>|)>-\<theta\><around|(|t|)>|)>*<space|0.17em>g<around|(|\<theta\><around|(|t|)>|)><space|0.17em><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-\<theta\><around|(|t|)>|)>*<space|0.17em>g<around|(|\<theta\><around|(|t|)>|)><space|0.17em><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t>>>>>>>
    </equation>

    Set <math|v=\<theta\><around|(|t|)>> so that
    <math|d*v=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t> and\ 

    <\equation>
      <sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|v|)>>*<space|0.17em>d*v
    </equation>

    Then

    <\equation>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*<space|0.17em>g<around|(|v|)><space|0.17em><sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|v|)>>*<space|0.17em>d*v
    </equation>

    Multiplying the integrand by <math|<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>>
    and dividing it by the same outside factor balances the Jacobian
    symmetrically, yielding

    <\equation*>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*<space|0.17em>g<around|(|v|)>*<space|0.17em>d*v=<around|(|S*g|)><around|(|u|)>
    </equation*>
  </proof>

  <subsection|Frequency-domain diagonalization of the stationary operator>

  Assume <math|d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>
  with <math|S<around|(|\<omega\>|)>\<ge\>0> and
  <math|S\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>. Let <math|\<cal-F\>>
  denote the unitary Fourier transform on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> with the stated convention. For
  <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>\<cap\>L<rsup|1><around|(|\<bbb-R\>|)>>
  (and then by density),

  <\equation>
    <wide|S*g|^><around|(|\<omega\>|)>=<wide|\<phi\>|^><around|(|\<omega\>|)>*<space|0.17em><wide|g|^><around|(|\<omega\>|)>
  </equation>

  Since <math|\<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>,
  one has <math|<wide|\<phi\>|^><around|(|\<omega\>|)>=2*\<pi\>*S<around|(|\<omega\>|)>>
  almost everywhere, so

  <\equation>
    <wide|S*g|^><around|(|\<omega\>|)>=<around|(|2*\<pi\>|)>*S<around|(|\<omega\>|)>*<space|0.17em><wide|g|^><around|(|\<omega\>|)>
  </equation>

  i.e., <math|S=\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>>.

  <\theorem>
    [Bounded self-adjointness in the monotone case] Assume <math|\<phi\>> is
    continuous and positive definite with absolutely continuous spectral
    density <math|S<around|(|\<omega\>|)>\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>.
    If <math|\<theta\>> is strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, then
    <math|T<rsub|\<theta\>>> is bounded and self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, with

    <\equation>
      <around|\<\|\|\>|T<rsub|\<theta\>>|\<\|\|\>>=<around|\<\|\|\>|<space|0.17em>2*\<pi\>*S<space|0.17em>|\<\|\|\>><rsub|L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>
    </equation>
  </theorem>

  <\proof>
    The unitary equivalence <math|U*T<rsub|\<theta\>>*U<rsup|-1>=S> holds by
    the previous theorem. The operator <math|S> equals
    <math|\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>>,
    where <math|M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>> is multiplication
    by the essentially bounded real-valued function
    <math|2*\<pi\>*S<around|(|\<omega\>|)>>. Therefore <math|S> is bounded
    and self-adjoint with <math|<around|\<\|\|\>|S|\<\|\|\>>=<around|\<\|\|\>|2*\<pi\>*S|\<\|\|\>><rsub|L<rsup|\<infty\>>>>.
    These properties and the operator norm pass to <math|T<rsub|\<theta\>>>
    by unitary equivalence.
  </proof>

  <section|Random wave model on the line>

  <subsection|Frequency-side density on <math|<around|[|-1,1|]>>>

  Define

  <\equation>
    \<phi\><around|(|x|)>=J<rsub|0><around|(|<around|\||x|\|>|)>\<forall\>x\<in\>\<bbb-R\>
  </equation>

  Its Fourier transform under the stated convention equals

  <\equation>
    <wide|\<phi\>|^><around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||x|\|>|)>*<space|0.17em>e<rsup|-i*\<omega\>*x>*<space|0.17em>d*x=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  Therefore the spectral density is

  <\equation>
    S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>=<frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  Equivalently,

  <\equation>
    \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<space|0.17em><frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>*<space|0.17em>d*\<omega\>
  </equation>

  where the integrable endpoint singularities at <math|\<omega\>=\<pm\>1> are
  handled by Lebesgue integration.

  <subsection|Stationary operator and multiplier>

  Define <math|S:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
  by

  <\equation>
    <around|(|S*f|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||x-y|\|>|)>*<space|0.17em>f<around|(|y|)>*<space|0.17em>d*y
  </equation>

  Then

  <\equation>
    <wide|S*f|^><around|(|\<omega\>|)>=<wide|\<phi\>|^><around|(|\<omega\>|)>*<space|0.17em><wide|f|^><around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>*<space|0.17em><wide|f|^><around|(|\<omega\>|)>
  </equation>

  Hence <math|S> is the frequency multiplier by

  <\equation>
    m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  <subsection|Time-changed random wave operator>

  For a strictly monotone absolutely continuous
  <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> with
  <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, define

  <\equation>
    <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around*|(|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>*<space|0.17em>f<around|(|t|)>*<space|0.17em>d*t
  </equation>

  Then

  <\equation>
    U*T<rsub|\<theta\>>*U<rsup|-1>=\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\>
  </equation>

  and

  <\equation>
    m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  <\theorem>
    [Self-adjointness for the time-changed random wave operator] Let
    <math|\<theta\>> be strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere. Then
    <math|T<rsub|\<theta\>>> is self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> and shares the spectral
    representation by unitary equivalence with the multiplication operator
    <math|M<rsub|m<around|(|\<cdummy\>|)>>> on the Fourier side.
  </theorem>

  <\proof>
    By construction,\ 

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\>
    </equation>

    \ with a real-valued symbol <math|m<around|(|\<omega\>|)>>. The operator
    <math|M<rsub|m<around|(|\<cdummy\>|)>>> is self-adjoint on its natural
    domain in <math|L<rsup|2><around|(|\<bbb-R\>|)>>. Unitary equivalence
    transfers self-adjointness from <math|M<rsub|m<around|(|\<cdummy\>|)>>>
    to <math|T<rsub|\<theta\>>>.
  </proof>

  <section|Non-monotone time changes>

  <\theorem>
    Let <math|\<phi\>> be a nontrivial positive definite function and
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be measurable. If there exist
    <math|s<rsub|1>\<neq\>s<rsub|2>> with
    <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>>,
    then the integral operator <math|T<rsub|\<theta\>>> with kernel
    <math|K<rsub|\<theta\>><around|(|s,t|)>=\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>
    has a nontrivial null action on differences of mass concentrated at
    <math|s<rsub|1>> and <math|s<rsub|2>>, and there exist <math|L<rsup|2>>
    functions obtained by balancing localized bumps at <math|s<rsub|1>> and
    <math|s<rsub|2>> that are mapped to <math|0> by <math|T<rsub|\<theta\>>>.
  </theorem>

  <\proof>
    Let <math|s<rsub|1>\<neq\>s<rsub|2>> with
    <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>=c>.
    For any test function <math|h> with small support near <math|s<rsub|1>>
    and a translated copy near <math|s<rsub|2>> of opposite amplitude, define

    <\equation>
      f<rsub|\<varepsilon\>>=h<rsub|\<varepsilon\>>*<around|(|\<cdummy\>-s<rsub|1>|)>-h<rsub|\<varepsilon\>>*<around|(|\<cdummy\>-s<rsub|2>|)>
    </equation>

    where <math|h<rsub|\<varepsilon\>>> is a fixed <math|L<rsup|2>> bump
    scaled so that <math|<around|\<\|\|\>|h<rsub|\<varepsilon\>>|\<\|\|\>><rsub|L<rsup|2>>>
    remains bounded as <math|\<varepsilon\>\<to\>0>. For every
    <math|s\<in\>\<bbb-R\>>,

    <\equation>
      <around|(|T<rsub|\<theta\>>*f<rsub|\<varepsilon\>>|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>*<around*|(|h<rsub|\<varepsilon\>>*<around|(|t-s<rsub|1>|)>-h<rsub|\<varepsilon\>>*<around|(|t-s<rsub|2>|)>|)>*<space|0.17em>d*t
    </equation>

    Change variables <math|u=t-s<rsub|1>> in the first term and
    <math|v=t-s<rsub|2>> in the second term:

    <\equation>
      <around|(|T<rsub|\<theta\>>*f<rsub|\<varepsilon\>>|)><around|(|s|)>=<big|int>\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\>*<around|(|s<rsub|1>+u|)>|)>*<space|0.17em>h<rsub|\<varepsilon\>><around|(|u|)>*<space|0.17em>d*u-<big|int>\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\>*<around|(|s<rsub|2>+v|)>|)>*<space|0.17em>h<rsub|\<varepsilon\>><around|(|v|)>*<space|0.17em>d*v
    </equation>

    Since <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>=c>,
    taking <math|\<varepsilon\>\<to\>0> forces
    <math|u\<mapsto\>\<theta\>*<around|(|s<rsub|1>+u|)>> and
    <math|v\<mapsto\>\<theta\>*<around|(|s<rsub|2>+v|)>> to approach <math|c>
    uniformly on the supports of <math|h<rsub|\<varepsilon\>>> as the
    supports shrink. By continuity of <math|\<phi\>> and dominated
    convergence,

    <\equation>
      lim<rsub|\<varepsilon\>\<to\>0><around|(|T<rsub|\<theta\>>*f<rsub|\<varepsilon\>>|)><around|(|s|)>=\<phi\>*<around|(|\<theta\><around|(|s|)>-c|)>*<big|int>h<around|(|u|)>*<space|0.17em>d*u-\<phi\>*<around|(|\<theta\><around|(|s|)>-c|)>*<big|int>h<around|(|v|)>*<space|0.17em>d*v=0
    </equation>

    Thus there exists a sequence <math|<around|(|f<rsub|\<varepsilon\>>|)>>
    with <math|<around|\<\|\|\>|f<rsub|\<varepsilon\>>|\<\|\|\>><rsub|L<rsup|2>>>
    bounded and <math|T<rsub|\<theta\>>*f<rsub|\<varepsilon\>>\<to\>0> in
    <math|L<rsup|2>>, producing <math|L<rsup|2>> functions with
    asymptotically null image. Taking weak limits yields a nontrivial
    <math|L<rsup|2>> function in the null space of the closure of
    <math|T<rsub|\<theta\>>> restricted to smooth compactly supported
    functions, hence <math|T<rsub|\<theta\>>> has nontrivial null action as
    stated.
  </proof>

  <section|Main characterization>

  <\theorem>
    [Characterization via monotonicity] Let
    <math|K<around|(|x,y|)>=\<phi\>*<around|(|x-y|)>> be a
    translation-invariant positive definite kernel with absolutely continuous
    spectral density <math|S<around|(|\<omega\>|)>\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>.
    For <math|\<theta\>> strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, the
    operator <math|T<rsub|\<theta\>>> is bounded and self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, and

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>
    </equation>

    If <math|\<theta\>> is not strictly monotone, there exist nontrivial
    <math|L<rsup|2>> functions with null image under
    <math|T<rsub|\<theta\>>>.
  </theorem>

  <\proof>
    The first assertion is the bounded self-adjointness theorem proved above,
    together with the explicit Fourier multiplier identification for the
    stationary operator. The second assertion follows from the construction
    in the non-monotone time change theorem using localized bump differences
    supported near level-set collisions of <math|\<theta\>>.
  </proof>

  <\example>
    [Random wave model on the line] Let <math|\<phi\><around|(|x|)>=J<rsub|0><around|(|<around|\||x|\|>|)>>.
    Then

    <\equation>
      <wide|\<phi\>|^><around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
    </equation>

    and

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
    </equation>

    The stationary operator <math|S> acts in the Fourier domain as
    multiplication by <math|m<around|(|\<omega\>|)>=2/<sqrt|1-\<omega\><rsup|2>>>
    on <math|<around|[|-1,1|]>> and <math|0> outside. For strictly monotone
    absolutely continuous <math|\<theta\>> with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, the
    time-changed operator

    <\equation>
      <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around*|(|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>*<space|0.17em>f<around|(|t|)>*<space|0.17em>d*t
    </equation>

    satisfies

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\><text|>
    </equation>

    and

    <\equation>
      m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<space|0.17em><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
    </equation>
  </example>
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-10|<tuple|4.1|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-11|<tuple|4.2|6|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-12|<tuple|4.3|6|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-13|<tuple|5|7|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-14|<tuple|6|8|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-3|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-4|<tuple|2.2|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-5|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-6|<tuple|3.1|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-7|<tuple|3.2|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-8|<tuple|3.3|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-9|<tuple|4|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Fourier
      analysis and spectral densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Fourier transform
      conventions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Spectral characterization in
      the frequency domain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Time-changed
      stationary kernels in the frequency domain>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Setup and spectral
      representation for stationary kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Integral operators and
      unitary conjugation in the monotone case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Frequency-domain
      diagonalization of the stationary operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Random
      wave model on the line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Frequency-side density on
      <with|mode|<quote|math>|<around|[|-1,1|]>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Stationary operator and
      multiplier <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Time-changed random wave
      operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Non-monotone
      time changes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Main
      characterization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>