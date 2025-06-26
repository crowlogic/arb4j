<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Spectral
    Representation of Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Spectral Representation of the
    Covariance Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>The Spectral Representation Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Comparison of Spectral Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Inversion Formulae
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.5<space|2spc>The Real-Valued Case
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  \;

  <section|Spectral Representation of Stationary Processes>

  <subsection|Spectral Representation of the Covariance Function>

  In particular, for <math|t=0>,

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<lambda\>,A|)>*<space|0.17em>d*\<lambda\>=r<around|(|0|)><label|eq:g_integral_r0>
  </equation>

  Thus, if the nonnegative function <math|g<around|(|\<lambda\>,A|)>/r<around|(|0|)>>
  is interpreted as a probability density, the corresponding characteristic
  function is <math|u*<around|(|t/A|)>*r<around|(|1|)>/r<around|(|0|)>>. As
  <math|A\<to\>\<infty\>>, this converges for every <math|t> to
  <math|r<around|(|t|)>/r<around|(|0|)>>, which is a continuous function of
  <math|t>. By the continuity theorem for characteristic functions
  (see<nbsp><cite|billingsley>), <math|r<around|(|t|)>/r<around|(|0|)>> is
  itself a characteristic function, so <math|r<around|(|t|)>> is a
  characteristic function multiplied by the constant <math|r<around|(|0|)>>.
  This yields the following fundamental representation:

  <\equation>
    r<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*F<around|(|\<lambda\>|)><label|eq:spectral_covariance>
  </equation>

  where <math|F<around|(|\<lambda\>|)>> is a non-decreasing function, called
  the <em|spectral distribution function> of the process
  <math|\<xi\><around|(|t|)>>.

  <math|F<around|(|\<lambda\>|)>> is defined up to an additive constant. It
  can always be chosen so that

  <\equation>
    F*<around|(|-\<infty\>|)>=0,<space|2em>F*<around|(|+\<infty\>|)>=r<around|(|0|)><label|eq:spectral_F_normalization>
  </equation>

  For the spectral representation<nbsp><eqref|eq:spectral_covariance>, the
  value of <math|F<around|(|\<lambda\>|)>> at discontinuities is immaterial,
  as long as <math|F*<around|(|\<lambda\>-0|)>\<leq\>F<around|(|\<lambda\>|)>\<leq\>F*<around|(|\<lambda\>+0|)>>
  for all <math|\<lambda\>>. Typically, <math|F<around|(|\<lambda\>|)>=F*<around|(|\<lambda\>+0|)>>
  is taken, so <math|F> is everywhere right-continuous.

  If <math|F<around|(|\<lambda\>|)>> is absolutely continuous, its derivative
  <math|f<around|(|\<lambda\>|)>=F<rprime|'><around|(|\<lambda\>|)>> is
  called the <em|spectral density> of the process.

  <subsection|The Spectral Representation Theorem>

  Consider a stationary process <math|\<xi\><around|(|t|)>> with zero mean,
  continuous in quadratic mean. Let <math|F<around|(|\<lambda\>|)>> be the
  spectral distribution function as defined above, right-continuous and
  satisfying<nbsp><eqref|eq:spectral_F_normalization>. The following theorem
  is fundamental.

  <\theorem>
    [Spectral Representation]<label|thm:spectral_representation> To every
    stationary process <math|\<xi\><around|(|t|)>> there exists a process
    <math|\<zeta\><around|(|\<lambda\>|)>> with orthogonal increments such
    that, for each fixed <math|t>,

    <\equation>
      \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:spectral_xi>
    </equation>

    where the stochastic integral is defined in the quadratic mean sense. The
    process <math|\<zeta\><around|(|\<lambda\>|)>> is defined up to an
    additive random variable. If <math|\<zeta\>*<around|(|-\<infty\>|)>=0> is
    imposed, then

    <\equation>
      \<bbb-E\><around|[|\<zeta\><around|(|\<lambda\>|)>|]>=0,<space|2em>\<bbb-E\><around|[|<around|\||\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=F<around|(|\<lambda\>|)>,<space|2em>\<bbb-E\><around|[|<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)><label|eq:zeta_properties>
    </equation>
  </theorem>

  <\proof>
    Let <math|H<around|(|\<xi\>|)>> be the Hilbert space generated by the
    random variables <math|\<xi\><around|(|t|)>> for all real <math|t>, with
    inner product <math|<around|(|\<eta\><rsub|1>,\<eta\><rsub|2>|)>=\<bbb-E\>*<around|[|\<eta\><rsub|1>*\<eta\><rsub|2>|]>>.
    Let <math|L<rsub|2><around|(|F|)>> denote the Hilbert space of
    complex-valued functions <math|g<around|(|\<lambda\>|)>> such that

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\><label|eq:L2F_def>
    </equation>

    The inner product in <math|L<rsub|2><around|(|F|)>> is

    <\equation>
      <around|(|g<rsub|1>,g<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsub|1><around|(|\<lambda\>|)><wide|g<rsub|2><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)><label|eq:L2F_inner>
    </equation>

    Establish a correspondence: for each <math|t>, associate
    <math|\<xi\><around|(|t|)>\<in\>H<around|(|\<xi\>|)>> with
    <math|e<rsup|i*t*\<lambda\>>\<in\>L<rsub|2><around|(|F|)>>. By Bochner's
    theorem,

    <\equation>
      \<bbb-E\>*<around|[|\<xi\><around|(|t|)>*\<xi\><around|(|u|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|t-u|)>*\<lambda\>>*d*F<around|(|\<lambda\>|)><label|eq:bochner>
    </equation>

    so inner products are preserved.

    Extend the correspondence to finite linear combinations:

    <\align>
      <tformat|<table|<row|<cell|\<eta\>>|<cell|=<big|sum><rsub|j=1><rsup|n>\<alpha\><rsub|j>*\<xi\><around|(|t<rsub|j>|)><eq-number><label|eq:eta_lincomb>>>|<row|<cell|g<around|(|\<lambda\>|)>>|<cell|=<big|sum><rsub|j=1><rsup|n>\<alpha\><rsub|j>*e<rsup|i*t<rsub|j>*\<lambda\>><eq-number><label|eq:g_lincomb>>>>>
    </align>

    Inner products are preserved:

    <\equation>
      <around|(|\<eta\><rsub|1>,\<eta\><rsub|2>|)>=<around|(|g<rsub|1>,g<rsub|2>|)><label|eq:inner_preserved>
    </equation>

    Similarly, the correspondence extends to limits in
    <math|H<around|(|\<xi\>|)>> and <math|L<rsub|2><around|(|F|)>>,
    preserving inner products and distances.

    For every <math|\<lambda\><rsub|0>>, let
    <math|g<around|(|\<lambda\>|)>=1> for <math|\<lambda\>\<leq\>0>, <math|0>
    otherwise. The corresponding element in <math|H<around|(|\<xi\>|)>> is
    denoted <math|\<zeta\><around|(|\<lambda\><rsub|0>|)>>. For
    <math|\<lambda\><rsub|0>\<less\>\<lambda\><rsub|1>>, the increment
    <math|\<zeta\><around|(|\<lambda\><rsub|1>|)>-\<zeta\><around|(|\<lambda\><rsub|0>|)>>
    corresponds to the function which is <math|1> on
    <math|<around|(|\<lambda\><rsub|0>,\<lambda\><rsub|1>|]>>, <math|0>
    elsewhere. For disjoint intervals, increments are orthogonal. Thus,
    <math|\<zeta\><around|(|\<lambda\>|)>> is a process with orthogonal
    increments and satisfies<nbsp><eqref|eq:zeta_properties>.

    The stochastic integral in<nbsp><eqref|eq:spectral_xi> is defined as the
    limit in quadratic mean of sums

    <\equation>
      \<eta\>=<big|sum><rsub|j=1><rsup|n>e<rsup|i*t*\<lambda\><rsub|j>>*<around|[|\<zeta\><around|(|\<lambda\><rsub|j+1>|)>-\<zeta\><around|(|\<lambda\><rsub|j>|)>|]><label|eq:riemann_sum>
    </equation>

    which corresponds to step functions converging to
    <math|e<rsup|i*t*\<lambda\>>> in <math|L<rsub|2><around|(|F|)>>. The
    limit is a well-defined element of <math|H<around|(|\<xi\>|)>>, and by
    uniqueness of the correspondence, the result follows.
  </proof>

  <subsection|Comparison of Spectral Representations>

  Compare the spectral representations of <math|r<around|(|t|)>> and
  <math|\<xi\><around|(|t|)>>:

  <\align>
    <tformat|<table|<row|<cell|r<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*F<around|(|\<lambda\>|)><eq-number><label|eq:spectral_r>>>|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:spectral_xi_again>>>>>
  </align>

  In both, the angular frequency is <math|\<lambda\>>. In the second, the
  squared random amplitude has mean equal to the nonrandom amplitude in the
  first:

  <\equation>
    \<bbb-E\><around|[|<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)><label|eq:amplitude_mean>
  </equation>

  The random phases in <math|d*\<zeta\><around|(|\<lambda\>|)>> are absent in
  the nonrandom oscillations of <math|r<around|(|t|)>>.

  For a physical system (e.g., fluctuating voltage), the spectral
  representation<nbsp><eqref|eq:spectral_xi_again> decomposes the total
  fluctuation into elementary harmonic components. The quantity
  <math|d*F<around|(|\<lambda\>|)>> is the average power dissipated by the
  component with frequency in <math|<around|(|\<lambda\>,\<lambda\>+d*\<lambda\>|)>>.
  The spectral distribution function <math|F<around|(|\<lambda\>|)>>
  determines the distribution of total average power over the frequency
  range. The average power assigned to the interval
  <math|<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|)>> is
  <math|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>;
  for the whole range,

  <\equation>
    \<bbb-E\><around|[|<around|\||\<xi\><around|(|t|)>|\|><rsup|2>|]>=r<around|(|0|)>=F*<around|(|+\<infty\>|)>-F*<around|(|-\<infty\>|)><label|eq:total_power>
  </equation>

  Thus, <math|F<around|(|\<lambda\>|)>> determines the power spectrum of the
  process.

  The spectral moments,

  <\equation>
    \<mu\><rsub|2*k>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\><rsup|2*k>*d*F<around|(|\<lambda\>|)><label|eq:spectral_moments>
  </equation>

  exist if and only if <math|r<around|(|t|)>> has a derivative of order
  <math|2*k> at <math|t=0>.

  By the Lebesgue decomposition, <math|F=F<rsub|1>+F<rsub|2>+F<rsub|3>>,
  where <math|F<rsub|1>> is the step function (discrete spectrum),
  <math|F<rsub|2>> is absolutely continuous (continuous spectrum), and
  <math|F<rsub|3>> is singular. In applications, <math|F<rsub|3>> is
  typically absent.

  If <math|F> has a jump <math|\<Delta\>*F> at <math|\<lambda\>>, this
  introduces a discrete harmonic term in the spectral representations:

  <\align>
    <tformat|<table|<row|<cell|r<around|(|t|)>>|<cell|=<big|sum>\<Delta\>*F*<space|0.17em>e<rsup|i*t*\<lambda\>><eq-number><label|eq:discrete_r>>>|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|sum>\<Delta\>*\<zeta\>*<space|0.17em>e<rsup|i*t*\<lambda\>><eq-number><label|eq:discrete_xi>>>>>
  </align>

  where the sum is over all jumps of <math|F>.

  For the absolutely continuous case, <math|F=F<rsub|2>>, with spectral
  density <math|f<around|(|\<lambda\>|)>=F<rprime|'><around|(|\<lambda\>|)>>

  <\equation>
    r<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*f<around|(|\<lambda\>|)>*d*\<lambda\><label|eq:ac_spectrum>
  </equation>

  <subsection|Inversion Formulae>

  For any two continuity points <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>>
  of <math|F>,

  <\align>
    <tformat|<table|<row|<cell|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*\<lambda\><rsub|1>>-e<rsup|-i*t*\<lambda\><rsub|2>>|-i*t>*r<around|(|t|)>*d*t<eq-number><label|eq:inversion_F>>>|<row|<cell|\<zeta\><around|(|\<lambda\><rsub|2>|)>-\<zeta\><around|(|\<lambda\><rsub|1>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    <frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*\<lambda\><rsub|1>>-e<rsup|-i*t*\<lambda\><rsub|2>>|-i*t>*\<xi\><around|(|t|)>*d*t<eq-number><label|eq:inversion_zeta>>>>>
  </align>

  For discontinuity points, replace <math|F<around|(|\<lambda\>|)>> by
  <math|<frac|1|2>*<around|[|F<around|(|\<lambda\>|)>+F*<around|(|\<lambda\>-0|)>|]>>
  and similarly for <math|\<zeta\><around|(|\<lambda\>|)>>.

  <subsection|The Real-Valued Case>

  If <math|\<xi\><around|(|t|)>> is real and stationary, the covariance
  function <math|r<around|(|t|)>> is real, and

  <\align>
    <tformat|<table|<row|<cell|r<around|(|t|)>>|<cell|=r*<around|(|-t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>cos
    <around|(|\<lambda\>*t|)>*d*F<around|(|\<lambda\>|)><eq-number><label|eq:real_covariance>>>|<row|<cell|0>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>sin
    <around|(|\<lambda\>*t|)>*d*F<around|(|\<lambda\>|)><eq-number><label|eq:real_sine>>>>>
  </align>

  <section*|References>

  <\thebibliography|9>
    <bibitem|billingsley>P. Billingsley, <em|Probability and Measure>, Wiley,
    1995.

    <bibitem|cramer>H. Cramér, <em|Mathematical Methods of Statistics>,
    Princeton University Press, 1946.

    <bibitem|loeve>M. Loève, <em|Probability Theory>, Van Nostrand, 1955.

    <bibitem|stone>M. H. Stone, \PLinear Transformations in Hilbert Space,\Q
    <em|Proc. Nat. Acad. Sci. USA>, vol. 16, pp. 172\U175, 1930.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|3>>
    <associate|auto-5|<tuple|1.4|4>>
    <associate|auto-6|<tuple|1.5|4>>
    <associate|auto-7|<tuple|24|5>>
    <associate|auto-8|<tuple|24|5>>
    <associate|bib-billingsley|<tuple|billingsley|5>>
    <associate|bib-cramer|<tuple|cramer|5>>
    <associate|bib-loeve|<tuple|loeve|5>>
    <associate|bib-stone|<tuple|stone|5>>
    <associate|eq:L2F_def|<tuple|6|2>>
    <associate|eq:L2F_inner|<tuple|7|2>>
    <associate|eq:ac_spectrum|<tuple|20|4>>
    <associate|eq:amplitude_mean|<tuple|15|3>>
    <associate|eq:bochner|<tuple|8|2>>
    <associate|eq:discrete_r|<tuple|18|4>>
    <associate|eq:discrete_xi|<tuple|19|4>>
    <associate|eq:eta_lincomb|<tuple|9|2>>
    <associate|eq:g_integral_r0|<tuple|1|1>>
    <associate|eq:g_lincomb|<tuple|10|2>>
    <associate|eq:inner_preserved|<tuple|11|3>>
    <associate|eq:inversion_F|<tuple|21|4>>
    <associate|eq:inversion_zeta|<tuple|22|4>>
    <associate|eq:real_covariance|<tuple|23|4>>
    <associate|eq:real_sine|<tuple|24|4>>
    <associate|eq:riemann_sum|<tuple|12|3>>
    <associate|eq:spectral_F_normalization|<tuple|3|1>>
    <associate|eq:spectral_covariance|<tuple|2|1>>
    <associate|eq:spectral_moments|<tuple|17|4>>
    <associate|eq:spectral_r|<tuple|13|3>>
    <associate|eq:spectral_xi|<tuple|4|2>>
    <associate|eq:spectral_xi_again|<tuple|14|3>>
    <associate|eq:total_power|<tuple|16|3>>
    <associate|eq:zeta_properties|<tuple|5|2>>
    <associate|thm:spectral_representation|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      billingsley
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Spectral
      Representation of Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Spectral Representation of
      the Covariance Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Spectral Representation
      Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Comparison of Spectral
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Inversion Formulae
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>The Real-Valued Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>