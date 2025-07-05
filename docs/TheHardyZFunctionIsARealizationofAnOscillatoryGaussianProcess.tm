<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Hardy Z Function is a Realization of an
  Oscillatory Gaussian Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\definition>
    An oscillatory process <math|X<around|(|t|)>> is defined by the spectral
    representation:

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>G<around|(|t,\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation*>

    where <math|G<around|(|t,\<lambda\>|)>> is the gain function,
    <math|d*Z<around|(|\<lambda\>|)>> is an orthogonal random measure with
    <math|\<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)>>,
    and <math|F<around|(|\<lambda\>|)>> is the integrated spectrum.
    <cite|evolutionarySpectraAndNonStationaryProcesses><cite|powerSpectralAnalysisOfNonStationaryRandomProcesses><cite|characterizationOscillatoryProcesses><cite|envelopeUniquenessOscillatoryProcess><cite|envelopeOscillatoryProcessUpcrossings>
  </definition>

  <\conjecture>
    The Hardy Z-function

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<around*|(|<tfrac|1|2>+i*<space|0.17em>t|)>
    </equation*>

    is a realization of an oscillatory process with gain function

    <\equation*>
      G<around|(|t,\<lambda\>|)>=exp <around|(|i*<space|0.17em>\<lambda\>*<space|0.17em>\<theta\><around|(|t|)>|)>
    </equation*>

    and integrated spectrum

    <\equation*>
      F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>.
    </equation*>
  </conjecture>

  The Hardy Z-function is defined as <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
  where <math|\<theta\><around|(|t|)>> is the Riemann-Siegel theta function.
  To establish this as a realization of an oscillatory process, we utilize
  the functional equation and analytic properties of the Riemann zeta
  function.

  From the functional equation, we have:

  <\equation*>
    \<zeta\><around|(|s|)>=2<rsup|s>*\<pi\><rsup|s-1>*sin
    <around*|(|<frac|\<pi\>*s|2>|)>*\<Gamma\>*<around|(|1-s|)>*\<zeta\>*<around|(|1-s|)>
  </equation*>

  At <math|s=<tfrac|1|2>+i*t>, this yields:

  <\equation*>
    \<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>=2<rsup|<tfrac|1|2>+i*t>*\<pi\><rsup|-<tfrac|1|2>+i*t>*sin
    <around*|(|<frac|\<pi\>*<around|(|<tfrac|1|2>+i*t|)>|2>|)>*\<Gamma\>*<around*|(|<tfrac|1|2>-i*t|)>*\<zeta\>*<around*|(|<tfrac|1|2>-i*t|)>
  </equation*>

  The phase function <math|\<theta\><around|(|t|)>> is constructed such that
  <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
  is real-valued, establishing the connection to the oscillatory structure.

  The spectral representation follows from the Mellin transform
  representation of the zeta function and the asymptotic behavior of
  <math|\<theta\><around|(|t|)>\<sim\><frac|t|2>*log
  <frac|t|2*\<pi\>>-<frac|t|2>-<frac|\<pi\>|8>> as <math|t\<to\>\<infty\>>.

  The gain function <math|G<around|(|t,\<lambda\>|)>=exp
  <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)>> emerges naturally from
  the phase modulation structure, and the integrated spectrum
  <math|F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>> corresponds
  to the arcsine distribution, which is the limiting distribution of the
  normalized phase increments.

  <\conjecture>
    The Hardy Z-function admits the stochastic integral representation

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>exp
      <around|(|i*<space|0.17em>\<lambda\>*<space|0.17em>\<theta\><around|(|t|)>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation*>

    where the orthogonal random measure satisfies

    <\equation*>
      \<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=<frac|d*\<lambda\>|<sqrt|1-\<lambda\><rsup|2>>>.
    </equation*>
  </conjecture>

  The stochastic integral representation follows from the spectral theorem
  for stationary processes. Given the oscillatory nature of
  <math|Z<around|(|t|)>> and its phase structure, we can decompose it as:

  <\equation*>
    Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>exp
    <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)>*d*Z<around|(|\<lambda\>|)>
  </equation*>

  where <math|d*Z<around|(|\<lambda\>|)>> is an orthogonal random measure.
  The domain <math|<around|[|-1,1|]>> is determined by the bounded variation
  property of the phase function modulo the scaling factor.

  The orthogonality condition requires:

  <\equation*>
    \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*d*F<around|(|\<lambda\><rsub|1>|)>
  </equation*>

  where <math|F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>> is the
  integrated spectrum. This gives:

  <\equation*>
    \<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=<frac|d*\<lambda\>|<sqrt|1-\<lambda\><rsup|2>>>
  </equation*>

  The representation is valid due to the bounded variation of
  <math|\<theta\><around|(|t|)>> and the convergence properties of the
  Fourier-Stieltjes integral in the mean-square sense.

  <\lemma>
    The spectral density corresponding to the integrated spectrum
    <math|F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>> is

    <\equation*>
      f<around|(|\<lambda\>|)>=<frac|d|d*\<lambda\>>*arcsin
      <around|(|\<lambda\>|)>=<frac|1|<sqrt|1-\<lambda\><rsup|2>>>.
    </equation*>
  </lemma>

  <\proof>
    Direct differentiation:

    <\equation*>
      <frac|d|d*\<lambda\>>*arcsin <around|(|\<lambda\>|)>=<frac|1|<sqrt|1-\<lambda\><rsup|2>>>.
    </equation*>
  </proof>

  <\conjecture>
    The orthogonal random measure <math|d*Z<around|(|\<lambda\>|)>>
    corresponding to the Hardy Z-function satisfies

    <\equation*>
      \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><space|0.17em><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*<space|0.17em><frac|d*\<lambda\><rsub|1>|<sqrt|1-\<lambda\><rsub|1><rsup|2>>>.
    </equation*>
  </conjecture>

  The orthogonality condition follows from the spectral properties of the
  random measure <math|d*Z<around|(|\<lambda\>|)>>. For an orthogonal random
  measure, we require:

  <\equation*>
    \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*d*F<around|(|\<lambda\><rsub|1>|)>
  </equation*>

  where <math|F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>> is the
  integrated spectrum. Taking the derivative:

  <\equation*>
    <frac|d*F<around|(|\<lambda\>|)>|d*\<lambda\>>=<frac|d|d*\<lambda\>>*arcsin
    <around|(|\<lambda\>|)>=<frac|1|<sqrt|1-\<lambda\><rsup|2>>>
  </equation*>

  Therefore:

  <\equation*>
    \<bbb-E\>*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*<frac|d*\<lambda\><rsub|1>|<sqrt|1-\<lambda\><rsub|1><rsup|2>>>
  </equation*>

  <\theorem>
    [Jacobian Factor Derivation] The Jacobian factor in the inverse transform
    is <math|<sqrt|\<theta\><rprime|'><around|(|t|)>>> and not
    <math|\<theta\><rprime|'><around|(|t|)>> because the spectral density
    transforms as the square root of the derivative under change of
    variables.
  </theorem>

  <\proof>
    Consider the change of variables <math|u=\<theta\><around|(|t|)>> in the
    spectral representation. The differential transforms as:

    <\equation*>
      d*t=<frac|d*u|\<theta\><rprime|'><around|(|t|)>>
    </equation*>

    For the direct transform, we would have:

    <\equation*>
      <big|int>Z<around|(|t|)>*exp <around|(|-i*\<lambda\>*\<theta\><around|(|t|)>|)>*d*t=<big|int>Z<around|(|t<around|(|u|)>|)>*exp
      <around|(|-i*\<lambda\>*u|)><frac|d*u|\<theta\><rprime|'><around|(|t|)>>
    </equation*>

    However, the random measure <math|d*Z<around|(|\<lambda\>|)>> is defined
    by the condition:

    <\equation*>
      \<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=f<around|(|\<lambda\>|)>*d*\<lambda\>
    </equation*>

    When we change variables from <math|t> to
    <math|u=\<theta\><around|(|t|)>>, the spectral density
    <math|f<around|(|\<lambda\>|)>> must transform to preserve the total
    power. The power spectral density scales as:

    <\equation*>
      S<rsub|n*e*w><around|(|\<lambda\>|)>=S<rsub|o*l*d><around|(|\<lambda\>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>
    </equation*>

    Since the spectral density is the square root of the power spectral
    density:

    <\equation*>
      f<rsub|n*e*w><around|(|\<lambda\>|)>=<sqrt|S<rsub|n*e*w><around|(|\<lambda\>|)>>=<sqrt|S<rsub|o*l*d><around|(|\<lambda\>|)>\<cdot\>\<theta\><rprime|'><around|(|t|)>>=f<rsub|o*l*d><around|(|\<lambda\>|)><sqrt|\<theta\><rprime|'><around|(|t|)>>
    </equation*>

    Therefore, the inverse transform must include the factor
    <math|<sqrt|\<theta\><rprime|'><around|(|t|)>>> to maintain consistency
    with the spectral density transformation:

    <\equation*>
      d*Z<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Z<around|(|t|)>*<space|0.17em>exp
      <around|(|-i*<space|0.17em>\<lambda\>*<space|0.17em>\<theta\><around|(|t|)>|)><space|0.17em><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t\<cdot\>d*\<lambda\>
    </equation*>

    The square root factor ensures that when you multiply the forward and
    inverse transforms, the Jacobian factors combine correctly as:

    <\equation*>
      <sqrt|\<theta\><rprime|'><around|(|t|)>>\<cdot\><sqrt|\<theta\><rprime|'><around|(|t|)>>=\<theta\><rprime|'><around|(|t|)>
    </equation*>

    which is the proper Jacobian for the change of variables.
  </proof>

  <\corollary>
    For the Hardy Z-function, the random measure is:

    <\equation*>
      d*Z<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Z<around|(|t|)>*<space|0.17em>exp
      <around|(|-i*<space|0.17em>\<lambda\>*<space|0.17em>\<theta\><around|(|t|)>|)><space|0.17em><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t\<cdot\>d*\<lambda\>
    </equation*>
  </corollary>

  <\proof>
    Direct substitution with the understanding that the
    <math|<sqrt|\<theta\><rprime|'><around|(|t|)>>> factor preserves the
    spectral density transformation under the change of variables
    <math|u=\<theta\><around|(|t|)>>.
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|5>
      <bibitem*|1><label|bib-envelopeUniquenessOscillatoryProcess>A.<nbsp>M.<nbsp>Hasofer.
      <newblock>A uniqueness problem for the envelope of an oscillatory
      process. <newblock><with|font-shape|italic|Journal of Applied
      Probability>, 16(4):822\U829, December 1979.<newblock>

      <bibitem*|2><label|bib-envelopeOscillatoryProcessUpcrossings>A.<nbsp>M.<nbsp>Hasofer<localize|
      and >P.<nbsp>Petocz. <newblock>The envelope of an oscillatory process
      and its upcrossings. <newblock><with|font-shape|italic|Advances in
      Applied Probability>, 10(4):711\U716, 1978.<newblock>

      <bibitem*|3><label|bib-characterizationOscillatoryProcesses>V.<nbsp>Mandrekar.
      <newblock>A characterization of oscillatory processes and their
      prediction. <newblock><with|font-shape|italic|Proceedings of the
      American Mathematical Society>, 32(1):280\U284, 1972.<newblock>

      <bibitem*|4><label|bib-evolutionarySpectraAndNonStationaryProcesses>Maurice<nbsp>B
      Priestley. <newblock>Evolutionary spectra and non-stationary processes.
      <newblock><with|font-shape|italic|Journal of the Royal Statistical
      Society: Series B (Methodological)>, 27(2):204\U229, 1965.<newblock>

      <bibitem*|5><label|bib-powerSpectralAnalysisOfNonStationaryRandomProcesses>MB
      Priestley. <newblock>Power spectral analysis of non-stationary random
      processes. <newblock><with|font-shape|italic|Journal of Sound and
      Vibration>, 6(1):86\U97, 1967.<newblock>
    </bib-list>
  </bibliography>

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
    <associate|auto-1|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-characterizationOscillatoryProcesses|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-envelopeOscillatoryProcessUpcrossings|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-envelopeUniquenessOscillatoryProcess|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-powerSpectralAnalysisOfNonStationaryRandomProcesses|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      evolutionarySpectraAndNonStationaryProcesses

      powerSpectralAnalysisOfNonStationaryRandomProcesses

      characterizationOscillatoryProcesses

      envelopeUniquenessOscillatoryProcess

      envelopeOscillatoryProcessUpcrossings
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>