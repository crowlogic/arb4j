<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Riemann Hypothesis in Terms of the Hardy
  Z-Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This paper establishes the equivalence of the Riemann Hypothesis (RH)
    with the assertion that all zeros of the Hardy <math|Z>-function are
    real. The Riemann-Siegel theta function <math|\<theta\><around|(|t|)>> is
    constructed to cancel the complex phase of
    <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>>, rendering
    <math|Z<around|(|t|)>> real-valued independent of the Riemann Hypothesis.
    Proofs of continuity for <math|\<theta\><around|(|t|)>> and the phase
    cancellation are provided.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Foundational
    Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Riemann-Siegel Theta Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Hardy Z-Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Phase
    Cancellation and Reality of <with|mode|math|Z<around|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Functional Equation of
    <with|mode|math|\<zeta\><around|(|s|)>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Phase Analysis on the Critical Line
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Main
    Theorem: RH Equivalence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|3tab|Forward Direction (<with|mode|math|\<Rightarrow\>>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|3tab|Reverse Direction (<with|mode|math|\<Leftarrow\>>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Continuity
    of <with|mode|math|\<theta\><around|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Foundational Definitions>

  <subsection|Riemann-Siegel Theta Function><label|sec:theta>

  The Riemann-Siegel theta function <math|\<theta\><around|(|t|)>>, critical
  to the <math|Z>-function, is defined as:

  <\equation>
    \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>-<frac|log
    \<pi\>|2>*t+\<pi\>*<around*|\<lfloor\>|<frac|t|2>+<frac|1|4>|\<rfloor\>><label|eq:theta>
  </equation>

  where <math|\<Gamma\><around|(|z|)>> is the gamma function.

  <subsection|Hardy Z-Function><label|sec:Z>

  The Hardy <math|Z>-function is defined by:

  <\equation>
    Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><label|eq:Zdef>
  </equation>

  <section|Phase Cancellation and Reality of <math|Z<around|(|t|)>>>

  <subsection|Functional Equation of <math|\<zeta\><around|(|s|)>>>

  The functional equation for the Riemann zeta function is:

  <\equation>
    \<zeta\><around|(|s|)>=\<chi\><around|(|s|)>*\<zeta\>*<around|(|1-s|)><label|eq:func_eq>
  </equation>

  <\equation>
    \<chi\><around|(|s|)>=\<pi\><rsup|s-<frac|1|2>>*<frac|\<Gamma\><around*|(|<frac|1-s|2>|)>|\<Gamma\><around*|(|<frac|s|2>|)>>
  </equation>

  <subsection|Phase Analysis on the Critical Line><label|sec:phase>

  <\lemma>
    <dueto|Phase Cancellation><label|lem:phase>For <math|s=<frac|1|2>+i*t>,
    the theta function satisfies:

    <\equation>
      \<theta\><around|(|t|)>\<equiv\>-arg
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)><pmod|\<pi\>>
    </equation>

    rendering <math|Z<around|(|t|)>> real-valued.
  </lemma>

  <\proof>
    On the critical line, <math|\<zeta\><around|(|s|)>=\<chi\><around|(|s|)><wide|\<zeta\><around|(|s|)>|\<bar\>>>
    via <eqref|eq:func_eq>. Taking arguments:

    <\equation>
      arg \<zeta\><around|(|s|)>\<equiv\>arg \<chi\><around|(|s|)>-arg
      \<zeta\><around|(|s|)><pmod|2*\<pi\>>
    </equation>

    Rearranging gives:

    <\equation>
      2*arg \<zeta\><around|(|s|)>\<equiv\>arg
      \<chi\><around|(|s|)><pmod|2*\<pi\>>
    </equation>

    so:

    <\equation>
      arg \<zeta\><around|(|s|)>\<equiv\><frac|1|2>*arg
      \<chi\><around|(|s|)><pmod|\<pi\>>
    </equation>

    Substituting <math|\<chi\><around|(|s|)>> from <eqref|eq:func_eq>:

    <\equation>
      arg \<chi\><around|(|s|)>=-<frac|log \<pi\>|2>*t+arg
      \<Gamma\>*<around*|(|<frac|1|4>-<frac|i*t|2>|)>+\<pi\>*<around*|\<lfloor\>|<frac|t|2>+<frac|1|4>|\<rfloor\>>
    </equation>

    By definition <eqref|eq:theta>, <math|\<theta\><around|(|t|)>\<equiv\><frac|1|2>*arg
    \<chi\><around|(|s|)><pmod|\<pi\>>>, hence:

    <\equation>
      arg \<zeta\>*<around*|(|<frac|1|2>+i*t|)>\<equiv\>-\<theta\><around|(|t|)><pmod|\<pi\>>
    </equation>

    forcing <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>
    to be real.
  </proof>

  <section|Main Theorem: RH Equivalence><label|sec:equivalence>

  <\theorem>
    <dueto|Equivalence><label|thm:RH>The Riemann Hypothesis holds if and only
    if all zeros of <math|Z<around|(|t|)>> are real.
  </theorem>

  <\proof>
    Let <math|\<rho\>=\<sigma\>+i*t> be a non-trivial zero of
    <math|\<zeta\><around|(|s|)>>.

    <paragraph|Forward Direction (<math|\<Rightarrow\>>)> If RH holds, all
    <math|\<rho\>> lie on <math|\<sigma\>=<frac|1|2>>. By Lemma
    <reference|lem:phase>, zeros of <math|Z<around|(|t|)>> correspond to
    <math|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>=0>, which are real.

    <paragraph|Reverse Direction (<math|\<Leftarrow\>>)> Suppose all zeros of
    <math|Z<around|(|t|)>> are real. For any <math|\<rho\>=\<sigma\>+i*t>,
    the functional equation implies an accompanying zero
    <math|\<rho\><rprime|'>=1-\<sigma\>+i*t>. If
    <math|\<sigma\>\<neq\><frac|1|2>>, then <math|\<rho\>> and
    <math|\<rho\><rprime|'>> would produce two distinct zeros of
    <math|Z<around|(|t|)>> at <math|t>, violating reality. Hence,
    <math|\<sigma\>=<frac|1|2>>.
  </proof>

  <section|Continuity of <math|\<theta\><around|(|t|)>>>

  <\theorem>
    <dueto|Continuity><label|thm:cont><math|\<theta\><around|(|t|)>>, defined
    in <eqref|eq:theta>, is continuous for all <math|t\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Let <math|n\<in\>\<bbb-Z\>> and <math|t<rsub|0>=2*n-<frac|1|2>>. Near
    <math|t<rsub|0>>:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>> arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t<rsub|0>+\<epsilon\>|2>|)>=lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      arg \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t<rsub|0>-\<epsilon\>|2>|)>+\<pi\>
    </equation>

    The floor term compensates:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<pi\>*<around*|\<lfloor\>|<frac|t<rsub|0>+\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*n,<space|1em>lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<pi\>*<around*|\<lfloor\>|<frac|t<rsub|0>-\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*<around|(|n-1|)>
    </equation>

    Thus:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<theta\>*<around|(|t<rsub|0>+\<epsilon\>|)>=lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<theta\>*<around|(|t<rsub|0>-\<epsilon\>|)>
    </equation>

    and <math|\<theta\><around|(|t|)>> is continuous everywhere.
  </proof>

  \;
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-10|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-2|<tuple|1.1|1|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-3|<tuple|1.2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-4|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-5|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-6|<tuple|2.2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-7|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-8|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|auto-9|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|eq:Zdef|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|eq:func_eq|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|eq:theta|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|lem:phase|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|sec:Z|<tuple|1.2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|sec:equivalence|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|sec:phase|<tuple|2.2|2|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|sec:theta|<tuple|1.1|1|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|thm:RH|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
    <associate|thm:cont|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_81.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundational
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Riemann-Siegel Theta
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Hardy Z-Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Phase
      Cancellation and Reality of <with|mode|<quote|math>|Z<around|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Functional Equation of
      <with|mode|<quote|math>|\<zeta\><around|(|s|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Phase Analysis on the
      Critical Line <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Theorem: RH Equivalence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Forward Direction
      (<with|mode|<quote|math>|\<Rightarrow\>>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|3tab>|Reverse Direction
      (<with|mode|<quote|math>|\<Leftarrow\>>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Continuity
      of <with|mode|<quote|math>|\<theta\><around|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>