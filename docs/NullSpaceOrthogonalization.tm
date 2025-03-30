<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Determination of the Eigenfunctions of Integral
  Covariance Operators of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>stephencrowley214@gmail.com\<gtr\>>>>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    It is proved that the eigenfunctions of \ integral covariance operators
    of stationary Gaussian processes are the orthogonal complement of the
    null space of the kernel inner product operator where the null space is
    identified as the inverse Fourier transforms of the polynomials which are
    orthogonal with respect to the spectral density of the process.
  </abstract>>

  Let <math|C<around|(|x|)>> be the covariance function of a stationary
  Gaussian process on <math|<around|[|0,\<infty\>|)>>. Define the integral
  covariance operator <math|T> by:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*f<around|(|y|)>*<space|0.17em>\<mathd\>*y
  </equation>

  Let <math|S<around|(|\<omega\>|)>> be the spectral density related to
  <math|C<around|(|x|)>> by the Wiener-Khinchin theorem:

  <\equation>
    C<around|(|x|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>
  </equation>

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*e<rsup|-i*x*\<omega\>>*\<mathd\>*x
  </equation>

  Consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\>|)>|}>>
  orthogonal with respect to <math|S<around|(|\<omega\>|)>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*p<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>=\<delta\><rsub|n*m>
  </equation>

  Define <math|r<rsub|n><around|(|x|)>> as the inverse Fourier transforms of
  <math|p<rsub|n><around|(|\<omega\>|)>>:

  <\equation>
    r<rsub|n><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*<space|0.17em>\<mathd\>*\<omega\>
  </equation>

  <\lemma>
    The functions <math|r<rsub|n><around|(|x|)>> form the null space of the
    kernel inner product:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=0
    </equation>
  </lemma>

  <\proof>
    Proof: Substitute the definitions of <math|C<around|(|x|)>> and
    <math|r<rsub|n><around|(|x|)>>, and apply Fubini's theorem:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=<big|int><rsub|0><rsup|\<infty\>><frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*e<rsup|i*\<omega\><rprime|'>*x>*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*x
    </equation>

    By Fubini's theorem, we can swap the integrals:

    <\equation>
      =<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*S<around|(|\<omega\>|)>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>+\<omega\><rprime|'>|)>*x>*<space|0.17em>\<mathd\>*x*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    The integral over <math|x> yields the Dirac delta function
    <math|\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>>:

    <\equation>
      =<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*S<around|(|\<omega\>|)>*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    Now, integrate over <math|\<omega\><rprime|'>> using the delta function:

    <\equation>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    By the orthogonality of <math|p<rsub|n><around|(|\<omega\>|)>> with
    respect to <math|S<around|(|\<omega\>|)>>, we conclude:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>=0
    </equation>

    Thus, <math|<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=0>,
    which completes the proof.
  </proof>

  <section|Eigenfunctions from Orthogonalized Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|x|)>|}>>,
  we obtain the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>>
  of the covariance operator <math|T>. The orthogonalization process gives:

  <\equation*>
    \<psi\><rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|x|)>
  </equation*>

  where the coefficients <math|a<rsub|n*k>> are given by:

  <\equation>
    a<rsub|n*k>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>|\<nobracket\>>
  </equation>

  <\theorem>
    Let <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>> be the orthogonal
    complement of <math|<around|{|r<rsub|n><around|(|x|)>|}>>. Then
    <math|\<psi\><rsub|n><around|(|x|)>> are eigenfunctions of <math|T>, with
    eigenvalues:

    <\equation>
      \<lambda\>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)>*<space|0.17em>\<mathd\>*z
    </equation>
  </theorem>

  <\proof>
    Let <math|\<psi\><rsub|n><around|(|x|)>=<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|x|)>>.
    Then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>\<mathd\>*y>|<cell|=<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|y|)>*<space|0.17em>\<mathd\>*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*r<rsub|k><around|(|y|)>*<space|0.17em>\<mathd\>*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<around*|[|r<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*<space|0.17em>\<mathd\>*z-<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*r<rsub|k>*<around|(|x-z|)>*<space|0.17em>\<mathd\>*z|]>>>>>>
    </equation>

    Now, let's focus on the second term:

    <\align*>
      <tformat|<table|<row|<cell|<big|sum><rsub|k>a<rsub|n*k>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*r<rsub|k>*<around|(|x-z|)>*<space|0.17em>\<mathd\>*z>|<cell|=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k>*<around|(|x-z|)>*<space|0.17em>\<mathd\>*z>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n>*<around|(|x-z|)>*<space|0.17em>\<mathd\>*z>>|<row|<cell|>|<cell|=<around|(|T*\<psi\><rsub|n>|)><around|(|x|)>>>>>
    </align*>

    Substituting this back into our original expression:

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>\<mathd\>*y>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*<space|0.17em>\<mathd\>*z-<around|(|T*\<psi\><rsub|n>|)><around|(|x|)>>>|<row|<cell|>|<cell|=\<psi\><rsub|n><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*<space|0.17em>\<mathd\>*z-<around|(|T*\<psi\><rsub|n>|)><around|(|x|)>>>>>
    </align*>

    Therefore, we have shown that:

    <\equation*>
      <around|(|T*\<psi\><rsub|n>|)><around|(|x|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)>
    </equation*>

    where the eigenvalue <math|\<lambda\><rsub|n>> is given by:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)>*<space|0.17em>\<mathd\>*z
    </equation*>
  </proof>

  Thus, we have shown that the orthogonalized null space functions are
  eigenfunctions of the covariance operator, providing a direct method to
  construct eigenfunctions for stationary operators. The eigenvalues are
  determined by the integral of the covariance function with the
  corresponding eigenfunction.
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Eigenfunctions
      from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>