<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Factorization For Stationary Gaussian
  Processes and RKHS Expansions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\theorem>
    <strong|[Spectral Factorization]> Let <math|K<around|(|t,s|)>> be a
    positive definite stationary kernel. Then there exists a spectral density
    <math|S<around|(|\<omega\>|)>> and spectral factor:

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
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
      =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>=K*<around|(|t-s|)>
    </equation>

    \;
  </proof>

  <\lemma>
    <strong|[Convolution Properties] >For any orthonormal basis
    <math|<around|{|e<rsub|i>|}>> of <math|L<rsup|2><around|(|\<bbb-R\>|)>>,
    define:

    <\equation>
      h<rsub|i><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|e<rsub|i><around|(|\<tau\>|)>|\<bar\>>d*\<tau\>
    </equation>

    Then:

    <\equation>
      <around|\<langle\>|h<rsub|i>,h<rsub|j>|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|\<tau\><rsub|1>-\<tau\><rsub|2>|)><wide|e<rsub|i><around|(|\<tau\><rsub|1>|)>|\<bar\>>e<rsub|j><around|(|\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2>
    </equation>
  </lemma>

  <\proof>
    1. Expand the inner product:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|h<rsub|i>,h<rsub|j>|\<rangle\>>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|i><around|(|t|)><wide|h<rsub|j><around|(|t|)>|\<bar\>>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\><rsub|1>|)><wide|h*<around|(|t+\<tau\><rsub|2>|)>|\<bar\>><wide|e<rsub|i><around|(|\<tau\><rsub|1>|)>|\<bar\>>e<rsub|j><around|(|\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2>*d*t>>>>>
    </equation>

    2. Change variables <math|u=t+\<tau\><rsub|1>>:

    <\equation>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|u|)><wide|h*<around|(|u-\<tau\><rsub|1>+\<tau\><rsub|2>|)>|\<bar\>><wide|e<rsub|i><around|(|\<tau\><rsub|1>|)>|\<bar\>>e<rsub|j><around|(|\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2>*d*u
    </equation>

    3. The inner integral gives <math|K*<around|(|\<tau\><rsub|1>-\<tau\><rsub|2>|)>>
    by definition of <math|h>:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|\<tau\><rsub|1>-\<tau\><rsub|2>|)><wide|e<rsub|i><around|(|\<tau\><rsub|1>|)>|\<bar\>>e<rsub|j><around|(|\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2>
    </equation*>
  </proof>

  <\proposition>
    <strong|[Orthonormal Basis Construction>] The normalized functions:

    <\equation>
      \<psi\><rsub|i><around|(|t|)>=<frac|h<rsub|i><around|(|t|)>|<sqrt|<around|\||h<rsub|i>|\|><rsup|2>>>
    </equation>

    form an orthonormal basis for the RKHS <math|\<cal-H\>>.
  </proposition>

  <\proof>
    1. First verify orthonormality. For any <math|i,j>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>>>|<cell|=<around*|\<langle\>|<frac|h<rsub|i>|<sqrt|<around|\||h<rsub|i>|\|><rsup|2>>>,<frac|h<rsub|j>|<sqrt|<around|\||h<rsub|j>|\|><rsup|2>>>|\<rangle\>>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|<around|\||h<rsub|i>|\|><rsup|2><around|\||h<rsub|j>|\|><rsup|2>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|i><around|(|t|)><wide|h<rsub|j><around|(|t|)>|\<bar\>>d*t>>|<row|<cell|>|<cell|=<frac|<around|\<langle\>|h<rsub|i>,h<rsub|j>|\<rangle\>>|<sqrt|<around|\||h<rsub|i>|\|><rsup|2><around|\||h<rsub|j>|\|><rsup|2>>>=\<delta\><rsub|i*j>>>>>>
    </equation>

    2. For completeness, show any <math|f\<in\>\<cal-H\>> can be expanded:

    <\equation>
      f<around|(|t|)>=<big|sum><rsub|i><around|\<langle\>|f,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|t|)>
    </equation>

    3. This follows from completeness of <math|<around|{|e<rsub|i>|}>> in
    <math|L<rsup|2>> and the fact that <math|h> maps <math|L<rsup|2>> to
    <math|\<cal-H\>>.
  </proof>

  <\theorem>
    <label|ke><strong|[Kernel Expansion]> The kernel has the expansion:

    <\equation>
      K<around|(|t,s|)>=<big|sum><rsub|i>h<rsub|i><around|(|t|)>*h<rsub|i><around|(|s|)>
    </equation>

    which converges in the RKHS norm.
  </theorem>

  <\proof>
    1. Start with normalized basis expansion:

    <\equation>
      K<around|(|t,s|)>=<big|sum><rsub|i><around|\||h<rsub|i>|\|><rsup|2>*\<psi\><rsub|i><around|(|t|)>*\<psi\><rsub|i><around|(|s|)>
    </equation>

    2. Substitute normalized basis functions:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|>|<cell|=<big|sum><rsub|i><around|\||h<rsub|i>|\|><rsup|2><frac|h<rsub|i><around|(|t|)>|<sqrt|<around|\||h<rsub|i>|\|><rsup|2>>>*<frac|h<rsub|i><around|(|s|)>|<sqrt|<around|\||h<rsub|i>|\|><rsup|2>>>>>|<row|<cell|>|<cell|=<big|sum><rsub|i>h<rsub|i><around|(|t|)>*h<rsub|i><around|(|s|)>>>>>>
    </equation>

    3. Expand using convolution definition:

    <\equation>
      =<big|sum><rsub|i><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\><rsub|1>|)>*h*<around|(|s+\<tau\><rsub|2>|)><wide|e<rsub|i><around|(|\<tau\><rsub|1>|)>|\<bar\>>e<rsub|i><around|(|\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2>
    </equation>

    4. By completeness of <math|<around|{|e<rsub|i>|}>>:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>=K<around|(|t,s|)>
    </equation*>
  </proof>

  <\corollary>
    <strong|[Basis Independence]> The kernel expansion is independent of the
    choice of orthonormal basis <math|<around|{|e<rsub|i>|}>>.
  </corollary>

  <\proof>
    Let <math|<around|{|e<rsub|i>|}>> and <math|<around|{|f<rsub|i>|}>> be
    two orthonormal bases of <math|L<rsup|2><around|(|\<bbb-R\>|)>>. The
    expansions:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|K<around|(|t,s|)>>|<cell|=<big|sum><rsub|i>h<rsub|i><rsup|e><around|(|t|)>*h<rsub|i><rsup|e><around|(|s|)>>>|<row|<cell|K<around|(|t,s|)>>|<cell|=<big|sum><rsub|i>h<rsub|i><rsup|f><around|(|t|)>*h<rsub|i><rsup|f><around|(|s|)>>>>>>
    </equation>

    where superscripts indicate the basis used, must be equal as they both
    equal:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>
    </equation>

    by the Kernel Expansion Theorem, <reference|ke>.
  </proof>

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
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|ke|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramerStochasticProcessTheoryContribution
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>