<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Measure-Preserving Bijective Time Changes of
  Stationary Gaussian Processes Constitute a Subclass of Oscillatory Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>|<doc-date|August 1,
  2025>>

  <abstract-data|<\abstract>
    This article establishes that Gaussian processes obtained through
    measure-preserving bijective unitary time transformations of stationary
    processes constitute a subclass of oscillatory processes in the sense of
    Priestley. The transformation <math|Z<around*|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around*|(|\<theta\><around*|(|t|)>|)>>,
    where <math|X<around*|(|t|)>> is a realization of stationary Gaussian
    process and <math|\<theta\>> is a strictly increasing <math|C<rsup|1>>
    differentiable monotonic function, yields an oscillatory process with
    evolutionary power spectrum <math|d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>>.
    An explicit unitary transformation between the input stationary process
    and the transformed oscillatory process is established, preserving the
    <math|L<rsup|2>>-norm and providing a complete spectral characterization.
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

    <with|par-left|1tab|4.2<space|2spc><with|mode|math|L<rsup|2>>-Norm
    Preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.3<space|2spc>Oscillatory Representation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|4.4<space|2spc>Envelope and Evolutionary Spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Operator
    Conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Expected
    Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Scaling Functions><label|sec:scaling>

  <\definition>
    [Scaling Functions]<label|def:scaling> Let <math|\<cal-F\>> denote the
    set of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> satisfying

    <\enumerate>
      <item><math|\<theta\>> is absolutely continuous with <math|>

      <\equation>
        <wide|\<theta\>|\<dot\>><around|(|t|)>=<frac|\<mathd\>|\<mathd\>t>\<theta\><around*|(|t|)>\<geq\>0
      </equation>

      \ almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0>
      only on sets of Lebesgue measure zero

      <item><math|\<theta\>> is strictly increasing and bijective.
    </enumerate>
  </definition>

  \;

  <\remark>
    <label|rem:inverse_properties>The conditions in
    Definition<nbsp><reference|def:scaling> ensure that
    <math|\<theta\><rsup|-1><around*|(|s|)>> exists and is absolutely
    continuous. By the inverse function theorem for absolutely continuous
    functions, <math|>

    <\equation>
      <frac|\<mathd\>|\<mathd\> s><around|(|\<theta\><rsup|-1>|)><around|(|s|)>=<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>=<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)><rsup|-1>
    </equation>

    for almost all <math|s> in the range of <math|\<theta\>>. The condition
    that <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero ensures that <math|<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is well-defined almost everywhere.
  </remark>

  <section|Oscillatory Processes>

  An oscillatory process can be represented as a time-dependent filter
  applied to a stationary process

  <\definition>
    [Stationary Process] A real\Uvalued process
    <math|<around|{|X<around*|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> is a
    stationary Gaussian process if it can be represented by the continuous
    spectral representation

    <\equation>
      <label|eq:stationary_rep>X<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|\<Phi\><around|(|\<omega\>|)>> is an orthogonal-increment
    process with spectral density

    <\equation>
      E*<around|\<lvert\>|d*\<Phi\><around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around*|(|\<omega\>|)>=<frac|1|2
      \<pi\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|u|)>e<rsup|-i
      \<omega\> u>\<mathd\>u=<wide|\<mu\>|\<dot\>><around*|(|\<omega\>|)>=<frac|\<mathd\>|\<mathd\>
      \<omega\>>\<mu\><around*|(|\<omega\>|)>
    </equation>

    \ and <math|\<mu\>> is an absolutely continuous Lebesgue measure on
    <math|\<bbb-R\>>\ 
  </definition>

  <\definition>
    [Oscillatory Process]<label|def:oscillatory> A complex-valued,
    second-order process <math|<around|{|Z<around*|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    is called <em|oscillatory> if there exist

    <\enumerate>
      <item>a family of oscillatory basis functions
      <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}><rsub|t\<in\>\<bbb-R\>>>
      with\ 

      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around*|(|t,u|)>e<rsup|i
        \<omega\> u>\<mathd\>u>>>>>
      </equation>

      \ and a given family of gain functions

      <\equation>
        A<rsub|t><around|(|\<omega\>|)>=<frac|\<phi\><rsub|t><around*|(|\<omega\>|)>|e<rsup|i
        \<omega\>t>>\<in\>L<rsup|2><around|(|\<mu\>|)><label|envelope>
      </equation>

      with time-dependent filter given by

      <\equation>
        h<around*|(|t,u|)>=<frac|1|2 \<pi\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around*|(|\<omega\>|)>e<rsup|-i
        \<omega\>u>\<mathd\>\<lambda\>
      </equation>

      <item>and a complex orthogonal random measure
      <math|\<Phi\><around|(|\<omega\>|)>> with

      <\equation>
        E*<around|\<lvert\>|d*\<Phi\><around|(|\<omega\>|)>|\<rvert\>><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around*|(|\<omega\>|)>
      </equation>
    </enumerate>

    such that

    <\equation>
      <label|eq:oscillatory_rep><tabular|<tformat|<table|<row|<cell|Z<around*|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i
      \<omega\>t>d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around*|(|t,u|)>X<around*|(|u|)>\<mathd\>
      u>>>>>
    </equation>

    where

    <\equation>
      X<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i
      \<lambda\> t>\<mathd\>\<Phi\><around*|(|\<lambda\>|)>
    </equation>
  </definition>

  <section|Unitarily Time-Changed Process><label|sec:time_change>

  <subsection|Definition and Unitary Operator>

  <\definition>
    [Unitary Time-Change Operator]<label|M>For
    <math|\<theta\>\<in\>\<cal-F\>>, define the operator
    <math|M<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <label|eq:unitary_op><around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|t|)>|)>
    </equation>
  </definition>

  <\definition>
    [Unitarily Time-Changed Stationary Process]<label|def:time_changed_proc>
    For <math|\<theta\>\<in\>\<cal-F\>>, apply the unitary time change
    operator <math|M<rsub|\<theta\>>> from
    Definition-<reference|def:unitary_op> \ to a realization of a stationary
    process <math|X<around*|(|t|)>> from the ensemble
    <math|<around*|{|X<around*|(|t|)>|}>> to define a realization of the
    unitarily time-changed process\ 

    <\equation>
      <label|eq:time_change>Z<around*|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around*|(|\<theta\><around*|(|t|)>|)><rsub|>\<forall\>t\<in\>\<bbb-R\>
    </equation>
  </definition>

  \;

  <\definition>
    [Inverse Unitary Time-Change Operator]<label|def:inverse_unitary_op> The
    inverse operator <math|M<rsub|\<theta\>><rsup|-1>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    corresponding to the unitary time-change operator
    <math|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>> defined in
    Equation-<reference|eq:unitary_op> is given by

    <\equation>
      <label|eq:unitary_inverse><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around*|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>
  </definition>

  <\lemma>
    [Well-Definedness of Inverse Operator]<label|lem:inverse_well_defined>
    The operator <math|M<rsub|\<theta\>><rsup|-1>> in
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

  <\theorem>
    [Unitarity of Transformation Operator]<label|thm:unitary> The operator
    <math|M<rsub|\<theta\>>> defined in equation<nbsp><eqref|eq:unitary_op>
    is unitary, i.e.,

    <\equation>
      <label|eq:L2_preserve><big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s\<forall\>f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>
    </equation>
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. The
    <math|L<rsup|2>>-norm of <math|M<rsub|\<theta\>>*f> is computed as
    follows:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\<lvert\>|f<around*|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|t|)>>. Since
    <math|\<theta\>> is absolutely continuous and strictly increasing, its
    Jacobian is given by

    <\equation>
      d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t
    </equation>

    \ almost everywhere. As <math|t> ranges over <math|\<bbb-R\>>,
    <math|s=\<theta\><around|(|t|)>> ranges over <math|\<bbb-R\>> due to the
    bijectivity of <math|\<theta\>>. Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\<lvert\>|f<around*|(|\<theta\><around|(|t|)>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s<eq-number>>>>>
    </align>

    This establishes equation<nbsp><eqref|eq:L2_preserve>. To complete the
    proof of unitarity, it remains to show that
    <math|M<rsub|\<theta\>><rsup|-1>> is indeed the inverse of
    <math|M<rsub|\<theta\>>>. For any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around|(|M<rsub|\<theta\>><rsup|-1>|)>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<cdummy\>|)>>*<space|0.17em>f<around*|(|\<theta\>|(>\<cdot\><around*|)||)>|]><around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>*<space|0.17em>f<around*|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around*|(|\<theta\><rsup|-1><around|(|s|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=f<around|(|s|)><eq-number>>>>>
    </align>

    where the last equality uses <math|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s>.
    Similarly, for any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around*|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><frac|g<around*|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around*|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><frac|g<around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>><eq-number>>>|<row|<cell|>|<cell|=g<around|(|t|)><eq-number>>>>>
    </align>

    Therefore

    <\equation>
      M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>=M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>=I
    </equation>

    \ proving that <math|M<rsub|\<theta\>>> is unitary.
  </proof>

  <\corollary>
    [Measure Preservation]<label|cor:measure_preserve> The transformation
    <math|M<rsub|\<theta\>>> preserves the <math|L<rsup|2>>-measure in the
    sense that for any measurable set <math|A\<subseteq\>\<bbb-R\>>

    <\equation>
      <label|eq:measure_preserve_sets><big|int><rsub|A><around|\<lvert\>|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\<rvert\>><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|A|)>><around|\<lvert\>|f<around|(|s|)>|\<rvert\>><rsup|2>*<space|0.17em>d*s
    </equation>
  </corollary>

  <\proof>
    The proof follows the same change of variables argument as in
    Theorem<nbsp><reference|thm:unitary>, applied to the characteristic
    function of the set <math|A>.
  </proof>

  <subsection|<math|L<rsup|2>>-Norm Preservation><label|sec:norm_preservation>

  <\theorem>
    [Measure Preservation]<label|thm:measure_preserve> The transformation
    defined in equation<nbsp><eqref|eq:time_change> preserves the
    <math|L<rsup|2>>-norm in the sense that

    <\equation>
      <label|eq:measure_preserve><big|int><rsub|I><math-up|var><around|(|Z<around*|(|t|)>|)>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|X<around*|(|s|)>|)>*<space|0.17em>d*s
    </equation>

    for any measurable set <math|I\<subseteq\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Using the change of variables <math|s=\<theta\><around|(|t|)>> with
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I><math-up|var><around|(|X<around*|(|t|)>|)>*<space|0.17em>d*t>|<cell|=<big|int><rsub|I><math-up|var><around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around*|(|\<theta\><around|(|t|)>|)>|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><math-up|var><around|(|X<around*|(|\<theta\><around|(|t|)>|)>|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<theta\><around|(|I|)>><math-up|var><around|(|X<around*|(|s|)>|)>*<space|0.17em>d*s<eq-number>>>>>
    </align>
  </proof>

  <subsection|Oscillatory Representation>

  <\theorem>
    [Oscillatory Form]<label|thm:osc_rep> The process
    <math|<around*|{|Z<around*|(|t|)>|}>> defined in
    equation<nbsp><eqref|eq:time_change> is oscillatory with oscillatory
    functions

    <\equation>
      <label|eq:phi_def>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    and gain functions \ 

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </theorem>

  <\proof>
    Apply the unitary time change operator
    <math|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>> in Defintion
    (<reference|M>) then substitute the spectral
    representation<nbsp><eqref|eq:stationary_rep> of the stationary process
    <math|X<around*|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|Z<around*|(|t|)>>|<cell|=<around|(|M<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around*|(|\<theta\><around*|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where\ 

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    To verify this is an oscillatory representation according to
    Definition<nbsp><reference|def:oscillatory>, express
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>> in the form of a function of
    the time-dependent gain <math|A<rsub|t><around*|(|\<lambda\>|)>> as
    required

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*<space|0.17em>e<rsup|i*\<omega\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t+t|)>>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>>>>>>
    </equation>

    where <math|>

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> almost
    everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on
    s<math|>ets of measure zero, the function
    <math|A<rsub|t><around|(|\<omega\>|)>> is well-defined almost everywhere.
    Moreover, <math|A<rsub|t><around|(|\<cdummy\>|)>\<in\>L<rsup|2><around|(|\<mu\>|)>>
    for each <math|t> since:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><big|int><rsub|-\<infty\>><rsup|\<infty\>>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*\<mu\><around|(|\<bbb-R\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>

    where the finiteness follows from <math|\<mu\>> being a finite measure
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>> being finite almost
    everywhere.
  </proof>

  <subsection|Envelope and Evolutionary Spectrum>

  \;

  <\corollary>
    [Evolutionary Spectrum]<label|cor:evolving_spec> The evolutionary power
    spectrum is

    <\equation>
      <label|eq:evolutionary_spec><tabular|<tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<omega\>|)>>|<cell|=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>>>>>>
    </equation>
  </corollary>

  <\proof>
    By Definition<nbsp><reference|def:oscillatory> and the envelope from
    Equation<nbsp><reference|envelope>, the evolutionary power spectrum is:

    <\align>
      <tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<omega\>|)>>|<cell|=<around|\<lvert\>|A<rsub|t><around|(|\<omega\>|)>|\<rvert\>><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around*|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    since\ 

    <\equation>
      <around|\||e<rsup|i*\<alpha\>>|\|>=1\<forall\>\<alpha\>\<in\>\<bbb-R\>
    </equation>
  </proof>

  <section|Operator Conjugation><label|sec:conjugation>

  <\theorem>
    [Operator Conjugation]<label|thm:operator_conjugation> Let
    <math|T<rsub|K>> be the \ integral covariance operator defined by

    <\equation>
      <label|eq:integral_op_original><tabular|<tformat|<table|<row|<cell|<around|(|T<rsub|K>*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*<space|0.17em>d*s>>>>>
    </equation>

    where <math|K<around*|(|h|)>> is the stationary kernel

    <\equation>
      K<around*|(|h|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around*|(|\<lambda\>|)>e<rsup|i
      \<lambda\> h>\<mathd\>\<lambda\>
    </equation>

    and let <math|T<rsub|K<rsub|\<theta\>>>> be the integral covariance
    operator defined by

    <\equation>
      <label|eq:integral_op_transformed><tabular|<tformat|<table|<row|<cell|<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<theta\>><around*|(|s,t|)>f<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*<sqrt|<wide|\<theta\>|\<dot\>><around*|(|t|)><wide|\<theta\>|\<dot\>><around*|(|s|)>>f<around|(|s|)>*<space|0.17em>d*s>>>>>
    </equation>

    for the unitarily time-changed kernel <math|>

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around*|(|t|)><wide|\<theta\>|\<dot\>><around*|(|s|)>>
    </equation>

    Then

    <\equation>
      <label|eq:conjugation>T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>
    </equation>
  </theorem>

  <\proof>
    For any <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, compute
    <math|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>>|<cell|=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>><eq-number>>>|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)><frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*d*s<eq-number>>>>>
    </align>

    Apply the change of variables <math|u=\<theta\><rsup|-1><around|(|s|)>>,
    so <math|s=\<theta\><around|(|u|)>> and
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|u|)>*d*u>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)><frac|g<around|(|u|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>>*<wide|\<theta\>|\<dot\>><around|(|u|)>*d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*d*u<eq-number>>>>>
    </align>

    Now apply <math|M<rsub|\<theta\>>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*d*u<eq-number>>>>>
    </align>

    Apply the change of variables <math|s=\<theta\><around|(|u|)>> in the
    reverse direction:

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*d*s<eq-number>>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)><eq-number>>>>>
    </align>

    This establishes the conjugation relation<nbsp><eqref|eq:conjugation>.
  </proof>

  <section|Expected Zero Count><label|sec:zero_count>

  <\theorem>
    [Expected Zero-Counting Function]<label|thm:zero_count> Let
    <math|\<theta\>\<in\>\<cal-F\>> and let\ 

    <\equation>
      K<around|(|\<tau\>|)>=<math-up|cov><around|(|X<around*|(|t|)>,X<around*|(|\<tau\>|)>|)>
    </equation>

    \ be twice differentiable at <math|\<tau\>=0>. The expected number of
    zeros of the process <math|X<rsub|t>> in <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:zero_count>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>
    </equation>
  </theorem>

  <\proof>
    The covariance function of the time-changed process is

    <\equation>
      <label|eq:time_changed_cov>K<rsub|\<theta\>><around|(|s,t|)>=<math-up|cov><around|(|X<rsub|s>,X<rsub|t>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    For the zero-crossing analysis, consider the normalized process. By the
    Kac-Rice formula:

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>*<space|0.17em>d*t
    </equation>

    Computing the mixed partial derivative:

    <\align>
      <tformat|<table|<row|<cell|<frac|\<partial\>|\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<frac|1|2>*<frac|<wide|\<theta\>|\<ddot\>><around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><eq-number>>>|<row|<cell|>|<cell|<space|1em>+<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>>*<wide|K|\<dot\>><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><math-up|sgn><around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>*<wide|\<theta\>|\<dot\>><around|(|t|)><eq-number>>>>>
    </align>

    Taking the limit as <math|s\<to\>t> and using the fact that
    <math|<wide|K|\<dot\>><around|(|0|)>=0> for stationary processes:

    <\align>
      <tformat|<table|<row|<cell|lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|K|\<ddot\>><around|(|0|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)><eq-number>>>>>
    </align>

    Substituting into the Kac-Rice formula:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b><sqrt|-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<big|int><rsub|a><rsup|b><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)><eq-number>>>>>
    </align>

    Here the second equality uses <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0>
    almost everywhere.
  </proof>

  <section|Conclusion><label|sec:conclusion>

  This analysis establishes that Gaussian processes generated by
  measure-preserving bijective time changes of stationary processes form a
  well-defined subclass of oscillatory processes. The key contributions
  include:

  <\enumerate>
    <item>The construction of the unitary operator <math|M<rsub|\<theta\>>>
    and its inverse, with proper treatment of the case where

    <\equation>
      <wide|\<theta\>|\<dot\>><around|(|t|)>=0
    </equation>

    \ on sets of measure zero

    <item>The explicit oscillatory representation with envelope function

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    <item>The evolutionary power spectrum formula

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    <item>The operator conjugation relationship

    <\equation>
      T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>
    </equation>

    <item>A closed-form expression for the expected zero count in terms of
    the range of the time scaling function
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
    <associate|page-breaking|sloppy>
    <associate|page-height|auto>
    <associate|page-medium|beamer>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|M|<tuple|5|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-1|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-10|<tuple|6|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-11|<tuple|5|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-2|<tuple|2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-3|<tuple|3|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-4|<tuple|3.1|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-5|<tuple|3.2|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-6|<tuple|3.3|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-7|<tuple|3.4|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-8|<tuple|4|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-9|<tuple|5|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-kac1943|<tuple|kac1943|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-rice1945|<tuple|rice1945|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|cor:evolving_spec|<tuple|13|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|cor:measure_preserve|<tuple|10|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:inverse_unitary_op|<tuple|7|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:oscillatory|<tuple|4|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:scaling|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:time_changed_proc|<tuple|6|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|envelope|<tuple|6|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:L2_preserve|<tuple|14|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:conjugation|<tuple|53|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:evolutionary_spec|<tuple|43|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_original|<tuple|49|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_transformed|<tuple|51|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:kac_rice|<tuple|65|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:measure_preserve|<tuple|28|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:measure_preserve_sets|<tuple|27|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:oscillatory_rep|<tuple|9|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:phi_def|<tuple|32|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:stationary_rep|<tuple|3|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_change|<tuple|12|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_changed_cov|<tuple|64|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_inverse|<tuple|13|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_op|<tuple|11|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:zero_count|<tuple|63|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|lem:inverse_well_defined|<tuple|8|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|rem:inverse_properties|<tuple|2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:conclusion|<tuple|6|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:conjugation|<tuple|4|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:norm_preservation|<tuple|3.2|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:scaling|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:time_change|<tuple|3|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|sec:zero_count|<tuple|5|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:measure_preserve|<tuple|11|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:operator_conjugation|<tuple|14|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:osc_rep|<tuple|12|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:unitary|<tuple|9|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:zero_count|<tuple|15|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Definition and Unitary
      Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc><with|mode|<quote|math>|L<rsup|2>>-Norm
      Preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Oscillatory Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Envelope and Evolutionary
      Spectrum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Operator
      Conjugation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Expected
      Zero Count> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>