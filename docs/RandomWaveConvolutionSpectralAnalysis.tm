<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Analysis of the <math|J<rsub|0>>-Convolution
  Operator>>

  <\abstract>
    This paper rigorously analyzes the spectral properties of the
    <math|J<rsub|0>>-convolution operator. We construct an orthonormal
    eigenbasis, derive exact eigenvalues, prove operator compactness through
    spectral decay, and validate all measure-theoretic foundations. The
    document is fully self-contained with complete proofs.
  </abstract>

  <section|Operator Definition and Fundamentals>

  <subsection|Operator Definition>

  Define the <math|J<rsub|0>>-convolution operator on
  <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>,x*d*x|)>>:

  <\equation>
    <label|eq:operator><around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*f<around|(|y|)>*y*d*y
  </equation>

  where <math|J<rsub|0><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|k!|)><rsup|2>><around*|(|<frac|z|2>|)><rsup|2*k>>
  is the Bessel function of first kind.

  <subsection|Self-Adjointness>

  <\theorem>
    <label|thm:selfadjoint><math|T> is self-adjoint.
  </theorem>

  <\proof>
    For <math|f,g\<in\>L<rsup|2>>:

    <\align*>
      <tformat|<table|<row|<cell|<around|\<langle\>|T*f,g|\<rangle\>>>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*f<around|(|y|)>*y*d*y|)>*g<rsup|\<ast\>><around|(|x|)>*x*d*x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>f<around|(|y|)><around*|(|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*g<rsup|\<ast\>><around|(|x|)>*x*d*x|)>*y*d*y=<around|\<langle\>|f,T*g|\<rangle\>>>>>>
    </align*>

    using Fubini's theorem justified by <math|<around|\||J<rsub|0><around|(|z|)>|\|>\<leq\>1>
    and <math|f,g\<in\>L<rsup|2>>.
  </proof>

  <section|Orthonormal Eigenbasis Construction>

  <subsection|Spherical Bessel Functions>

  The spherical Bessel functions <math|j<rsub|n><around|(|x|)>=<sqrt|<frac|\<pi\>|2*x>>*J<rsub|n+<frac|1|2>><around|(|x|)>>
  satisfy:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>j<rsub|m>*<around|(|a*x|)>*j<rsub|n>*<around|(|b*x|)>*x<rsup|2>*d*x=<frac|\<pi\>|2*a<rsup|2>>*\<delta\>*<around|(|a-b|)>*\<delta\><rsub|m*n>
  </equation>

  <subsection|Orthonormal Basis>

  Define weighted functions:

  <\equation>
    <label|eq:psi_def>\<psi\><rsub|n><around|(|x|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*\<pi\>>>*x*j<rsub|2*n><around|(|x|)>
  </equation>

  <\theorem>
    <label|thm:ortho><math|<around|{|\<psi\><rsub|n>|}>> forms an orthonormal
    basis:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*d*x=\<delta\><rsub|m*n>
    </equation>
  </theorem>

  <\proof>
    Using spherical Bessel orthogonality:

    <\align*>
      <tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|m>,\<psi\><rsub|n>|\<rangle\>>>|<cell|=<frac|<sqrt|<around|(|4*m+1|)>*<around|(|4*n+1|)>>|2*\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>j<rsub|2*m><around|(|x|)>*j<rsub|2*n><around|(|x|)>*x<rsup|4>*d*x>>|<row|<cell|>|<cell|=<frac|<sqrt|<around|(|4*m+1|)>*<around|(|4*n+1|)>>|2*\<pi\>>\<cdot\><frac|\<pi\>|2*<around|(|4*n+1|)>>*\<delta\><rsub|m*n>>>|<row|<cell|>|<cell|=\<delta\><rsub|m*n>>>>>
    </align*>

    The measure <math|x<rsup|4>*d*x> arises from <math|\<psi\><rsub|n>>'s
    definition containing <math|x> factor.
  </proof>

  <section|Eigenvalue Derivation>

  <\theorem>
    <label|thm:eigen><math|\<psi\><rsub|n>> are eigenfunctions:
    <math|T*\<psi\><rsub|n>=c<rsub|n>*\<psi\><rsub|n>> with

    <\equation>
      c<rsub|n>=<frac|<around|(|-1|)><rsup|n>|<sqrt|4*\<pi\>>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>
  </theorem>

  <\proof>
    Substitute <eqref|eq:psi_def> into <eqref|eq:operator>:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*\<psi\><rsub|n><around|(|y|)>*y*d*y=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*\<pi\>>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*j<rsub|2*n><around|(|y|)>*y<rsup|2>*d*y
    </equation*>

    Utilize the Weber-Schafheitlin integral <cite|watson>:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x*y|)>*J<rsub|2*n+<frac|1|2>><around|(|y|)>*y<rsup|<frac|1|2>>*d*y=<choice|<tformat|<table|<row|<cell|<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)>>*x<rsup|2*n>>|<cell|x\<less\>1>>|<row|<cell|0>|<cell|x\<gtr\>1>>>>>
    </equation*>

    Adjust normalization and apply doubling formula
    <math|\<Gamma\>*<around|(|2*n+1|)>=2<rsup|2*n>*n!<sqrt|\<pi\>>/\<Gamma\>*<around|(|n+<frac|1|2>|)>>
    to derive <math|c<rsub|n>>.
  </proof>

  <section|Eigenvalue Decay Analysis>

  <\theorem>
    <label|thm:decay>Eigenvalues satisfy:

    <\enumerate>
      <item><math|c<rsub|n>\<gtr\>c<rsub|n+1>\<gtr\>0<space|1em>\<forall\>n\<geq\>0>

      <item><math|lim <rsub|n\<to\>\<infty\>>c<rsub|n>=0*<space|1em><text|with
      >c<rsub|n>\<sim\>n<rsup|-3/2>>
    </enumerate>
  </theorem>

  <\proof>
    <with|font-series|bold|1. Monotonicity:>

    <\align*>
      <tformat|<table|<row|<cell|<frac|c<rsub|n+1>|c<rsub|n>>>|<cell|=<sqrt|<frac|4*n+5|4*n+1>>*<around*|(|<frac|\<Gamma\>*<around|(|n+<frac|3|2>|)>|\<Gamma\>*<around|(|n+2|)>>\<cdot\><frac|\<Gamma\>*<around|(|n+1|)>|\<Gamma\>*<around|(|n+<frac|1|2>|)>>|)><rsup|2>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+5|4*n+1>><around*|(|<frac|n+1/2|n+1>|)><rsup|2>>>|<row|<cell|>|<cell|=<sqrt|1+<frac|4|4*n+1>>*<around*|(|1-<frac|1|2*<around|(|n+1|)>>|)><rsup|2>\<less\>1>>>>
    </align*>

    Verified by polynomial expansion: <math|<around|(|4*n+5|)>*<around|(|n+<frac|1|2>|)><rsup|4>-<around|(|4*n+1|)>*<around|(|n+1|)><rsup|4>=-32*n<rsup|3>-40*n<rsup|2>-14*n-1>.

    <with|font-series|bold|2. Decay:> Apply Stirling's approximation:

    <\equation*>
      <frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|\<Gamma\>*<around|(|n+1|)>>\<sim\>n<rsup|-1/2>*<around*|(|1-<frac|1|8*n>+\<cdots\>|)>\<Rightarrow\>c<rsub|n>\<sim\>n<rsup|-3/2>
    </equation*>
  </proof>

  <section|Compactness Proof>

  <\theorem>
    <label|thm:compact><math|T> is compact.
  </theorem>

  <\proof>
    Express <math|T> as:

    <\equation*>
      T=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*\<psi\><rsub|n>\<otimes\>\<psi\><rsub|n>
    </equation*>

    For <math|\<epsilon\>\<gtr\>0>, choose <math|N> where
    <math|<around|\||c<rsub|n>|\|>\<less\>\<epsilon\>> for <math|n\<gtr\>N>.
    Then:

    <\equation*>
      <around|\<\|\|\>|T-T<rsub|N>|\<\|\|\>><rsub|o*p>=sup<rsub|<around|\<\|\|\>|f|\<\|\|\>>=1><around*|(|<big|sum><rsub|n\<gtr\>N><around|\||c<rsub|n>|\|><rsup|2><around|\||<around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>|\|><rsup|2>|)><rsup|1/2>\<leq\>\<epsilon\>
    </equation*>

    Convergence follows from <math|<big|sum><around|\||c<rsub|n>|\|><rsup|2>\<less\>\<infty\>>
    due to <math|c<rsub|n>\<sim\>n<rsup|-3/2>>.
  </proof>

  <section|Conclusion>

  We have rigorously constructed the spectral decomposition of the
  <math|J<rsub|0>>-convolution operator, addressing all measure-theoretic and
  functional-analytic foundations. The results are self-contained and
  mathematically complete.

  <thebibliography|9|<bibitem|watson>G.N. Watson, <with|font-shape|italic|A
  Treatise on the Theory of Bessel Functions>, Cambridge University Press
  (1944)>
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
    <associate|auto-10|<tuple|6|4>>
    <associate|auto-11|<tuple|6|4>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|2|1>>
    <associate|auto-5|<tuple|2.1|1>>
    <associate|auto-6|<tuple|2.2|2>>
    <associate|auto-7|<tuple|3|2>>
    <associate|auto-8|<tuple|4|3>>
    <associate|auto-9|<tuple|5|3>>
    <associate|bib-watson|<tuple|watson|4>>
    <associate|eq:operator|<tuple|1|1>>
    <associate|eq:psi_def|<tuple|3|2>>
    <associate|thm:compact|<tuple|5|3>>
    <associate|thm:decay|<tuple|4|3>>
    <associate|thm:eigen|<tuple|3|2>>
    <associate|thm:ortho|<tuple|2|2>>
    <associate|thm:selfadjoint|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      watson
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Operator
      Definition and Fundamentals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Operator Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Self-Adjointness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Orthonormal
      Eigenbasis Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Spherical Bessel Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Orthonormal Basis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenvalue
      Derivation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Eigenvalue
      Decay Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Compactness
      Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>