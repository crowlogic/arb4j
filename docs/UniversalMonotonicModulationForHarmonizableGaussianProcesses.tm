<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Universality of Monotonic Modulation for Harmonizable
  Gaussian Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Spectral
    Resolution Fundamentals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Random
    Measure Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Integrated
    Main Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Connection
    to Prior Work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Spectral Resolution Fundamentals>

  <\definition>
    [Strong vs Weak Harmonizability] A Gaussian process
    <math|<around|{|Y<rsub|t>|}>> is:

    <\itemize>
      <item><em|Strongly harmonizable> if its spectral bimeasure
      <math|\<Phi\>> extends to a complex measure on <math|\<bbb-R\><rsup|2>>

      <item><em|Weakly harmonizable> if <math|\<Phi\>> is a bimeasure of
      bounded variation
    </itemize>
  </definition>

  <\definition>
    [Bounded Variation for Bimeasures] A complex bimeasure <math|\<Phi\>> on
    <math|\<bbb-R\><rsup|2>> has <em|bounded variation> if

    <\equation>
      <around|\<\|\|\>|\<Phi\>|\<\|\|\>><rsub|B*V>\<assign\>sup
      <around*|{|<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|n><around|\||\<Phi\><around|(|A<rsub|i>,B<rsub|j>|)>|\|>|}>\<less\>\<infty\>
    </equation>

    where the supremum is taken over all finite partitions
    <math|<around|{|A<rsub|1>,\<ldots\>,A<rsub|m>|}>> and
    <math|<around|{|B<rsub|1>,\<ldots\>,B<rsub|n>|}>> of <math|\<bbb-R\>>.
  </definition>

  <\definition>
    [Variation Measure] For a spectral bimeasure <math|\<Phi\>> of bounded
    variation, its <em|variation measure> <math|<around|\||\<Phi\>|\|>> is
    defined for all Borel sets <math|E,F\<subset\>\<bbb-R\>> as:

    <\equation>
      <around|\||\<Phi\>|\|>*<around|(|E\<times\>F|)>=sup
      <around*|{|<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|n><around|\||\<Phi\><around|(|E<rsub|i>,F<rsub|j>|)>|\|>|}>
    </equation>

    where the supremum is over all finite partitions
    <math|<around|{|E<rsub|i>|}><rsub|i=1><rsup|m>> of <math|E> and
    <math|<around|{|F<rsub|j>|}><rsub|j=1><rsup|n>> of <math|F>.
  </definition>

  <\definition>
    [Dominating Measure] A positive measure <math|\<nu\>> on <math|\<bbb-R\>>
    <em|dominates> a bimeasure <math|\<Phi\>> if, for all Borel sets
    <math|E\<subset\>\<bbb-R\>>:

    <\equation>
      \<nu\><around|(|E|)>=<around|\||\<Phi\>|\|>*<around|(|E\<times\>\<bbb-R\>|)>+<around|\||\<Phi\>|\|>*<around|(|\<bbb-R\>\<times\>E|)>
    </equation>

    and <math|\<Phi\><around|(|A,B|)>=0> whenever
    <math|\<nu\><around|(|A|)>=0> or <math|\<nu\><around|(|B|)>=0> for Borel
    sets <math|A,B\<subset\>\<bbb-R\>>.
  </definition>

  <\definition>
    [Grothendieck's Constant] Grothendieck's constant <math|K<rsub|G>> is
    defined as the smallest positive number such that for any Hilbert space
    <math|\<cal-H\>>, any bounded bilinear form
    <math|T:\<cal-H\>\<times\>\<cal-H\>\<to\>\<bbb-C\>>, and any sequences
    <math|<around|{|x<rsub|i>|}><rsub|i=1><rsup|n>,<around|{|y<rsub|j>|}><rsub|j=1><rsup|m>>
    in the unit ball of <math|\<cal-H\>>:

    <\equation>
      <around*|\||<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|m>a<rsub|i*j>*<around|\<langle\>|x<rsub|i>,y<rsub|j>|\<rangle\>><rsub|\<cal-H\>>|\|>\<leq\>K<rsub|G><around|\<\|\|\>|T|\<\|\|\>><sqrt|<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|m><around|\||a<rsub|i*j>|\|><rsup|2>>
    </equation>

    where <math|<around|\<\|\|\>|T|\<\|\|\>>> is the operator norm of
    <math|T>.
  </definition>

  <\theorem>
    [Bochner's Theorem] A continuous function
    <math|K:\<bbb-R\>\<to\>\<bbb-C\>> is the covariance function of a
    stationary Gaussian process if and only if it is positive definite and
    there exists a finite positive measure <math|\<nu\>> such that:

    <\equation>
      K*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*\<nu\><around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\theorem>
    [Spectral Bimeasure Characterization] For any harmonizable Gaussian
    process, the covariance admits:

    <\equation>
      \<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*d*\<Phi\><around|(|\<lambda\>,\<mu\>|)>
    </equation>

    where <math|\<Phi\>> has finite Vitali variation:
    <math|<around|\<\|\|\>|\<Phi\>|\<\|\|\>><rsub|B*V>\<less\>\<infty\>>.
  </theorem>

  <\proof>
    Consider the family of functions <math|<around|{|f<rsub|t><around|(|\<lambda\>|)>=e<rsup|i*\<lambda\>*t>|}><rsub|t\<in\>\<bbb-R\>>>.
    For any finite collection of time points
    <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>> and constants
    <math|<around|{|c<rsub|1>,\<ldots\>,c<rsub|n>|}>>, the positive
    definiteness of the covariance function implies:

    <\equation>
      <big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\>*<around|[|Y<rsub|t<rsub|j>>*Y<rsub|t<rsub|k>><rsup|\<ast\>>|]>\<geq\>0
    </equation>

    Let <math|B*<around|(|t,s|)>=\<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>>
    denote the covariance function. A bilinear form can be defined:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>><rsub|B>=<iint>f<around|(|t|)>*g<around|(|s|)><rsup|\<ast\>>*B*<around|(|t,s|)>*d*t*d*s
    </equation>

    This bilinear form defines a Hilbert space of functions. The key insight
    is that <math|B*<around|(|t,s|)>> is the reproducing kernel for this
    space.

    For any function <math|h<around|(|t|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*e<rsup|i*\<lambda\><rsub|j>*t>>,
    the following holds:

    <\equation>
      <around|\<\|\|\>|h|\<\|\|\>><rsub|B><rsup|2>=<big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>B*<around|(|\<lambda\><rsub|j>,\<lambda\><rsub|k>|)>
    </equation>

    By extending Bochner's theorem to bimeasures, there exists a complex
    bimeasure <math|\<Phi\>> on <math|\<bbb-R\><rsup|2>> such that:

    <\equation>
      B*<around|(|t,s|)>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*d*\<Phi\><around|(|\<lambda\>,\<mu\>|)>
    </equation>

    The bound on variation follows from the fact that for any finite
    partition <math|<around|{|A<rsub|i>|}><rsub|i=1><rsup|m>>,
    <math|<around|{|B<rsub|j>|}><rsub|j=1><rsup|n>> of <math|\<bbb-R\>>:

    <\equation>
      <big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|n><around|\||\<Phi\><around|(|A<rsub|i>,B<rsub|j>|)>|\|>\<leq\>K<rsub|G>\<cdot\>sup<rsub|t,s><around|\||B*<around|(|t,s|)>|\|>
    </equation>

    where <math|K<rsub|G>> is Grothendieck's constant as defined above, which
    bounds the norm of bilinear forms.
  </proof>

  <\theorem>
    [Generalized Spectral Density] When <math|\<Phi\>\<ll\>\<lambda\>\<otimes\>\<lambda\>>
    (Lebesgue measure), there exists a density
    <math|S<around|(|\<lambda\>,\<mu\>|)>> such that:

    <\equation>
      \<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*S<around|(|\<lambda\>,\<mu\>|)>*d*\<lambda\>*d*\<mu\>
    </equation>

    with <math|S<around|(|\<lambda\>,\<mu\>|)>=<frac|\<partial\><rsup|2>*\<Phi\>|\<partial\>*\<lambda\>*\<partial\>*\<mu\>>*<around|(|\<lambda\>,\<mu\>|)>>
    where this derivative is defined as:

    <\equation>
      <frac|\<partial\><rsup|2>*\<Phi\>|\<partial\>*\<lambda\>*\<partial\>*\<mu\>>*<around|(|\<lambda\>,\<mu\>|)>=lim<rsub|h,k\<to\>0>
      <frac|\<Phi\><around|(|<around|(|\<lambda\>-h,\<lambda\>|]>,<around|(|\<mu\>-k,\<mu\>|]>|)>|h*k>
    </equation>

    when this limit exists.
  </theorem>

  <\proof>
    The proof begins with the Lebesgue decomposition theorem, which states
    that any complex bimeasure <math|\<Phi\>> can be decomposed as:

    <\equation>
      \<Phi\>=\<Phi\><rsub|a*c>+\<Phi\><rsub|s>
    </equation>

    where <math|\<Phi\><rsub|a*c>\<ll\>\<lambda\>\<otimes\>\<lambda\>>
    (absolutely continuous with respect to Lebesgue measure) and
    <math|\<Phi\><rsub|s>\<perp\>\<lambda\>\<otimes\>\<lambda\>> (singular
    with respect to Lebesgue measure).

    For the absolutely continuous part <math|\<Phi\><rsub|a*c>>, the
    Radon-Nikodym theorem guarantees the existence of a measurable function
    <math|S<around|(|\<lambda\>,\<mu\>|)>> such that:

    <\equation>
      \<Phi\><rsub|a*c><around|(|A,B|)>=<big|int><rsub|A><big|int><rsub|B>S<around|(|\<lambda\>,\<mu\>|)>*d*\<lambda\>*d*\<mu\>
    </equation>

    for all Borel sets <math|A,B\<subset\>\<bbb-R\>>.

    This function <math|S<around|(|\<lambda\>,\<mu\>|)>> is the generalized
    spectral density. To see that it equals
    <math|<frac|\<partial\><rsup|2>*\<Phi\>|\<partial\>*\<lambda\>*\<partial\>*\<mu\>>*<around|(|\<lambda\>,\<mu\>|)>>,
    the fundamental theorem of calculus for Lebesgue integrals is utilized:

    Define the cumulative distribution function:

    <\equation>
      F<around|(|\<lambda\>,\<mu\>|)>=\<Phi\><around|(|<around|(|-\<infty\>,\<lambda\>|]>,<around|(|-\<infty\>,\<mu\>|]>|)>
    </equation>

    For almost all points <math|<around|(|\<lambda\>,\<mu\>|)>>, the mixed
    derivative exists:

    <\equation>
      S<around|(|\<lambda\>,\<mu\>|)>=<frac|\<partial\><rsup|2>*F|\<partial\>*\<lambda\>*\<partial\>*\<mu\>>*<around|(|\<lambda\>,\<mu\>|)>=lim<rsub|h,k\<to\>0>
      <frac|\<Phi\><around|(|<around|(|\<lambda\>-h,\<lambda\>|]>,<around|(|\<mu\>-k,\<mu\>|]>|)>|h*k>
    </equation>

    The mixed derivative exists almost everywhere with respect to Lebesgue
    measure due to the absolute continuity assumption.

    For the singular part <math|\<Phi\><rsub|s>>, it vanishes when integrated
    against absolutely continuous functions like
    <math|e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>>. Therefore:

    <\equation>
      \<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*d*\<Phi\><around|(|\<lambda\>,\<mu\>|)>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*S<around|(|\<lambda\>,\<mu\>|)>*d*\<lambda\>*d*\<mu\>
    </equation>

    This representation holds for all <math|<around|(|t,s|)>\<in\>\<bbb-R\><rsup|2>>.
  </proof>

  <section|Random Measure Representation>

  <\definition>
    [Random Measure] A complex-valued random measure <math|Z> on
    <math|\<bbb-R\>> is a function that assigns to each Borel set
    <math|A\<subset\>\<bbb-R\>> a complex-valued random variable
    <math|Z<around|(|A|)>> such that:

    <\enumerate>
      <item><math|Z<around|(|\<emptyset\>|)>=0> almost surely

      <item>For any sequence <math|<around|{|A<rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
      of disjoint Borel sets, <math|Z<around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>A<rsub|n>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>Z<around|(|A<rsub|n>|)>>
      where the sum converges in the mean square sense.
    </enumerate>
  </definition>

  <\definition>
    [Orthogonal Random Measure] A random measure <math|Z> is called
    orthogonal if for any disjoint Borel sets <math|A> and <math|B>:

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|A|)>*Z<rsup|\<ast\>><around|(|B|)>|]>=0
    </equation>
  </definition>

  <\theorem>
    [Fourier Representation] Every harmonizable Gaussian process admits:

    <\equation>
      Y<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|Z<around|(|\<lambda\>|)>> is a right-continuous orthogonal
    random measure with:

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|A|)>*Z<rsup|\<ast\>><around|(|B|)>|]>=\<Phi\><around|(|A,B|)>
    </equation>

    for all Borel sets <math|A,B\<subset\>\<bbb-R\>>.
  </theorem>

  <\proof>
    The random measure <math|Z<around|(|\<lambda\>|)>> can be constructed
    directly from the Gaussian process <math|<around|{|Y<rsub|t>|}>>.
    Consider the linear space <math|\<cal-L\>> spanned by the random
    variables <math|<around|{|Y<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>, and let
    <math|\<cal-H\>> be the Hilbert space completion of <math|\<cal-L\>> with
    respect to the inner product <math|<around|\<langle\>|X,Y|\<rangle\>>=\<bbb-E\>*<around|[|X*Y<rsup|\<ast\>>|]>>.

    Step 1: Define an isometric map <math|V:L<rsup|2><around|(|e<rsup|i*t*\<lambda\>>,\<Phi\>|)>\<to\>\<cal-H\>>
    by:

    <\equation>
      V<around*|(|<big|sum><rsub|j=1><rsup|n>c<rsub|j>*e<rsup|i*t<rsub|j>*\<lambda\>>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*Y<rsub|t<rsub|j>>
    </equation>

    and extend by continuity. Here, <math|L<rsup|2><around|(|e<rsup|i*t*\<lambda\>>,\<Phi\>|)>>
    is the space of functions <math|<big|sum>c<rsub|j>*e<rsup|i*t<rsub|j>*\<lambda\>>>
    with norm:

    <\equation>
      <around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*e<rsup|i*t<rsub|j>*\<lambda\>>|\|><rsup|2><rsub|\<Phi\>>=<big|sum><rsub|j,k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>><big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|t<rsub|j>*\<lambda\>-t<rsub|k>*\<mu\>|)>>*d*\<Phi\><around|(|\<lambda\>,\<mu\>|)>
    </equation>

    Step 2: Define the indicator functions
    <math|<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,\<lambda\>|]>><around|(|x|)>>
    and observe:

    <\equation>
      <around|\<langle\>|<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,\<lambda\><rsub|1>|]>>,<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,\<lambda\><rsub|2>|]>>|\<rangle\>><rsub|\<Phi\>>=\<Phi\><around|(|<around|(|-\<infty\>,\<lambda\><rsub|1>|]>,<around|(|-\<infty\>,\<lambda\><rsub|2>|]>|)>
    </equation>

    Step 3: Define the random measure as:

    <\equation>
      Z<around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>=V<around|(|<with|math-font-family|bf|1><rsub|<around|(|-\<infty\>,\<lambda\>|]>>|)>
    </equation>

    and extend to all Borel sets by additivity. Specifically, for any Borel
    set <math|A>, write <math|A=<big|cup><rsub|j=1><rsup|\<infty\>>A<rsub|j>>
    with <math|A<rsub|j>> disjoint intervals, and define:

    <\equation>
      Z<around|(|A|)>=<big|sum><rsub|j=1><rsup|\<infty\>>Z<around|(|A<rsub|j>|)>
    </equation>

    This satisfies:

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|A|)>*Z<rsup|\<ast\>><around|(|B|)>|]>=<around|\<langle\>|<with|math-font-family|bf|1><rsub|A>,<with|math-font-family|bf|1><rsub|B>|\<rangle\>><rsub|\<Phi\>>=\<Phi\><around|(|A,B|)>
    </equation>

    Step 4: Express <math|Y<rsub|t>> through this random measure:

    <\equation>
      Y<rsub|t>=V<around|(|e<rsup|i*t*\<lambda\>>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*d*Z<around|(|\<lambda\>|)>
    </equation>

    where the integral is defined as the limit of simple functions:

    <\equation>
      <big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*d*Z<around|(|\<lambda\>|)>=lim<rsub|n\<to\>\<infty\>>
      <big|sum><rsub|j=1><rsup|k<rsub|n>>e<rsup|i*t*\<lambda\><rsub|j><rsup|<around|(|n|)>>>*Z<around|(|A<rsub|j><rsup|<around|(|n|)>>|)>
    </equation>

    with <math|<around|{|A<rsub|j><rsup|<around|(|n|)>>|}>> forming
    increasingly fine partitions of <math|\<bbb-R\>>, and the limit taken in
    the mean-square sense.

    This construction works for the entire real line. The right-continuity of
    <math|Z<around|(|\<lambda\>|)>> follows from the construction, and
    orthogonality is a consequence of the properties of <math|\<Phi\>>.
  </proof>

  <\lemma>
    [Canonical Factorization] For any harmonizable Gaussian process with
    spectral bimeasure <math|\<Phi\>>, there exists a Hilbert space
    <math|\<cal-K\>> and a function <math|\<psi\>:\<bbb-R\>\<to\>\<cal-K\>>
    such that:

    <\equation>
      \<Phi\><around|(|A,B|)>=<big|int><rsub|A><big|int><rsub|B><around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,\<psi\><around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>*d*\<lambda\>*d*\<mu\>
    </equation>

    This factorization provides the modulating function for
    <math|\<theta\><around|(|t|)>>.
  </lemma>

  <\proof>
    Let <math|\<nu\>> be the dominating measure for <math|\<Phi\>> as defined
    earlier, with <math|\<nu\><around|(|E|)>=<around|\||\<Phi\>|\|>*<around|(|E\<times\>\<bbb-R\>|)>+<around|\||\<Phi\>|\|>*<around|(|\<bbb-R\>\<times\>E|)>>.

    Define <math|\<cal-K\>=L<rsup|2><around|(|\<bbb-R\>,\<nu\>|)>>, the space
    of square-integrable functions with respect to <math|\<nu\>>. For each
    <math|\<lambda\>\<in\>\<bbb-R\>>, define the measure
    <math|\<Phi\><rsub|\<lambda\>>> on <math|\<bbb-R\>> by
    <math|\<Phi\><rsub|\<lambda\>><around|(|B|)>=\<Phi\><around|(|<around|{|\<lambda\>|}>,B|)>>.

    By the Radon-Nikodym theorem, for almost all <math|\<lambda\>> (with
    respect to Lebesgue measure), there exists a function
    <math|f<rsub|\<lambda\>>\<in\>L<rsup|1><around|(|\<bbb-R\>,\<nu\>|)>>
    such that:

    <\equation>
      \<Phi\><rsub|\<lambda\>><around|(|B|)>=<big|int><rsub|B>f<rsub|\<lambda\>><around|(|\<mu\>|)>*d*\<nu\><around|(|\<mu\>|)>
    </equation>

    for all Borel sets <math|B\<subset\>\<bbb-R\>>.

    Now define <math|\<psi\><around|(|\<lambda\>|)>\<in\>\<cal-K\>> by
    <math|\<psi\><around|(|\<lambda\>|)><around|(|\<mu\>|)>=<sqrt|f<rsub|\<lambda\>><around|(|\<mu\>|)>>>
    for each <math|\<lambda\>>, where the square root is defined pointwise
    for <math|\<mu\>\<in\>\<bbb-R\>>. This square root exists because
    <math|\<Phi\>> is a positive definite bimeasure, which implies
    <math|f<rsub|\<lambda\>><around|(|\<mu\>|)>\<geq\>0> for almost all
    <math|\<lambda\>,\<mu\>>.

    Direct computation verifies:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|A><big|int><rsub|B><around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,\<psi\><around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>*d*\<lambda\>*d*\<mu\>>|<cell|=<big|int><rsub|A><big|int><rsub|B><around*|(|<big|int><rsub|\<bbb-R\>>\<psi\><around|(|\<lambda\>|)><around|(|\<tau\>|)><wide|\<psi\><around|(|\<mu\>|)><around|(|\<tau\>|)>|\<bar\>>d*\<nu\><around|(|\<tau\>|)>|)>*d*\<lambda\>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|A><big|int><rsub|B><around*|(|<big|int><rsub|\<bbb-R\>><sqrt|f<rsub|\<lambda\>><around|(|\<tau\>|)>>*<sqrt|f<rsub|\<mu\>><around|(|\<tau\>|)>>*d*\<nu\><around|(|\<tau\>|)>|)>*d*\<lambda\>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|A><big|int><rsub|B>\<Phi\><around|(|d*\<lambda\>,d*\<mu\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Phi\><around|(|A,B|)><eq-number>>>>>
    </align>

    The function <math|\<psi\><around|(|\<lambda\>|)>> directly connects to
    the modulation function <math|\<theta\><around|(|t|)>> through:

    <\equation>
      <frac|d|d*t>*\<theta\><around|(|t|)>=<big|int><rsub|\<bbb-R\>><around|\||<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,e<rsup|i*\<lambda\>*t>|\<rangle\>><rsub|\<cal-K\>>|\|><rsup|2>*d*\<lambda\>
    </equation>

    where <math|<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,e<rsup|i*\<lambda\>*t>|\<rangle\>><rsub|\<cal-K\>>>
    means <math|<big|int><rsub|\<bbb-R\>>\<psi\><around|(|\<lambda\>|)><around|(|\<tau\>|)>*e<rsup|-i*\<lambda\>*t>*d*\<nu\><around|(|\<tau\>|)>>,
    and the derivative is taken in the sense of distributions if necessary.
  </proof>

  <section|Integrated Main Results>

  <\definition>
    [Stationary Dilation] Every harmonizable Gaussian process
    <math|<around|{|Y<rsub|t>|}>> has a <em|stationary dilation> consisting
    of:

    <\itemize>
      <item>A stationary Gaussian process <math|<around|{|Z<rsub|t>|}>> on a
      Hilbert space <math|\<cal-H\><rprime|'>\<supset\>\<cal-H\>>, where
      <math|\<cal-H\>=<wide|<text|span>|\<bar\>><around|{|Y<rsub|t>:t\<in\>\<bbb-R\>|}>>

      <item>An orthogonal projection <math|P:\<cal-H\><rprime|'>\<to\>\<cal-H\>>
      defined by the inner product <math|<around|\<langle\>|X,Y|\<rangle\>>=\<bbb-E\>*<around|[|X*Y<rsup|\<ast\>>|]>>
    </itemize>

    such that <math|Y<rsub|t>=P*Z<rsub|t>> almost surely.
  </definition>

  <\theorem>
    [Universality of Monotonic Modulation] Every weakly harmonizable Gaussian
    process <math|<around|{|Y<rsub|t>|}>> can be represented as:

    <\equation>
      Y<rsub|t>=Z<rsub|\<theta\><around|(|t|)>>
    </equation>

    where <math|<around|{|Z<rsub|t>|}>> is a stationary Gaussian process and
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is strictly increasing.
  </theorem>

  <\proof>
    Step 1: <with|font-series|bold|Spectral Bimeasure Factorization>. From
    the Canonical Factorization Lemma:

    <\equation>
      \<Phi\><around|(|A,B|)>=<big|int><rsub|A><big|int><rsub|B><around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,\<psi\><around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>*d*\<lambda\>*d*\<mu\>
    </equation>

    where <math|\<psi\>:\<bbb-R\>\<to\>\<cal-K\>> is a measurable function
    into a Hilbert space <math|\<cal-K\>=L<rsup|2><around|(|\<bbb-R\>,\<nu\>|)>>.

    Step 2: <with|font-series|bold|Construction of Stationary Dilation>. The
    construction involves:

    <\itemize>
      <item>A larger Hilbert space <math|\<cal-H\><rprime|'>=L<rsup|2><around|(|\<bbb-R\>,\<cal-K\>|)>>
      of <math|\<cal-K\>>-valued square-integrable functions with inner
      product:

      <\equation>
        <around|\<langle\>|f,g|\<rangle\>><rsub|\<cal-H\><rprime|'>>=<big|int><rsub|\<bbb-R\>><around|\<langle\>|f<around|(|\<lambda\>|)>,g<around|(|\<lambda\>|)>|\<rangle\>><rsub|\<cal-K\>>*d*\<lambda\>
      </equation>

      <item>A unitary group <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>
      on <math|\<cal-H\><rprime|'>> defined by
      <math|<around|(|U<rsub|t>*f|)><around|(|\<lambda\>|)>=e<rsup|i*t*\<lambda\>>*f<around|(|\<lambda\>|)>>

      <item>An embedding <math|V:\<cal-H\>\<to\>\<cal-H\><rprime|'>> with
      <math|V<around|(|Y<rsub|t>|)>=e<rsup|-i*t*\<lambda\>>*\<psi\><around|(|\<lambda\>|)>>

      <item>A projection operator <math|P:\<cal-H\><rprime|'>\<to\>\<cal-H\>>
      defined as the adjoint of <math|V>:

      <\equation>
        <around|(|P*f|)><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\<langle\>|\<psi\><around|(|\<mu\>|)>,f<around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>*e<rsup|i*\<lambda\>*\<mu\>>*d*\<mu\>
      </equation>

      <item>A stationary Gaussian process <math|<around|{|Z<rsub|t>|}>> on
      <math|\<cal-H\><rprime|'>> defined by <math|Z<rsub|t>=U<rsub|t>*z>
      where <math|z\<in\>\<cal-H\><rprime|'>> is a fixed element with
      spectral measure:

      <\equation>
        \<nu\><rsub|Z><around|(|A|)>=<big|int><rsub|A><around|\<\|\|\>|\<psi\><around|(|\<lambda\>|)>|\<\|\|\>><rsup|2><rsub|\<cal-K\>>*d*\<lambda\>
      </equation>

      for all Borel sets <math|A\<subset\>\<bbb-R\>>.
    </itemize>

    Step 3: <with|font-series|bold|Monotonic Modulation Construction>. Define
    <math|\<theta\><around|(|t|)>> as:

    <\equation>
      \<theta\><around|(|t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><around|\||<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,e<rsup|i*<around|(|\<lambda\>-\<mu\>|)>*t>*\<psi\><around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>|\|><rsup|2>*d*\<lambda\>*d*\<mu\>
    </equation>

    Alternatively, <math|\<theta\><around|(|t|)>> can be defined through its
    derivative:

    <\equation>
      <frac|d|d*t>*\<theta\><around|(|t|)>=<big|int><rsub|\<bbb-R\>><around|\||<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,e<rsup|i*\<lambda\>*t>|\<rangle\>><rsub|\<cal-K\>>|\|><rsup|2>*d*\<lambda\>\<gtr\>0
    </equation>

    This function is strictly increasing because for any <math|t\<gtr\>s>:

    <\equation>
      \<theta\><around|(|t|)>-\<theta\><around|(|s|)>=<big|int><rsub|s><rsup|t><frac|d|d*u>*\<theta\><around|(|u|)>*d*u=<big|int><rsub|s><rsup|t><big|int><rsub|\<bbb-R\>><around|\||<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,e<rsup|i*\<lambda\>*u>|\<rangle\>><rsub|\<cal-K\>>|\|><rsup|2>*d*\<lambda\>*d*u\<gtr\>0
    </equation>

    since the integrand is strictly positive for all <math|u> and
    <math|\<lambda\>> in sets of positive measure.

    Step 4: <with|font-series|bold|Covariance Matching>. For the harmonizable
    Gaussian process <math|Y<rsub|t>>:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>>|<cell|=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*t-\<mu\>*s|)>>*<around|\<langle\>|\<psi\><around|(|\<lambda\>|)>,\<psi\><around|(|\<mu\>|)>|\<rangle\>><rsub|\<cal-K\>>*d*\<lambda\>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<nu\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*\<nu\><rsub|Z><around|(|\<nu\>|)><eq-number>>>>>
    </align>

    Through the operator <math|P>, the following can be shown:

    <\equation>
      \<bbb-E\>*<around|[|Y<rsub|t>*Y<rsub|s><rsup|\<ast\>>|]>=\<bbb-E\>*<around|[|P*Z<rsub|t>*<around|(|P*Z<rsub|s>|)><rsup|\<ast\>>|]>=\<bbb-E\>*<around|[|Z<rsub|\<theta\><around|(|t|)>>*Z<rsub|\<theta\><around|(|s|)>><rsup|\<ast\>>|]>
    </equation>

    Therefore, <math|Y<rsub|t>=Z<rsub|\<theta\><around|(|t|)>>> almost
    surely.

    Step 5: <with|font-series|bold|Minimality>. This representation is
    minimal because <math|\<cal-H\><rprime|'>> is the smallest space
    containing <math|<around|{|Z<rsub|t>|}>> and
    <math|\<theta\><around|(|t|)>> is the unique monotonically increasing
    function matching the covariance structure. Specifically, if
    <math|<wide|\<theta\>|~>> is any other function with
    <math|Y<rsub|t>=<wide|Z|~><rsub|<wide|\<theta\>|~><around|(|t|)>>> for
    some stationary Gaussian process <math|<wide|Z|~><rsub|t>>, then
    <math|<wide|\<theta\>|~><around|(|t|)>=\<theta\><around|(|t|)>+c> for
    some constant <math|c>, and <math|<wide|Z|~><rsub|t>=Z<rsub|t+c>>.
  </proof>

  <section|Connection to Prior Work>

  This work reframes results from previous research <cite|crowley> using the
  language of harmonizable Gaussian processes. The current construction
  builds upon established methods for stationary Gaussian processes. For such
  processes, prior research has established that:

  <\equation>
    \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)>
  </equation>

  where <math|N<around|(|<around|[|0,T|]>|)>> is the number of zero crossings
  in <math|<around|[|0,T|]>>. Both the previous and current approach use
  monotonic modulation to preserve core properties while allowing
  non-stationarity.

  The current paper addresses the same class of Gaussian processes (i.e.,
  those that can be represented as monotonically modulated stationary
  Gaussian processes) using different mathematical frameworks to express the
  same fundamental idea.

  The theorem relates to Naimark's dilation theorem <cite|naimark> but
  provides an explicit construction specialized to harmonizable Gaussian
  processes. The modulation function <math|\<theta\><around|(|t|)>> captures
  exactly how much the process deviates from stationarity, as characterized
  by Bochner's theorem <cite|bochner>.

  <\thebibliography|9>
    <bibitem|naimark>Naimark, M. A. (1943). Spectral functions of a symmetric
    operator. Izv. Akad. Nauk SSSR, Ser. Mat., 7, 285-296.

    <bibitem|crowley>Crowley, S. (2025). Gaussian Processes Generated By
    Monotonically Modulated Stationary Kernels. arXiv:2501.07075v1 [math.PR]

    <bibitem|bochner>Bochner, S. (1932). Vorlesungen über Fouriersche
    Integrale. Akademische Verlagsgesellschaft.

    <bibitem|loeve>Loève, M. (1978). Probability Theory II. Springer-Verlag,
    New York.

    <bibitem|karhunen>Karhunen, K. (1947). Über lineare Methoden in der
    Wahrscheinlichkeitsrechnung. Ann. Acad. Sci. Fennicae. Ser. A. I.
    Math.-Phys., 37, 1-79.

    <bibitem|hida>Hida, T. (1970). Stationary Stochastic Processes. Princeton
    University Press, Princeton.

    <bibitem|rozanov>Rozanov, Y. A. (1967). Stationary Random Processes.
    Holden-Day, San Francisco.

    <bibitem|gelfand>Gel'fand, I. M. and Vilenkin, N. Y. (1964). Generalized
    Functions, Vol. 4: Applications of Harmonic Analysis. Academic Press, New
    York.

    <bibitem|grothendieck>Grothendieck, A. (1956). Résumé de la théorie
    métrique des produits tensoriels topologiques. Bol. Soc. Mat. São Paulo,
    8, 1-79.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-2|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-3|<tuple|3|7|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-4|<tuple|4|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|auto-5|<tuple|48|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-bochner|<tuple|bochner|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-crowley|<tuple|crowley|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-gelfand|<tuple|gelfand|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-grothendieck|<tuple|grothendieck|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-hida|<tuple|hida|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-karhunen|<tuple|karhunen|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-loeve|<tuple|loeve|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-naimark|<tuple|naimark|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-rozanov|<tuple|rozanov|9|../../.TeXmacs/texts/scratch/no_name_77.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      crowley

      naimark

      bochner
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Spectral
      Resolution Fundamentals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Random
      Measure Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Integrated
      Main Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Connection
      to Prior Work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>