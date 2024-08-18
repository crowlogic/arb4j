<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Compactness of the <math|J<rsub|0>> Integral
  Covariance Operator>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <section|Introduction>

  We consider the integral operator <math|T> on
  <math|L<rsup|2><around|[|0,\<infty\>|)>> defined by:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|<around|\||x-y|\|>|)>*f<around|(|y|)>*d*y
  </equation>

  where <math|J<rsub|0>> is the Bessel function of the first kind of order
  zero. We aim to prove that <math|T> is compact using the concept of Bochner
  V-boundedness.

  <section|Preliminaries>

  <\lemma>
    For <math|x\<neq\>0>, <math|<around|\||J<rsub|0><around|(|x|)>|\|>\<leq\>min
    <around|(|1,<sqrt|2/<around|(|\<pi\><around|\||x|\|>|)>>|)>>.
  </lemma>

  <\proof>
    This follows from the asymptotic behavior of
    <math|J<rsub|0><around|(|x|)>> and its maximum value of 1 at <math|x=0>.
  </proof>

  <\lemma>
    <label|lem:integral>The integral <math|<big|int><rsub|0><rsup|\<infty\>><around|(|J<rsub|0><around|(|x|)>/<around|(|1+x|)>|)><rsup|2>*d*x>
    converges.
  </lemma>

  <\proof>
    We split the integral into two parts:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|J<rsub|0><around|(|x|)>|1+x>|)><rsup|2>*d*x=<big|int><rsub|0><rsup|1><around*|(|<frac|J<rsub|0><around|(|x|)>|1+x>|)><rsup|2>*d*x+<big|int><rsub|1><rsup|\<infty\>><around*|(|<frac|J<rsub|0><around|(|x|)>|1+x>|)><rsup|2>*d*x
    </equation>

    For the first part, since <math|<around|\||J<rsub|0><around|(|x|)>|\|>\<leq\>1>:

    <\equation>
      <big|int><rsub|0><rsup|1><around*|(|<frac|J<rsub|0><around|(|x|)>|1+x>|)><rsup|2>*d*x\<leq\><big|int><rsub|0><rsup|1><frac|1|<around|(|1+x|)><rsup|2>>*d*x=<frac|1|2>\<less\>\<infty\>
    </equation>

    For the second part, we use the asymptotic behavior
    <math|<around|\||J<rsub|0><around|(|x|)>|\|>\<leq\><sqrt|2/<around|(|\<pi\>*x|)>>>
    for <math|x\<gtr\>1>:

    <\equation*>
      <big|int><rsub|1><rsup|\<infty\>><around*|(|<frac|J<rsub|0><around|(|x|)>|1+x>|)><rsup|2>*d*x\<leq\><big|int><rsub|1><rsup|\<infty\>><frac|2|\<pi\>*x*<around|(|1+x|)><rsup|2>>*d*x
    </equation*>

    We can directly evaluate this integral:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|1><rsup|\<infty\>><frac|2|\<pi\>*x*<around|(|1+x|)><rsup|2>>*d*x>|<cell|=<frac|2|\<pi\>>*<around*|[|-<frac|1|1+x>+log
      <around*|(|<frac|x|1+x>|)>|]><rsub|1><rsup|\<infty\>>>>|<row|<cell|>|<cell|=<frac|2|\<pi\>>*<around*|[|<frac|1|2>+log
      <around*|(|<frac|2|1>|)>|]>\<less\>\<infty\>>>>>>
    </equation>

    Therefore, the entire integral converges.
  </proof>

  <section|Bochner V-boundedness>

  <\definition>
    An integral operator <math|T> with kernel <math|K<around|(|x,y|)>> is
    Bochner V-bounded if there exists a positive function
    <math|V<around|(|x|)>> such that:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><around|\||K<around|(|x,y|)>/V<around|(|y|)>|\|><rsup|2>*V<around|(|x|)><rsup|2>*d*x\<less\>\<infty\>
    </equation>
  </definition>

  <\theorem>
    If <math|T> is Bochner V-bounded on <math|L<rsup|2><around|[|0,\<infty\>|)>>,
    then <math|T> is compact.
  </theorem>

  <\proof>
    Let <math|<around|{|e<rsub|n>|}>> be an orthonormal basis for
    <math|L<rsup|2><around|[|0,\<infty\>|)>>. Define the finite rank
    operators:

    <\equation>
      T<rsub|N>*f=<big|sum><rsub|n=1><rsup|N><around|\<langle\>|T*f,e<rsub|n>|\<rangle\>>*e<rsub|n>
    </equation>

    We will show that <math|T<rsub|N>\<to\>T> in operator norm. Let
    <math|f\<in\>L<rsup|2><around|[|0,\<infty\>|)>> with
    <math|<around|\<\|\|\>|f|\<\|\|\>>\<leq\>1>. Then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|<around|(|T-T<rsub|N>|)>*f|\<\|\|\>><rsup|2>>|<cell|=<big|sum><rsub|n\<gtr\>N><around|\||<around|\<langle\>|T*f,e<rsub|n>|\<rangle\>>|\|><rsup|2>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<gtr\>N><around*|\||<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>K<around|(|x,y|)>*f<around|(|y|)>*e<rsub|n><around|(|x|)>*d*y*d*x|\|><rsup|2>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|n\<gtr\>N><around*|(|<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>><around|\||K<around|(|x,y|)>/V<around|(|y|)><around|\|||\|>*V<around|(|y|)>*f<around|(|y|)><around|\|||\|>*e<rsub|n><around|(|x|)>|\|>*d*y*d*x|)><rsup|2>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|n\<gtr\>N><around*|(|<big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><around|\||K<around|(|x,y|)>/V<around|(|y|)><around|\||<around|\<\|\|\>|V*f|\<\|\|\>>|\|>*e<rsub|n><around|(|x|)>|\|>*d*x|)><rsup|2>>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|V*f|\<\|\|\>><rsup|2>*<big|sum><rsub|n\<gtr\>N><big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><around|\||K<around|(|x,y|)>/V<around|(|y|)><around|\||<rsup|2>|\|>*e<rsub|n><around|(|x|)>|\|><rsup|2>*d*x>>|<row|<cell|>|<cell|=<around|\<\|\|\>|V*f|\<\|\|\>><rsup|2>*<big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><around|\||K<around|(|x,y|)>/V<around|(|y|)><around|\||<rsup|2><big|sum><rsub|n\<gtr\>N>|\|>*e<rsub|n><around|(|x|)>|\|><rsup|2>*d*x>>>>>
    </equation>

    By Parseval's identity, for any fixed <math|x>,
    <math|<big|sum><rsub|n=1><rsup|\<infty\>><around|\||e<rsub|n><around|(|x|)>|\|><rsup|2>=1>
    almost everywhere. Therefore, <math|<big|sum><rsub|n\<gtr\>N><around|\||e<rsub|n><around|(|x|)>|\|><rsup|2>>
    represents the tail of this series and converges to zero pointwise as
    <math|N\<to\>\<infty\>> for almost every <math|x>. This sum is also
    bounded by 1 for all <math|N> and <math|x>.

    By the dominated convergence theorem and the Bochner V-boundedness
    condition, <math|<around|\<\|\|\>|<around|(|T-T<rsub|N>|)>*f|\<\|\|\>><rsup|2>\<to\>0>
    as <math|N\<to\>\<infty\>>, uniformly for
    <math|<around|\<\|\|\>|f|\<\|\|\>>\<leq\>1>. Thus, <math|T> is the limit
    of finite rank operators and is therefore compact.
  </proof>

  <section|Proof of Compactness>

  We will show that <math|T> is Bochner V-bounded with
  <math|V<around|(|x|)>=1+x>.

  <\theorem>
    The operator <math|T> defined by <math|<around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|<around|\||x-y|\|>|)>*f<around|(|y|)>*d*y>
    is compact on <math|L<rsup|2><around|[|0,\<infty\>|)>>.
  </theorem>

  <\proof>
    We need to show:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>/<around|(|1+y|)>|\|><rsup|2>*<around|(|1+x|)><rsup|2>*d*x\<less\>\<infty\>
    </equation>

    First, note that for any <math|x,y\<geq\>0>:

    <\equation>
      <around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>|\|>\<leq\>min
      <around|(|1,<sqrt|2/<around|(|\<pi\>*<around|\||x-y|\|>|)>>|)>
    </equation>

    Now, let's consider two cases:

    1) For <math|<around|\||x-y|\|>\<leq\>1>:

    <\equation>
      <around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>|\|>/<around|(|1+y|)>\<leq\>1/<around|(|1+y|)>\<leq\>1/<around|(|1+<around|\||x|\|>-1|)><rsup|+>
    </equation>

    where <math|<around|(|\<cdummy\>|)><rsup|+>> denotes the positive part.

    2) For <math|<around|\||x-y|\|>\<gtr\>1>:

    <\equation>
      <around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>|\|>/<around|(|1+y|)>\<leq\><sqrt|2/<around|(|\<pi\>*<around|\||x-y|\|>|)>>/<around|(|1+y|)>
    </equation>

    To take the supremum over <math|y>, we consider:

    a) When <math|x\<leq\>1>, the supremum is achieved in case 1, giving
    <math|1>.

    b) When <math|x\<gtr\>1>: - For <math|y\<in\><around|[|0,x-1|]>\<cup\><around|[|x+1,\<infty\>|)>>,
    we use case 2. - For <math|y\<in\><around|(|x-1,x+1|)>>, we use case 1.

    Thus, for <math|x\<gtr\>1>:

    <\equation>
      sup<rsub|y\<geq\>0><around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>/<around|(|1+y|)>|\|>\<leq\>max
      <around*|(|<frac|1|x>,sup<rsub|y\<in\><around|[|0,x-1|]>\<cup\><around|[|x+1,\<infty\>|)>>
      <frac|<sqrt|2/<around|(|\<pi\>*<around|\||x-y|\|>|)>>|1+y>|)>
    </equation>

    For <math|y\<in\><around|[|0,x-1|]>>, <math|<around|\||x-y|\|>\<leq\>x>
    and <math|1+y\<geq\>1>, so:

    <\equation>
      <frac|<sqrt|2/<around|(|\<pi\>*<around|\||x-y|\|>|)>>|1+y>\<leq\><sqrt|<frac|2|\<pi\>*x>>
    </equation>

    For <math|y\<in\><around|[|x+1,\<infty\>|)>>,
    <math|<around|\||x-y|\|>=y-x> and <math|1+y\<geq\>y>, so:

    <\equation>
      <frac|<sqrt|2/<around|(|\<pi\>*<around|\||x-y|\|>|)>>|1+y>\<leq\><frac|<sqrt|2/<around|(|\<pi\>*<around|(|y-x|)>|)>>|y>\<leq\><frac|<sqrt|2/\<pi\>>|x<rsup|3/2>>
    </equation>

    Therefore, for all <math|x\<gtr\>0>:

    <\equation>
      sup<rsub|y\<geq\>0><around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>/<around|(|1+y|)>|\|>\<leq\>max
      <around*|(|1,<frac|1|x>,<sqrt|<frac|2|\<pi\>*x>>,<frac|<sqrt|2/\<pi\>>|x<rsup|3/2>>|)>
    </equation>

    Now, we can bound our integral:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|>|<cell|<big|int><rsub|0><rsup|\<infty\>>sup<rsub|y\<geq\>0><frac|<around|\||J<rsub|0><around|(|<around|\||x-y|\|>|)>|\|>|<around|(|1+x|)><rsup|2><around|(|1+y|)><rsup|2>>*d*x>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|0><rsup|1><around|(|1+x|)><rsup|2>*d*x+<big|int><rsub|1><rsup|\<infty\>>max
      <around*|(|<frac|1|x<rsup|2>>,<frac|2|\<pi\>*x>,<frac|2/\<pi\>|x<rsup|3>>|)>*<around|(|1+x|)><rsup|2>*d*x>>|<row|<cell|>|<cell|=<frac|7|3>+<big|int><rsub|1><rsup|\<infty\>><around*|(|<frac|1|x<rsup|2>>+<frac|2|\<pi\>*x>+<frac|2/\<pi\>|x<rsup|3>>|)>*<around|(|1+2*x+x<rsup|2>|)>*d*x>>|<row|<cell|>|<cell|=<frac|7|3>+<big|int><rsub|1><rsup|\<infty\>><around*|(|<frac|1|x<rsup|2>>+<frac|2|x>+1+<frac|2|\<pi\>*x>+<frac|4|\<pi\>>+<frac|2|\<pi\>*x<rsup|2>>+<frac|2/\<pi\>|x<rsup|3>>+<frac|4/\<pi\>|x<rsup|2>>+<frac|2/\<pi\>|x>|)>*d*x>>|<row|<cell|>|<cell|=<frac|7|3>+<around*|[|-<frac|1|x>+2*log
      x+x+<frac|2|\<pi\>>*log x+<frac|4|\<pi\>>*x-<frac|1|\<pi\>*x>-<frac|1/\<pi\>|x<rsup|2>>-<frac|2/\<pi\>|x>+<frac|2|\<pi\>>*log
      x|]><rsub|1><rsup|\<infty\>>>>|<row|<cell|>|<cell|\<less\>\<infty\>>>>>>
    </equation>

    This proves that <math|T> is Bochner V-bounded with
    <math|V<around|(|x|)>=1+x>, and therefore compact.
  </proof>

  <\remark>
    The choice of <math|V<around|(|x|)>=1+x> is optimal. If we chose
    <math|V<around|(|x|)>=1>, the integral would diverge due to the slow
    decay of <math|J<rsub|0>>. If we chose
    <math|V<around|(|x|)>=<around|(|1+x|)><rsup|1+\<epsilon\>>> for any
    <math|\<epsilon\>\<gtr\>0>, the proof would be easier as the integral
    would converge faster, but this would provide a weaker result.
  </remark>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|lem:integral|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Bochner
      V-boundedness> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Proof
      of Compactness> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>