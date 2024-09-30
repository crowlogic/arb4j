<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Convolution and Fourier Transform Discussion>

  The convolution of two functions <math|f<around|(|x|)>> and
  <math|g<around|(|x|)>> over the positive domain can be expressed using the
  Fourier transform:

  <\equation>
    <\text>
      <tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<math|<around|(|f\<ast\>g|)><around|(|x|)>>>|<cell|<math|=<big|int><rsub|0><rsup|\<infty\>>f*<around|(|x-t|)>*g<around|(|t|)>*d*t>>>|<row|<cell|>|<cell|<math|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|x-t|)>*g<around|(|t|)>*H<around|(|t|)>*d*t>>>|<row|<cell|>|<cell|<math|=\<cal-F\><rsup|-1>*<around|{|\<cal-F\><around|{|f|}>\<cdot\>\<cal-F\><around|{|g|}>\<cdot\>\<cal-F\><around|{|g|}>|}>>>>>>>
    </text>
  </equation>

  Where:

  <\itemize>
    <item><math|\<ast\>> denotes convolution

    <item><math|\<cal-F\>> denotes the Fourier transform

    <item><math|\<cal-F\><rsup|-1>> denotes the inverse Fourier transform

    <item><math|\<cdot\>> denotes multiplication in the frequency domain

    <item><math|H<around|(|t|)>> is the Heaviside step function, defined as:

    <\equation>
      H<around|(|t|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|for
      >t\<less\>0>>|<row|<cell|1>|<cell|<text|for >t\<geq\>0>>>>>
    </equation>
  </itemize>

  This formulation shows the equivalence between the convolution over the
  positive domain and the convolution over the entire real line with the
  Heaviside step function.

  The Convolution Theorem states that the convolution of two functions in the
  time (or spatial) domain is equivalent to the multiplication of their
  Fourier transforms in the frequency domain, followed by an inverse Fourier
  transform.

  The Fourier transform relationship for this convolution is:

  <\equation>
    <\equation*>
      \<cal-F\>*<around|{|f\<ast\><around|(|g\<cdot\>H|)>|}>=\<cal-F\><around|{|f|}>\<cdot\>\<cal-F\>*<around|{|g\<cdot\>H|}>
    </equation*>
  </equation>

  Additionally, we have:

  <\equation>
    <around|(|f\<ast\><around|(|g\<cdot\>H|)>|)><around|(|x|)>=<around|(|<around|(|g\<cdot\>H|)>\<ast\>f|)><around|(|x|)>
  </equation>

  And for the Fourier transform of a convolution:

  <\equation>
    \<cal-F\>*<around|{|f\<ast\><around|(|g\<cdot\>H|)>|}>=\<cal-F\><around|{|f|}>\<cdot\>\<cal-F\>*<around|{|g\<cdot\>H|}>
  </equation>

  <subsection|Translation-Invariant (Stationary) Gaussian Processes>

  For a stationary Gaussian process, we consider the integral covariance
  operator <math|T> with kernel <math|K>. The eigenfunctions
  <math|\<phi\><rsub|n><around|(|x|)>> of this operator satisfy:

  <\equation>
    <around|(|T*\<phi\><rsub|n>|)><around*|(|y|)>=<big|int><rsub|0><rsup|\<infty\>>K<around*|(|x,y|)>\<phi\><rsub|n><around*|(|x|)>\<mathd\>x=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|y|)>
  </equation>

  where <math|\<lambda\><rsub|n>> are the corresponding eigenvalues.

  We can expand these eigenfunctions in terms of a uniformly convergent
  orthonormal basis <math|<around|{|\<psi\><rsub|k><around|(|x|)>|}>> for
  <math|L<rsup|2><around*|(|0,\<infty\>|)>>:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  The expansion coefficients <math|c<rsub|n,k>> can be expressed as:

  <\equation>
    c<rsub|n,k>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|k><around|(|x|)>*<around|(|T*\<phi\><rsub|n>|)><around|(|x|)>*d*x|\<lambda\><rsub|n>>*
  </equation>

  <subsection|Proof of the Expansion Coefficient Formula>

  Let's prove this formula by substitution and expansion:

  1) Start with the eigenvalue equation:

  <\equation>
    <around|(|K*\<phi\><rsub|n>|)><around|(|x|)>=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|x|)>
  </equation>

  2) Multiply both sides by <math|\<psi\><rsub|k><around|(|x|)>> and
  integrate over the entire domain:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|k><around|(|x|)>*<around|(|K*\<phi\><rsub|n>|)><around|(|x|)>*d*x=\<lambda\><rsub|n>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|k><around|(|x|)>*\<phi\><rsub|n><around|(|x|)>*d*x
  </equation>

  3) The right-hand side integral is the definition of <math|c<rsub|n,k>> due
  to the orthonormality of <math|<around|{|\<psi\><rsub|k><around|(|x|)>|}>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|k><around|(|x|)>*<around|(|K*\<phi\><rsub|n>|)><around|(|x|)>*d*x=\<lambda\><rsub|n>*c<rsub|n,k>
  </equation>

  4) Rearranging this equation gives us the formula for <math|c<rsub|n,k>>:

  <\equation>
    c<rsub|n,k>=<frac|1|\<lambda\><rsub|n>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|k><around|(|x|)>*<around|(|K*\<phi\><rsub|n>|)><around|(|x|)>*d*x
  </equation>

  5) To verify, let's substitute the expansion of
  <math|\<phi\><rsub|n><around|(|x|)>> into the eigenvalue equation:

  <\equation>
    K<around*|(|<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|k><around|(|x|)>|)>=\<lambda\><rsub|n>*<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  6) By linearity of <math|K>:

  <\equation>
    <big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<around|(|K*\<psi\><rsub|k>|)><around|(|x|)>=\<lambda\><rsub|n>*<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  7) Multiply both sides by <math|\<psi\><rsub|j><around|(|x|)>> and
  integrate:

  <\equation>
    <big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j><around|(|x|)>*<around|(|K*\<psi\><rsub|k>|)><around|(|x|)>*d*x=\<lambda\><rsub|n>*c<rsub|n,j>
  </equation>

  8) The left-hand side integral is our formula for <math|c<rsub|n,k>>
  multiplied by <math|\<lambda\><rsub|n>>:

  <\equation>
    <big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<around|(|\<lambda\><rsub|n>*c<rsub|j,k>|)>=\<lambda\><rsub|n>*c<rsub|n,j>
  </equation>

  9) This reduces to an identity, proving that our formula for
  <math|c<rsub|n,k>> satisfies the eigenvalue equation.

  Thus, we have proven that the formula for <math|c<rsub|n,k>> is correct and
  consistent with the eigenvalue equation.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-3|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-4|<tuple|1.2|?|../../.TeXmacs/texts/scratch/no_name_59.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Convolution
      and Fourier Transform Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Translation-Invariant
      (Stationary) Gaussian Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Proof of the Expansion
      Coefficient Formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>