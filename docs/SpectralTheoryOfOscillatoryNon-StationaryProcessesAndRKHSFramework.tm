<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Theory of Oscillatory Non-Stationary
  Processes and RKHS Framework>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries
    and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Oscillatory Non-Stationary Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Evolutionary Spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Spectral
    Representation and Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Spectral Measure and Path
    Correspondence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2<space|2spc>Limit and Approximation Lemmas
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Reproducing
    Kernel Hilbert Space Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Kernel and RKHS
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|4.2<space|2spc>Analysis and Synthesis Operators
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Limits,
    Corollaries, and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This document synthesizes the spectral analysis of oscillatory
  non-stationary processes within the framework established by Priestley
  <cite|Priestley1981> and the theory of reproducing kernel Hilbert spaces
  (RKHS). The deterministic and stochastic duality of spectral measures,
  their representation via integral operators, and the foundational operators
  that connect paths and measures is explored. The focus is on
  continuous-time processes, their spectral representations, and the
  convergence of the limits involved in their definitions.

  <section|Preliminaries and Definitions>

  <subsection|Oscillatory Non-Stationary Processes>

  <\definition>
    <dueto|Oscillatory Non-Stationary Process>A real-valued stochastic
    process <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> is called
    <em|oscillatory non-stationary> in the sense of Priestley
    <cite|Priestley1981> if there exists a family of amplitude functions
    <math|A<rsub|t><around|(|\<omega\>|)>>, slowly varying in <math|t>, and a
    family of phase functions <math|\<theta\><around|(|\<omega\>|)>> such
    that

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*<around|(|\<theta\><around|(|\<omega\>|)>*t+\<phi\><around|(|\<omega\>,t|)>|)>>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|d*Z<around|(|\<omega\>|)>> is an orthogonal increment
    process, and the spectral representation extends the classical stationary
    case to a time-varying spectral density.
  </definition>

  \;

  <subsection|Evolutionary Spectrum>

  <\definition>
    <dueto|Evolutionary Spectrum>The <em|evolutionary spectrum>
    <math|h<rsub|t><around|(|\<omega\>|)>> of an oscillatory non-stationary
    process is defined as

    <\equation>
      h<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>
    </equation>

    where <math|\<mu\>> is a spectral measure, and
    <math|A<rsub|t><around|(|\<omega\>|)>> encodes the time-varying spectral
    gain.
  </definition>

  <section|Spectral Representation and Measures>

  <\definition>
    A process is said to be analytic when its sample paths are infinitely
    differentiable and belong to a suitable RKHS associated with the kernel
    corresponding to the processes spectral measure.\ 
  </definition>

  <subsection|Spectral Measure and Path Correspondence>

  <\theorem>
    <dueto|Path-Measure Isomorphism><label|thm:path_measure>Let
    <math|<around|{|X<around|(|t|)>|}>> be an analytic oscillatory process
    with spectral measure <math|d*Z<around|(|\<omega\>|)>>. Then, conditioned
    on the sample path <math|X<around|(|\<cdummy\>|)>>, the associated
    spectral measure (or random measure) is a deterministic functional of
    <math|X>, given explicitly by

    <\equation>
      <around*|\<nobracket\>|d*Z<around|(|\<omega\>|)>=lim<rsub|N\<to\>\<infty\>><big|sum><rsub|k=1><rsup|N><around*|\<langle\>|X|(>\<cdot\>),e<rsup|i*\<omega\><rsub|k>\<cdot\>>|\<rangle\>>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|k>|)>
    </equation>

    where the limit is in the appropriate Hilbert space norm, and the measure
    is uniquely determined by the path.
  </theorem>

  <\proof>
    The proof follows from the spectral theorem for self-adjoint operators
    and the isometric isomorphism between the path space and the spectral
    measure space. Since the process is analytic, the spectral measure can be
    reconstructed exactly via the integral representation:

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation*>

    Conditioning on <math|X<around|(|\<cdummy\>|)>> fixes the spectral
    measure as a functional of the path, making it deterministic.
  </proof>

  <subsection|Limit and Approximation Lemmas>

  <\lemma>
    <dueto|Discretization Limit><label|lem:discrete_limit>Let
    <math|<around|{|\<omega\><rsub|k>|}>> be a sequence of frequency bins
    with mesh size tending to zero. Then, for a fixed analytic path
    <math|X<around|(|t|)>>,

    <\equation>
      <around*|\<nobracket\>|lim<rsub|<around|\||\<Delta\>*\<omega\>|\|>\<to\>0><big|sum><rsub|k><around*|\<langle\>|X|(>\<cdot\>),e<rsup|i*\<omega\><rsub|k>\<cdot\>>|\<rangle\>>*\<delta\>*<around|(|\<omega\>-\<omega\><rsub|k>|)>=d*Z<around|(|\<omega\>|)>
    </equation>

    where the convergence is in the sense of the weak topology of measures.
  </lemma>

  <\proof>
    This follows from the Riemann sum approximation of the integral
    representation of <math|X<around|(|t|)>> and the properties of the
    spectral measure as a finite measure in the continuous spectrum.
  </proof>

  <\lemma>
    <dueto|Spectral Approximation of Analytic
    Paths><label|lem:spectral_approx>For an analytic path
    <math|X<around|(|t|)>>, the spectral measure can be approximated
    arbitrarily well by band-limited filters via the sinc kernel:

    <\equation>
      X<around|(|t|)>\<approx\><big|int><rsub|-\<Omega\>><rsup|\<Omega\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    with the approximation improving as the cutoff frequency
    <math|\<Omega\>\<to\>\<infty\>>.
  </lemma>

  <\proof>
    This is a consequence of the Paley\UWiener theorem and the fact that the
    Fourier transform of an analytic function with entire extension is
    supported on the entire real line, allowing the approximation by
    band-limited projections.
  </proof>

  <section|Reproducing Kernel Hilbert Space Framework>

  <subsection|Kernel and RKHS>

  <\definition>
    <dueto|Reproducing Kernel>A kernel <math|K:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-R\>>
    is called a <em|reproducing kernel> if it is positive definite and for
    the Hilbert space

    <\equation>
      \<cal-H\><rsub|K>=<wide|<text|span>|\<bar\>><around|{|K|(>\<cdot\>,t):t\<in\>\<bbb-R\>}
    </equation>

    the reproducing property holds:

    <\equation>
      f<around|(|t|)>=<around|\<langle\>|f,K|(>\<cdot\>,t)\<rangle\><rsub|\<cal-H\><rsub|K>><space|1em>\<forall\>f\<in\>\<cal-H\><rsub|K>
    </equation>
  </definition>

  <subsection|Analysis and Synthesis Operators>

  <\theorem>
    <dueto|Operators in RKHS><label|thm:operators>Let
    <math|<around|{|f<rsub|i>|}>> be a frame in <math|\<cal-H\><rsub|K>>,
    with analysis operator <math|T:\<cal-H\><rsub|K>\<to\>\<ell\><rsup|2>>

    <\equation>
      T<around|(|f|)>=<around|(|<around|\<langle\>|f,f<rsub|i>|\<rangle\>>|)><rsub|i>
    </equation>

    and synthesis operator <math|T<rsup|\<ast\>>:\<ell\><rsup|2>\<to\>\<cal-H\><rsub|K>>

    <\equation>
      T<rsup|\<ast\>><around|(|a<rsub|i>|)>=<big|sum><rsub|i>a<rsub|i>*f<rsub|i>
    </equation>

    Then, the composition <math|S=T<rsup|\<ast\>>*T> is the frame operator,
    which is bounded, invertible, and satisfies

    <\equation>
      f=S<rsup|-1><around*|(|<big|sum><rsub|i><around|\<langle\>|f,f<rsub|i>|\<rangle\>>*f<rsub|i>|)>
    </equation>
  </theorem>

  <\proof>
    Standard frame theory results <cite|Christensen2003> apply, noting that
    the kernel functions <math|K<around|(|\<cdummy\>,t|)>> form a continuous
    frame for the RKHS.
  </proof>

  <section|Limits, Corollaries, and Remarks>

  <\corollary>
    <dueto|Determinism of Path-Conditioned
    Measure><label|cor:deterministic>For a fixed analytic sample path
    <math|X<around|(|t|)>>, the spectral measure
    <math|d*Z<around|(|\<omega\>|)>> is a deterministic function, explicitly
    given by the spectral projection of <math|X<around|(|t|)>> onto the basis
    functions <math|e<rsup|i*\<omega\>*t>>. The randomness collapses upon
    conditioning, and the measure is uniquely determined by the path.
  </corollary>

  <\remark>
    The duality between the path and measure representations is a
    manifestation of the isomorphism in the RKHS framework, where the
    spectral measure encodes all frequency content and the path is
    reconstructed via the inverse spectral integral. This is analogous to the
    synthesis and analysis operators in frame theory, providing a rigorous
    foundation for spectral synthesis.
  </remark>

  <section|Conclusion>

  This synthesis demonstrates that the spectral measure associated with an
  analytic, oscillatory non-stationary process is a deterministic functional
  once conditioned on the sample path. The integral operators, spectral
  representations, and RKHS structures provide a rigorous mathematical
  framework connecting the path and measure, with limits and approximations
  justified via classical analysis. The duality and isomorphism underpin many
  modern approaches in spectral analysis, kernel methods, and stochastic
  process theory.

  <\thebibliography|10>
    <bibitem|Priestley1981>M. B. Priestley, <em|Spectral Analysis and Time
    Series>, Academic Press, 1981.

    <bibitem|Christensen2003>O. Christensen, <em|An Introduction to Frames
    and Riesz Bases>, Birkhäuser, 2003.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-10|<tuple|4.2|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-11|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-12|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-13|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-4|<tuple|2.2|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-5|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-6|<tuple|3.1|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-7|<tuple|3.2|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-8|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-9|<tuple|4.1|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Christensen2003|<tuple|Christensen2003|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Priestley1981|<tuple|Priestley1981|5|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|cor:deterministic|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|lem:discrete_limit|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|lem:spectral_approx|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:operators|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:path_measure|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Priestley1981

      Priestley1981

      Christensen2003
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries
      and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Oscillatory Non-Stationary
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Evolutionary Spectrum
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      Representation and Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Spectral Measure and Path
      Correspondence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Limit and Approximation
      Lemmas <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Reproducing
      Kernel Hilbert Space Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Kernel and RKHS
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Analysis and Synthesis
      Operators <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Limits,
      Corollaries, and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>