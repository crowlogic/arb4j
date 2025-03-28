<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Analysis of the Ornstein-Uhlenbeck Process on
  <math|\<bbb-R\>>>|<doc-date|>>

  <section|Covariance Function and Spectral Density>

  The covariance function of the Ornstein-Uhlenbeck (OU) process is given by:

  <\equation>
    C<around|(|x|)>=\<sigma\><rsup|2>*e<rsup|-\<alpha\><around|\||x|\|>>
  </equation>

  where <math|\<sigma\><rsup|2>> is the variance and <math|\<alpha\>\<gtr\>0>
  is the mean reversion rate.

  The spectral density <math|S<around|(|\<omega\>|)>> is the Fourier
  transform of <math|C<around|(|x|)>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<alpha\><around|\||x|\|>>*e<rsup|-i*\<omega\>*x>*d*x>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<around*|(|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<around|(|\<alpha\>+i*\<omega\>|)>*x>*d*x+<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<around|(|\<alpha\>-i*\<omega\>|)>*x>*d*x|)>>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<around*|[|<frac|1|\<alpha\>+i*\<omega\>>+<frac|1|\<alpha\>-i*\<omega\>>|]>>>|<row|<cell|>|<cell|=<frac|2*\<sigma\><rsup|2>*\<alpha\>|\<alpha\><rsup|2>+\<omega\><rsup|2>>>>>>>
  </equation>

  <section|Orthogonal Polynomials>

  The polynomials orthogonal with respect to the spectral density
  <math|S<around|(|\<omega\>|)>> are related to the Routh-Romanovski
  polynomials. Let <math|x=\<omega\>/\<alpha\>>, then the weight function
  becomes:

  <\equation>
    w<around|(|x|)>=<frac|1|1+x<rsup|2>>
  </equation>

  The Routh-Romanovski polynomials <math|R<rsub|n><around|(|x|)>> are defined
  by the recurrence relation:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|0><around|(|x|)>>|<cell|=1>>|<row|<cell|R<rsub|1><around|(|x|)>>|<cell|=x>>|<row|<cell|R<rsub|n+1><around|(|x|)>>|<cell|=x*R<rsub|n><around|(|x|)>-k<rsub|n>*R<rsub|n-1><around|(|x|)>*<space|1em><text|for
    >n\<geq\>1>>>>>
  </equation>

  where <math|k<rsub|n>> is a coefficient that can vary depending on the
  specific normalization used. In some sources, <math|k<rsub|n>=n<rsup|2>>,
  but this may differ.

  These polynomials satisfy the orthogonality relation:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|m><around|(|x|)>*R<rsub|n><around|(|x|)>*w<around|(|x|)>*d*x=h<rsub|n>*\<delta\><rsub|m*n>
  </equation>

  where <math|h<rsub|n>> is a normalization constant and
  <math|\<delta\><rsub|m*n>> is the Kronecker delta.

  The first few polynomials are:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|0><around|(|x|)>>|<cell|=1>>|<row|<cell|R<rsub|1><around|(|x|)>>|<cell|=x>>|<row|<cell|R<rsub|2><around|(|x|)>>|<cell|=x<rsup|2>-1>>|<row|<cell|R<rsub|3><around|(|x|)>>|<cell|=x<rsup|3>-3*x>>|<row|<cell|R<rsub|4><around|(|x|)>>|<cell|=x<rsup|4>-6*x<rsup|2>+3>>>>>
  </equation>

  The polynomials orthogonal with respect to <math|S<around|(|\<omega\>|)>>
  are:

  <\equation>
    P<rsub|n><around|(|\<omega\>|)>=R<rsub|n>*<around|(|\<omega\>/\<alpha\>|)>
  </equation>

  <section|Fourier Transforms of Orthogonal Polynomials>

  The Fourier transforms of the first few Routh-Romanovski polynomials are:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|r<rsub|0><around|(|t|)>>|<cell|=<sqrt|2*\<pi\>>*\<delta\><around|(|t|)>>>|<row|<cell|r<rsub|1><around|(|t|)>>|<cell|=i*<sqrt|2*\<pi\>/\<alpha\>>*<frac|d|d*t><around|[|e<rsup|-\<alpha\><around|\||t|\|>>|]>>>|<row|<cell|r<rsub|2><around|(|t|)>>|<cell|=-<sqrt|2*\<pi\>/\<alpha\><rsup|2>>*<frac|d<rsup|2>|d*t<rsup|2>><around|[|e<rsup|-\<alpha\><around|\||t|\|>>|]>-<sqrt|2*\<pi\>>*\<delta\><around|(|t|)>>>>>>
  </equation>

  where <math|\<delta\><around|(|t|)>> is the Dirac delta function.

  <section|Entropy Integral and Non-Compactness>

  To show that the covariance operator of the OU process is not compact on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>, we analyze the
  <math|\<epsilon\>>-entropy integral.

  The <math|\<epsilon\>>-covering number <math|N<around|(|\<epsilon\>|)>> is
  related to the spectral density:

  <\equation>
    N<around|(|\<epsilon\>|)>\<approx\><big|int><rsub|-\<infty\>><rsup|\<infty\>>max
    <around*|(|1,<sqrt|<frac|S<around|(|\<omega\>|)>|\<epsilon\><rsup|2>>>|)>*d*\<omega\>
  </equation>

  For large <math|\<omega\>>, <math|S<around|(|\<omega\>|)>\<sim\>2*\<sigma\><rsup|2>*\<alpha\>/\<omega\><rsup|2>>,
  so:

  <\equation>
    N<around|(|\<epsilon\>|)>\<approx\>2*<big|int><rsub|0><rsup|\<infty\>>max
    <around*|(|1,<frac|<sqrt|2*\<sigma\><rsup|2>*\<alpha\>>|\<epsilon\>*\<omega\>>|)>*d*\<omega\>
  </equation>

  Let <math|\<omega\><rsub|\<epsilon\>>=<sqrt|2*\<sigma\><rsup|2>*\<alpha\>>/\<epsilon\>>.
  Then:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|N<around|(|\<epsilon\>|)>>|<cell|\<approx\>2*<around*|[|\<omega\><rsub|\<epsilon\>>+<big|int><rsub|\<omega\><rsub|\<epsilon\>>><rsup|\<infty\>><frac|<sqrt|2*\<sigma\><rsup|2>*\<alpha\>>|\<epsilon\>*\<omega\>>*d*\<omega\>|]>>>|<row|<cell|>|<cell|=2*<around*|[|<frac|<sqrt|2*\<sigma\><rsup|2>*\<alpha\>>|\<epsilon\>>+<frac|<sqrt|2*\<sigma\><rsup|2>*\<alpha\>>|\<epsilon\>>*log
    <around*|(|<frac|\<infty\>|\<omega\><rsub|\<epsilon\>>>|)>|]>>>|<row|<cell|>|<cell|\<approx\><frac|C|\<epsilon\>>*log
    <around*|(|<frac|1|\<epsilon\>>|)>>>>>>
  </equation>

  where <math|C> is a constant depending on <math|\<sigma\>> and
  <math|\<alpha\>>.

  The <math|\<epsilon\>>-entropy <math|H<around|(|\<epsilon\>|)>> is defined
  as <math|log <around|(|N<around|(|\<epsilon\>|)>|)>>, so:

  <\equation>
    H<around|(|\<epsilon\>|)>\<approx\>log
    <around*|(|<frac|C|\<epsilon\>>|)>+log <around*|(|log
    <around*|(|<frac|1|\<epsilon\>>|)>|)>
  </equation>

  The entropy integral is:

  <\equation>
    <big|int><rsub|0><rsup|1>H<around|(|\<epsilon\>|)>*d*\<epsilon\>\<approx\><big|int><rsub|0><rsup|1><around*|[|log
    <around*|(|<frac|C|\<epsilon\>>|)>+log <around*|(|log
    <around*|(|<frac|1|\<epsilon\>>|)>|)>|]>*d*\<epsilon\>
  </equation>

  The second term causes the divergence. Using the change of variable
  <math|u=log <around|(|1/\<epsilon\>|)>>:

  <\equation>
    <big|int><rsub|0><rsup|1>log <around*|(|log
    <around*|(|<frac|1|\<epsilon\>>|)>|)>*d*\<epsilon\>=<big|int><rsub|0><rsup|\<infty\>>log
    <around|(|u|)>*e<rsup|-u>*d*u=\<infty\>
  </equation>

  Therefore:

  <\equation>
    <big|int><rsub|0><rsup|1>H<around|(|\<epsilon\>|)>*d*\<epsilon\>=\<infty\>
  </equation>

  This divergence of the entropy integral demonstrates that the covariance
  operator of the OU process is not compact on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Covariance
      Function and Spectral Density> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Orthogonal
      Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Fourier
      Transforms of Orthogonal Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Entropy
      Integral and Non-Compactness> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>