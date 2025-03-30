<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Estimating Evolutionary Power Spectra of Nonstationary
  Processes>>

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Random response of Linear Single Degree-of-Freedom systems>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Links
    To Hamiltonian Mechanics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>
  </table-of-contents>

  <section|The Random response of Linear Single Degree-of-Freedom systems>

  Consider the random response of a linear single-degree-of-freedom (SDOF)
  system given by the equation:

  <\equation*>
    m*<wide|x|\<ddot\>>+c*<wide|x|\<dot\>>+k*x=f<around|(|t|)>
  </equation*>

  where <math|m> represents the mass, <math|c> the damping coefficient,
  <math|k> the stiffness of the system, and <math|f<around|(|t|)>> is a
  broadband nonstationary stochastic process. Further, assume that
  <math|f<around|(|t|)>> admits an integral representation of the form:

  <\equation*>
    f<around|(|t|)>=<big|int><rsub|0><rsup|t>K*<around|(|t-s|)>*<space|0.17em>d*B<around|(|s|)>
  </equation*>

  where <math|K<around|(|t|)>> is a slowly varying deterministic function,
  and <math|B<around|(|t|)>> is an orthogonal process, such that:

  <\equation*>
    E*<around|[|B<around|(|t|)>*B<around|(|s|)>|]>=min <around|(|t,s|)>
  </equation*>

  Then, it can be proved that the EPS of <math|f<around|(|t|)>> can be
  effectively estimated by considering the energy output of the system, which
  is quantified as:

  <\equation*>
    E<around|(|t|)>=<frac|1|2>*m*<wide|x|\<dot\>><rsup|2><around|(|t|)>+<frac|1|2>*k*x<rsup|2><around|(|t|)>
  </equation*>

  The proposed methodology for estimating the evolutionary power spectrum
  (EPS) begins with the acquisition of energy data <math|E<around|(|t|)>>
  from the SDOF system response to the nonstationary input
  <math|f<around|(|t|)>>. The first statistical moment of
  <math|E<around|(|t|)>> is then evaluated, typically involving a complex
  oscillatory pattern, necessitating a smoothing procedure.

  To refine the estimates, a Savitzky-Golay (S-G) filter is employed, which
  uses a polynomial model to smooth the fluctuating energy data, thereby
  facilitating a more accurate approximation of the EPS. This approach helps
  in reducing the noise and enhancing the stability of the estimated EPS,
  particularly when limited data records are available. Further refinements
  include monitoring the mean and the derivative of the energy function
  through a polynomial model, which provides a better understanding of the
  dynamics and variations of the system's energy over time.

  The effectiveness and accuracy of this novel EPS estimation method are
  demonstrated through numerical simulations involving synthetic
  nonstationary processes, as well as real-world earthquake accelerograms,
  providing a comprehensive evaluation of its performance compared to
  existing methods like wavelet transform-based EPS estimation. This detailed
  analysis not only confirms the utility of the SDOF system as a spectral
  estimator but also highlights the importance of advanced smoothing
  techniques in dealing with real-world data.

  <section|Links To Hamiltonian Mechanics>

  Yes, you are correct in recognizing that the function
  <math|E<around|(|t|)>> mentioned in the context of the SDOF system's
  response to a stochastic process resembles the Hamiltonian of a harmonic
  oscillator. In classical mechanics, the Hamiltonian <math|H> of a harmonic
  oscillator is expressed as:

  <\equation*>
    H=<frac|1|2*m>*p<rsup|2>+<frac|1|2>*k*x<rsup|2>
  </equation*>

  where <math|p=m*<wide|x|\<dot\>>> is the momentum, <math|m> is the mass,
  <math|k> is the stiffness, and <math|x> is the displacement.

  For the SDOF system under discussion, <math|E<around|(|t|)>> is given by:

  <\equation*>
    E<around|(|t|)>=<frac|1|2>*m*<wide|x|\<dot\>><rsup|2><around|(|t|)>+<frac|1|2>*k*x<rsup|2><around|(|t|)>
  </equation*>

  Here, <math|<frac|1|2>*m*<wide|x|\<dot\>><rsup|2><around|(|t|)>> represents
  the kinetic energy and <math|<frac|1|2>*k*x<rsup|2><around|(|t|)>>
  represents the potential energy of the system. The sum of these two forms
  the total mechanical energy of the system, which is analogous to the
  Hamiltonian in the case of conservative systems where the total energy is
  conserved.

  In the case of the SDOF system being excited by a stochastic process,
  <math|E<around|(|t|)>> also acts as an indicator of the energy content in
  the system at any given time, which is central to the methodology for
  estimating the evolutionary power spectrum (EPS) of the nonstationary
  process exciting the system. This similarity underscores the foundational
  principles of mechanics and energy conservation that apply across both
  deterministic and stochastic systems.

  Absolutely, you're right. The function <math|E<around|(|t|)>> for the SDOF
  system is indeed the Hamiltonian of a harmonic oscillator when considering
  only conservative forces (no non-conservative damping or external forcing).
  The formula represents the total mechanical energy, combining both kinetic
  and potential energies, which is exactly what the Hamiltonian describes in
  classical mechanics for conservative systems.

  In the case of the SDOF system analysis, it maintains this form and
  function, making it not just a resemblance but essentially the same as the
  Hamiltonian for a harmonic oscillator. This relationship directly links the
  concepts used in mechanical vibrations and stochastic process analysis to
  fundamental physics principles found in classical mechanics.

  TODO: Cite <slink|https://www.sciencedirect.com/science/article/abs/pii/S0951832024000371>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_39.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Random response of Linear Single Degree-of-Freedom systems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Links
      To Hamiltonian Mechanics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>