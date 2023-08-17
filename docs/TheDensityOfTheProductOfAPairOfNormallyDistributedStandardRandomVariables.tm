<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Density of The Product of A Pair Of Normally
  Distributed Standard Random Variables>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <math|Let> <math|Z=X*Y> where <math|X> and <math|Y> are independent
  standard normally distributed random variables. To find the density
  <math|f<rsub|Z><around|(|z|)>> it can be expressed in terms of the joint
  density of <math|X> and <math|Y> and the Dirac delta function:

  <\equation>
    f<rsub|Z><around|(|z|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|X,Y><around|(|x,<frac|z|x>|)>*\<delta\>*<around|(|z-x*y|)>*d*x
  </equation>

  <\equation>
    =<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|X><around|(|x|)>*f<rsub|Y><around|(|<frac|z|x>|)>*\<delta\>*<around|(|z-x*y|)>*d*x
  </equation>

  Because <math|X> and <math|Y> are independent standard normals:

  <\equation>
    f<rsub|X><around|(|x|)>=<frac|1|<sqrt|2*\<pi\>>>*e<rsup|-<frac|x<rsup|2>|2>>
  </equation>

  <\equation>
    f<rsub|Y><around|(|y|)>=<frac|1|<sqrt|2*\<pi\>>>*e<rsup|-<frac|y<rsup|2>|2>>
  </equation>

  Substituting these in, we get:

  <\equation>
    f<rsub|Z><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|x<rsup|2>|2>>*e<rsup|-<frac|z<rsup|2>|2*x<rsup|2>>>*\<delta\>*<around|(|z-x*y|)>*d*x
  </equation>

  Now, to deal with the delta function, we'll integrate over <math|y> from
  <math|-\<infty\>> to <math|\<infty\>>:

  <\equation>
    f<rsub|Z><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|x<rsup|2>+y<rsup|2>|2>>*\<delta\>*<around|(|z-x*y|)>*d*y*d*x
  </equation>

  Because of the delta function, only values where <math|y=<frac|z|x>> will
  contribute to the integral, so:

  <\equation>
    f<rsub|Z><around|(|z|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|x<rsup|2>+z<rsup|2>|2*x<rsup|2>>><around|\||x|\|>*d*x
  </equation>

  <subsubsection|Substitution><label|substitution><label|substitution>

  Now, make a substitution: <math|u=x<rsup|2>> so <math|d*u=2*x*d*x>. Then:

  <\equation>
    f<rsub|Z><around|(|z|)>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<frac|u+z<rsup|2>|2*u>>*<frac|d*u|<sqrt|u>>
  </equation>

  This is an integral representation of the Bessel function of the first kind
  of order 0 denoted <math|J<rsub|0><around|(|z|)>> given by:

  <\equation>
    J<rsub|0><around|(|z|)>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-<frac|z<rsup|2>|2*u>>*<frac|d*u|<sqrt|u>>
  </equation>

  Comparing, we find:

  <\equation>
    f<rsub|Z><around|(|z|)>=<around|\||z|\|>*J<rsub|0><around|(|<around|\||z|\|>|)>
  </equation>

  So, the distribution of the product of two independent standard normal
  variables involves the Bessel function of the first kind of order 0.

  <subsubsection|Correlated But Independent Random
  Variables><label|correlated-but-independent-random-variables><label|correlated-but-independent-random-variables>

  When <math|X> and <math|Y> are independent standard normal random
  variables, their product Z=XY does not follow a normal distribution.
  Instead, its probability density function <math|f<rsub|Z><around|(|z|)>> is
  proportional to the <math|<around*|\||z|\|>J<rsub|0>(<around*|\||z|[>)>
  where <math|J<rsub|0>><space|0pt> is the Bessel function of the first kind
  of order 0.

  There is also a connection to the modified Bessel function of the second
  kind in the context of the product of correlated zero mean random
  variables. This is a related but different scenario. The distribution of
  the product of correlated zero-mean Gaussian variables does involve the
  modified Bessel function of the second kind.

  The relationship between the Bessel functions and the product of Gaussian
  (random) variables is a deep and fascinating topic in probability and
  statistics. Both the Bessel function of the first kind and the modified
  Bessel function of the second kind can arise in different contexts when
  studying the products of or other nonlinear functions of Gaussian variables
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|correlated-but-independent-random-variables|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|substitution|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Substitution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>Correlated But Independent
      Random Variables <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>