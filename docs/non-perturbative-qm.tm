<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  <\hide-preamble>
    <assign|tightlist|<macro|>>
  </hide-preamble>

  <doc-data|<doc-date|>>

  In a non-perturbative approach, we aim to solve the time-dependent
  Schrödinger equation exactly, without relying on perturbative
  approximations. The overlap integral plays a crucial role in this context
  as well.

  Consider the time-dependent Schrödinger equation:

  <\equation>
    i*\<hbar\><frac|\<partial\>|\<partial\>*t>\|\<psi\><around|(|t|)>\<rangle\>=<wide|H|^>\|\<psi\><around|(|t|)>\<rangle\>
  </equation>

  where <math|<wide|H|^>> is the Hamiltonian operator. If <math|<wide|H|^>>
  is time-independent, we can formally solve this equation as:

  <\equation>
    <around|\||\<psi\><around|(|t|)>|\<rangle\>>=e<rsup|-i<wide|H|^>t/\<hbar\>>\|\<psi\><around|(|0|)>\<rangle\>
  </equation>

  Here, <math|<around|\||\<psi\><around|(|0|)>|\<rangle\>>> is the initial
  state at time <math|t=0>. The exponential operator
  <math|e<rsup|-i<wide|H|^>t/\<hbar\>>> is the time-evolution operator, which
  governs the unitary evolution of the quantum state.

  To calculate the probability amplitude of finding the system in an energy
  eigenstate <math|<around|\||\<lambda\>|\<rangle\>>> at time <math|t>, we
  compute the overlap integral:

  <\equation*>
    <around|\<langle\>|\<lambda\>\|\<psi\><around|(|t|)>|\<rangle\>>=<around|\<langle\>|\<lambda\><around|\||e<rsup|-i<wide|H|^>t/\<hbar\>>|\|>*\<psi\><around|(|0|)>|\<rangle\>>
  </equation*>

  Using the spectral decomposition of the Hamiltonian,

  <\equation>
    <wide|H|^>=<big|sum><rsub|\<lambda\>>\<lambda\>\|\<lambda\>\<rangle\><around|\<langle\>|\<lambda\>|\|>
  </equation>

  , we can express this as:

  <\equation*>
    <around|\<langle\>|\<lambda\>\|\<psi\><around|(|t|)>|\<rangle\>>=e<rsup|-i*\<lambda\>*t/\<hbar\>><around|\<langle\>|\<lambda\>\|\<psi\><around|(|0|)>|\<rangle\>>
  </equation*>

  The probability of measuring the system in the eigenstate
  <math|<around|\||\<lambda\>|\<rangle\>>> at time <math|t> is then given by:

  <\equation>
    P<around|(|\<lambda\>,t|)>=<around|\||<around|\<langle\>|\<lambda\>\|\<psi\><around|(|t|)>|\<rangle\>>|\|><rsup|2>=<around|\||<around|\<langle\>|\<lambda\>\|\<psi\><around|(|0|)>|\<rangle\>>|\|><rsup|2>
  </equation>

  This result shows that the probability is time-independent, a consequence
  of the stationary nature of energy eigenstates.

  To obtain the average value of an observable <math|<wide|A|^>> at time
  <math|t>, we use the expectation value:

  <\equation>
    <around|\<langle\>|<wide|A|^>|\<rangle\>><rsub|t>=<around|\<langle\>|\<psi\><around|(|t|)><around|\||<wide|A|^>|\|>*\<psi\><around|(|t|)>|\<rangle\>>=<big|sum><rsub|\<lambda\>><around|\<langle\>|\<psi\><around|(|t|)>\|\<lambda\>|\<rangle\>>*<around|\<langle\>|\<lambda\><around|\||<wide|A|^>|\|>*\<psi\><around|(|t|)>|\<rangle\>>
  </equation>

  By evaluating these overlap integrals and summing over the energy
  eigenstates, we can compute the time-dependent expectation values of
  observables without resorting to perturbation theory.

  This non-perturbative approach provides exact solutions, but it relies on
  our ability to diagonalize the Hamiltonian and find its eigenstates and
  eigenvalues.\ 
</body>

<initial|<\collection>
</collection>>