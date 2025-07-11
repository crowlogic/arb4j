<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Recovery and Pre-Envelope Theory: Formal
  Theorems>|<doc-author|<author-data|<author-name|Mathematical
  Analysis>>>|<doc-date|<date|>>>

  <section|Spectral Recovery Theory>

  <\theorem>
    [Spectral Recovery for Real Stationary
    Processes]<label|thm:spectral_recovery>Let <math|X<around|(|t|)>> be a
    real-valued, zero-mean, stationary Gaussian process with spectral
    representation:

    <\equation>
      <label|eq:spectral_rep_real>X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>
    </equation>

    Then the orthogonal random measures <math|U<around|(|\<lambda\>|)>> and
    <math|V<around|(|\<lambda\>|)>> are recovered from the sample path by:

    <\equation>
      <label|eq:u_recovery>U<around|(|\<lambda\>|)>=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>X<around|(|t|)>*cos
      <around|(|\<lambda\>*t|)>*d*t
    </equation>

    <\equation>
      <label|eq:v_recovery>V<around|(|\<lambda\>|)>=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>X<around|(|t|)>*sin
      <around|(|\<lambda\>*t|)>*d*t
    </equation>
  </theorem>

  <\proof>
    Apply the orthogonality relations of the trigonometric system. For
    <math|U<around|(|\<lambda\>|)>>:

    <\equation>
      <label|eq:u_proof_step1><big|int><rsub|0><rsup|\<infty\>>X<around|(|t|)>*cos
      <around|(|\<mu\>*t|)>*d*t=<big|int><rsub|0><rsup|\<infty\>><around*|[|<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>|]>*cos
      <around|(|\<mu\>*t|)>*d*t
    </equation>

    Interchanging integration order:

    <\equation>
      <label|eq:u_proof_step2>=<big|int><rsub|0><rsup|\<infty\>>d*U<around|(|\<lambda\>|)>*<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*t|)>*cos <around|(|\<mu\>*t|)>*d*t+<big|int><rsub|0><rsup|\<infty\>>d*V<around|(|\<lambda\>|)>*<big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<lambda\>*t|)>*cos <around|(|\<mu\>*t|)>*d*t
    </equation>

    Using orthogonality:

    <\equation>
      <label|eq:orthogonality_cos><big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*t|)>*cos <around|(|\<mu\>*t|)>*d*t=<frac|\<pi\>|2>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>
    </equation>

    <\equation>
      <label|eq:orthogonality_sin_cos><big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<lambda\>*t|)>*cos <around|(|\<mu\>*t|)>*d*t=0
    </equation>

    Therefore:

    <\equation>
      <label|eq:u_proof_final><big|int><rsub|0><rsup|\<infty\>>X<around|(|t|)>*cos
      <around|(|\<mu\>*t|)>*d*t=<frac|\<pi\>|2>*U<around|(|\<mu\>|)>
    </equation>

    Hence: <math|U<around|(|\<mu\>|)>=<frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>X<around|(|t|)>*cos
    <around|(|\<mu\>*t|)>*d*t>. The proof for <math|V<around|(|\<lambda\>|)>>
    is analogous.
  </proof>

  <\theorem>
    [Analytic Signal Representation]<label|thm:analytic_signal>For any
    real-valued stationary process <math|X<around|(|t|)>>, the analytic
    signal <math|Z<around|(|t|)>> is defined as:

    <\equation>
      <label|eq:analytic_signal_def>Z<around|(|t|)>=X<around|(|t|)>+i*<wide|X|^><around|(|t|)>
    </equation>

    where the quadrature process is:

    <\equation>
      <label|eq:quadrature_process><wide|X|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>-cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>
    </equation>

    Then <math|Z<around|(|t|)>> admits the complex exponential
    representation:

    <\equation>
      <label|eq:complex_exponential_rep>Z<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*d*\<zeta\><around|(|\<lambda\>|)>
    </equation>

    where <math|d*\<zeta\><around|(|\<lambda\>|)>=d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>>
    is the pre-envelope spectral measure.
  </theorem>

  <\proof>
    <\equation>
      <label|eq:analytic_proof_step1>Z<around|(|t|)>=X<around|(|t|)>+i*<wide|X|^><around|(|t|)>
    </equation>

    <\align>
      <tformat|<table|<row|<cell|<label|eq:analytic_proof_step2>>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>|]>>>|<row|<cell|>|<cell|<space|1em>+i*<big|int><rsub|0><rsup|\<infty\>><around|[|sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>-cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>|]><eq-number>>>>>
    </align>

    Collecting terms:

    <\align>
      <tformat|<table|<row|<cell|<label|eq:analytic_proof_step3>>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|<around|(|cos
      <around|(|\<lambda\>*t|)>+i*sin <around|(|\<lambda\>*t|)>|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+<around|(|sin
      <around|(|\<lambda\>*t|)>-i*cos <around|(|\<lambda\>*t|)>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|e<rsup|i*\<lambda\>*t>*<space|0.17em>d*U<around|(|\<lambda\>|)>-i*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*V<around|(|\<lambda\>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*<around|[|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|]><eq-number>>>>>
    </align>

    Setting <math|d*\<zeta\><around|(|\<lambda\>|)>=d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>>
    completes the proof.
  </proof>

  <\theorem>
    [Pre-Envelope Spectral Measure Properties]<label|thm:pre_envelope_properties>The
    pre-envelope spectral measure <math|\<zeta\><around|(|\<lambda\>|)>>
    satisfies:

    <\enumerate>
      <item><math|E*<around|[|d*\<zeta\><around|(|\<lambda\>|)>|]>=0>

      <item><math|E<around|[|<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*G<around|(|\<lambda\>|)>>
      where <math|G<around|(|\<lambda\>|)>> is the spectral distribution
      function

      <item><math|E*<around|[|d*\<zeta\><around|(|\<lambda\><rsub|1>|)><wide|d*\<zeta\><around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=0>
      for <math|\<lambda\><rsub|1>\<neq\>\<lambda\><rsub|2>>
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <item>

      <\equation>
        <label|eq:pre_envelope_mean>E*<around|[|d*\<zeta\><around|(|\<lambda\>|)>|]>=E*<around|[|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|]>=0-i\<cdot\>0=0
      </equation>

      <item>

      <\align>
        <tformat|<table|<row|<cell|<label|eq:pre_envelope_variance>E<around|[|<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=E<around|[|<around|(|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|)><around|(|<wide|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|\<bar\>>|)>|]>>>|<row|<cell|>|<cell|=E*<around|[|<around|(|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|)>*<around|(|d*U<around|(|\<lambda\>|)>+i*<space|0.17em>d*V<around|(|\<lambda\>|)>|)>|]>>>|<row|<cell|>|<cell|=E<around|[|<around|\||d*U<around|(|\<lambda\>|)>|\|><rsup|2>|]>+E<around|[|<around|\||d*V<around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*G<around|(|\<lambda\>|)><eq-number>>>>>
      </align>

      Since <math|E<around|[|<around|\||d*U<around|(|\<lambda\>|)>|\|><rsup|2>|]>=E<around|[|<around|\||d*V<around|(|\<lambda\>|)>|\|><rsup|2>|]>=<frac|1|2>*d*G<around|(|\<lambda\>|)>>
      by symmetry.

      <item>Orthogonality follows from the orthogonality of <math|U> and
      <math|V> increments.
    </enumerate>
  </proof>

  <section|Envelope Theory>

  <\theorem>
    [Envelope as Absolute Value of Analytic
    Signal]<label|thm:envelope_absolute_value>The envelope
    <math|R<around|(|t|)>> of the real process <math|X<around|(|t|)>> is
    given by:

    <\equation>
      <label|eq:envelope_def>R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>=<sqrt|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>
    </equation>

    where <math|Z<around|(|t|)>> is the analytic signal.
  </theorem>

  <\proof>
    By definition:

    <\equation>
      <label|eq:envelope_proof>R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>=<around|\||X<around|(|t|)>+i*<wide|X|^><around|(|t|)>|\|>=<sqrt|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>
    </equation>

    This establishes that the envelope is the modulus of the pre-envelope
    process <math|Z<around|(|t|)>>.
  </proof>

  <\theorem>
    [Polar Representation of Complex Process]<label|thm:polar_representation>The
    analytic signal <math|Z<around|(|t|)>> admits the polar representation:

    <\equation>
      <label|eq:polar_rep>Z<around|(|t|)>=R<around|(|t|)>*e<rsup|i*\<Theta\><around|(|t|)>>
    </equation>

    where:

    <\enumerate>
      <item><math|R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>=<sqrt|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>>
      is the envelope

      <item><math|\<Theta\><around|(|t|)>=arctan
      <around*|(|<frac|<wide|X|^><around|(|t|)>|X<around|(|t|)>>|)>> is the
      instantaneous phase
    </enumerate>
  </theorem>

  <\proof>
    For any complex number <math|z=a+i*b>, the polar form is
    <math|z=<around|\||z|\|>*e<rsup|i*arg <around|(|z|)>>> where:

    <\equation>
      <label|eq:complex_modulus><around|\||z|\|>=<sqrt|a<rsup|2>+b<rsup|2>>
    </equation>

    <\equation>
      <label|eq:complex_argument>arg <around|(|z|)>=arctan <around|(|b/a|)>
    </equation>

    Applying this to <math|Z<around|(|t|)>=X<around|(|t|)>+i*<wide|X|^><around|(|t|)>>:

    <\equation>
      <label|eq:envelope_polar>R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>=<sqrt|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>
    </equation>

    <\equation>
      <label|eq:phase_polar>\<Theta\><around|(|t|)>=arg
      <around|(|Z<around|(|t|)>|)>=arctan
      <around*|(|<frac|<wide|X|^><around|(|t|)>|X<around|(|t|)>>|)>
    </equation>

    Therefore: <math|Z<around|(|t|)>=R<around|(|t|)>*e<rsup|i*\<Theta\><around|(|t|)>>>.
  </proof>

  <\theorem>
    [Instantaneous Frequency]<label|thm:instantaneous_frequency>The
    instantaneous frequency <math|\<omega\><around|(|t|)>> of the process
    <math|X<around|(|t|)>> is defined as:

    <\equation>
      <label|eq:instantaneous_frequency_def>\<omega\><around|(|t|)>=<frac|d*\<Theta\><around|(|t|)>|d*t>
    </equation>

    where <math|\<Theta\><around|(|t|)>> is the instantaneous phase from
    Theorem<nbsp><reference|thm:polar_representation>.
  </theorem>

  <\proof>
    By definition of instantaneous frequency as the time derivative of phase:

    <\equation>
      <label|eq:freq_derivative>\<omega\><around|(|t|)>=<frac|d|d*t><around*|[|arctan
      <around*|(|<frac|<wide|X|^><around|(|t|)>|X<around|(|t|)>>|)>|]>
    </equation>

    Using the chain rule:

    <\equation>
      <label|eq:freq_chain_rule>\<omega\><around|(|t|)>=<frac|1|1+<around*|(|<frac|<wide|X|^><around|(|t|)>|X<around|(|t|)>>|)><rsup|2>>\<cdot\><frac|d|d*t><around*|(|<frac|<wide|X|^><around|(|t|)>|X<around|(|t|)>>|)>
    </equation>

    <\equation>
      <label|eq:freq_quotient_rule>=<frac|X<rsup|2><around|(|t|)>|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>\<cdot\><frac|<wide|X|^><rprime|'><around|(|t|)>*X<around|(|t|)>-<wide|X|^><around|(|t|)>*X<rprime|'><around|(|t|)>|X<rsup|2><around|(|t|)>>
    </equation>

    <\equation>
      <label|eq:freq_final>=<frac|<wide|X|^><rprime|'><around|(|t|)>*X<around|(|t|)>-<wide|X|^><around|(|t|)>*X<rprime|'><around|(|t|)>|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>=<frac|<wide|X|^><rprime|'><around|(|t|)>*X<around|(|t|)>-<wide|X|^><around|(|t|)>*X<rprime|'><around|(|t|)>|R<rsup|2><around|(|t|)>>
    </equation>

    This expresses the instantaneous frequency in terms of the original
    process and its quadrature.
  </proof>

  <section|Spectral Inversion>

  <\corollary>
    [Spectral Recovery from Analytic Signal]<label|cor:spectral_recovery_analytic>The
    pre-envelope spectral measure can be recovered from the analytic signal
    by:

    <\equation>
      <label|eq:spectral_recovery_analytic>\<zeta\><around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>Z<around|(|t|)>*e<rsup|-i*\<lambda\>*t>*d*t
    </equation>
  </corollary>

  <\proof>
    This follows directly from the inverse Fourier transform applied to the
    complex exponential representation in
    Theorem<nbsp><reference|thm:analytic_signal>.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|5>>
    <associate|cor:spectral_recovery_analytic|<tuple|7|5>>
    <associate|eq:analytic_proof_step1|<tuple|12|2>>
    <associate|eq:analytic_proof_step2|<tuple|12|2>>
    <associate|eq:analytic_proof_step3|<tuple|13|2>>
    <associate|eq:analytic_signal_def|<tuple|9|2>>
    <associate|eq:complex_argument|<tuple|21|4>>
    <associate|eq:complex_exponential_rep|<tuple|11|2>>
    <associate|eq:complex_modulus|<tuple|20|4>>
    <associate|eq:envelope_def|<tuple|17|3>>
    <associate|eq:envelope_polar|<tuple|22|4>>
    <associate|eq:envelope_proof|<tuple|18|3>>
    <associate|eq:freq_chain_rule|<tuple|26|5>>
    <associate|eq:freq_derivative|<tuple|25|5>>
    <associate|eq:freq_final|<tuple|28|5>>
    <associate|eq:freq_quotient_rule|<tuple|27|5>>
    <associate|eq:instantaneous_frequency_def|<tuple|24|4>>
    <associate|eq:orthogonality_cos|<tuple|6|1>>
    <associate|eq:orthogonality_sin_cos|<tuple|7|1>>
    <associate|eq:phase_polar|<tuple|23|4>>
    <associate|eq:polar_rep|<tuple|19|4>>
    <associate|eq:pre_envelope_mean|<tuple|15|3>>
    <associate|eq:pre_envelope_variance|<tuple|2|3>>
    <associate|eq:quadrature_process|<tuple|10|2>>
    <associate|eq:spectral_recovery_analytic|<tuple|29|5>>
    <associate|eq:spectral_rep_real|<tuple|1|1>>
    <associate|eq:u_proof_final|<tuple|8|2>>
    <associate|eq:u_proof_step1|<tuple|4|1>>
    <associate|eq:u_proof_step2|<tuple|5|1>>
    <associate|eq:u_recovery|<tuple|2|1>>
    <associate|eq:v_recovery|<tuple|3|1>>
    <associate|thm:analytic_signal|<tuple|2|2>>
    <associate|thm:envelope_absolute_value|<tuple|4|3>>
    <associate|thm:instantaneous_frequency|<tuple|6|4>>
    <associate|thm:polar_representation|<tuple|5|4>>
    <associate|thm:pre_envelope_properties|<tuple|3|3>>
    <associate|thm:spectral_recovery|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Spectral
      Recovery Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Envelope
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      Inversion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>