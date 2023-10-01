<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|<strong|Orthogonalization of the Fourier Transforms of
  the First-Kind Chebyshev Polynomials and an Associated Gaussian
  Process>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The even-indexed orthonormalized Fourier
  transforms of the Chebyshev polynomials of the first kind forms a basis in
  a reproducing-kernel Hilbert space for the Bessel function of the first
  kind <math|J<rsub|0>> and likewise for the odd-indexed functions which
  reproduce <math|<wide|J|\<dot\>><rsub|0>=-J<rsub|1>>.>>

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
    <with|color|#503050|font-family|rm|<with|mode|math|<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>>>
    of <with|color|#503050|font-family|rm|<with|mode|math|<above|<wide|T|^>|><rsub|n><around|(|y|)>>>
    Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc>The Bessel Polynomials
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Gaussian Process <with|color|#503050|font-family|rm|<with|mode|math|Z<around*|(|x|)>>>
    Having Covariance Kernel <with|color|#503050|font-family|rm|<with|mode|math|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|The Type-I Chebyshev Polynomials <math|T<rsub|n><around*|(|x|)>>>

  Let <math|T<rsub|n>> be the Chebyshev polynomials of the first kind, also
  said to be of Type-I, defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|T<rsub|n><around*|(|x|)>>|<cell|=<rsub|2>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|1|2>-<frac|x|2>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<wide|T|^><rsub|n><around|(|y|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><rsub|><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*y
    z>*T<rsub|n><around|(|z|)>d*z d*y>>>>>
  </equation>

  where <math|<rsub|2>F<rsub|1>> is the (Gauss) hypergeometric function.
  <cite-detail|ArfkenWeber2005|(13.140)>

  <subsection|The Fourier Transforms <math|<wide|T|^><rsub|n><around|(|y|)>>
  of <math|T<rsub|n><around*|(|x|)>>>

  The functions <math|<wide|T|^><rsub|n><around|(|y|)>> are Fourier
  transforms <math|>of <math|T<rsub|n><around*|(|x|)>> defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y> <rsub|2>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|1|2>-<frac|x|2>|)>*<rsub|>d*x>>|<row|<cell|>|<cell|=<with|font-base-size|12|<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>>
  </equation>

  where

  <\equation>
    F<rsub|n><rsup|\<pm\>><around*|(|y|)>=<rsub|3>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|\<pm\>i
    y|2>|)>
  </equation>

  <subsection|The Orthogonalization <math|<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>>
  of <math|<above|<wide|T|^>|><rsub|n><around|(|y|)>> Via The Gram-Schmidt
  Process>

  Apply the Gram-Schmidt process to the Fourier transformed Type <math|I>
  Chebyshev polynomials <math|<above|<wide|T|^>|><rsub|n><around|(|y|)>> to
  get <math|<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>> \ 

  <\equation>
    <wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>=<wide|T|^><rsub|n><around*|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|<wide|T|^><rsub|n><around*|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>
  </equation>

  then the limits of the orthogonalized Fourier transforms
  <math|<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>> at y=0 are given

  <\equation>
    lim<rsub|y\<rightarrow\>0> <wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|\<pi\>>>>|<cell|n=0>>|<row|<cell|0>|<cell|n\<neq\>0>>>>>
  </equation>

  and it is here that the Bessel polynomials appear.
  <cite|SingularOrthoPoly1>

  <subsubsection|The Bessel Polynomials>

  \;

  <text-dots><cite|burchnall_1951>

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
    <\bib-list|5>
      <bibitem*|1><label|bib-ArfkenWeber2005>G.<nbsp>Arfken<localize| and
      >H.<nbsp>Weber. <newblock><with|font-shape|italic|Mathematical Methods
      for Physicists>. <newblock>Elsevier AP, Boston, 6th<localize| edition>,
      2005.<newblock>

      <bibitem*|2><label|bib-burchnall_1951>J.<nbsp>L.<nbsp>Burchnall.
      <newblock>The bessel polynomials. <newblock><with|font-shape|italic|Canadian
      Journal of Mathematics>, 3:62\U68, 1951.<newblock>

      <bibitem*|3><label|bib-GaussianProcessLevelCrossings>Marie<nbsp>F.<nbsp>Kratz.
      <newblock>Level crossings and other level functionals of stationary
      Gaussian processes. <newblock><with|font-shape|italic|Probability
      Surveys>, 3:230\U288, 2006.<newblock>

      <bibitem*|4><label|bib-SingularOrthoPoly1>Lance<nbsp>L.<nbsp>Littlejohn<localize|
      and >Allan<nbsp>M.<nbsp>Krall. <newblock>Orthogonal polynomials and
      singular sturm-liouville systems, i.
      <newblock><with|font-shape|italic|The Rocky Mountain Journal of
      Mathematics>, 16(3):435\U479, 1986.<newblock>

      <bibitem*|5><label|bib-esgpz>N.<nbsp>Donald Ylvisaker. <newblock>The
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
    <associate|auto-4|<tuple|1.2.1|2>>
    <associate|auto-5|<tuple|2|2>>
    <associate|auto-6|<tuple|7|2>>
    <associate|bib-ArfkenWeber2005|<tuple|1|2>>
    <associate|bib-GaussianProcessLevelCrossings|<tuple|3|2>>
    <associate|bib-SingularOrthoPoly1|<tuple|4|2>>
    <associate|bib-burchnall_1951|<tuple|2|2>>
    <associate|bib-esgpz|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ArfkenWeber2005

      SingularOrthoPoly1

      burchnall_1951

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
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>>>
      of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<above|<wide|T|^>|><rsub|n><around|(|y|)>>>
      Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>The Bessel Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Gaussian Process <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Z<around*|(|x|)>>>
      Having Covariance Kernel <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>