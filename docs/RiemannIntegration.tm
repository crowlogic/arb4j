<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\theorem>
    <dueto|Riemann Integral, Midpoint Definition>Let <math|f> be continuous
    on <math|<around|[|a,b|]>>. Then

    <\equation*>
      <big|int><rsub|a><rsup|b>f<around|(|x|)>*<space|0.17em>d*x=lim<rsub|h\<to\>0>
      h*<big|sum><rsub|i=0><rsup|N-1>f*<around*|(|a+<around*|(|i+<tfrac|1|2>|)>\<cdot\>h|)>
    </equation*>

    where

    <\equation>
      N=<frac|b-a|h>
    </equation>
  </theorem>

  <\proof>
    Since <math|f> is continuous on the compact set <math|<around|[|a,b|]>>,
    <math|f> is uniformly continuous on <math|<around|[|a,b|]>>.

    By a standard theorem in real analysis, every uniformly continuous
    function is Riemann integrable. Therefore, <math|f> is Riemann integrable
    on <math|<around|[|a,b|]>>.

    Let <math|P<rsub|h,a,b>> be the uniform partition of
    <math|<around|[|a,b|]>> into <math|N=<frac|b-a|h>> subintervals of width
    <math|<around|\||P<rsub|h>|\|>=h> . Consider the Riemann sum using
    midpoint tags: TODO: define the tags explicitly!

    <\equation>
      S<rsub|h><around*|(|f,a,b|)>=h*<big|sum><rsub|i=0><rsup|N<rsub|a,b>-1>f*<around*|(|a+<around*|(|i+<tfrac|1|2>|)>\<cdot\>h|)>
    </equation>

    Since <math|f> is Riemann integrable, for every
    <math|\<epsilon\>\<gtr\>0>, there exists <math|\<delta\>\<gtr\>0> such
    that for any partition <math|P> with mesh
    <math|<around|\||P|\|>\<less\>\<delta\>> and any choice of tags it is the
    case that

    <\equation>
      <around*|\||S<rsub|h><around*|(|f,a,b|)>-<big|int><rsub|a><rsup|b>f<around|(|x|)>*<space|0.17em>d*x|\|>\<less\>\<varepsilon\>
    </equation>

    and since <math|h\<to\>0> implies <math|<around|\||P<rsub|h>|\|>=h\<to\>0>,
    we have

    <\equation*>
      lim<rsub|h\<to\>0> S<rsub|h>=<big|int><rsub|a><rsup|b>f<around|(|x|)>*<space|0.17em>d*x
    </equation*>
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>