<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Variance Structure of Random
  Fields>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  A random field is a collection <math|<around|{|Z<around|(|t|)>:t\<in\>T|}>>,
  where each <math|Z<around|(|t|)>> is a random variable defined on a
  probability space <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>. The
  topological space <math|T> represents spatial or spatio-temporal
  coordinates, and <math|Z<around|(|t|)>> gives the value of the random
  variable at each point <math|t> in <math|T>.

  The variance structure <math|\<gamma\><around|(|h|)>> quantifies how the
  variance of differences between points varies with distance <math|h>. For a
  continuous random field <math|Z<around|(|x|)>> over a domain <math|A> in
  <math|T>, the expression for <math|\<gamma\><around|(|h|)>> is:

  <\equation>
    \<gamma\><around|(|h|)>=<frac|1|<around|\||A|\|>>*<big|int><rsub|A><around|[|Z<around|(|x|)>-Z*<around|(|x+h|)>|]><rsup|2>*d*x
  </equation>

  For the variance structure to be valid, its second derivative must yield a
  covariance function that is positive definite. Mathematically, this is
  expressed as:

  <\equation>
    <wide|\<gamma\>|\<ddot\>><around|(|h|)>=C<around|(|h|)>
  </equation>

  To confirm that <math|C<around|(|h|)>> is a valid covariance function, it
  must satisfy the condition of positive definiteness. This condition should
  hold for all square-integrable functions
  <math|f<around|(|x|)>\<in\>L<rsup|2><around|(|A|)>> over the domain
  <math|A>. The condition is:

  <\equation>
    <big|int><rsub|A><big|int><rsub|A>f<around|(|x|)><wide|\<gamma\>|\<ddot\>>*<around|(|x-y|)>*f<around|(|y|)>*d*x*d*y\<geq\>0
  </equation>

  This integral condition is crucial for ensuring that the variance structure
  consistently represents spatial or spatio-temporal relationships. It is
  intrinsically tied to the random field <math|<around|{|Z<around|(|t|)>,t\<in\>T|}>>,
  defined on the probability space <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>.

  To confirm that <math|C<around|(|h|)>> is a valid covariance function, it
  must satisfy the condition of positive definiteness. In a discretized
  setting with a mesh size <math|\<Delta\>*x>, we consider a set of
  discretized points <math|<around|{|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|N<around|(|h|)>>|}>>,
  where <math|x<rsub|i>=i*\<Delta\>*x> for
  <math|i=1,2,\<ldots\>,N<around|(|h|)>>. We define a Gram matrix <math|G>,
  where <math|G<rsub|i*j>=C*<around|(|x<rsub|i>-x<rsub|j>|)>>. This Gram
  matrix must satisfy:

  <\equation>
    x<rsup|T>*G*x\<geq\>0
  </equation>

  for all vectors <math|x=<around|(|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|N<around|(|h|)>>|)>\<in\>\<bbb-R\><rsup|N<around|(|h|)>>>.

  In the limit as <math|\<Delta\>*x\<to\>0>, this condition is expected to
  converge to an integral operator condition, providing a link between the
  discrete and continuous formulations of positive definiteness.

  This condition is crucial for ensuring that the variance structure
  consistently represents spatial or spatio-temporal relationships. It is
  intrinsically tied to the random field <math|<around|{|Z<around|(|t|)>,t\<in\>T|}>>,
  defined on the probability space <math|<around|(|\<Omega\>,\<cal-F\>,P|)>>.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>