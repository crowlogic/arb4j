<TeXmacs|2.1.1>

<style|generic>

<\body>
  <documentclass|article> <usepackage|amsmath>

  <section*|Results>

  The classical action in physics is denoted by <math|S> and is defined as
  the integral of the Lagrangian function <math|L> over a certain time
  interval from <math|t<rsub|1>> to <math|t<rsub|2>>. The Lagrangian function
  itself depends on the generalized coordinates <math|q<rsub|i>>, their time
  derivatives <math|<wide|q|\<dot\>><rsub|i>>, and time <math|t>. Thus, the
  action <math|S> can be expressed as:

  <\equation>
    S=<big|int><rsub|t<rsub|1>><rsup|t<rsub|2>>L<around|(|q<rsub|i>,<wide|q|\<dot\>><rsub|i>,t|)>*<space|0.17em>d*t
  </equation>

  The Lagrangian function <math|L> is defined as the difference between the
  kinetic energy <math|T> and the potential energy <math|V>:

  <\equation>
    L=T-V
  </equation>

  This formulation is central to the principles of classical mechanics,
  especially in the context of Lagrangian and Hamiltonian mechanics. The
  principle of least action states that the path taken by a physical system
  is such that the action is stationary (no variation to the first order)
  with respect to variations of the path. This leads to the derivation of the
  Euler-Lagrange equations, which provide the dynamics of the system:

  <\equation>
    <frac|d|d*t><around*|(|<frac|\<partial\>*L|\<partial\>*<wide|q|\<dot\>><rsub|i>>|)>-<frac|\<partial\>*L|\<partial\>*q<rsub|i>>=0
  </equation>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>