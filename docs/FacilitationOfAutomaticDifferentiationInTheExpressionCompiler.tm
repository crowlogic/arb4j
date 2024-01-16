<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Facilitating Automatic Differentiation in Expression
  Compilation>|<doc-author|<author-data|<author-name|Stephen A. Crowley
  \<less\>crow@outsider.trading\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \ <section|Introduction>

  In the field of computational mathematics, the efficiency and accuracy of
  numerical methods are paramount. The expression compiler described in this
  article exemplifies an innovative approach to expression evaluation,
  particularly in the context of automatic differentiation (AD). This
  compiler, part of the <with|font-family|tt|arb.expressions> package, not
  only evaluates mathematical expressions but also dynamically compiles them
  into Java bytecodes, significantly enhancing performance.

  <section|Storing Intermediate Variables>

  A key feature of this compiler is its ability to store every intermediate
  variable during the evaluation of an expression. This approach proves
  beneficial for several reasons:

  <\itemize>
    <item>It facilitates memoization, allowing for efficient reuse of
    previously computed values.

    <item>It aligns well with the principles of forward mode automatic
    differentiation, where the computation of derivatives is interwoven with
    the function evaluation.

    <item>By storing both values and derivatives of intermediate variables,
    it simplifies the implementation of derivative computation.
  </itemize>

  <section|Advantages in Automatic Differentiation>

  Automatic differentiation, particularly in forward mode, benefits greatly
  from this method of storing intermediate variables:

  <subsection|Efficiency in Computation>

  Storing intermediate variables minimizes redundant calculations, thereby
  enhancing computational efficiency. This is particularly beneficial in AD,
  where both the function value and its derivative are computed
  simultaneously.

  <subsection|Simplification of Derivative Logic>

  The explicit tracking of each intermediate step simplifies the
  implementation of the chain rule in derivative computations. This makes the
  process more intuitive and less prone to errors.

  <subsection|Memoization Opportunities>

  For complex expressions with repeated sub-expressions, memoization becomes
  feasible. This approach stores and reuses the computed values and
  derivatives of these sub-expressions, further improving efficiency.

  <subsection|Debugging and Validation>

  Having intermediate variables explicitly stored aids in debugging and
  validating the function evaluation and its derivative computation. It
  allows for a clear inspection of intermediate states, ensuring accuracy and
  reliability.

  <section|Conclusion>

  The expression compiler, with its capability to store every intermediate
  variable, proves to be a robust tool for implementing forward mode
  automatic differentiation. This approach not only enhances computational
  efficiency but also ensures accuracy and eases the implementation of
  complex numerical methods.
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
    <associate|auto-4|<tuple|3.1|1>>
    <associate|auto-5|<tuple|3.2|2>>
    <associate|auto-6|<tuple|3.3|2>>
    <associate|auto-7|<tuple|3.4|2>>
    <associate|auto-8|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Storing
      Intermediate Variables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Advantages
      in Automatic Differentiation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Efficiency in Computation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Simplification of Derivative
      Logic <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Memoization Opportunities
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Debugging and Validation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>