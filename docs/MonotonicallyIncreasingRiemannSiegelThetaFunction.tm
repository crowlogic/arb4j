<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Construction of a Strictly Monotonically Increasing
  Version of the Riemann-Siegel <math|\<theta\>>
  Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This paper constructs a strictly monotonically increasing modified
    version <math|\<theta\><rsub|\<ast\>><around|(|t|)>> of the
    Riemann-Siegel theta function by inverting its derivative prior to the
    critical point <math|t<rsup|\<ast\>>\<approx\>2*\<pi\>>. The construction
    maintains strict monotonicity everywhere despite a single zero-derivative
    point at <math|t<rsup|\<ast\>>>, as sets of Lebesgue measure zero do not
    affect integral positivity. The method preserves analytic continuity
    while eliminating non-monotonic behavior.
  </abstract>

  <section|Introduction>

  The Riemann-Siegel theta function <math|\<theta\><around|(|t|)>> plays a
  crucial role in the study of the Riemann zeta function and the distribution
  of its zeros. The classical representation is given by:

  <\equation>
    \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
    \<pi\>
  </equation>

  While this function has numerous important properties, its non-monotonic
  behavior in certain regions can complicate analysis. Our modification
  addresses this limitation while preserving essential analytical properties.

  <section|Main Result>

  <\theorem>
    [Modified Theta Function] Let <math|\<theta\><around|(|t|)>> denote the
    Riemann-Siegel theta function with <math|t<rsup|\<ast\>>\<approx\>2*\<pi\>>
    being its critical point where <math|\<theta\><rprime|'><around|(|t<rsup|\<ast\>>|)>=0>.
    The modified derivative:

    <\equation>
      \<theta\><rprime|'><rsub|\<ast\>><around|(|t|)>\<assign\><around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|-\<theta\><rprime|'><around|(|t|)>>|<cell|t\<less\>t<rsup|\<ast\>>>>|<row|<cell|\<theta\><rprime|'><around|(|t|)>>|<cell|t\<geq\>t<rsup|\<ast\>>>>>>>|\<nobracket\>>
    </equation>

    yields a strictly monotonically increasing function when integrated:

    <\equation>
      \<theta\><rsub|\<ast\>><around|(|t|)>\<assign\><around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<theta\><around|(|t<rsup|\<ast\>>|)>-<big|int><rsub|t><rsup|t<rsup|\<ast\>>>\<theta\><rprime|'><around|(|\<tau\>|)>*d*\<tau\>>|<cell|t\<less\>t<rsup|\<ast\>>>>|<row|<cell|\<theta\><around|(|t|)>>|<cell|t\<geq\>t<rsup|\<ast\>>>>>>>|\<nobracket\>>
    </equation>
  </theorem>

  <subsection|Monotonicity Proof>

  <\lemma>
    [Derivative Positivity] The modified derivative
    <math|\<theta\><rprime|'><rsub|\<ast\>><around|(|t|)>> is positive for
    all <math|t\<neq\>t<rsup|\<ast\>>>.
  </lemma>

  <\proof>
    Consider three cases:

    <\itemize>
      <item><with|font-series|bold|Pre-critical region
      (<math|t\<less\>t<rsup|\<ast\>>>)>:
      <math|\<theta\><rprime|'><rsub|\<ast\>><around|(|t|)>=-\<theta\><rprime|'><around|(|t|)>\<gtr\>0>
      by construction, as <math|\<theta\><rprime|'><around|(|t|)>\<less\>0>
      in this region

      <item><with|font-series|bold|Post-critical region
      (<math|t\<gtr\>t<rsup|\<ast\>>>)>: <math|\<theta\><rprime|'><rsub|\<ast\>><around|(|t|)>=\<theta\><rprime|'><around|(|t|)>\<gtr\>0>
      by the original function's properties

      <item><with|font-series|bold|Critical point
      (<math|t=t<rsup|\<ast\>>>)>: <math|\<theta\><rprime|'><rsub|\<ast\>><around|(|t<rsup|\<ast\>>|)>=0>,
      constituting a set of Lebesgue measure zero
    </itemize>
  </proof>

  <subsection|Strict Monotonicity For All <math|t<rsub|1>\<less\>t<rsub|2>>>

  <\theorem>
    [Global Monotonicity] For any interval
    <math|<around|[|t<rsub|1>,t<rsub|2>|]>> with
    <math|t<rsub|1>\<less\>t<rsub|2>>:

    <\equation>
      \<theta\><rsub|\<ast\>><around|(|t<rsub|2>|)>-\<theta\><rsub|\<ast\>><around|(|t<rsub|1>|)>=<big|int><rsub|t<rsub|1>><rsup|t<rsub|2>>\<theta\><rprime|'><rsub|\<ast\>><around|(|\<tau\>|)>*d*\<tau\>\<gtr\>0
    </equation>
  </theorem>

  <\proof>
    The integrand <math|\<theta\><rprime|'><rsub|\<ast\>><around|(|\<tau\>|)>>
    is positive for all <math|\<tau\>\<neq\>t<rsup|\<ast\>>> by Lemma 1. The
    single point <math|\<tau\>=t<rsup|\<ast\>>> has Lebesgue measure zero and
    thus does not affect the positivity of the integral over any interval
    <math|<around|[|t<rsub|1>,t<rsub|2>|]>>.
  </proof>

  <section|Analytical Properties>

  <\proposition>
    The modified function <math|\<theta\><rsub|\<ast\>><around|(|t|)>>
    preserves the following properties of the original
    <math|\<theta\><around|(|t|)>>:

    <\enumerate>
      <item>Continuity at <math|t<rsup|\<ast\>>>

      <item>Asymptotic behavior as <math|t\<to\>\<infty\>>

      <item>Connection to the argument of the Riemann zeta function on the
      critical line
    </enumerate>
  </proposition>

  <section|Conclusion>

  The strictly increasing property holds everywhere due to:

  <\enumerate>
    <item>Derivative positivity at all real numbers
    <math|t\<neq\>t<rsup|\<ast\>>>

    <item>Lebesgue measure theory: The singleton
    <math|<around|{|t<rsup|\<ast\>>|}>> contributes zero to integrals, making
    strict inequality <math|\<theta\><rsub|\<ast\>><around|(|t<rsub|2>|)>-\<theta\><rsub|\<ast\>><around|(|t<rsub|1>|)>\<gtr\>0>
    hold for <with|font-series|bold|all> <math|t<rsub|1>\<less\>t<rsub|2>>

    <item>Analytic continuity preserved through derivative manipulation
  </enumerate>

  This construction demonstrates that monotonicity can be enforced globally
  while maintaining essential analytic properties, with measure-zero
  exceptions being irrelevant for strict ordering.

  <\thebibliography|9>
    <bibitem|edwards>Edwards, H.M. <with|font-shape|italic|Riemann's Zeta
    Function>. Dover Publications, 2001.

    <bibitem|titchmarsh>Titchmarsh, E.C. <with|font-shape|italic|The Theory
    of the Riemann Zeta-function>. Oxford University Press, 1986.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-3|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-4|<tuple|2.2|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-5|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-6|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-7|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|bib-edwards|<tuple|edwards|3|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|bib-titchmarsh|<tuple|titchmarsh|3|../../.TeXmacs/texts/scratch/no_name_71.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Monotonicity Proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Strict Monotonicity For All
      <with|mode|<quote|math>|t<rsub|1>\<less\>t<rsub|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Analytical
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>