<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Wheeler\UDeWitt Equation>|<doc-author|<author-data|<author-name|The
  Collective Unconscious>>>>

  The <with|font-series|bold|Wheeler\UDeWitt equation> for theoretical
  physics and applied mathematics is a field equation attributed to John
  Archibald Wheeler and Bryce DeWitt. The equation attempts to mathematically
  combine the ideas of quantum mechanics and general relativity, a step
  towards a theory of quantum gravity.

  In this approach, time plays a role different from what it does in
  non-relativistic quantum mechanics, leading to the so-called
  <with|font-shape|italic|problem of time>. More specifically, the equation
  describes the quantum version of the Hamiltonian constraint using metric
  variables. Its commutation relations with the diffeomorphism constraints
  generate the Bergman\UKomar "group" (which is the diffeomorphism group
  on-shell).

  <subsection*|Motivation and Background>

  In canonical gravity, spacetime is foliated into spacelike submanifolds.
  The three-metric (i.e., metric on the hypersurface) is
  <math|\<gamma\><rsub|i*j>> and given by:

  <\equation>
    g<rsub|\<mu\>*\<nu\>><space|0.17em><math-up|d>x<rsup|\<mu\>><space|0.17em><math-up|d>x<rsup|\<nu\>>=<around|(|-N<rsup|2>+\<beta\><rsub|k>*\<beta\><rsup|k>|)><space|0.17em><math-up|d>t<rsup|2>+2*\<beta\><rsub|k><space|0.17em><math-up|d>x<rsup|k><space|0.17em><math-up|d>t+\<gamma\><rsub|i*j><space|0.17em><math-up|d>x<rsup|i><space|0.17em><math-up|d>x<rsup|j>
  </equation>

  In that equation, the Latin indices run over the values 1, 2, 3, and the
  Greek indices run over the values 1, 2, 3, 4. The three-metric
  <math|\<gamma\><rsub|i*j>> is the field, and we denote its conjugate
  momenta as <math|\<pi\><rsup|i*j>>. The Hamiltonian is a constraint
  (characteristic of most relativistic systems):

  <\equation>
    \<cal-H\>=<frac|1|2*<sqrt|\<gamma\>>>*G<rsub|i*j*k*l>*\<pi\><rsup|i*j>*\<pi\><rsup|k*l>-<sqrt|\<gamma\>>*<space|0.17em><rsup|<around|(|3|)>>R=0
  </equation>

  where <math|\<gamma\>=det <around|(|\<gamma\><rsub|i*j>|)>>, and
  <math|G<rsub|i*j*k*l>=<around|(|\<gamma\><rsub|i*k>*\<gamma\><rsub|j*l>+\<gamma\><rsub|i*l>*\<gamma\><rsub|j*k>-\<gamma\><rsub|i*j>*\<gamma\><rsub|k*l>|)>>
  is the Wheeler\UDeWitt metric. In index-free notation, the Wheeler\UDeWitt
  metric on the space of positive definite quadratic forms <math|g> in three
  dimensions is:

  <\equation>
    <math-up|tr><around|(|<around|(|g<rsup|-1>*d*g|)><rsup|2>|)>-<around|(|<math-up|tr><around|(|g<rsup|-1>*d*g|)>|)><rsup|2>
  </equation>

  Quantization "puts hats" on the momenta and field variables; that is, the
  functions of numbers in the classical case become operators that modify the
  state function in the quantum case. Thus we obtain the operator:

  <\equation*>
    <wide|\<cal-H\>|^>=<frac|1|2*<sqrt|\<gamma\>>>*<wide|G|^><rsub|i*j*k*l>*<wide|\<pi\>|^><rsup|i*j>*<wide|\<pi\>|^><rsup|k*l>-<sqrt|\<gamma\>>*<space|0.17em><rsup|<around|(|3|)>><wide|R|^>
  </equation*>

  Working in "position space", these operators are:

  <\equation*>
    <\align>
      <tformat|<table|<row|<cell|<wide|\<gamma\>|^><rsub|i*j>*<around|(|t,x<rsup|k>|)>>|<cell|\<to\>\<gamma\><rsub|i*j>*<around|(|t,x<rsup|k>|)><eq-number>>>|<row|<cell|<wide|\<pi\>|^><rsup|i*j>*<around|(|t,x<rsup|k>|)>>|<cell|\<to\>-i*<frac|\<delta\>|\<delta\>*\<gamma\><rsub|i*j>*<around|(|t,x<rsup|k>|)>><eq-number>>>>>
    </align>
  </equation*>

  One can apply the operator to a general wave functional of the metric
  <math|<wide|\<cal-H\>|^>\<Psi\><around|[|\<gamma\>|]>=0>, where:

  <\equation>
    \<Psi\><around|[|\<gamma\>|]>=a+<big|int>\<psi\><around|(|x|)>*\<gamma\><around|(|x|)>*<space|0.17em>d*x<rsup|3>+<iint>\<psi\><around|(|x,y|)>*\<gamma\><around|(|x|)>*\<gamma\><around|(|y|)>*<space|0.17em>d*x<rsup|3>*<space|0.17em>d*y<rsup|3>+\<ldots\>
  </equation>

  which would give a set of constraints amongst the coefficients
  <math|\<psi\><around|(|x,y,\<ldots\>|)>>. This means that the amplitudes
  for <math|N> gravitons at certain positions are related to the amplitudes
  for a different number of gravitons at different positions. Or, one could
  use the two-field formalism, treating <math|\<omega\><around|(|g|)>> as an
  independent field, so that the wave function is
  <math|\<Psi\><around|[|\<gamma\>,\<omega\>|]>>.

  <subsection*|Mathematical Formalism>

  The Wheeler\UDeWitt equation is a functional differential equation. It is
  ill-defined in the general case, but very important in theoretical physics,
  especially in quantum gravity. It is a functional differential equation on
  the space of three-dimensional spatial metrics. The Wheeler\UDeWitt
  equation has the form of an operator acting on a wave functional; the
  functional reduces to a function in cosmology. Contrary to the general
  case, the Wheeler\UDeWitt equation is well defined in minisuperspaces like
  the configuration space of cosmological theories. An example of such a wave
  function is the Hartle\UHawking state. Bryce DeWitt first published this
  equation in 1967 under the name "Einstein\USchrödinger equation"; it was
  later renamed the "Wheeler\UDeWitt equation".

  <subsubsection*|Hamiltonian Constraint>

  Simply speaking, the Wheeler\UDeWitt equation says:

  <\equation>
    <wide|H|^><around|(|x|)>\|\<psi\>\<rangle\>=0
  </equation>

  where <math|<wide|H|^><around|(|x|)>> is the Hamiltonian constraint in
  quantized general relativity, and <math|<around|\||\<psi\>|\<rangle\>>>
  stands for the wave function of the universe. Unlike ordinary quantum field
  theory or quantum mechanics, the Hamiltonian is a first-class constraint on
  physical states. We also have an independent constraint for each point in
  space.

  Although the symbols <math|<wide|H|^>> and
  <math|<around|\||\<psi\>|\<rangle\>>> may appear familiar, their
  interpretation in the Wheeler\UDeWitt equation is substantially different
  from non-relativistic quantum mechanics.
  <math|<around|\||\<psi\>|\<rangle\>>> is no longer a spatial wave function
  in the traditional sense of a complex-valued function that is defined on a
  3-dimensional space-like surface and normalized to unity. Instead, it is a
  functional of field configurations on all of spacetime. This wave function
  contains all of the information about the geometry and matter content of
  the universe. <math|<wide|H|^>> is still an operator that acts on the
  Hilbert space of wave functions, but it is not the same Hilbert space as in
  the nonrelativistic case, and the Hamiltonian no longer determines the
  evolution of the system, so the Schrödinger equation:

  <\equation>
    <wide|H|^>\|\<psi\>\<rangle\>=i*\<hbar\><frac|\<partial\>|\<partial\>*t>\|\<psi\>\<rangle\>
  </equation>

  no longer applies. This property is known as timelessness. Various attempts
  to incorporate time in a fully quantum framework have been made, starting
  with the "Page and Wootters mechanism" and other subsequent proposals.

  <subsubsection*|Momentum Constraint>

  We also need to augment the Hamiltonian constraint with momentum
  constraints:

  <\equation>
    <wide|\<cal-P\>|\<vect\>><around|(|x|)>\|\<psi\>\<rangle\>=0
  </equation>

  associated with spatial diffeomorphism invariance.

  In minisuperspace approximations, we only have one Hamiltonian constraint
  (instead of infinitely many of them).

  In fact, the principle of general covariance in general relativity implies
  that global evolution per se does not exist; the time <math|t> is just a
  label we assign to one of the coordinate axes. Thus, what we think about as
  time evolution of any physical system is just a gauge transformation,
  similar to that of Quantum Electrodynamics (QED) induced by U(1) local
  gauge transformation <math|\<psi\>\<to\>e<rsup|i*\<theta\><around|(|<wide|r|\<vect\>>|)>>*\<psi\>>,
  where <math|\<theta\><around|(|<wide|r|\<vect\>>|)>> plays the role of
  local time. The role of a Hamiltonian is simply to restrict the space of
  the "kinematic" states of the Universe to that of "physical" states\Vthe
  ones that follow gauge orbits. For this reason, we call it a "Hamiltonian
  constraint". Upon quantization, physical states become wave functions that
  lie in the kernel of the Hamiltonian operator.

  In general, the Hamiltonian vanishes for a theory with general covariance
  or time-scaling invariance.

  \;

  <section*|References>

  <\thebibliography|99>
    <bibitem|DeWitt>DeWitt, Bryce S., "Quantum Theory of Gravity. I. The
    Canonical Theory". <with|font-shape|italic|Physical Review>, 1967, Volume
    160, Issue 5, Pages 1113\U1148.

    <bibitem|QuantumTime>"Quantum Experiment Shows How Time 'Emerges' from
    Entanglement". <with|font-shape|italic|Medium.com>, October 23, 2013.

    <bibitem|Rovelli>Rovelli, Carlo, <with|font-shape|italic|Notes for a
    brief history of quantum gravity>, January 23, 2001.

    <bibitem|PageWootters>Page, Don N. and Wootters, William K., "Evolution
    without evolution: Dynamics described by stationary observables".
    <with|font-shape|italic|Physical Review D>, 1983, Volume 27, Issue 12,
    Pages 2885\U2892.

    <bibitem|Rovelli1990>Rovelli, Carlo, "Quantum mechanics without time: A
    model". <with|font-shape|italic|Physical Review D>, 1990, Volume 42,
    Issue 8, Pages 2638\U2646.

    <bibitem|Boette>Boette, A. et al., "System-time entanglement in a
    discrete-time model". <with|font-shape|italic|Physical Review A>, 2016,
    Volume 93, Issue 6, Pages 062127.

    <bibitem|Boette18>Boette, A. and Rossignoli, R., "History states of
    systems and operators". <with|font-shape|italic|Physical Review A>, 2018,
    Volume 98, Issue 3, Pages 032108.

    <bibitem|Hamber>Hamber, Herbert W. and Williams, Ruth M., "Discrete
    Wheeler-DeWitt equation". <with|font-shape|italic|Physical Review D>,
    2011, Volume 84, Issue 10, Pages 104033.

    <bibitem|Hamber12>Hamber, Herbert W., Toriumi, Reiko, and Williams, Ruth
    M., "Wheeler-DeWitt equation in 2 + 1 dimensions".
    <with|font-shape|italic|Physical Review D>, 2012, Volume 86, Issue 8,
    Pages 084010.
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|6|1>>
    <associate|auto-3|<tuple|6|2>>
    <associate|auto-4|<tuple|8|2>>
    <associate|auto-5|<tuple|9|3>>
    <associate|auto-6|<tuple|9|3>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|bib-Boette|<tuple|Boette|4>>
    <associate|bib-Boette18|<tuple|Boette18|4>>
    <associate|bib-DeWitt|<tuple|DeWitt|4>>
    <associate|bib-Hamber|<tuple|Hamber|4>>
    <associate|bib-Hamber12|<tuple|Hamber12|4>>
    <associate|bib-PageWootters|<tuple|PageWootters|4>>
    <associate|bib-QuantumTime|<tuple|QuantumTime|4>>
    <associate|bib-Rovelli|<tuple|Rovelli|4>>
    <associate|bib-Rovelli1990|<tuple|Rovelli1990|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Wheeler\UDeWitt
      Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Motivation and Background
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Mathematical Formalism
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|Hamiltonian Constraint
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|Momentum Constraint
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|See
      Also> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>