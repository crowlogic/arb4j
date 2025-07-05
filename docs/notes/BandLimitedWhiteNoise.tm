<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Band-Limited White Noise: Mathematical Formulation and
  Properties>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Fundamental
    Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Spectral
    and Covariance Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Construction
    and Filtering Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Spectral
    Containment Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Fundamental Definitions>

  <\definition>
    [Band-Limited White Noise]<label|def:blwn>A zero-mean Gaussian stochastic
    process <math|<around|{|W<rsub|B><around|(|t|)>,t\<in\>\<bbb-R\>|}>> is
    called band-limited white noise with bandwidth <math|B\<gtr\>0> if its
    power spectral density is given by

    <\equation>
      S<rsub|W<rsub|B>><around|(|\<omega\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|N<rsub|0>|2>,>|<cell|<around|\||\<omega\>|\|>\<leq\>B>>|<row|<cell|0,>|<cell|<around|\||\<omega\>|\|>\<gtr\>B>>>>>|\<nobracket\>><label|eq:psd>
    </equation>

    where <math|N<rsub|0>\<gtr\>0> is the spectral level parameter.
  </definition>

  <\definition>
    [Sinc Function]<label|def:sinc>The sinc function is defined as

    <\equation>
      <math-up|sinc><around|(|x|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|sin
      <around|(|x|)>|x>,>|<cell|x\<neq\>0>>|<row|<cell|1,>|<cell|x=0>>>>>|\<nobracket\>><label|eq:sinc>
    </equation>
  </definition>

  <section|Spectral and Covariance Properties>

  <\theorem>
    [Autocovariance Function]<label|thm:autocovariance>The autocovariance
    function of band-limited white noise <math|W<rsub|B><around|(|t|)>> is
    given by

    <\equation>
      R<rsub|W<rsub|B>><around|(|\<tau\>|)>=<frac|N<rsub|0>*B|2*\<pi\>><math-up|sinc><around|(|B*\<tau\>|)><label|eq:autocovariance>
    </equation>
  </theorem>

  <\proof>
    By the Wiener-Khintchine theorem, the autocovariance function is the
    inverse Fourier transform of the power spectral density:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|W<rsub|B>><around|(|\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|W<rsub|B>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-B><rsup|B><frac|N<rsub|0>|2>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>|4*\<pi\>>*<big|int><rsub|-B><rsup|B>e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><eq-number>>>>>
    </align>

    For <math|\<tau\>\<neq\>0>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|W<rsub|B>><around|(|\<tau\>|)>>|<cell|=<frac|N<rsub|0>|4*\<pi\>><around*|[|<frac|e<rsup|i*\<omega\>*\<tau\>>|i*\<tau\>>|]><rsub|-B><rsup|B><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>|4*\<pi\>*i*\<tau\>>*<around|(|e<rsup|i*B*\<tau\>>-e<rsup|-i*B*\<tau\>>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>|4*\<pi\>*i*\<tau\>>\<cdot\>2*i*sin
      <around|(|B*\<tau\>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>|2*\<pi\>*\<tau\>>*sin
      <around|(|B*\<tau\>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>*B|2*\<pi\>>*<frac|sin
      <around|(|B*\<tau\>|)>|B*\<tau\>><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>*B|2*\<pi\>><math-up|sinc><around|(|B*\<tau\>|)><eq-number>>>>>
    </align>

    For <math|\<tau\>=0>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|W<rsub|B>><around|(|0|)>>|<cell|=<frac|N<rsub|0>|4*\<pi\>>*<big|int><rsub|-B><rsup|B>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>|4*\<pi\>>\<cdot\>2*B<eq-number>>>|<row|<cell|>|<cell|=<frac|N<rsub|0>*B|2*\<pi\>><eq-number>>>>>
    </align>

    Since <math|<math-up|sinc><around|(|0|)>=1>, we have
    <math|R<rsub|W<rsub|B>><around|(|0|)>=<frac|N<rsub|0>*B|2*\<pi\>><math-up|sinc><around|(|0|)>=<frac|N<rsub|0>*B|2*\<pi\>>>.

    Therefore, equation <eqref|eq:autocovariance> holds for all
    <math|\<tau\>\<in\>\<bbb-R\>>.
  </proof>

  <\theorem>
    [Variance and Power]<label|thm:variance>The variance of band-limited
    white noise <math|W<rsub|B><around|(|t|)>> is

    <\equation>
      <text|Var><around|[|W<rsub|B><around|(|t|)>|]>=R<rsub|W<rsub|B>><around|(|0|)>=<frac|N<rsub|0>*B|2*\<pi\>><label|eq:variance>
    </equation>
  </theorem>

  <\proof>
    This follows directly from Theorem <reference|thm:autocovariance> by
    setting <math|\<tau\>=0>.
  </proof>

  <section|Construction and Filtering Properties>

  <\theorem>
    [Filter Construction]<label|thm:filter>Let <math|W<around|(|t|)>> be
    ideal white noise with power spectral density
    <math|S<rsub|W><around|(|\<omega\>|)>=N<rsub|0>/2> for all
    <math|\<omega\>\<in\>\<bbb-R\>>. Let <math|H<around|(|\<omega\>|)>> be
    the frequency response of an ideal low-pass filter:

    <\equation>
      H<around|(|\<omega\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|<around|\||\<omega\>|\|>\<leq\>B>>|<row|<cell|0,>|<cell|<around|\||\<omega\>|\|>\<gtr\>B>>>>>|\<nobracket\>><label|eq:filter>
    </equation>

    Then the output process <math|Y<around|(|t|)>=<around|(|H\<ast\>W|)><around|(|t|)>>
    is band-limited white noise with bandwidth <math|B>.
  </theorem>

  <\proof>
    The power spectral density of the output process is given by

    <\align>
      <tformat|<table|<row|<cell|S<rsub|Y><around|(|\<omega\>|)>>|<cell|=<around|\||H<around|(|\<omega\>|)>|\|><rsup|2>*S<rsub|W><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around|\||H<around|(|\<omega\>|)>|\|><rsup|2><frac|N<rsub|0>|2><eq-number>>>>>
    </align>

    For <math|<around|\||\<omega\>|\|>\<leq\>B>:
    <math|H<around|(|\<omega\>|)>=1>, so <math|S<rsub|Y><around|(|\<omega\>|)>=<frac|N<rsub|0>|2>>.

    For <math|<around|\||\<omega\>|\|>\<gtr\>B>:
    <math|H<around|(|\<omega\>|)>=0>, so <math|S<rsub|Y><around|(|\<omega\>|)>=0>.

    Therefore:

    <\equation>
      S<rsub|Y><around|(|\<omega\>|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|N<rsub|0>|2>,>|<cell|<around|\||\<omega\>|\|>\<leq\>B>>|<row|<cell|0,>|<cell|<around|\||\<omega\>|\|>\<gtr\>B>>>>>|\<nobracket\>>
    </equation>

    This matches the definition of band-limited white noise in Definition
    <reference|def:blwn>.
  </proof>

  <\theorem>
    [Impulse Response]<label|thm:impulse>The impulse response of the ideal
    low-pass filter in Theorem <reference|thm:filter> is

    <\equation>
      h<around|(|t|)>=<frac|B|\<pi\>><math-up|sinc><around|(|B*t|)><label|eq:impulse>
    </equation>
  </theorem>

  <\proof>
    The impulse response is the inverse Fourier transform of the frequency
    response:

    <\align>
      <tformat|<table|<row|<cell|h<around|(|t|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-B><rsup|B>e<rsup|i*\<omega\>*t>*d*\<omega\><eq-number>>>>>
    </align>

    For <math|t\<neq\>0>:

    <\align>
      <tformat|<table|<row|<cell|h<around|(|t|)>>|<cell|=<frac|1|2*\<pi\>><around*|[|<frac|e<rsup|i*\<omega\>*t>|i*t>|]><rsub|-B><rsup|B><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>*i*t>*<around|(|e<rsup|i*B*t>-e<rsup|-i*B*t>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>*i*t>\<cdot\>2*i*sin
      <around|(|B*t|)><eq-number>>>|<row|<cell|>|<cell|=<frac|sin
      <around|(|B*t|)>|\<pi\>*t><eq-number>>>|<row|<cell|>|<cell|=<frac|B|\<pi\>>*<frac|sin
      <around|(|B*t|)>|B*t><eq-number>>>|<row|<cell|>|<cell|=<frac|B|\<pi\>><math-up|sinc><around|(|B*t|)><eq-number>>>>>
    </align>

    For <math|t=0>:

    <\align>
      <tformat|<table|<row|<cell|h<around|(|0|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-B><rsup|B>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>\<cdot\>2*B<eq-number>>>|<row|<cell|>|<cell|=<frac|B|\<pi\>><eq-number>>>>>
    </align>

    Since <math|<math-up|sinc><around|(|0|)>=1>, we have
    <math|h<around|(|0|)>=<frac|B|\<pi\>><math-up|sinc><around|(|0|)>=<frac|B|\<pi\>>>.

    Therefore, equation <eqref|eq:impulse> holds for all
    <math|t\<in\>\<bbb-R\>>.
  </proof>

  <section|Spectral Containment Properties>

  <\theorem>
    [Spectral Support]<label|thm:support>The band-limited white noise process
    <math|W<rsub|B><around|(|t|)>> has spectral support contained in the
    interval <math|<around|[|-B,B|]>>.
  </theorem>

  <\proof>
    By Definition <reference|def:blwn>, the power spectral density
    <math|S<rsub|W<rsub|B>><around|(|\<omega\>|)>=0> for
    <math|<around|\||\<omega\>|\|>\<gtr\>B>. Since the power spectral density
    completely characterizes the second-order properties of a Gaussian
    process, all spectral content is contained within
    <math|<around|[|-B,B|]>>.
  </proof>

  <\corollary>
    [Sampling Theorem Applicability]<label|cor:sampling>The band-limited
    white noise process <math|W<rsub|B><around|(|t|)>> satisfies the
    conditions for the sampling theorem with Nyquist rate <math|2*B>.
  </corollary>

  <\proof>
    This follows immediately from Theorem <reference|thm:support> and the
    classical sampling theorem for band-limited signals.
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|3|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-4|<tuple|4|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|cor:sampling|<tuple|8|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|def:blwn|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|def:sinc|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:autocovariance|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:filter|<tuple|17|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:impulse|<tuple|21|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:psd|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:sinc|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:variance|<tuple|16|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:autocovariance|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:filter|<tuple|5|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:impulse|<tuple|6|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:support|<tuple|7|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:variance|<tuple|4|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Fundamental
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      and Covariance Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Construction
      and Filtering Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Spectral
      Containment Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>