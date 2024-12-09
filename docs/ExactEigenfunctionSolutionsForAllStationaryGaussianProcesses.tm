<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Constructive Solution for the Exact Eigenfunctions
  of Stationary Gaussian Processes Over Unbounded Domains Whose Integral
  Covariance Operators Are Compact Relative To The Induced Canonical
  Metric>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <abstract-data|<abstract|A constructive method yielding exact
  eigenfunctions for stationary Gaussian processes through uniform expansions
  is presented. While Mercer's theorem guarantees existence and Aronszajn's
  theory provides the RKHS framework, neither provides an effective method to
  generate the basis. The key insight is that polynomals orthogonal to the
  spectral density and its square root, when Fourier transformed and properly
  normalized, yield bases whose inner products naturally form a triangular
  matrix. This structure enables exact finite expansions of eigenfunctions,
  avoiding the infinite series approximations required by traditional
  methods.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Double
    Gram-Schmidt Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Eigenfunction
    Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <\abstract>
    A constructive method yielding exact eigenfunctions for stationary
    Gaussian processes through uniform expansions is presented. While
    Mercer's theorem guarantees existence and Aronszajn's theory provides the
    RKHS framework, neither provides an effective method to generate the
    basis. The key insight is that orthogonal polynomials in the spectral
    domain, when Fourier transformed and properly normalized, yield bases
    whose inner products naturally form a triangular matrix. This structure
    enables exact finite expansions of eigenfunctions, avoiding the infinite\ 
  </abstract>

  \;

  <\abstract>
    A constructive method yielding exact eigenfunctions for stationary
    Gaussian processes through uniform expansions is presented. While
    Mercer's theorem guarantees existence and Aronszajn's theory provides the
    RKHS framework, neither provides an effective method to generate the
    basis. The key insight is that orthogonal polynomials in the spectral
    domain, when Fourier transformed and orthogonalized again in the time
    domain, yield bases whose inner products naturally form a triangular
    matrix. This structure enables exact finite expansions of eigenfunctions,
    avoiding the infinite series approximations required by traditional
    methods.
  </abstract>

  <section|Preliminaries>

  <\theorem>
    <dueto|Spectral Factorization>Let <math|K<around|(|t,s|)>> be a positive
    definite stationary kernel. Then there exists a spectral density
    <math|S<around|(|\<omega\>|)>> and spectral factor:

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    such that:

    <\equation>
      K<around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>
    </equation>
  </theorem>

  <\proof>
    By Bochner's theorem, since <math|K> is positive definite and stationary:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
    </equation>

    where <math|S<around|(|\<omega\>|)>\<geq\>0> is the spectral density.

    Define <math|h<around|(|t|)>> as stated. Then:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*<around|(|t+\<tau\>|)>>*d*\<omega\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>\<cdot\><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|-i*\<omega\><rsub|2>*<around|(|s+\<tau\>|)>>*d*\<omega\><rsub|2>*d*\<tau\>>>>>>
    </equation>

    By Fubini's theorem:

    <\equation>
      =<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>*e<rsup|-i*\<omega\><rsub|2>*s>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation>

    The inner integral gives <math|2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>>,
    yielding:

    <\equation>
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>=K*<around|(|t-s|)>
    </equation>
  </proof>

  <section|Double Gram-Schmidt Construction>

  <\theorem>
    <dueto|Double Gram-Schmidt Expansion>Let <math|K*<around|(|t-s|)>> be a
    stationary kernel with spectral density <math|S<around|(|\<omega\>|)>>.
    Then there exist two sequences of polynomials
    <math|<around|{|p<rsub|n><around|(|\<omega\>|)>|}>> and
    <math|<around|{|q<rsub|n><around|(|\<omega\>|)>|}>>, orthogonal with
    respect to <math|S<around|(|\<omega\>|)>> and
    <math|<sqrt|S<around|(|\<omega\>|)>>> respectively, whose Fourier
    transforms, when orthogonalized again in the time domain, yield bases
    <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> and
    <math|<around|{|\<psi\><rsub|n><around|(|t|)>|}>> with inner products:

    <\equation>
      c<rsub|n*k>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|n><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>>d*\<omega\>=0*<space|1em><text|for
      >n\<gtr\>k
    </equation>
  </theorem>

  <\proof>
    First construct orthogonal polynomials in the spectral domain:

    <\equation>
      p<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*p<rsub|k><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>|<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|k><rsup|2><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>>*p<rsub|k><around|(|\<omega\>|)>
    </equation>

    <\equation>
      q<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*q<rsub|k><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>|<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|k><rsup|2><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>>*q<rsub|k><around|(|\<omega\>|)>
    </equation>

    Take Fourier transforms:

    <\equation>
      <wide|p|^><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>
    </equation>

    <\equation>
      <wide|q|^><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>
    </equation>

    Apply second Gram-Schmidt process in time domain:

    <\equation>
      u<rsub|n><around|(|t|)>=<wide|p|^><rsub|n><around|(|t|)>-<big|sum><rsub|k=0><rsup|n-1><frac|<around|\<langle\>|<wide|p|^><rsub|n>,\<phi\><rsub|k>|\<rangle\>>|<around|\<\|\|\>|\<phi\><rsub|k>|\<\|\|\>><rsup|2>>*\<phi\><rsub|k><around|(|t|)>
    </equation>

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=<frac|u<rsub|n><around|(|t|)>|<around|\<\|\|\>|u<rsub|n>|\<\|\|\>>>
    </equation>

    <\equation>
      v<rsub|n><around|(|t|)>=<wide|q|^><rsub|n><around|(|t|)>-<big|sum><rsub|k=0><rsup|n-1><frac|<around|\<langle\>|<wide|q|^><rsub|n>,\<psi\><rsub|k>|\<rangle\>>|<around|\<\|\|\>|\<psi\><rsub|k>|\<\|\|\>><rsup|2>>*\<psi\><rsub|k><around|(|t|)>
    </equation>

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=<frac|v<rsub|n><around|(|t|)>|<around|\<\|\|\>|v<rsub|n>|\<\|\|\>>>
    </equation>

    The crucial observation is that their inner product <math|c<rsub|n*k>>
    vanishes for <math|n\<gtr\>k> without requiring the spectral density
    weight, due to the double orthogonalization process.
  </proof>

  <section|Eigenfunction Expansion>

  <\theorem>
    <dueto|Finite Eigenfunction Expansion>The Mercer eigenfunctions of
    <math|K*<around|(|t-s|)>> have exact finite expansions:

    <\equation>
      f<rsub|n><around|(|t|)>=<big|sum><rsub|k=0><rsup|n>c<rsub|n*k>*\<phi\><rsub|k><around|(|t|)>
    </equation>

    where the coefficients are exactly the inner products:

    <\equation>
      c<rsub|n*k>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t
    </equation>

    forming a triangular matrix that enables exact computation of
    eigenfunctions.
  </theorem>

  <\remark>
    <dueto|Significance of Double Orthogonalization>The double Gram-Schmidt
    process is essential:

    <\enumerate>
      <item>First GS in frequency domain creates polynomials orthogonal to
      spectral weights

      <item>Fourier transform preserves this structure

      <item>Second GS in time domain ensures proper normalization without
      weights

      <item>The resulting coefficients <math|c<rsub|n*k>> form a triangular
      matrix naturally
    </enumerate>
  </remark>

  <\proof>
    By the spectral factorization theorem:

    <\equation>
      f<rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t-s|)>*\<phi\><rsub|n><around|(|s|)>*d*s
    </equation>

    Expanding <math|h<around|(|t|)>> in the
    <math|<around|{|\<psi\><rsub|k>|}>> basis:

    <\equation>
      h<around|(|t|)>=<big|sum><rsub|k=0><rsup|\<infty\>>\<gamma\><rsub|k>*\<psi\><rsub|k><around|(|t|)>
    </equation>

    The coefficients <math|c<rsub|n*k>=<around|\<langle\>|\<psi\><rsub|n>,\<phi\><rsub|k>|\<rangle\>>>
    form a triangular matrix because of the double orthogonalization process.
    This ensures that when computing the eigenfunction expansion, only terms
    with <math|k\<leq\>n> contribute, yielding the finite expansion.
  </proof>

  <thebibliography|1|<bibitem-with-key|1|cramerStochasticProcessTheoryContribution>
  Harald Cramér. <newblock>A contribution to the theory of stochastic
  processes. <newblock><with|font-shape|italic|Proceedings of the Second
  Berkeley Symposium on Mathematical Statistics and Probability>, 2:329\U339,
  1951.>
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Double
      Gram-Schmidt Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenfunction
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>