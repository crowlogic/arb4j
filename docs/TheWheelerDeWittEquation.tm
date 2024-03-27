<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Wheeler--DeWitt Equation>>

  <\abstract>
    Field equation, part of a theory that attempts to combine quantum
    mechanics and general relativity.
  </abstract>

  <section|Introduction>

  The Wheeler\UDeWitt equation<cite|DeWitt1967> for theoretical physics and
  applied mathematics, is a field equation attributed to John Archibald
  Wheeler and Bryce DeWitt. The equation attempts to mathematically combine
  the ideas of quantum mechanics and general relativity, a step towards a
  theory of quantum gravity.

  In this approach, time plays a role different from what it does in
  non-relativistic quantum mechanics, leading to the so-called 'problem of
  time'. More specifically, the equation describes the quantum version of the
  Hamiltonian constraint using metric variables. Its commutation relations
  with the diffeomorphism constraints generate the Bergman\UKomar "group"
  (which is the diffeomorphism group on-shell).

  <section|Motivation and Background>

  In canonical gravity, spacetime is foliated into spacelike submanifolds.
  The three-metric (i.e., metric on the hypersurface) is
  <math|\<gamma\><rsub|i*j>> and given by

  <\equation>
    g<rsub|\<mu\>*\<nu\>><space|0.17em><math-up|d>x<rsup|\<mu\>><space|0.17em><math-up|d>x<rsup|\<nu\>>=<around|(|-<space|0.17em>N<rsup|2>+\<beta\><rsub|k>*\<beta\><rsup|k>|)><space|0.17em><math-up|d>t<rsup|2>+2*\<beta\><rsub|k><space|0.17em><math-up|d>x<rsup|k><space|0.17em><math-up|d>t+\<gamma\><rsub|i*j><space|0.17em><math-up|d>x<rsup|i><space|0.17em><math-up|d>x<rsup|j>
  </equation>

  The Hamiltonian is a constraint

  <\equation>
    \<cal-H\>=<frac|*G<rsub|i*j*k*l>*\<pi\><rsup|i*j>*\<pi\><rsup|k*l>|2*<sqrt|\<gamma\>>>-<sqrt|\<gamma\>>*<space|0.17em><rsup|<around|(|3|)>><space|-0.17em>R=0
  </equation>

  where <math|\<gamma\>=det <around|(|\<gamma\><rsub|i*j>|)>> and

  <\equation>
    G<rsub|i*j*k*l>=<around|(|\<gamma\><rsub|i*k>*\<gamma\><rsub|j*l>+\<gamma\><rsub|i*l>*\<gamma\><rsub|j*k>-\<gamma\><rsub|i*j>*\<gamma\><rsub|k*l>|)>
  </equation>

  \ is the Wheeler\UDeWitt metric.

  Quantization "puts hats" on the momenta and field variables, leading to the
  operator

  <\equation>
    <wide|\<cal-H\>|^>=<frac|<wide|G|^><rsub|i*j*k*l>*<wide|\<pi\>|^><rsup|i*j>*<wide|\<pi\>|^><rsup|k*l>|2*<sqrt|\<gamma\>>>*-<sqrt|\<gamma\>>*<space|0.17em><rsup|<around|(|3|)>><space|-0.17em><wide|R|^>
  </equation>

  One can apply the operator to a general wave functional of the metric
  <math|<wide|\<cal-H\>|^>\<Psi\><around|[|\<gamma\>|]>=0>.

  <section|Mathematical Formalism>

  The Wheeler\UDeWitt equation is a functional differential equation. It is
  ill-defined in the general case but very important in theoretical physics,
  especially in quantum gravity. It acts on a wave functional; the functional
  reduces to a function in cosmology.

  <subsection|Hamiltonian Constraint>

  The Wheeler\UDeWitt equation states that

  <\equation>
    <wide|H|^><around|(|x|)>\|\<psi\>\<rangle\>=0
  </equation>

  where <math|<wide|H|^><around|(|x|)>> is the Hamiltonian constraint in
  quantized general relativity and <math|<around|\||\<psi\>|\<rangle\>>> is
  the wave function of the universe. The Hamiltonian is a first class
  constraint on physical states.

  <subsection|Momentum Constraint>

  We also need to augment the Hamiltonian constraint with momentum
  constraints

  <\equation>
    <wide|\<cal-P\>|\<vect\>><around|(|x|)><around*|\||\<psi\>|\<rangle\>>=0
  </equation>

  associated with spatial diffeomorphism invariance.

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

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-4|<tuple|3.1|2|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-5|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_32.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      DeWitt1967
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Motivation
      and Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Mathematical
      Formalism> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Hamiltonian Constraint
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Momentum Constraint
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>