<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Birch and Swinnerton-Dyer Conjecture On The Rank
  Of Elliptic Curves Over Rational Numbers>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Birch and Swinnerton-Dyer Conjecture>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Foundational Definitions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>L-Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>The Conjecture
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Connection to Square-Free Numbers
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>
  </table-of-contents>

  <section|The Birch and Swinnerton-Dyer Conjecture>

  The Birch and Swinnerton-Dyer conjecture is fundamentally about elliptic
  curves over the rational numbers and specifically about understanding when
  these curves have infinitely many rational solutions versus only finitely
  many.

  <subsection|Foundational Definitions>

  <\definition>
    The integers <math|\<bbb-Z\>> are the set
    <math|<around|{|\<ldots\>,-2,-1,0,1,2,\<ldots\>|}>>.
  </definition>

  <\definition>
    The rational numbers <math|\<bbb-Q\>> are the set
    <math|<around|{|p/q:p,q\<in\>\<bbb-Z\>,q\<neq\>0|}>>.
  </definition>

  <\definition>
    A monomial in variables <math|x<rsub|1>,\<ldots\>,x<rsub|n>> is an
    expression of the form <math|x<rsub|1><rsup|a<rsub|1>>*x<rsub|2><rsup|a<rsub|2>>*\<cdots\>*x<rsub|n><rsup|a<rsub|n>>>
    where each <math|a<rsub|i>\<geq\>0> is a nonnegative integer.
  </definition>

  <\definition>
    The degree of a monomial <math|x<rsub|1><rsup|a<rsub|1>>*x<rsub|2><rsup|a<rsub|2>>*\<cdots\>*x<rsub|n><rsup|a<rsub|n>>>
    is the sum <math|a<rsub|1>+a<rsub|2>+\<cdots\>+a<rsub|n>>.
  </definition>

  <\definition>
    A polynomial in variables <math|x<rsub|1>,\<ldots\>,x<rsub|n>> with
    coefficients in <math|\<bbb-Q\>> is a finite linear combination of
    monomials: <math|f<around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=<big|sum>c<rsub|<math-bf|a>>*x<rsub|1><rsup|a<rsub|1>>*\<cdots\>*x<rsub|n><rsup|a<rsub|n>>>
    where <math|c<rsub|<math-bf|a>>\<in\>\<bbb-Q\>> and only finitely many
    <math|c<rsub|<math-bf|a>>> are nonzero.
  </definition>

  <\definition>
    A homogeneous polynomial of degree <math|d> in variables
    <math|x<rsub|1>,\<ldots\>,x<rsub|n>> is a polynomial <math|f> such that
    every monomial term in <math|f> has total degree <math|d>. That is, if
    <math|f=<big|sum>c<rsub|<math-bf|a>>*x<rsub|1><rsup|a<rsub|1>>*\<cdots\>*x<rsub|n><rsup|a<rsub|n>>>
    where <math|c<rsub|<math-bf|a>>\<neq\>0>, then
    <math|a<rsub|1>+\<cdots\>+a<rsub|n>=d> for all such terms.
  </definition>

  <\definition>
    The projective plane <math|\<bbb-P\><rsup|2><around|(|\<bbb-Q\>|)>> over
    <math|\<bbb-Q\>> consists of equivalence classes
    <math|<around|[|x:y:z|]>> where <math|<around|(|x,y,z|)>\<in\>\<bbb-Q\><rsup|3>\<setminus\><around|{|<around|(|0,0,0|)>|}>>
    and <math|<around|(|x,y,z|)>\<sim\><around|(|\<lambda\>*x,\<lambda\>*y,\<lambda\>*z|)>>
    for any nonzero <math|\<lambda\>\<in\>\<bbb-Q\>>.
  </definition>

  <\definition>
    A projective curve <math|C> in <math|\<bbb-P\><rsup|2><around|(|\<bbb-Q\>|)>>
    is the set <math|C=<around|{|<around|[|x:y:z|]>\<in\>\<bbb-P\><rsup|2><around|(|\<bbb-Q\>|)>:F<around|(|x,y,z|)>=0|}>>
    where <math|F<around|(|x,y,z|)>> is a homogeneous polynomial with
    coefficients in <math|\<bbb-Q\>>.
  </definition>

  <\definition>
    The partial derivative of a polynomial <math|F<around|(|x,y,z|)>> with
    respect to <math|x> is the polynomial
    <math|<frac|\<partial\>*F|\<partial\>*x>> obtained by differentiating
    each term: if <math|F=<big|sum>c<rsub|i*j*k>*x<rsup|i>*y<rsup|j>*z<rsup|k>>,
    then <math|<frac|\<partial\>*F|\<partial\>*x>=<big|sum>i\<cdot\>c<rsub|i*j*k>*x<rsup|i-1>*y<rsup|j>*z<rsup|k>>.
  </definition>

  <\definition>
    A point <math|P=<around|[|a:b:c|]>> on a projective curve <math|C>
    defined by <math|F<around|(|x,y,z|)>=0> is singular if all three partial
    derivatives vanish at <math|P>:

    <\equation*>
      <frac|\<partial\>*F|\<partial\>*x>*<around|(|a,b,c|)>=<frac|\<partial\>*F|\<partial\>*y>*<around|(|a,b,c|)>=<frac|\<partial\>*F|\<partial\>*z>*<around|(|a,b,c|)>=0
    </equation*>
  </definition>

  <\definition>
    A projective curve is non-singular (or smooth) if it contains no singular
    points.
  </definition>

  <\definition>
    The genus of a non-singular projective curve defined by a homogeneous
    polynomial of degree <math|d> is <math|g=<frac|<around|(|d-1|)>*<around|(|d-2|)>|2>>.
  </definition>

  <\definition>
    An elliptic curve over <math|\<bbb-Q\>> is a non-singular projective
    curve of genus 1 equipped with a specified rational point. It can be
    written in Weierstrass form as:

    <\equation*>
      E:y<rsup|2>*z=x<rsup|3>+a*x*z<rsup|2>+b*z<rsup|3>
    </equation*>

    where <math|a,b\<in\>\<bbb-Q\>> and the discriminant
    <math|\<Delta\>=-16*<around|(|4*a<rsup|3>+27*b<rsup|2>|)>\<neq\>0>.
  </definition>

  <\definition>
    The point at infinity on an elliptic curve in Weierstrass form is
    <math|O=<around|[|0:1:0|]>>.
  </definition>

  <\definition>
    An abelian group is a set <math|G> with an operation
    <math|+:G\<times\>G\<to\>G> such that:

    <\enumerate>
      <item>(Associativity) <math|<around|(|a+b|)>+c=a+<around|(|b+c|)>> for
      all <math|a,b,c\<in\>G>

      <item>(Identity) There exists <math|0\<in\>G> such that
      <math|a+0=0+a=a> for all <math|a\<in\>G>

      <item>(Inverse) For each <math|a\<in\>G>, there exists <math|-a\<in\>G>
      such that <math|a+<around|(|-a|)>=0>

      <item>(Commutativity) <math|a+b=b+a> for all <math|a,b\<in\>G>
    </enumerate>
  </definition>

  <\definition>
    The set <math|E<around|(|\<bbb-Q\>|)>> of rational points on an elliptic
    curve <math|E> forms an abelian group under the chord-and-tangent law
    with identity element <math|O> and group operation defined as follows:
    For distinct points <math|P=<around|[|x<rsub|1>:y<rsub|1>:1|]>,Q=<around|[|x<rsub|2>:y<rsub|2>:1|]>\<in\>E<around|(|\<bbb-Q\>|)>>
    with <math|P,Q\<neq\>O>:

    <\enumerate>
      <item>If <math|x<rsub|1>\<neq\>x<rsub|2>>, let <math|\<ell\>> be the
      line through <math|P> and <math|Q>. This line intersects <math|E> at
      exactly three points: <math|P>, <math|Q>, and a third point <math|R>.
      Define <math|P+Q> to be the point such that <math|P+Q+R=O> under the
      group law.

      <item>If <math|x<rsub|1>=x<rsub|2>> and <math|y<rsub|1>=-y<rsub|2>>,
      then <math|P+Q=O>.

      <item>If <math|P=Q> and <math|y<rsub|1>\<neq\>0>, let <math|\<ell\>> be
      the tangent line to <math|E> at <math|P>. This intersects <math|E> at
      <math|P> (with multiplicity 2) and one other point <math|R>. Define
      <math|2*P> such that <math|2*P+R=O>.

      <item>For any <math|P\<in\>E<around|(|\<bbb-Q\>|)>>: <math|P+O=O+P=P>.
    </enumerate>
  </definition>

  <\definition>
    The rank of an abelian group <math|G> is the dimension of
    <math|G\<otimes\>\<bbb-Q\>> as a <math|\<bbb-Q\>>-vector space.
  </definition>

  <\definition>
    A square-free integer is an integer <math|n> such that no perfect square
    other than 1 divides <math|n>.
  </definition>

  <subsection|L-Functions>

  <\definition>
    Let <math|\<bbb-F\><rsub|p>> denote the field with <math|p> elements,
    where <math|p> is prime.
  </definition>

  <\definition>
    An elliptic curve <math|E> over <math|\<bbb-Q\>> has good reduction at a
    prime <math|p> if the curve obtained by reducing the coefficients of its
    Weierstrass equation modulo <math|p> is non-singular over
    <math|\<bbb-F\><rsub|p>>.
  </definition>

  <\definition>
    An elliptic curve <math|E> over <math|\<bbb-Q\>> has multiplicative
    reduction at a prime <math|p> if the reduced curve modulo <math|p> has
    exactly one singular point, which is a node (intersection of two distinct
    lines).
  </definition>

  <\definition>
    An elliptic curve <math|E> over <math|\<bbb-Q\>> has additive reduction
    at a prime <math|p> if the reduced curve modulo <math|p> has a cusp or
    worse singularity.
  </definition>

  <\definition>
    The Hasse-Weil L-function <math|L<around|(|E,s|)>> of an elliptic curve
    <math|E> over <math|\<bbb-Q\>> is defined as the Euler product:

    <\equation*>
      L<around|(|E,s|)>=<big|prod><rsub|p<text|prime>>L<rsub|p><around|(|E,s|)><rsup|-1>
    </equation*>

    which converges absolutely for <math|<math-up|Re><around|(|s|)>\<gtr\><frac|3|2>>,
    where each local L-factor <math|L<rsub|p><around|(|E,s|)>> is defined as:

    <\enumerate>
      <item>If <math|E> has good reduction at <math|p>:
      <math|L<rsub|p><around|(|E,s|)>=1-a<rsub|p>*p<rsup|-s>+p<rsup|1-2*s>>
      where <math|a<rsub|p>=p+1-<around|\||E<around|(|\<bbb-F\><rsub|p>|)>|\|>>

      <item>If <math|E> has multiplicative reduction at <math|p>:
      <math|L<rsub|p><around|(|E,s|)>=1-a<rsub|p>*p<rsup|-s>> where
      <math|a<rsub|p>=\<pm\>1>

      <item>If <math|E> has additive reduction at <math|p>:
      <math|L<rsub|p><around|(|E,s|)>=1>
    </enumerate>
  </definition>

  <\definition>
    The order of vanishing of a function <math|f<around|(|s|)>> at
    <math|s=s<rsub|0>> is the largest integer <math|k> such that
    <math|<around|(|s-s<rsub|0>|)><rsup|k>> divides <math|f<around|(|s|)>> in
    a neighborhood of <math|s<rsub|0>>.
  </definition>

  <\definition>
    The Tamagawa number <math|c<rsub|p><around|(|E|)>> of an elliptic curve
    <math|E> at a prime <math|p> is the index
    <math|<around|[|E<around|(|\<bbb-Q\><rsub|p>|)>:E<rsup|0><around|(|\<bbb-Q\><rsub|p>|)>|]>>,
    where <math|E<rsup|0><around|(|\<bbb-Q\><rsub|p>|)>> is the subgroup of
    points with good reduction.
  </definition>

  <\definition>
    The real period <math|\<Omega\><rsub|E>> of an elliptic curve <math|E> is
    <math|<big|int><rsub|E<around|(|\<bbb-R\>|)>><around|\||\<omega\>|\|>>
    where <math|\<omega\>> is the invariant differential on <math|E>.
  </definition>

  <\definition>
    The Shafarevich-Tate group <math|<math-up|X><around|(|E/\<bbb-Q\>|)>> is
    the kernel of the map <math|H<rsup|1><around|(|\<bbb-Q\>,E|)>\<to\><big|prod><rsub|v>H<rsup|1><around|(|\<bbb-Q\><rsub|v>,E|)>>
    where the product runs over all places <math|v> of <math|\<bbb-Q\>>.
  </definition>

  <\definition>
    The regulator <math|<math-up|Reg><around|(|E/\<bbb-Q\>|)>> is the
    determinant of the Gram matrix of the canonical height pairing on the
    free part of <math|E<around|(|\<bbb-Q\>|)>>.
  </definition>

  <subsection|The Conjecture>

  <\conjecture>
    [Birch and Swinnerton-Dyer] Let <math|E> be an elliptic curve over
    <math|\<bbb-Q\>>. Then:

    <\enumerate>
      <item>The Shafarevich-Tate group <math|<math-up|X><around|(|E/\<bbb-Q\>|)>>
      is finite.

      <item><math|<math-up|ord><rsub|s=1>L<around|(|E,s|)>=<math-up|rank><rsub|\<bbb-Z\>>E<around|(|\<bbb-Q\>|)>>

      <item><math|lim<rsub|s\<to\>1> <frac|L<around|(|E,s|)>|<around|(|s-1|)><rsup|r>>=<frac|\<Omega\><rsub|E>\<cdot\><math-up|Reg><around|(|E/\<bbb-Q\>|)>\<cdot\><around|\||<math-up|X><around|(|E/\<bbb-Q\>|)>|\|>*<big|prod><rsub|p>c<rsub|p><around|(|E|)>|<around|\||E<around|(|\<bbb-Q\>|)><rsub|<math-up|tors>>|\|><rsup|2>>>
      where <math|r=<math-up|rank><rsub|\<bbb-Z\>>E<around|(|\<bbb-Q\>|)>>.
    </enumerate>
  </conjecture>

  <subsection|Connection to Square-Free Numbers>

  <\definition>
    The quadratic twist of an elliptic curve
    <math|E:y<rsup|2>=x<rsup|3>+a*x+b> by a square-free integer <math|n> is
    the curve <math|E<rsub|n>:n*y<rsup|2>=x<rsup|3>+a*x+b>.
  </definition>

  <\definition>
    A congruent number is a square-free positive integer <math|n> that is the
    area of a right triangle with rational side lengths.
  </definition>

  <\theorem>
    Let <math|n> be a square-free positive integer. Then <math|n> is a
    congruent number if and only if the elliptic curve
    <math|E<rsub|n>:y<rsup|2>=x<rsup|3>-n<rsup|2>*x> has positive rank. By
    the Birch and Swinnerton-Dyer conjecture, this is equivalent to
    <math|L<around|(|E<rsub|n>,1|)>=0>.
  </theorem>

  The conjecture involves square-free numbers because the behavior of
  L-functions <math|L<around|(|E<rsub|n>,s|)>> at <math|s=1> for quadratic
  twists by square-free integers <math|n> determines the solvability of
  fundamental Diophantine equations.
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.3|4>>
    <associate|auto-5|<tuple|1.4|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Birch and Swinnerton-Dyer Conjecture>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Foundational Definitions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>L-Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>The Conjecture
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Connection to Square-Free
      Numbers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>