<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Oscillatory Process
  Inversion>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    [Inversion of Oscillatory Processes]<label|thm:inversion>Given

    <\equation>
      Z<around|(|s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<phi\><rsub|s><around|(|\<lambda\>|)>> is measurable,
    invertible (<math|\<phi\><rsub|s><around|(|\<lambda\>|)>\<neq\>0> for all
    <math|s,\<lambda\>>), and satisfies the <with|font-series|bold|quadratic
    integrability condition>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*t*<space|0.17em>d*\<lambda\>\<less\>\<infty\>
    </equation>

    and <math|\<Phi\><around|(|\<lambda\>|)>> is a complex orthogonal random
    measure with <math|>

    <\equation>
      E<around|(|<around|\||d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|)>=d*\<mu\><around|(|\<lambda\>|)>
    </equation>

    Define the stationary process:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Define the inverse kernel:

    <\equation>
      <label|eq:inverse-kernel>b<around|(|t,s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|i*\<lambda\>*t>|\<phi\><rsub|s><around|(|\<lambda\>|)>>*<space|0.17em>e<rsup|-i*\<lambda\>*s>*<space|0.17em>d*\<lambda\>
    </equation>

    <with|font-series|bold|Invertibility condition:> Require

    <\equation>
      <label|eq:invertibility><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<frac|1|\<phi\><rsub|t><around|(|\<lambda\>|)>>|\|><rsup|2>*<space|0.17em>d*t*<space|0.17em>d*\<lambda\>\<less\>\<infty\>
    </equation>

    Then:

    <\equation>
      <label|eq:inversion-formula>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>b<around|(|t,s|)>*<space|0.17em>Z<around|(|s|)>*<space|0.17em>d*s
    </equation>
  </theorem>

  <\proof>
    <\itemize>
      <item><label|step:expand> Expand the convolution:

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>b<around|(|t,s|)>*<space|0.17em>Z<around|(|s|)>*<space|0.17em>d*s>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|i*\<lambda\>*t>|\<phi\><rsub|s><around|(|\<lambda\>|)>>*e<rsup|-i*\<lambda\>*s>*d*\<lambda\>|]>>>|<row|<cell|>|<cell|<space|1em>\<times\><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)>|]>*d*s>>>>>
      </equation>

      <item><label|step:fubini> Exchange order of integration by Fubini's
      theorem (justified by the quadratic integrability conditions
      <eqref|eq:invertibility>):

      <\equation>
        <tabular|<tformat|<table|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<frac|\<phi\><rsub|s><around|(|\<omega\>|)>|\<phi\><rsub|s><around|(|\<lambda\>|)>>*e<rsup|-i*\<lambda\>*s>*d*s|]>*d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>>>>>
      </equation>

      <item><label|step:inner-integral> Evaluate the inner integral over
      <math|s>:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|\<phi\><rsub|s><around|(|\<omega\>|)>|\<phi\><rsub|s><around|(|\<lambda\>|)>>*e<rsup|-i*\<lambda\>*s>*d*s
      </equation>

      For <math|\<phi\><rsub|s><around|(|\<lambda\>|)>=A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>>:

      <\equation>
        <frac|\<phi\><rsub|s><around|(|\<omega\>|)>|\<phi\><rsub|s><around|(|\<lambda\>|)>>*e<rsup|-i*\<lambda\>*s>=<frac|A<rsub|s><around|(|\<omega\>|)>|A<rsub|s><around|(|\<lambda\>|)>>*e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*s>
      </equation>

      The integral becomes:

      <\equation>
        <label|eq:dirac-delta><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|A<rsub|s><around|(|\<omega\>|)>|A<rsub|s><around|(|\<lambda\>|)>>*e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*s>*<space|0.17em>d*s=2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<lambda\>|)>
      </equation>

      where this holds as a distributional identity under the stated
      integrability and invertibility conditions.

      <item><label|step:substitute> Substitute <eqref|eq:dirac-delta> back:

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>\<cdot\>2*\<pi\>*\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=X<around|(|t|)>>>>>>
      </equation>
    </itemize>

    \;
  </proof>

  <section*|Summary>

  Under the conditions:

  <\enumerate>
    <item><math|<big|int><big|int><around|\||\<phi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*t*<space|0.17em>d*\<lambda\>\<less\>\<infty\>>

    <item><math|\<phi\><rsub|s><around|(|\<lambda\>|)>\<neq\>0> everywhere

    <item><math|<big|int><big|int><around|\||1/\<phi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*t*<space|0.17em>d*\<lambda\>\<less\>\<infty\>>
  </enumerate>

  The stationary process <math|X<around|(|t|)>> is exactly inverted from the
  oscillatory process <math|Z<around|(|t|)>> by equation
  <eqref|eq:inversion-formula> with kernel <eqref|eq:inverse-kernel>.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|13|2>>
    <associate|eq:dirac-delta|<tuple|12|2>>
    <associate|eq:inverse-kernel|<tuple|5|1>>
    <associate|eq:inversion-formula|<tuple|7|1>>
    <associate|eq:invertibility|<tuple|6|1>>
    <associate|step:expand|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|step:fubini|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|step:inner-integral|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|step:substitute|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|thm:inversion|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>