<TeXmacs|2.1.4>

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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
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

  For a proof see <cite|finiteFourierTransformsOfClassicalOrthogonalPolynomials>.
  It just so happens to be that <math|Y<rsub|n><around*|(|y|)>> enumerates
  the elements of the kernel of the integral covariance operator, aka its
  null space, defined by

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around*|(|y|)>Y<rsub|n><around*|(|y|)>\<mathd\>y=\<delta\><rsub|n,0>=<choice|<tformat|<table|<row|<cell|1>|<cell|n=0>>|<row|<cell|0>|<cell|n\<neq\>0>>>>>
  </equation>

  where <math|\<delta\><rsub|n,0>> is the Kronecker delta function which
  takes the value 1 when its arguments are equal and 0 when they are not.

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

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-ArfkenWeber2005>G.<nbsp>Arfken<localize| and
      >H.<nbsp>Weber. <newblock><with|font-shape|italic|Mathematical Methods
      for Physicists>. <newblock>Elsevier AP, Boston, 6th<localize| edition>,
      2005.<newblock>

      <bibitem*|2><label|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials>Atul
      Dixit, Lin Jiu, Victor<nbsp>H Moll<localize|, and >Christophe Vignat.
      <newblock>The finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>
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
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1|3>>
    <associate|auto-5|<tuple|1|3>>
    <associate|bib-ArfkenWeber2005|<tuple|1|6>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ArfkenWeber2005

      finiteFourierTransformsOfClassicalOrthogonalPolynomials
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>