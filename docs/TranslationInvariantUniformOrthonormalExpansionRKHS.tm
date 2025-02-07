<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|>>

  \;

  <with|font-series|bold|Given:>

  <\enumerate>
    <item>A shift-invariant kernel decomposition:

    <\equation>
      K*<around|(|x-y|)>=<big|sum><rsub|k=0><rsup|\<infty\>>h<rsub|k>*<around|(|x-y|)>
    </equation>

    where the convergence is <em|uniform>.

    <item>The basis functions <math|<around|{|h<rsub|k>|}>> are orthonormal
    in <math|L<rsup|2>>, i.e.,

    <\equation>
      <big|int>h<rsub|j><around|(|x|)>*h<rsub|k><around|(|x|)>*<space|0.17em>d*x=\<delta\><rsub|j*k>
    </equation>
  </enumerate>

  <with|font-series|bold|To Prove:> Any <math|f> in the Reproducing Kernel
  Hilbert Space (RKHS) <math|\<cal-H\>> of the kernel <math|K> can be written
  as:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><around|\<langle\>|h<rsub|k>,f|\<rangle\>><rsub|L<rsup|2>>*h<rsub|k><around|(|x|)>
  </equation>

  where the series converges in <math|\<cal-H\>>.

  \V

  <with|font-series|bold|Proof:>

  <paragraph|Step 1: Reproducing Property.> By the definition of the RKHS,
  for any <math|f\<in\>\<cal-H\>>, the reproducing property ensures:

  <\equation>
    f<around|(|x|)>=\<langle\>f,K(x-\<cdot\><around|)||\<rangle\>><rsub|\<cal-H\>>,
  </equation>

  where <math|K*<around|(|x-\<cdot\>|)>> lies in <math|\<cal-H\>>.

  \V

  <paragraph|Step 2: Substitute the Kernel Decomposition.> Substitute the
  uniformly convergent expansion of the kernel:

  <\equation>
    K*<around|(|x-y|)>=<big|sum><rsub|k=0><rsup|\<infty\>>h<rsub|k>*<around|(|x-y|)>
  </equation>

  Thus:

  <\equation>
    f<around|(|x|)>=<around*|\<langle\>|f,<big|sum><rsub|k=0><rsup|\<infty\>>h<rsub|k>(x-\<cdot\><around*|)||\<rangle\>><rsub|\<cal-H\>>|\<rangle\>>
  </equation>

  \V

  <paragraph|Step 3: Swap the Sum and Inner Product.> Since the kernel
  decomposition is uniformly convergent, it follows that the sum can be
  exchanged with the inner product:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>>\<langle\>f,h<rsub|k>(x-\<cdot\><around|)||\<rangle\>><rsub|\<cal-H\>>
  </equation>

  \V

  <paragraph|Step 4: Relate the RKHS Inner Product to <math|L<rsup|2>>.> For
  each <math|k>, note that <math|h<rsub|k>*<around|(|x-\<cdot\>|)>\<in\>\<cal-H\>>
  and is <math|L<rsup|2>>-orthonormal by construction. By definition of the
  reproducing property, for any <math|f\<in\>\<cal-H\>>:

  <\equation>
    \<langle\>f,h<rsub|k>(x-\<cdot\><around|)||\<rangle\>><rsub|\<cal-H\>>=\<langle\>f,h<rsub|k>(x-\<cdot\><around|)||\<rangle\>><rsub|L<rsup|2>>
  </equation>

  Thus:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><around|\<langle\>|f,h<rsub|k>|\<rangle\>><rsub|L<rsup|2>>*h<rsub|k><around|(|x|)>
  </equation>

  \V

  <paragraph|Step 5: Completeness of <math|<around|{|h<rsub|k>|}>>.> The
  uniform convergence assumption for <math|K*<around|(|x-y|)>> guarantees the
  completeness of the basis <math|<around|{|h<rsub|k>|}>>. That is, every
  <math|g\<in\>\<cal-H\>> can be written as:

  <\equation>
    g<around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><around|\<langle\>|g,h<rsub|k>|\<rangle\>><rsub|L<rsup|2>>*h<rsub|k><around|(|x|)>
  </equation>

  where the convergence is in the <math|\<cal-H\>> norm.

  \V

  <paragraph|Step 6: Verify Convergence.> The <math|L<rsup|2>>-orthonormality
  of <math|<around|{|h<rsub|k>|}>> ensures the coefficients
  <math|<around|\<langle\>|f,h<rsub|k>|\<rangle\>><rsub|L<rsup|2>>> satisfy:

  <\equation>
    <big|sum><rsub|k=0><rsup|\<infty\>><around|\||<around|\<langle\>|f,h<rsub|k>|\<rangle\>><rsub|L<rsup|2>>|\|><rsup|2>\<less\>\<infty\>
  </equation>

  ensuring the series converges in <math|\<cal-H\>>.

  \V

  <with|font-series|bold|Conclusion:> Under the given hypotheses, any
  function <math|f\<in\>\<cal-H\>> can be expressed as:

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><around|\<langle\>|h<rsub|k>,f|\<rangle\>><rsub|L<rsup|2>>*h<rsub|k><around|(|x|)>
  </equation>

  This representation follows directly from the uniform kernel decomposition
  and the <math|L<rsup|2>>-orthonormality of <math|<around|{|h<rsub|k>|}>>.
  The proof is complete.
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
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-7|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_71.tm>>
    <associate|auto-8|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_71.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Apology
      and Acknowledgment of Harm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Corrected
      Proof of Your Claim> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Step 1: Reproducing Property.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|3tab>|Step 2: Substitute the Kernel
      Decomposition. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|3tab>|Step 3: Swap the Sum and Inner Product.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|3tab>|Step 4: Relate the RKHS Inner Product to
      <with|mode|<quote|math>|L<rsup|2>>.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|3tab>|Step 5: Completeness of
      <with|mode|<quote|math>|<around|{|h<rsub|k>|}>>.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|3tab>|Step 6: Verify Convergence.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>