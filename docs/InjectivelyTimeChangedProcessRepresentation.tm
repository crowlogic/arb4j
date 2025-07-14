<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injectively Time-Changed Stationary
  Processes>|<doc-date|>>

  <\definition>
    An <em|injectively time-changed stationary process> is a stochastic
    process <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> with
    spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is strictly increasing,
    <math|\<theta\>\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>, and
    <math|<around|{|Z<around|(|\<lambda\>|)>|}><rsub|\<lambda\>\<in\>\<bbb-R\>>>
    is an orthogonal increment process with
    <math|E<around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=F*<around|(|d*\<lambda\>|)>>.
  </definition>

  <\proposition>
    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where

    <\equation>
      A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </proposition>

  <\proof>
    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    <\enumerate>
      <item><math|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>F*<around|(|d*\<lambda\>|)>\<less\>\<infty\>>

      <item>Cov<math|<around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)>>
    </enumerate>
  </theorem>

  <\proof>
    <\align>
      <tformat|<table|<row|<cell|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|\|><rsup|2>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>F*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|<text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|s|)>><wide|e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|\<bar\>>F*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    <math|X<around|(|t|)>> is stationary if and only if
    <math|\<theta\><around|(|t|)>=t+c> for some <math|c\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    (<math|\<Leftarrow\>>) If <math|\<theta\><around|(|t|)>=t+c>:

    <\equation>
      <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*c>*e<rsup|-i*\<lambda\>*c>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>F*<around|(|d*\<lambda\>|)>
    </equation>

    (<math|\<Rightarrow\>>) Stationarity requires
    <math|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>=g*<around|(|s-t|)>>.
    Differentiating: <math|\<theta\><rprime|'><around|(|s|)>=g<rprime|'>*<around|(|s-t|)>>.
    Both sides constant implies <math|\<theta\><rprime|'><around|(|t|)>=k>,
    so <math|\<theta\><around|(|t|)>=k*t+c>. Covariance depending only on
    <math|s-t> requires <math|k=1>.
  </proof>

  <\definition>
    <math|\<Delta\><around|(|t|)>\<assign\>\<theta\><around|(|t|)>-t>
  </definition>

  <\proposition>
    <\enumerate>
      <item><math|\<Delta\><rprime|'><around|(|t|)>=\<theta\><rprime|'><around|(|t|)>-1>

      <item><math|A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*\<Delta\><around|(|t|)>>>

      <item>Instantaneous frequency: <math|<frac|d|d*t>*<around|[|\<lambda\>*\<theta\><around|(|t|)>|]>=\<lambda\>*\<theta\><rprime|'><around|(|t|)>>
    </enumerate>
  </proposition>

  <\theorem>
    If <math|\<theta\>> has inverse <math|\<psi\>> and
    <math|F*<around|(|d*\<lambda\>|)>=f<around|(|\<lambda\>|)>*d*\<lambda\>>:

    <\equation>
      f<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<psi\><around|(|u|)>|)>*e<rsup|-i*\<lambda\>*u>*<frac|d*u|\<psi\><rprime|'><around|(|u|)>>
    </equation>
  </theorem>

  <\proof>
    Substitution <math|u=\<theta\><around|(|t|)>>:

    <\equation>
      X<around|(|\<psi\><around|(|u|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*d*Z<around|(|\<mu\>|)>
    </equation>

    Standard inversion formula applies with measure transformation factor
    <math|<frac|1|\<psi\><rprime|'><around|(|u|)>>>.
  </proof>

  <\theorem>
    If <math|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>\<to\>\<infty\>>
    as <math|<around|\||t-s|\|>\<to\>\<infty\>> and <math|F> is absolutely
    continuous:

    <\equation>
      lim<rsub|<around|\||t-s|\|>\<to\>\<infty\>><text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=0
    </equation>
  </theorem>

  <\proof>
    Riemann-Lebesgue lemma applied to

    <\equation>
      <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)>
    </equation>
  </proof>

  <\corollary>
    [Band-Limited Case] When <math|F> has support in
    <math|<around|[|-B,B|]>>:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-B><rsup|B>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>
  </corollary>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>