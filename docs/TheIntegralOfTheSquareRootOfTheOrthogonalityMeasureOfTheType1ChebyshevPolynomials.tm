<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Integral <math|<big|int><rsub|-1><rsup|\<omega\>><frac|1|<rsup|4><sqrt|1-\<lambda\><rsup|2>>>\<mathd\>\<lambda\>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <new-theorem|theorem|Theorem>

  <\theorem>
    [Integral of <math|<around|(|1-y<rsup|2>|)><rsup|-1/4>>] For
    <math|\<lambda\>\<in\><around|[|-1,1|]>>, the definite integral

    <\equation>
      <big|int><rsub|-1><rsup|\<lambda\>><sqrt|<frac|1|<sqrt|1-y<rsup|2>>>>*<space|0.17em>d*y
    </equation>

    can be expressed in terms of incomplete elliptic integrals of the second
    kind as:

    <\equation>
      <big|int><rsub|-1><rsup|\<lambda\>><sqrt|<frac|1|<sqrt|1-y<rsup|2>>>>*<space|0.17em>d*y=2*<around*|[|<math-up|EllipticE><around*|(|<frac|arcsin
      \<lambda\>|2><mid|\|>2|)>-<math-up|EllipticE><around*|(|-<frac|\<pi\>|4><mid|\|>2|)>|]>
    </equation>

    where <math|<math-up|EllipticE><around|(|\<phi\>\|m|)>> denotes the
    incomplete elliptic integral of the second kind.
  </theorem>

  <\proof>
    We proceed in several steps.

    <with|font-series|bold|Step 1:> Simplify the integrand.

    <\equation>
      <sqrt|<frac|1|<sqrt|1-y<rsup|2>>>>=<around*|(|<frac|1|<sqrt|1-y<rsup|2>>>|)><rsup|1/2>=<around|(|1-y<rsup|2>|)><rsup|-1/4>
    </equation>

    Therefore, our integral becomes:

    <\equation>
      I=<big|int><rsub|-1><rsup|\<lambda\>><around|(|1-y<rsup|2>|)><rsup|-1/4>*<space|0.17em>d*y
    </equation>

    <with|font-series|bold|Step 2:> Apply the trigonometric substitution
    <math|y=sin \<theta\>>.

    Under this substitution:

    <\align>
      <tformat|<table|<row|<cell|d*y>|<cell|=cos
      \<theta\>*<space|0.17em>d*\<theta\><eq-number>>>|<row|<cell|1-y<rsup|2>>|<cell|=1-sin<rsup|2>
      \<theta\>=cos<rsup|2> \<theta\><eq-number>>>|<row|<cell|<around|(|1-y<rsup|2>|)><rsup|-1/4>>|<cell|=<around|(|cos<rsup|2>
      \<theta\>|)><rsup|-1/4>=<around|\||cos
      \<theta\>|\|><rsup|-1/2><eq-number>>>>>
    </align>

    For <math|\<theta\>\<in\><around|[|-\<pi\>/2,\<pi\>/2|]>>, we have
    <math|cos \<theta\>\<geq\>0>, so <math|<around|\||cos \<theta\>|\|>=cos
    \<theta\>>.

    The limits of integration transform as:

    <\align>
      <tformat|<table|<row|<cell|y=-1>|<cell|\<Rightarrow\>\<theta\>=arcsin
      <around|(|-1|)>=-<frac|\<pi\>|2><eq-number>>>|<row|<cell|y=\<lambda\>>|<cell|\<Rightarrow\>\<theta\>=arcsin
      <around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Step 3:> Transform the integral.

    <\equation>
      I=<big|int><rsub|-\<pi\>/2><rsup|arcsin \<lambda\>><around|(|cos
      \<theta\>|)><rsup|-1/2>*cos \<theta\>*<space|0.17em>d*\<theta\>=<big|int><rsub|-\<pi\>/2><rsup|arcsin
      \<lambda\>><around|(|cos \<theta\>|)><rsup|1/2>*<space|0.17em>d*\<theta\>
    </equation>

    <with|font-series|bold|Step 4:> Express in terms of elliptic integrals.

    It is a known result that:

    <\equation>
      <big|int><sqrt|cos \<theta\>>*<space|0.17em>d*\<theta\>=2<space|0.17em><math-up|EllipticE><around*|(|<frac|\<theta\>|2><mid|\|>2|)>+C
    </equation>

    where <math|<math-up|EllipticE><around|(|\<phi\>\|m|)>> is the incomplete
    elliptic integral of the second kind.

    <with|font-series|bold|Step 5:> Evaluate the definite integral.

    <\align>
      <tformat|<table|<row|<cell|I>|<cell|=<around*|[|2<space|0.17em><math-up|EllipticE><around*|(|<frac|\<theta\>|2><mid|\|>2|)>|]><rsub|-\<pi\>/2><rsup|arcsin
      \<lambda\>><eq-number>>>|<row|<cell|>|<cell|=2<space|0.17em><math-up|EllipticE><around*|(|<frac|arcsin
      \<lambda\>|2><mid|\|>2|)>-2<space|0.17em><math-up|EllipticE><around*|(|<frac|-\<pi\>/2|2><mid|\|>2|)><eq-number>>>|<row|<cell|>|<cell|=2*<around*|[|<math-up|EllipticE><around*|(|<frac|arcsin
      \<lambda\>|2><mid|\|>2|)>-<math-up|EllipticE><around*|(|-<frac|\<pi\>|4><mid|\|>2|)>|]><eq-number>>>>>
    </align>

    This completes the proof.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>