<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|<strong|An Orthogonal Basis for the Bessel Functions
  of the First Kind of Orders 0 and 1>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The even-indexed orthonormalized Fourier
  transforms of the Chebyshev polynomials of the first kind form a basis in a
  reproducing-kernel Hilbert space for the Bessel function of the first kind
  <math|J<rsub|0>> and likewise for the odd-indexed functions which form a
  basis that reproduces <math|<wide|J|\<dot\>><rsub|0>=-J<rsub|1>>.
  Suprisingly, such a basis for these functions was not known to exist before
  this.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Type-I Chebyshev Polynomials <with|color|#503050|font-family|rm|<with|mode|math|T<rsub|n><around*|(|x|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>The Fourier Transforms
    <with|color|#503050|font-family|rm|<with|mode|math|<wide|T|^><rsub|n><around|(|y|)>>>
    of <with|color|#503050|font-family|rm|<with|mode|math|T<rsub|n><around*|(|x|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Orthogonalizing
    <with|color|#503050|font-family|rm|<with|mode|math|Y<rsup|><rsub|n><around|(|y|)>>>
    Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Riesz
    Representation Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Application to Legendre Polynomials
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Stationary
    Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Bulinskaya's Theorem:
    <with|color|#503050|font-family|rm|<with|mode|math|\<bbb-P\>*<around|[|X<around|(|s|)>=x\<cap\><wide|X|\<dot\>><around|(|s|)>=0|]>>>=0
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Gaussian Process <with|color|#503050|font-family|rm|<with|mode|math|Z<around*|(|x|)>>>
    Having Covariance Kernel <with|color|#503050|font-family|rm|<with|mode|math|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
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
    y> <rsub|2>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|1|2>-<frac|x|2>|)>*<rsub|>d*x>>|<row|<cell|>|<cell|=<with|font-base-size|12|<frac|i*|y>*><around*|(|e<rsup|-i
    y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
  </equation>

  where

  <\equation>
    F<rsub|n><rsup|\<pm\>><around*|(|y|)>=<rsub|3>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|\<pm\>i
    y|2>|)>
  </equation>

  The <math|L<rsup|2>> norm of <math|<wide|T|^><rsub|n><around|(|y|)>> is

  <\equation>
    <around*|\||<wide|T|^><rsub|n>|\|><rsub|>=<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|T|^><rsub|n><around|(|y|)><rsup|2>\<mathd\>y>=<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>
  </equation>

  then define the normalized Fourier transforms
  <math|Y<rsub|n><around*|(|y|)>> of <math|T<rsub|n><around*|(|x|)>> by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Y<rsub|n><around*|(|y|)>>|<cell|=<frac|<wide|T|^><rsub|n><around|(|y|)>|<around*|\||<wide|T|^><rsub|n>|\|>>>>|<row|<cell|>|<cell|>>|<row|<cell|>|<cell|=<frac|i*|y><around*|(|<frac|e<rsup|-i
    y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>|)>>>>>>
  </equation>

  \ <subsection|Orthogonalizing <math|Y<rsup|><rsub|n><around|(|y|)>> Via The
  Gram-Schmidt Process>

  Apply the Gram-Schmidt process to the normalized Fourier transforms of the
  Type <math|I> Chebyshev polynomials <math|Y<rsub|n><around*|(|y|)>> to get
  <math|Y<rsup|\<perp\>><rsub|n><around|(|y|)>> \ 

  <\equation>
    Y<rsup|\<perp\>><rsub|n><around|(|y|)>=Y<rsub|n><around*|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|Y<rsub|n><around*|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m><around|(|y|)>
  </equation>

  then the limits of <math|Y<rsup|\<perp\>><rsub|n><around|(|y|)>> at y=0 are
  equal to

  <\equation>
    lim<rsub|y\<rightarrow\>0> Y<rsup|\<perp\>><rsub|n><around|(|y|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|\<pi\>>>>|<cell|n=0>>|<row|<cell|0>|<cell|n\<neq\>0>>>>>
  </equation>

  Let

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|k,n>>|<cell|=*-<around*|(|-1|)><rsup|n+<choose|k|2>><around*|(|k-2n+1|)>!2<rsup|2n-1-k><choose|k+1|k-2n+1><choose|2k+2-2n|k+1>>>>>>
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<rsub|k,n>>|<cell|=<frac|<around*|(|-1|)><rsup|n+<choose|k|2>>*2<rsup|k-2*n>*<around*|(|k-n|)>!<choose|<frac|1|2>-n+k|k-2*n>|n!>>>>>>
  </equation>

  then defined the associated functions

  <\equation>
    \<Psi\><rsub|n><rsup|sin><around*|(|y|)>=<frac|sin<around*|(|y|)><sqrt|2n-1>|x<rsup|n><sqrt|\<pi\>>><big|sum><rsub|k=0><rsup|n-2>x<rsup|2k>A<rsub|k,n-2>
  </equation>

  and

  <\equation>
    \<Psi\><rsub|n><rsup|cos><around*|(|y|)>=<frac|cos<around*|(|y|)><sqrt|2n-1>|x<rsup|n><sqrt|\<pi\>>><big|sum><rsub|k=0><rsup|n-2>x<rsup|2k+1>B<rsub|k,n-2>
  </equation>

  then <math|Y<rsup|\<perp\>><rsub|n><around*|(|y|)>> can be expressed as

  <\equation>
    Y<rsup|\<perp\>><rsub|n>=<choice|<tformat|<table|<row|<cell|<frac|sin<around*|(|y|)>|y
    <sqrt|\<pi\>>>>|<cell|n=1>>|<row|<cell|\<Psi\><rsup|sin><rsub|n><around*|(|y|)>+\<Psi\><rsup|cos><rsub|n><around*|(|y|)>>|<cell|n\<gtr\>1>>>>>
  </equation>

  \;

  <big-table|<math|<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|5|5|cell-halign|c>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|7|7|cell-halign|c>|<cwith|1|-1|7|7|cell-rborder|0ln>|<table|<row|<cell|-3>|<cell|1>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|15>|<cell|-6>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|105>|<cell|-45>|<cell|1>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|-945>|<cell|420>|<cell|-15>|<cell|0>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|-10395>|<cell|4725>|<cell|-210>|<cell|1>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|135135>|<cell|-62370>|<cell|3150>|<cell|-28>|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|2027025>|<cell|-945945>|<cell|51975>|<cell|-630>|<cell|1>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|-34459425>|<cell|16216200>|<cell|-945945>|<cell|13860>|<cell|-45>|<cell|0>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|-654729075>|<cell|310134825>|<cell|-18918900>|<cell|315315>|<cell|-1485>|<cell|1>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|13749310575>|<cell|-6547290750>|<cell|413513100>|<cell|-7567560>|<cell|45045>|<cell|-66>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>|<cell|\<ldots\>>>>>>|]>>|The
  first 10 row-vectors of <label|A><math|A<rsub|k,n>> matrix>

  <section|Riesz Representation Theorem><label|riesz-representation-theorem><label|riesz-representation-theorem>

  The Riesz Representation Theorem serves as a key result in functional
  analysis, establishing a connection between linear functionals and measures
  or inner products, depending on the context. The theorem has multiple
  versions, and two notable ones are as follows:<label|riesz-representation-theorem-for-hilbert-spaces><label|riesz-representation-theorem-for-hilbert-spaces>

  <\theorem>
    <strong|Riesz Representation Theorem for Hilbert Spaces>

    Let <math|H> be a Hilbert space over <math|\<bbb-C\>> or
    <math|\<bbb-R\>>, and let <math|f:H\<rightarrow\>\<bbb-C\>> (or
    <math|f:H\<rightarrow\>\<bbb-R\>>) be a continuous linear functional.
    Then there exists a unique vector <math|y\<in\>H> such that for every
    <math|x\<in\>H>

    <\equation>
      f<around|(|x|)>=<around|\<langle\>|x,y|\<rangle\>>
    </equation>

    Here, <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> denotes
    the inner product in <math|H>.
  </theorem>

  <\theorem>
    <strong|Riesz Representation Theorem for Measures>

    Let <math|X> be a locally compact Hausdorff space, and let
    <math|C<rsub|c><around|(|X|)>> be the space of all continuous functions
    <math|f:X\<rightarrow\>\<bbb-C\>> (or <math|\<bbb-R\>>) with compact
    support. If <math|\<Lambda\>:C<rsub|c><around|(|X|)>\<rightarrow\>\<bbb-C\>>
    (or <math|\<bbb-R\>>) is a continuous linear functional, then there
    exists a unique regular complex Borel measure <math|\<mu\>> (or real
    Borel measure, depending on the field) on <math|X> such that

    <\equation>
      \<Lambda\><around|(|f|)>=<big|int><rsub|X>f*d*\<mu\>
    </equation>

    for all <math|f\<in\>C<rsub|c><around|(|X|)>>.
  </theorem>

  The Hilbert spaces version implies that every continuous linear functional
  can be represented using the inner product with a specific vector in that
  space and the measure version indicates that continuous linear functionals
  on <math|C<rsub|c><around|(|X|)>> can be represented as integrals against a
  unique measure.

  <subsection|Application to Legendre Polynomials>

  Considering the space <math|L<rsup|2><around|(|<around|[|-1,1|]>|)>> of
  Lebesgue square-integrable functions on the interval
  <math|<around|[|-1,1|]>> with the inner product defined as

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-1><rsup|1>f<around|(|x|)>*g<around|(|x|)>*<space|0.17em>d*x
  </equation>

  then it can be shown that the Legendre polynomials
  <math|P<rsub|n><around|(|x|)>> are orthogonal to this inner product:

  <\equation>
    <around|\<langle\>|P<rsub|m>,P<rsub|n>|\<rangle\>>=<big|int><rsub|-1><rsup|1>P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>*<space|0.17em>d*x=\<delta\><rsub|m*n>
  </equation>

  where <math|\<delta\><rsub|m*n>> is the Kronecker delta. Now, let's say we
  have a continuous linear functional <math|f:L<rsup|2><around|(|<around|[|-1,1|]>|)>\<to\>\<bbb-R\>>.
  By the Riesz Representation Theorem, there exists a unique
  <math|g\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>> such that

  <\equation>
    f<around|(|h|)>=<around|\<langle\>|h,g|\<rangle\>>
  </equation>

  for all <math|h\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>>. We can
  expand <math|g> in terms of the Legendre polynomials:

  <\equation>
    g<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*P<rsub|n><around|(|x|)>
  </equation>

  Then,

  <\equation>
    f<around|(|h|)>=<around|\<langle\>|h,g|\<rangle\>>=<around|\<langle\>|h,<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*P<rsub|n>|\<rangle\>>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*<around|\<langle\>|h,P<rsub|n>|\<rangle\>>
  </equation>

  Here, <math|a<rsub|n>> can be found as:

  <\equation>
    a<rsub|n>=<around|\<langle\>|g,P<rsub|n>|\<rangle\>>
  </equation>

  This can be seen as being equivalent to the application of the
  Karhunen-Loeve theorem

  <\theorem>
    <strong|The Karhunen-Loève theorem>

    Let <math|X<rsub|t>> be a zero-mean, square-integrable stochastic process
    with <hlink|autocovariance function|AutocovarianceFunction>
    <math|R<around|(|s,t|)>>. The Karhunen-Loève theorem states that there
    exists an orthonormal set of functions
    <math|<around|{|\<phi\><rsub|k><around|(|t|)>|}>> such that any random
    variable <math|X<rsub|t>> can be represented as an infinite series:

    <\equation>
      X<rsub|t>=<big|sum><rsub|k=1><rsup|\<infty\>>Z<rsub|k>*\<phi\><rsub|k><around|(|t|)>
    </equation>

    Here, the <math|Z<rsub|k>> are uncorrelated random variables defined by

    <\equation>
      Z<rsub|k>=<big|int>X<rsub|t>*\<phi\><rsub|k><around|(|t|)>*d*t
    </equation>

    \ and the functions <math|\<phi\><rsub|k><around|(|t|)>> are the
    eigenfunctions of the autocovariance function, which means that

    <\em>
      <\itemize-dot>
        <item>They satisfy the integral equation:

        <\equation>
          <big|int>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>
        </equation>

        where <math|\<lambda\><rsub|k>> are the eigenvalues of the
        autocovariance function and are always real and nonnegative.

        <item>The eigenfunctions are orthogonal, i.e.,

        <\equation>
          <big|int>\<phi\><rsub|k><around|(|t|)>*\<phi\><rsub|j><around|(|t|)>*d*t=\<delta\><rsub|k*j>
        </equation>

        where <math|\<delta\><rsub|k*j>> is the Kronecker delta function,
        which equals to 1 if <math|k=j> and 0 otherwise

        <item>The uncorrelated random variables <math|Z<rsub|k>> have zero
        mean and variances equal to the corresponding eigenvalues:

        <\equation>
          E<around|[|Z<rsub|k><rsup|2>|]>=\<lambda\><rsub|k><text|>
        </equation>

        and

        <\equation>
          E<around|[|Z<rsub|k>|]>=0<text|>
        </equation>
      </itemize-dot>
    </em>
  </theorem>

  <section|Stationary Gaussian Processes>

  <subsection|Bulinskaya's Theorem: <math|\<bbb-P\>*<around|[|X<around|(|s|)>=x\<cap\><wide|X|\<dot\>><around|(|s|)>=0|]>>=0>

  <\theorem>
    <strong|Bulinskaya's theorem on the non-tagency of level crossing
    functionals of continuously differentiable Gaussian processes>.

    Let <math|X=<around*|{|X<rsub|t>:0\<leqslant\>s\<leqslant\>t|}>> be an
    almost surely continuously differentiable stochastic process with
    <math|1>-dimensional density <math|p<rsub|s><around*|(|u|)>> bounded in
    the <math|u> variable <math|\<forall\>s>.
    \ <cite-detail|GaussianProcessLevelCrossings|Theorem 1.1>
  </theorem>

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
  regarding the number of zeros of <math|J<rsub|0>>. <cite|esgpz> The power
  spectral density of the process is given by the Fourier transform of the
  covariance kernel <math|r>

  <\equation*>
    <wide|\<rho\>|\<dot\>><around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-2\<pi\>i
    s t>r<around*|(|s,t|)>\<mathd\>s
  </equation*>

  and conversely the covariance kernel is the inverse Fourier transform of
  the spectral density

  <\equation>
    r<around*|(|h|)>=<big|int><rsub|-1><rsup|1>e<rsup|-\<lambda\>
    h>\<mathd\>\<rho\><around*|(|\<lambda\>|)>
  </equation>

  where <math|\<rho\><around*|(|s|)>> is the spectral distribution function

  <\equation>
    <big|int><rsub|-1><rsup|t><wide|\<rho\>|\<dot\>><around*|(|s|)>\<mathd\>s=<big|int><rsub|-1><rsup|t><frac|1|<sqrt|1-s<rsup|2>>>\<mathd\>s=<big|int><rsub|-1><rsup|t>\<mathd\>\<rho\><around*|(|s|)>=<frac|arcsin<around*|(|s|)>+<frac|\<pi\>|2>|\<pi\>>
  </equation>

  and when the integral is written with respect to the function
  <math|\<rho\><around*|(|s|)>> rather than <math|s> it symbolizes the
  Lebesgue-Stieltjes integral with respect to the spectral distribution
  function which is absolutely continuous in this case and therefore the
  spectral distribution is simply the integral
  <math|\<rho\><around*|(|t|)>=<big|int><wide|\<rho\>|\<dot\>><around*|(|t|)>>
  which is also sometimes called the integrated spectrum.
  <cite|yaglom1987correlation><cite|rao2014stochastic>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|5>
      <bibitem*|1><label|bib-ArfkenWeber2005>G.<nbsp>Arfken<localize| and
      >H.<nbsp>Weber. <newblock><with|font-shape|italic|Mathematical Methods
      for Physicists>. <newblock>Elsevier AP, Boston, 6th<localize| edition>,
      2005.<newblock>

      <bibitem*|2><label|bib-GaussianProcessLevelCrossings>Marie<nbsp>F.<nbsp>Kratz.
      <newblock>Level crossings and other level functionals of stationary
      Gaussian processes. <newblock><with|font-shape|italic|Probability
      Surveys>, 3:230\U288, 2006.<newblock>

      <bibitem*|3><label|bib-rao2014stochastic>M.M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes - Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer
      International Publishing, 2014.<newblock>

      <bibitem*|4><label|bib-yaglom1987correlation>A.M.<nbsp>Yaglom.
      <newblock><with|font-shape|italic|Correlation Theory of Stationary and
      Related Random Functions: Volume I: Basic Results>. <newblock>Applied
      Probability. Springer New York, 1987.<newblock>

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
    <associate|magnification|1.2>
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
    <associate|A|<tuple|1|3>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|30|6>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1|3>>
    <associate|auto-5|<tuple|2|3>>
    <associate|auto-6|<tuple|2.1|4>>
    <associate|auto-7|<tuple|3|5>>
    <associate|auto-8|<tuple|3.1|5>>
    <associate|auto-9|<tuple|4|6>>
    <associate|bib-ArfkenWeber2005|<tuple|1|6>>
    <associate|bib-GaussianProcessLevelCrossings|<tuple|2|6>>
    <associate|bib-esgpz|<tuple|5|6>>
    <associate|bib-rao2014stochastic|<tuple|3|6>>
    <associate|bib-yaglom1987correlation|<tuple|4|6>>
    <associate|riesz-representation-theorem|<tuple|2|3>>
    <associate|riesz-representation-theorem-for-hilbert-spaces|<tuple|2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ArfkenWeber2005

      GaussianProcessLevelCrossings

      GaussianProcessLevelCrossings

      esgpz

      yaglom1987correlation

      rao2014stochastic
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||The first 10
      row-vectors of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|A<rsub|k,n>>>
      matrix>|<pageref|auto-4>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Type-I Chebyshev Polynomials <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|T<rsub|n><around*|(|x|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Fourier Transforms
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|T|^><rsub|n><around|(|y|)>>>
      of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|T<rsub|n><around*|(|x|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Orthogonalizing
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Y<rsup|><rsub|n><around|(|y|)>>>
      Via The Gram-Schmidt Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Riesz
      Representation Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Application to Legendre
      Polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Stationary
      Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Bulinskaya's Theorem:
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<bbb-P\>*<around|[|X<around|(|s|)>=x\<cap\><wide|X|\<dot\>><around|(|s|)>=0|]>>>=0
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Gaussian Process <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|Z<around*|(|x|)>>>
      Having Covariance Kernel <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<pi\>J<rsub|0><around*|(|2\<pi\>t|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>