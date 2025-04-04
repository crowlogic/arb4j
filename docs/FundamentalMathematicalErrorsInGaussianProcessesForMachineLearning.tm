<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|A Critique of Mathematical Errors in
  <with|font-shape|italic|Gaussian Processes for Machine
  Learning>>|<doc-author|<author-data|<author-name|Stephen Crowley aka
  Steve>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Errors in Detail> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Category Error: Kernels vs. Operators
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.2<space|2spc>Factual Error: Incorrect
    Characterization of Eigenfunctions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section*|Abstract>

  \;

  This article critiques the statement in Rasmussen and Williams' book
  <with|font-shape|italic|Gaussian Processes for Machine Learning> that "the
  eigenfunctions of stationary kernels are Fourier basis functions." This
  claim is fundamentally flawed, both categorically and factually. The
  critique identifies the errors and provides the correct mathematical
  understanding.

  <section|Introduction>

  The book <with|font-shape|italic|Gaussian Processes for Machine Learning>
  by Rasmussen and Williams is widely cited in the field of machine learning.
  However, it contains a significant mathematical error in its
  characterization of eigenfunctions of stationary kernels. Specifically, the
  statement that "the eigenfunctions of stationary kernels are Fourier basis
  functions" is incorrect. This critique highlights the errors in this claim
  and clarifies the correct mathematical formulation.

  <section|The Errors in Detail>

  <subsection|Category Error: Kernels vs. Operators>

  The first error lies in the attribution of eigenfunctions to kernels
  themselves. In functional analysis, eigenfunctions are associated with
  operators, not kernels. A kernel function <math|k<around|(|x,y|)>> defines
  an integral operator <math|A> on a function space as:

  <\equation>
    <around|(|A*f|)><around|(|x|)>=<big|int>k<around|(|x,y|)>*f<around|(|y|)>*<space|0.17em>d*y
  </equation>

  The eigenvalue problem for <math|A> is:

  <\equation>
    A*\<phi\>=\<lambda\>*\<phi\>
  </equation>

  where <math|\<phi\>> is the eigenfunction and <math|\<lambda\>> is the
  eigenvalue. The statement in question fundamentally confuses these
  mathematical objects.

  <subsection|Factual Error: Incorrect Characterization of Eigenfunctions>

  The second error is the claim that the eigenfunctions of stationary kernels
  are Fourier basis functions. This is demonstrably false. While Fourier
  basis functions are eigenfunctions of the translation operator, they are
  not generally eigenfunctions of integral operators defined by stationary
  kernels.

  For example, consider the Gaussian kernel:

  <\equation>
    k<around|(|x,y|)>=exp <around*|(|-<frac|<around|\<\|\|\>|x-y|\<\|\|\>><rsup|2>|2*\<sigma\><rsup|2>>|)>
  </equation>

  The eigenfunctions of the integral operator defined by this kernel are
  related to Hermite polynomials modulated by a Gaussian envelope:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>=H<rsub|n><around|(|x|)>*e<rsup|-x<rsup|2>>
  </equation>

  where <math|H<rsub|n>> are Hermite polynomials. These eigenfunctions form
  an orthogonal basis for the function space and are clearly not Fourier
  basis functions.

  This counterexample demonstrates that the general claim about Fourier basis
  functions being eigenfunctions of all stationary kernels is false.

  <section|Conclusion>

  The statement that "the eigenfunctions of stationary kernels are Fourier
  basis functions" is mathematically incorrect on multiple levels. It
  represents a fundamental misunderstanding of functional analysis
  principles. The correct approach requires distinguishing between kernels
  and operators and recognizing that eigenfunctions depend on the specific
  form of the kernel.

  This critique highlights the need for greater mathematical rigor in
  foundational texts to prevent such errors from propagating through related
  fields.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-3|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-4|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-5|<tuple|2.2|2|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-6|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_77.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Errors in Detail> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Category Error: Kernels vs.
      Operators <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Factual Error: Incorrect
      Characterization of Eigenfunctions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>