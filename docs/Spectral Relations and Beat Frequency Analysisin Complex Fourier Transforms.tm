<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Relations and Beat Frequency
  Analysis<next-line>in Complex Fourier Transforms>|<doc-author|<author-data|<author-name|Analysis
  of Formulas 7.5.10, 7.5.11>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Fundamental
    Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Original
    Spectral Relations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Trigonometric
    Expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Sum-to-Product
    Transformations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Beat
    Frequency and Carrier Frequency Analysis>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Physical
    Interpretation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Fundamental Definitions>

  <\definition>
    [Beat Frequency] When two waves of slightly different frequencies
    <math|f<rsub|1>> and <math|f<rsub|2>> interfere, they produce a periodic
    variation in amplitude known as beats. The beat frequency is defined as:

    <\equation>
      f<rsub|beat>=<around|\||f<rsub|2>-f<rsub|1>|\|>
    </equation>

    This represents the number of amplitude modulations (beats) per unit time
    observed in the interference pattern.
  </definition>

  <\definition>
    [Carrier Frequency] In modulated wave systems, the carrier frequency is
    the base frequency of the unmodulated wave that serves as the medium for
    transmitting information. For two interfering waves with frequencies
    <math|f<rsub|1>> and <math|f<rsub|2>>, the carrier frequency is defined
    as:

    <\equation>
      f<rsub|carrier>=<frac|f<rsub|1>+f<rsub|2>|2>
    </equation>

    This represents the average frequency around which the beat modulation
    occurs.
  </definition>

  <section|Original Spectral Relations>

  From the theory of Fourier transforms for real-valued functions, we have
  the following fundamental relations:

  <\align>
    <tformat|<table|<row|<cell|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>|-i*t>*\<tau\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|\<xi\><around|(|\<lambda\><rsub|2>|)>-\<xi\><around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>|-i*t>*\<xi\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>>>
  </align>

  These relations differ only by the functions being transformed:
  <math|\<tau\><around|(|t|)>> in (7.5.10) and <math|\<xi\><around|(|t|)>> in
  (7.5.11).

  <section|Trigonometric Expansions>

  Using Euler's formula <math|e<rsup|-i*\<lambda\>*t>=cos
  <around|(|\<lambda\>*t|)>-i*sin <around|(|\<lambda\>*t|)>>, we can expand
  the complex exponentials.

  <\lemma>
    [Trigonometric Form of Complex Exponential Difference] The difference of
    complex exponentials can be written as:

    <\equation>
      e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>=<around|[|cos
      <around|(|\<lambda\><rsub|2>*t|)>-cos
      <around|(|\<lambda\><rsub|1>*t|)>|]>-i*<around|[|sin
      <around|(|\<lambda\><rsub|2>*t|)>-sin
      <around|(|\<lambda\><rsub|1>*t|)>|]>
    </equation>
  </lemma>

  <\proof>
    Direct application of Euler's formula:

    <\align>
      <tformat|<table|<row|<cell|e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>>|<cell|=<around|[|cos
      <around|(|\<lambda\><rsub|2>*t|)>-i*sin
      <around|(|\<lambda\><rsub|2>*t|)>|]>-<around|[|cos
      <around|(|\<lambda\><rsub|1>*t|)>-i*sin
      <around|(|\<lambda\><rsub|1>*t|)>|]><eq-number>>>|<row|<cell|>|<cell|=<around|[|cos
      <around|(|\<lambda\><rsub|2>*t|)>-cos
      <around|(|\<lambda\><rsub|1>*t|)>|]>-i*<around|[|sin
      <around|(|\<lambda\><rsub|2>*t|)>-sin
      <around|(|\<lambda\><rsub|1>*t|)>|]><eq-number>>>>>
    </align>
  </proof>

  <section|Sum-to-Product Transformations>

  The trigonometric differences can be simplified using sum-to-product
  identities.

  <\lemma>
    [Sum-to-Product Identities] For any real numbers <math|A> and <math|B>:

    <\align>
      <tformat|<table|<row|<cell|cos A-cos B>|<cell|=-2*sin
      <around*|(|<frac|A+B|2>|)>*sin <around*|(|<frac|A-B|2>|)><eq-number>>>|<row|<cell|sin
      A-sin B>|<cell|=2*cos <around*|(|<frac|A+B|2>|)>*sin
      <around*|(|<frac|A-B|2>|)><eq-number>>>>>
    </align>
  </lemma>

  <\proof>
    Using the angle addition formulas:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|cos A>|<cell|=cos
      <around*|(|<frac|A+B|2>+<frac|A-B|2>|)>>>|<row|<cell|>|<cell|=cos
      <around*|(|<frac|A+B|2>|)>*cos <around*|(|<frac|A-B|2>|)>-sin
      <around*|(|<frac|A+B|2>|)>*sin <around*|(|<frac|A-B|2>|)>>>>>>
    </equation>

    and

    <\equation>
      <tabular|<tformat|<table|<row|<cell|cos B>|<cell|=cos
      <around*|(|<frac|A+B|2>-<frac|A-B|2>|)>>>|<row|<cell|>|<cell|=cos
      <around*|(|<frac|A+B|2>|)>*cos <around*|(|<frac|A-B|2>|)>+sin
      <around*|(|<frac|A+B|2>|)>*sin <around*|(|<frac|A-B|2>|)>>>>>>
    </equation>

    Subtracting:\ 

    <\equation>
      cos A-cos B=-2*sin <around*|(|<frac|A+B|2>|)>*sin
      <around*|(|<frac|A-B|2>|)>
    </equation>

    Similarly for sine:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|sin A>|<cell|=sin
      <around*|(|<frac|A+B|2>+<frac|A-B|2>|)>>>|<row|<cell|>|<cell|sin
      <around*|(|<frac|A+B|2>|)>*cos <around*|(|<frac|A-B|2>|)>+cos
      <around*|(|<frac|A+B|2>|)>*sin <around*|(|<frac|A-B|2>|)>>>>>>
    </equation>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|sin B>|<cell|=sin
      <around*|(|<frac|A+B|2>-<frac|A-B|2>|)>>>|<row|<cell|>|<cell|sin
      <around*|(|<frac|A+B|2>|)>*cos <around*|(|<frac|A-B|2>|)>-cos
      <around*|(|<frac|A+B|2>|)>*sin <around*|(|<frac|A-B|2>|)>>>>>>
    </equation>

    Subtracting: <math|>

    <\equation>
      sin A-sin B=2*cos <around*|(|<frac|A+B|2>|)>*sin
      <around*|(|<frac|A-B|2>|)>
    </equation>

    \;
  </proof>

  <section|Beat Frequency and Carrier Frequency Analysis>

  <\theorem>
    [Beat Frequency Decomposition] The complex exponential difference can be
    expressed in terms of beat and carrier frequencies:

    <\equation>
      e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>=-2*i*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>
    </equation>

    where:

    <\itemize>
      <item>The beat angular frequency is\ 

      <\equation>
        \<omega\><rsub|beat>=<frac|\<lambda\><rsub|2>-\<lambda\><rsub|1>|2>
      </equation>

      <math|> (corresponding to beat frequency
      <math|f<rsub|beat>=<frac|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>|4*\<pi\>>>)

      <item>The carrier angular frequency is\ 

      <\equation>
        \<omega\><rsub|carrier>=<frac|\<lambda\><rsub|2>+\<lambda\><rsub|1>|2>
      </equation>

      \ (corresponding to carrier frequency
      <math|f<rsub|carrier>=<frac|\<lambda\><rsub|2>+\<lambda\><rsub|1>|4*\<pi\>>>)
    </itemize>
  </theorem>

  <\proof>
    Applying the sum-to-product identities to the trigonometric form:

    <\align>
      <tformat|<table|<row|<cell|cos <around|(|\<lambda\><rsub|2>*t|)>-cos
      <around|(|\<lambda\><rsub|1>*t|)>>|<cell|=-2*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>|)>*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)><eq-number>>>|<row|<cell|sin
      <around|(|\<lambda\><rsub|2>*t|)>-sin
      <around|(|\<lambda\><rsub|1>*t|)>>|<cell|=2*cos
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>|)>*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)><eq-number>>>>>
    </align>

    Using the identity

    <\equation>
      <tabular|<tformat|<table|<row|<cell|sin \<theta\>+i*cos
      \<theta\>>|<cell|=i*<around|(|cos \<theta\>-i*sin
      \<theta\>|)>>>|<row|<cell|>|<cell|=i*e<rsup|-i*\<theta\>>>>>>>
    </equation>

    it is demonstrated that\ 

    <\equation>
      sin <around*|(|<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>|)>+i*cos
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>|)>=i*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>
    </equation>

    Therefore:

    <\equation>
      e<rsup|-i*\<lambda\><rsub|2>*t>-e<rsup|-i*\<lambda\><rsub|1>*t>=-2*i*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>
    </equation>

    The beat frequency arises from the <math|sin
    <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>>
    term, which modulates the amplitude with angular frequency
    <math|<frac|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>|2>>,
    corresponding to beat frequency <math|>

    <\equation>
      f<rsub|beat>=<frac|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>|4*\<pi\>>
    </equation>

    The carrier frequency comes from the <math|e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>>
    term, which oscillates with angular frequency
    <math|<frac|\<lambda\><rsub|2>+\<lambda\><rsub|1>|2>>, corresponding to
    carrier frequency

    <\equation>
      f<rsub|carrier>=<frac|\<lambda\><rsub|2>+\<lambda\><rsub|1>|4*\<pi\>>
    </equation>

    \;
  </proof>

  <\corollary>
    [Beat Frequency Interpretation of Spectral Relations] The spectral
    relations (7.5.10) and (7.5.11) can be rewritten as:

    <\align>
      <tformat|<table|<row|<cell|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|-i|\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>|t>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>*\<tau\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|\<xi\><around|(|\<lambda\><rsub|2>|)>-\<xi\><around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|-i|\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>|t>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>*\<xi\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    This form explicitly shows how the spectral difference depends on:

    <\itemize>
      <item>The beat envelope function <math|<frac|sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>|t>>

      <item>The carrier oscillation <math|e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>>
    </itemize>
  </corollary>

  <\proof>
    Substituting the beat frequency decomposition into the original formulas:

    <\align>
      <tformat|<table|<row|<cell|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|-2*i*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>|-i*t>*\<tau\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|2*sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>|t>*\<tau\><around|(|t|)>*<space|0.17em>d*t\<cdot\><around|(|-i|)><eq-number>>>|<row|<cell|>|<cell|=<frac|-i|\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <big|int><rsub|-T><rsup|T><frac|sin
      <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>|t>*e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>*\<tau\><around|(|t|)>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    The same derivation applies to (7.5.11).
  </proof>

  <section|Physical Interpretation>

  The beat frequency decomposition reveals crucial physical insights about
  the spectral relations:

  <\itemize>
    <item><with|font-series|bold|Beat Envelope>: The factor <math|sin
    <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>>
    creates an amplitude modulation envelope with beat frequency <math|>

    <\equation>
      f<rsub|beat>=<frac|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>|4*\<pi\>>
    </equation>

    . This envelope determines how rapidly the interference pattern
    oscillates between constructive and destructive interference.

    <item><with|font-series|bold|Carrier Wave>: The factor
    <math|e<rsup|-i*<frac|<around|(|\<lambda\><rsub|2>+\<lambda\><rsub|1>|)>*t|2>>>
    represents the carrier wave oscillating at the average frequency <math|>

    <\equation>
      f<rsub|carrier>=<frac|\<lambda\><rsub|2>+\<lambda\><rsub|1>|4*\<pi\>>
    </equation>

    . This carrier provides the fundamental oscillation that is modulated by
    the beat envelope.

    <item><with|font-series|bold|Spectral Resolution>: The <math|<frac|sin
    <around*|(|<frac|<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t|2>|)>|t>>
    term in the integral acts as a frequency resolution kernel. As
    <math|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>\<to\>0>, this
    kernel approaches a delta function, providing perfect frequency
    resolution.

    <item><with|font-series|bold|Time-Frequency Uncertainty>: The beat
    structure demonstrates the fundamental time-frequency uncertainty
    principle in Fourier analysis - better frequency resolution (smaller
    <math|<around|\||\<lambda\><rsub|2>-\<lambda\><rsub|1>|\|>>) requires
    longer integration times <math|T>.
  </itemize>

  This decomposition is particularly valuable in signal processing,
  spectroscopy, and quantum mechanics where understanding the interference
  between close frequencies is essential for proper interpretation of
  measured spectra.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|5|3>>
    <associate|auto-6|<tuple|6|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Fundamental
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Original
      Spectral Relations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Trigonometric
      Expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Sum-to-Product
      Transformations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Beat
      Frequency and Carrier Frequency Analysis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Physical
      Interpretation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>