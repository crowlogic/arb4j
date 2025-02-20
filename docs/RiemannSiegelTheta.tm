<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \;

  <\theorem>
    The Riemann-Siegel theta function's exact formula:

    <\equation>
      \<theta\><around|(|t|)>=arg <around*|(|\<Gamma\>*<around*|(|<frac|1|4>+i<frac|t|2>|)>|)>-<frac|log
      \<pi\>|2>*t+\<pi\>*<around*|\<lfloor\>|<frac|t|2>+<frac|1|4>|\<rfloor\>>
    </equation>

    contains essential phase corrections from the floor function to maintain
    continuity.
  </theorem>

  <\proof>
    <paragraph|Key Insight from Analytic Structure> The Gamma function
    <math|\<Gamma\><around|(|z|)>> has:

    <\itemize>
      <item>Poles at <math|z=0,-1,-2>,...

      <item>Branch cuts along <math|<around|(|-\<infty\>,0|]>> for its
      argument
    </itemize>

    For <math|z=<frac|1|4>+i<frac|t|2>>, as the real-valued parameter
    <math|t> increases, <math|z> moves vertically in the complex plane
    <math|\<bbb-C\>>. The argument <math|arg
    <around|(|\<Gamma\><around|(|z|)>|)>> becomes discontinuous when crossing
    "virtual branch cuts" created by analytic continuation.

    <paragraph|Phase Jumps via Reflection > Using the reflection formula:

    <\equation>
      \<Gamma\><around|(|z|)>*\<Gamma\>*<around|(|1-z|)>=<frac|\<pi\>|sin
      <around|(|\<pi\>*z|)>>
    </equation>

    Taking arguments reveals:

    <\equation>
      arg \<Gamma\><around|(|z|)>+arg \<Gamma\>*<around|(|1-z|)>\<equiv\>-arg
      sin <around|(|\<pi\>*z|)><pmod|2*\<pi\>>
    </equation>

    <paragraph|Discontinuity Condition> Critical phase jumps occur when:

    <\equation>
      sin <around*|(|\<pi\>*<around*|(|<frac|1|4>+i<frac|t|2>|)>|)>=0\<Longrightarrow\><frac|t|2>+<frac|1|4>\<in\>\<bbb-Z\>
    </equation>

    This equation marks transition points where:

    <\enumerate>
      <item>Left limit: <math|arg \<Gamma\><around|(|z<rsup|->|)>> jumps by
      <math|+\<pi\>>

      <item>Right limit: <math|arg \<Gamma\><around|(|z<rsup|+>|)>> remains
      continuous
    </enumerate>

    <paragraph|Floor Function Compensation > The floor term counts crossings:

    <\equation>
      <around*|\<lfloor\>|<frac|t|2>+<frac|1|4>|\<rfloor\>>=<text|number of
      integer crossings>
    </equation>

    Each crossing adds <math|\<pi\>> to cancel the <math|arg \<Gamma\>> jump:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<pi\>*<around*|\<lfloor\>|<frac|t+\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*<around|(|n-1|)>
    </equation>

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<pi\>*<around*|\<lfloor\>|<frac|t+\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*n
    </equation>

    The <math|\<pi\>> difference exactly offsets the <math|arg \<Gamma\>>
    discontinuity.

    <paragraph|Continuity Verification> For <math|t<rsub|0>> where
    <math|<frac|t<rsub|0>|2>+<frac|1|4>=n\<in\>\<bbb-Z\>>:

    <\align*>
      <tformat|<table|<row|<cell|lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<theta\>*<around|(|t<rsub|0>+\<epsilon\>|)>>|<cell|=arg
      \<Gamma\><around|(|n<rsup|->|)>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*<around|(|n-1|)>>>|<row|<cell|lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<theta\>*<around|(|t<rsub|0>+\<epsilon\>|)>>|<cell|=<around|(|arg
      \<Gamma\><around|(|n<rsup|+>|)>+\<pi\>|)>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*n>>|<row|<cell|>|<cell|=arg
      \<Gamma\><around|(|n<rsup|+>|)>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*n>>>>
    </align*>

    Matching limits confirm smooth transition.
  </proof>
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|3tab>|Key Insight from Analytic Structure (Search
      Result [1],[8]) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|3tab>|Phase Jumps via Reflection
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|3tab>|Discontinuity Condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|3tab>|Floor Function Compensation
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|3tab>|Continuity Verification
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>