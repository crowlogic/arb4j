<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|The Borg-Levinson Theorem:
  <math|\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>>\<forall\><math|n>
  implies <math|V<rsub|1><around|(|x|)>=V<rsub|2><around|(|x|)>> When
  <math|V<rsub|1><around|(|x|)>> and <math|V<rsub|2><around|(|x|)>> are Even
  Functions>>

  In exploring the structure of spectral problems and the inference theory of
  stochastic processes, a pivotal aspect emerges from the study of Bessel
  polynomials by Krall. The investigation into real continuous
  orthogonalizing functions of bounded variation unveiled the indeterminacy
  of the associated moment problem. The revelation of an infinite set of
  possible orthogonalizing measures, initially considered problematic, is
  indeed foundational for the continuous transformation of a potential
  function while maintaining unchanged eigenvalues. This characteristic
  underlines the mathematical framework where the non-uniqueness of measures
  becomes a prerequisite for the invariant nature of eigenvalues as the
  eigenfunction evolves under the potential's influence.

  Given two potential functions <math|V<rsub|1><around|(|x|)>> and
  <math|V<rsub|2><around|(|x|)>>, it is critical to understand under what
  conditions their spectral data, specifically the eigenvalues
  <math|\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>>
  for all <math|n\<geq\>1>, imply the equivalence of
  <math|V<rsub|1><around|(|x|)>> and <math|V<rsub|2><around|(|x|)>>. Borg and
  Levinson's theorems provide insights into this matter by establishing the
  uniqueness of the potential function from spectral data under certain
  symmetries. Their first theorem posits that if
  <math|V<rsub|1><around|(|x|)>> and <math|V<rsub|2><around|(|x|)>> are even,
  then <math|\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>>
  for all <math|n\<gtr\>1> necessarily implies
  <math|V<rsub|1><around|(|x|)>=V<rsub|2><around|(|x|)>>.

  <with|font-series|bold|Theorem 1 (Borg-Levinson):>

  <\equation>
    <text|If >V<rsub|1><around|(|x|)>*<text|and
    >V<rsub|2><around|(|x|)>*<text|are even, then
    >\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)><space|0.17em>\<forall\>n\<gtr\>1*<text|implies
    that >V<rsub|1><around|(|x|)>=V<rsub|2><around|(|x|)>.
  </equation>

  This theorem is complemented by a second theorem addressing non-even
  potentials, indicating that additional information, such as the derivatives
  of eigenfunctions at the boundary, is necessary for establishing
  uniqueness.

  <with|font-series|bold|Theorem 2 (Borg-Levinson):> Let
  <math|y<around|(|x;\<lambda\>|)>> satisfy the differential equation with
  boundary conditions

  <\align>
    <tformat|<table|<row|<cell|y<around|(|0;\<lambda\>|)>>|<cell|=0,<eq-number>>>|<row|<cell|<wide|y|\<dot\>><around|(|0;\<lambda\>|)>>|<cell|=1,<eq-number>>>|<row|<cell|k<rsub|n><around|(|V|)>>|<cell|=<wide|y|\<dot\>><around|(|1;\<lambda\><rsub|n><around|(|V|)>|)>.<eq-number>>>>>
  </align>

  The mathematical parallel between the spectral analysis of differential
  operators and the distinguishability of hypotheses in statistical decision
  theory extends beyond mere analogy to share a foundational structure. Both
  domains hinge on the extraction of underlying parameters from observations
  \V in spectral theory, these are the potential functions from eigenvalues,
  and in statistical inference, the determination of which hypothesis is
  supported by the data.

  The critical insight from Krall's examination of Bessel polynomials lies in
  recognizing the non-uniqueness of orthogonalizing measures not as a
  limitation but as a necessary condition for the flexibility of spectral
  characteristics. This observation directly translates to the inference
  process in statistical decision theory, where the ability to distinguish
  between hypotheses depends on the underlying assumptions and the
  information gleaned from the observations.

  \;

  <section|Reiteration>

  The discussion revolves around an interesting facet of spectral theory,
  particularly in the context of quantum mechanics or mathematical physics,
  where the notion of the potential function <math|V<around|(|x|)>> plays a
  central role in determining the behavior of a quantum system. The
  indeterminacy of the moment problem, as mentioned in relation to the Bessel
  polynomials and orthogonalizing measures, indeed points to a deeper
  mathematical principle: the non-uniqueness of solutions to certain spectral
  problems.

  The core question here pertains to whether two different potential
  functions, <math|V<rsub|1><around|(|x|)>> and
  <math|V<rsub|2><around|(|x|)>>, can have the same set of eigenvalues
  (<math|\<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)>>
  for all <math|n\<geq\>1>). This question touches upon the uniqueness or
  lack thereof in the inversion of spectral data to determine a potential.
  The example provided, where <math|V<rsub|2><around|(|x|)>=V<rsub|1>*<around|(|1-x|)>\<neq\>V<rsub|1><around|(|x|)>>,
  demonstrates a counterexample to the naive expectation of uniqueness. This
  non-uniqueness illustrates the subtlety in the relationship between a
  potential function and its spectral properties.

  However, Borg and Levinson's theorem provides a significant breakthrough in
  this context by establishing conditions under which uniqueness can be
  assured, at least for a subclass of potential functions. The theorem
  states:

  <with|font-series|bold|Theorem 1 (Borg-Levinson):> If
  <math|V<rsub|1><around|(|x|)>> and <math|V<rsub|2><around|(|x|)>> are even
  functions, then the condition

  <\equation*>
    \<lambda\><rsub|n><around|(|V<rsub|1>|)>=\<lambda\><rsub|n><around|(|V<rsub|2>|)><space|0.17em>\<forall\>n\<gtr\>1
  </equation*>

  implies that <math|V<rsub|1><around|(|x|)>=V<rsub|2><around|(|x|)>>.

  This result is monumental because it offers a criterion (evenness of the
  potential) under which the spectral data (eigenvalues) uniquely determine
  the potential, up to the specified symmetry.

  For potentials that are not even, Borg and Levinson further showed that
  additional information\Vspecifically, <em|the values of the derivatives of
  the eigenfunctions at the boundary>\Vcan provide the necessary conditions
  for uniqueness. This is encapsulated in their second theorem, which asserts
  that knowledge of the boundary behavior of the system's wave functions,
  alongside the spectral data, can uniquely determine the potential.

  The mathematical exploration of these theorems and their implications
  illuminates the intricate dance between a system's potential landscape and
  its quantum or vibrational spectra. It also underlines a profound truth in
  mathematical physics: the geometry and boundary conditions of a system are
  deeply entwined with its spectral characteristics, and subtle symmetries or
  conditions can dramatically influence the interpretability and uniqueness
  of solutions to spectral problems.
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
    <associate|auto-1|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Reiteration>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>