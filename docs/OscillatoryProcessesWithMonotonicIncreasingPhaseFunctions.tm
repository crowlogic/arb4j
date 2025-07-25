<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Oscillatory Processes with Monotonic Phase
  Functions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\definition>
    [Oscillatory Process] Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>
    be a complex second-order process. <math|<around|{|X<rsub|t>|}>> is
    called oscillatory if

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|Z<around|(|\<omega\>|)>> has orthogonal increments where

    <\equation>
      E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
    </equation>

    and

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
    </equation>
  </definition>

  <\theorem>
    Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be smooth and strictly
    monotonically increasing. Define

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    Set

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    Then the time-varying impulse response <math|h<rsub|t><around|(|u|)>>
    defined by

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*<space|0.17em>d*u
    </equation>

    is

    <\equation>
      h<rsub|t><around|(|u|)>=\<delta\>*<around|(|u-<around|[|\<theta\><around|(|t|)>-t|]>|)>
    </equation>
  </theorem>

  <\proof>
    The inverse Fourier transform yields

    <\equation>
      <tabular|<tformat|<table|<row|<cell|h<rsub|t><around|(|u|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*d*\<omega\>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t-u|)>>*d*\<omega\>>>|<row|<cell|>|<cell|=\<delta\>*<around|(|\<theta\><around|(|t|)>-t-u|)>>>|<row|<cell|>|<cell|=\<delta\>*<around|(|u-<around|[|\<theta\><around|(|t|)>-t|]>|)>>>>>>
    </equation>

    \;
  </proof>

  <\corollary>
    Let <math|S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>>.
    Then

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*<space|0.17em>h<rsub|t><around|(|u|)>*<space|0.17em>d*u=S<rsub|2*t-\<theta\><around|(|t|)>>
    </equation>

    and

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>
  </corollary>

  <\proof>
    By the sifting property of the Dirac delta,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*\<delta\>*<around|(|u-<around|[|\<theta\><around|(|t|)>-t|]>|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=S<rsub|t-<around|[|\<theta\><around|(|t|)>-t|]>>>>|<row|<cell|>|<cell|=S<rsub|2*t-\<theta\><around|(|t|)>>>>>>>
    </equation>

    By direct substitution, the oscillatory representation holds by
    definition.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-medium|paper>
  </collection>
</initial>