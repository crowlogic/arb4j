<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Sketch Finite and Full Rank Kernel Analysis for
  Translation-Invariant Kernels with Proofs>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Finite
    Rank Kernels and Their Eigenfunctions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Finite
    Rank Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Eigenvalue
    Problem for Finite Rank Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Relationship
    to Full Rank Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Convergence
    Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Computational
    Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Proofs>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|7.1<space|2spc>Rank of Finite Kernels
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|7.2<space|2spc>Number of Non-zero Eigenvalues
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|7.3<space|2spc>Exactness of Eigenfunctions for
    <with|mode|math|K<rsub|N>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|7.4<space|2spc>Convergence to Full-Rank Kernel
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|7.5<space|2spc>Approximation of Full-Rank
    Eigenfunctions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>
  </table-of-contents>

  <section|Finite Rank Kernels and Their Eigenfunctions>

  Given:

  <\itemize>
    <item>The kernel <math|K<around|(|s,t|)>> is translation-invariant, i.e.,
    <math|K<around|(|s,t|)>=K*<around|(|t-s|)>>

    <item>We have a basis <math|<around|{|\<psi\><rsub|n>*<around|(|t-s|)>|}><rsub|n=1><rsup|\<infty\>>>
    that uniformly converges to the kernel:

    <\equation*>
      K*<around|(|t-s|)>=lim<rsub|N\<to\>\<infty\>>
      <big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>
    </equation*>
  </itemize>

  <section|Finite Rank Kernels>

  For each finite <math|N>, we have a finite-rank kernel:

  <\equation*>
    K<rsub|N><around|(|s,t|)>=<big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>
  </equation*>

  Key properties:

  <\enumerate>
    <item>The rank of <math|K<rsub|N>> is exactly <math|N>.

    <item><math|K<rsub|N>> has exactly <math|N> non-zero eigenvalues and
    corresponding eigenfunctions.

    <item>These eigenfunctions are exact for <math|K<rsub|N>>, not
    approximations within <math|K<rsub|N>>.
  </enumerate>

  <section|Eigenvalue Problem for Finite Rank Kernels>

  For each <math|K<rsub|N>>, we solve:

  <\equation*>
    A<rsub|N><math-bf|C><rsub|N>=\<lambda\><rsub|N><math-bf|C><rsub|N>
  </equation*>

  where:

  <\itemize>
    <item><math|A<rsub|N>=<around|[|A<rsub|i*j>|]><rsub|i,j=1><rsup|N>> with
    <math|A<rsub|i*j>=<big|int>\<psi\><rsub|i>*<around|(|t-s|)>*\<psi\><rsub|j><around|(|t|)>*d*t>

    <item><math|<math-bf|C><rsub|N>=<around|[|c<rsub|1*k>,c<rsub|2*k>,...,c<rsub|N*k>|]><rsup|T>>
    is the <math|k>-th eigenvector

    <item><math|\<lambda\><rsub|N>> is the corresponding eigenvalue
  </itemize>

  This yields exactly <math|N> eigenvalue-eigenfunction pairs
  <math|<around|(|\<lambda\><rsub|k><rsup|<around|(|N|)>>,\<phi\><rsub|k><rsup|<around|(|N|)>>|)>>,
  where:

  <\equation*>
    \<phi\><rsub|k><rsup|<around|(|N|)>><around|(|s|)>=<big|sum><rsub|n=1><rsup|N>c<rsub|n*k><rsup|<around|(|N|)>>*\<psi\><rsub|n><around|(|s|)>
  </equation*>

  These are exact eigenfunctions for <math|K<rsub|N>>, not approximations
  within <math|K<rsub|N>>.

  <section|Relationship to Full Rank Kernel>

  As <math|N\<to\>\<infty\>>, we approach the full-rank kernel:

  <\equation*>
    lim<rsub|N\<to\>\<infty\>> K<rsub|N><around|(|s,t|)>=K<around|(|s,t|)>
  </equation*>

  Important observations:

  <\enumerate>
    <item>The eigenfunctions <math|\<phi\><rsub|k><rsup|<around|(|N|)>>> of
    <math|K<rsub|N>> are only approximate eigenfunctions of the full-rank
    kernel <math|K>.

    <item>As <math|N> increases, these approximations improve.

    <item>In the limit <math|N\<to\>\<infty\>>, we obtain the true
    eigenfunctions of the full-rank kernel <math|K>.
  </enumerate>

  <section|Convergence Process>

  1. For each finite <math|N>, we have <math|N> exact eigenfunctions for
  <math|K<rsub|N>>. 2. As <math|N> increases, we get more eigenfunctions, and
  existing ones are refined. 3. In the limit, we obtain infinitely many
  eigenfunctions of the full-rank kernel <math|K>.

  <section|Computational Implications>

  When implementing this in a program:

  1. Choose a finite <math|N> based on computational resources and desired
  accuracy. 2. Solve the eigenvalue problem for <math|K<rsub|N>>, obtaining
  <math|N> eigenvalue-eigenfunction pairs. 3. These pairs are exact for
  <math|K<rsub|N>> but approximate for the full-rank <math|K>. 4. To improve
  accuracy, increase <math|N> and repeat, knowing that: a) You'll get more
  eigenvalue-eigenfunction pairs. b) Existing pairs will be refined, becoming
  better approximations of <math|K>'s eigenfunctions.

  <section|Proofs>

  <subsection|Rank of Finite Kernels>

  <\theorem>
    The rank of the finite kernel <math|K<rsub|N><around|(|s,t|)>=<big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>>
    is exactly <math|N>.
  </theorem>

  <\proof>
    Let <math|\<cal-H\><rsub|N>> be the reproducing kernel Hilbert space
    (RKHS) associated with <math|K<rsub|N>>.

    <\enumerate>
      <item>By construction, <math|K<rsub|N><around|(|s,t|)>=<big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>>.

      <item>The set <math|<around|{|\<psi\><rsub|n>|}><rsub|n=1><rsup|N>>
      spans <math|\<cal-H\><rsub|N>>.

      <item>These functions are linearly independent (as they form a basis).

      <item>Therefore, <math|dim <around|(|\<cal-H\><rsub|N>|)>=N>.

      <item>For a positive definite kernel, the rank is equal to the
      dimension of its RKHS.

      <item>Thus, rank(<math|K<rsub|N>>) = <math|dim
      <around|(|\<cal-H\><rsub|N>|)>=N>.
    </enumerate>
  </proof>

  <subsection|Number of Non-zero Eigenvalues>

  <\theorem>
    The finite-rank kernel <math|K<rsub|N>> has exactly <math|N> non-zero
    eigenvalues.
  </theorem>

  <\proof>
    <\enumerate>
      <item>The eigenvalue equation for <math|K<rsub|N>> is:

      <\equation*>
        <big|int>K<rsub|N><around|(|s,t|)>*\<phi\><around|(|t|)>*d*t=\<lambda\>*\<phi\><around|(|s|)>
      </equation*>

      <item>Substituting the expression for <math|K<rsub|N>>:

      <\equation*>
        <big|int><big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>*\<phi\><around|(|t|)>*d*t=\<lambda\>*\<phi\><around|(|s|)>
      </equation*>

      <item>This can be written as a matrix equation:
      <math|A<rsub|N><math-bf|c>=\<lambda\><math-bf|c>> where
      <math|A<rsub|N>=<around|[|A<rsub|i*j>|]><rsub|i,j=1><rsup|N>> with
      <math|A<rsub|i*j>=<big|int>\<psi\><rsub|i>*<around|(|t-s|)>*\<psi\><rsub|j><around|(|t|)>*d*t>

      <item><math|A<rsub|N>> is an <math|N\<times\>N> matrix.

      <item>By the fundamental theorem of linear algebra, the number of
      non-zero eigenvalues of <math|A<rsub|N>> is equal to its rank.

      <item>We proved earlier that rank(<math|K<rsub|N>>) = <math|N>.

      <item>Therefore, <math|K<rsub|N>> has exactly <math|N> non-zero
      eigenvalues.
    </enumerate>
  </proof>

  <subsection|Exactness of Eigenfunctions for <math|K<rsub|N>>>

  <\lemma>
    The eigenfunctions <math|\<phi\><rsub|k><rsup|<around|(|N|)>>> obtained
    from solving <math|A<rsub|N><math-bf|C><rsub|N>=\<lambda\><rsub|N><math-bf|C><rsub|N>>
    are exact eigenfunctions of <math|K<rsub|N>>.
  </lemma>

  <\proof>
    <\enumerate>
      <item>Let <math|\<phi\><rsub|k><rsup|<around|(|N|)>><around|(|s|)>=<big|sum><rsub|n=1><rsup|N>c<rsub|n*k><rsup|<around|(|N|)>>*\<psi\><rsub|n><around|(|s|)>>
      be an eigenfunction obtained from <math|A<rsub|N><math-bf|C><rsub|N>=\<lambda\><rsub|N><math-bf|C><rsub|N>>.

      <item>Substitute this into the eigenvalue equation for
      <math|K<rsub|N>>:

      <\equation*>
        <big|int>K<rsub|N><around|(|s,t|)>*\<phi\><rsub|k><rsup|<around|(|N|)>><around|(|t|)>*d*t=\<lambda\><rsub|k><rsup|<around|(|N|)>>*\<phi\><rsub|k><rsup|<around|(|N|)>><around|(|s|)>
      </equation*>

      <\equation*>
        <big|int><big|sum><rsub|i=1><rsup|N>\<psi\><rsub|i>*<around|(|t-s|)>*<big|sum><rsub|j=1><rsup|N>c<rsub|j*k><rsup|<around|(|N|)>>*\<psi\><rsub|j><around|(|t|)>*d*t=\<lambda\><rsub|k><rsup|<around|(|N|)>>*<big|sum><rsub|n=1><rsup|N>c<rsub|n*k><rsup|<around|(|N|)>>*\<psi\><rsub|n><around|(|s|)>
      </equation*>

      <\equation*>
        <big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|N>c<rsub|j*k><rsup|<around|(|N|)>>*<big|int>\<psi\><rsub|i>*<around|(|t-s|)>*\<psi\><rsub|j><around|(|t|)>*d*t=\<lambda\><rsub|k><rsup|<around|(|N|)>>*<big|sum><rsub|n=1><rsup|N>c<rsub|n*k><rsup|<around|(|N|)>>*\<psi\><rsub|n><around|(|s|)>
      </equation*>

      <\equation*>
        <big|sum><rsub|i=1><rsup|N><big|sum><rsub|j=1><rsup|N>A<rsub|i*j>*c<rsub|j*k><rsup|<around|(|N|)>>*\<psi\><rsub|i><around|(|s|)>=\<lambda\><rsub|k><rsup|<around|(|N|)>>*<big|sum><rsub|n=1><rsup|N>c<rsub|n*k><rsup|<around|(|N|)>>*\<psi\><rsub|n><around|(|s|)>
      </equation*>

      <item>This is exactly satisfied by the solution to
      <math|A<rsub|N><math-bf|C><rsub|N>=\<lambda\><rsub|N><math-bf|C><rsub|N>>.

      <item>Therefore, <math|\<phi\><rsub|k><rsup|<around|(|N|)>>> is an
      exact eigenfunction of <math|K<rsub|N>> with eigenvalue
      <math|\<lambda\><rsub|k><rsup|<around|(|N|)>>>.
    </enumerate>
  </proof>

  <subsection|Convergence to Full-Rank Kernel>

  <\theorem>
    As <math|N\<to\>\<infty\>>, <math|K<rsub|N>> converges uniformly to
    <math|K>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>By definition, <math|K*<around|(|t-s|)>=lim<rsub|N\<to\>\<infty\>>
      <big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>> uniformly.

      <item>This means that for any <math|\<epsilon\>\<gtr\>0>, there exists
      an <math|N<rsub|0>> such that for all <math|N\<gtr\>N<rsub|0>>:

      <\equation*>
        sup<rsub|s,t><around|\||K*<around|(|t-s|)>-<big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>|\|>\<less\>\<epsilon\>
      </equation*>

      <item>But <math|<big|sum><rsub|n=1><rsup|N>\<psi\><rsub|n>*<around|(|t-s|)>>
      is exactly <math|K<rsub|N><around|(|s,t|)>>.

      <item>Therefore, <math|sup<rsub|s,t><around|\||K<around|(|s,t|)>-K<rsub|N><around|(|s,t|)>|\|>\<less\>\<epsilon\>>
      for all <math|N\<gtr\>N<rsub|0>>.

      <item>This is the definition of uniform convergence of <math|K<rsub|N>>
      to <math|K>.
    </enumerate>
  </proof>

  <subsection|Approximation of Full-Rank Eigenfunctions>

  <\theorem>
    As <math|N\<to\>\<infty\>>, the eigenfunctions of <math|K<rsub|N>>
    converge to the eigenfunctions of <math|K>.
  </theorem>

  <\proof>
    (Sketch, as a full proof requires more advanced functional analysis)

    <\enumerate>
      <item>Let <math|<around|(|\<lambda\>,\<phi\>|)>> be an
      eigenvalue-eigenfunction pair of <math|K>.

      <item>Define the projection operator <math|P<rsub|N>> onto the span of
      <math|<around|{|\<psi\><rsub|n>|}><rsub|n=1><rsup|N>>.

      <item>Consider the sequence <math|<around|{|<around|(|\<lambda\><rsub|N>,P<rsub|N>*\<phi\>|)>|}><rsub|N=1><rsup|\<infty\>>>.

      <item>As <math|N\<to\>\<infty\>>, <math|P<rsub|N>*\<phi\>\<to\>\<phi\>>
      in the <math|L<rsup|2>> norm.

      <item>The uniform convergence of <math|K<rsub|N>> to <math|K> implies
      that <math|\<lambda\><rsub|N>\<to\>\<lambda\>>.

      <item>Therefore, the eigenfunctions of <math|K<rsub|N>> converge to
      those of <math|K>.
    </enumerate>
  </proof>

  This completes the proofs of the main statements in our analysis, providing
  a rigorous foundation for understanding the relationship between
  finite-rank kernels and the full-rank kernel, as well as the behavior of
  their respective eigenfunctions.
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
    <associate|auto-10|<tuple|7.3|4>>
    <associate|auto-11|<tuple|7.4|5>>
    <associate|auto-12|<tuple|7.5|5>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|5|3>>
    <associate|auto-6|<tuple|6|3>>
    <associate|auto-7|<tuple|7|3>>
    <associate|auto-8|<tuple|7.1|3>>
    <associate|auto-9|<tuple|7.2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Finite
      Rank Kernels and Their Eigenfunctions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Finite
      Rank Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenvalue
      Problem for Finite Rank Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Relationship
      to Full Rank Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Convergence
      Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Computational
      Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Proofs>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1<space|2spc>Rank of Finite Kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|7.2<space|2spc>Number of Non-zero
      Eigenvalues <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|7.3<space|2spc>Exactness of Eigenfunctions
      for <with|mode|<quote|math>|K<rsub|N>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|7.4<space|2spc>Convergence to Full-Rank
      Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|7.5<space|2spc>Approximation of Full-Rank
      Eigenfunctions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>
    </associate>
  </collection>
</auxiliary>