<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Invertibility and Random Measure Formulas for
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|August 15, 2025>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Oscillatory
    Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Amplitude and orthogonality
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Inversion map
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Invertibility
    Conditions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Real-Valuedness>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Orthonormality
    Expanded> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Random
    Measure Equivalences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Remarks
    on Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|Summary of conditions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|Covariance identity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|Necessity and sufficiency
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Oscillatory Gaussian Processes>

  <\definition>
    [Orthogonal increment structure]<label|def:orthinc> Let <math|\<mu\>> be
    a positive Borel measure on <math|\<bbb-R\>>. A complex-valued orthogonal
    increment process <math|Z> is a set function on Borel subsets of
    <math|\<bbb-R\>> such that for disjoint
    <math|B<rsub|1>,B<rsub|2>\<subset\>\<bbb-R\>>,

    <\equation>
      \<bbb-E\><around|[|Z<around|(|B<rsub|1>|)><space|0.17em><wide|Z<around|(|B<rsub|2>|)>|\<bar\>>|]>=\<mu\>*<around|(|B<rsub|1>\<cap\>B<rsub|2>|)>
    </equation>

    and for bounded Borel <math|f:\<bbb-R\>\<to\>\<bbb-C\>> the stochastic
    integral

    <\equation>
      <big|int><rsub|\<bbb-R\>>f<around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    satisfies

    <\equation>
      \<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>f<around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\>|)>
    </equation>
  </definition>

  <\definition>
    [White noise process]<label|def:whitenoise> A complex white noise process
    <math|W> is an orthogonal increment process satisfying

    <\equation>
      \<bbb-E\>*<around|[|d*W<around|(|u<rsub|1>|)><space|0.17em><wide|d*W<around|(|u<rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|u<rsub|1>-u<rsub|2>|)>*<space|0.17em>d*u<rsub|1>
    </equation>
  </definition>

  <\definition>
    [Stationary process]<label|def:stationary> The stationary process
    <math|X<rsub|s><around|(|t|)>> generated from white noise <math|W> is

    <\equation>
      <label|eq:stationary-rep>X<rsub|s><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*W<around|(|\<omega\>|)>
    </equation>

    The process has covariance

    <\equation>
      \<bbb-E\><around|[|X<rsub|s><around|(|t<rsub|1>|)><space|0.17em><wide|X<rsub|s><around|(|t<rsub|2>|)>|\<bar\>>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*<space|0.17em>d*\<omega\>=2*\<pi\>*\<delta\>*<around|(|t<rsub|1>-t<rsub|2>|)>
    </equation>
  </definition>

  <\definition>
    [Time-dependent filter and gain]<label|def:filter-gain> The
    time-dependent filter <math|h<around|(|t,u|)>> and gain function
    <math|A<around|(|t,\<lambda\>|)>> satisfy the Fourier transform pair

    <\equation>
      <label|eq:gain-from-filter>A<around|(|t,\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*u
    </equation>

    <\equation>
      <label|eq:filter-from-gain>h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*\<lambda\>
    </equation>

    with square-integrability

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||h<around|(|t,u|)>|\|><rsup|2>*<space|0.17em>d*u\<less\>\<infty\><space|1em>\<forall\>t\<in\>\<bbb-R\>.
    </equation>
  </definition>

  <\definition>
    [Oscillatory process]<label|def:oscproc> An oscillatory process is
    defined in three equivalent ways:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number><label|eq:osc-spectral>>>|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>d*W<around|(|u|)><eq-number><label|eq:osc-filter>>>|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>X<rsub|s>*<around|(|t-u|)>*<space|0.17em>d*u<eq-number><label|eq:osc-convolution>>>>>
    </align>

    where <math|Z>, <math|W>, <math|X<rsub|s>>, <math|h>, and <math|A> are
    related by Definitions <reference|def:orthinc>\U<reference|def:filter-gain>,
    and

    <\equation>
      <label|eq:Atlambda-L2-mu><big|int><rsub|\<bbb-R\>><around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\>|)>\<less\>\<infty\>
    </equation>

    The covariance function is

    <\equation>
      <label|eq:covariance>\<bbb-E\><around|[|X<around|(|t<rsub|1>|)><space|0.17em><wide|X<around|(|t<rsub|2>|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<around|(|t<rsub|1>,\<lambda\>|)><space|0.17em><wide|A<around|(|t<rsub|2>,\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Amplitude and orthogonality>

  <\definition>
    [Amplitude nondegeneracy]<label|def:nondeg> The amplitude <math|A>
    satisfies

    <\equation>
      <label|eq:nonzero>A<around|(|t,\<lambda\>|)>\<neq\>0<space|1em><text|for
      all <math|<around|(|t,\<lambda\>|)>> in the domain.>
    </equation>
  </definition>

  <\definition>
    [Kernel orthonormality]<label|def:orthonormality> The amplitude satisfies

    <\equation>
      <label|eq:delta-ortho><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\><rsub|1>|)>*<space|0.17em>A<around|(|t,\<lambda\><rsub|2>|)>*<space|0.17em>e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>
    </equation>
  </definition>

  <subsection|Inversion map>

  <\definition>
    [Inversion operator]<label|def:invop> Define

    <\equation>
      <label|eq:invop><around|(|\<cal-I\>*X|)><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>X<around|(|t|)>*<space|0.17em>d*t
    </equation>
  </definition>

  <section|Invertibility Conditions>

  <\theorem>
    [Fundamental Invertibility]<label|thm:fund-inv> For <math|X> as in
    Definition <reference|def:oscproc>,

    <\equation>
      <label|eq:inv-identity>d*Z<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>X<around|(|t|)>*<space|0.17em>d*t
    </equation>

    if and only if <math|A> satisfies <eqref|eq:nonzero> and
    <eqref|eq:delta-ortho>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>From <eqref|eq:osc-spectral>,

      <\equation>
        X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
      </equation>

      Multiply by <math|A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t>>
      and integrate over <math|t>:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t>*X<around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t><around*|[|<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>|]>*d*t
      </equation>

      <item>Swap order of integration:

      <\equation>
        =<big|int><rsub|\<bbb-R\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\><rsub|0>|)>*A<around|(|t,\<lambda\>|)>*e<rsup|i*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*t>*d*t|]>*d*Z<around|(|\<lambda\>|)>
      </equation>

      <item>Apply <eqref|eq:delta-ortho>:

      <\equation>
        =<big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>=d*Z<around|(|\<lambda\><rsub|0>|)>
      </equation>

      <item>Conversely, insert

      <\equation>
        X<rsub|\<lambda\><rsub|0>><around|(|t|)>=A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>
      </equation>

      \ into <eqref|eq:inv-identity>:

      <\equation>
        d*Z<rsub|\<lambda\><rsub|0>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t
      </equation>

      The left side equals <math|\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>>,
      hence <eqref|eq:delta-ortho> holds. Nondegeneracy from linear
      independence follows by evaluating at <math|<around|(|t,\<lambda\>|)>>
      where <math|X<around|(|t|)>\<neq\>0>.
    </enumerate>

    \;
  </proof>

  <\lemma>
    [Uniqueness]<label|lem:unique> If <math|\<cal-I\><rsub|1>*X=d*Z<around|(|\<lambda\>|)>=\<cal-I\><rsub|2>*X>
    for all <math|X>, then <math|\<cal-I\><rsub|1>=\<cal-I\><rsub|2>>.
  </lemma>

  <\proof>
    <\enumerate>
      <item>Let <math|\<cal-L\>=\<cal-I\><rsub|1>-\<cal-I\><rsub|2>>. Choose
      <math|>

      <\equation>
        X<rsub|\<lambda\><rsub|0>><around|(|t|)>=A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>
      </equation>

      .

      <item>Then <math|<around|(|\<cal-L\>*X<rsub|\<lambda\><rsub|0>>|)><around|(|\<lambda\>|)>>
      equals

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t-<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t=0
      </equation>

      <item>Density of the span <math|<around|{|X<rsub|\<lambda\><rsub|0>>|}>>
      implies <math|\<cal-L\>=0>.
    </enumerate>

    \;
  </proof>

  <section|Real-Valuedness>

  <\definition>
    [Real-valued oscillatory process]<label|def:real> An oscillatory process
    <math|X> given by <eqref|eq:osc-spectral> is real-valued when

    <\equation>
      <label|eq:real-cond>X<around|(|t|)>\<in\>\<bbb-R\>*<space|1em><text|for
      all >t\<in\>\<bbb-R\>
    </equation>

    which requires the symmetry

    <\equation>
      <label|eq:hermitian>A<around|(|t,-\<lambda\>|)>*<space|0.17em>d*Z*<around|(|-\<lambda\>|)>=<wide|A<around|(|t,\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>|\<bar\>>
    </equation>
  </definition>

  <section|Orthonormality Expanded>

  <\theorem>
    [Triple integral expansion of orthonormality] The orthonormality
    condition <eqref|eq:delta-ortho> expands as

    <\equation>
      <tabular|<tformat|<cwith|1|1|1|-1|font-base-size|9>|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u<rsub|1>|)>*h<around|(|t,u<rsub|2>|)>*e<rsup|-i*\<lambda\><rsub|1>*<around|(|t-u<rsub|1>|)>>*e<rsup|-i*\<lambda\><rsub|2>*<around|(|t-u<rsub|2>|)>>*e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*u<rsub|1>*<space|0.17em>d*u<rsub|2>*<space|0.17em>d*t>|<cell|=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>>>>>><label|eq:triple-integral>
    </equation>
  </theorem>

  <\proof>
    \;

    <\enumerate>
      <item>Substitute <eqref|eq:gain-from-filter> into
      <eqref|eq:delta-ortho> and expand integrals to obtain the triple
      integral form.

      <item>Correct simplification:

      <\equation>
        e<rsup|-i*\<lambda\><rsub|1>*<around|(|t-u<rsub|1>|)>>*e<rsup|-i*\<lambda\><rsub|2>*<around|(|t-u<rsub|2>|)>>*e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>=e<rsup|i*\<lambda\><rsub|1>*u<rsub|1>>*e<rsup|i*\<lambda\><rsub|2>*u<rsub|2>>*e<rsup|-2*i*\<lambda\><rsub|1>*t>
      </equation>

      <item>The <math|\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>>
      factor arises only after integrating over all variables and invoking
      distributional Fourier inversion; it does not follow from the
      <math|t>-integral alone. This correction ensures rigor.
    </enumerate>
  </proof>

  <section|Random Measure Equivalences>

  <\theorem>
    [Complete random measure formula] Define\ 

    <\equation>
      \<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<lambda\>>d*Z<around|(|\<nu\>|)>
    </equation>

    \ where <math|d*Z<around|(|\<nu\>|)>> satisfies <eqref|eq:inv-identity>.
    Then, in the distributional sense,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<label|eq:phi-complete>\<Phi\><around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1-e<rsup|-i*\<lambda\>*u>|i*u>*<space|0.17em>d*W<around|(|u|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1-e<rsup|-i*\<lambda\>*t>|i*t>*<space|0.17em>X<around|(|t|)>*<space|0.17em>d*t>>>>>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>From the white noise representation,

      <\equation>
        d*Z<around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*W<around|(|u|)>
      </equation>

      <item>Interpret <math|<big|int><rsub|-\<infty\>><rsup|\<lambda\>>e<rsup|-i*\<nu\>*u>*<space|0.17em>d*\<nu\>>
      in the tempered distribution sense:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<lambda\>>e<rsup|-i*\<nu\>*u>*<space|0.17em>d*\<nu\>=\<pi\>*\<delta\><around|(|u|)>+<frac|1-e<rsup|-i*\<lambda\>*u>|i*u>
      </equation>

      The Dirac term vanishes after pairing with <math|d*W<around|(|u|)>> for
      <math|u\<neq\>0>.

      <item>Substitution yields the first equality in
      <eqref|eq:phi-complete>.

      <item>The time-domain form follows by swapping the inversion formula
      into <eqref|eq:inv-identity> and applying the same distributional
      identity in <math|t>.
    </enumerate>
  </proof>

  <section|Remarks on Structure>

  <subsection*|Summary of conditions>

  <\equation>
    <label|eq:summary-1>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
  </equation>

  <\equation>
    <label|eq:summary-2>\<bbb-E\>*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><space|0.17em><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\><rsub|1>|)>
  </equation>

  <\equation>
    <label|eq:summary-3><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\><rsub|1>|)>*<space|0.17em>A<around|(|t,\<lambda\><rsub|2>|)>*<space|0.17em>e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>
  </equation>

  <\equation>
    <label|eq:summary-4>d*Z<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>X<around|(|t|)>*<space|0.17em>d*t
  </equation>

  <subsection*|Covariance identity>

  From <eqref|eq:summary-1> and <eqref|eq:summary-2>,

  <\equation>
    <label|eq:cov-id>\<bbb-E\><around|[|X<around|(|t<rsub|1>|)><space|0.17em><wide|X<around|(|t<rsub|2>|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<around|(|t<rsub|1>,\<lambda\>|)><space|0.17em><wide|A<around|(|t<rsub|2>,\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\>|)>
  </equation>

  <subsection*|Necessity and sufficiency>

  Equation <eqref|eq:summary-3> and nondegeneracy <eqref|eq:nonzero> are
  necessary and sufficient for the inversion <eqref|eq:summary-4> by Theorem
  <reference|thm:fund-inv>. Lemma <reference|lem:unique> gives uniqueness.

  <section|References>

  <no-indent>Priestley, M.B. (1965). Evolutionary spectra and non-stationary
  processes. Journal of the Royal Statistical Society: Series B, 27(2),
  204\U237.<next-line>Priestley, M.B. (1981). Spectral Analysis and Time
  Series. Academic Press.
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
    <associate|auto-10|<tuple|38|6>>
    <associate|auto-11|<tuple|39|6>>
    <associate|auto-12|<tuple|7|6>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|2|3>>
    <associate|auto-5|<tuple|3|4>>
    <associate|auto-6|<tuple|4|4>>
    <associate|auto-7|<tuple|5|5>>
    <associate|auto-8|<tuple|6|5>>
    <associate|auto-9|<tuple|6|5>>
    <associate|def:filter-gain|<tuple|4|2>>
    <associate|def:invop|<tuple|8|3>>
    <associate|def:nondeg|<tuple|6|2>>
    <associate|def:orthinc|<tuple|1|1>>
    <associate|def:orthonormality|<tuple|7|3>>
    <associate|def:oscproc|<tuple|5|2>>
    <associate|def:real|<tuple|11|4>>
    <associate|def:stationary|<tuple|3|2>>
    <associate|def:whitenoise|<tuple|2|1>>
    <associate|eq:Atlambda-L2-mu|<tuple|13|2>>
    <associate|eq:cov-id|<tuple|39|6>>
    <associate|eq:covariance|<tuple|14|2>>
    <associate|eq:delta-ortho|<tuple|16|3>>
    <associate|eq:filter-from-gain|<tuple|8|2>>
    <associate|eq:gain-from-filter|<tuple|7|2>>
    <associate|eq:hermitian|<tuple|28|4>>
    <associate|eq:inv-identity|<tuple|18|3>>
    <associate|eq:invop|<tuple|17|3>>
    <associate|eq:nonzero|<tuple|15|2>>
    <associate|eq:osc-convolution|<tuple|12|2>>
    <associate|eq:osc-filter|<tuple|11|2>>
    <associate|eq:osc-spectral|<tuple|10|2>>
    <associate|eq:phi-complete|<tuple|32|5>>
    <associate|eq:real-cond|<tuple|27|4>>
    <associate|eq:stationary-rep|<tuple|5|2>>
    <associate|eq:summary-1|<tuple|35|5>>
    <associate|eq:summary-2|<tuple|36|5>>
    <associate|eq:summary-3|<tuple|37|5>>
    <associate|eq:summary-4|<tuple|38|5>>
    <associate|eq:triple-integral|<tuple|29|4>>
    <associate|lem:unique|<tuple|10|4>>
    <associate|thm:fund-inv|<tuple|9|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Oscillatory
      Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Amplitude and orthogonality
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Inversion map
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Invertibility
      Conditions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Real-Valuedness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Orthonormality
      Expanded> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Random
      Measure Equivalences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Remarks
      on Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Summary of conditions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|Covariance identity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|Necessity and sufficiency
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>