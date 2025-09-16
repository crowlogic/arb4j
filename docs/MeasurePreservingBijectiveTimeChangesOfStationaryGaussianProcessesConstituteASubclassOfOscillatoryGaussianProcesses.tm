<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Measure-Preserving Bijective Time Changes of
  Stationary Gaussian Processes Constitute a Subclass of Oscillatory Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>|<doc-date|August 1,
  2025>>

  <\abstract>
    This article establishes that Gaussian processes obtained through
    measure-preserving bijective unitary time transformations of stationary
    processes constitute a subclass of oscillatory processes in the sense of
    Priestley. The transformation <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>,
    where <math|X<around|(|t|)>> is a realization of stationary Gaussian
    process and <math|\<theta\>> is a strictly increasing <math|C<rsup|1>>
    differentiable monotonic function, yields an oscillatory process with
    evolutionary power spectrum <math|d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>>.
    An explicit unitary transformation between the input stationary process
    and the transformed oscillatory process is established, preserving the
    <math|L<rsup|2>>-norm and providing a complete spectral characterization.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Scaling functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Stationary Gaussian reference process
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Unitary
    time change and basic properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definition and inverse
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Unitarity and measure preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.3<space|2spc><with|mode|math|L<rsup|2>>-norm
    preservation for processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Oscillatory
    processes and representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Oscillatory representation of the
    time-changed process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.2<space|2spc>Envelope and evolutionary spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Operator
    conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Expected
    zero count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>
  </table-of-contents>

  <section|Preliminaries>

  <subsection|Scaling functions><label|sec:scaling>

  <\definition>
    <dueto|Scaling Functions><label|def:scaling>Let <math|\<cal-F\>> denote
    the set of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> satisfying

    <\enumerate>
      <item><math|\<theta\>> is absolutely continuous with

      <\equation>
        <wide|\<theta\>|\<dot\>><around|(|t|)>=<frac|<math-up|d>|<math-up|d>t>*\<theta\><around|(|t|)>\<geq\>0
      </equation>

      almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0>
      only on sets of Lebesgue measure zero.

      <item><math|\<theta\>> is strictly increasing and bijective.
    </enumerate>
  </definition>

  <\remark>
    <label|rem:inverse_properties>The conditions in
    Definition<nbsp><reference|def:scaling> ensure that
    <math|\<theta\><rsup|-1><around|(|s|)>> exists and is absolutely
    continuous. By the inverse function theorem for absolutely continuous
    functions,

    <\equation>
      <frac|<math-up|d>|<math-up|d>s><around|(|\<theta\><rsup|-1>|)><around|(|s|)>=<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>=<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)><rsup|-1>
    </equation>

    for almost all <math|s> in the range of <math|\<theta\>>. The condition
    that <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero ensures that <math|<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is well-defined almost everywhere.
  </remark>

  <subsection|Stationary Gaussian reference process><label|sec:stationary>

  <\definition>
    <dueto|Stationary Process>A real-valued process
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> is a
    stationary Gaussian process if it can be represented by the continuous
    spectral representation

    <\equation>
      <label|eq:stationary_rep>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|\<Phi\><around|(|\<omega\>|)>> is an orthogonal-increment
    process with spectral density

    <\equation>
      E*<around|\<lvert\>|d*\<Phi\><around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|u|)>*e<rsup|-i*\<omega\>*u><space|0.17em><math-up|d>u=<wide|\<mu\>|\<dot\>><around|(|\<omega\>|)>=<frac|<math-up|d>|<math-up|d>\<omega\>>*\<mu\><around|(|\<omega\>|)>
    </equation>

    and <math|\<mu\>> is an absolutely continuous Lebesgue measure on
    <math|\<bbb-R\>>.
  </definition>

  <section|Unitary time change and basic properties><label|sec:time_change>

  <subsection|Definition and inverse>

  <\definition>
    <dueto|Unitary Time-Change Operator><label|M>For
    <math|\<theta\>\<in\>\<cal-F\>>, define the operator
    <math|M<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <label|eq:unitary_op><around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>
    </equation>
  </definition>

  <\definition>
    <dueto|Unitarily Time-Changed Stationary
    Process><label|def:time_changed_proc>For <math|\<theta\>\<in\>\<cal-F\>>,
    apply <math|M<rsub|\<theta\>>> from Definition<nbsp><reference|M> to a
    realization of a stationary process <math|X<around|(|t|)>> from the
    ensemble <math|<around|{|X<around|(|t|)>|}>> to define a realization of
    the unitarily time-changed process

    <\equation>
      <label|eq:time_change>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>
  </definition>

  <\definition>
    <dueto|Inverse Unitary Time-Change Operator><label|def:inverse_unitary_op>The
    inverse operator <math|M<rsub|\<theta\>><rsup|-1>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    corresponding to <math|M<rsub|\<theta\>>> in <eqref|eq:unitary_op> is

    <\equation>
      <label|eq:unitary_inverse><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>
  </definition>

  <\lemma>
    <dueto|Well-Definedness of Inverse Operator><label|lem:inverse_well_defined>The
    operator <math|M<rsub|\<theta\>><rsup|-1>> in
    Definition<nbsp><reference|def:inverse_unitary_op> is well-defined
    <math|\<forall\>\<theta\>\<in\>\<cal-F\>>.
  </lemma>

  <\proof>
    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero by Definition<nbsp><reference|def:scaling>, and
    <math|\<theta\><rsup|-1>> maps sets of measure zero to sets of measure
    zero (as it preserves absolute continuity), the denominator
    <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression in
    equation<nbsp><eqref|eq:unitary_inverse> is therefore well-defined almost
    everywhere, which is sufficient for defining an element of
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </proof>

  <subsection|Unitarity and measure preservation>

  <\theorem>
    <dueto|Unitarity of Transformation Operator><label|thm:unitary>The
    operator <math|M<rsub|\<theta\>>> defined in <eqref|eq:unitary_op> is
    unitary, i.e.,

    <\equation>
      <label|eq:L2_preserve><big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>t=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>s<space|1em>\<forall\>f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>
    </equation>
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. Then

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>t>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2><space|0.17em><math-up|d>t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\<lvert\>|f<around|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>t<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|t|)>>. Since
    <math|\<theta\>> is absolutely continuous and strictly increasing,
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t>
    almost everywhere. As <math|t> ranges over <math|\<bbb-R\>>,
    <math|s=\<theta\><around|(|t|)>> ranges over <math|\<bbb-R\>> due to
    bijectivity. Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\<lvert\>|f<around|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>t>|<cell|=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>s<eq-number>>>>>
    </align>

    To show that <math|M<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|M<rsub|\<theta\>>>, for any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*<space|0.17em>f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>=f<around|(|s|)><eq-number>>>>>
    </align>

    Similarly, for any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<frac|g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>=g<around|(|t|)><eq-number>>>>>
    </align>

    Hence <math|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>=M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>=I>.
  </proof>

  <\corollary>
    <dueto|Measure Preservation on Sets><label|cor:measure_preserve>The
    transformation <math|M<rsub|\<theta\>>> preserves the
    <math|L<rsup|2>>-measure in the sense that for any measurable set
    <math|A\<subseteq\>\<bbb-R\>>,

    <\equation>
      <label|eq:measure_preserve_sets><big|int><rsub|A><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>t=<big|int><rsub|\<theta\><around|(|A|)>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2><space|0.17em><math-up|d>s
    </equation>
  </corollary>

  <\proof>
    This follows by the same change-of-variables argument as in
    Theorem<nbsp><reference|thm:unitary>, applied to the characteristic
    function of <math|A>.
  </proof>

  <subsection|<math|L<rsup|2>>-norm preservation for
  processes><label|sec:norm_preservation>

  <\theorem>
    <dueto|Measure Preservation><label|thm:measure_preserve>The
    transformation defined in <eqref|eq:time_change> preserves the
    <math|L<rsup|2>>-norm in the sense that

    <\equation>
      <label|eq:measure_preserve><big|int><rsub|I><math-up|var><around|(|Z<around|(|t|)>|)><space|0.17em><math-up|d>t=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|X<around|(|s|)>|)><space|0.17em><math-up|d>s
    </equation>

    for any measurable set <math|I\<subseteq\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Using the change of variables <math|s=\<theta\><around|(|t|)>> with
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I><math-up|var><space|-0.17em><around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>|)><math-up|d>t>|<cell|=<big|int><rsub|I><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><math-up|var><around|(|X<around|(|\<theta\><around|(|t|)>|)>|)><space|0.17em><math-up|d>t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|X<around|(|s|)>|)><space|0.17em><math-up|d>s<eq-number>>>>>
    </align>
  </proof>

  <section|Oscillatory processes and representation>

  An oscillatory process can be represented as a time-dependent filter
  applied to a stationary process.

  <\definition>
    <dueto|Oscillatory Process><label|def:oscillatory>A complex-valued,
    second-order process <math|<around|{|Z<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    is called oscillatory if there exist:

    <\enumerate>
      <item>A family of oscillatory basis functions
      <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}><rsub|t\<in\>\<bbb-R\>>>
      with

      <\equation>
        <\aligned>
          <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|i*\<omega\>*u><space|0.17em><math-up|d>u,>>>>
        </aligned>
      </equation>

      and a given family of gain functions

      <\equation>
        A<rsub|t><around|(|\<omega\>|)>=<frac|\<phi\><rsub|t><around|(|\<omega\>|)>|e<rsup|i*\<omega\>*t>>\<in\>L<rsup|2><around|(|\<mu\>|)><label|envelope>
      </equation>

      with time-dependent filter given by the inverse transform

      <\equation>
        h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*u><space|0.17em><math-up|d>\<lambda\>.
      </equation>

      <item>A complex orthogonal random measure
      <math|\<Phi\><around|(|\<omega\>|)>> with

      <\equation>
        E*<around|\<lvert\>|d*\<Phi\><around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>
      </equation>
    </enumerate>

    such that

    <\equation>
      <label|eq:oscillatory_rep>

      <\aligned>
        <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>X<around|(|u|)><space|0.17em><math-up|d>u,>>>>
      </aligned>
    </equation>

    where

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t><space|0.17em><math-up|d>\<Phi\><around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Oscillatory representation of the time-changed process>

  <\theorem>
    <dueto|Oscillatory Form><label|thm:osc_rep>The process
    <math|<around|{|Z<around|(|t|)>|}>> defined in <eqref|eq:time_change> is
    oscillatory with oscillatory functions

    <\equation>
      <label|eq:phi_def>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    and gain functions

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </theorem>

  <\proof>
    Apply the unitary time change operator <math|M<rsub|\<theta\>>> in
    Definition<nbsp><reference|M> and substitute the spectral
    representation<nbsp><eqref|eq:stationary_rep> of the stationary process
    <math|X<around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|M<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where <math|\<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>.
    To verify this is an oscillatory representation according to
    Definition<nbsp><reference|def:oscillatory>, express
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>> in the form
    <math|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>:

    <\equation>
      <\aligned>
        <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*<space|0.17em>e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>>>>
      </aligned>
    </equation>

    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> almost
    everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on
    sets of measure zero, the function <math|A<rsub|t><around|(|\<omega\>|)>>
    is well-defined almost everywhere. Moreover,
    <math|A<rsub|t><around|(|\<cdummy\>|)>\<in\>L<rsup|2><around|(|\<mu\>|)>>
    for each <math|t> since:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>\<mu\><around|(|\<bbb-R\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>

    where finiteness follows from <math|\<mu\>> being a finite measure and
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>> being finite almost
    everywhere.
  </proof>

  <subsection|Envelope and evolutionary spectrum>

  <\corollary>
    <dueto|Evolutionary Spectrum><label|cor:evolving_spec>The evolutionary
    power spectrum is

    <\equation>
      <label|eq:evolutionary_spec>d*F<rsub|t><around|(|\<omega\>|)>=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>.
    </equation>
  </corollary>

  <\proof>
    By Definition<nbsp><reference|def:oscillatory> and <eqref|envelope>,

    <\align>
      <tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<omega\>|)>>|<cell|=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all
    <math|\<alpha\>\<in\>\<bbb-R\>>.
  </proof>

  <section|Operator conjugation><label|sec:conjugation>

  <\theorem>
    <dueto|Operator Conjugation><label|thm:operator_conjugation>Let
    <math|T<rsub|K>> be the integral covariance operator defined by

    <\equation>
      <label|eq:integral_op_original><around|(|T<rsub|K>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)>*<space|0.17em>f<around|(|s|)><space|0.17em><math-up|d>s
    </equation>

    where <math|K<around|(|h|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*h><space|0.17em><math-up|d>\<lambda\>>.
    Let <math|T<rsub|K<rsub|\<theta\>>>> be the integral covariance operator
    defined by

    <\equation>
      <label|eq:integral_op_transformed><around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<theta\>><around|(|s,t|)>*<space|0.17em>f<around|(|s|)><space|0.17em><math-up|d>s=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>f<around|(|s|)><space|0.17em><math-up|d>s
    </equation>

    for the unitarily time-changed kernel

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation>

    Then

    <\equation>
      <label|eq:conjugation>T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*<space|0.17em>T<rsub|K>*<space|0.17em>M<rsub|\<theta\>><rsup|-1>
    </equation>
  </theorem>

  <\proof>
    For any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, compute
    <math|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>>|<cell|=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>,<eq-number>>>|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)><frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>><space|0.17em><math-up|d>s.<eq-number>>>>>
    </align>

    Apply the change of variables <math|u=\<theta\><rsup|-1><around|(|s|)>>,
    so <math|s=\<theta\><around|(|u|)>> and
    <math|<math-up|d>s=<wide|\<theta\>|\<dot\>><around|(|u|)><space|0.17em><math-up|d>u>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)><frac|g<around|(|u|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|u|)><space|0.17em><math-up|d>u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)>*<space|0.17em>g<around|(|u|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>><space|0.17em><math-up|d>u<eq-number>>>>>
    </align>

    Now apply <math|M<rsub|\<theta\>>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*<space|0.17em>g<around|(|u|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>><space|0.17em><math-up|d>u<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|u|)>> in the
    reverse direction:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*<space|0.17em>g<around|(|s|)><space|0.17em><math-up|d>s<eq-number>>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)>.<eq-number>>>>>
    </align>

    This establishes the conjugation relation<nbsp><eqref|eq:conjugation>.
  </proof>

  <section|Expected zero count><label|sec:zero_count>

  <\theorem>
    <dueto|Expected Zero-Counting Function><label|thm:zero_count>Let
    <math|\<theta\>\<in\>\<cal-F\>> and let

    <\equation>
      K<around|(|\<tau\>|)>=<math-up|cov><around|(|X<around|(|t|)>,X<around|(|\<tau\>|)>|)>
    </equation>

    be twice differentiable at <math|\<tau\>=0>. The expected number of zeros
    of the process <math|X<rsub|t>> in <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:zero_count>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>
    </equation>
  </theorem>

  <\proof>
    The covariance function of the time-changed process is

    <\equation>
      <label|eq:time_changed_cov>K<rsub|\<theta\>><around|(|s,t|)>=<math-up|cov><around|(|X<rsub|s>,X<rsub|t>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    For the zero-crossing analysis, consider the normalized process. By the
    Kac-Rice formula:

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*<space|0.17em>\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>><space|0.17em><math-up|d>t
    </equation>

    Computing the mixed partial derivative:

    <\align>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<frac|1|2>*<frac|<wide|\<theta\>|\<ddot\>><around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><eq-number>>>|<row|<cell|>|<cell|<space|1em>+<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><wide|K|\<dot\>><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><space|0.17em><math-up|sgn><around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>.<eq-number>>>>>
    </align>

    Taking the limit as <math|s\<to\>t> and using
    <math|<wide|K|\<dot\>><around|(|0|)>=0> for stationary processes:

    <\align>
      <tformat|<table|<row|<cell|lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*<space|0.17em>\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)><eq-number>>>>>
    </align>

    Substituting into the Kac-Rice formula:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b><sqrt|-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)>><space|0.17em><math-up|d>t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<big|int><rsub|a><rsup|b><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><math-up|d>t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)><eq-number>>>>>
    </align>

    where <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<ge\>0> almost
    everywhere was used.
  </proof>

  <section|Conclusion><label|sec:conclusion>

  This analysis establishes that Gaussian processes generated by
  measure-preserving bijective time changes of stationary processes form a
  well-defined subclass of oscillatory processes. The key contributions
  include:

  <\enumerate>
    <item>The construction of the unitary operator <math|M<rsub|\<theta\>>>
    and its inverse, with proper treatment of the case where
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> on sets of measure zero.

    <item>The explicit oscillatory representation with envelope function
    <math|<with|math-display|true|A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>>>.

    <item>The evolutionary power spectrum formula
    <math|<with|math-display|true|d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>>.

    <item>The operator conjugation relationship
    <math|<with|math-display|true|T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*<space|0.17em>T<rsub|K>*<space|0.17em>M<rsub|\<theta\>><rsup|-1>>>.

    <item>A closed-form expression for the expected zero count in terms of
    the range of the time scaling function.
  </enumerate>

  <\thebibliography|99>
    <bibitem|priestley1965>M.<space|0.17em>B. Priestley. Evolutionary spectra
    and non-stationary processes. <with|font-shape|italic|Journal of the
    Royal Statistical Society, Series B>, 27(2):204\U237, 1965.

    <bibitem|cramer1967>H. Cramér and M.<space|0.17em>R. Leadbetter.
    <with|font-shape|italic|Stationary and Related Stochastic Processes>.
    Wiley, 1967.

    <bibitem|kac1943>M. Kac. On the average number of real roots of a random
    algebraic equation. <with|font-shape|italic|Bulletin of the American
    Mathematical Society>, 49(4):314\U320, 1943.

    <bibitem|rice1945>S.<space|0.17em>O. Rice. Mathematical analysis of
    random noise. <with|font-shape|italic|Bell System Technical Journal>,
    24(1):46\U156, 1945.
  </thebibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-breaking|sloppy>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|M|<tuple|4|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-1|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-10|<tuple|3.2|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-11|<tuple|4|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-12|<tuple|5|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-13|<tuple|6|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-14|<tuple|5|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-2|<tuple|1.1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-3|<tuple|1.2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-4|<tuple|2|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-5|<tuple|2.1|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-6|<tuple|2.2|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-7|<tuple|2.3|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-8|<tuple|3|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-9|<tuple|3.1|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-kac1943|<tuple|kac1943|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-rice1945|<tuple|rice1945|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|cor:evolving_spec|<tuple|13|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|cor:measure_preserve|<tuple|9|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:inverse_unitary_op|<tuple|6|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:oscillatory|<tuple|11|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:scaling|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:time_changed_proc|<tuple|5|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|envelope|<tuple|19|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:L2_preserve|<tuple|8|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:conjugation|<tuple|42|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:evolutionary_spec|<tuple|34|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_original|<tuple|39|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_transformed|<tuple|40|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:kac_rice|<tuple|54|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:measure_preserve|<tuple|15|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:measure_preserve_sets|<tuple|14|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:oscillatory_rep|<tuple|22|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:phi_def|<tuple|24|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:stationary_rep|<tuple|3|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_change|<tuple|6|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_changed_cov|<tuple|53|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_inverse|<tuple|7|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_op|<tuple|5|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:zero_count|<tuple|52|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|lem:inverse_well_defined|<tuple|7|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|rem:inverse_properties|<tuple|2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:conclusion|<tuple|6|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:conjugation|<tuple|4|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:norm_preservation|<tuple|2.3|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:scaling|<tuple|1.1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:stationary|<tuple|1.2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:time_change|<tuple|2|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:zero_count|<tuple|5|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:measure_preserve|<tuple|10|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:operator_conjugation|<tuple|14|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:osc_rep|<tuple|12|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:unitary|<tuple|8|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:zero_count|<tuple|15|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Scaling functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Stationary Gaussian
      reference process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Unitary
      time change and basic properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition and inverse
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Unitarity and measure
      preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.3<space|2spc><with|mode|<quote|math>|L<rsup|2>>-norm
      preservation for processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Oscillatory
      processes and representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Oscillatory representation
      of the time-changed process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Envelope and evolutionary
      spectrum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Operator
      conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Expected
      zero count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>