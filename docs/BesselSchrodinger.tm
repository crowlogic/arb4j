<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Solution to the Schrödinger Equation for a Free
  Particle in Cylindrical Coordinates>>

  <section|Introduction>

  This document presents the solution to the time-independent Schrödinger
  equation for a free particle in cylindrical coordinates, illustrating the
  appearance of Bessel functions in quantum mechanics.

  <section|Schrödinger Equation>

  The time-independent Schrödinger equation for a free particle is given by:

  <\equation*>
    -<frac|\<hbar\><rsup|2>|2*m>*\<nabla\><rsup|2>*\<psi\><around|(|<math-bf|r>|)>=E*\<psi\><around|(|<math-bf|r>|)>
  </equation*>

  where <math|\<hbar\>> is the reduced Planck constant, <math|m> is the mass
  of the particle, <math|\<nabla\><rsup|2>> is the Laplacian operator,
  <math|\<psi\><around|(|<math-bf|r>|)>> is the wave function, and <math|E>
  is the energy of the particle.

  <section|Solution in Cylindrical Coordinates>

  Assuming the solution has the form <math|\<psi\><around|(|\<rho\>,\<phi\>,z|)>=R<around|(|\<rho\>|)>*\<Phi\><around|(|\<phi\>|)>*Z<around|(|z|)>>,
  we obtain:

  <subsection|Radial Component>

  The radial part leads to Bessel's differential equation with the solution:

  <\equation*>
    R<around|(|\<rho\>|)>=A*J<rsub|\<mu\>>*<around|(|<sqrt|\<lambda\>>*\<rho\>|)>
  </equation*>

  where <math|A> is a normalization constant, <math|J<rsub|\<mu\>>> is the
  Bessel function of the first kind, <math|\<mu\>> is a separation constant,
  and <math|\<lambda\>> is related to the energy.

  <subsection|Angular Component>

  The angular part of the wave function is:

  <\equation*>
    \<Phi\><around|(|\<phi\>|)>=B*cos <around|(|\<mu\>*\<phi\>|)>+C*sin
    <around|(|\<mu\>*\<phi\>|)>
  </equation*>

  where <math|B> and <math|C> are constants.

  <subsection|Axial Component>

  For the <math|z> direction, we have:

  <\equation*>
    Z<around|(|z|)>=D*e<rsup|i*k*z>+E*e<rsup|-i*k*z>
  </equation*>

  where <math|k> is related to the energy, and <math|D> and <math|E> are
  constants.

  <subsection|Complete Solution>

  The full solution for the wave function
  <math|\<psi\><around|(|\<rho\>,\<phi\>,z|)>> is:

  <\equation*>
    \<psi\><around|(|\<rho\>,\<phi\>,z|)>=A*J<rsub|\<mu\>>*<around|(|<sqrt|\<lambda\>>*\<rho\>|)>*<around*|(|B*cos
    <around|(|\<mu\>*\<phi\>|)>+C*sin <around|(|\<mu\>*\<phi\>|)>|)>*<around*|(|D*e<rsup|i*k*z>+E*e<rsup|-i*k*z>|)>
  </equation*>

  <section|Conclusion>

  This solution demonstrates the role of Bessel functions in describing the
  radial behavior of a quantum particle in a cylindrical setup and highlights
  the symmetry of the problem.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-4|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-5|<tuple|3.2|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-6|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-7|<tuple|3.4|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-8|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Schrödinger
      Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Solution
      in Cylindrical Coordinates> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Radial Component
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Angular Component
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Axial Component
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Complete Solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>