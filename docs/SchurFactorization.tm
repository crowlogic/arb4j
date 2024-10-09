<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Schur Factorization of Square Matrices>>

  The Schur factorization is a fundamental result in linear algebra that
  states that any square matrix <math|A\<in\>\<bbb-C\><rsup|n\<times\>n>> can
  be factorized into a unitary matrix <math|Q> and an upper triangular matrix
  <math|U> such that:

  <\equation>
    A=Q*U*Q<rsup|\<ast\>>
  </equation>

  <section*|Statement of the Schur Factorization>

  For any complex square matrix <math|A\<in\>\<bbb-C\><rsup|n\<times\>n>>,
  there exists a unitary matrix <math|Q> and an upper triangular matrix
  <math|U> such that <math|A=Q*U*Q<rsup|\<ast\>>>, where:

  <\itemize>
    <item><math|Q> is a unitary matrix (<math|Q<rsup|\<ast\>>*Q=I>).

    <item><math|U> is an upper triangular matrix with the eigenvalues of
    <math|A> on its diagonal.
  </itemize>

  <section*|Proof of Existence>

  The proof of the Schur factorization can be approached using the concept of
  unitary similarity transformations and relies on induction, properties of
  eigenvalues, and specific unitary transformations like Householder
  transformations.

  <subsection*|1. Base Case (<math|n=1>)>

  For a <math|1\<times\>1> matrix <math|A=<around|[|a|]>>, the Schur
  factorization is trivially <math|A=Q*U*Q<rsup|\<ast\>>> where <math|Q=1>
  and <math|U=A>. Thus, the base case holds.

  <subsection*|2. Inductive Step>

  Assume that any <math|<around|(|n-1|)>\<times\><around|(|n-1|)>> matrix has
  a Schur factorization. We now prove that an <math|n\<times\>n> matrix
  <math|A> also has a Schur factorization.

  <subsection*|3. Finding an Eigenvalue and Eigenvector>

  By the fundamental theorem of algebra, the complex matrix <math|A> has at
  least one eigenvalue, say <math|\<lambda\>>, with a corresponding unit
  eigenvector <math|x\<in\>\<bbb-C\><rsup|n>>.

  <subsection*|4. Constructing the Householder Transformation>

  To simplify the process, we use a Householder transformation to construct a
  unitary matrix <math|Q<rsub|1>> that maps <math|x> to the first basis
  vector <math|e<rsub|1>>. The Householder transformation is defined as:

  <\equation>
    Q<rsub|1>=I-2*<frac|v*v<rsup|\<ast\>>|v<rsup|\<ast\>>*v>
  </equation>

  where <math|v=x-\<alpha\>*e<rsub|1>> and
  <math|\<alpha\>=<around|\<\|\|\>|x|\<\|\|\>>> or
  <math|-<around|\<\|\|\>|x|\<\|\|\>>>, with the sign chosen to avoid
  cancellation errors. This choice ensures that <math|v\<neq\>0> and helps
  maintain numerical stability.

  As a result, <math|Q<rsub|1>> is unitary, and
  <math|Q<rsub|1><rsup|\<ast\>>*x=\<alpha\>*e<rsub|1>>.

  <subsection*|5. Transforming <math|A>>

  Compute <math|A<rsub|1>=Q<rsub|1><rsup|\<ast\>>*A*Q<rsub|1>>.

  The first column of <math|A<rsub|1>> is given by:

  <\equation>
    A<rsub|1>*e<rsub|1>=Q<rsub|1><rsup|\<ast\>>*A*Q<rsub|1>*e<rsub|1>=Q<rsub|1><rsup|\<ast\>>*A*x=Q<rsub|1><rsup|\<ast\>>*<around|(|\<lambda\>*x|)>=\<lambda\>*Q<rsub|1><rsup|\<ast\>>*x=\<lambda\>*e<rsub|1>
  </equation>

  Since <math|A<rsub|1>*e<rsub|1>=\<lambda\>*e<rsub|1>>, the first column of
  <math|A<rsub|1>> is <math|\<lambda\>> in the first position and zeros
  elsewhere (below the first position), confirming that the entries below the
  first element are zeros.

  <subsection*|6. Partitioning <math|A<rsub|1>>>

  Partition <math|A<rsub|1>> as:

  <\equation>
    A<rsub|1>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\>>|<cell|y<rsup|\<ast\>>>>|<row|<cell|0>|<cell|B>>>>>|]>
  </equation>

  where <math|y\<in\>\<bbb-C\><rsup|n-1>> and
  <math|B\<in\>\<bbb-C\><rsup|<around|(|n-1|)>\<times\><around|(|n-1|)>>>.

  <subsection*|7. Inductive Application>

  By the inductive hypothesis, the <math|<around|(|n-1|)>\<times\><around|(|n-1|)>>
  matrix <math|B> has a Schur factorization. Thus, there exists a unitary
  matrix <math|Q<rsub|2>\<in\>\<bbb-C\><rsup|<around|(|n-1|)>\<times\><around|(|n-1|)>>>
  such that:

  <\equation>
    B=Q<rsub|2>*U<rprime|'>*Q<rsub|2><rsup|\<ast\>>
  </equation>

  where <math|U<rprime|'>> is upper triangular.

  <subsection*|8. Constructing the Final Unitary Matrix>

  Define the unitary matrix:

  <\equation>
    Q=Q<rsub|1><around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|Q<rsub|2>>>>>>|]>
  </equation>

  <subsection*|9. Forming the Upper Triangular Matrix <math|U>>

  Compute:

  <\equation>
    Q<rsup|\<ast\>>*A*Q=<around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|Q<rsub|2><rsup|\<ast\>>>>>>>|]>*Q<rsub|1><rsup|\<ast\>>*A*Q<rsub|1><around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|Q<rsub|2>>>>>>|]>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\>>|<cell|y<rsup|\<ast\>>*Q<rsub|2>>>|<row|<cell|0>|<cell|U<rprime|'>>>>>>|]>=U
  </equation>

  Since <math|U<rprime|'>> is upper triangular and
  <math|y<rsup|\<ast\>>*Q<rsub|2>> is a row vector, the resulting matrix
  <math|U> is upper triangular. The presence of
  <math|y<rsup|\<ast\>>*Q<rsub|2>> in the first row doesn't introduce any
  non-zero elements below the main diagonal, ensuring <math|U> remains upper
  triangular.

  <subsection*|10. Diagonal Elements as Eigenvalues>

  The first diagonal element of <math|U> is <math|\<lambda\>>, which is an
  eigenvalue of <math|A> by construction. By the inductive hypothesis, the
  diagonal elements of <math|U<rprime|'>> are the eigenvalues of <math|B>,
  which are also eigenvalues of <math|A>. Thus, all diagonal elements of
  <math|U> are eigenvalues of <math|A>.

  <subsection*|11. Conclusion>

  We have shown that for any <math|n\<times\>n> complex matrix <math|A>,
  there exists a unitary matrix <math|Q> and an upper triangular matrix
  <math|U> such that <math|A=Q*U*Q<rsup|\<ast\>>>. This completes the proof.

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-10|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-11|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-12|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-13|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|2|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-7|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-8|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-9|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_50.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Statement
      of the Schur Factorization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof
      of Existence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1. Base Case (<with|mode|<quote|math>|n=1>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2. Inductive Step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3. Finding an Eigenvalue and Eigenvector
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4. Constructing the Householder
      Transformation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|5. Transforming <with|mode|<quote|math>|A>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|6. Partitioning
      <with|mode|<quote|math>|A<rsub|1>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|7. Inductive Application
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|8. Constructing the Final Unitary Matrix
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|9. Forming the Upper Triangular Matrix
      <with|mode|<quote|math>|U> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|10. Diagonal Elements as Eigenvalues
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|11. Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>
    </associate>
  </collection>
</auxiliary>