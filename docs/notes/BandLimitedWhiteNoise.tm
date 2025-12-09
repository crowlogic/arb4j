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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Sampling
    Theory and Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Aliasing
    and Reconstruction Error Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
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

  <section|Sampling Theory and Reconstruction>

  <\theorem>
    <dueto|Nyquist-Shannon Sampling Theorem><label|thm:sampling>Let
    <math|W<rsub|B><around|(|t|)>> be band-limited white noise with bandwidth
    <math|B>. If <math|W<rsub|B><around|(|t|)>> is sampled at rate
    <math|f<rsub|s>\<geq\>2*B>, then <math|W<rsub|B><around|(|t|)>> can be
    perfectly reconstructed from its samples
    <math|<around|{|W<rsub|B>*<around|(|n*T<rsub|s>|)>|}><rsub|n=-\<infty\>><rsup|\<infty\>>>
    where <math|T<rsub|s>=1/f<rsub|s>> is the sampling period.
  </theorem>

  <\proof>
    By Theorem <reference|thm:support>, <math|W<rsub|B><around|(|t|)>> has
    spectral support in <math|<around|[|-B,B|]>>. The classical sampling
    theorem applies to any function (or stochastic process) with finite
    bandwidth. Since <math|f<rsub|s>\<geq\>2*B>, the sampling rate exceeds
    the Nyquist rate <math|f<rsub|N>=2*B>, ensuring no aliasing occurs during
    sampling.
  </proof>

  <\theorem>
    <dueto|Whittaker-Shannon Interpolation
    Formula><label|thm:interpolation>The perfect reconstruction of
    band-limited white noise <math|W<rsub|B><around|(|t|)>> from its samples
    is given by

    <\equation>
      W<rsub|B><around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>W<rsub|B>*<around|(|n*T<rsub|s>|)><math-up|sinc><around*|(|<frac|t-n*T<rsub|s>|T<rsub|s>>|)><label|eq:interpolation>
    </equation>

    where <math|T<rsub|s>=\<pi\>/B> is the Nyquist sampling period.
  </theorem>

  <\proof>
    The Fourier transform of <math|W<rsub|B><around|(|t|)>> has support in
    <math|<around|[|-B,B|]>>. The sampling operation in frequency domain
    corresponds to periodic extension of the spectrum with period
    <math|2*\<pi\>/T<rsub|s>>. For <math|T<rsub|s>=\<pi\>/B>, we have
    <math|2*\<pi\>/T<rsub|s>=2*B>, so the periodic extensions do not overlap.

    The reconstruction filter is an ideal low-pass filter with cutoff
    <math|B> and impulse response <math|h<around|(|t|)>=<frac|B|\<pi\>><math-up|sinc><around|(|B*t|)>>.
    Substituting <math|B=\<pi\>/T<rsub|s>>:

    <\equation>
      h<around|(|t|)>=<frac|\<pi\>/T<rsub|s>|\<pi\>><math-up|sinc><around*|(|<frac|\<pi\>*t|T<rsub|s>>|)>=<frac|1|T<rsub|s>><math-up|sinc><around*|(|<frac|t|T<rsub|s>>|)>
    </equation>

    The reconstructed signal is:

    <\align>
      <tformat|<table|<row|<cell|W<rsub|B><around|(|t|)>>|<cell|=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>W<rsub|B>*<around|(|n*T<rsub|s>|)>*\<delta\>*<around|(|t-n*T<rsub|s>|)>\<ast\>h<around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>W<rsub|B>*<around|(|n*T<rsub|s>|)>*h*<around|(|t-n*T<rsub|s>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>W<rsub|B>*<around|(|n*T<rsub|s>|)><frac|1|T<rsub|s>><math-up|sinc><around*|(|<frac|t-n*T<rsub|s>|T<rsub|s>>|)><eq-number>>>>>
    </align>

    For normalized sinc function, this becomes equation
    <eqref|eq:interpolation>.
  </proof>

  <\lemma>
    <dueto|Orthogonality of Sampling Functions><label|lem:orthogonality>The
    sampling functions <math|\<phi\><rsub|n><around|(|t|)>=<math-up|sinc><around*|(|<frac|t-n*T<rsub|s>|T<rsub|s>>|)>>
    form an orthogonal set:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|m><around|(|t|)>*\<phi\><rsub|n><around|(|t|)>*d*t=T<rsub|s>*\<delta\><rsub|m*n>
    </equation>

    where <math|\<delta\><rsub|m*n>> is the Kronecker delta.
  </lemma>

  <\proof>
    The Fourier transform of <math|\<phi\><rsub|n><around|(|t|)>> is:

    <\equation>
      \<Phi\><rsub|n><around|(|\<omega\>|)>=T<rsub|s>*e<rsup|-i*\<omega\>*n*T<rsub|s>>*\<Pi\><around*|(|<frac|\<omega\>*T<rsub|s>|2*\<pi\>>|)>
    </equation>

    where <math|\<Pi\><around|(|\<cdummy\>|)>> is the rectangular function.
    By Parseval's theorem:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|m><around|(|t|)>*\<phi\><rsub|n><around|(|t|)>*d*t>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Phi\><rsub|m><rsup|\<ast\>><around|(|\<omega\>|)>*\<Phi\><rsub|n><around|(|\<omega\>|)>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|T<rsub|s><rsup|2>|2*\<pi\>>*<big|int><rsub|-\<pi\>/T<rsub|s>><rsup|\<pi\>/T<rsub|s>>e<rsup|i*\<omega\>*<around|(|m-n|)>*T<rsub|s>>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=T<rsub|s>*\<delta\><rsub|m*n><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    <dueto|Sampling Theorem for Stochastic
    Processes><label|thm:stochastic_sampling>For band-limited white noise
    <math|W<rsub|B><around|(|t|)>> with autocovariance function
    <math|R<rsub|W<rsub|B>><around|(|\<tau\>|)>>, the samples
    <math|<around|{|W<rsub|B>*<around|(|n*T<rsub|s>|)>|}>> at the Nyquist
    rate have autocovariance:

    <\equation>
      R<rsub|W<rsub|B>><around|[|m,n|]>=\<bbb-E\>*<around|[|W<rsub|B>*<around|(|m*T<rsub|s>|)>*W<rsub|B>*<around|(|n*T<rsub|s>|)>|]>=R<rsub|W<rsub|B>>*<around|(|<around|(|m-n|)>*T<rsub|s>|)>
    </equation>
  </theorem>

  <\proof>
    Since <math|W<rsub|B><around|(|t|)>> is a stationary process, its
    autocovariance depends only on the time difference. For samples taken at
    times <math|m*T<rsub|s>> and <math|n*T<rsub|s>>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|W<rsub|B>><around|[|m,n|]>>|<cell|=\<bbb-E\>*<around|[|W<rsub|B>*<around|(|m*T<rsub|s>|)>*W<rsub|B>*<around|(|n*T<rsub|s>|)>|]><eq-number>>>|<row|<cell|>|<cell|=R<rsub|W<rsub|B>>*<around|(|m*T<rsub|s>-n*T<rsub|s>|)><eq-number>>>|<row|<cell|>|<cell|=R<rsub|W<rsub|B>>*<around|(|<around|(|m-n|)>*T<rsub|s>|)><eq-number>>>>>
    </align>
  </proof>

  <\corollary>
    <dueto|Sampling Theorem Applicability><label|cor:sampling>The
    band-limited white noise process <math|W<rsub|B><around|(|t|)>> satisfies
    the conditions for the sampling theorem with Nyquist rate
    <math|f<rsub|N>=2*B> and critical sampling period
    <math|T<rsub|s>=\<pi\>/B>.
  </corollary>

  <\proof>
    This follows immediately from Theorem <reference|thm:support> and
    Theorems <reference|thm:sampling>-<reference|thm:stochastic_sampling>.
  </proof>

  <section|Aliasing and Reconstruction Error Analysis>

  <\theorem>
    <dueto|Aliasing Error><label|thm:aliasing>If band-limited white noise
    <math|W<rsub|B><around|(|t|)>> is sampled at rate
    <math|f<rsub|s>\<less\>2*B>, the aliasing error power is:

    <\equation>
      P<rsub|alias>=<frac|N<rsub|0>|2*\<pi\>>*<big|sum><rsub|k\<neq\>0><big|int><rsub|-B><rsup|B><with|math-font-family|bf|1><rsub|<around|[|-\<pi\>*f<rsub|s>,\<pi\>*f<rsub|s>|]>>*<around|(|\<omega\>+2*\<pi\>*k*f<rsub|s>|)>*d*\<omega\>
    </equation>

    where <math|<with|math-font-family|bf|1><rsub|A><around|(|\<cdummy\>|)>>
    is the indicator function for set <math|A>.
  </theorem>

  <\proof>
    Sampling at rate <math|f<rsub|s>> creates spectral replicas at
    frequencies <math|\<omega\>+2*\<pi\>*k*f<rsub|s>> for integer <math|k>.
    Aliasing occurs when these replicas overlap with the baseband spectrum
    <math|<around|[|-B,B|]>>. The aliasing power is the integral of the
    overlapping spectral components.
  </proof>

  <\theorem>
    <dueto|Reconstruction Mean Square Error><label|thm:mse>For band-limited
    white noise <math|W<rsub|B><around|(|t|)>> reconstructed from samples
    using ideal low-pass filtering, the mean square error is zero when
    <math|f<rsub|s>\<geq\>2*B>.
  </theorem>

  <\proof>
    When the Nyquist criterion is satisfied, the Whittaker-Shannon
    interpolation formula provides perfect reconstruction. Since the process
    is band-limited and the sampling rate is sufficient, no information is
    lost, yielding zero reconstruction error.
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
    <associate|auto-2|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|3|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-4|<tuple|4|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-5|<tuple|5|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-6|<tuple|6|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|cor:sampling|<tuple|13|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|def:blwn|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|def:sinc|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:autocovariance|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:filter|<tuple|17|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:impulse|<tuple|21|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:interpolation|<tuple|33|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:psd|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:sinc|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:variance|<tuple|16|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|lem:orthogonality|<tuple|11|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:aliasing|<tuple|14|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:autocovariance|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:filter|<tuple|5|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:impulse|<tuple|6|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:interpolation|<tuple|10|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:mse|<tuple|15|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:sampling|<tuple|9|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:stochastic_sampling|<tuple|12|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:support|<tuple|7|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:variance|<tuple|4|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Sampling
      Theory and Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Aliasing
      and Reconstruction Error Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>