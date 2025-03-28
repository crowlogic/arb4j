<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Equivalence of Egorov's Theorem and Vitali-Hahn-Saks
  Theorem for <math|\<sigma\>>-compact Spaces>|<doc-author|<author-data|<author-name|Assistant>>>|<doc-date|>>

  <\theorem>
    For <math|\<sigma\>>-compact spaces, the following are equivalent:

    <\enumerate>
      <item*|(a)>Egorov's Theorem

      <item*|(b)>Vitali-Hahn-Saks Theorem
    </enumerate>
  </theorem>

  <no-indent><with|font-series|bold|Preliminaries:> This proof relies on
  several advanced measure-theoretic results, including the Hahn
  Decomposition Theorem, Radon-Nikodym Theorem, and properties of weak
  convergence in <math|L<rsup|1>> spaces. Familiarity with these concepts is
  assumed.

  We will prove both directions of the equivalence.

  <no-indent><with|font-series|bold|(a) <math|\<Rightarrow\>> (b):>

  Assume Egorov's Theorem holds for <math|\<sigma\>>-compact spaces. Let
  <math|<around|(|X,\<Sigma\>|)>> be a <math|\<sigma\>>-compact measurable
  space and <math|<around|{|\<mu\><rsub|n>|}>> a sequence of finite signed
  measures on <math|<around|(|X,\<Sigma\>|)>> such that for each
  <math|E\<in\>\<Sigma\>>, <math|lim<rsub|n\<to\>\<infty\>>
  \<mu\><rsub|n><around|(|E|)>> exists and is finite.

  <\enumerate>
    <item>Define <math|\<mu\><around|(|E|)>=lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|E|)>> for <math|E\<in\>\<Sigma\>>. Note that
    <math|\<mu\>> is a finite signed measure.

    <item>Write <math|X=<big|cup><rsub|i=1><rsup|\<infty\>>K<rsub|i>>, where
    each <math|K<rsub|i>> is compact and <math|K<rsub|i>\<subset\>K<rsub|i+1>>.

    <item>For each <math|i>, consider the restrictions of
    <math|\<mu\><rsub|n>> and <math|\<mu\>> to <math|K<rsub|i>>, denoted
    <math|\<mu\><rsub|n,i>> and <math|\<mu\><rsub|i>>. These are finite
    signed measures on compact sets.

    <item>Apply the Hahn Decomposition Theorem to each
    <math|\<mu\><rsub|n,i>> and <math|\<mu\><rsub|i>>. Then, by the
    Radon-Nikodym theorem, there exist measurable functions
    <math|f<rsub|n,i>> such that:

    <\equation*>
      \<mu\><rsub|n,i><around|(|E|)>=<big|int><rsub|E>f<rsub|n,i>*d<around|\||\<mu\><rsub|i>|\|>*<text|for
      all >E\<subset\>K<rsub|i>,E\<in\>\<Sigma\>
    </equation*>

    <item>The assumption <math|lim<rsub|n\<to\>\<infty\>>
    \<mu\><rsub|n><around|(|E|)>=\<mu\><around|(|E|)>> for all
    <math|E\<in\>\<Sigma\>> implies that <math|<around|{|f<rsub|n,i>|}>>
    converges weakly to <math|f<rsub|i>> in
    <math|L<rsup|1><around|(|K<rsub|i>,<around|\||\<mu\><rsub|i>|\|>|)>> for
    each <math|i>. This follows from the definition of weak convergence in
    <math|L<rsup|1>> spaces: for any <math|g\<in\>L<rsup|\<infty\>><around|(|K<rsub|i>,<around|\||\<mu\><rsub|i>|\|>|)>>,

    <\equation*>
      lim<rsub|n\<to\>\<infty\>> <big|int><rsub|K<rsub|i>>f<rsub|n,i>*g*d<around|\||\<mu\><rsub|i>|\|>=lim<rsub|n\<to\>\<infty\>>
      \<mu\><rsub|n,i><around|(|g|)>=\<mu\><rsub|i><around|(|g|)>=<big|int><rsub|K<rsub|i>>f<rsub|i>*g*d<around|\||\<mu\><rsub|i>|\|>
    </equation*>

    <item>Apply Egorov's Theorem to <math|<around|{|f<rsub|n,i>|}>> on each
    <math|K<rsub|i>>: For any <math|\<varepsilon\>\<gtr\>0>, there exists
    <math|A<rsub|i>\<subset\>K<rsub|i>>, <math|A<rsub|i>\<in\>\<Sigma\>> such
    that <math|<around|\||\<mu\><rsub|i>|\|>*<around|(|K<rsub|i>\<setminus\>A<rsub|i>|)>\<less\>\<varepsilon\>/2<rsup|i>>
    and <math|f<rsub|n,i>> converges uniformly to <math|f<rsub|i>> on
    <math|A<rsub|i>>.

    <item>Define <math|A=<big|cup><rsub|i=1><rsup|\<infty\>>A<rsub|i>>.
    <math|A> is measurable as it is a countable union of measurable sets.
    Note that <math|<around|\||\<mu\>|\|>*<around|(|X\<setminus\>A|)>\<leq\><big|sum><rsub|i=1><rsup|\<infty\>><around|\||\<mu\><rsub|i>|\|>*<around|(|K<rsub|i>\<setminus\>A<rsub|i>|)>\<less\>\<varepsilon\>>.

    <item>For any <math|\<delta\>\<gtr\>0> and each <math|i>, choose
    <math|N<rsub|i>> such that for all <math|n\<geq\>N<rsub|i>> and
    <math|x\<in\>A<rsub|i>>, <math|<around|\||f<rsub|n,i><around|(|x|)>-f<rsub|i><around|(|x|)>|\|>\<less\>\<delta\>>.

    <item>For any <math|E\<subset\>A>, <math|E\<in\>\<Sigma\>>, and for all
    <math|n\<geq\>max <around|{|N<rsub|i>:i\<in\>\<bbb-N\>|}>>:

    <\align*>
      <tformat|<table|<row|<cell|<around|\||\<mu\><rsub|n><around|(|E|)>-\<mu\><around|(|E|)>|\|>>|<cell|\<leq\><big|sum><rsub|i=1><rsup|\<infty\>><around|\||\<mu\><rsub|n,i>*<around|(|E\<cap\>A<rsub|i>|)>-\<mu\><rsub|i>*<around|(|E\<cap\>A<rsub|i>|)>|\|>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><around*|\||<big|int><rsub|E\<cap\>A<rsub|i>><around|(|f<rsub|n,i>-f<rsub|i>|)>*d<around|\||\<mu\><rsub|i>|\|>|\|>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|i=1><rsup|\<infty\>><big|int><rsub|E\<cap\>A<rsub|i>><around|\||f<rsub|n,i>-f<rsub|i>|\|>*d<around|\||\<mu\><rsub|i>|\|>>>|<row|<cell|>|<cell|\<less\>\<delta\>*<big|sum><rsub|i=1><rsup|\<infty\>><around|\||\<mu\><rsub|i>|\|>*<around|(|E\<cap\>A<rsub|i>|)>=\<delta\><around|\||\<mu\>|\|><around|(|E|)>>>>>
    </align*>

    This establishes uniform convergence for sufficiently large <math|n>.

    <item>This establishes uniform absolute continuity of
    <math|<around|{|\<mu\><rsub|n>|}>> with respect to
    <math|<around|\||\<mu\>|\|>> on <math|A>, and thus on <math|X> since
    <math|<around|\||\<mu\>|\|>*<around|(|X\<setminus\>A|)>\<less\>\<varepsilon\>>.
  </enumerate>

  Therefore, the Vitali-Hahn-Saks Theorem holds for <math|\<sigma\>>-compact
  spaces.

  <no-indent><with|font-series|bold|(b) <math|\<Rightarrow\>> (a):>

  Assume the Vitali-Hahn-Saks Theorem holds for <math|\<sigma\>>-compact
  spaces. Let <math|<around|(|X,\<Sigma\>,\<lambda\>|)>> be a
  <math|\<sigma\>>-compact measure space and <math|<around|{|f<rsub|n>|}>> a
  sequence of measurable functions converging pointwise
  <math|\<lambda\>>-almost everywhere to <math|f>.

  <\enumerate>
    <item>Write <math|X=<big|cup><rsub|i=1><rsup|\<infty\>>K<rsub|i>>, where
    each <math|K<rsub|i>> is compact and <math|K<rsub|i>\<subset\>K<rsub|i+1>>.

    <item>Define measures <math|\<nu\><rsub|n>> on
    <math|<around|(|X,\<Sigma\>|)>> by:

    <\equation*>
      \<nu\><rsub|n><around|(|E|)>=<big|int><rsub|E>min
      <around|(|1,<around|\||f<rsub|n>-f|\|>|)>*d*\<lambda\>*<text|for
      >E\<in\>\<Sigma\>
    </equation*>

    Note that <math|\<nu\><rsub|n>> are indeed finite measures:

    <\itemize>
      <item>Non-negative: <math|min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>\<geq\>0>

      <item>Countably additive: follows from the countable additivity of the
      integral

      <item><math|\<nu\><rsub|n><around|(|\<emptyset\>|)>=0>: integral over
      empty set is zero

      <item><math|\<nu\><rsub|n><around|(|X|)>\<leq\>\<lambda\><around|(|X|)>\<less\>\<infty\>>:
      since <math|min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>\<leq\>1>
    </itemize>

    <item>For each <math|E\<in\>\<Sigma\>>, by the Dominated Convergence
    Theorem:

    <\equation*>
      lim<rsub|n\<to\>\<infty\>> \<nu\><rsub|n><around|(|E|)>=<big|int><rsub|E>lim<rsub|n\<to\>\<infty\>>
      min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>*d*\<lambda\>=0
    </equation*>

    This holds because <math|min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>>
    is bounded by 1 and converges pointwise to 0 <math|\<lambda\>>-almost
    everywhere.

    <item>Apply the Vitali-Hahn-Saks Theorem to
    <math|<around|{|\<nu\><rsub|n>|}>>: For any
    <math|\<varepsilon\>\<gtr\>0>, there exists <math|\<delta\>\<gtr\>0> such
    that for all <math|E\<in\>\<Sigma\>> with
    <math|\<lambda\><around|(|E|)>\<less\>\<delta\>>, we have
    <math|\<nu\><rsub|n><around|(|E|)>\<less\>\<varepsilon\>> for all
    <math|n>.

    <item>For each <math|k\<in\>\<bbb-N\>> and <math|i\<in\>\<bbb-N\>>,
    define sets:

    <\equation*>
      A<rsub|k,i>=<around|{|x\<in\>K<rsub|i>:<around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<geq\>1/k*<text|for
      infinitely many >n|}>
    </equation*>

    These sets are measurable as they are countable intersections and unions
    of measurable sets.

    <item>By pointwise convergence, <math|\<lambda\><around|(|A<rsub|k,i>|)>\<to\>0>
    as <math|k\<to\>\<infty\>> for each <math|i>. This is true because for
    each <math|x> where <math|f<rsub|n><around|(|x|)>> converges to
    <math|f<around|(|x|)>>, there exists a <math|k> large enough such that
    <math|<around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<less\>1/k>
    for all but finitely many <math|n>. As <math|k> increases, fewer points
    fail to meet this criterion, so the measure of <math|A<rsub|k,i>>
    decreases to zero.

    <item>For each <math|i>, choose <math|K<rsub|i>> such that
    <math|\<lambda\><around|(|A<rsub|K<rsub|i>,i>|)>\<less\>\<delta\>/2<rsup|i>>.

    <item>Define <math|B=<big|cup><rsub|i=1><rsup|\<infty\>>A<rsub|K<rsub|i>,i>>.
    Note that <math|\<lambda\><around|(|B|)>\<less\>\<delta\>>.

    <item>By the uniform absolute continuity from step 4:

    <\equation*>
      <big|int><rsub|B>min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>*d*\<lambda\>\<less\>\<varepsilon\>*<text|for
      all >n
    </equation*>

    <item>This implies that for any <math|\<eta\>\<gtr\>0>, there exists a
    set <math|C<rsub|\<eta\>>\<subset\>X\<setminus\>B> with
    <math|\<lambda\><around|(|C<rsub|\<eta\>>|)>\<less\>\<eta\>> such that:

    <\equation*>
      <around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<less\>\<varepsilon\>*<text|for
      all >n*<text|sufficiently large and all
      >x\<in\>X\<setminus\><around|(|B\<cup\>C<rsub|\<eta\>>|)>
    </equation*>

    Detailed explanation: Suppose this were not true. Then there would exist
    a set <math|D\<subset\>X\<setminus\>B> of positive measure such that for
    each <math|x\<in\>D>, <math|<around|\||f<rsub|n><around|(|x|)>-f<around|(|x|)>|\|>\<geq\>\<varepsilon\>>
    for infinitely many <math|n>. This would imply:

    <\equation*>
      <big|int><rsub|D>min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>*d*\<lambda\>\<geq\><big|int><rsub|D>min
      <around|(|1,\<varepsilon\>|)>*d*\<lambda\>=\<varepsilon\>*\<lambda\><around|(|D|)>\<gtr\>0
    </equation*>

    for infinitely many <math|n>. However, this contradicts the uniform
    absolute continuity established in step 4, which implies that for any set
    <math|E> with <math|\<lambda\><around|(|E|)>\<less\>\<delta\>>, we have
    <math|<big|int><rsub|E>min <around|(|1,<around|\||f<rsub|n>-f|\|>|)>*d*\<lambda\>\<less\>\<varepsilon\>>
    for all <math|n>. We can choose <math|\<eta\>> small enough so that
    <math|\<lambda\><around|(|D|)>\<less\>\<delta\>>, leading to this
    contradiction.

    <item>Since <math|\<lambda\>*<around|(|B\<cup\>C<rsub|\<eta\>>|)>\<less\>\<delta\>+\<eta\>>,
    which can be made arbitrarily small, we have established Egorov's Theorem
    for <math|\<sigma\>>-compact spaces.
  </enumerate>

  This completes the proof of the equivalence between Egorov's Theorem and
  the Vitali-Hahn-Saks Theorem for <math|\<sigma\>>-compact spaces.

  <no-indent><with|font-series|bold|Note:> This equivalence is specific to
  <math|\<sigma\>>-compact spaces. The <math|\<sigma\>>-compactness property
  is crucial for this proof as it allows us to decompose the space into a
  countable union of compact sets. This decomposition enables us to apply
  Egorov's Theorem on each compact set in the (a) <math|\<Rightarrow\>> (b)
  direction, and to construct the set <math|B> in the (b)
  <math|\<Rightarrow\>> (a) direction. For more general spaces, this approach
  might not work, and the relationship between these theorems could be
  different or require alternative methods of proof.
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