<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  <section|The Riesz\UFischer Theorem>

  The Riesz\UFischer Theorem, named after mathematicians Frigyes Riesz and
  Ernst Fischer, is a foundational result in the field of functional
  analysis, particularly in the study of Fourier series and <math|L<rsup|2>>
  spaces. This theorem has two main components: one addressing the
  representation of functions through Fourier series, and the other
  establishing the completeness of <math|L<rsup|2>> spaces.

  <subsection|Fourier Series Component>

  The first part of the Riesz\UFischer Theorem relates to Fourier series and
  the representation of functions in <math|L<rsup|2>> spaces.

  <\theorem>
    <strong|Fourier Series Component of Riesz\UFischer Theorem>

    Let <math|<around|{|c<rsub|n>|}><rsub|n=-\<infty\>><rsup|\<infty\>>> be a
    sequence of complex numbers. Suppose that

    <\equation*>
      <big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||c<rsub|n>|\|><rsup|2>
    </equation*>

    is convergent. Then, there exists a function
    <math|f\<in\>L<rsup|2><around|(|<around|[|-\<pi\>,\<pi\>|]>|)>> such that
    the Fourier coefficients of <math|f> are given by <math|c<rsub|n>> for
    each <math|n>. Moreover, if <math|g\<in\>L<rsup|2><around|(|<around|[|-\<pi\>,\<pi\>|]>|)>>
    is another function with the same Fourier coefficients, then <math|f=g>
    almost everywhere.
  </theorem>

  This part of the theorem guarantees that for every square-summable sequence
  of complex numbers, there is a corresponding square-integrable function on
  the interval <math|<around|[|-\<pi\>,\<pi\>|]>>. This function's Fourier
  series will have the given sequence as its coefficients.

  <subsection|Completeness of <math|L<rsup|2>> Spaces>

  The second part of the theorem is concerned with the completeness of
  <math|L<rsup|2>> spaces, a fundamental characteristic of Hilbert spaces.

  <\theorem>
    <strong|Completeness of <math|L<rsup|2>> Spaces>

    The space <math|L<rsup|2><around|(|X,\<mu\>|)>>, where <math|X> is a
    measure space and <math|\<mu\>> is a measure on <math|X>, is complete.
    That is, every Cauchy sequence in <math|L<rsup|2><around|(|X,\<mu\>|)>>
    converges in <math|L<rsup|2><around|(|X,\<mu\>|)>> to a limit that is
    also in <math|L<rsup|2><around|(|X,\<mu\>|)>>.
  </theorem>

  This theorem ensures that <math|L<rsup|2>> spaces, as instances of Hilbert
  spaces, have the property of completeness, meaning that they contain all
  the limits of their Cauchy sequences. This is a critical aspect in various
  mathematical analyses, particularly in the study of functional analysis and
  its applications.

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
    <associate|auto-1|<tuple|1|1|Hypergeometric3F1Recursion.tm>>
    <associate|auto-2|<tuple|1.1|1|Hypergeometric3F1Recursion.tm>>
    <associate|auto-3|<tuple|1.2|1|Hypergeometric3F1Recursion.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Riesz\UFischer Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Fourier Series Component
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Completeness of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|L<rsup|2>>>
      Spaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>