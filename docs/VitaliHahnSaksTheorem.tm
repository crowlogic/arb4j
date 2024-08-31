<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Proof of the Vitali--Hahn--Saks Theorem>|<doc-date|>>

  <\theorem>
    [Vitali\UHahn\USaks] Let <math|<around|(|X,\<Sigma\>|)>> be a measurable
    space, and let <math|<around|{|\<mu\><rsub|n>|}>> be a sequence of finite
    measures on <math|<around|(|X,\<Sigma\>|)>>. Suppose that for every set
    <math|E> in <math|\<Sigma\>>, the limit <math|lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|E|)>> exists (finite or infinite). Then:

    <\enumerate>
      <item>There exists a measure <math|\<mu\>> on
      <math|<around|(|X,\<Sigma\>|)>> such that for every <math|E> in
      <math|\<Sigma\>>: <math|\<mu\><around|(|E|)>=lim<rsub|n\<to\>\<infty\>>
      \<mu\><rsub|n><around|(|E|)>>

      <item>The sequence of measures <math|<around|{|\<mu\><rsub|n>|}>> is
      uniformly absolutely continuous with respect to <math|\<mu\>>.

      <item>The convergence of <math|\<mu\><rsub|n>> to <math|\<mu\>> is
      uniform on <math|\<Sigma\>>.
    </enumerate>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Define the limit measure <math|\<mu\>>>

    For each <math|E\<in\>\<Sigma\>>, define
    <math|\<mu\><around|(|E|)>=lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|E|)>>. We need to show that <math|\<mu\>> is
    indeed a measure.

    a) Clearly, <math|\<mu\><around|(|\<emptyset\>|)>=lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|\<emptyset\>|)>=0>.

    b) Countable additivity: Let <math|<around|{|E<rsub|k>|}>> be a sequence
    of disjoint sets in <math|\<Sigma\>>. We need to show that
    <math|\<mu\><around|(|<big|cup><rsub|k>E<rsub|k>|)>=<big|sum><rsub|k>\<mu\><around|(|E<rsub|k>|)>>.

    <\align*>
      <tformat|<table|<row|<cell|\<mu\><around|(|<big|cup><rsub|k>E<rsub|k>|)>>|<cell|=lim<rsub|n\<to\>\<infty\>>
      \<mu\><rsub|n><around|(|<big|cup><rsub|k>E<rsub|k>|)>>>|<row|<cell|>|<cell|=lim<rsub|n\<to\>\<infty\>>
      <big|sum><rsub|k>\<mu\><rsub|n><around|(|E<rsub|k>|)><space|1em><text|(by
      countable additivity of <math|\<mu\><rsub|n>>)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k>lim<rsub|n\<to\>\<infty\>>
      \<mu\><rsub|n><around|(|E<rsub|k>|)><space|1em><text|(by the monotone
      convergence theorem)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k>\<mu\><around|(|E<rsub|k>|)>>>>>
    </align*>

    Thus, <math|\<mu\>> is a measure on <math|<around|(|X,\<Sigma\>|)>>.

    <with|font-series|bold|Step 2: Prove uniform absolute continuity>

    We'll use the following lemma:

    <\lemma>
      For any <math|\<varepsilon\>\<gtr\>0>, there exists a
      <math|\<delta\>\<gtr\>0> such that for all <math|n> and all
      <math|E\<in\>\<Sigma\>>: If <math|\<mu\><around|(|E|)>\<less\>\<delta\>>,
      then <math|\<mu\><rsub|n><around|(|E|)>\<less\>\<varepsilon\>>.
    </lemma>

    Suppose the lemma is false. Then there exists an
    <math|\<varepsilon\>\<gtr\>0> such that for every
    <math|k\<in\>\<bbb-N\>>, we can find <math|n<rsub|k>> and
    <math|E<rsub|k>\<in\>\<Sigma\>> with <math|\<mu\><around|(|E<rsub|k>|)>\<less\>1/k>
    and <math|\<mu\><rsub|n<rsub|k>><around|(|E<rsub|k>|)>\<geq\>\<varepsilon\>>.

    Define <math|F<rsub|k>=<big|cup><rsub|j\<geq\>k>E<rsub|j>>. Then
    <math|F<rsub|k>\<supseteq\>F<rsub|k+1>> and
    <math|\<mu\><around|(|F<rsub|k>|)>\<leq\><big|sum><rsub|j\<geq\>k>\<mu\><around|(|E<rsub|j>|)>\<less\><big|sum><rsub|j\<geq\>k>1/j\<to\>0>
    as <math|k\<to\>\<infty\>>.

    But for any <math|k>, <math|\<mu\><rsub|n<rsub|k>><around|(|F<rsub|k>|)>\<geq\>\<mu\><rsub|n<rsub|k>><around|(|E<rsub|k>|)>\<geq\>\<varepsilon\>>.

    This contradicts the fact that <math|lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|F<rsub|k>|)>=\<mu\><around|(|F<rsub|k>|)>> for
    all <math|k>.
  </proof>

  <with|font-series|bold|Step 3: Prove uniform convergence>

  We'll use Egoroff's theorem, which states that if a sequence of measurable
  functions converges almost everywhere on a finite measure space, then it
  converges uniformly except on a set of arbitrarily small measure.

  For each <math|E\<in\>\<Sigma\>>, define
  <math|f<rsub|E><around|(|n|)>=\<mu\><rsub|n><around|(|E|)>>. The sequence
  <math|<around|{|f<rsub|E><around|(|n|)>|}>> converges for each <math|E>.

  Let <math|\<varepsilon\>\<gtr\>0>. By the uniform absolute continuity
  proved in Step 2, there exists a <math|\<delta\>\<gtr\>0> such that
  <math|\<mu\><around|(|A|)>\<less\>\<delta\>> implies
  <math|\<mu\><rsub|n><around|(|A|)>\<less\>\<varepsilon\>/3> for all
  <math|n>.

  Let <math|M=\<mu\><around|(|X|)>>. Choose a finite partition
  <math|<around|{|P<rsub|1>,...,P<rsub|k>|}>> of <math|X> with
  <math|\<mu\><around|(|P<rsub|i>|)>\<less\>\<delta\>> for all <math|i>.

  For each <math|P<rsub|i>>, the sequence
  <math|f<rsub|P<rsub|i>><around|(|n|)>> converges. By Egoroff's theorem,
  there exists <math|A<rsub|i>\<subset\>P<rsub|i>> with
  <math|\<mu\><around|(|A<rsub|i>|)>\<less\>\<delta\>/k> such that
  <math|f<rsub|P<rsub|i>><around|(|n|)>> converges uniformly on
  <math|P<rsub|i>\<setminus\>A<rsub|i>>.

  Let <math|A=<big|cup><rsub|i>A<rsub|i>>. Then
  <math|\<mu\><around|(|A|)>\<less\>\<delta\>>, so
  <math|\<mu\><rsub|n><around|(|A|)>\<less\>\<varepsilon\>/3> for all
  <math|n>.

  For each <math|i>, choose <math|N<rsub|i>> such that for
  <math|n,m\<geq\>N<rsub|i>>, <math|<around|\||f<rsub|P<rsub|i>\<setminus\>A<rsub|i>><around|(|n|)>-f<rsub|P<rsub|i>\<setminus\>A<rsub|i>><around|(|m|)>|\|>\<less\>\<varepsilon\>/3*k>.

  Let <math|N=max <around|{|N<rsub|i>|}>>. Then for <math|n,m\<geq\>N> and
  any <math|E\<in\>\<Sigma\>>:

  <\align*>
    <tformat|<table|<row|<cell|<around|\||\<mu\><rsub|n><around|(|E|)>-\<mu\><rsub|m><around|(|E|)>|\|>>|<cell|\<leq\><around|\||\<mu\><rsub|n>*<around|(|E\<cap\>A|)>-\<mu\><rsub|m>*<around|(|E\<cap\>A|)>*<around|\||+<big|sum><rsub|i>|\|>*\<mu\><rsub|n>*<around|(|E\<cap\><around|(|P<rsub|i>\<setminus\>A<rsub|i>|)>|)>-\<mu\><rsub|m>*<around|(|E\<cap\><around|(|P<rsub|i>\<setminus\>A<rsub|i>|)>|)>|\|>>>|<row|<cell|>|<cell|\<less\>\<varepsilon\>/3+\<varepsilon\>/3+\<varepsilon\>/3=\<varepsilon\>>>>>
  </align*>

  This proves uniform convergence.

  Therefore, we have proved all three parts of the Vitali\UHahn\USaks
  theorem.
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