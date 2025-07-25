<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Hilbert Transforms of BandPass
  Functions>|<doc-author|<author-data|<author-name|Urkowitz, H.>>>>

  <abstract-data|<abstract|This paper is a guess at what \ ``Hilbert
  transforms of band-pass functions.'' <with|font-shape|italic|Proc. IRE>
  50.10 (1962): 2143. might contain if it were available based on the
  references to it made by papers which cite it.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Background
    and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminary
    Lemmas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Main
    Theorems and Proofs> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Background and Definitions>

  <\definition>
    [Hilbert Transform] For a real\Uvalued <math|x<around|(|t|)>> with
    Fourier transform <math|X<around|(|\<omega\>|)>>, its Hilbert transform
    is

    <\equation>
      <wide|x|^><around|(|t|)>=\<cal-H\><around|[|x|]><around|(|t|)>=<frac|1|\<pi\>>*<space|0.17em><with|math-font-family|rm|P.V.>*<space|-0.17em><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x<around|(|\<tau\>|)>|t-\<tau\>>*<space|0.17em>d*\<tau\>
    </equation>

    equivalently in the frequency domain,

    <\equation>
      \<cal-F\><around|{|\<cal-H\><around|[|x|]>|}><around|(|\<omega\>|)>=-j<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>X<around|(|\<omega\>|)>
    </equation>
  </definition>

  <\definition>
    [Analytic Signal] Given real <math|x<around|(|t|)>>, its analytic signal
    is

    <\equation>
      z<around|(|t|)>=x<around|(|t|)>+j*<space|0.17em><wide|x|^><around|(|t|)>
    </equation>

    whose Fourier transform is onesided:

    <\equation>
      Z<around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<space|0.17em>X<around|(|\<omega\>|)><space|1em>U<around|(|\<omega\>|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|0,>|<cell|\<omega\>\<less\>0>>>>>
    </equation>
  </definition>

  <section|Preliminary Lemmas>

  <\lemma>
    [Hilbert Transform of a Complex Exponential]<label|lem:exp>For any real
    constant <math|\<omega\><rsub|0>\<neq\>0>,

    <\equation>
      \<cal-H\><around*|[|e<rsup|j*\<omega\><rsub|0>*t>|]>=-<space|0.17em>j<space|0.17em><math-up|sgn><around|(|\<omega\><rsub|0>|)>*<space|0.17em>e<rsup|j*\<omega\><rsub|0>*t>
    </equation>

    In particular, if <math|\<omega\><rsub|0>\<gtr\>0>,
    <math|\<cal-H\><around|[|e<rsup|j*\<omega\><rsub|0>*t>|]>=-j*<space|0.17em>e<rsup|j*\<omega\><rsub|0>*t>>
  </lemma>

  <\proof>
    The Fourier transform of <math|e<rsup|j*\<omega\><rsub|0>*t>> is
    <math|2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>>.
    Thus

    <\equation>
      \<cal-F\><around|{|\<cal-H\><around|[|e<rsup|j*\<omega\><rsub|0>*t>|]>|}><around|(|\<omega\>|)>=-j<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>=-j<space|0.17em><math-up|sgn><around|(|\<omega\><rsub|0>|)>*<space|0.17em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<omega\><rsub|0>|)>
    </equation>

    and inverting yields the stated result.
  </proof>

  <section|Main Theorems and Proofs>

  <\theorem>
    [Bedrosian's Theorem]<label|thm:bedrosian>Let <math|f> and <math|g> be
    realvalued, absolutely integrable functions. Suppose

    <\equation>
      <math-up|supp><space|0.17em>\<cal-F\><around|{|f|}>\<subset\><around|[|-\<Omega\>,\<Omega\>|\<nobracket\>><space|1em><math-up|supp><space|0.17em>\<cal-F\><around|{|g|}>\<subset\>\<bbb-R\>\<setminus\><around|(|-\<Omega\>,\<Omega\>|)>
    </equation>

    Then

    <\equation>
      \<cal-H\>*<around|[|f<around|(|t|)>*<space|0.17em>g<around|(|t|)>|]>=f<around|(|t|)>*<space|0.17em>\<cal-H\><around|[|g<around|(|t|)>|\<nobracket\>>
    </equation>
  </theorem>

  <\proof>
    Write <math|F<around|(|\<omega\>|)>=\<cal-F\><around|{|f|}><around|(|\<omega\>|)>>,
    <math|G<around|(|\<omega\>|)>=\<cal-F\><around|{|g|}><around|(|\<omega\>|)>>.
    Then

    <\equation>
      \<cal-F\>*<around|{|f*g|}><around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<lambda\>|)>*<space|0.17em>G*<around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>
    </equation>

    Therefore

    <\equation>
      \<cal-F\>*<around|{|\<cal-H\>*<around|[|f*g|]>|}><around|(|\<omega\>|)>=-j<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>\<cal-F\>*<around|{|f*g|}><around|(|\<omega\>|)>=-<frac|j|2*\<pi\>>*<big|int>F<around|(|\<lambda\>|)><space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>G*<around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>d*
    </equation>

    But for every <math|\<lambda\>\<in\><around|[|-\<Omega\>,\<Omega\>|]>>
    and every <math|\<omega\>> for which <math|G*<around|(|\<omega\>-\<lambda\>|)>\<neq\>0>,
    we have <math|\<omega\>-\<lambda\>\<nin\><around|(|-\<Omega\>,\<Omega\>|)>>
    by hypothesis, hence

    <\equation>
      <math-up|sgn><around|(|\<omega\>|)>=<math-up|sgn><around|(|\<omega\>-\<lambda\>|)>
    </equation>

    Thus

    <\equation>
      <math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>G*<around|(|\<omega\>-\<lambda\>|)>=<math-up|sgn><around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>G*<around|(|\<omega\>-\<lambda\>|)>
    </equation>

    and so

    <\equation>
      \<cal-F\>*<around|{|\<cal-H\>*<around|[|f*g|]>|}><around|(|\<omega\>|)>=-<frac|j|2*\<pi\>>*<big|int>F<around|(|\<lambda\>|)><space|0.17em><math-up|sgn><around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>G*<around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>=\<cal-F\>*<around|{|f*<space|0.17em>\<cal-H\><around|[|g|]>|}><around|(|\<omega\>|)>
    </equation>

    Inverting the Fourier transform gives the result.
  </proof>

  <\theorem>
    [Hilbert Transform of a Narrowband Signal]<label|thm:bandpass>Let

    <\equation>
      s<around|(|t|)>=A<around|(|t|)>*cos
      <around*|(|\<omega\><rsub|c>*t+\<phi\><around|(|t|)>|\<nobracket\>>
    </equation>

    where <math|A<around|(|t|)>> and <math|\<phi\><around|(|t|)>> vary slowly
    enough that the Fourier support of <math|u<around|(|t|)>=A<around|(|t|)>*e<rsup|j*\<phi\><around|(|t|)>>>
    lies in <math|<around|\||\<omega\>|\|>\<less\>\<Omega\>> with
    <math|\<Omega\>\<less\>\<omega\><rsub|c>>. Then

    <\equation>
      \<cal-H\><around|[|s|]><around|(|t|)>=A<around|(|t|)>*<space|0.17em>sin
      <around*|(|\<omega\><rsub|c>*t+\<phi\><around|(|t|)>|\<nobracket\>>
    </equation>

    Equivalently, the analytic signal is

    <\equation>
      z<around|(|t|)>=s<around|(|t|)>+j*<space|0.17em>\<cal-H\><around|[|s|]><around|(|t|)>=A<around|(|t|)>*<space|0.17em>e<rsup|j*<around|(|\<omega\><rsub|c>*t+\<phi\><around|(|t|)>|)>>
    </equation>
  </theorem>

  <\proof>
    Write

    <\equation>
      s<around|(|t|)>=\<Re\>*<around|{|u<around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>|}><space|1em>u<around|(|t|)>=A<around|(|t|)>*e<rsup|j*\<phi\><around|(|t|)>>
    </equation>

    Since <math|<math-up|supp><space|0.17em>\<cal-F\><around|{|u|}>\<subset\><around|[|-\<Omega\>,\<Omega\>|]>>
    and <math|\<cal-F\><around|{|e<rsup|j*\<omega\><rsub|c>*t>|}>=2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<omega\><rsub|c>|)>>
    lives at <math|\<omega\>=\<omega\><rsub|c>\<gtr\>\<Omega\>>,
    Theorem<nbsp><reference|thm:bedrosian> applies:

    <\equation>
      \<cal-H\>*<around|[|u<around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>|]>=u<around|(|t|)>*<space|0.17em>\<cal-H\><around*|[|e<rsup|j*\<omega\><rsub|c>*t>|]>
    </equation>

    By Lemma<nbsp><reference|lem:exp> with
    <math|\<omega\><rsub|0>=\<omega\><rsub|c>\<gtr\>0>,
    <math|\<cal-H\><around|[|e<rsup|j*\<omega\><rsub|c>*t>|]>=-j*<space|0.17em>e<rsup|j*\<omega\><rsub|c>*t>>.
    Hence

    <\equation>
      \<cal-H\>*<around|[|u<around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>|]>=-<space|0.17em>j*<space|0.17em>u<around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>
    </equation>

    and taking real parts,

    <\equation>
      \<cal-H\>*<around|[|\<Re\>*<around|{|u*e<rsup|j*\<omega\><rsub|c>*t>|}>|]>=\<Re\>*<around*|{|-j*<space|0.17em>u*e<rsup|j*\<omega\><rsub|c>*t>|}>=\<Im\>*<around|{|u*e<rsup|j*\<omega\><rsub|c>*t>|}>=A<around|(|t|)>*sin
      <around*|(|\<omega\><rsub|c>*t+\<phi\><around|(|t|)>|)>
    </equation>
  </proof>

  <\theorem>
    [Spectrum of the Analytic Signal]<label|thm:spectrum>If
    <math|x<around|(|t|)>\<leftrightarrow\>X<around|(|\<omega\>|)>>, then its
    analytic signal <math|z<around|(|t|)>=x<around|(|t|)>+j*\<cal-H\><around|[|x<around|(|t|)>|]>>
    has transform

    <\equation*>
      Z<around|(|\<omega\>|)>=X<around|(|\<omega\>|)>+j*<around*|(|-j<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>X<around|(|\<omega\>|)>|)>=<around*|(|1+<math-up|sgn><around|(|\<omega\>|)>|)>*X<around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<space|0.17em>X<around|(|\<omega\>|)>.
    </equation*>
  </theorem>

  <\proof>
    Immediate from the frequencydomain definition of <math|\<cal-H\>>.
  </proof>

  <\theorem>
    [Envelope Detection]<label|thm:envelope>For any real
    <math|x<around|(|t|)>>,

    <\equation>
      <around|\||<space|0.17em>x<around|(|t|)>+j*<space|0.17em>\<cal-H\><around|[|x<around|(|t|)>|]><space|0.17em>|\|>=<sqrt|x<rsup|2><around|(|t|)>+\<cal-H\><around|[|x|]><rsup|2><around|(|t|)>>
    </equation>

    is exactly the instantaneous envelope of the narrowband signal.
  </theorem>

  <\proof>
    Write <math|z<around|(|t|)>=x<around|(|t|)>+j*<wide|x|^><around|(|t|)>=R<around|(|t|)>*e<rsup|j*\<theta\><around|(|t|)>>>,
    then <math|<around|\||z<around|(|t|)>|\|>=R<around|(|t|)>=<sqrt|x<rsup|2>+<wide|x|^><rsup|2>><space|0.17em>>
    by definition of magnitude in the complex plane.
  </proof>

  <\theorem>
    [SingleSideband (SSB) Modulation]<label|thm:ssb>Given a real baseband
    <math|m<around|(|t|)>>, the standard Hilberttransform SSB transmitter
    produces

    <\equation>
      s<rsub|<math-up|SSB>><around|(|t|)>=m<around|(|t|)>*cos
      <around|(|\<omega\><rsub|c>*t|)>+\<cal-H\><around|[|m|]><around|(|t|)>*<space|0.17em>sin
      <around|(|\<omega\><rsub|c>*t|)>
    </equation>

    which has only the upper sideband.
  </theorem>

  <\proof>
    Form the analytic signal <math|m<rsub|a><around|(|t|)>=m<around|(|t|)>+j*\<cal-H\><around|[|m|]><around|(|t|)>\<leftrightarrow\>2*U<around|(|\<omega\>|)>*M<around|(|\<omega\>|)>>,
    then modulate:

    <\equation>
      m<rsub|a><around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>\<leftrightarrow\>2*M*<around|(|\<omega\>-\<omega\><rsub|c>|)>*U*<around|(|\<omega\>-\<omega\><rsub|c>|)>
    </equation>

    Taking the real part gives exactly

    <\equation>
      \<Re\>*<around|{|m<rsub|a><around|(|t|)>*e<rsup|j*\<omega\><rsub|c>*t>|}>=m<around|(|t|)>*cos
      \<omega\><rsub|c>*t-\<cal-H\><around|[|m|]><around|(|t|)>*sin
      \<omega\><rsub|c>*t
    </equation>

    which is the lowersideband suppressed version. A sign flip in the sine
    term (or using <math|e<rsup|-j*\<omega\><rsub|c>*t>>) yields the upper SB
    alone.
  </proof>

  <section|Conclusion>

  Full proofs of the central results on Hilbert transforms of bandpass
  functions have been given, Bedrosian's theorem, spectrum of the analytic
  signal, envelope detection and the SSB construction, completing the
  rigorous theory often attributed to Urkowitz (Proc. IRE, 1962).
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|lem:exp|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:bandpass|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:bedrosian|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:envelope|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:spectrum|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:ssb|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background
      and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminary
      Lemmas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Theorems and Proofs> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>