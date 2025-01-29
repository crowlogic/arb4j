<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Solutions of the equation of wave motions which involve Bessel
  functions.>

  We shall now obtain a class of particular solutions of the equation of wave
  motions, useful for the solution of certain special problems.

  In physical investigations, it is desirable to have the time occurring by
  means of a factor <math|sin c*k*t> or <math|cos c*k*t>, where <math|k> is
  constant. This suggests that we should consider solutions of the type

  <\equation*>
    V=<big|int><rsub|-\<pi\>><rsup|\<pi\>><big|int><rsub|0><rsup|\<pi\>>e<rsup|i*k*<around|(|x*sin
    u*cos v+y*sin u*sin v+z*cos u+c*t|)>>*f<around|(|u,v|)>*d*u*d*v.
  </equation*>

  Physically this means that we consider motions in which all the elementary
  waves have the same period.

  Now let the polar coordinates of <math|<around|(|x,y,z|)>> be
  <math|<around|(|r,\<theta\>,\<phi\>|)>> and let
  <math|<around|(|\<omega\>,\<psi\>|)>> be the polar coordinates of the
  direction <math|<around|(|u,v|)>> referred to new axes such that the polar
  axis is the direction <math|<around|(|\<theta\>,\<phi\>|)>>, and the plane
  <math|\<psi\>=0> passes through <math|O*Z>; so that

  <\equation*>
    cos \<omega\>=cos \<theta\>*cos u+sin \<theta\>*sin u*cos
    <around|(|\<phi\>-v|)>,
  </equation*>

  <\equation*>
    sin u*sin <around|(|\<phi\>-v|)>=sin \<omega\>*sin \<psi\>.
  </equation*>

  Also, take the arbitrary function <math|f<around|(|u,v|)>> to be
  <math|S<rsub|n><around|(|u,v|)>*sin u>, where <math|S<rsub|n>> denotes a
  surface harmonic in <math|u>, <math|v> of degree <math|n>; so that we may
  write

  <\equation*>
    S<rsub|n><around|(|u,v|)>=<wide|S|\<bar\>><rsub|n><around|(|\<theta\>,\<phi\>;\<omega\>,\<psi\>|)>,
  </equation*>

  where (<math|Ÿ> 18\<centerdot\>31) <math|<wide|S|\<bar\>><rsub|n>> is a
  surface harmonic in <math|\<omega\>>, <math|\<psi\>> of degree <math|n>.

  We thus get

  <\equation*>
    V=e<rsup|i*k*c*t>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><big|int><rsub|0><rsup|\<pi\>>e<rsup|i*k*r*cos
    \<omega\>>*<wide|S|\<bar\>><rsub|n><around|(|\<theta\>,\<phi\>;\<omega\>,\<psi\>|)>*sin
    \<omega\>*d*\<omega\>*d*\<psi\>.
  </equation*>

  Now we may write (<math|Ÿ> 18\<centerdot\>31)

  <\equation*>
    <wide|S|\<bar\>><rsub|n><around|(|\<theta\>,\<phi\>;\<omega\>,\<psi\>|)>=A<rsub|n><around|(|\<theta\>,\<phi\>|)>\<cdot\>P<rsub|n><around|(|cos
    \<omega\>|)>+<big|sum><rsub|m=1><rsup|n><around|{|A<rsub|n><rsup|<around|(|m|)>><around|(|\<theta\>,\<phi\>|)>*cos
    m*\<psi\>+B<rsub|n><rsup|<around|(|m|)>><around|(|\<theta\>,\<phi\>|)>*sin
    m*\<psi\>|}>*P<rsub|n><rsup|m><around|(|cos \<omega\>|)>,
  </equation*>

  where <math|A<rsub|n><around|(|\<theta\>,\<phi\>|)>,A<rsub|n><rsup|<around|(|m|)>><around|(|\<theta\>,\<phi\>|)>>
  and <math|B<rsub|n><rsup|<around|(|m|)>><around|(|\<theta\>,\<phi\>|)>> are
  independent of <math|\<psi\>> and <math|\<omega\>>.

  Performing the integration with respect to <math|\<psi\>>, we get

  <\equation*>
    V=2*\<pi\>*e<rsup|i*k*c*t>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>*<big|int><rsub|0><rsup|\<pi\>>e<rsup|i*k*r*cos
    \<omega\>>*P<rsub|n><around|(|cos \<omega\>|)>*sin \<omega\>*d*\<omega\>
  </equation*>

  <\equation*>
    =2*\<pi\>*e<rsup|i*k*c*t>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>*<big|int><rsub|-1><rsup|1>e<rsup|i*k*r*\<mu\>>*P<rsub|n><around|(|\<mu\>|)>*d*\<mu\>
  </equation*>

  <\equation*>
    =2*\<pi\>*e<rsup|i*k*c*t>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>*<big|int><rsub|-1><rsup|1>e<rsup|i*k*r*\<mu\>>*<frac|1|2<rsup|n>\<cdot\>n!>*<frac|d<rsup|n>|d*\<mu\><rsup|n>>*<around|(|\<mu\><rsup|2>-1|)><rsup|n>*d*\<mu\>,
  </equation*>

  by Rodrigues' formula (<math|Ÿ> 15\<centerdot\>11); on integrating by parts
  <math|n> times and using Hankel's integral (<math|Ÿ> 17\<centerdot\>3
  corollary), we obtain the equation

  <\equation*>
    V=<frac|2*\<pi\>|2<rsup|n>\<cdot\>n!>*e<rsup|i*k*c*t>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>*<around|(|i*k*r|)><rsup|n>*<big|int><rsub|-1><rsup|1>e<rsup|i*k*r*\<mu\>>*<around|(|1-\<mu\><rsup|2>|)><rsup|n>*d*\<mu\>
  </equation*>

  <\equation*>
    =<around|(|2*\<pi\>|)><rsup|<frac|1|2>>*i<rsup|n>*e<rsup|i*k*c*t>*<around|(|k*r|)><rsup|-<frac|1|2>>*J<rsub|n+<frac|1|2>>*<around|(|k*r|)>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>,
  </equation*>

  and so <math|V> is a constant multiple of
  <math|e<rsup|i*k*c*t>*r<rsup|-<frac|1|2>>*J<rsub|n+<frac|1|2>>*<around|(|k*r|)>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>>.

  Now the equation of wave motions is unaffected if we multiply <math|x,y,z>
  and <math|t> by the same constant factor, i.e. if we multiply <math|r> and
  <math|t> by the same constant factor leaving <math|\<theta\>> and
  <math|\<phi\>> unaltered; so that <math|A<rsub|n><around|(|\<theta\>,\<phi\>|)>>
  may be taken to be independent of the arbitrary constant <math|k> which
  multiplies <math|r> and <math|t>.

  Hence <math|lim<rsub|k\<to\>0> e<rsup|i*k*c*t>*r<rsup|-<frac|1|2>>*k<rsup|-n-<frac|1|2>>*J<rsub|n+<frac|1|2>>*<around|(|k*r|)>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>>
  is a solution of the equation of wave motions; and therefore
  <math|r<rsup|n>*A<rsub|n><around|(|\<theta\>,\<phi\>|)>> is a solution
  (independent of <math|t>) of the equation of wave motions, and is
  consequently a solution of Laplace's equation; it is, accordingly,
  permissible to take <math|A<rsub|n><around|(|\<theta\>,\<phi\>|)>> to be
  any surface harmonic of degree <math|n>; and so we obtain the result that

  <\equation*>
    r<rsup|-<frac|1|2>>*J<rsub|n+<frac|1|2>>*<around|(|k*r|)>*P<rsub|n><rsup|m><around|(|cos
    \<theta\>|)><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|cos>>|<row|<cell|sin>>>>>m*\<phi\><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|cos>>|<row|<cell|sin>>>>>c*k*t
  </equation*>

  is a particular solution of the equation of wave motions.
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Solutions
      of the equation of wave motions which involve Bessel functions.>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>