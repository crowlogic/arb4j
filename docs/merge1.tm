<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Measure-Preserving Bijective Time Changes of
  Stationary Gaussian Processes Generate Oscillatory Processes With Evolving
  Spectra>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-affiliation|<with|font-family|tt|stephencrowley214@gmail.com>>>>|<doc-date|August
  1, 2025>>

  <abstract-data|<\abstract>
    This article examines the precise structure and spectral properties of
    Gaussian processes obtained by measure-preserving, bijective, and
    strictly increasing time changes applied to stationary Gaussian
    processes. It is demonstrated that such transformations yield oscillatory
    processes in the sense of Priestley, with evolutionary spectra depending
    explicitly on the time-change function. Explicit oscillatory
    representations, preservation of <math|L<rsup|2>>-norms under
    transformation, and structure of evolutionary power spectra are
    established. The expected number of zeros in finite intervals is also
    analyzed in terms of the time-change and the original stationary kernel.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes and Their Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Spectral Representation of Stationary
    Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Oscillatory Processes (Priestley)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Measure-Preserving
    Bijective Time Changes of Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Scaling Function Class
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2<space|2spc>Transformation and Oscillatory
    Structure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.3<space|2spc>Evolutionary Power Spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Operator
    Isometry and <with|mode|math|L<rsup|2>>-Preservation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Zero
    Crossings for Time-Changed Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Discussion
    and Consequences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The classical theory of stationary processes is built upon the spectral
  representation theorem, which gives rise to powerful analytical techniques
  for understanding the frequency content of such processes. However,
  applying a strictly increasing, bijective, and differentiable time
  change\Vcombined with a measure-preserving Jacobian
  normalization\Vtransforms a stationary process into a new process that
  retains strong structure: it falls into the class of <em|oscillatory
  processes> as defined by Priestley (see <cite|priestley1965>). This article
  presents a systematic study of the properties, structure, and consequences
  of such transformations.

  <section|Oscillatory Processes and Their Representations>

  <subsection|Spectral Representation of Stationary Processes>

  <\definition>
    [Stationary Process]<label|def:stationary_process> A (complex-valued,
    mean zero) second-order process <math|<around|{|S<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>
    is said to be <em|stationary> if it admits the spectral representation

    <\equation>
      S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)><label|eq:spectral_stationary>
    </equation>

    where <math|Z<around|(|\<omega\>|)>> is a complex-valued orthogonal
    increment process satisfying

    <\equation>
      \<bbb-E\>*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)><label|eq:incr_variance>
    </equation>
  </definition>

  <subsection|Oscillatory Processes (Priestley)>

  <\definition>
    [Oscillatory Process]<label|def:oscillatory> A complex-valued
    second-order stochastic process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>I>>
    is called <em|oscillatory> if there exist:

    <\enumerate>
      <item>a family of functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}><rsub|t\<in\>I>>,
      each quadratically integrable with respect to a finite measure
      <math|\<mu\>> on <math|\<bbb-R\>>, and

      <item>a complex-valued orthogonal increment process
      <math|Z<around|(|\<omega\>|)>> with
      <math|\<bbb-E\>*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>,
    </enumerate>

    such that

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)><label|eq:oscillatory_proc>
    </equation>

    and for each <math|\<omega\>>,

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t><label|eq:oscillatory_func>
    </equation>

    with <math|A<rsub|t><around|(|\<omega\>|)>> the envelope (gain) function.
  </definition>

  <\remark>
    Every stationary process is oscillatory, with
    <math|A<rsub|t><around|(|\<omega\>|)>\<equiv\>1>.
  </remark>

  <section|Measure-Preserving Bijective Time Changes of Stationary
  Processes><label|sec:timechange>

  <subsection|Scaling Function Class>

  <\definition>
    [Scaling Functions]<label|def:scaling_functions> Let <math|\<cal-F\>>
    denote the class of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    satisfying:

    <\enumerate>
      <item><math|\<theta\>> is strictly monotonically increasing

      <item><math|\<theta\>> is continuously differentiable with
      <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> everywhere,

      <item><math|\<theta\>> is a bijection from <math|\<bbb-R\>> to
      <math|\<bbb-R\>>.
    </enumerate>
  </definition>

  <subsection|Transformation and Oscillatory Structure>

  <\theorem>
    [Oscillatory Representation of Time-Changed Stationary
    Processes]<label|thm:oscillatory_representation> Let <math|S<rsub|t>> be
    a stationary Gaussian process with spectral representation as in
    <eqref|eq:spectral_stationary>, and let <math|\<theta\>\<in\>\<cal-F\>>.
    Then the process

    <\equation>
      X<rsub|t>\<assign\><sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><label|eq:timechange_def>
    </equation>

    is oscillatory with oscillatory functions

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>><label|eq:oscillatory_basis>
    </equation>
  </theorem>

  <\proof>
    From <eqref|eq:spectral_stationary>, for any <math|t>,

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>>>>>
    </align>

    So setting <math|\<phi\><rsub|t><around|(|\<omega\>|)>> as in
    <eqref|eq:oscillatory_basis> gives the oscillatory representation
    according to Definition<nbsp><reference|def:oscillatory>.
  </proof>

  <\corollary>
    [Envelope in Standard Form]<label|cor:envelope_standard> The oscillatory
    functions from Theorem<nbsp><reference|thm:oscillatory_representation>
    can be written as

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t><label|eq:oscillatory_standard>
    </equation>

    where

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>><label|eq:oscillatory_envelope>
    </equation>
  </corollary>

  <\proof>
    Substituting <math|e<rsup|i*\<omega\>*t>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>=e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>
    yields the result.
  </proof>

  <subsection|Evolutionary Power Spectrum>

  <\definition>
    [Evolutionary Power Spectrum]<label|def:evol_spectrum> Given an
    oscillatory process with representation as in
    <eqref|eq:oscillatory_proc>-<eqref|eq:oscillatory_func>, the evolutionary
    power spectrum at time <math|t> is defined as

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)><label|eq:evol_spectrum>
    </equation>
  </definition>

  <\theorem>
    [Evolutionary Spectrum of Time-Changed Stationary
    Processes]<label|thm:evol_spectrum_timechange> Let <math|X<rsub|t>> be as
    in Theorem<nbsp><reference|thm:oscillatory_representation>. Then the
    evolutionary power spectrum is

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)><label|eq:evolspec_timechange>
    </equation>
  </theorem>

  <\proof>
    By Corollary<nbsp><reference|cor:envelope_standard>,
    <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>=\<theta\><rprime|'><around|(|t|)>>,
    since <math|<around|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|>=1>.
    So, by Definition<nbsp><reference|def:evol_spectrum>,
    equation<nbsp><eqref|eq:evolspec_timechange> holds.
  </proof>

  <section|Operator Isometry and <math|L<rsup|2>>-Preservation><label|sec:isometry>

  <\theorem>
    [Operator Isometry and <math|L<rsup|2>>-Norm
    Preservation]<label|thm:L2_isometry> The mapping

    <\equation>
      S<rsub|t>\<mapsto\>X<rsub|t>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>><label|eq:M_theta>
    </equation>

    preserves the <math|L<rsup|2>>-norm, i.e.,

    <\equation>
      <big|int><rsub|I>\<bbb-E\><around|\||X<rsub|t>|\|><rsup|2>*d*t=<big|int><rsub|\<theta\><around|(|I|)>>\<bbb-E\><around|\||S<rsub|s>|\|><rsup|2>*d*s<label|eq:L2_preserving>
    </equation>

    where <math|I> is a measurable interval of <math|\<bbb-R\>>.
  </theorem>

  <\proof>
    Use the change of variables <math|s=\<theta\><around|(|t|)>>, so
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*d*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I>\<bbb-E\><around|\||X<rsub|t>|\|><rsup|2>*d*t>|<cell|=<big|int><rsub|I>\<bbb-E\>*<around|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*S<rsub|\<theta\><around|(|t|)>>|\|><rsup|2>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I>\<theta\><rprime|'><around|(|t|)>*\<bbb-E\><around|\||S<rsub|\<theta\><around|(|t|)>>|\|><rsup|2>*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|\<theta\><around|(|I|)>>\<bbb-E\><around|\||S<rsub|s>|\|><rsup|2>*d*s>>>>
    </align>

    as claimed.
  </proof>

  <section|Zero Crossings for Time-Changed Stationary
  Processes><label|sec:zero_crossings>

  <\theorem>
    [Expected Number of Zeros]<label|thm:zero_count> Let
    <math|K<around|(|\<cdummy\>|)>> be a translation-invariant, stationary,
    and twice differentiable covariance kernel, and let <math|X<rsub|t>> be
    the process with covariance <math|K<rsub|\<theta\>><around|(|t,s|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>.
    Then for finite interval <math|<around|[|a,b|]>>,

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|a,b|]>|)>|]>=<sqrt|-K<rprime|''><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)><label|eq:zero_count>
    </equation>

    where <math|N<around|(|<around|[|a,b|]>|)>> denotes the number of zeros
    in <math|<around|[|a,b|]>>.
  </theorem>

  <\proof>
    The Kac\URice formula (see <cite|cramer1967>, Section<nbsp>10.3.1) for
    the expected number of zeros gives

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|a,b|]>|)>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K<rsub|\<theta\>><around|(|t,s|)>>*<space|0.17em>d*t<label|eq:kac_rice>
    </equation>

    Since <math|K<rsub|\<theta\>><around|(|t,s|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>,
    it follows that

    <\align>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>*t>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>=K<rprime|'><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>\<cdot\><text|sign><around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)><eq-number>>>>>
    </align>

    So, for <math|s\<to\>t>,

    <\equation>
      lim<rsub|s\<to\>t> <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>=-K<rprime|''><around|(|0|)>*\<theta\><rprime|'><around|(|t|)><rsup|2>
    </equation>

    Therefore,

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<around|(|<around|[|a,b|]>|)>|]>>|<cell|=<big|int><rsub|a><rsup|b><sqrt|-K<rprime|''><around|(|0|)>*\<theta\><rprime|'><around|(|t|)><rsup|2>>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-K<rprime|''><around|(|0|)>>*<big|int><rsub|a><rsup|b>\<theta\><rprime|'><around|(|t|)>*d*t>>|<row|<cell|>|<cell|=<sqrt|-K<rprime|''><around|(|0|)>>*<around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>>>>>
    </align>

    which proves the result.
  </proof>

  <section|Discussion and Consequences><label|sec:discussion>

  The results established in Sections<nbsp><reference|sec:timechange>\U<reference|sec:zero_crossings>
  demonstrate:

  <\itemize>
    <item>The process generated by a measure-preserving bijective time change
    <math|\<theta\>> of a stationary process, with correct Jacobian
    normalization, is always oscillatory and admits an explicit oscillatory
    representation.

    <item>The evolutionary power spectrum is simply the original spectrum
    scaled by the local derivative <math|\<theta\><rprime|'><around|(|t|)>>.

    <item>The <math|L<rsup|2>>-norm is preserved under the mapping,
    indicating a unitary equivalence between the original stationary process
    and its time-changed oscillatory version.

    <item>The expected number of zeros is given exactly by
    equation<nbsp><eqref|eq:zero_count>, a direct generalization of the
    stationary case.
  </itemize>

  These relationships identify time-changed processes of the above form as a
  distinguished, analytically tractable subclass of oscillatory processes.

  <section|References><label|sec:references>

  <\thebibliography|99>
    <bibitem|priestley1965>M.<nbsp>B. Priestley.
    <with|font-shape|italic|Evolutionary Spectra and Non-Stationary
    Processes>, J. Roy. Statist. Soc. B, 27(2), 204\U237, 1965.

    <bibitem|cramer1967>H.<nbsp>Cramér and M.<nbsp>R. Leadbetter,
    <with|font-shape|italic|Stationary and Related Stochastic Processes:
    Sample Function Properties and Their Applications>, Wiley, 1967.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|global-title|Measure-Preserving Bijective Time Changes of
    Stationary Gaussian Processes Generate Oscillatory Processes With
    Evolving Spectra>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-10|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-11|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-12|<tuple|7|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-13|<tuple|7|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|2.2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|3.1|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|3.2|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|3.3|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-9|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|cor:envelope_standard|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:evol_spectrum|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:oscillatory|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:scaling_functions|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:stationary_process|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:L2_preserving|<tuple|13|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:M_theta|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:evol_spectrum|<tuple|10|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:evolspec_timechange|<tuple|11|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:incr_variance|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:kac_rice|<tuple|16|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:oscillatory_basis|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:oscillatory_envelope|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:oscillatory_func|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:oscillatory_proc|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:oscillatory_standard|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:spectral_stationary|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:timechange_def|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zero_count|<tuple|15|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:discussion|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:intro|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:isometry|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:references|<tuple|7|6|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:timechange|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|sec:zero_crossings|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:L2_isometry|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:evol_spectrum_timechange|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:oscillatory_representation|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:zero_count|<tuple|10|5|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      priestley1965

      cramer1967
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes and Their Representations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Spectral Representation of
      Stationary Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Oscillatory Processes
      (Priestley) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Measure-Preserving
      Bijective Time Changes of Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Scaling Function Class
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Transformation and
      Oscillatory Structure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Evolutionary Power Spectrum
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Operator
      Isometry and <with|mode|<quote|math>|L<rsup|2>>-Preservation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Zero
      Crossings for Time-Changed Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Discussion
      and Consequences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>