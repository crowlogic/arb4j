<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Understanding The Notion of Weak Derivatives And the
  Dirac Delta Function>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>crow@outsider.trading\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Background: The Step Function>

  Consider the step function, defined as:

  <\equation>
    u<around|(|x|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|if
    >x\<less\>0>>|<row|<cell|1>|<cell|<text|if >x\<geq\>0>>>>>
  </equation>

  Clearly, this function isn't differentiable at <math|x=0>. But what if we
  could find its "derivative" in some generalized sense?

  <section|Test Functions: What are they?>

  Before diving into weak derivatives, we need to understand <em|test
  functions>.

  <subsection|Formal Definition:>

  A test function, often denoted by <math|\<phi\>>, belongs to the space
  <math|C<rsub|c><rsup|\<infty\>><around|(|\<Omega\>|)>>, which is also known
  as the "space of infinitely differentiable functions with compact support."
  This space consists of functions that are:

  <\enumerate>
    <item>Infinitely differentiable (smooth).

    <item>Have compact support. This means the function and all its
    derivatives vanish outside some finite interval.
  </enumerate>

  <subsection|Intuitive Explanation:>

  Test functions, also known as "smooth functions with compact support,"
  serve as "probes" or "detectors." They're smooth, well-behaved functions
  that we use to extract information from other functions that might not be
  as well-behaved.

  <section|Weak Derivative: A New Perspective>

  For the weak derivative, we want to find a function <math|v<around|(|x|)>>
  such that for every test function <math|\<phi\><around|(|x|)>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>u<around|(|x|)>*\<phi\><rprime|'><around|(|x|)>*<space|0.17em>d*x=-<big|int><rsub|-\<infty\>><rsup|\<infty\>>v<around|(|x|)>*\<phi\><around|(|x|)>*<space|0.17em>d*x
  </equation>

  To satisfy this equation for all such <math|\<phi\>>, the only possible
  <math|v> is the <em|Dirac delta function>, <math|\<delta\><around|(|x|)>>,
  at <math|x=0>. It's essential to note that the Dirac delta function is not
  a function in the traditional sense but rather a distribution, which
  explains its unique properties.

  <section|Unraveling the Mystery of the Dirac Delta>

  The <em|Dirac delta function> is a unique function. It's characterized by
  two main properties:

  <\enumerate>
    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\><around|(|x|)>*<space|0.17em>d*x=1>

    <item>For any test function <math|\<phi\>>,

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\><around|(|x|)>*\<phi\><around|(|x|)>*<space|0.17em>d*x=\<phi\><around|(|0|)>
    </equation>
  </enumerate>

  The second property indicates the localizing nature of the delta function.
  That is, when you integrate the Dirac delta function against any test
  function over the entire real line, you get the value of the test function
  at the location of the delta. In our context, the Dirac delta function
  captures the "jump" in the step function, acting as its weak derivative.

  <section|Conclusion>

  The notions of weak derivatives, test functions, and the Dirac delta
  function provide a powerful framework for understanding non-differentiable
  functions and offer tools for addressing complex problems in mathematics
  and physics. Weak derivatives play a pivotal role in the theory of partial
  differential equations, while the Dirac delta function finds its
  applications in quantum mechanics and signal processing. As you delve
  deeper into programming, mathematics, or physics, these ideas will only
  become more vital.

  For those eager to explore further, diving into topics like Sobolev spaces
  and the theory of distributions can provide deeper insights into these
  fascinating concepts.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|2.2|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-6|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-7|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background:
      The Step Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Test
      Functions: What are they?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Formal Definition:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Intuitive Explanation:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Weak
      Derivative: A New Perspective> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Unraveling
      the Mystery of the Dirac Delta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>