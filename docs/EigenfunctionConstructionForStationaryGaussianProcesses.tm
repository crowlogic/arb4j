<TeXmacs|2.1.4>

<style|<tuple|letter|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>

    <\abstract>
      The eigenfunctions of the covariance operator of a stationary Gaussian
      process are shown to be the orthogonal complement of the inverse
      Fourier transforms of polynomials orthogonal to the square root of its
      spectral density. Utilizing the convolution theorem and properties of
      the covariance operator, an explicit construction method for these
      eigenfunctions is provided. This result enables efficient computation
      and offers a comprehensive solution for all stationary Gaussian
      processes.
    </abstract>
  </author-affiliation>>>>

  <section|Introduction>

  <section|Main Results>

  <\theorem>
    <strong|[Spectral Factorization]> Let <math|K<around|(|t,s|)>> be a
    positive definite stationary kernel. Then there exists a spectral density
    <math|S<around|(|\<omega\>|)>> and spectral factor:

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\><label|sf>
    </equation>

    such that:

    <\equation>
      K<around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>
    </equation>

    <cite|cramerStochasticProcessTheoryContribution>
  </theorem>

  <\proof>
    1. By Bochner's theorem, since <math|K> is positive definite and
    stationary:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
    </equation>

    where <math|S<around|(|\<omega\>|)>\<geq\>0> is the spectral density.

    2. Define <math|h<around|(|t|)>> as stated. Then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*<around|(|t+\<tau\>|)>>*d*\<omega\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>\<cdot\><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|-i*\<omega\><rsub|2>*<around|(|s+\<tau\>|)>>*d*\<omega\><rsub|2>*d*\<tau\>>>>>>
    </equation>

    3. Rearranging integrals (justified by Fubini's theorem since
    <math|S<around|(|\<omega\>|)>\<geq\>0>):

    <\equation>
      =<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>*e<rsup|-i*\<omega\><rsub|2>*s><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation>

    4. The inner integral gives <math|2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>e<rsup|-i*\<omega\><rsub|2>*s>*2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>|<row|<cell|=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*<around*|(|\<omega\><rsub|1>*t-\<omega\><rsub|2>*s|)>>*2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>|<row|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>=K*<around|(|t-s|)>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    The eigenfunctions of a stationary Gaussian process are given by the
    orthogonal complement of the inverse Fourier transforms of the
    polynomials orthogonal with respect to the square root of the spectral
    density.
  </theorem>

  <\proof>
    The polynomials <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}>> are
    orthogonal to <math|<sqrt|S<around|(|\<omega\>|)>>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>P<rsub|m><around*|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|n,m>
    </equation>

    Take their inverse Fourier transforms:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=\<cal-F\><rsup|-1><around|{|P<rsub|n><around|(|\<omega\>|)>|}>
    </equation>

    which span the null space of the inner product with the spectral factor
    (<reference|sf>)

    <\equation>
      <around*|\<langle\>|h,\<phi\><rsub|n>|\<rangle\>>=0\<forall\>n\<gtr\>0
    </equation>

    The Gram-Schmidt recursion generates the orthogonal complement of the
    spectral factor null space:

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=\<phi\><rsub|n><around|(|t|)>-<big|sum><rsub|k=1><rsup|n-1><frac|<around|\<langle\>|\<phi\><rsub|n>,\<psi\><rsub|k>|\<rangle\>>|<around|\<\|\|\>|\<psi\><rsub|k>|\<\|\|\>><rsup|2>>*\<psi\><rsub|k><around|(|t|)>
    </equation>

    Apply covariance operator:

    <\equation>
      T<around*|[|\<psi\><rsub|n>|]>*<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around*|\||t-s|\|>|)>*\<psi\><rsub|n><around|(|s|)>*d*s
    </equation>

    Take Fourier transform:

    <\equation>
      \<cal-F\>*<around|{|T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>=S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    Consider the eigenvalue equation\ 

    <\equation>
      T<around*|[|*\<psi\><rsub|n>|]><around|(|t|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    . Fourier transforming this equation yields:

    <\equation>
      \<cal-F\>*<around|{|T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    From the previous Fourier transform equation and the eigenvalue equation:

    <\equation>
      S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    The unique solution satisfying these conditions is:

    <\equation>
      \<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*<sqrt|S<around|(|\<omega\>|)>>
    </equation>

    Therefore:

    <\equation>
      S<around|(|\<omega\>|)>\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*S<around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    Taking inverse Fourier transform:

    <\equation>
      T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|<around*|\||t-s|\|>|)>\<psi\><rsub|n><around*|(|t|)>\<mathd\>t=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>
  </proof>

  <section|Conclusion>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-cramerStochasticProcessTheoryContribution>Harald
      Cramér. <newblock>A contribution to the theory of stochastic processes.
      <newblock><with|font-shape|italic|Proceedings of the Second Berkeley
      Symposium on Mathematical Statistics and Probability>, 2:329\U339,
      1951.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
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
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|3|4>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|4>>
    <associate|sf|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramerStochasticProcessTheoryContribution
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>