<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Mittag-Leffler Functions, Fourier Transforms, and
  Stochastic Processes>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Mittag-Leffler
    Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>One-Parameter Mittag-Leffler Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Two-Parameter Mittag-Leffler Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Fourier
    Transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>One-Parameter Mittag-Leffler Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.2<space|2spc>Two-Parameter Mittag-Leffler Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Special
    Cases and Connections> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Cauchy Distribution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Gaussian Distribution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Orthogonal
    Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Implications
    for Stochastic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Mittag-Leffler Functions>

  <subsection|One-Parameter Mittag-Leffler Function>

  The one-parameter Mittag-Leffler function
  <math|E<rsub|\<alpha\>><around|(|z|)>> is defined as:

  <\equation>
    E<rsub|\<alpha\>><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|z<rsup|k>|\<Gamma\>*<around|(|\<alpha\>*k+1|)>>
  </equation>

  where <math|\<alpha\>\<gtr\>0> and <math|z> is a complex number.

  <subsection|Two-Parameter Mittag-Leffler Function>

  The two-parameter Mittag-Leffler function
  <math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>> is defined as:

  <\equation>
    E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|z<rsup|k>|\<Gamma\>*<around|(|\<alpha\>*k+\<beta\>|)>>
  </equation>

  where <math|\<alpha\>\<gtr\>0>, <math|\<beta\>> is a complex number, and
  <math|z> is a complex number.

  <section|Fourier Transforms>

  <subsection|One-Parameter Mittag-Leffler Function>

  For <math|0\<less\>\<alpha\>\<leq\>2>, the Fourier transform of
  <math|E<rsub|\<alpha\>>*<around|(|-t<rsup|\<alpha\>>|)>> is:

  <\equation>
    \<cal-F\>*<around|{|E<rsub|\<alpha\>>*<around|(|-t<rsup|\<alpha\>>|)>|}><around|(|\<omega\>|)>=<frac|1|1+<around|\||\<omega\>|\|><rsup|\<alpha\>>*e<rsup|i*\<pi\>*\<alpha\>/2<text|sgn><around|(|\<omega\>|)>>>
  </equation>

  <subsection|Two-Parameter Mittag-Leffler Function>

  For <math|0\<less\>\<alpha\>\<leq\>2> and <math|\<beta\>> real, the Fourier
  transform of <math|t<rsup|\<beta\>-1>*E<rsub|\<alpha\>,\<beta\>>*<around|(|-t<rsup|\<alpha\>>|)>>
  is:

  <\equation>
    \<cal-F\>*<around|{|t<rsup|\<beta\>-1>*E<rsub|\<alpha\>,\<beta\>>*<around|(|-t<rsup|\<alpha\>>|)>|}><around|(|\<omega\>|)>=<frac|1|<around|\||\<omega\>|\|><rsup|\<alpha\>>>*H<rsub|1,2><rsup|2,1><around*|[|<frac|1|<around|\||\<omega\>|\|><rsup|\<alpha\>>><mid|\|><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|1-\<beta\>,\<alpha\>|)>>>|<row|<cell|<around|(|0,1|)>,<around|(|1-\<beta\>,1|)>>>>>>|]>
  </equation>

  where <math|H<rsub|1,2><rsup|2,1>> is the H-function.

  <section|Special Cases and Connections>

  <subsection|Cauchy Distribution>

  When <math|\<alpha\>=1> in the one-parameter case, we get the Cauchy
  distribution:

  <\equation>
    \<cal-F\>*<around|{|E<rsub|1>*<around|(|-t|)>|}><around|(|\<omega\>|)>=<frac|1|1+<around|\||\<omega\>|\|>>
  </equation>

  This is related to the Ornstein-Uhlenbeck process.

  <subsection|Gaussian Distribution>

  When <math|\<alpha\>=2> in the one-parameter case, we get a Gaussian
  distribution:

  <\equation>
    \<cal-F\>*<around|{|E<rsub|2>*<around|(|-t<rsup|2>|)>|}><around|(|\<omega\>|)>=<frac|1|1+\<omega\><rsup|2>>
  </equation>

  This is related to standard Brownian motion.

  <section|Orthogonal Polynomials>

  For the one-parameter case, we can define a weight function:

  <\equation>
    w<around|(|\<omega\>|)>=<frac|1|1+<around|\||\<omega\>|\|><rsup|\<alpha\>>>
  </equation>

  And an inner product:

  <\equation>
    <around|(|f,g|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\>|)>*g<around|(|\<omega\>|)>*w<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  Orthogonal polynomials can be constructed using the Gram-Schmidt process on
  the monomials <math|1,\<omega\>,\<omega\><rsup|2>,\<omega\><rsup|3>>,...

  <section|Implications for Stochastic Processes>

  The Mittag-Leffler function and its Fourier transform provide a framework
  for modeling a spectrum of processes:

  <\itemize>
    <item><math|\<alpha\>=1>: Ornstein-Uhlenbeck-like processes

    <item><math|1\<less\>\<alpha\>\<less\>2>: Anomalous diffusion

    <item><math|\<alpha\>=2>: Brownian motion

    <item><math|0\<less\>\<alpha\>\<less\>1>: Processes with long-range
    dependence
  </itemize>

  This framework is particularly useful in fractional calculus and for
  modeling phenomena that exhibit behavior intermediate between classical
  diffusion and pure randomness.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-10|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-11|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-4|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-5|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-6|<tuple|2.2|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-7|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-8|<tuple|3.1|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
    <associate|auto-9|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_58.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Mittag-Leffler
      Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>One-Parameter Mittag-Leffler
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Two-Parameter Mittag-Leffler
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Fourier
      Transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>One-Parameter Mittag-Leffler
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Two-Parameter Mittag-Leffler
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Special
      Cases and Connections> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Cauchy Distribution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Gaussian Distribution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Orthogonal
      Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Implications
      for Stochastic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>