<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Shah Function: Properties, Fourier Analysis, and
  Applications to Sampling Theory>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    This document presents the mathematical properties of the Shah function
    (Dirac comb), including its definition as a periodic distribution of
    delta functions, fundamental algebraic identities, Fourier transform
    properties, and connections to sampling theory and Poisson summation. The
    analysis establishes the role of the Shah function in relating continuous
    and discrete signal processing through sampling and periodization
    operations.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Definition
    and Basic Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Scaling
    and Periodicity Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Sampling
    and Replication Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Fourier
    Transform Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Sampling
    Theorem and Spectral Replication> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Two-Dimensional
    Shah Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Weighted
    Shah Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Connection
    to Poisson Summation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Applications
    to Discrete Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Normalization
    and Integral Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Definition and Basic Properties>

  <\definition>
    <label|def:shah_function>The Shah function with unit period is defined as
    the distribution

    <\equation>
      <label|eq:shah_unit><text|III><around|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-k|)>
    </equation>

    where <math|\<delta\>> is the Dirac delta function. For arbitrary period
    <math|T\<gtr\>0>, the scaled Shah function is

    <\equation>
      <label|eq:shah_period_T><text|III><rsub|T><around|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-k*T|)>
    </equation>
  </definition>

  <\proposition>
    <label|prop:shah_support>The Shah function III<math|<around|(|x|)>> has
    support on the integer lattice <math|\<bbb-Z\>>. For any test function
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>> (Schwartz space), the
    action is given by

    <\equation>
      <label|eq:shah_action>\<langle\><text|III>,\<phi\>\<rangle\>=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<phi\><around|(|k|)>
    </equation>
  </proposition>

  <\proof>
    By definition <eqref|eq:shah_unit> and the sifting property of the delta
    function:

    <\align>
      <tformat|<table|<row|<cell|\<langle\><text|III>,\<phi\>\<rangle\>>|<cell|<around*|\<nobracket\>|=<around*|\<langle\>|<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>|(>\<cdot\>-k),\<phi\>|\<rangle\>><eq-number><label|eq:shah_action_expand>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><around|\<langle\>|\<delta\>|(>\<cdot\>-k),\<phi\>\<rangle\><eq-number><label|eq:linearity_functional>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<phi\><around|(|k|)><eq-number><label|eq:delta_sifting>>>>>
    </align>

    where step <eqref|eq:linearity_functional> uses the linearity of the
    distributional pairing and step <eqref|eq:delta_sifting> applies the
    sifting property <math|<around|\<langle\>|\<delta\>|(>\<cdot\>-k),\<phi\>\<rangle\>=\<phi\><around|(|k|)>>.
  </proof>

  <section|Scaling and Periodicity Properties>

  <\theorem>
    <label|thm:shah_scaling>The Shah function satisfies the scaling relation

    <\equation>
      <label|eq:shah_scaling><text|III><rsub|T><around|(|x|)>=<frac|1|T><text|III><around*|(|<frac|x|T>|)>
    </equation>
  </theorem>

  <\proof>
    Starting with definition <eqref|eq:shah_period_T>:

    <\align>
      <tformat|<table|<row|<cell|<text|III><rsub|T><around|(|x|)>>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-k*T|)><eq-number><label|eq:scaling_start>>>>>
    </align>

    For the right-hand side of <eqref|eq:shah_scaling>:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|T><text|III><around*|(|<frac|x|T>|)>>|<cell|=<frac|1|T>*<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around*|(|<frac|x|T>-k|)><eq-number><label|eq:scaling_rhs>>>|<row|<cell|>|<cell|=<frac|1|T>*<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\><around*|(|<frac|x-k*T|T>|)><eq-number><label|eq:factor_out>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-k*T|)><eq-number><label|eq:delta_scaling>>>>>
    </align>

    where step <eqref|eq:delta_scaling> uses the scaling property
    <math|\<delta\>*<around|(|a*x|)>=<frac|1|<around|\||a|\|>>*\<delta\><around|(|x|)>>
    with <math|a=1/T\<gtr\>0>.

    Comparing <eqref|eq:scaling_start> and <eqref|eq:delta_scaling>
    establishes <eqref|eq:shah_scaling>.
  </proof>

  <\proposition>
    <label|prop:shah_periodicity>The Shah function is periodic with period
    <math|T>:

    <\equation>
      <label|eq:shah_periodic><text|III><rsub|T><around|(|x+T|)>=<text|III><rsub|T><around|(|x|)>
    </equation>
  </proposition>

  <\proof>
    <\align>
      <tformat|<table|<row|<cell|<text|III><rsub|T><around|(|x+T|)>>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x+T-k*T|)><eq-number><label|eq:period_shift>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-<around|(|k-1|)>*T|)><eq-number><label|eq:index_adjust>>>|<row|<cell|>|<cell|=<big|sum><rsub|j\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-j*T|)><eq-number><label|eq:reindex>>>|<row|<cell|>|<cell|=<text|III><rsub|T><around|(|x|)><eq-number><label|eq:period_result>>>>>
    </align>

    where step <eqref|eq:reindex> substitutes <math|j=k-1> and uses the fact
    that as <math|k> ranges over all integers, so does <math|j>.
  </proof>

  <section|Sampling and Replication Properties>

  <\theorem>
    <label|thm:sampling_property>For any function <math|f> and the Shah
    function, the sampling property states

    <\equation>
      <label|eq:sampling>f<around|(|x|)>\<cdot\><text|III><rsub|T><around|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|k*T|)>*\<delta\>*<around|(|x-k*T|)>
    </equation>
  </theorem>

  <\proof>
    The product of distributions is defined through the action on test
    functions. For <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|f\<cdot\><text|III><rsub|T>,\<phi\>|\<rangle\>>>|<cell|=<around|\<langle\>|f,<text|III><rsub|T>\<cdot\>\<phi\>|\<rangle\>><eq-number><label|eq:product_definition>>>|<row|<cell|>|<cell|=<around|\<langle\>|f,\<phi\>*<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>|(>\<cdot\>-k*T)\<rangle\><eq-number><label|eq:shah_expand>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><around|\<langle\>|f,\<phi\>*\<delta\>|(>\<cdot\>-k*T)\<rangle\><eq-number><label|eq:distribute_sum>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><around|\<langle\>|f*\<delta\>|(>\<cdot\>-k*T),\<phi\>\<rangle\><eq-number><label|eq:product_delta>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><around|\<langle\>|f*<around|(|k*T|)>*\<delta\>|(>\<cdot\>-k*T),\<phi\>\<rangle\><eq-number><label|eq:evaluate_at_k>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|k*T|)><around|\<langle\>|\<delta\>|(>\<cdot\>-k*T),\<phi\>\<rangle\><eq-number><label|eq:factor_constant>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|k*T|)>*\<phi\>*<around|(|k*T|)><eq-number><label|eq:delta_action>>>>>
    </align>

    Step <eqref|eq:evaluate_at_k> uses the fact that
    <math|f*\<delta\>*<around|(|x-k*T|)>=f*<around|(|k*T|)>*\<delta\>*<around|(|x-k*T|)>>
    since the delta function localizes the product to <math|x=k*T>.

    This establishes that <math|f\<cdot\><text|III><rsub|T>> has the same
    distributional action as <math|<big|sum><rsub|k>f*<around|(|k*T|)>*\<delta\>*<around|(|\<cdummy\>-k*T|)>>.
  </proof>

  <\theorem>
    <label|thm:replication_property>The replication property of the Shah
    function under convolution is

    <\equation>
      <label|eq:replication>(f\<ast\><text|III><rsub|T>)<around|(|x|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|x-k*T|)>
    </equation>

    where <math|\<ast\>> denotes convolution.
  </theorem>

  <\proof>
    By definition of convolution with a distribution:

    <\align>
      <tformat|<table|<row|<cell|(f\<ast\><text|III><rsub|T>)<around|(|x|)>>|<cell|=<around|\<langle\>|<text|III><rsub|T>|(>\<cdot\>),f(x-\<cdot\><around|)||\<rangle\>><eq-number><label|eq:convolution_def>>>|<row|<cell|>|<cell|=<around*|\<langle\>|<big|sum><rsub|k\<in\>\<bbb-Z\>>\<delta\>|(>\<cdot\>-k*T),f(x-\<cdot\><around*|)||\<rangle\>><eq-number><label|eq:shah_in_convolution>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><around|\<langle\>|\<delta\>|(>\<cdot\>-k*T),f(x-\<cdot\><around|)||\<rangle\>><eq-number><label|eq:sum_linearity>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|x-k*T|)><eq-number><label|eq:sifting_convolution>>>>>
    </align>

    where step <eqref|eq:sifting_convolution> applies the sifting property at
    <math|k*T>.
  </proof>

  <section|Fourier Transform Properties>

  <\theorem>
    <label|thm:shah_fourier>The Fourier transform of the Shah function with
    period <math|T> is

    <\equation>
      <label|eq:shah_fourier_transform>\<cal-F\><around|[|<text|III><rsub|T>|]><around|(|\<omega\>|)>=<frac|2*\<pi\>|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)>=<frac|2*\<pi\>|T><text|III><rsub|<frac|2*\<pi\>|T>><around|(|\<omega\>|)>
    </equation>

    using the angular frequency convention
    <math|\<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x>.
  </theorem>

  <\proof>
    The Fourier transform of III<rsub|<math|T>> is computed using the Poisson
    summation formula. First, consider the fundamental period function

    <\equation>
      <label|eq:fundamental_period>g<rsub|T><around|(|x|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
      ><around|\||x|\|>\<less\>T/2>>|<row|<cell|0>|<cell|<text|if
      ><around|\||x|\|>\<gtr\>T/2>>>>>
    </equation>

    The Shah function can be expressed as the limit:

    <\equation>
      <label|eq:shah_as_limit><text|III><rsub|T><around|(|x|)>=lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      <frac|1|T>*<big|sum><rsub|k\<in\>\<bbb-Z\>>g<rsub|\<epsilon\>>*<around|(|x-k*T|)>
    </equation>

    The Fourier transform of <math|g<rsub|\<epsilon\>>> is:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|g<rsub|\<epsilon\>>|]><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<epsilon\>/2><rsup|\<epsilon\>/2>e<rsup|-i*\<omega\>*x>*d*x<eq-number><label|eq:g_epsilon_fourier>>>|<row|<cell|>|<cell|=<frac|2*sin
      <around|(|\<omega\>*\<epsilon\>/2|)>|\<omega\>><eq-number><label|eq:sinc_result>>>>>
    </align>

    For <math|\<epsilon\>\<to\>0>, this approaches <math|\<epsilon\>> for
    <math|\<omega\>=0> and <math|0> for <math|\<omega\>\<neq\>0>, giving
    <math|\<cal-F\><around|[|g<rsub|\<epsilon\>>|]><around|(|\<omega\>|)>\<to\>\<epsilon\>\<cdot\>2*\<pi\>*\<delta\><around|(|\<omega\>|)>>
    in the distributional limit.

    Alternatively, use the direct approach with the Poisson summation
    formula. The periodic distribution III<rsub|<math|T>> has Fourier series
    representation:

    <\equation>
      <label|eq:fourier_series_shah><text|III><rsub|T><around|(|x|)>=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|i*2*\<pi\>*n*x/T>
    </equation>

    Taking the Fourier transform term by term:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|<text|III><rsub|T>|]><around|(|\<omega\>|)>>|<cell|=\<cal-F\>*<around*|[|<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|i*2*\<pi\>*n*x/T>|]><eq-number><label|eq:fourier_series_transform>>>|<row|<cell|>|<cell|=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|e<rsup|i*2*\<pi\>*n*x/T>|]><around|(|\<omega\>|)><eq-number><label|eq:linearity_fourier>>>|<row|<cell|>|<cell|=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>2*\<pi\>*\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:exponential_fourier>>>|<row|<cell|>|<cell|=<frac|2*\<pi\>|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:factor_out_2pi>>>>>
    </align>

    Step <eqref|eq:exponential_fourier> uses
    <math|\<cal-F\><around|[|e<rsup|i*\<omega\><rsub|0>*x>|]><around|(|\<omega\>|)>=2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>>.
  </proof>

  <\corollary>
    <label|cor:shah_self_reciprocal>The Shah function is self-reciprocal
    under Fourier transform up to scaling:

    <\equation>
      <label|eq:self_reciprocal>\<cal-F\><around|[|<text|III><rsub|T>|]>=<frac|2*\<pi\>|T><text|III><rsub|<frac|2*\<pi\>|T>>
    </equation>
  </corollary>

  <section|Sampling Theorem and Spectral Replication>

  <\theorem>
    <label|thm:sampling_spectral>When a function <math|f<around|(|x|)>> is
    multiplied by III<math|<rsub|T><around|(|x|)>>, its Fourier transform
    becomes

    <\equation>
      <label|eq:sampling_spectrum>\<cal-F\>*<around|[|f*\<cdummy\><text|III><rsub|T>|]><around|(|\<omega\>|)>=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)>
    </equation>
  </theorem>

  <\proof>
    Using the convolution theorem and result
    <eqref|eq:shah_fourier_transform>:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\>*<around|[|f*\<cdummy\><text|III><rsub|T>|]><around|(|\<omega\>|)>>|<cell|=<frac|1|2*\<pi\>>*<around|(|\<cal-F\><around|[|f|]>\<ast\>\<cal-F\><around|[|<text|III><rsub|T>|]>|)><around|(|\<omega\>|)><eq-number><label|eq:convolution_theorem>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*\<cal-F\><around|[|f|]>\<ast\><around*|(|<frac|2*\<pi\>|T><text|III><rsub|<frac|2*\<pi\>|T>>|)><around|(|\<omega\>|)><eq-number><label|eq:substitute_shah_fourier>>>|<row|<cell|>|<cell|=<frac|1|T>(\<cal-F\><around|[|f|]>\<ast\><text|III><rsub|<frac|2*\<pi\>|T>>)<around|(|\<omega\>|)><eq-number><label|eq:factor_constants>>>>>
    </align>

    Applying the replication property <eqref|eq:replication> to the
    convolution:

    <\align>
      <tformat|<table|<row|<cell|(\<cal-F\><around|[|f|]>\<ast\><text|III><rsub|<frac|2*\<pi\>|T>>)<around|(|\<omega\>|)>>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|\<omega\>-n\<cdot\><frac|2*\<pi\>|T>|)><eq-number><label|eq:replication_applied>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:index_order>>>>>
    </align>

    Combining with <eqref|eq:factor_constants>:

    <\equation>
      <label|eq:final_sampling_spectrum>\<cal-F\>*<around|[|f*\<cdummy\><text|III><rsub|T>|]><around|(|\<omega\>|)>=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)>
    </equation>
  </proof>

  <\theorem>
    <label|thm:periodization_spectrum>When a function <math|f<around|(|x|)>>
    is convolved with III<math|<rsub|T><around|(|x|)>>, its Fourier transform
    becomes

    <\equation>
      <label|eq:periodization_spectrum>\<cal-F\>[f\<ast\><text|III><rsub|T>]<around|(|\<omega\>|)>=\<cal-F\><around|[|f|]><around|(|\<omega\>|)>\<cdot\>\<cal-F\><around|[|<text|III><rsub|T>|]><around|(|\<omega\>|)>=<frac|2*\<pi\>|T>*\<cal-F\><around|[|f|]><around|(|\<omega\>|)>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)>
    </equation>
  </theorem>

  <\proof>
    Direct application of the convolution theorem:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\>[f\<ast\><text|III><rsub|T>]<around|(|\<omega\>|)>>|<cell|=\<cal-F\><around|[|f|]><around|(|\<omega\>|)>\<cdot\>\<cal-F\><around|[|<text|III><rsub|T>|]><around|(|\<omega\>|)><eq-number><label|eq:product_theorem>>>|<row|<cell|>|<cell|=\<cal-F\><around|[|f|]><around|(|\<omega\>|)>\<cdot\><frac|2*\<pi\>|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:substitute_shah_transform>>>|<row|<cell|>|<cell|=<frac|2*\<pi\>|T>*\<cal-F\><around|[|f|]><around|(|\<omega\>|)>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<omega\>-<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:distribute_f>>>>>
    </align>

    This shows that the spectrum is sampled at the reciprocal lattice points
    <math|<frac|2*\<pi\>*n|T>>.
  </proof>

  <section|Two-Dimensional Shah Function>

  <\definition>
    <label|def:shah_2d>The two-dimensional Shah function on a rectangular
    lattice with periods <math|T<rsub|x>,T<rsub|y>\<gtr\>0> is

    <\equation>
      <label|eq:shah_2d><text|III><rsub|T<rsub|x>,T<rsub|y>><around|(|x,y|)>=<big|sum><rsub|m,n\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:shah_2d_fourier>The two-dimensional Fourier transform of the
    rectangular lattice Shah function is

    <\equation>
      <label|eq:shah_2d_fourier>\<cal-F\><around|[|<text|III><rsub|T<rsub|x>,T<rsub|y>>|]><around|(|k<rsub|x>,k<rsub|y>|)>=<frac|<around|(|2*\<pi\>|)><rsup|2>|T<rsub|x>*T<rsub|y>>*<big|sum><rsub|m,n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|x>-<frac|2*\<pi\>*m|T<rsub|x>>|)>*\<delta\>*<around*|(|k<rsub|y>-<frac|2*\<pi\>*n|T<rsub|y>>|)>
    </equation>
  </theorem>

  <\proof>
    The two-dimensional Fourier transform factorizes:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|\<cal-F\><around|[|<text|III><rsub|T<rsub|x>,T<rsub|y>>|]><around|(|k<rsub|x>,k<rsub|y>|)>>>|<row|<cell|>|<cell|=<iint><text|III><rsub|T<rsub|x>,T<rsub|y>><around|(|x,y|)>*e<rsup|-i*<around|(|k<rsub|x>*x+k<rsub|y>*y|)>>*d*x*d*y<eq-number><label|eq:2d_fourier_def>>>|<row|<cell|>|<cell|=<iint><big|sum><rsub|m,n\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>*e<rsup|-i*<around|(|k<rsub|x>*x+k<rsub|y>*y|)>>*d*x*d*y<eq-number><label|eq:substitute_2d_shah>>>|<row|<cell|>|<cell|=<big|sum><rsub|m,n\<in\>\<bbb-Z\>><iint>\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>*e<rsup|-i*<around|(|k<rsub|x>*x+k<rsub|y>*y|)>>*d*x*d*y<eq-number><label|eq:interchange_sum_integral>>>|<row|<cell|>|<cell|=<big|sum><rsub|m,n\<in\>\<bbb-Z\>>e<rsup|-i*<around|(|k<rsub|x>*m*T<rsub|x>+k<rsub|y>*n*T<rsub|y>|)>><eq-number><label|eq:delta_sifting_2d>>>|<row|<cell|>|<cell|=<big|sum><rsub|m\<in\>\<bbb-Z\>>e<rsup|-i*k<rsub|x>*m*T<rsub|x>>*<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-i*k<rsub|y>*n*T<rsub|y>><eq-number><label|eq:factor_exponentials>>>>>
    </align>

    Each sum is a one-dimensional Shah transform:

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|m\<in\>\<bbb-Z\>>e<rsup|-i*k<rsub|x>*m*T<rsub|x>>>|<cell|=<frac|2*\<pi\>|T<rsub|x>>*<big|sum><rsub|j\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|x>-<frac|2*\<pi\>*j|T<rsub|x>>|)><eq-number><label|eq:x_direction_shah>>>|<row|<cell|<big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-i*k<rsub|y>*n*T<rsub|y>>>|<cell|=<frac|2*\<pi\>|T<rsub|y>>*<big|sum><rsub|\<ell\>\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|y>-<frac|2*\<pi\>*\<ell\>|T<rsub|y>>|)><eq-number><label|eq:y_direction_shah>>>>>
    </align>

    Taking the product:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|\<cal-F\><around|[|<text|III><rsub|T<rsub|x>,T<rsub|y>>|]><around|(|k<rsub|x>,k<rsub|y>|)>>>|<row|<cell|>|<cell|=<frac|2*\<pi\>|T<rsub|x>>*<big|sum><rsub|j\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|x>-<frac|2*\<pi\>*j|T<rsub|x>>|)>\<cdot\><frac|2*\<pi\>|T<rsub|y>>*<big|sum><rsub|\<ell\>\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|y>-<frac|2*\<pi\>*\<ell\>|T<rsub|y>>|)><eq-number><label|eq:product_1d_transforms>>>|<row|<cell|>|<cell|=<frac|<around|(|2*\<pi\>|)><rsup|2>|T<rsub|x>*T<rsub|y>>*<big|sum><rsub|j,\<ell\>\<in\>\<bbb-Z\>>\<delta\>*<around*|(|k<rsub|x>-<frac|2*\<pi\>*j|T<rsub|x>>|)>*\<delta\>*<around*|(|k<rsub|y>-<frac|2*\<pi\>*\<ell\>|T<rsub|y>>|)><eq-number><label|eq:final_2d_result>>>>>
    </align>

    Relabeling <math|j=m,\<ell\>=n> gives equation
    <eqref|eq:shah_2d_fourier>.
  </proof>

  <section|Weighted Shah Functions>

  <\definition>
    <label|def:weighted_shah>A weighted two-dimensional Shah function
    incorporates reliability weights <math|w<rsub|m,n>>, density weights
    <math|\<rho\><around|(|x,y|)>>, and local tapers
    <math|\<tau\><around|(|x,y|)>>:

    <\equation>
      <label|eq:weighted_shah><text|III><rsub|w,\<rho\>,\<tau\>><around|(|x,y|)>=<big|sum><rsub|m,n\<in\>\<bbb-Z\>>w<rsub|m,n>*\<rho\><around|(|m*T<rsub|x>,n*T<rsub|y>|)>*\<tau\><around|(|x-m*T<rsub|x>,y-n*T<rsub|y>|)>*\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:weighted_shah_properties>The weighted Shah function satisfies
    the sampling property

    <\equation>
      <label|eq:weighted_sampling>f*<around|(|x,y|)>\<cdot\><text|III><rsub|w,\<rho\>,\<tau\>><around|(|x,y|)>=<big|sum><rsub|m,n>w<rsub|m,n>*\<rho\><around|(|m*T<rsub|x>,n*T<rsub|y>|)>*f*<around|(|m*T<rsub|x>,n*T<rsub|y>|)>*\<tau\><around|(|0,0|)>*\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>
    </equation>
  </theorem>

  <\proof>
    For each term in the weighted sum:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|f*<around|(|x,y|)>\<cdot\>w<rsub|m,n>*\<rho\><around|(|m*T<rsub|x>,n*T<rsub|y>|)>*\<tau\><around|(|x-m*T<rsub|x>,y-n*T<rsub|y>|)>*\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)>>>|<row|<cell|>|<cell|=w<rsub|m,n>*\<rho\><around|(|m*T<rsub|x>,n*T<rsub|y>|)>*f*<around|(|x,y|)>*\<tau\><around|(|x-m*T<rsub|x>,y-n*T<rsub|y>|)>*\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)><eq-number><label|eq:rearrange_factors>>>|<row|<cell|>|<cell|=w<rsub|m,n>*\<rho\><around|(|m*T<rsub|x>,n*T<rsub|y>|)>*f*<around|(|m*T<rsub|x>,n*T<rsub|y>|)>*\<tau\><around|(|0,0|)>*\<delta\>*<around|(|x-m*T<rsub|x>|)>*\<delta\>*<around|(|y-n*T<rsub|y>|)><eq-number><label|eq:evaluate_at_lattice>>>>>
    </align>

    Step <eqref|eq:evaluate_at_lattice> uses the fact that the delta
    functions force evaluation at <math|<around|(|x,y|)>=<around|(|m*T<rsub|x>,n*T<rsub|y>|)>>,
    so <math|f*<around|(|x,y|)>=f*<around|(|m*T<rsub|x>,n*T<rsub|y>|)>> and
    <math|\<tau\><around|(|x-m*T<rsub|x>,y-n*T<rsub|y>|)>=\<tau\><around|(|0,0|)>>.

    Summing over all lattice points <math|<around|(|m,n|)>> gives equation
    <eqref|eq:weighted_sampling>.
  </proof>

  <section|Connection to Poisson Summation>

  <\theorem>
    <label|thm:poisson_shah_connection>The Poisson summation formula can be
    expressed using Shah functions as

    <\equation>
      <label|eq:poisson_shah><big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|k*T|)>=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]><around*|(|<frac|2*\<pi\>*n|T>|)>
    </equation>

    This identity follows from the duality between multiplication by
    III<rsub|<math|T>> (sampling) and convolution with
    III<rsub|<math|2*\<pi\>/T>> (replication) in the frequency domain.
  </theorem>

  <\proof>
    Consider the identity:

    <\equation>
      <label|eq:shah_pairing>\<langle\><text|III><rsub|T>,f\<rangle\>=\<langle\><text|III>,f(T\<cdot\><around|)||\<rangle\>>=<big|sum><rsub|k\<in\>\<bbb-Z\>>f*<around|(|k*T|)>
    </equation>

    By Parseval's theorem for distributions:

    <\equation>
      <label|eq:parseval_shah>\<langle\><text|III><rsub|T>,f\<rangle\>=<frac|1|2*\<pi\>>*<around|\<langle\>|\<cal-F\><around|[|<text|III><rsub|T>|]>,\<cal-F\><around|[|f|]>|\<rangle\>>
    </equation>

    Substituting the Fourier transform of the Shah function from equation
    <eqref|eq:shah_fourier_transform>:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|2*\<pi\>>*<around|\<langle\>|\<cal-F\><around|[|<text|III><rsub|T>|]>,\<cal-F\><around|[|f|]>|\<rangle\>>>|<cell|=<frac|1|2*\<pi\>>*<around*|\<langle\>|<frac|2*\<pi\>|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around*|(|\<cdot\>-<frac|2*\<pi\>*n|T>|)>,\<cal-F\><around|[|f|]>|\<rangle\>><eq-number><label|eq:substitute_shah_fourier_full>>>|<row|<cell|>|<cell|=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>><around*|\<langle\>|\<delta\>*<around*|(|\<cdot\>-<frac|2*\<pi\>*n|T>|)>,\<cal-F\><around|[|f|]>|\<rangle\>><eq-number><label|eq:factor_constants_poisson>>>|<row|<cell|>|<cell|=<frac|1|T>*<big|sum><rsub|n\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]><around*|(|<frac|2*\<pi\>*n|T>|)><eq-number><label|eq:delta_evaluation>>>>>
    </align>

    Equating <eqref|eq:shah_pairing> and <eqref|eq:delta_evaluation> yields
    the Poisson summation formula <eqref|eq:poisson_shah>.
  </proof>

  <section|Applications to Discrete Fourier Transform>

  <\theorem>
    <label|thm:dft_shah_connection>The discrete Fourier transform of a finite
    sequence can be understood as the result of sampling and periodization
    operations using Shah functions. For a sequence
    <math|<around|{|x<rsub|n>|}><rsub|n=0><rsup|N-1>> with
    <math|x<rsub|n>=f*<around|(|n*T|)>> for some continuous function
    <math|f>, the DFT coefficients satisfy

    <\equation>
      <label|eq:dft_shah>X<rsub|k>=T*<big|sum><rsub|m\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|<frac|2*\<pi\>*k|N*T>-<frac|2*\<pi\>*m|T>|)>
    </equation>
  </theorem>

  <\proof>
    The finite sequence corresponds to sampling <math|f> with a windowed Shah
    function:

    <\equation>
      <label|eq:windowed_sampling>f<rsub|s><around|(|x|)>=f<around|(|x|)>*<big|sum><rsub|n=0><rsup|N-1>\<delta\>*<around|(|x-n*T|)>=f<around|(|x|)>\<cdot\>W<rsub|N><around|(|x|)>\<cdot\><text|III><rsub|T><around|(|x|)>
    </equation>

    where <math|W<rsub|N><around|(|x|)>=<big|sum><rsub|n=0><rsup|N-1>\<delta\>*<around|(|x-n*T|)>/<text|III><rsub|T><around|(|x|)>>
    is the windowing function.

    The DFT coefficient is:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=<big|sum><rsub|n=0><rsup|N-1>f*<around|(|n*T|)>*e<rsup|-2*\<pi\>*i*k*n/N><eq-number><label|eq:dft_definition>>>|<row|<cell|>|<cell|=T*<big|sum><rsub|n=0><rsup|N-1>f*<around|(|n*T|)>*e<rsup|-2*\<pi\>*i*k*n*T/<around|(|N*T|)>><eq-number><label|eq:factor_T>>>|<row|<cell|>|<cell|=T*<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|s><around|(|x|)>*e<rsup|-2*\<pi\>*i*k*x/<around|(|N*T|)>>*d*x<eq-number><label|eq:integral_form>>>>>
    </align>

    Step <eqref|eq:integral_form> recognizes the sum as a Riemann sum
    approximation to the integral with spacing <math|T>.

    The Fourier transform of <math|f<rsub|s>> involves convolution with the
    Shah transform:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><around|[|f<rsub|s>|]><around*|(|<frac|2*\<pi\>*k|N*T>|)>>|<cell|=<frac|1|T>*<big|sum><rsub|m\<in\>\<bbb-Z\>>\<cal-F\>*<around|[|f\<cdot\>W<rsub|N>|]>*<around*|(|<frac|2*\<pi\>*k|N*T>-<frac|2*\<pi\>*m|T>|)><eq-number><label|eq:sampling_effect>>>>>
    </align>

    For large <math|N>, the windowing effect becomes negligible for most
    frequencies, giving:

    <\equation>
      <label|eq:asymptotic_dft>X<rsub|k>\<approx\>T*<big|sum><rsub|m\<in\>\<bbb-Z\>>\<cal-F\><around|[|f|]>*<around*|(|<frac|2*\<pi\>*k|N*T>-<frac|2*\<pi\>*m|T>|)>
    </equation>
  </proof>

  <section|Normalization and Integral Properties>

  <\proposition>
    <label|prop:shah_normalization>The Shah function satisfies the
    normalization condition that for any interval of length <math|T>
    containing exactly one lattice point,

    <\equation>
      <label|eq:shah_integral><big|int><rsub|a><rsup|a+T><text|III><rsub|T><around|(|x|)>*\<phi\><around|(|x|)>*d*x=\<phi\>*<around|(|k*T|)>
    </equation>

    where <math|k*T\<in\><around|(|a,a+T|)>> is the unique lattice point in
    the interval and <math|\<phi\>> is any test function.
  </proposition>

  <\proof>
    Since III<math|<rsub|T><around|(|x|)>=<big|sum><rsub|j\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-j*T|)>>,
    only one term contributes to the integral:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|a><rsup|a+T><text|III><rsub|T><around|(|x|)>*\<phi\><around|(|x|)>*d*x>|<cell|=<big|int><rsub|a><rsup|a+T><big|sum><rsub|j\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-j*T|)>*\<phi\><around|(|x|)>*d*x<eq-number><label|eq:expand_integral>>>|<row|<cell|>|<cell|=<big|sum><rsub|j\<in\>\<bbb-Z\>><big|int><rsub|a><rsup|a+T>\<delta\>*<around|(|x-j*T|)>*\<phi\><around|(|x|)>*d*x<eq-number><label|eq:interchange_sum_integral_norm>>>|<row|<cell|>|<cell|=<big|int><rsub|a><rsup|a+T>\<delta\>*<around|(|x-k*T|)>*\<phi\><around|(|x|)>*d*x<eq-number><label|eq:single_term>>>|<row|<cell|>|<cell|=\<phi\>*<around|(|k*T|)><eq-number><label|eq:sifting_normalization>>>>>
    </align>

    Step <eqref|eq:single_term> uses the fact that only <math|j=k>
    contributes since <math|k*T> is the unique lattice point in
    <math|<around|(|a,a+T|)>>.
  </proof>

  This normalization ensures that the Shah function acts as a proper sampling
  operator, extracting function values at lattice points with unit weight per
  period.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-10|<tuple|10|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-4|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-5|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-6|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-7|<tuple|7|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-8|<tuple|8|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-9|<tuple|9|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|cor:shah_self_reciprocal|<tuple|8|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|def:shah_2d|<tuple|11|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|def:shah_function|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|def:weighted_shah|<tuple|13|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:2d_fourier_def|<tuple|54|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:asymptotic_dft|<tuple|79|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:convolution_def|<tuple|26|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:convolution_theorem|<tuple|42|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:delta_action|<tuple|24|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:delta_evaluation|<tuple|72|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:delta_scaling|<tuple|11|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:delta_sifting|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:delta_sifting_2d|<tuple|57|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:dft_definition|<tuple|75|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:dft_shah|<tuple|73|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:distribute_f|<tuple|51|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:distribute_sum|<tuple|20|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:evaluate_at_k|<tuple|22|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:evaluate_at_lattice|<tuple|66|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:expand_integral|<tuple|81|10|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:exponential_fourier|<tuple|38|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_T|<tuple|76|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_constant|<tuple|23|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_constants|<tuple|44|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_constants_poisson|<tuple|71|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_exponentials|<tuple|58|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_out|<tuple|10|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:factor_out_2pi|<tuple|39|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:final_2d_result|<tuple|62|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:final_sampling_spectrum|<tuple|47|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:fourier_series_shah|<tuple|35|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:fourier_series_transform|<tuple|36|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:fundamental_period|<tuple|31|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:g_epsilon_fourier|<tuple|33|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:index_adjust|<tuple|14|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:index_order|<tuple|46|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:integral_form|<tuple|77|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:interchange_sum_integral|<tuple|56|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:interchange_sum_integral_norm|<tuple|82|10|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:linearity_fourier|<tuple|37|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:linearity_functional|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:parseval_shah|<tuple|69|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:period_result|<tuple|16|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:period_shift|<tuple|13|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:periodization_spectrum|<tuple|48|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:poisson_shah|<tuple|67|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:product_1d_transforms|<tuple|61|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:product_definition|<tuple|18|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:product_delta|<tuple|21|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:product_theorem|<tuple|49|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:rearrange_factors|<tuple|65|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:reindex|<tuple|15|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:replication|<tuple|25|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:replication_applied|<tuple|45|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sampling|<tuple|17|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sampling_effect|<tuple|78|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sampling_spectrum|<tuple|41|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:scaling_rhs|<tuple|9|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:scaling_start|<tuple|8|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:self_reciprocal|<tuple|40|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_2d|<tuple|52|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_2d_fourier|<tuple|53|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_action|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_action_expand|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_as_limit|<tuple|32|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_expand|<tuple|19|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_fourier_transform|<tuple|30|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_in_convolution|<tuple|27|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_integral|<tuple|80|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_pairing|<tuple|68|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_period_T|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_periodic|<tuple|12|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_scaling|<tuple|7|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:shah_unit|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sifting_convolution|<tuple|29|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sifting_normalization|<tuple|84|10|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sinc_result|<tuple|34|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:single_term|<tuple|83|10|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:substitute_2d_shah|<tuple|55|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:substitute_shah_fourier|<tuple|43|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:substitute_shah_fourier_full|<tuple|70|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:substitute_shah_transform|<tuple|50|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sum_linearity|<tuple|28|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:weighted_sampling|<tuple|64|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:weighted_shah|<tuple|63|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:windowed_sampling|<tuple|74|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:x_direction_shah|<tuple|59|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:y_direction_shah|<tuple|60|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|prop:shah_normalization|<tuple|17|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|prop:shah_periodicity|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|prop:shah_support|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:dft_shah_connection|<tuple|16|9|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:periodization_spectrum|<tuple|10|6|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:poisson_shah_connection|<tuple|15|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:replication_property|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:sampling_property|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:sampling_spectral|<tuple|9|5|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:shah_2d_fourier|<tuple|12|7|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:shah_fourier|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:shah_scaling|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:weighted_shah_properties|<tuple|14|8|../.TeXmacs/texts/scratch/no_name_16.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definition
      and Basic Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Scaling
      and Periodicity Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Sampling
      and Replication Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Fourier
      Transform Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Sampling
      Theorem and Spectral Replication> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Two-Dimensional
      Shah Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Weighted
      Shah Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Connection
      to Poisson Summation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Applications
      to Discrete Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Normalization
      and Integral Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>