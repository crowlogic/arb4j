<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|<strong|Orthogonalization of the Fourier Transforms of
  the First-Kind Chebyshev Polynomials and an Associated Gaussian
  Process>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The normalized Fourier transforms of the Chebyshev
  polynomials of the first kind are <math|\<#2083\>F\<#2081\>> hypergeometric
  functions whose even-indexed functions converge to the Bessel function of
  the first kind <math|J<rsub|0>> and whose odd-indexed functions converge to
  <math|<wide|J|\<dot\>><rsub|0>=-J<rsub|1>>.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    First-Kind Chebyshev Polynomials <with|color|#503050|font-family|rm|<with|mode|math|T<rsub|n><around*|(|x|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>The Fourier Transforms
    <with|color|#503050|font-family|rm|<with|mode|math|<wide|T|^><rsub|n><around|(|y|)>>>
    of <with|color|#503050|font-family|rm|<with|mode|math|T<rsub|n><around*|(|x|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>The Orthogonalization
    <with|color|#503050|font-family|rm|<with|mode|math|<wide|T|\<breve\>><rsub|n><around|(|y|)>>>
    of <with|color|#503050|font-family|rm|<with|mode|math|<wide|T|^><rsub|n><around|(|y|)>>>
    Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Gaussian Process <with|color|#503050|font-family|rm|<with|mode|math|Z<around*|(|x|)>>>
    Having Covariance Kernel <with|color|#503050|font-family|rm|<with|mode|math|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|The First-Kind Chebyshev Polynomials
  <math|T<rsub|n><around*|(|x|)>>>

  Let <math|T<rsub|n>> be the Chebyshev polynomials of the first
  kind<cite-detail|ArfkenWeber2005|(13.140)>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|T<rsub|n><around*|(|x|)>>|<cell|=<rsub|>\<#2082\>F\<#2081\><around*|(|<around*|[|n,-n|]>,<around*|[|<frac|1|2>|]>,<frac|1|2>-<frac|x|2>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<wide|T|^><rsub|n><around|(|y|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><rsub|><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*y
    z>*T<rsub|n><around|(|z|)>d*z d*y>>>>>
  </equation>

  where <math|\<#2082\>F\<#2081\>> is the (Gauss) hypergeometric function.\ 

  <subsection|The Fourier Transforms <math|<wide|T|^><rsub|n><around|(|y|)>>
  of <math|T<rsub|n><around*|(|x|)>>>

  The functions <math|<wide|T|^><rsub|n><around|(|y|)>> are Fourier
  transforms <math|>of <math|T<rsub|n><around*|(|x|)>> defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*<rsub|>\<#2082\>F\<#2081\><around*|(|<around*|[|n,-n|]>,<around*|[|<frac|1|2>|]>,<frac|1|2>-<frac|x|2>|)>d*x>>|<row|<cell|>|<cell|=<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
  </equation>

  where

  <\equation>
    F<rsub|m><rsup|\<pm\>><around*|(|y|)>=\<#2083\>F\<#2081\>
    <space|-0.17em><around*|(|<around|[|1,m,-m|]>,<around*|[|<frac|1|2>|]>,<frac|<math-up|<math|\<pm\>>>i
    y|2*>|)>
  </equation>

  <subsection|The Orthogonalization <math|<wide|T|\<breve\>><rsub|n><around|(|y|)>>
  of <math|<wide|T|^><rsub|n><around|(|y|)>> Via The Gram-Schmidt Process>

  \;

  Apply the Gram-Schmidt process to <math|<wide|T<rsub|n>|^>> to get
  <math|<wide|T|\<breve\>><rsub|n>> then the limits of the orthogonalized
  Fourier transforms <math|<wide|T|\<breve\>><rsub|n><around|(|y|)>> at y=0
  are given

  <\equation>
    lim<rsub|y\<rightarrow\>0> <wide|T|\<breve\>><rsub|n><around|(|y|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|\<pi\>>>>|<cell|n=0>>|<row|<cell|0>|<cell|n\<neq\>0>>>>>
  </equation>

  <section|The Gaussian Process <math|Z<around*|(|x|)>> Having Covariance
  Kernel <math|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>

  Consider a zero-mean Gaussian process <math|Z<around|(|t|)>> with
  covariance function given by

  <\equation>
    r<around*|(|<around*|\||t-s|\|>|)>=\<bbb-E\><around*|[|Z<around*|(|t|)>Z<around*|(|s|)>|]>=\<pi\>
    J<rsub|0><around*|(|2\<pi\><around*|\||t-s|\|>|)>
  </equation>

  where <math|E> denotes expectation. For a stationary zero-mean Gaussian
  process, Rice's formula<cite-detail|GaussianProcessLevelCrossings|Theorem
  2.2> provides an expression for the expected number of zeros in a certain
  interval. For <math|Z<around|(|t|)>> with derivative
  <math|Z<rprime|'><around|(|t|)>> and given that <math|Z<around|(|t|)>> and
  <math|Z<rprime|'><around|(|t|)>> are jointly Gaussian, the expected number
  of zeros in the interval <math|<around|[|0,R|]>> is given by:

  <\equation>
    \<bbb-E\><around*|[|N<around*|(|R|)>|]>=R
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||<wide|r<around*|(|t|)>|\<dot\>>|\|>\<phi\><around*|(|r<around*|(|t|)>|)>\<mathd\>t
  </equation>

  where <math|\<phi\>> is the standard Gaussian density function and
  <math|r<around*|(|t|)>> is the normalized covariance function. Now compare
  the result from the Gaussian process approach with the known result
  regarding the number of zeros of <math|J<rsub|0>>. <cite|esgpz>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|3>
      <bibitem*|1><label|bib-ArfkenWeber2005>G.<nbsp>Arfken<localize| and
      >H.<nbsp>Weber. <newblock><with|font-shape|italic|Mathematical Methods
      for Physicists>. <newblock>Elsevier AP, Boston, 6th<localize| edition>,
      2005.<newblock>

      <bibitem*|2><label|bib-GaussianProcessLevelCrossings>Marie<nbsp>F.<nbsp>Kratz.
      <newblock>Level crossings and other level functionals of stationary
      Gaussian processes. <newblock><with|font-shape|italic|Probability
      Surveys>, 3:230\U288, 2006.<newblock>

      <bibitem*|3><label|bib-esgpz>N.<nbsp>Donald Ylvisaker. <newblock>The
      Expected Number of Zeros of a Stationary Gaussian Process.
      <newblock><with|font-shape|italic|The Annals of Mathematical
      Statistics>, 36(3):1043\U1046, 1965.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-even-footer|>
    <associate|page-even-header|>
    <associate|page-height|auto>
    <associate|page-medium|papyrus>
    <associate|page-odd-footer|>
    <associate|page-odd-header|>
    <associate|page-orientation|portrait>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|2>>
    <associate|auto-5|<tuple|6|2>>
    <associate|bib-ArfkenWeber2005|<tuple|1|2>>
    <associate|bib-GaussianProcessLevelCrossings|<tuple|2|?>>
    <associate|bib-esgpz|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ArfkenWeber2005

      GaussianProcessLevelCrossings

      esgpz
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      First-Kind Chebyshev Polynomials <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|T<rsub|n><around*|(|x|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Fourier Transforms
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|T|^><rsub|n><around|(|y|)>>>
      of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|T<rsub|n><around*|(|x|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Orthogonalization
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|T|\<breve\>><rsub|n><around|(|y|)>>>
      of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|T|^><rsub|n><around|(|y|)>>>
      Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Gaussian Process <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Z<around*|(|x|)>>>
      Having Covariance Kernel <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>