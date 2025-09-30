<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|Inversion of Bandlimited Stationary and Oscillatory
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Stationary
    Bandlimited Spectral Inversion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Inversion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Oscillatory
    Subclass from Monotone Time Change> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Hardy
    <with|mode|math|Z> Random Wave Example>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Inversion of Bandlimited Stationary Processes>

  <\theorem>
    [Stationary Inversion] Let <math|X<around|(|t|)>> be a stationary
    Gaussian process with spectral support in
    <math|<around|[|-\<Omega\>,\<Omega\>|]>>. Each sample path
    <math|X<around|(|\<cdummy\>,\<omega\>|)>> is an entire function of
    exponential type <math|\<Omega\>> and satisfies

    <\equation>
      X<around|(|t,\<omega\>|)>=<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>e<rsup|i*\<mu\>*t>*<space|0.17em>d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>
    </equation>

    Then for each <math|\<lambda\>\<in\><around|[|-\<Omega\>,\<Omega\>|]>>,

    <\equation>
      d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T/2><rsup|T/2>X<around|(|t,\<omega\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em><frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*<space|0.17em>d*t
    </equation>
  </theorem>

  <\proof>
    Substitute the representation

    <\equation>
      <big|int><rsub|-T/2><rsup|T/2>X<around|(|t,\<omega\>|)>*e<rsup|-i*\<lambda\>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t=<big|int><rsub|-T/2><rsup|T/2><around*|(|<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>|)>*e<rsup|-i*\<lambda\>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t
    </equation>

    Exchange integration:

    <\equation>
      =<big|int><rsub|-\<Omega\>><rsup|\<Omega\>><around*|(|<big|int><rsub|-T/2><rsup|T/2>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t|)>*d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>
    </equation>

    Define

    <\equation>
      K<rsub|T>*<around|(|\<mu\>-\<lambda\>|)>\<assign\><big|int><rsub|-T/2><rsup|T/2>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t
    </equation>

    Then

    <\equation>
      <big|int><rsub|-T/2><rsup|T/2>X<around|(|t,\<omega\>|)>*e<rsup|-i*\<lambda\>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t=<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>K<rsub|T>*<around|(|\<mu\>-\<lambda\>|)>*<space|0.17em>d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>
    </equation>

    As <math|T\<to\>\<infty\>>, one has

    <\equation>
      lim<rsub|T\<to\>\<infty\>> K<rsub|T>*<around|(|\<mu\>-\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|\<mu\>=\<lambda\>>>|<row|<cell|0,>|<cell|\<mu\>\<neq\>\<lambda\>>>>>>
    </equation>

    Therefore the limit isolates <math|d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>>.
  </proof>

  <section|Inversion of Bandlimited Oscillatory Processes>

  <\theorem>
    [Oscillatory Process Inversion] Let

    <\equation>
      Y<around|(|t,\<omega\>|)>=<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>a<rsub|\<mu\>><around|(|t|)>*<space|0.17em>e<rsup|i*\<mu\>*t>*<space|0.17em>d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>
    </equation>

    where each <math|a<rsub|\<mu\>><around|(|t|)>> is bounded and analytic.
    Then

    <\equation>
      d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T/2><rsup|T/2><wide|a<rsub|\<lambda\>><around|(|t|)>|\<bar\>><space|0.17em>Y<around|(|t,\<omega\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em><frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*<space|0.17em>d*t
    </equation>
  </theorem>

  <\proof>
    Substitute the representation:

    <\equation>
      <big|int><rsub|-T/2><rsup|T/2><wide|a<rsub|\<lambda\>><around|(|t|)>|\<bar\>><around*|(|<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>a<rsub|\<mu\>><around|(|t|)>*e<rsup|i*\<mu\>*t>*d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>|)>*e<rsup|-i*\<lambda\>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t
    </equation>

    Exchange order:

    <\equation>
      =<big|int><rsub|-\<Omega\>><rsup|\<Omega\>><around*|(|<big|int><rsub|-T/2><rsup|T/2>a<rsub|\<mu\>><around|(|t|)><wide|a<rsub|\<lambda\>><around|(|t|)>|\<bar\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t|)>*d*\<Phi\><rsub|\<omega\>><around|(|\<mu\>|)>
    </equation>

    Define

    <\equation>
      K<rsub|T><rsup|<around|(|\<lambda\>,\<mu\>|)>>\<assign\><big|int><rsub|-T/2><rsup|T/2>a<rsub|\<mu\>><around|(|t|)><wide|a<rsub|\<lambda\>><around|(|t|)>|\<bar\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t
    </equation>

    For <math|\<mu\>=\<lambda\>>,

    <\equation>
      K<rsub|T><rsup|<around|(|\<lambda\>,\<lambda\>|)>>=<big|int><rsub|-T/2><rsup|T/2><around|\||a<rsub|\<lambda\>><around|(|t|)>|\|><rsup|2><frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t\<to\>1
    </equation>

    For <math|\<mu\>\<neq\>\<lambda\>>,

    <\equation>
      K<rsub|T><rsup|<around|(|\<lambda\>,\<mu\>|)>>=<big|int><rsub|-T/2><rsup|T/2>a<rsub|\<mu\>><around|(|t|)><wide|a<rsub|\<lambda\>><around|(|t|)>|\<bar\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*t>*<frac|sin
      <around|(|T*t/2|)>|\<pi\>*t>*d*t\<to\>0
    </equation>

    Thus the limit recovers <math|d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>>.
  </proof>

  <subsection|The Oscillatory Subclass of Unitarily Time-Changed Stationary
  Processes>

  <\theorem>
    [Subclass: Monotone Time Change] Let <math|m:\<bbb-R\>\<to\>\<bbb-R\>> be
    <math|C<rsup|1>> and strictly increasing. Define

    <\equation>
      Y<around|(|t|)>=<sqrt|m<rprime|'><around|(|t|)>>*<space|0.17em>X<around|(|m<around|(|t|)>|)>
    </equation>

    where

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>
    </equation>

    Then

    <\equation>
      <wide|Y|~><around|(|u|)>=<frac|Y<around|(|m<rsup|-1><around|(|u|)>|)>|<sqrt|m<rprime|'><around|(|m<rsup|-1><around|(|u|)>|)>>>=X<around|(|u|)>
    </equation>

    and

    <\equation>
      d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T/2><rsup|T/2><wide|Y|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<lambda\>*u>*<space|0.17em><frac|sin
      <around|(|T*u/2|)>|\<pi\>*u>*d*u
    </equation>
  </theorem>

  <\proof>
    For <math|u=m<around|(|t|)>>,

    <\equation>
      Y<around|(|m<rsup|-1><around|(|u|)>|)>=<sqrt|m<rprime|'><around|(|m<rsup|-1><around|(|u|)>|)>>*<space|0.17em>X<around|(|u|)>
    </equation>

    Dividing,

    <\equation>
      <frac|Y<around|(|m<rsup|-1><around|(|u|)>|)>|<sqrt|m<rprime|'><around|(|m<rsup|-1><around|(|u|)>|)>>>=X<around|(|u|)>
    </equation>

    Therefore

    <\equation>
      <wide|Y|~><around|(|u|)>=X<around|(|u|)>
    </equation>

    Since <math|X<around|(|u|)>> admits

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-\<Omega\>><rsup|\<Omega\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>
    </equation>

    the inversion integral gives <math|d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>>.
  </proof>

  <subsubsection|Hardy <math|Z> Random Wave Example>

  <\corollary>
    [Hardy <math|Z> Random Wave via Riemann\USiegel <math|\<theta\>>] Let
    <math|X<around|(|t|)>> be the stationary Gaussian random wave with

    <\equation>
      R<around|(|\<tau\>|)>=J<rsub|0><around|(|\<tau\>|)>,<space|2em>S<around|(|\<lambda\>|)>=<frac|1|\<pi\>*<sqrt|1-\<lambda\><rsup|2>>>,<space|1em>\<lambda\>\<in\><around|[|-1,1|]>
    </equation>

    Define

    <\equation>
      \<theta\><around|(|t|)>=\<Im\>*<space|-0.17em><around*|(|log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>|)>-<frac|t|2>*log
      \<pi\>
    </equation>

    This function is <math|C<rsup|1>> and strictly increasing. Define

    <\equation>
      Z<around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then

    <\equation>
      <wide|Z|~><around|(|u|)>=<frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>=X<around|(|u|)>
    </equation>

    and

    <\equation>
      d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T/2><rsup|T/2><wide|Z|~><around|(|u|)>*e<rsup|-i*\<lambda\>*u>*<frac|sin
      <around|(|T*u/2|)>|\<pi\>*u>*d*u
    </equation>
  </corollary>

  <\proof>
    For <math|u=\<theta\><around|(|t|)>>,

    <\equation>
      Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>=<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>*X<around|(|u|)>
    </equation>

    So

    <\equation>
      <frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>=X<around|(|u|)>
    </equation>

    Since

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*u>*d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>
    </equation>

    the inversion integral recovers <math|d*\<Phi\><rsub|\<omega\>><around|(|\<lambda\>|)>>.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.1.1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Stationary
      Bandlimited Spectral Inversion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Inversion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Oscillatory
      Subclass from Monotone Time Change>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Hardy
      <with|mode|<quote|math>|Z> Random Wave Example>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>