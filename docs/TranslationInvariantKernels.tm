<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Translation-Invariant
  Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  If <math|K<around*|(|x,y|)>> is a translation-invariant kernel, it means
  that the kernel depends only on the difference between
  <with|font-family|tt|x> and <with|font-family|tt|y>. Such kernels have a
  strong connection with Fourier analysis:

  <subsubsection|Fourier Transform><label|fourier-transform><label|fourier-transform>

  For translation-invariant kernels, the Fourier transform is pivotal. The
  kernel can be expressed in terms of its Fourier transform. Specifically,
  Mercer's theorem can be related to the frequency domain:

  <\equation>
    K<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<mu\>|\<dot\>><around|(|s|)>*e<rsup|i*s*t>*d*s=<big|int><rsub|-\<infty\>><rsup|\<infty\>>*e<rsup|i*s*t>*d*\<mu\><around*|(|s|)>
  </equation>

  where <math|\<mu\><around|(|s|)>> is a non-negative (spectral)measure and
  <math|\<mu\><around*|(|s|)>> is its spectral density. Often,
  <math|<wide|\<mu\>|\<dot\>><around|(|s|)>> is the Fourier transform of
  <math|K<around|(|t|)>>.

  <subsubsection|2. Eigenfunctions:><label|eigenfunctions><label|eigenfunctions>

  The eigenfunctions of translation-invariant kernels in
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> are complex exponentials
  <math|e<rsup|i*\<omega\>*x>>, linking the kernel to its Fourier
  representation.

  <subsubsection|3. Diagonalization:><label|diagonalization><label|diagonalization>

  The diagonalization of the operator <math|A> associated with a
  translation-invariant kernel is:

  \;

  where <math|<wide|K|^><around|(|\<omega\>|)>> and
  <math|<wide|f|^><around|(|\<omega\>|)>> are the Fourier transforms of
  <math|K<around|(|t|)>> and <math|f<around|(|x|)>> respectively.

  <subsubsection|4. Simplifications:><label|simplifications><label|simplifications>

  Translation-invariance often simplifies computations, especially in
  problems involving convolutions or correlations.

  <subsubsection|Example: Gaussian Kernel><label|example-gaussian-kernel><label|example-gaussian-kernel>

  A classic example of a translation-invariant kernel is the Gaussian kernel:

  \;

  Its Fourier transform is also Gaussian, meaning the action of the
  associated operator in the frequency domain involves multiplying the
  Fourier transform of the function by the Fourier transform of the kernel.
</body>

<\initial>
  <\collection>
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
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|1>>
    <associate|diagonalization|<tuple|3|1>>
    <associate|eigenfunctions|<tuple|2|1>>
    <associate|example-gaussian-kernel|<tuple|5|1>>
    <associate|fourier-transform|<tuple|1|1>>
    <associate|simplifications|<tuple|4|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Fourier Transform
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>2. Eigenfunctions:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|3<space|2spc>3. Diagonalization:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|4<space|2spc>4. Simplifications:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|5<space|2spc>Example: Gaussian Kernel
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>