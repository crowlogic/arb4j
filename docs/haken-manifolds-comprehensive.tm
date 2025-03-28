<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Haken Manifolds: A Comprehensive
  Overview>|<doc-author|<author-data|<author-name|Mathematical Topology
  Expert>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Haken
    Manifolds: A Comprehensive Overview> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Definition and Basic Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Historical Context and Development
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Haken Hierarchy in Detail
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Applications and Significance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.5<space|2spc>Examples of Haken Manifolds
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.6<space|2spc>Advanced Topics and Recent
    Developments <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.7<space|2spc>Open Questions and Future Directions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>
  </table-of-contents>

  <section|Haken Manifolds: A Comprehensive Overview>

  <subsection|Definition and Basic Properties>

  A Haken manifold, named after mathematician Wolfgang Haken, is a
  fundamental concept in 3-manifold topology. To fully understand Haken
  manifolds, we need to break down several key terms:

  <\enumerate>
    <item><with|font-series|bold|Compact space>: A topological space <math|X>
    that is closed and bounded. Mathematically, for every open cover
    <math|<around|{|U<rsub|\<alpha\>>|}>> of <math|X>, there exists a finite
    subcover. In the context of manifolds, this means the manifold has finite
    extent and includes its boundary.

    <item><with|font-series|bold|P<rsup|2>-irreducible manifold>: A
    3-manifold <math|M> is P<rsup|2>-irreducible if:

    <\itemize>
      <item>Every embedded 2-sphere <math|S<rsup|2>\<subset\>M> bounds a
      3-ball <math|B<rsup|3>\<subset\>M>, i.e.,
      <math|S<rsup|2>=\<partial\>*B<rsup|3>>.

      <item><math|M> does not contain any two-sided projective planes.
    </itemize>

    This property ensures that the manifold doesn't have any "trivial" pieces
    that could be easily removed.

    <item><with|font-series|bold|Incompressible surface>: A properly embedded
    surface <math|S> in a 3-manifold <math|M> is incompressible if the
    induced homomorphism on fundamental groups is injective:

    <\equation*>
      i<rsub|\<ast\>>:\<pi\><rsub|1><around|(|S|)>\<hookrightarrow\>\<pi\><rsub|1><around|(|M|)>
    </equation*>

    where <math|i:S\<hookrightarrow\>M> is the inclusion map. Intuitively,
    this means that any closed curve on <math|S> that can be contracted to a
    point in <math|M> can also be contracted to a point within <math|S>
    itself.

    <item><with|font-series|bold|Sufficiently large>: A 3-manifold is
    sufficiently large if it contains a properly embedded, two-sided,
    incompressible surface.
  </enumerate>

  <\definition>
    [Haken Manifold] A Haken manifold is a compact, P<rsup|2>-irreducible
    3-manifold that is sufficiently large. In the orientable case, which is
    often the focus of study, a Haken manifold is a compact, orientable,
    irreducible 3-manifold containing an orientable, incompressible surface.
  </definition>

  <subsection|Historical Context and Development>

  Wolfgang Haken introduced the concept of Haken manifolds in 1961. His work
  was part of a broader effort to understand and classify 3-manifolds, which
  had been a central problem in topology since the early 20th century.

  Key developments in the theory of Haken manifolds include:

  <\enumerate>
    <item><with|font-series|bold|Haken's Hierarchy (1962)>: Haken proved that
    Haken manifolds possess a hierarchy, where they can be decomposed into
    3-balls along incompressible surfaces. This property is crucial for many
    proofs involving Haken manifolds.

    <item><with|font-series|bold|Waldhausen's Work (1968)>: Friedhelm
    Waldhausen proved several fundamental results about Haken manifolds,
    including their topological rigidity and the solvability of the word
    problem for their fundamental groups.

    <item><with|font-series|bold|Jaco-Oertel Algorithm (1984)>: William Jaco
    and Ulrich Oertel developed an algorithm to determine if a given
    3-manifold is Haken.

    <item><with|font-series|bold|Thurston's Geometrization (1982)>: William
    Thurston's geometrization theorem for Haken manifolds was a crucial step
    in his broader geometrization program, which revolutionized our
    understanding of 3-manifolds.

    <item><with|font-series|bold|Virtually Haken Conjecture (Proved 2012)>:
    Ian Agol proved the virtually Haken conjecture, which states that every
    compact, irreducible 3-manifold with infinite fundamental group is
    virtually Haken (i.e., has a finite cover that is Haken).
  </enumerate>

  <subsection|Haken Hierarchy in Detail>

  The Haken hierarchy is a fundamental tool in the study of Haken manifolds.
  Here's a more detailed explanation of how it works:

  <\enumerate>
    <item>Start with a Haken manifold <math|M>.

    <item>Find an incompressible surface <math|S\<subset\>M>.

    <item>Cut <math|M> along <math|S> to obtain a new manifold
    <math|M<rprime|'>=M\<setminus\>N<around|(|S|)>>, where
    <math|N<around|(|S|)>> is a regular neighborhood of <math|S>.

    <item><math|M<rprime|'>> is again a Haken manifold (unless it's a
    collection of 3-balls).

    <item>Repeat the process with <math|M<rprime|'>>, finding another
    incompressible surface and cutting along it.

    <item>Continue this process until you're left with a collection of
    3-balls.
  </enumerate>

  Mathematically, we can express this as a sequence:

  <\equation*>
    M=M<rsub|0>\<supset\>M<rsub|1>\<supset\>M<rsub|2>\<supset\>\<cdots\>\<supset\>M<rsub|n>
  </equation*>

  where each <math|M<rsub|i>> is obtained from <math|M<rsub|i-1>> by cutting
  along an incompressible surface, and <math|M<rsub|n>> is a disjoint union
  of 3-balls.

  This hierarchy allows for inductive proofs on Haken manifolds. Many
  properties can be proven by:

  <\itemize>
    <item>Showing they hold for 3-balls

    <item>Proving that if they hold for the pieces after cutting along an
    incompressible surface, they hold for the original manifold
  </itemize>

  <subsection|Applications and Significance>

  Haken manifolds have numerous important applications in 3-manifold
  topology:

  <\enumerate>
    <item><with|font-series|bold|Homeomorphism Problem>: Haken's work led to
    an algorithm for determining whether two Haken manifolds are
    homeomorphic. Given Haken manifolds <math|M> and <math|N>, there exists
    an algorithm to decide if <math|M\<cong\>N>.

    <item><with|font-series|bold|Recognition Problem>: The Jaco-Oertel
    algorithm solves the recognition problem for Haken manifolds. Given a
    3-manifold <math|M>, there exists an algorithm to decide if <math|M> is
    Haken.

    <item><with|font-series|bold|Topological Rigidity>: Waldhausen's proof of
    topological rigidity for Haken manifolds shows that they are completely
    determined by their fundamental groups. Formally, if <math|f:M\<to\>N> is
    a homotopy equivalence between Haken manifolds, then <math|f> is
    homotopic to a homeomorphism.

    <item><with|font-series|bold|Geometrization>: Thurston's geometrization
    theorem for Haken manifolds was a crucial step in the proof of the
    Poincaré conjecture and the geometrization conjecture. It states that
    every Haken 3-manifold can be decomposed into geometric pieces.

    <item><with|font-series|bold|Word Problem>: The solvability of the word
    problem for fundamental groups of Haken manifolds has implications in
    group theory and computational topology. For a Haken manifold <math|M>,
    there exists an algorithm to decide if a word
    <math|w\<in\>\<pi\><rsub|1><around|(|M|)>> represents the identity
    element.
  </enumerate>

  <subsection|Examples of Haken Manifolds>

  Let's explore some examples of Haken manifolds in more detail:

  <\enumerate>
    <item><with|font-series|bold|Compact, irreducible 3-manifolds with
    positive first Betti number>:

    <\itemize>
      <item>The first Betti number <math|b<rsub|1><around|(|M|)>=<text|rank>H<rsub|1><around|(|M;\<bbb-Z\>|)>>
      is the rank of the first homology group.

      <item>A positive first Betti number implies the existence of a
      non-trivial map <math|f:M\<to\>S<rsup|1>>, which can be used to
      construct an incompressible surface.
    </itemize>

    <item><with|font-series|bold|Surface bundles over the circle>:

    <\itemize>
      <item>These are 3-manifolds formed by taking a surface <math|S> and an
      interval <math|I=<around|[|0,1|]>>, then identifying
      <math|<around|(|x,0|)>> with <math|<around|(|f<around|(|x|)>,1|)>> for
      some homeomorphism <math|f> of <math|S>.

      <item>Mathematically, <math|M<rsub|f>=<around|(|S\<times\>I|)>/\<sim\>>,
      where <math|<around|(|x,0|)>\<sim\><around|(|f<around|(|x|)>,1|)>>.

      <item>The surface <math|S> provides a natural incompressible surface in
      this construction.
    </itemize>

    <item><with|font-series|bold|Link complements>:

    <\itemize>
      <item>The complement of a link <math|L> in <math|S<rsup|3>> is often a
      Haken manifold.

      <item>Denoted as <math|S<rsup|3>\<setminus\>N<around|(|L|)>>, where
      <math|N<around|(|L|)>> is a tubular neighborhood of <math|L>.

      <item>Seifert surfaces for the link components often provide
      incompressible surfaces.
    </itemize>

    <item><with|font-series|bold|Most Seifert fiber spaces>:

    <\itemize>
      <item>Seifert fiber spaces are 3-manifolds that admit a decomposition
      into circles in a particularly nice way.

      <item>Many Seifert fiber spaces contain incompressible tori, making
      them Haken.
    </itemize>

    <item><with|font-series|bold|Handlebodies of genus <math|g\<gtr\>0>>:

    <\itemize>
      <item>These are obtained by attaching <math|g> 1-handles to a 3-ball.

      <item>They contain incompressible surfaces (e.g., properly embedded
      disks).
    </itemize>
  </enumerate>

  <subsection|Advanced Topics and Recent Developments>

  <\enumerate>
    <item><with|font-series|bold|Virtual Haken Conjecture>:

    <\itemize>
      <item>Proved by Ian Agol in 2012

      <item>States that every compact, irreducible 3-manifold <math|M> with
      infinite fundamental group is virtually Haken, i.e., there exists a
      finite cover <math|<wide|M|~>\<to\>M> such that <math|<wide|M|~>> is
      Haken.

      <item>The proof uses a combination of techniques from hyperbolic
      geometry, group theory, and 3-manifold topology
    </itemize>

    <item><with|font-series|bold|Relationship to Hyperbolic Geometry>:

    <\itemize>
      <item>Many Haken manifolds admit hyperbolic structures, i.e.,
      Riemannian metrics of constant sectional curvature <math|-1>.

      <item>Thurston's geometrization theorem for Haken manifolds was a key
      step in understanding this relationship
    </itemize>

    <item><with|font-series|bold|Normal Surface Theory>:

    <\itemize>
      <item>Normal surfaces, introduced by Haken, are a key tool in
      algorithms involving Haken manifolds

      <item>They provide a finite way to describe essential surfaces in a
      3-manifold

      <item>A normal surface intersects each tetrahedron in a triangulation
      in a finite number of prescribed triangle and quadrilateral types
    </itemize>

    <item><with|font-series|bold|Mapping Class Groups>:

    <\itemize>
      <item>Johannson (1979) proved that atoroidal, anannular,
      boundary-irreducible Haken 3-manifolds have finite mapping class groups

      <item>For such a manifold <math|M>,
      MCG<math|<around|(|M|)>=<text|Homeo><around|(|M|)>/<text|Homeo><rsub|0><around|(|M|)>>
      is finite

      <item>This result ties into the rigidity properties of hyperbolic
      3-manifolds
    </itemize>

    <item><with|font-series|bold|Connections to Quantum Topology>:

    <\itemize>
      <item>Haken manifolds play a role in the study of quantum invariants of
      3-manifolds

      <item>The hierarchical structure of Haken manifolds can sometimes be
      used to compute or analyze these invariants

      <item>For example, the Witten-Reshetikhin-Turaev invariants can often
      be computed recursively using the Haken hierarchy
    </itemize>
  </enumerate>

  <subsection|Open Questions and Future Directions>

  While much is known about Haken manifolds, there are still open questions
  and areas of active research:

  <\enumerate>
    <item><with|font-series|bold|Effective Algorithms>: Improving the
    efficiency of algorithms for recognizing and analyzing Haken manifolds.
    Can we find polynomial-time algorithms for problems currently solved in
    exponential time?

    <item><with|font-series|bold|Quantitative Aspects>: Understanding
    quantitative aspects of the Haken hierarchy, such as the number of steps
    needed to decompose a manifold. Is there a relationship between this
    number and other invariants of the manifold?

    <item><with|font-series|bold|Generalized Haken Manifolds>: Exploring
    generalizations of Haken manifolds to higher dimensions or different
    categories of manifolds. What would be the appropriate definition of a
    "Haken <math|n>-manifold" for <math|n\<gtr\>3>?

    <item><with|font-series|bold|Connections to Other Areas>: Further
    investigating the relationships between Haken manifolds and other areas
    of mathematics, such as geometric group theory and low-dimensional
    dynamics. Can techniques from Haken manifolds be applied to problems in
    these areas?

    <item><with|font-series|bold|Computational Topology>: Developing
    practical software tools based on the theory of Haken manifolds for
    studying 3-manifolds computationally. Can we create efficient
    implementations of algorithms for normal surface theory and the Haken
    hierarchy?
  </enumerate>

  The study of Haken manifolds continues to be a rich and active area of
  research in topology, with connections to diverse areas of mathematics and
  potential applications in theoretical physics and computer science.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-3|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-4|<tuple|1.3|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-5|<tuple|1.4|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-6|<tuple|1.5|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-7|<tuple|1.6|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-8|<tuple|1.7|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Haken
      Manifolds: A Comprehensive Overview>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition and Basic
      Properties <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Historical Context and
      Development <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Haken Hierarchy in Detail
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Applications and
      Significance <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Examples of Haken Manifolds
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Advanced Topics and Recent
      Developments <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.7<space|2spc>Open Questions and Future
      Directions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>