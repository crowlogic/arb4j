<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\theorem>
    [Gain Function for Unitary Time Changes] Let <math|X<around|(|t|)>> be a
    zero-mean stationary Gaussian process and
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be an absolutely continuous
    bijection with <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0> almost
    everywhere. The unitary time change produces an oscillatory process
    <math|Z<around|(|t|)>> with gain function

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation*>
  </theorem>

  <\definition>
    [Unitary Time Change Operator] Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be an absolutely continuous bijection with
    <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0> almost everywhere. The
    unitary time change operator <math|U<rsub|\<theta\>>> on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> is defined by

    <\equation*>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>
    </equation*>
  </definition>

  <\lemma>
    [Unitarity of Time Change Operator] The operator <math|U<rsub|\<theta\>>>
    defined above is unitary on <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </lemma>

  <\proof>
    For any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, compute

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|U<rsub|\<theta\>>*f|\<\|\|\>><rsub|2><rsup|2>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||f<around|(|\<theta\><around|(|t|)>|)><around|\||<rsup|2>|\|>*\<theta\><rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    By the change of variables <math|s=\<theta\><around|(|t|)>>, we have
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>, so

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|U<rsub|\<theta\>>*f|\<\|\|\>><rsub|2><rsup|2>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s=<around|\<\|\|\>|f|\<\|\|\>><rsub|2><rsup|2><eq-number>>>>>
    </align>

    Thus <math|U<rsub|\<theta\>>> is an isometry. Since <math|\<theta\>> is a
    bijection, <math|U<rsub|\<theta\>>> is surjective, hence unitary.
  </proof>

  <\definition>
    [Stationary Gaussian Process] A zero-mean stationary Gaussian process
    <math|X<around|(|t|)>> has the spectral representation

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>

    where <math|\<Phi\><around|(|\<lambda\>|)>> is a complex-valued
    orthogonal increment process with <math|E<around|[|<around|\||d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)>>
    for some finite measure <math|F>.
  </definition>

  <\definition>
    [Oscillatory Process] An oscillatory process in the sense of Priestley is
    a process <math|Z<around|(|t|)>> with the representation

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>

    where <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>> is the oscillatory
    function and <math|\<Phi\><around|(|\<lambda\>|)>> is as in the
    stationary case. The gain function <math|A<rsub|t><around|(|\<lambda\>|)>>
    is defined by

    <\equation*>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation*>

    so that

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>
  </definition>

  Start with the stationary process

  <\equation*>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
  </equation*>

  Apply the unitary time change operator to obtain

  <\equation*>
    Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
  </equation*>

  Substituting the spectral representation:

  <\align>
    <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>>>
  </align>

  To express this in oscillatory form, factor out
  <math|e<rsup|i*\<lambda\>*t>>:

  <\align>
    <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><eq-number>>>>>
  </align>

  Comparing with the oscillatory representation
  <math|Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>,
  we identify the gain function:

  <\equation*>
    A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
  </equation*>

  The oscillatory function is therefore

  <\equation*>
    \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
  </equation*>

  <\theorem>
    [Kernel Representation] The covariance kernel of the oscillatory process
    <math|Z<around|(|t|)>> is given by

    <\equation*>
      K<rsub|Z><around|(|s,t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)><around|\|||\|>*\<theta\><rprime|'><around|(|t|)>|\|>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation*>

    where <math|F<around|(|\<lambda\>|)>> is the spectral measure of the
    original stationary process.
  </theorem>

  <\proof>
    The covariance is

    <\align>
      <tformat|<table|<row|<cell|K<rsub|Z><around|(|s,t|)>>|<cell|=E<around|[|Z<around|(|s|)><wide|Z<around|(|t|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=E<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<rsub|t><around|(|\<mu\>|)>*e<rsup|i*\<mu\>*t>|\<bar\>><space|0.17em>d<wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    Substituting the gain function:

    <\align>
      <tformat|<table|<row|<cell|K<rsub|Z><around|(|s,t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>|\|>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-s|)>>*<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*e<rsup|-i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)><around|\|||\|>*\<theta\><rprime|'><around|(|t|)>|\|>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  \;
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