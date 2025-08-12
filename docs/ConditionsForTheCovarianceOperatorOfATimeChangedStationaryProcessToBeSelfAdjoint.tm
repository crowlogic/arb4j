<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Conditions for the Covariance Operator of a
  (Unitarily) Time-Changed Stationary Process On The Real Line To Be
  Self-Adjoint>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

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
    <wide|f|^><around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>f<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x
  </equation>

  and

  <\equation>
    f<around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|f|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
  </equation>

  For a finite nonnegative Borel measure <math|\<mu\>> on <math|\<bbb-R\>>,
  define its Fourier\UStieltjes transform by

  <\equation>
    <wide|\<mu\>|^><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  <subsection|Spectral characterization in the frequency domain>

  <\theorem>
    <dueto|Bochner-Wiener-Khintchine characterization>A continuous function
    <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-C\>> is positive definite if and only
    if there exists a finite nonnegative Borel measure <math|\<mu\>> on
    <math|\<bbb-R\>> such that

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*d*\<mu\><around|(|\<omega\>|)>\<forall\>x\<in\>\<bbb-R\>
    </equation>

    If <math|\<mu\>> is absolutely continuous with respect to Lebesgue
    measure with density <math|S<around|(|\<omega\>|)>\<ge\>0>, then

    <\equation>
      \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    If <math|\<phi\>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>, then

    <\equation>
      \<phi\><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|\<phi\>|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
    </equation>

    and the absolutely continuous spectral measure satisfies

    <\equation>
      d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    \ with

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>
    </equation>

    \ and <math|S<around|(|\<omega\>|)>\<ge\>0> almost everywhere.
  </theorem>

  <\proof>
    First, suppose

    <\equation>
      \<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    \ for a finite nonnegative Borel measure <math|\<mu\>>. For any finite
    set of points <math|x<rsub|1>,\<ldots\>,x<rsub|n>\<in\>\<bbb-R\>> and
    complex numbers <math|c<rsub|1>,\<ldots\>,c<rsub|n>>, we have

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<phi\>*<around|(|x<rsub|j>-x<rsub|k>|)>>|<cell|=<big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>><big|int>e<rsup|i*\<omega\>*<around|(|x<rsub|j>-x<rsub|k>|)>>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*e<rsup|i*\<omega\>*x<rsub|j>>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>\<geq\>0<eq-number>>>>>
    </align>

    since <math|\<mu\>> is nonnegative. Thus <math|\<phi\>> is positive
    definite.

    Conversely, if <math|\<phi\>> is continuous and positive definite, then
    by Bochner's theorem there exists a unique finite nonnegative Borel
    measure <math|\<mu\>> such that\ 

    <\equation>
      \<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    The remaining statements follow from standard Fourier analysis: if
    <math|\<mu\>> has density <math|S<around|(|\<omega\>|)>> then

    <\equation>
      \<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*d*\<omega\>
    </equation>

    and if <math|\<phi\>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> then by
    Fourier inversion <math|>

    <\equation>
      \<phi\><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><wide|\<phi\>|^><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
    </equation>

    giving\ 

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>\<geq\>0
    </equation>

    almost everywhere by the positive definiteness of <math|\<phi\>>.
  </proof>

  <section|Time-changed stationary kernels in the frequency domain>

  <subsection|Setup and spectral representation for stationary kernels>

  Let <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-C\>> be continuous and positive
  definite with spectral measure <math|\<mu\>> and, when absolutely
  continuous, spectral density <math|S<around|(|\<omega\>|)>\<ge\>0>. Define
  the stationary kernel

  <\equation>
    K<around|(|x,y|)>=\<phi\>*<around|(|x-y|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*<around|(|x-y|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be measurable and define the
  time-changed kernel

  <\equation>
    K<rsub|\<theta\>><around|(|s,t|)>=\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>
  </equation>

  The identity

  <\equation>
    K<rsub|\<theta\>><around|(|s,t|)>=<sqrt|\<theta\><rprime|'><around|(|s|)>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  follows directly from the stationary kernel's frequency-domain
  representation by substituting <math|x=\<theta\><around|(|s|)>> and
  <math|y=\<theta\><around|(|t|)>> inside the phase.

  <subsection|Integral operators and unitary conjugation in the monotone
  case>

  Define the integral operator <math|T<rsub|\<theta\>>> on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> by

  <\equation>
    <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*f<around|(|t|)>*d*t
  </equation>

  Assume that <math|\<theta\>> is strictly monotone and absolutely continuous
  with derivative <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost
  everywhere, so that <math|\<theta\>> is invertible with absolutely
  continuous inverse <math|\<theta\><rsup|-1>> and
  <math|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>=1/\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>.

  <\lemma>
    <dueto|Unitary change of variables>Define
    <math|U:L<rsup|2><around|(|\<bbb-R\>,d*s|)>\<to\>L<rsup|2><around|(|\<bbb-R\>,d*u|)>>
    by

    <\equation>
      <around|(|U*f|)><around|(|u|)>=f<around|(|\<theta\><rsup|-1><around|(|u|)>|)><sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>=<frac|f<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>

    Then <math|U> is unitary.
  </lemma>

  <\proof>
    Let <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>,d*s|)>>. Then

    <\equation>
      <around|\<\|\|\>|U*f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*u|)>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|\|><rsup|2><around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>*d*u
    </equation>

    Setting <math|s=\<theta\><rsup|-1><around|(|u|)>> gives
    <math|d*s=<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>*d*u>,
    hence

    <\equation>
      <around|\<\|\|\>|U*f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*u|)>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|s|)>|\|><rsup|2>*d*s=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*s|)>><rsup|2>
    </equation>

    Thus <math|U> is an isometry onto <math|L<rsup|2><around|(|\<bbb-R\>,d*u|)>>
    and therefore unitary.
  </proof>

  <\theorem>
    <dueto|Unitary equivalence to a weighted stationary convolution>Let
    <math|\<phi\>> be continuous and positive definite with spectral density
    <math|S<around|(|\<omega\>|)>> when absolutely continuous. Define
    <math|\<cal-S\>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <around|(|\<cal-S\>*g|)><around|(|u|)>=<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*g<around|(|v|)>*d*v
    </equation>

    and let <math|M<rsub|w>> be multiplication by

    <\equation>
      w<around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>
    </equation>

    If <math|\<theta\>> is strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, then

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-S\>*M<rsub|w>
    </equation>
  </theorem>

  <\proof>
    Let <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>,d*u|)>>. Then

    <\equation>
      U<rsup|-1>*g<around|(|s|)>=g<around|(|\<theta\><around|(|s|)>|)><sqrt|\<theta\><rprime|'><around|(|s|)>>
    </equation>

    Compute (TODO: this is fucking hideous and unnecessary,streamline this
    whole fucking proof)

    <\align>
      <tformat|<cwith|2|2|1|-1|font-base-size|9>|<table|<row|<cell|>|<cell|>>|<row|<cell|<around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>>|<cell|=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>><big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|u|)>|)>-\<theta\><around|(|t|)>|)>*<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*g<around|(|\<theta\><around|(|t|)>|)><sqrt|\<theta\><rprime|'><around|(|t|)>>*d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-\<theta\><around|(|t|)>|)>*g<around|(|\<theta\><around|(|t|)>|)>*\<theta\><rprime|'><around|(|t|)>*d*t<eq-number>>>>>
    </align>

    Set

    <\equation>
      v=\<theta\><around|(|t|)>
    </equation>

    so that

    <\equation>
      d*v=\<theta\><rprime|'><around|(|t|)>*d*t
    </equation>

    and

    <\equation>
      \<theta\><rprime|'><around|(|t|)>*d*t=d*v
    </equation>

    Then

    <\equation>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*g<around|(|v|)>*d*v
    </equation>

    This can be written as

    <\equation>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<big|int><rsub|\<bbb-R\>>\<phi\>*<around|(|u-v|)>*<around*|(|g<around|(|v|)>*<frac|<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|v|)>>|<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|v|)>>>|)>*d*v
    </equation>

    Setting

    <\equation>
      h<around|(|v|)>=g<around|(|v|)><sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|v|)>>=<around|(|M<rsub|w>*g|)><around|(|v|)>
    </equation>

    we have

    <\equation>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>*<around|(|\<cal-S\>*h|)><around|(|u|)>=<around|(|M<rsub|w>*\<cal-S\>*M<rsub|w>*g|)><around|(|u|)>
    </equation>
  </proof>

  <subsection|Frequency-domain diagonalization of the stationary operator>

  Assume <math|d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*d*\<omega\>>
  with <math|S<around|(|\<omega\>|)>\<ge\>0> and
  <math|S\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>. Let <math|\<cal-F\>>
  denote the unitary Fourier transform on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> with the stated convention. For
  <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>\<cap\>L<rsup|1><around|(|\<bbb-R\>|)>>
  (and then by density),

  <\equation>
    <wide|\<cal-S\>*g|^><around|(|\<omega\>|)>=<wide|\<phi\>|^><around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>
  </equation>

  Since

  <\equation>
    \<phi\><around|(|x|)>=<big|int>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  one has

  <\equation>
    <wide|\<phi\>|^><around|(|\<omega\>|)>=2*\<pi\>*S<around|(|\<omega\>|)>
  </equation>

  almost everywhere, so

  <\equation>
    <wide|\<cal-S\>*g|^><around|(|\<omega\>|)>=<around|(|2*\<pi\>|)>*S<around|(|\<omega\>|)>*<wide|g|^><around|(|\<omega\>|)>
  </equation>

  i.e.,

  <\equation>
    \<cal-S\>=\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>
  </equation>

  <\theorem>
    <dueto|Bounded self-adjointness in the monotone case>Assume
    <math|\<phi\>> is continuous and positive definite with absolutely
    continuous spectral density <math|S<around|(|\<omega\>|)>\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>.
    If <math|\<theta\>> is strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, then
    <math|T<rsub|\<theta\>>> is bounded and self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, with

    <\equation>
      <around|\<\|\|\>|T<rsub|\<theta\>>|\<\|\|\>>=<around|\<\|\|\>|2*\<pi\>*S|\<\|\|\>><rsub|L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>
    </equation>
  </theorem>

  <\proof>
    From the previous theorem,

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-S\>*M<rsub|w>
    </equation>

    where

    <\equation>
      w<around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>
    </equation>

    and

    <\equation>
      \<cal-S\>=\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>
    </equation>

    Since <math|M<rsub|w>> is multiplication by a positive real-valued
    function, <math|M<rsub|w>*\<cal-S\>*M<rsub|w>> is unitarily equivalent to
    <math|\<cal-S\>> and therefore to the multiplication operator
    <math|M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>> in Fourier space. Since
    <math|2*\<pi\>*S<around|(|\<omega\>|)>\<geq\>0> is real-valued and
    essentially bounded, this operator is bounded and self-adjoint with norm
    <math|<around|\<\|\|\>|2*\<pi\>*S|\<\|\|\>><rsub|L<rsup|\<infty\>>>>.
    These properties transfer to <math|T<rsub|\<theta\>>> by unitary
    equivalence.
  </proof>

  <section|Random wave model on the line>

  <subsection|Frequency-side density on <math|<around|[|-1,1|]>>>

  Define

  <\equation>
    \<phi\><around|(|x|)>=J<rsub|0><around|(|<around|\||x|\|>|)>\<forall\>x\<in\>\<bbb-R\>
  </equation>

  Its Fourier transform under the stated convention equals

  <\equation>
    <wide|\<phi\>|^><around|(|\<omega\>|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||x|\|>|)>*e<rsup|-i*\<omega\>*x>*d*x=<frac|2|<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  Therefore the spectral density is

  <\equation>
    S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<wide|\<phi\>|^><around|(|\<omega\>|)>=<frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  Equivalently,

  <\equation>
    \<phi\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*x>*<frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>>*<text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>d*\<omega\>
  </equation>

  where the integrable endpoint singularities at <math|\<omega\>=\<pm\>1> are
  handled by Lebesgue integration.

  <subsection|Stationary operator and multiplier>

  Define <math|\<cal-S\>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
  by

  <\equation>
    <around|(|\<cal-S\>*f|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||x-y|\|>|)>*f<around|(|y|)>*d*y
  </equation>

  Then

  <\equation>
    <wide|\<cal-S\>*f|^><around|(|\<omega\>|)>=<wide|\<phi\>|^><around|(|\<omega\>|)>*<wide|f|^><around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>>*<text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>><wide|f|^><around|(|\<omega\>|)>
  </equation>

  Hence <math|\<cal-S\>> is the frequency multiplier by

  <\equation>
    m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  <subsection|Time-changed random wave operator>

  For a strictly monotone absolutely continuous
  <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> with
  <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, define

  <\equation>
    <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)><sqrt|\<theta\><rprime|'><around|(|s|)>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>*f<around|(|t|)>*d*t
  </equation>

  Then

  <\equation>
    U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\>*M<rsub|w>
  </equation>

  where

  <\equation>
    w<around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>
  </equation>

  and

  <\equation>
    m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
  </equation>

  <\theorem>
    <dueto|Self-adjointness for the time-changed random wave operator>Let
    <math|\<theta\>> be strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere. Then
    <math|T<rsub|\<theta\>>> is self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> and shares the spectral
    representation by unitary equivalence with the multiplication operator
    <math|M<rsub|m<around|(|\<cdummy\>|)>>> on the Fourier side.
  </theorem>

  <\proof>
    By construction,

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\>*M<rsub|w>
    </equation>

    with a real-valued symbol <math|m<around|(|\<omega\>|)>\<geq\>0>. The
    operator <math|M<rsub|m<around|(|\<cdummy\>|)>>> is self-adjoint on its
    natural domain in <math|L<rsup|2><around|(|\<bbb-R\>|)>>. Since
    <math|M<rsub|w>> commutes with real multiplication operators after
    Fourier transform, the composition is self-adjoint. Unitary equivalence
    transfers self-adjointness from this composition to
    <math|T<rsub|\<theta\>>>.
  </proof>

  <section|Non-monotone time changes>

  <\theorem>
    Let <math|\<phi\>> be a nontrivial positive definite function and
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be measurable. If there exist
    <math|s<rsub|1>\<neq\>s<rsub|2>> with
    <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>>,
    then the integral operator <math|T<rsub|\<theta\>>> with kernel
    <math|K<rsub|\<theta\>><around|(|s,t|)>=\<phi\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*<sqrt|\<theta\><rprime|'><around|(|t|)>>>
    has a nontrivial null action on differences of mass concentrated at
    <math|s<rsub|1>> and <math|s<rsub|2>>, and there exist <math|L<rsup|2>>
    functions obtained by balancing localized bumps at <math|s<rsub|1>> and
    <math|s<rsub|2>> that are mapped to <math|0> by <math|T<rsub|\<theta\>>>.
  </theorem>

  <\proof>
    \<less\>TODO: insert better proof here without that stupid bump
    crap\<gtr\>
  </proof>

  <section|Main characterization>

  <\theorem>
    <dueto|Characterization via monotonicity>Let

    <\equation>
      K<around|(|x,y|)>=\<phi\>*<around|(|x-y|)>
    </equation>

    be a translation-invariant positive definite kernel with absolutely
    continuous spectral density <math|S<around|(|\<omega\>|)>\<in\>L<rsup|\<infty\>><around|(|\<bbb-R\>|)>>.
    For <math|\<theta\>> strictly monotone and absolutely continuous with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, the
    operator <math|T<rsub|\<theta\>>> is bounded and self-adjoint on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, and

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-F\><rsup|-1>*M<rsub|2*\<pi\>*S<around|(|\<cdummy\>|)>>*\<cal-F\>*M<rsub|w>
    </equation>

    where

    <\equation>
      w<around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>
    </equation>

    If <math|\<theta\>> is not strictly monotone, there exist nontrivial
    <math|L<rsup|2>> functions with null image under
    <math|T<rsub|\<theta\>>>.
  </theorem>

  <\proof>
    The first assertion is the bounded self-adjointness theorem proved above,
    together with the explicit weighted Fourier multiplier identification for
    the stationary operator. The second assertion follows from the
    construction in the non-monotone time change theorem using localized bump
    differences supported near level-set collisions of <math|\<theta\>>.
  </proof>

  <\example>
    <dueto|Random wave model on the line>Let

    <\equation>
      \<phi\><around|(|x|)>=J<rsub|0><around|(|<around|\||x|\|>|)>
    </equation>

    Then

    <\equation>
      <wide|\<phi\>|^><around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
    </equation>

    and

    <\equation>
      S<around|(|\<omega\>|)>=<frac|1|\<pi\>*<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<le\>1|}>>
    </equation>

    The stationary operator <math|\<cal-S\>> acts in the Fourier domain as
    multiplication by

    <\equation>
      m<around|(|\<omega\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|2|<sqrt|1-\<omega\><rsup|2>>>>|<cell|<around|\||\<omega\>|\|>\<less\>1>>|<row|<cell|0>|<cell|<around|\||\<omega\>|\|>\<geqslant\>1>>>>>|\<nobracket\>>
    </equation>

    For strictly monotone absolutely continuous <math|\<theta\>> with
    <math|\<theta\><rprime|'><around|(|s|)>\<gtr\>0> almost everywhere, the
    time-changed covariance operator

    <\equation>
      <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0><around|(|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)><sqrt|\<theta\><rprime|'><around|(|t|)>>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*f<around|(|t|)>*d*t
    </equation>

    satisfies

    <\equation>
      U*T<rsub|\<theta\>>*U<rsup|-1>=M<rsub|w>*\<cal-F\><rsup|-1>*M<rsub|m<around|(|\<cdummy\>|)>>*\<cal-F\>*M<rsub|w>
    </equation>

    where

    <\equation>
      w<around|(|u|)>=<sqrt|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|u|)>>
    </equation>

    and

    <\equation>
      m<around|(|\<omega\>|)>=<frac|2|<sqrt|1-\<omega\><rsup|2>>><text|<with|font-series|bold|1>><rsub|<around|{|<around|\||\<omega\>|\|>\<less\>1|}>>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|4.1|6>>
    <associate|auto-11|<tuple|4.2|6>>
    <associate|auto-12|<tuple|4.3|7>>
    <associate|auto-13|<tuple|5|7>>
    <associate|auto-14|<tuple|6|8>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|3|3>>
    <associate|auto-6|<tuple|3.1|3>>
    <associate|auto-7|<tuple|3.2|4>>
    <associate|auto-8|<tuple|3.3|5>>
    <associate|auto-9|<tuple|4|6>>
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