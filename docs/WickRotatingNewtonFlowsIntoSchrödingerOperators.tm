<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Wick Rotating the Newton Flow Into A Schrödinger
  Operator>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Definitions and
    Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Conditions for
    Equivalence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Formal
    Expression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Solution for
    <with|color|#503050|font-family|rm|<with|mode|math|\<psi\><around|(|z,\<tau\>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Path Integral
    Formulation Of The Newton Flow> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Incorporating
    Inverse Branches in Path Integrals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section*|Definitions and Framework>

  Let <math|f:\<bbb-C\>\<rightarrow\>\<bbb-C\>> be a holomorphic function.
  The Newton flow for <math|f> is given by:

  <\equation>
    <frac|d*z|d*t>=-<frac|f<around|(|z<around*|(|t|)>|)>|f<rprime|'><around|(|z<around*|(|t|)>|)>>\<forall\><space|1em>z\<in\>\<bbb-C\>,t\<in\>\<bbb-R\>
  </equation>

  Wick rotation: <math|t\<mapsto\>-i*\<tau\>>, with
  <math|\<tau\>\<in\>\<bbb-R\>> (imaginary time).

  The Schrödinger equation in imaginary time:

  <\equation>
    -<frac|\<partial\>*\<psi\>|\<partial\>*\<tau\>>=H*=-<frac|1|2*m>*\<nabla\><rsup|2>+V<around|(|x|)>
  </equation>

  where <math|H> is the Hamiltonian operator

  <section*|Conditions for Equivalence>

  To establish an equivalence between the Newton flow under Wick rotation and
  solutions of the Schrödinger equation, we require:

  <\enumerate>
    <item><with|font-series|bold|Analytic continuation of the Newton flow>:
    <math|f<around|(|z|)>> and <math|f<rprime|'><around|(|z|)>> admit
    extensions to functions of <math|\<tau\>>, ensuring the flow equation
    remains well-defined under <math|t\<mapsto\>-i*\<tau\>>.

    <item><with|font-series|bold|Quadratic Hamiltonian correspondence>:
    Existence of a potential function <math|V<around|(|z|)>> derived from
    <math|f<around|(|z|)>>, such that the Hamiltonian

    <\equation>
      H=-<frac|1|2*m>*\<nabla\><rsup|2>+V<around|(|z|)>
    </equation>

    \ can generate dynamics equivalent to those described by the Newton flow
    after Wick rotation.

    <item><with|font-series|bold|Initial and boundary condition mapping>:
    Initial and boundary conditions for the Newton flow must map to
    physically meaningful conditions for the Schrödinger equation, ensuring
    solutions are comparable.
  </enumerate>

  <section*|Formal Expression>

  Given a holomorphic function <math|f<around|(|z|)>>, if there exists a
  potential function <math|V<around|(|z|)>> such that the Hamiltonian

  <\equation>
    H=-<frac|1|2*m>*\<nabla\><rsup|2>+V<around|(|z|)>
  </equation>

  yields a Schrödinger equation in imaginary time,

  <\equation>
    -<frac|\<partial\>*\<psi\>|\<partial\>*\<tau\>>=<around|(|-<frac|1|2*m>*\<nabla\><rsup|2>+V<around|(|z|)>|)>*\<psi\><around|(|z,\<tau\>|)>
  </equation>

  whose solutions <math|\<psi\><around|(|z,\<tau\>|)>> exhibit dynamics that
  can be directly related to the trajectories <math|z<around|(|\<tau\>|)>>
  defined by the analytically continued Newton flow

  <\equation>
    <frac|d*z|d*\<tau\>>=-i*<frac|f<around|(|z|)>|f<rprime|'><around|(|z|)>>
  </equation>

  then the Newton flow is said to be equivalent to solutions of the
  Schrödinger equation under the specified potential <math|V<around|(|z|)>>.

  <section*|Solution for <math|\<psi\><around|(|z,\<tau\>|)>>>

  The symbolic solution to the Schrödinger equation for
  <math|\<psi\><around|(|z,\<tau\>|)>>, expressed in terms of differential
  operators and the potential <math|V<around|(|z|)>>, is given as:

  <\equation>
    \<psi\><around|(|z,\<tau\>|)>=<frac|-m\<cdot\><frac|\<partial\>*\<psi\>|\<partial\>*\<tau\>>+<frac|1|2>\<cdot\><frac|\<partial\><rsup|2>*\<psi\>|\<partial\>*z<rsup|2>>|m\<cdot\>V<around|(|z|)>>
  </equation>

  This expression illustrates the relationship between the wave function
  <math|\<psi\>>, its derivatives with respect to time (<math|\<tau\>>) and
  space (<math|z>), and the potential <math|V<around|(|z|)>>.

  <section*|Path Integral Formulation Of The Newton Flow>

  The path integral approach in quantum mechanics, formulated by Feynman,
  integrates over all possible configurations (or paths) a system can take
  between two states. For a given <math|S<around|(|t|)>> with its specific
  Newton flow <math|z<rsub|S><around|(|t|)>>, and the corresponding four
  inverse branches of <math|z<rsub|S><around|(|t|)><rsup|-1>>, integrating
  over these branches within the path integral framework means considering
  all possible "histories" that lead to a particular state, consistent with
  the dynamics dictated by <math|S<around|(|t|)>> and its inverses.

  <section*|Incorporating Inverse Branches in Path Integrals>

  <\enumerate>
    <item><with|font-series|bold|Identification of Paths>: Each inverse
    branch of <math|z<rsub|S><around|(|t|)><rsup|-1>> represents a distinct
    "history" or path that the system could follow. Given the quantum nature
    of path integrals, where all paths contribute to the quantum amplitude,
    each branch must be considered separately in the integral.

    <item><with|font-series|bold|Summing Over States>: The totality of states
    leading to a given state involves summing over the contributions of each
    of the four inverse branches. This is equivalent to summing over multiple
    "versions" of the system's history, each contributing to the final
    amplitude.

    <item><with|font-series|bold|Functional Integral Representation>: The
    path integral, in a functional sense, integrates over a space of
    functions \V in this case, the set of all possible
    <math|z<rsub|S><around|(|t|)>> paths defined by the inverse branches.
    This can be represented as:

    <\equation>
      <around|\<langle\>|z<rsub|f>\|z<rsub|i>|\<rangle\>>=<big|int>\<cal-D\><around|[|z<rsub|S><around|(|t|)>|]>*<space|0.17em>e<rsup|i*S<around|[|z<rsub|S><around|(|t|)>|]>/\<hbar\>>
    </equation>

    where <math|\<cal-D\><around|[|z<rsub|S><around|(|t|)>|]>> denotes the
    measure over the space of paths defined by <math|z<rsub|S><around|(|t|)>>
    and its inverses, and <math|S<around|[|z<rsub|S><around|(|t|)>|]>>
    represents the action evaluated along these paths. The integral sums the
    contributions of all paths weighted by
    <math|e<rsup|i<frac|*S<around|[|z<rsub|S><around|(|t|)>|]>|\<hbar\>>>>,
    with <math|S> being the action functional relevant to the quantum system
    described by the Newton flow.

    <item><with|font-series|bold|Quantum Amplitude and Observables>: The
    resulting integral provides the quantum amplitude for transitions between
    states, from which observable quantities, like probabilities and
    expectation values, can be calculated. The inclusion of multiple branches
    reflects the non-classical nature of quantum paths, where interference
    between different paths can lead to observable effects.
  </enumerate>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-4|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-5|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_32.tm>>
    <associate|auto-6|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_32.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definitions
      and Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Conditions
      for Equivalence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Formal
      Expression> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Solution
      for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<psi\><around|(|z,\<tau\>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Path
      Integral Formulation Of The Newton Flow>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Incorporating
      Inverse Branches in Path Integrals>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>