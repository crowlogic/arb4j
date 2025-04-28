<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Morse-Transue Integral: Measure-Theoretic
  Foundations>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Bimeasures
    and Their Structural Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Construction
    of the Morse-Transue Integral> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Integrability
    Conditions and MT-Spaces> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Fundamental
    Theorems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Theorem 4.1 (Fubini-Type Equality)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|4.2<space|2spc>Theorem 4.2 (Continuity)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.3<space|2spc>Theorem 4.3 (Radon-Nikodym Property)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Measure-Theoretic
    Obstructions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Non-Sigma-Additivity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|5.2<space|2spc>Projective Tensor Structure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Advanced
    Topics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>Decomposition Theory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|6.2<space|2spc>Grothendieck Inequalities
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>
  </table-of-contents>

  <section|Bimeasures and Their Structural Properties>

  Let <math|<around|(|E,\<cal-B\>|)>> be a locally compact Hausdorff space
  with Borel <math|\<sigma\>>-algebra. A <with|font-series|bold|C-bimeasure>
  <math|\<Lambda\>:\<cal-B\>\<times\>\<cal-B\>\<to\>\<bbb-C\>> is a set
  function satisfying:

  <\enumerate>
    <item><with|font-series|bold|Separate Additivity>: For fixed
    <math|A\<in\>\<cal-B\>>, <math|\<Lambda\><around|(|A,\<cdot\>|)>> and
    <math|\<Lambda\><around|(|\<cdummy\>,A|)>> are complex measures.

    <item><with|font-series|bold|Bounded Variation>:
    <math|<around|\<\|\|\>|\<Lambda\>|\<\|\|\>>\<assign\>sup
    <around*|{|<big|sum><rsub|i,j><around|\||\<Lambda\><around|(|A<rsub|i>,B<rsub|j>|)>|\|>|}>\<less\>\<infty\>>,
    where suprema range over finite partitions
    <math|<around|{|A<rsub|i>|}>,<around|{|B<rsub|j>|}>> of <math|E>.
  </enumerate>

  Bimeasures generalize product measures but need not induce measures on
  <math|E\<times\>E>. The <with|font-series|bold|total variation>
  <math|<around|\||\<Lambda\>|\|>> satisfies
  <math|<around|\||\<Lambda\><around|(|A,B|)>|\|>\<leq\><around|\||\<Lambda\>|\|><around|(|A,B|)>>
  for all <math|A,B\<in\>\<cal-B\>>. Critical constraints emerge from failure
  of countable additivity in both variables simultaneously.

  <section|Construction of the Morse-Transue Integral>

  Given a C-bimeasure <math|\<Lambda\>> and functions
  <math|f,g:E\<to\>\<bbb-C\>>, the integral
  <math|<big|iint><rsub|E\<times\>E>f<around|(|x|)>*g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>>
  is defined via iterated integration when:

  <\enumerate>
    <item><math|f> is <math|\<Lambda\><around|(|\<cdummy\>,B|)>>-integrable
    for all <math|B\<in\>\<cal-B\>>

    <item><math|g> is <math|\<Lambda\><around|(|A,\<cdot\>|)>>-integrable for
    all <math|A\<in\>\<cal-B\>>

    <item>Iterated integrals coincide:

    <\equation>
      <big|int><rsub|E><around*|(|<big|int><rsub|E>f<around|(|x|)>*\<Lambda\><around|(|d*x,B|)>|)>*d*\<mu\><rsub|g><around|(|B|)>=<big|int><rsub|E><around*|(|<big|int><rsub|E>g<around|(|y|)>*\<Lambda\><around|(|A,d*y|)>|)>*d*\<mu\><rsub|f><around|(|A|)>
    </equation>

    where <math|\<mu\><rsub|f>,\<mu\><rsub|g>> are induced measures from the
    partial integrals.
  </enumerate>

  <section|Integrability Conditions and MT-Spaces>

  The <with|font-series|bold|Morse-Transue space>
  <math|M*T<rsub|\<Lambda\>><around|(|E|)>> comprises functions where
  <math|\<Lambda\>>-integrals exist for all
  <math|g\<in\>M*T<rsub|\<Lambda\>><around|(|E|)>>. Key properties:

  <\enumerate>
    <item><with|font-series|bold|Closure Under Products>: If
    <math|f,g\<in\>M*T<rsub|\<Lambda\>><around|(|E|)>>, then
    <math|f*g\<in\>M*T<rsub|\<Lambda\>><around|(|E|)>> provided:

    <\equation>
      <big|int><rsub|E><around|\||f<around|(|x|)>|\|>*<space|0.17em>d<around|\||\<Lambda\>|\|><rsub|x>\<less\>\<infty\>
    </equation>

    <\equation>
      <big|int><rsub|E><around|\||g<around|(|y|)>|\|>*<space|0.17em>d<around|\||\<Lambda\>|\|><rsup|y>\<less\>\<infty\>
    </equation>

    where <math|<around|\||\<Lambda\>|\|><rsub|x>,<around|\||\<Lambda\>|\|><rsup|y>>
    are marginal variations.

    <item><with|font-series|bold|Density of Simple Functions>:
    <math|M*T<rsub|\<Lambda\>><around|(|E|)>> is the completion of
    <math|C<rsub|c><around|(|E|)>> under the seminorm:

    <\equation>
      <around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\>>=sup<rsub|<around|\<\|\|\>|g|\<\|\|\>><rsub|\<Lambda\>>\<leq\>1><around*|\||<big|iint>f<around|(|x|)>*g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>|\|>
    </equation>

    This parallels Orlicz spaces but with bimeasure-dependent modulars.
  </enumerate>

  <section|Fundamental Theorems>

  <subsection|Theorem 4.1 (Fubini-Type Equality)>

  Let <math|\<Lambda\>> be a C-bimeasure and <math|f,g> satisfy:

  <\equation>
    <big|int><rsub|E><around|\||f<around|(|x|)>|\|>*<space|0.17em>d<around|\||\<Lambda\>|\|><rsub|x>\<less\>\<infty\>
  </equation>

  <\equation>
    <space|1em><big|int><rsub|E><around|\||g<around|(|y|)>|\|>*<space|0.17em>d<around|\||\<Lambda\>|\|><rsup|y>\<less\>\<infty\>
  </equation>

  Then:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|iint>f<around|(|x|)>*g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>>|<cell|=<big|int><rsub|E>f<around|(|x|)><around*|(|<big|int><rsub|E>g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|E>g<around|(|y|)><around*|(|<big|int><rsub|E>f<around|(|x|)>*\<Lambda\><around|(|d*x,d*y|)>|)>>>>>>
  </equation>

  provided either iterated integral exists.

  <subsection|Theorem 4.2 (Continuity)>

  For uniformly bounded nets <math|<around|{|f<rsub|\<alpha\>>|}>,<around|{|g<rsub|\<beta\>>|}>>
  in <math|M*T<rsub|\<Lambda\>><around|(|E|)>> converging pointwise to
  <math|f,g>:

  <\equation>
    lim<rsub|\<alpha\>,\<beta\>><big|iint>f<rsub|\<alpha\>><around|(|x|)>*g<rsub|\<beta\>><around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>=<big|iint>f<around|(|x|)>*g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>
  </equation>

  if dominated by <math|\<Lambda\>>-integrable functions.

  <subsection|Theorem 4.3 (Radon-Nikodym Property)>

  For C-bimeasures <math|\<Lambda\>\<ll\>\<mu\>\<otimes\>\<nu\>> (dominated
  by product measure), there exists <math|h\<in\>L<rsup|1>*<around|(|\<mu\>\<otimes\>\<nu\>|)>>
  such that:

  <\equation>
    \<Lambda\><around|(|A,B|)>=<big|iint><rsub|A\<times\>B>h<around|(|x,y|)>*\<mu\>*<around|(|d*x|)>*\<nu\>*<around|(|d*y|)>
  </equation>

  Failure occurs when <math|\<Lambda\>> has nontrivial singular component.

  <section|Measure-Theoretic Obstructions>

  <subsection|Non-Sigma-Additivity>

  Bimeasures exhibit <with|font-series|bold|rectangular oscillation>: For
  disjoint <math|<around|{|A<rsub|n>|}>\<times\><around|{|B<rsub|m>|}>>,

  <\equation>
    \<Lambda\><around*|(|<big|cup><rsub|n>A<rsub|n>,<big|cup><rsub|m>B<rsub|m>|)>\<neq\><big|sum><rsub|n,m>\<Lambda\><around|(|A<rsub|n>,B<rsub|m>|)>
  </equation>

  unless restricted to commuting projections.

  <subsection|Projective Tensor Structure>

  The space <math|B*M<around|(|E|)>> of bounded bimeasures embeds into
  <math|<around|(|C<rsub|0><around|(|E|)><wide|\<otimes\>|^><rsub|\<pi\>>*C<rsub|0><around|(|E|)>|)><rsup|\<ast\>>>
  via:

  <\equation>
    \<Lambda\><around|(|f,g|)>=<big|iint>f\<otimes\>g*<space|0.17em>d*\<Lambda\>
  </equation>

  where <math|<wide|\<otimes\>|^><rsub|\<pi\>>> is the projective tensor
  product. Non-reflexivity of <math|C<rsub|0><around|(|E|)>> induces
  non-accessible points in <math|B*M<around|(|E|)>>.

  <section|Advanced Topics>

  <subsection|Decomposition Theory>

  Every C-bimeasure splits uniquely as:

  <\equation>
    \<Lambda\>=\<Lambda\><rsub|a*c>+\<Lambda\><rsub|s>
  </equation>

  where <math|\<Lambda\><rsub|a*c>\<ll\>\<mu\>\<otimes\>\<nu\>> and
  <math|\<Lambda\><rsub|s>> is singular. The singular component obstructs
  Radon-Nikodym derivatives.

  <subsection|Grothendieck Inequalities>

  For Hilbert spaces <math|\<cal-H\>>, the
  <with|font-series|bold|Grothendieck constant> <math|K<rsub|G>> bounds:

  <\equation*>
    <around*|\||<big|iint>f<around|(|x|)>*g<around|(|y|)>*\<Lambda\><around|(|d*x,d*y|)>|\|>\<leq\>K<rsub|G><around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><around|\<\|\|\>|g|\<\|\|\>><rsub|L<rsup|2><around|(|\<nu\>|)>><around|\<\|\|\>|\<Lambda\>|\<\|\|\>>
  </equation*>

  Critical for spectral analysis of random measures.

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-10|<tuple|5.2|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-11|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-12|<tuple|6.1|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-13|<tuple|6.2|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|4.1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|4.2|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|4.3|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-9|<tuple|5.1|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Bimeasures
      and Their Structural Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Construction
      of the Morse-Transue Integral> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Integrability
      Conditions and MT-Spaces> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Fundamental
      Theorems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Theorem 4.1 (Fubini-Type
      Equality) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Theorem 4.2 (Continuity)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Theorem 4.3 (Radon-Nikodym
      Property) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Measure-Theoretic
      Obstructions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Non-Sigma-Additivity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Projective Tensor Structure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Advanced
      Topics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Decomposition Theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Grothendieck Inequalities
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>
    </associate>
  </collection>
</auxiliary>