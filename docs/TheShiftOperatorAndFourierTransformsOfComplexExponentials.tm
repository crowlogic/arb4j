<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Stone's Theorem, The Shift Group, and The Fourier
  Transform>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|This paper establishes fundamental connections
  between delta functions, Heaviside step functions, and level crossing
  counts for differentiable Gaussian processes. The authors develop the
  distributional framework using Schwartz test functions and tempered
  distributions, then derive key identities including the distributional
  derivative relationship between the Heaviside function and the Dirac delta.
  A change of variables theorem for delta functions of smooth functions is
  proven, providing the foundation for the main results. The work introduces
  a level crossing counting function that enumerates crossings of fixed
  levels by Gaussian process sample paths and demonstrates two equivalent
  representations: one as an integral involving the absolute derivative and
  delta function, and another as a sum of Heaviside step functions. These
  representations provide complementary perspectives on level crossing
  phenomena and establish the theoretical groundwork for analyzing crossing
  statistics of differentiable Gaussian processes. The results connect
  classical distribution theory with stochastic level crossing theory and
  provide tools for applications in stochastic process analysis.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Foundations
    of Distributions on Real Line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Basic
    Identities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Delta
    of a Smooth Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Counting
    Function for Level Crossings> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  \;

  \;

  \;

  <section|Foundations of Distributions on Real Line>

  <\definition>
    <dueto|Schwartz Test Function Space>The Schwartz space
    <math|\<cal-S\><around|(|\<bbb-R\>|)>> is the space of all infinitely
    differentiable functions <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-R\>> such
    that for every pair of nonnegative integers <math|m,n>,

    <\equation>
      sup<rsub|x\<in\>\<bbb-R\>><around|\||x<rsup|m>*\<phi\><rsup|<around|(|n|)>><around|(|x|)>|\|>\<less\>\<infty\>
    </equation>

    Functions in <math|\<cal-S\><around|(|\<bbb-R\>|)>> are called rapidly
    decreasing smooth test functions.
  </definition>

  <\definition>
    <dueto|Tempered Distribution>A tempered distribution is a continuous
    linear functional

    <\equation>
      T:\<cal-S\><around|(|\<bbb-R\>|)>\<to\>\<bbb-R\>
    </equation>
  </definition>

  <\definition>
    <dueto|Dirac Delta Distribution>The Dirac delta distribution
    <math|\<delta\><rsub|a>\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>
    centered at <math|a\<in\>\<bbb-R\>> is defined by

    <\equation>
      <around|\<langle\>|\<delta\><rsub|a>,\<phi\>|\<rangle\>>=\<phi\><around|(|a|)>
    </equation>

    for all <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>.\ 
  </definition>

  <\definition>
    <dueto|Heaviside Step Function>The Heaviside step function
    <math|H:\<bbb-R\>\<to\><around|{|0,1|}>> is defined by

    <\equation>
      H<around|(|x|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
      >x\<gtr\>0>>|<row|<cell|0>|<cell|<text|if
      >x\<leq\>0>>>>>|\<nobracket\>>
    </equation>
  </definition>

  <\definition>
    <dueto|Distributional Derivative>For a tempered distribution
    <math|T\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>, its
    distributional derivative <math|T<rprime|'>\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>
    is defined by

    <\equation*>
      <around|\<langle\>|T<rprime|'>,\<phi\>|\<rangle\>>=-<around|\<langle\>|T,\<phi\><rprime|'>|\<rangle\>>
    </equation*>

    for all <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>.
  </definition>

  <section|Basic Identities>

  <\theorem>
    <dueto|Heaviside Derivative>The Heaviside step function <math|H>
    satisfies

    <\equation>
      H<rprime|'>=\<delta\>
    </equation>

    as distributions on <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    For all <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|H<rprime|'>,\<phi\>|\<rangle\>>>|<cell|=-<around|\<langle\>|H,\<phi\><rprime|'>|\<rangle\>><eq-number>>>|<row|<cell|>|<cell|=-<big|int><rsub|-\<infty\>><rsup|\<infty\>>H<around|(|x|)>*\<phi\><rprime|'><around|(|x|)>*<space|0.17em>d*x<eq-number>>>|<row|<cell|>|<cell|=-<big|int><rsub|0><rsup|\<infty\>>\<phi\><rprime|'><around|(|x|)>*<space|0.17em>d*x<eq-number>>>|<row|<cell|>|<cell|=-<around|[|\<phi\><around|(|x|)>|]><rsub|0><rsup|\<infty\>><eq-number>>>|<row|<cell|>|<cell|=-<around|(|lim<rsub|x\<to\>\<infty\>>
      \<phi\><around|(|x|)>-\<phi\><around|(|0|)>|)><eq-number>>>|<row|<cell|>|<cell|=\<phi\><around|(|0|)><eq-number>>>>>
    </align>

    where the limit vanishes since <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>
    decays rapidly at infinity. Thus

    <\equation>
      <around|\<langle\>|H<rprime|'>,\<phi\>|\<rangle\>>=\<phi\><around|(|0|)>=<around|\<langle\>|\<delta\>,\<phi\>|\<rangle\>>
    </equation>
  </proof>

  <\theorem>
    <dueto|Integral of Delta>For any <math|a\<in\>\<bbb-R\>> and
    <math|T\<in\>\<bbb-R\>>,

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|T>\<delta\>*<around|(|t-a|)>*<space|0.17em>d*t=H*<around|(|T-a|)>
    </equation>
  </theorem>

  <\proof>
    Define

    <\equation>
      F<around|(|T|)>=<big|int><rsub|-\<infty\>><rsup|T>\<delta\>*<around|(|t-a|)>*<space|0.17em>d*t
    </equation>

    Taking the distributional derivative with respect to <math|T>:

    <\equation>
      F<rprime|'><around|(|T|)>=<frac|d|d*T>*<big|int><rsub|-\<infty\>><rsup|T>\<delta\>*<around|(|t-a|)>*<space|0.17em>d*t=\<delta\>*<around|(|T-a|)>
    </equation>

    Since <math|F*<around|(|-\<infty\>|)>=0> and

    <\equation>
      F<rprime|'><around|(|T|)>=\<delta\>*<around|(|T-a|)>=H<rprime|'>*<around|(|T-a|)>
    </equation>

    from the previous theorem, one has

    <\equation>
      F<around|(|T|)>=H*<around|(|T-a|)>+C
    </equation>

    for some constant <math|C>. The boundary condition

    <\equation>
      F*<around|(|-\<infty\>|)>=0=H*<around|(|-\<infty\>|)>+C
    </equation>

    implies <math|C=0>, thus

    <\equation>
      F<around|(|T|)>=H*<around|(|T-a|)>
    </equation>
  </proof>

  <section|Delta of a Smooth Function>

  <\theorem>
    <dueto|Delta under Change of Variables>Let
    <math|g:\<bbb-R\>\<to\>\<bbb-R\>> be continuously differentiable with
    isolated, simple zeros <math|<around|{|x<rsub|i>|}><rsub|i=1><rsup|\<infty\>>>
    such that <math|g<around|(|x<rsub|i>|)>=0> and
    <math|g<rprime|'><around|(|x<rsub|i>|)>\<neq\>0> for all <math|i\<ge\>1>.
    Then the identity

    <\equation>
      \<delta\><around|(|g<around|(|x|)>|)>=<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<delta\>*<around|(|x-x<rsub|i>|)>|<around|\||g<rprime|'><around|(|x<rsub|i>|)>|\|>>
    </equation>

    holds in <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    For <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

    <\equation>
      <around|\<langle\>|\<delta\><around|(|g<around|(|x|)>|)>,\<phi\>|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|x|)>*\<delta\><around|(|g<around|(|x|)>|)>*<space|0.17em>d*x
    </equation>

    Let <math|<around|{|I<rsub|i>|}><rsub|i=1><rsup|\<infty\>>> be pairwise
    disjoint intervals, each <math|I<rsub|i>> containing exactly one zero
    <math|x<rsub|i>> of <math|g>, and such that <math|g> is strictly monotone
    on <math|I<rsub|i>>. Near each zero <math|x<rsub|i>>, where <math|g> is
    locally monotone by the implicit function theorem, the change of
    variables <math|u=g<around|(|x|)>> gives

    <\equation>
      <text|<math|<tabular|<tformat|<table|<row|<cell|<big|int><rsub|I<rsub|i>>\<phi\><around|(|x|)>*\<delta\><around|(|g<around|(|x|)>|)>*<space|0.17em>d*x>|<cell|=<big|int><rsub|g<around|(|I<rsub|i>|)>><frac|\<phi\><around|(|g<rsup|-1><around|(|u|)>|)>|<around|\||g<rprime|'><around|(|g<rsup|-1><around|(|u|)>|)>|\|>>*\<delta\><around|(|u|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<frac|\<phi\><around|(|x<rsub|i>|)>|<around|\||g<rprime|'><around|(|x<rsub|i>|)>|\|>>>>>>>>>
    </equation>

    by the sifting property of <math|\<delta\>>. Summing over all zeros
    yields

    <\equation>
      <around|\<langle\>|\<delta\><around|(|g<around|(|x|)>|)>,\<phi\>|\<rangle\>>=<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<phi\><around|(|x<rsub|i>|)>|<around|\||g<rprime|'><around|(|x<rsub|i>|)>|\|>>=<around*|\<langle\>|<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<delta\>*<around|(|x-x<rsub|i>|)>|<around|\||g<rprime|'><around|(|x<rsub|i>|)>|\|>>,\<phi\>|\<rangle\>>
    </equation>

    Since this holds for all <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,
    the distributional equality follows.
  </proof>

  <section|Counting Function for Level Crossings>

  Let <math|x:\<bbb-R\>\<to\>\<bbb-R\>> be continuously differentiable, and
  fix <math|u\<in\>\<bbb-R\>>. Assume the zeros of
  <math|g<around|(|t|)>\<assign\>x<around|(|t|)>-u> are isolated and simple;
  that is, for every zero <math|t<rsub|i>> (with <math|i\<ge\>1>),

  <\equation>
    g<rprime|'><around|(|t<rsub|i>|)>=x<rprime|'><around|(|t<rsub|i>|)>\<neq\>0,<space|1em><text|for
    all >i\<ge\>1.
  </equation>

  <\definition>
    <label|N>[Level Crossing Counting Function] Define the counting function

    <\equation>
      N<rsub|u><around|(|T|)>\<assign\><text|the number of zeros
      >t<rsub|i>*<text|of >x<around|(|t|)>-u*<text|with >t<rsub|i>\<leq\>T.
    </equation>

    Equivalently, if <math|<around|(|t<rsub|i>|)><rsub|i=1><rsup|\<infty\>>>
    lists all zeros of <math|x<around|(|t|)>-u>,

    <\equation>
      N<rsub|u><around|(|T|)>=<big|sum><rsub|i=1><rsup|\<infty\>><with|math-font-family|bf|1><rsub|<around|{|t<rsub|i>\<le\>T|}>>
    </equation>

    where <math|<with|math-font-family|bf|1><rsub|<around|{|t<rsub|i>\<le\>T|}>>>
    is the indicator of the event <math|t<rsub|i>\<le\>T>.
  </definition>

  <\theorem>
    <dueto|Counting Function as Integral Over Delta>For every
    <math|T\<in\>\<bbb-R\>>,

    <\equation>
      N<rsub|u><around|(|T|)>=<big|int><rsub|-\<infty\>><rsup|T><around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>*<space|0.17em>d*t
    </equation>
  </theorem>

  <\proof>
    Using the delta change of variables theorem with

    <\equation>
      g<around|(|t|)>=x<around|(|t|)>-u
    </equation>

    the corresponding zeros <math|<around|(|t<rsub|i>|)><rsub|i=1><rsup|\<infty\>>>
    of <math|g> satisfy <math|g<around|(|t<rsub|i>|)>=0> and
    <math|g<rprime|'><around|(|t<rsub|i>|)>=x<rprime|'><around|(|t<rsub|i>|)>\<neq\>0>.
    From the theorem,

    <\equation>
      \<delta\>*<around|(|x<around|(|t|)>-u|)>=<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<delta\>*<around|(|t-t<rsub|i>|)>|<around|\||x<rprime|'><around|(|t<rsub|i>|)>|\|>>
    </equation>

    Therefore,

    <\align>
      <tformat|<table|<row|<cell|<around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>>|<cell|=<around|\||x<rprime|'><around|(|t|)>|\|>*<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<delta\>*<around|(|t-t<rsub|i>|)>|<around|\||x<rprime|'><around|(|t<rsub|i>|)>|\|>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><around|\||x<rprime|'><around|(|t|)>|\|><frac|\<delta\>*<around|(|t-t<rsub|i>|)>|<around|\||x<rprime|'><around|(|t<rsub|i>|)>|\|>><eq-number>>>>>
    </align>

    Since <math|x<rprime|'><around|(|t<rsub|i>|)>\<neq\>0> by assumption, and
    <math|\<delta\>*<around|(|t-t<rsub|i>|)>> picks out the value at
    <math|t=t<rsub|i>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><frac|<around|\||x<rprime|'><around|(|t<rsub|i>|)>|\|>|<around|\||x<rprime|'><around|(|t<rsub|i>|)>|\|>>*\<delta\>*<around|(|t-t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>>\<delta\>*<around|(|t-t<rsub|i>|)>.>>>>>
    </equation>

    Therefore,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|T><around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>*<space|0.17em>d*t>|<cell|=<big|int><rsub|-\<infty\>><rsup|T><around*|(|<big|sum><rsub|i=1><rsup|\<infty\>>\<delta\>*<around|(|t-t<rsub|i>|)>|)>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|T>\<delta\>*<around|(|t-t<rsub|i>|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><with|math-font-family|bf|1><rsub|<around|{|t<rsub|i>\<le\>T|}>>>>|<row|<cell|>|<cell|=N<rsub|u><around|(|T|)>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    <dueto|Counting Function as Sum of Heaviside Steps>The counting function
    (<reference|N>) is given by

    <\equation>
      N<rsub|u><around|(|T|)>=<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)><space|1em>\<forall\>T\<in\>\<bbb-R\>,
    </equation>

    where the sum runs over all zero crossing times <math|t<rsub|i>>,
    <math|i\<ge\>1>.
  </theorem>

  <\proof>
    By definition of the Heaviside function, for each <math|i\<ge\>1>,

    <\equation>
      H*<around|(|T-t<rsub|i>|)>=1
    </equation>

    if and only if <math|T\<geq\>t<rsub|i>>, and

    <\equation>
      H*<around|(|T-t<rsub|i>|)>=0
    </equation>

    otherwise. Therefore,

    <\equation>
      <\aligned>
        <tformat|<table|<row|<cell|<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)>>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><with|math-font-family|bf|1><rsub|<around|{|t<rsub|i>\<le\>T|}>>>>|<row|<cell|>|<cell|=N<rsub|u><around|(|T|)>.>>>>
      </aligned>
    </equation>
  </proof>

  <\theorem>
    <dueto|Equivalence of Representations>The delta integral representation
    and the Heaviside step sum representation are equivalent:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|T><around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>*<space|0.17em>d*t=<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)>
    </equation>
  </theorem>

  <\proof>
    From the previous theorems,

    <\equation>
      N<rsub|u><around|(|T|)>=<big|int><rsub|-\<infty\>><rsup|T><around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>*<space|0.17em>d*t
    </equation>

    and

    <\equation>
      N<rsub|u><around|(|T|)>=<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)>
    </equation>

    for all <math|T\<in\>\<bbb-R\>>. Therefore,

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|T><around|\||x<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|x<around|(|t|)>-u|)>*<space|0.17em>d*t=<big|sum><rsub|i=1><rsup|\<infty\>>H*<around|(|T-t<rsub|i>|)>
    </equation>
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
    <associate|N|<tuple|9|4>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundations
      of Distributions on Real Line> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Basic
      Identities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Delta
      of a Smooth Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Counting
      Function for Level Crossings> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>