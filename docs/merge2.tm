<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Measure-Preserving Bijective Time Changes of
  Stationary Gaussian Processes Generate Oscillatory Processes With Evolving
  Spectra>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>|<doc-date|August 1,
  2025>>

  <abstract-data|<\abstract>
    This article establishes that Gaussian processes obtained through
    measure-preserving bijective unitary time transformations of stationary
    processes constitute a subclass of oscillatory processes in the sense of
    Priestley. The transformation <math|X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>>,
    where <math|S<rsub|t>> is a stationary Gaussian process and
    <math|\<theta\>> is a strictly monotonic function, yields an oscillatory
    process with evolutionary power spectrum
    <math|d*F<rsub|t><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>>.
    An explicit unitary transformation between the original stationary
    process and the transformed oscillatory process is established,
    preserving the <math|L<rsup|2>>-norm and providing a complete spectral
    characterization.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Scaling
    Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Stationary
    Reference Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Time-Changed
    Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Definition and Unitary Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|4.2<space|2spc>Oscillatory Representation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.3<space|2spc>Envelope and Evolutionary Spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc><with|mode|math|L<rsup|2>>-Norm
    Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Expected
    Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Scaling Functions><label|sec:scaling>

  <\definition>
    [Scaling Functions]<label|def:scaling> Let <math|\<cal-F\>> denote the
    set of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> satisfying

    <\enumerate>
      <item><math|\<theta\>> is continuously differentiable and
      <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> for all
      <math|t\<in\>\<bbb-R\>>,

      <item><math|\<theta\>> is strictly increasing and bijective.
    </enumerate>
  </definition>

  <\remark>
    The conditions in Definition<nbsp><reference|def:scaling> ensure that
    <math|\<theta\><rsup|-1>> exists and is differentiable, enabling
    measure-preserving transformations.
  </remark>

  <section|Oscillatory Processes><label|sec:oscillatory>

  <\definition>
    [Oscillatory Process]<label|def:oscillatory> A complex-valued,
    second-order process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>
    is called <em|oscillatory> if there exist

    <\enumerate>
      <item>a family of functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}><rsub|t\<in\>\<bbb-R\>>>
      with <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
      and <math|A<rsub|t><around|(|\<cdummy\>|)>\<in\>L<rsup|2><around|(|\<mu\>|)>>,

      <item>a complex orthogonal-increment process
      <math|Z<around|(|\<omega\>|)>> with
      <math|E*<around|\<lvert\>|d*Z<around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>,
    </enumerate>

    such that

    <\equation>
      <label|eq:oscillatory_rep>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>.
    </equation>
  </definition>

  <section|Stationary Reference Process><label|sec:stationary>

  Let <math|<around|{|S<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>> be a stationary
  Gaussian process with continuous spectral representation

  <\equation>
    <label|eq:stationary_rep>S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>,
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal-increment process
  with <math|E*<around|\<lvert\>|d*Z<around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>
  and <math|\<mu\>> is a finite measure on <math|\<bbb-R\>>.

  <section|Time-Changed Process><label|sec:time_change>

  <subsection|Definition and Unitary Operator>

  <\definition>
    [Time-Changed Process]<label|def:time_changed_proc> For
    <math|\<theta\>\<in\>\<cal-F\>>, define the time-changed process

    <\equation>
      <label|eq:time_change>X<rsub|t>\<assign\><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>S<rsub|\<theta\><around|(|t|)>>,<space|2em>t\<in\>\<bbb-R\>.
    </equation>
  </definition>

  <\lemma>
    [Unitary Transformation]<label|lem:unitary> Define the operator
    <math|M<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <label|eq:unitary_op><around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|t|)>|)>.
    </equation>

    Then <math|M<rsub|\<theta\>>> is unitary, i.e.,

    <\equation>
      <label|eq:L2_preserve><big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s.
    </equation>
  </lemma>

  <\proof>
    Apply the change of variables <math|s=\<theta\><around|(|t|)>>; then
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>, and
    equation<nbsp><eqref|eq:L2_preserve> follows immediately.
  </proof>

  <subsection|Oscillatory Representation>

  <\theorem>
    [Oscillatory Form]<label|thm:osc_rep> The process
    <math|<around|{|X<rsub|t>|}>> defined in
    equation<nbsp><eqref|eq:time_change> is oscillatory with

    <\equation>
      <label|eq:phi_def>\<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>.
    </equation>
  </theorem>

  <\proof>
    Substitute equation<nbsp><eqref|eq:stationary_rep> into
    equation<nbsp><eqref|eq:time_change>:

    <\equation*>
      X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>,
    </equation*>

    which is of the form<nbsp><eqref|eq:oscillatory_rep> with
    <math|\<phi\><rsub|t>> given by equation<nbsp><eqref|eq:phi_def>.
  </proof>

  <subsection|Envelope and Evolutionary Spectrum>

  <\corollary>
    [Envelope]<label|cor:envelope> Equation<nbsp><eqref|eq:phi_def> admits
    the decomposition

    <\equation>
      <label|eq:envelope>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>,<space|1em><text|where><space|1em>A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>.
    </equation>
  </corollary>

  <\corollary>
    [Evolutionary Spectrum]<label|cor:evolving_spec> The evolutionary power
    spectrum is

    <\equation>
      <label|eq:evolutionary_spec>d*F<rsub|t><around|(|\<omega\>|)>=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>.
    </equation>
  </corollary>

  <section|<math|L<rsup|2>>-Norm Preservation><label|sec:norm_preservation>

  <\theorem>
    [Measure Preservation]<label|thm:measure_preserve> The transformation
    defined in equation<nbsp><eqref|eq:time_change> preserves the
    <math|L<rsup|2>>-norm in the sense that

    <\equation>
      <label|eq:measure_preserve><big|int><rsub|I><math-up|var><around|(|X<rsub|t>|)>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|S<rsub|s>|)>*<space|0.17em>d*s
    </equation>

    for any measurable set <math|I\<subseteq\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Using the change of variables <math|s=\<theta\><around|(|t|)>> with
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I><math-up|var><around|(|X<rsub|t>|)>*<space|0.17em>d*t>|<cell|=<big|int><rsub|I><math-up|var><around*|(|<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>S<rsub|\<theta\><around|(|t|)>>|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I>\<theta\><rprime|'><around|(|t|)><space|0.17em><math-up|var><around|(|S<rsub|\<theta\><around|(|t|)>>|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|S<rsub|s>|)>*<space|0.17em>d*s.<eq-number>>>>>
    </align>
  </proof>

  <section|Expected Zero Count><label|sec:zero_count>

  <\theorem>
    [Expected Zero-Counting Function]<label|thm:zero_count> Let
    <math|\<theta\>\<in\>\<cal-F\>> and let <math|K<around|(|\<tau\>|)>> be
    the covariance function of the stationary process <math|S<rsub|t>>, twice
    differentiable at <math|\<tau\>=0>. The expected number of zeros of the
    process <math|X<rsub|t>> in the interval <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:zero_count>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>.
    </equation>
  </theorem>

  <\proof>
    By the Kac-Rice formula, the expected zero count is

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K<rsub|\<theta\>><around|(|s,t|)>>*<space|0.17em>d*t,
    </equation>

    where <math|K<rsub|\<theta\>><around|(|s,t|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>.
    Computing the mixed partial derivative:

    <\equation>
      <label|eq:mixed_partial>lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K<rsub|\<theta\>><around|(|s,t|)>=-<wide|K|\<ddot\>><around|(|0|)>*<space|0.17em>\<theta\><rprime|'><around|(|t|)><rsup|2>.
    </equation>

    Therefore:

    <\equation>
      <label|eq:zero_count_integral>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<big|int><rsub|a><rsup|b>\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>.
    </equation>
  </proof>

  <\thebibliography|99>
    <bibitem|priestley1965>M.B. Priestley. Evolutionary spectra and
    non-stationary processes. <em|Journal of the Royal Statistical Society,
    Series B>, 27(2):204\U237, 1965.

    <bibitem|cramer1967>H. Cramér and M.R. Leadbetter. <em|Stationary and
    Related Stochastic Processes>. Wiley, 1967.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|16|5>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|4.1|2>>
    <associate|auto-6|<tuple|4.2|3>>
    <associate|auto-7|<tuple|4.3|3>>
    <associate|auto-8|<tuple|5|4>>
    <associate|auto-9|<tuple|6|4>>
    <associate|bib-cramer1967|<tuple|cramer1967|5>>
    <associate|bib-priestley1965|<tuple|priestley1965|5>>
    <associate|cor:envelope|<tuple|7|3>>
    <associate|cor:evolving_spec|<tuple|8|3>>
    <associate|def:oscillatory|<tuple|3|2>>
    <associate|def:scaling|<tuple|1|2>>
    <associate|def:time_changed_proc|<tuple|4|2>>
    <associate|eq:L2_preserve|<tuple|5|3>>
    <associate|eq:envelope|<tuple|7|3>>
    <associate|eq:evolutionary_spec|<tuple|8|3>>
    <associate|eq:kac_rice|<tuple|14|4>>
    <associate|eq:measure_preserve|<tuple|9|4>>
    <associate|eq:mixed_partial|<tuple|15|4>>
    <associate|eq:oscillatory_rep|<tuple|1|2>>
    <associate|eq:phi_def|<tuple|6|3>>
    <associate|eq:stationary_rep|<tuple|2|2>>
    <associate|eq:time_change|<tuple|3|2>>
    <associate|eq:unitary_op|<tuple|4|3>>
    <associate|eq:zero_count|<tuple|13|4>>
    <associate|eq:zero_count_integral|<tuple|16|5>>
    <associate|lem:unitary|<tuple|5|3>>
    <associate|sec:norm_preservation|<tuple|5|4>>
    <associate|sec:oscillatory|<tuple|2|2>>
    <associate|sec:scaling|<tuple|1|2>>
    <associate|sec:stationary|<tuple|3|2>>
    <associate|sec:time_change|<tuple|4|2>>
    <associate|sec:zero_count|<tuple|6|4>>
    <associate|thm:measure_preserve|<tuple|9|4>>
    <associate|thm:osc_rep|<tuple|6|3>>
    <associate|thm:zero_count|<tuple|10|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Scaling
      Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Stationary
      Reference Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Time-Changed
      Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Definition and Unitary
      Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Oscillatory Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Envelope and Evolutionary
      Spectrum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc><with|mode|<quote|math>|L<rsup|2>>-Norm
      Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Expected
      Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>