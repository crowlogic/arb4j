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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Operator
    Conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Expected
    Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Scaling Functions><label|sec:scaling>

  <\definition>
    [Scaling Functions]<label|def:scaling> Let <math|\<cal-F\>> denote the
    set of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> satisfying

    <\enumerate>
      <item><math|\<theta\>> is absolutely continuous with
      <math|\<theta\><rprime|'><around|(|t|)>\<geq\>0> almost everywhere and
      <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of Lebesgue
      measure zero,

      <item><math|\<theta\>> is strictly increasing and bijective.
    </enumerate>
  </definition>

  <\remark>
    <label|rem:inverse_properties>The conditions in
    Definition<nbsp><reference|def:scaling> ensure that
    <math|\<theta\><rsup|-1>> exists and is absolutely continuous. By the
    inverse function theorem for absolutely continuous functions,
    <math|<around|(|\<theta\><rsup|-1>|)><rprime|'><around|(|s|)>=<frac|1|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    for almost all <math|s> in the range of <math|\<theta\>>. The condition
    that <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of measure
    zero ensures that <math|<frac|1|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is well-defined almost everywhere.
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

  <\definition>
    [Unitary Transformation Operator]<label|def:unitary_op> For
    <math|\<theta\>\<in\>\<cal-F\>>, define the operator
    <math|M<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <label|eq:unitary_op><around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|t|)>|)>.
    </equation>
  </definition>

  <\definition>
    [Inverse Unitary Transformation Operator]<label|def:inverse_unitary_op>
    The inverse operator <math|M<rsub|\<theta\>><rsup|-1>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    is defined by

    <\equation>
      <label|eq:unitary_inverse><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around*|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>>.
    </equation>
  </definition>

  <\lemma>
    [Well-Definedness of Inverse Operator]<label|lem:inverse_well_defined>
    The operator <math|M<rsub|\<theta\>><rsup|-1>> in
    Definition<nbsp><reference|def:inverse_unitary_op> is well-defined for
    <math|\<theta\>\<in\>\<cal-F\>>.
  </lemma>

  <\proof>
    Since <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of measure
    zero by Definition<nbsp><reference|def:scaling>, and
    <math|\<theta\><rsup|-1>> maps sets of measure zero to sets of measure
    zero (as it preserves absolute continuity), the denominator
    <math|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression in
    equation<nbsp><eqref|eq:unitary_inverse> is therefore well-defined almost
    everywhere, which is sufficient for defining an element of
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    [Unitarity of Transformation Operator]<label|thm:unitary> The operator
    <math|M<rsub|\<theta\>>> defined in equation<nbsp><eqref|eq:unitary_op>
    is unitary, i.e.,

    <\equation>
      <label|eq:L2_preserve><big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s
    </equation>

    for all <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. The
    <math|L<rsup|2>>-norm of <math|M<rsub|\<theta\>>*f> is computed as
    follows:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<theta\><rprime|'><around|(|t|)><space|0.17em><around|\<lvert\>|f<around*|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t.<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|t|)>>. Since
    <math|\<theta\>> is absolutely continuous and strictly increasing,
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t> almost
    everywhere. As <math|t> ranges over <math|\<bbb-R\>>,
    <math|s=\<theta\><around|(|t|)>> ranges over <math|\<bbb-R\>> due to the
    bijectivity of <math|\<theta\>>. Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>\<theta\><rprime|'><around|(|t|)><space|0.17em><around|\<lvert\>|f<around*|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s.<eq-number>>>>>
    </align>

    This establishes equation<nbsp><eqref|eq:L2_preserve>.

    To complete the proof of unitarity, it remains to show that
    <math|M<rsub|\<theta\>><rsup|-1>> is indeed the inverse of
    <math|M<rsub|\<theta\>>>. For any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around|(|M<rsub|\<theta\>><rsup|-1>|)>*<around*|[|<sqrt|\<theta\><rprime|'><around|(|\<cdummy\>|)>>*<space|0.17em>f<around*|(|\<theta\>|(>\<cdot\><around*|)||)>|]><around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<frac|<sqrt|\<theta\><rprime|'><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>|<sqrt|\<theta\><rprime|'><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=f<around|(|s|)>,<eq-number>>>>>
    </align>

    where the last equality uses <math|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s>.

    Similarly, for any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around*|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em><frac|g<around*|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|\<theta\><rprime|'><around*|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em><frac|g<around|(|t|)>|<sqrt|\<theta\><rprime|'><around|(|t|)>>><eq-number>>>|<row|<cell|>|<cell|=g<around|(|t|)>.<eq-number>>>>>
    </align>

    Therefore, <math|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>=M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>=I>,
    proving that <math|M<rsub|\<theta\>>> is unitary.
  </proof>

  <\corollary>
    [Measure Preservation]<label|cor:measure_preserve> The transformation
    <math|M<rsub|\<theta\>>> preserves the <math|L<rsup|2>>-measure in the
    sense that for any measurable set <math|A\<subseteq\>\<bbb-R\>>,

    <\equation>
      <label|eq:measure_preserve_sets><big|int><rsub|A><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|A|)>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s.
    </equation>
  </corollary>

  <\proof>
    The proof follows the same change of variables argument as in
    Theorem<nbsp><reference|thm:unitary>, applied to the characteristic
    function of the set <math|A>.
  </proof>

  <subsection|Oscillatory Representation>

  <\theorem>
    [Oscillatory Form]<label|thm:osc_rep> The process
    <math|<around|{|X<rsub|t>|}>> defined in
    equation<nbsp><eqref|eq:time_change> is oscillatory with oscillatory
    functions

    <\equation>
      <label|eq:phi_def>\<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>.
    </equation>
  </theorem>

  <\proof>
    From the spectral representation<nbsp><eqref|eq:stationary_rep> of the
    stationary process <math|S<rsub|t>>:

    <\align>
      <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>S<rsub|\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>,<eq-number>>>>>
    </align>

    where <math|\<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>.

    To verify this is an oscillatory representation according to
    Definition<nbsp><reference|def:oscillatory>, express
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>> in the required form:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*<space|0.17em>e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>,<eq-number>>>>>
    </align>

    where <math|A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>>.

    Since <math|\<theta\><rprime|'><around|(|t|)>\<geq\>0> almost everywhere
    and <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of measure
    zero, the function <math|A<rsub|t><around|(|\<omega\>|)>> is well-defined
    almost everywhere. Moreover, <math|A<rsub|t><around|(|\<cdummy\>|)>\<in\>L<rsup|2><around|(|\<mu\>|)>>
    for each <math|t> since:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*\<mu\><around|(|\<bbb-R\>|)>\<less\>\<infty\>,<eq-number>>>>>
    </align>

    where the finiteness follows from <math|\<mu\>> being a finite measure
    and <math|\<theta\><rprime|'><around|(|t|)>> being finite almost
    everywhere.
  </proof>

  <subsection|Envelope and Evolutionary Spectrum>

  <\corollary>
    [Envelope]<label|cor:envelope> The oscillatory functions in
    equation<nbsp><eqref|eq:phi_def> admit the standard decomposition

    <\equation>
      <label|eq:envelope>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>,<space|1em><text|where><space|1em>A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>.
    </equation>
  </corollary>

  <\proof>
    This follows directly from the calculation in the proof of
    Theorem<nbsp><reference|thm:osc_rep>.
  </proof>

  <\corollary>
    [Evolutionary Spectrum]<label|cor:evolving_spec> The evolutionary power
    spectrum is

    <\equation>
      <label|eq:evolutionary_spec>d*F<rsub|t><around|(|\<omega\>|)>=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>.
    </equation>
  </corollary>

  <\proof>
    By Definition<nbsp><reference|def:oscillatory> and the envelope from
    Corollary<nbsp><reference|cor:envelope>, the evolutionary power spectrum
    is:

    <\align>
      <tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<omega\>|)>>|<cell|=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)><space|0.17em><around*|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>,<eq-number>>>>>
    </align>

    since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for any real
    <math|\<alpha\>>.
  </proof>

  <section|Operator Conjugation><label|sec:conjugation>

  <\theorem>
    [Operator Conjugation]<label|thm:operator_conjugation> Let
    <math|T<rsub|K>> be the integral operator defined by

    <\equation>
      <label|eq:integral_op_original><around|(|T<rsub|K>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*<space|0.17em>d*s
    </equation>

    for a stationary kernel <math|K>, and let
    <math|T<rsub|K<rsub|\<theta\>>>> be the integral operator defined by

    <\equation>
      <label|eq:integral_op_transformed><around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*<space|0.17em>d*s
    </equation>

    for the transformed kernel <math|K<rsub|\<theta\>><around|(|s,t|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>.
    Then

    <\equation>
      <label|eq:conjugation>T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>.
    </equation>
  </theorem>

  <\proof>
    For any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, compute
    <math|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>>|<cell|=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>,<eq-number>>>|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)><frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*d*s.<eq-number>>>>>
    </align>

    Apply the change of variables <math|u=\<theta\><rsup|-1><around|(|s|)>>,
    so <math|s=\<theta\><around|(|u|)>> and
    <math|d*s=\<theta\><rprime|'><around|(|u|)>*d*u>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)><frac|g<around|(|u|)>|<sqrt|\<theta\><rprime|'><around|(|u|)>>>*\<theta\><rprime|'><around|(|u|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|\<theta\><rprime|'><around|(|u|)>>*d*u.<eq-number>>>>>
    </align>

    Now apply <math|M<rsub|\<theta\>>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|\<theta\><rprime|'><around|(|u|)>>*d*u.<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|u|)>> in the
    reverse direction:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)>.<eq-number>>>>>
    </align>

    This establishes the conjugation relation<nbsp><eqref|eq:conjugation>.
  </proof>

  <section|Expected Zero Count><label|sec:zero_count>

  <\theorem>
    [Expected Zero-Counting Function]<label|thm:zero_count> Let
    <math|\<theta\>\<in\>\<cal-F\>> and let
    <math|K<around|(|\<tau\>|)>=<math-up|cov><around|(|S<rsub|0>,S<rsub|\<tau\>>|)>>
    be twice differentiable at <math|\<tau\>=0>. The expected number of zeros
    of the process <math|X<rsub|t>> in <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:zero_count>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>.
    </equation>
  </theorem>

  <\proof>
    The covariance function of the time-changed process is

    <\equation>
      <label|eq:time_changed_cov>K<rsub|\<theta\>><around|(|s,t|)>=<math-up|cov><around|(|X<rsub|s>,X<rsub|t>|)>=<sqrt|\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>.
    </equation>

    For the zero-crossing analysis, consider the normalized process. By the
    Kac-Rice formula:

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>*<space|0.17em>d*t.
    </equation>

    Computing the mixed partial derivative:

    <\align>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<frac|1|2>*<frac|\<theta\><rprime|''><around|(|t|)>|<sqrt|\<theta\><rprime|'><around|(|t|)>>>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><eq-number>>>|<row|<cell|>|<cell|<space|1em>+<sqrt|\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>>*K<rprime|'><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><math-up|sgn><around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>*\<theta\><rprime|'><around|(|t|)>.<eq-number>>>>>
    </align>

    Taking the limit as <math|s\<to\>t> and using the fact that
    <math|K<rprime|'><around|(|0|)>=0> for stationary processes:

    <\align>
      <tformat|<table|<row|<cell|lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>*K<rprime|''><around|(|0|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>.<eq-number>>>>>
    </align>

    Substituting into the Kac-Rice formula:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b><sqrt|-\<theta\><rprime|'><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<big|int><rsub|a><rsup|b>\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>.<eq-number>>>>>
    </align>

    Here the second equality uses <math|\<theta\><rprime|'><around|(|t|)>\<geq\>0>
    almost everywhere.
  </proof>

  <section|Conclusion><label|sec:conclusion>

  This analysis establishes that Gaussian processes generated by
  measure-preserving bijective time changes of stationary processes form a
  well-defined subclass of oscillatory processes. The key contributions
  include:

  <\enumerate>
    <item>The rigorous construction of the unitary operator
    <math|M<rsub|\<theta\>>> and its inverse, with proper treatment of the
    case where <math|\<theta\><rprime|'><around|(|t|)>=0> on sets of measure
    zero.

    <item>The explicit oscillatory representation with envelope function
    <math|A<rsub|t><around|(|\<omega\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>>.

    <item>The evolutionary power spectrum formula
    <math|d*F<rsub|t><around|(|\<omega\>|)>=\<theta\><rprime|'><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>>.

    <item>The operator conjugation relationship
    <math|T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>>.

    <item>A closed-form expression for the expected zero count in terms of
    the range of the time transformation.
  </enumerate>

  <\thebibliography|99>
    <bibitem|priestley1965>M.B. Priestley. Evolutionary spectra and
    non-stationary processes. <em|Journal of the Royal Statistical Society,
    Series B>, 27(2):204\U237, 1965.

    <bibitem|cramer1967>H. Cramér and M.R. Leadbetter. <em|Stationary and
    Related Stochastic Processes>. Wiley, 1967.

    <bibitem|kac1943>M. Kac. On the average number of real roots of a random
    algebraic equation. <em|Bulletin of the American Mathematical Society>,
    49(4):314\U320, 1943.

    <bibitem|rice1945>S.O. Rice. Mathematical analysis of random noise.
    <em|Bell System Technical Journal>, 24(1):46\U156, 1945.
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
    <associate|auto-10|<tuple|7|8>>
    <associate|auto-11|<tuple|5|8>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|4.1|3>>
    <associate|auto-6|<tuple|4.2|4>>
    <associate|auto-7|<tuple|4.3|5>>
    <associate|auto-8|<tuple|5|6>>
    <associate|auto-9|<tuple|6|7>>
    <associate|bib-cramer1967|<tuple|cramer1967|8>>
    <associate|bib-kac1943|<tuple|kac1943|8>>
    <associate|bib-priestley1965|<tuple|priestley1965|8>>
    <associate|bib-rice1945|<tuple|rice1945|8>>
    <associate|cor:envelope|<tuple|11|5>>
    <associate|cor:evolving_spec|<tuple|12|5>>
    <associate|cor:measure_preserve|<tuple|9|4>>
    <associate|def:inverse_unitary_op|<tuple|6|3>>
    <associate|def:oscillatory|<tuple|3|2>>
    <associate|def:scaling|<tuple|1|2>>
    <associate|def:time_changed_proc|<tuple|4|3>>
    <associate|def:unitary_op|<tuple|5|3>>
    <associate|eq:L2_preserve|<tuple|6|3>>
    <associate|eq:conjugation|<tuple|36|6>>
    <associate|eq:envelope|<tuple|28|5>>
    <associate|eq:evolutionary_spec|<tuple|29|5>>
    <associate|eq:integral_op_original|<tuple|34|6>>
    <associate|eq:integral_op_transformed|<tuple|35|6>>
    <associate|eq:kac_rice|<tuple|47|7>>
    <associate|eq:measure_preserve_sets|<tuple|17|4>>
    <associate|eq:oscillatory_rep|<tuple|1|2>>
    <associate|eq:phi_def|<tuple|18|4>>
    <associate|eq:stationary_rep|<tuple|2|2>>
    <associate|eq:time_change|<tuple|3|3>>
    <associate|eq:time_changed_cov|<tuple|46|7>>
    <associate|eq:unitary_inverse|<tuple|5|3>>
    <associate|eq:unitary_op|<tuple|4|3>>
    <associate|eq:zero_count|<tuple|45|7>>
    <associate|lem:inverse_well_defined|<tuple|7|3>>
    <associate|rem:inverse_properties|<tuple|2|2>>
    <associate|sec:conclusion|<tuple|7|8>>
    <associate|sec:conjugation|<tuple|5|6>>
    <associate|sec:oscillatory|<tuple|2|2>>
    <associate|sec:scaling|<tuple|1|2>>
    <associate|sec:stationary|<tuple|3|2>>
    <associate|sec:time_change|<tuple|4|3>>
    <associate|sec:zero_count|<tuple|6|7>>
    <associate|thm:operator_conjugation|<tuple|13|6>>
    <associate|thm:osc_rep|<tuple|10|4>>
    <associate|thm:unitary|<tuple|8|3>>
    <associate|thm:zero_count|<tuple|14|7>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Operator
      Conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Expected
      Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>