<TeXmacs|2.1.1>

<style|generic>

<\body>
  <documentclass|article> <usepackage*|utf8|inputenc> <usepackage|amsmath,
  amssymb, amsthm>

  <title|Understanding Open and Closed Sets in Topology> <author|><date|>

  <maketitle><section|Introduction>

  Topology, a fundamental branch of mathematics, deals with the concepts of
  space, continuity, and proximity. Central to these are the notions of open
  and closed sets, which provide a framework for understanding various
  topological properties. This article aims to rigorously and intuitively
  describe these concepts using set-theoretic and measure-theoretic notation.

  <section|Open Sets>

  <subsection|Definition>

  Let <math|X> be a topological space. A subset <math|U\<subseteq\>X> is said
  to be <with|font-shape|italic|open> if for every point <math|x\<in\>U>,
  there exists an <math|\<epsilon\>\<gtr\>0> such that the
  <math|\<epsilon\>>-neighborhood of <math|x> is entirely contained within
  <math|U>. Formally,

  <\equation*>
    U<text|is open>\<Longleftrightarrow\>\<forall\>x\<in\>U,\<exists\>\<epsilon\>\<gtr\>0:B<around|(|x,\<epsilon\>|)>\<subseteq\>U
  </equation*>

  where <math|B<around|(|x,\<epsilon\>|)>> denotes the open ball (or
  neighborhood) centered at <math|x> with radius <math|\<epsilon\>>.

  <subsection|Intuition>

  The concept of an open set can be intuitively understood as a set that does
  not contain its boundary. In the real line <math|\<bbb-R\>>, for instance,
  an interval like <math|<around|(|a,b|)>> is open because it includes
  neither of its end points <math|a> and <math|b>. Each point in
  <math|<around|(|a,b|)>> has some "wiggle room" within the set, making it
  open.

  <section|Closed Sets>

  <subsection|Definition>

  In a topological space <math|X>, a set <math|C> is
  <with|font-shape|italic|closed> if its complement <math|X\<setminus\>C> is
  open. Equivalently, <math|C> is closed if it contains all its limit points.
  This means, if a sequence <math|<around|(|x<rsub|n>|)>> in <math|C>
  converges to a point <math|x>, then <math|x> must be in <math|C>.

  <subsection|Intuition>

  Closed sets can be seen as sets that include their boundary. Using the real
  number line as an example again, the interval <math|<around|[|a,b|]>> is
  closed because it includes the end points <math|a> and <math|b>. If a
  sequence of points in <math|<around|[|a,b|]>> approaches an end point, that
  end point is also within the set.

  <section|Conclusion>

  Understanding open and closed sets is crucial in topology and related
  fields, as they form the building blocks for defining continuity,
  convergence, and other topological properties. While these concepts may
  initially seem abstract, they provide a versatile and powerful framework
  for mathematical analysis in various contexts.
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
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|1>>
    <associate|auto-5|<tuple|3|1>>
    <associate|auto-6|<tuple|3.1|1>>
    <associate|auto-7|<tuple|3.2|2>>
    <associate|auto-8|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Open
      Sets> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Intuition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Closed
      Sets> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Intuition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>