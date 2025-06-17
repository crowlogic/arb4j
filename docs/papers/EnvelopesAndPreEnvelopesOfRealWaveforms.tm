<TeXmacs|2.1.4>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Envelopes and Pre-Envelopes of Real
  Waveforms>|<doc-author|<author-data|<author-name|J.
  DUGUNDJI>|<\author-affiliation>
    University of Southern California, Los Angeles, Calif.

    \ <date|1958>
  </author-affiliation>>>>

  <\abstract>
    Rice's formula<cite|rice1944> for the \Penvelope\Q of a given signal is
    very cumbersome; in any case where the signal is not a single sine wave,
    the analytical use and explicit calculation of the envelope is
    practically prohibitive. A different formula for the envelope is given
    herein which is much simpler and easier to handle analytically. We show
    precisely that if <math|<wide|u|^><around|(|t|)>> is the Hilbert
    transform of <math|u<around|(|t|)>>, then Rice's envelope of
    <math|u<around|(|t|)>> is the absolute value of the complex-valued
    function <math|u<around|(|t|)>+i*<wide|u|^><around|(|t|)>>. The function
    <math|u+i*<wide|u|^>> is called the pre-envelope of <math|u> and is shown
    to be involved implicitly in some other usual engineering practices.

    The Hilbert transform <math|<wide|u|^>> is then studied; it is shown that
    <math|<wide|u|^>> has the same power spectrum as <math|u> and is
    uncorrelated with <math|u> at the same time instant. Further, the
    autocorrelation of the pre-envelope of <math|u> is twice the pre-envelope
    of the autocorrelation of <math|u>.

    By using the pre-envelope, the envelope of the output of a linear filter
    is easily calculated, and this is used to compute the first probability
    density for the envelope of the output of an arbitrary linear filter when
    the input is an arbitrary signal plus Gaussian noise. An application of
    pre-envelopes to the frequency modulation of an arbitrary waveform by
    another arbitrary waveform is also given.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Hilbert
    Transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Definitions
    and Main Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Properties
    of Pre-Envelopes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Application
    to Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Probability
    Density for Filter Output> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Application
    to Frequency Modulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  We recall Rice's formulation<cite|rice1944> of the envelope of a
  multichromatic waveform <math|u<around|(|t|)>>. He starts by writing
  <math|u<around|(|t|)>> in the form

  <\equation>
    u<around|(|t|)>=<big|sum><rsub|n>c<rsub|n>*cos
    <around|(|\<omega\><rsub|n>*t+\<varphi\><rsub|n>|)><label|eq:rice_form>
  </equation>

  and then selects a frequency <math|q> called the \Pmidband frequency.\Q
  Using this selected frequency, he writes

  <\align>
    <tformat|<table|<row|<cell|u<around|(|t|)>>|<cell|=<big|sum><rsub|n>c<rsub|n>*cos
    <around|[|<around|(|\<omega\><rsub|n>-q|)>*t+\<varphi\><rsub|n>+q*t|]><eq-number><label|eq:rice_midband>>>|<row|<cell|>|<cell|=I<rsub|c>*cos
    q*t-I<rsub|s>*sin q*t<eq-number><label|eq:rice_components>>>>>
  </align>

  where

  <\align>
    <tformat|<table|<row|<cell|I<rsub|c>>|<cell|=<big|sum><rsub|n>c<rsub|n>*cos
    <around|[|<around|(|\<omega\><rsub|n>-q|)>*t+\<varphi\><rsub|n>|]><eq-number><label|eq:Ic>>>|<row|<cell|I<rsub|s>>|<cell|=<big|sum><rsub|n>c<rsub|n>*sin
    <around|[|<around|(|\<omega\><rsub|n>-q|)>*t+\<varphi\><rsub|n>|]><eq-number><label|eq:Is>>>>>
  </align>

  The expression

  <\equation>
    R<around|(|t|)>=<around|[|I<rsub|c><rsup|2>+I<rsub|s><rsup|2>|]><rsup|1/2><label|eq:rice_envelope>
  </equation>

  is termed by Rice the \Penvelope of <math|u<around|(|t|)>> referred to
  frequency <math|q>.\Q

  This formulation has several defects. First, to obtain the envelope, one
  must expand the given multichromatic waveform in the form above. Second,
  one must select a \Pmidband frequency\Q <math|q>; it is not immediately
  evident whether or not a choice <math|q<rprime|'>\<neq\>q> leads to the
  same <math|R<around|(|t|)>>. Finally, the explicit calculation of
  <math|R<around|(|t|)>> is a formidable task.

  In this paper, we intend to give an equivalent, but more direct formulation
  of the concept \Penvelope.\Q This is done by introducing the idea of the
  pre-envelope of a given real waveform, which is a complex-valued function
  whose absolute value turns out to be exactly the envelope of the given
  waveform. Applications of the pre-envelope are given: 1) to show that
  <math|R<around|(|t|)>> depends only on the given waveform and not on the
  seemingly extraneous concept of \Pmidband frequency,\Q 2) to give direct
  methods for obtaining the envelope of the output of a linear filter when
  the input is an arbitrary waveform, 3) to calculate explicitly the first
  probability density for the envelope of the output of an arbitrary linear
  filter when the input is an arbitrary signal plus Gaussian noise, and 4) to
  give a definition of frequency modulation when both the waveform
  <math|u<around|(|t|)>> and the modulating function <math|m<around|(|t|)>>
  are arbitrary.

  The paper is divided into six parts. Section<nbsp><reference|sec:hilbert>
  contains the essential facts about Hilbert transforms that are used; proofs
  will be found in Titchmarsh<cite|titchmarsh1937>. In
  Section<nbsp><reference|sec:definitions> the definitions of pre-envelope
  and envelope are given, and the equivalence of our envelope with that of
  Rice is established. Section<nbsp><reference|sec:properties> contains
  further properties of pre-envelopes and, in particular, shows how one is
  naturally led to their consideration. In
  Sections<nbsp><reference|sec:filters>\U<reference|sec:frequency> the
  applications cited above are given.

  We remark that Hilbert transforms have been used in electrical engineering
  before, notably by Gabor<cite|gabor1946>, Woodward<cite|woodward1953>, and
  Ville<cite|ville1948>; the concept \Ppre-envelope\Q is in fact identical
  with the \Psignal analytique\Q of Ville, but our use and purpose differ
  from his.

  <section|Hilbert Transforms><label|sec:hilbert>

  Given a real-valued function <math|u<around|(|t|)>> on
  <math|-\<infty\>\<less\>t\<less\>+\<infty\>>, its Hilbert transform
  <math|<wide|u|^><around|(|t|)>> is defined by

  <\equation>
    <wide|u|^><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|u<around|(|\<xi\>|)>|t-\<xi\>>*d*\<xi\><label|eq:hilbert_def>
  </equation>

  where the principal value of the integral is always used. All functions
  considered here will be assumed to have Hilbert transforms.

  <\proposition>
    <label|prop:hilbert_cosine>The Hilbert transform of <math|cos
    <around|(|\<omega\>*t+\<varphi\>|)>> is <math|sin
    <around|(|\<omega\>*t+\<varphi\>|)>>.
  </proposition>

  It is proved in Titchmarsh<cite|titchmarsh1937> that, under suitable
  conditions, <math|<wide|<wide|u|^>|^>=-u>.

  <\proposition>
    <label|prop:hilbert_double>The Hilbert transform of a Hilbert transform
    is the negative of the original function.
  </proposition>

  <\proposition>
    <label|prop:hilbert_fourier>If <math|U<around|(|f|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>u<around|(|t|)>*exp
    <around|(|-2*\<pi\>*i*f*t|)>*d*t> is the Fourier transform of
    <math|u<around|(|t|)>>, then the Fourier transform
    <math|<wide|U|^><around|(|f|)>> of <math|<wide|u|^><around|(|t|)>> is

    <\equation>
      <wide|U|^><around|(|f|)>=<choice|<tformat|<table|<row|<cell|-i*U<around|(|f|)>>|<cell|f\<gtr\>0>>|<row|<cell|0>|<cell|f=0>>|<row|<cell|+i*U<around|(|f|)>>|<cell|f\<less\>0>>>>><label|eq:hilbert_fourier>
    </equation>
  </proposition>

  <\proposition>
    <label|prop:hilbert_convolution>The convolution

    <\equation>
      w<around|(|t|)>=v<around|(|t|)>\<ast\>u<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>v<around|(|\<xi\>|)>*u*<around|(|t-\<xi\>|)>*d*\<xi\><label|eq:convolution>
    </equation>

    has Hilbert transform

    <\equation>
      <wide|w|^><around|(|t|)>=v<around|(|t|)>\<ast\><wide|u|^><around|(|t|)><label|eq:hilbert_convolution>
    </equation>
  </proposition>

  <section|Definitions and Main Results><label|sec:definitions>

  <\definition>
    Let <math|u<around|(|t|)>> be a real waveform. The pre-envelope
    <math|z<around|(|t|)>> of <math|u<around|(|t|)>> is the complex-valued
    function

    <\equation>
      z<around|(|t|)>=u<around|(|t|)>+i*<wide|u|^><around|(|t|)><label|eq:pre_envelope>
    </equation>

    The envelope of <math|u<around|(|t|)>> is the absolute value
    <math|<around|\||z<around|(|t|)>|\|>> of its pre-envelope.
  </definition>

  <\theorem>
    <label|thm:rice_equivalence>This definition of envelope gives the same
    result as that of Rice, whenever Rice's definition is applicable.
  </theorem>

  <\proof>
    With the notations of Section<nbsp><reference|sec:introduction>, we start
    by writing <math|u<around|(|t|)>> in the form of
    equation<nbsp><eqref|eq:rice_form>. Forming the pre-envelope
    <math|z<around|(|t|)>> of <math|u<around|(|t|)>> by using
    Proposition<nbsp><reference|prop:hilbert_cosine>, one gets

    <\equation>
      z<around|(|t|)>=<big|sum><rsub|n>c<rsub|n>*cos
      <around|(|\<omega\><rsub|n>*t+\<varphi\><rsub|n>|)>+i*<big|sum><rsub|n>c<rsub|n>*sin
      <around|(|\<omega\><rsub|n>*t+\<varphi\><rsub|n>|)><label|eq:pre_envelope_expansion>
    </equation>

    Referring to the frequency <math|q> and noting that

    <\equation>
      <big|sum><rsub|n>sin <around|[|<around|(|\<omega\><rsub|n>-q|)>*t+\<varphi\><rsub|n>+q*t|]>=I<rsub|c>*cos
      q*t+I<rsub|s>*sin q*t<label|eq:sine_expansion>
    </equation>

    one finds

    <\align>
      <tformat|<table|<row|<cell|z<around|(|t|)>>|<cell|=<around|[|I<rsub|c>*cos
      q*t-I<rsub|s>*sin q*t|]>+i*<around|[|I<rsub|c>*cos q*t+I<rsub|s>*sin
      q*t|]><eq-number><label|eq:z_components>>>|<row|<cell|>|<cell|=<around|[|I<rsub|c>+i*I<rsub|s>|]>*exp
      <around|[|i*q*t|]><eq-number><label|eq:z_exponential>>>>>
    </align>

    which shows that

    <\equation>
      <around|\||z<around|(|t|)>|\|>=R<around|(|t|)><label|eq:envelope_equivalence>
    </equation>

    and establishes the result.
  </proof>

  Since <math|z<around|(|t|)>> depends only on <math|u<around|(|t|)>>, one
  obtains the following corollary.

  <\corollary>
    <label|cor:midband_independence>Rice's envelope is completely independent
    of the \Pmidband frequency\Q <math|q> that is selected.
  </corollary>

  <section|Properties of Pre-Envelopes><label|sec:properties>

  A motivation for using pre-envelopes is given here. Further, the power
  spectrum of <math|<wide|u|^>> and the cross correlation of
  <math|u,<wide|u|^>> are calculated; these will be needed in the sequel.

  The motivation for Hilbert transforms comes from the following results:

  <\proposition>
    <label|prop:fourier_pre_envelope>The Fourier transform of
    <math|z=u+i*<wide|u|^>> is

    <\equation>
      Z<around|(|f|)>=<choice|<tformat|<table|<row|<cell|2*U<around|(|f|)>>|<cell|f\<gtr\>0>>|<row|<cell|U<around|(|f|)>>|<cell|f=0>>|<row|<cell|0>|<cell|f\<less\>0>>>>><label|eq:fourier_pre_envelope>
    </equation>

    where <math|U<around|(|f|)>> is the Fourier transform of
    <math|u<around|(|t|)>>.
  </proposition>

  <\proof>
    Since <math|Z<around|(|f|)>=U<around|(|f|)>+i*<wide|U|^><around|(|f|)>>,
    where <math|<wide|U|^>> is the Fourier transform of <math|<wide|u|^>>,
    the result is immediate from Proposition<nbsp><reference|prop:hilbert_fourier>.
  </proof>

  The important thing is that the inverse of
  Proposition<nbsp><reference|prop:fourier_pre_envelope> is also true.

  <\proposition>
    <label|prop:pre_envelope_characterization>Let <math|z<around|(|t|)>> be
    any (necessarily complex-valued) function with Fourier transform
    <math|Z<around|(|f|)>> vanishing for all <math|f\<less\>0>. Then <math|z>
    is the pre-envelope of its real part. That is, if <math|u=<text|real part
    of >z>, then <math|z=u+i*<wide|u|^>>.
  </proposition>

  <\proof>
    Define

    <\equation>
      U<around|(|f|)>=<choice|<tformat|<table|<row|<cell|Z<around|(|f|)>>|<cell|f\<gtr\>0>>|<row|<cell|Z<rsup|\<ast\>>*<around|(|-f|)>>|<cell|f=0>>|<row|<cell|0>|<cell|f\<less\>0>>>>><label|eq:U_definition>
    </equation>

    where the asterisk denotes complex conjugate. Setting

    <\equation>
      u<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|f|)>*exp
      <around|[|+2*\<pi\>*i*f*t|]>*d*f<label|eq:u_inverse_fourier>
    </equation>

    one easily shows that <math|u<around|(|t|)>=u<rsup|\<ast\>><around|(|t|)>>,
    so that <math|u> is real-valued. Form the pre-envelope
    <math|\<mu\>=u+i*<wide|u|^>> of <math|u>. By
    Proposition<nbsp><reference|prop:fourier_pre_envelope>, its Fourier
    transform is precisely <math|Z<around|(|f|)>> except possibly at
    <math|f=0>, and this implies at once that <math|\<mu\>=z>.
  </proof>

  Now, it is standard engineering practice in considering frequency spectra
  to double the positive frequencies and cut the negative ones on the grounds
  that the positive frequencies are the physically meaningful ones and the
  (mathematical) negative frequencies merely reflect the positive ones in
  complex conjugate form. From Propositions<nbsp><reference|prop:fourier_pre_envelope>
  and<nbsp><reference|prop:pre_envelope_characterization>, it is evident that
  the mathematical counterpart of this physical practice is to form the
  pre-envelope of the waveform considered. The fact of
  Theorem<nbsp><reference|thm:rice_equivalence> is a further reinforcement of
  the utility of the concept of \Ppre-envelope.\Q

  For any two waveforms <math|u,v>, whether real or complex-valued, their
  cross correlation <math|R<rsub|u*v>> is defined by

  <\equation>
    R<rsub|u*v><around|(|t|)>=lim<rsub|T\<to\>\<infty\>>
    <frac|1|2*T>*<big|int><rsub|-T><rsup|T>u<rsup|\<ast\>><around|(|\<xi\>|)>*v*<around|(|t+\<xi\>|)>*d*\<xi\><label|eq:cross_correlation>
  </equation>

  and their cross-power spectrum <math|W<rsub|u*v>> is the Fourier transform
  of <math|R<rsub|u*v>>:

  <\equation>
    W<rsub|u*v><around|(|f|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|u*v><around|(|t|)>*exp
    <around|[|-2*\<pi\>*i*f*t|]>*d*t<label|eq:cross_power_spectrum>
  </equation>

  It is well known that

  <\equation>
    R<rsub|u*v><around|(|t|)>=R<rsub|v*u><rsup|\<ast\>>*<around|(|-t|)><label|eq:correlation_symmetry>
  </equation>

  The autocorrelation <math|R<rsub|u*u>> of <math|u> is written simply
  <math|R<rsub|u>>.

  <\proposition>
    <label|prop:cross_correlation_hilbert>The cross correlation
    <math|R<rsub|u*<wide|u|^>>> is precisely <math|<wide|R<rsub|u>|^>>, the
    Hilbert transform of <math|R<rsub|u>>.
  </proposition>

  <\proof>
    Rewriting equation<nbsp><eqref|eq:hilbert_def> in the form

    <\equation>
      <wide|u|^><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|u*<around|(|t+x|)>|x>*d*x<label|eq:hilbert_alt>
    </equation>

    one has, since <math|u> is real-valued,

    <\equation>
      R<rsub|u*<wide|u|^>><around|(|t|)>=<frac|1|\<pi\>>*lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>d*\<xi\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|u<around|(|\<xi\>|)>*u*<around|(|\<xi\>+x+t|)>|x>*d*x<label|eq:cross_correlation_computation>
    </equation>

    Assuming interchangeability of the order of integration and limits gives

    <\align>
      <tformat|<table|<row|<cell|R<rsub|u*<wide|u|^>><around|(|t|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|d*x|x>*lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>u<around|(|\<xi\>|)>*u*<around|(|x+t+\<xi\>|)>*d*\<xi\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|u>*<around|(|x+t|)>|x>*d*x=<wide|R<rsub|u>|^><around|(|t|)><eq-number><label|eq:cross_correlation_result>>>>>
    </align>

    which establishes the result.
  </proof>

  <\corollary>
    <label|cor:uncorrelated><math|R<rsub|<wide|u|^>*u><around|(|t|)>=-R<rsub|u*<wide|u|^>><around|(|t|)>>.
    In particular, <math|u> and <math|<wide|u|^>> are completely uncorrelated
    at the same time instant, i.e., <math|R<rsub|u*<wide|u|^>><around|(|0|)>=0>.
  </corollary>

  <\proof>
    By using equation<nbsp><eqref|eq:correlation_symmetry> and observing that
    <math|R<rsub|u>> is real-valued, one has

    <\equation>
      R<rsub|<wide|u|^>*u>*<around|(|-t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|u>*<around|(|x-t|)>|x>*d*x<label|eq:correlation_negative>
    </equation>

    and changing the variable of integration to <math|x<rprime|'>=-x>:

    <\equation>
      R<rsub|<wide|u|^>*u>*<around|(|-t|)>=-<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|u>*<around|(|-x<rprime|'>-t|)>|x<rprime|'>>*d*x<rprime|'>=-R<rsub|u*<wide|u|^>><around|(|t|)><label|eq:correlation_antisymmetry>
    </equation>
  </proof>

  <\corollary>
    <label|cor:cross_power_spectrum>The cross-power spectrum of <math|u> and
    <math|<wide|u|^>> is

    <\equation>
      W<rsub|u*<wide|u|^>><around|(|f|)>=<choice|<tformat|<table|<row|<cell|-i*W<rsub|u><around|(|f|)>>|<cell|f\<gtr\>0>>|<row|<cell|0>|<cell|f=0>>|<row|<cell|+i*W<rsub|u><around|(|f|)>>|<cell|f\<less\>0>>>>><label|eq:cross_power_spectrum_result>
    </equation>
  </corollary>

  <\proof>
    This is immediate from Proposition<nbsp><reference|prop:hilbert_fourier>
    and Proposition<nbsp><reference|prop:cross_correlation_hilbert>.
  </proof>

  We now turn to the study of <math|R<rsub|<wide|u|^>>> and
  <math|W<rsub|<wide|u|^>>>.

  <\proposition>
    <label|prop:same_spectrum><math|u> and <math|<wide|u|^>> have precisely
    the same autocorrelation and power spectrum.
  </proposition>

  <\proof>
    From Proposition<nbsp><reference|prop:cross_correlation_hilbert> one has
    <math|R<rsub|<wide|u|^>*u><around|(|t|)>=<wide|R<rsub|u*<wide|u|^>>|^><around|(|t|)>>.
    Now, starting from <math|u> and its Hilbert transform
    <math|<wide|u|^>=<wide|u|^>>, one finds from
    Proposition<nbsp><reference|prop:cross_correlation_hilbert> again that

    <\equation>
      R<rsub|<wide|u|^>*<wide|u|^>><around|(|t|)>=R<rsub|<wide|u|^>*<wide|<wide|u|^>|^>><around|(|t|)>=-R<rsub|<wide|u|^>*u><around|(|t|)><label|eq:double_hilbert_correlation>
    </equation>

    Using equation<nbsp><eqref|eq:correlation_symmetry> and
    Corollary<nbsp><reference|cor:uncorrelated> shows

    <\equation>
      R<rsub|<wide|u|^>><around|(|t|)>=-R<rsub|<wide|u|^>*u>*<around|(|-t|)>=R<rsub|u*<wide|u|^>><around|(|t|)>=R<rsub|u><around|(|t|)><label|eq:same_autocorrelation>
    </equation>

    which is what was asserted.
  </proof>

  For the pre-envelope itself, one gets immediately from
  Propositions<nbsp><reference|prop:cross_correlation_hilbert>
  and<nbsp><reference|prop:same_spectrum> the following:

  <\proposition>
    <label|prop:pre_envelope_autocorrelation>Let
    <math|z<around|(|t|)>=u<around|(|t|)>+i*<wide|u|^><around|(|t|)>>. Then

    <\equation>
      R<rsub|z><around|(|t|)>=2*<around|[|R<rsub|u><around|(|t|)>+i<wide|R<rsub|u>|^><around|(|t|)>|]><label|eq:pre_envelope_autocorrelation>
    </equation>
  </proposition>

  <section|Application to Filters><label|sec:filters>

  Application to filters is now given.

  <\proposition>
    <label|prop:filter_pre_envelope>Let <math|u<around|(|t|)>> be a real
    input to a linear filter having a real impulsive response function
    <math|r<around|(|t|)>>. Then the pre-envelope of the output is obtained
    by taking the pre-envelope of <math|u> as input.
  </proposition>

  <\proof>
    With the pre-envelope <math|z=u+i*<wide|u|^>> as input, one obtains for
    output the convolution

    <\equation>
      w=r\<ast\>z=r\<ast\>u+i*r\<ast\><wide|u|^><label|eq:filter_convolution>
    </equation>

    But <math|w<rsub|o>=r\<ast\>u> is the output when <math|u> alone is
    input, and by Proposition<nbsp><reference|prop:hilbert_convolution> one
    has <math|r\<ast\><wide|u|^>=<wide|w<rsub|o>|^>>. Thus,
    <math|w=w<rsub|o>+i<wide|w<rsub|o>|^>>, proving the assertion.
  </proof>

  <\corollary>
    <label|cor:frequency_response>In terms of the frequency response function
    <math|Y<around|(|f|)>> of the filter, the pre-envelope of the output when
    <math|u> is taken for input is

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>2*Y<around|(|f|)>*U<around|(|f|)>*exp
      <around|(|2*\<pi\>*i*f*t|)>*d*f<label|eq:frequency_response_output>
    </equation>

    where <math|U<around|(|f|)>> is the Fourier transform of
    <math|u<around|(|t|)>>.
  </corollary>

  <\proof>
    By using Proposition<nbsp><reference|prop:filter_pre_envelope>, one need
    only compute the output when the pre-envelope <math|z=u+i*<wide|u|^>> is
    input. Since the Fourier transform of a filter output equals the Fourier
    transform of the filter input times frequency response function, the
    output in the case to hand has Fourier transform
    <math|Y<around|(|f|)>*Z<around|(|f|)>>. By
    Proposition<nbsp><reference|prop:fourier_pre_envelope>,

    <\equation>
      Y<around|(|f|)>*Z<around|(|f|)>=<choice|<tformat|<table|<row|<cell|2*Y<around|(|f|)>*U<around|(|f|)>>|<cell|f\<gtr\>0>>|<row|<cell|Y<around|(|f|)>*U<around|(|f|)>>|<cell|f=0>>|<row|<cell|0>|<cell|f\<less\>0>>>>><label|eq:filter_output_fourier>
    </equation>

    Defining <math|Y<around|(|0|)>*U<around|(|0|)>=0>, which does not affect
    the inverse Fourier transform of <math|Y<around|(|f|)>*Z<around|(|f|)>>,
    one has for output the desired formula.
  </proof>

  Using a slightly different viewpoint, this corollary says that the
  pre-envelope of the output is obtained by taking <math|u> alone as input
  and redefining the filter frequency response by doubling the positive
  frequencies and killing the negative ones. As another simple application:

  <\proposition>
    <label|prop:bandlimited_envelope>Let <math|u<around|(|t|)>> be a waveform
    having frequency spectrum in the bands
    <math|f<rsub|o>-W\<less\><around|\||f|\|>\<less\>f<rsub|o>+W>. Then the
    square of the envelope is frequency limited to
    <math|<around|\||f|\|>\<leq\>W>.
  </proposition>

  <\proof>
    If <math|z=u+i*<wide|u|^>> is the pre-envelope of <math|u<around|(|t|)>>,
    we are interested in

    <\equation>
      K<around|(|f|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||z<around|(|t|)>|\|><rsup|2>*exp
      <around|[|-2*\<pi\>*i*f*t|]>*d*t<label|eq:envelope_squared_fourier>
    </equation>

    Now,

    <\align>
      <tformat|<table|<row|<cell|K<around|(|f|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>z<around|(|t|)>*z<rsup|\<ast\>><around|(|t|)>*exp
      <around|[|-2*\<pi\>*i*f*t|]>*d*t<eq-number>>>|<row|<cell|>|<cell|=Z<around|(|f|)>\<ast\>Z<rsup|\<ast\>>*<around|(|-f|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|f<rsub|o>-W><rsup|f<rsub|o>+W>Z<around|(|\<xi\>|)>*Z<rsup|\<ast\>>*<around|(|\<xi\>-f|)>*d*\<xi\><eq-number><label|eq:envelope_convolution>>>>>
    </align>

    and this is readily seen, by Proposition<nbsp><reference|prop:fourier_pre_envelope>,
    to vanish outside <math|<around|\||f|\|>\<leq\>W>.
  </proof>

  We remark that the hypotheses of Proposition<nbsp><reference|prop:bandlimited_envelope>
  do not allow one to draw the conclusion that the envelope itself is
  band-limited; indeed, there seems to be no physical reason that it should
  be so.

  <section|Probability Density for Filter Output><label|sec:probability>

  The first probability density for the envelope of the output of a linear
  filter, when the input is arbitrary signal plus Gaussian noise with zero
  mean, will be computed.

  It is well known that if Gaussian noise having zero mean and power spectrum
  <math|W<around|(|f|)>> is passed through a linear filter having frequency
  response <math|Y<around|(|f|)>>, then the output 1) is Gaussian with zero
  mean and 2) has power spectrum <math|<around|\||Y<around|(|f|)>|\|><rsup|2>*W<around|(|f|)>>.
  From this 2) we find at once that the variance of the output distribution,
  which is the value of the autocorrelation at <math|t=0>, is

  <\equation>
    \<sigma\><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||Y<around|(|f|)>|\|><rsup|2>*W<around|(|f|)>*d*f<label|eq:output_variance>
  </equation>

  The probability density of the output <math|N> is therefore

  <\equation>
    <frac|1|\<sigma\><sqrt|2*\<pi\>>>*exp
    <around*|[|-<frac|N<rsup|2>|2*\<sigma\><rsup|2>>|]><label|eq:gaussian_density>
  </equation>

  Let <math|<around|{|n<around|(|t|)>|}>> be sample functions for the noise,
  and consider the two-dimensional stochastic process <math|Q> whose samples
  are the ordered pairs <math|<around|[|n<around|(|t|)>,<wide|n|^><around|(|t|)>|]>>,
  the second term always being the Hilbert transform of the first. Observe
  that if <math|n<rsub|o><around|(|t|)>> is the output of the filter when
  <math|n<around|(|t|)>> is input, then by
  Proposition<nbsp><reference|prop:filter_pre_envelope> the output when
  <math|<wide|n|^><around|(|t|)>> is applied is the Hilbert transform
  <math|<wide|n<rsub|o>|^><around|(|t|)>> of <math|n<rsub|o><around|(|t|)>>.
  The two-dimensional distribution of the output
  <math|<around|(|N,<wide|N|^>|)>> when the <math|Q> process is put through
  the filter is now to be determined.

  We have seen that <math|N> is Gaussian with zero mean and variance
  <math|\<sigma\><rsup|2>>. Now <math|<wide|N|^>> is also Gaussian with zero
  mean and variance <math|\<sigma\><rsup|2>>. That <math|<wide|N|^>> is
  Gaussian with zero mean is seen by using for the
  <math|<around|{|n<around|(|t|)>|}>> the same functions as does
  Rice<cite|rice1944> and applying Proposition<nbsp><reference|prop:hilbert_cosine>
  to each. That the variance of <math|<wide|N|^>> is <math|\<sigma\><rsup|2>>
  results from Proposition<nbsp><reference|prop:same_spectrum>, since this
  tells us that the functions <math|<around|{|<wide|n|^><around|(|t|)>|}>>
  have the same power spectrum as the <math|<around|{|n<around|(|t|)>|}>>.

  Putting the sample <math|<around|[|n<around|(|t|)>,<wide|n|^><around|(|t|)>|]>>
  through the filter gives, as has been remarked, the output
  <math|<around|[|n<rsub|o><around|(|t|)>,<wide|n<rsub|o>|^><around|(|t|)>|]>>,
  the second variable being the Hilbert transform of the first. According to
  Corollary<nbsp><reference|cor:uncorrelated> <math|n<rsub|o><around|(|t|)>>
  and <math|<wide|n<rsub|o>|^><around|(|t|)>> are always uncorrelated at the
  same instant of time. It follows at once that <math|N> and
  <math|<wide|N|^>> are independent, so that their joint probability density
  is given by

  <\equation>
    p<around|(|N,<wide|N|^>|)>=<frac|1|2*\<pi\>*\<sigma\><rsup|2>>*exp
    <around*|[|-<frac|N<rsup|2>+<wide|N|^><rsup|2>|2*\<sigma\><rsup|2>>|]><label|eq:joint_density>
  </equation>

  With the preliminaries aside, we prove the following:

  <\theorem>
    <label|thm:envelope_density>Let signal <math|u<around|(|t|)>> plus
    Gaussian noise with zero mean and power spectrum <math|W<around|(|f|)>>
    be put through a filter having frequency response function
    <math|Y<around|(|f|)>>. Then the envelope <math|R> of the output has
    first probability density

    <\equation>
      p<around|(|R|)>=<frac|R|\<sigma\><rsup|2>>*exp
      <around*|[|-<frac|R<rsup|2>+<around|\||z<around|(|t|)>|\|><rsup|2>|2*\<sigma\><rsup|2>>|]>*I<rsub|0><around*|(|<frac|R<around|\||z<around|(|t|)>|\|>|\<sigma\><rsup|2>>|)><label|eq:envelope_density>
    </equation>

    where <math|I<rsub|0>> is the Bessel function of zero order and purely
    imaginary argument,

    <\equation>
      \<sigma\><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||Y<around|(|f|)>|\|><rsup|2>*W<around|(|f|)>*d*f<label|eq:sigma_squared>
    </equation>

    <\equation>
      z<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>2*Y<around|(|f|)>*U<around|(|f|)>*exp
      <around|[|2*\<pi\>*i*f*t|]>*d*f<label|eq:z_definition>
    </equation>

    and <math|<around|\||z<around|(|t|)>|\|>> is the envelope of output if
    signal alone is input.
  </theorem>

  <\proof>
    Let <math|u<rsub|o>> be the output when <math|u> alone is input, and
    <math|n<rsub|o>> be the output when the sample function
    <math|n<around|(|t|)>> is input; then, by
    Proposition<nbsp><reference|prop:filter_pre_envelope>, the pre-envelope
    of the output of signal plus noise has sample functions
    <math|<around|(|u<rsub|o>+n<rsub|o>|)>+i*<around|(|<wide|u<rsub|o>|^>+<wide|n<rsub|o>|^>|)>>,
    where, according to Corollary<nbsp><reference|cor:frequency_response> one
    has <math|u<rsub|o>+i<wide|u<rsub|o>|^>=z>. The envelope of the output is
    therefore

    <\equation>
      R=<around|[|<around|(|u<rsub|o>+n<rsub|o>|)><rsup|2>+<around|(|<wide|u<rsub|o>|^>+<wide|n<rsub|o>|^>|)><rsup|2>|]><rsup|1/2><label|eq:envelope_formula>
    </equation>

    In view of the previous discussion, the problem is reduced to calculating
    the probability density of

    <\equation>
      R=<around|[|<around|(|u<rsub|o>+N|)><rsup|2>+<around|(|<wide|u<rsub|o>|^>+<wide|N|^>|)><rsup|2>|]><rsup|1/2><label|eq:R_formula>
    </equation>

    where <math|N,<wide|N|^>> are distributed as in
    equation<nbsp><eqref|eq:joint_density>.

    The substitution

    <\align>
      <tformat|<table|<row|<cell|R*cos \<theta\>>|<cell|=u<rsub|o>+N<eq-number><label|eq:substitution1>>>|<row|<cell|R*sin
      \<theta\>>|<cell|=<wide|u<rsub|o>|^>+<wide|N|^><eq-number><label|eq:substitution2>>>>>
    </align>

    gives

    <\equation>
      N<rsup|2>+<wide|N|^><rsup|2>=R<rsup|2>+u<rsub|o><rsup|2>+<wide|u<rsub|o>|^><rsup|2>-2*R*<around|[|u<rsub|o>*cos
      \<theta\>+<wide|u<rsub|o>|^>sin \<theta\>|]><label|eq:substitution_result>
    </equation>

    and the method now used is the same as that of Rice<cite|rice1944>.
    Observing that

    <\equation>
      u<rsub|o><rsup|2>+<wide|u<rsub|o>|^><rsup|2>=<around|\||z|\|><rsup|2><label|eq:magnitude_squared>
    </equation>

    one gets from equation<nbsp><eqref|eq:joint_density>

    <\equation>
      p<around|(|R,\<theta\>|)>*d*R*d*\<theta\>=<frac|R|2*\<pi\>*\<sigma\><rsup|2>>*exp
      <around*|[|-<frac|R<rsup|2>+<around|\||z|\|><rsup|2>|2*\<sigma\><rsup|2>>|]>*exp
      <around*|[|<frac|R|2*\<sigma\><rsup|2>>*<around|(|u<rsub|o>*cos
      \<theta\>+<wide|u<rsub|o>|^>sin \<theta\>|)>|]>*d*R*d*\<theta\><label|eq:joint_density_transformed>
    </equation>

    One now integrates out the <math|\<theta\>> by setting

    <\align>
      <tformat|<table|<row|<cell|u<rsub|o>>|<cell|=\<rho\>*cos
      \<mu\><eq-number><label|eq:polar1>>>|<row|<cell|<wide|u<rsub|o>|^>>|<cell|=\<rho\>*sin
      \<mu\><eq-number><label|eq:polar2>>>>>
    </align>

    where <math|\<rho\>=<around|\||z|\|>>, verifying that <math|u<rsub|o>*cos
    \<theta\>+<wide|u<rsub|o>|^>sin \<theta\>=\<rho\>*cos
    <around|(|\<theta\>-\<mu\>|)>>, and then noting that

    <\equation>
      <big|int><rsub|0><rsup|2*\<pi\>>e<rsup|\<alpha\>*cos
      \<phi\>>*d*\<phi\>=2*\<pi\>*I<rsub|0><around|(|\<alpha\>|)><label|eq:bessel_integral>
    </equation>

    The result is established.
  </proof>

  <section|Application to Frequency Modulation><label|sec:frequency>

  Application to frequency modulation will now be given.

  <\definition>
    <label|def:frequency_modulation>Let <math|u<around|(|t|)>> be a given
    real waveform. For any real waveform <math|m<around|(|t|)>>, we will say
    that the function

    <\equation>
      \<mu\><around|(|t|)>=u<around|(|t|)>*cos
      m<around|(|t|)>-<wide|u|^><around|(|t|)>*sin
      m<around|(|t|)><label|eq:frequency_modulation>
    </equation>

    is <math|u<around|(|t|)>> frequency modulated by <math|m<around|(|t|)>>.
  </definition>

  Before giving a justification of this definition, observe that if
  <math|u<around|(|t|)>=cos 2*\<pi\>*f*t> and <math|m<around|(|t|)>=m*sin
  2*\<pi\>*a*t>, then from Proposition<nbsp><reference|prop:hilbert_cosine>
  it follows at once that our definition reduces to the usual definition of
  frequency modulation: <math|\<mu\><around|(|t|)>=cos
  <around|(|2*\<pi\>*f*t+m*sin 2*\<pi\>*a*t|)>>.

  We also notice that if <math|z<around|(|t|)>> is the pre-envelope of
  <math|u<around|(|t|)>>, and if <math|\<Re\>> denotes \Preal part of,\Q then

  <\equation>
    \<mu\><around|(|t|)>=\<Re\>*<around|{|z<around|(|t|)>*exp
    <around|[|i*m<around|(|t|)>|]>|}><label|eq:frequency_modulation_complex>
  </equation>

  However, we must remark that the complex wave <math|z<around|(|t|)>*exp
  <around|[|i*m<around|(|t|)>|]>> is not the pre-envelope of
  <math|\<mu\><around|(|t|)>>.

  One is led to this definition in the following natural way. We have

  <\equation>
    u<around|(|t|)>=\<Re\>*<around|{|<around|\||z<around|(|t|)>|\|>*exp
    <around|[|i*\<phi\><around|(|t|)>|]>|}>=<around|\||z<around|(|t|)>|\|>*cos
    \<phi\><around|(|t|)><label|eq:amplitude_phase>
  </equation>

  where

  <\equation>
    \<phi\><around|(|t|)>=arctan <frac|<wide|u|^><around|(|t|)>|u<around|(|t|)>><label|eq:instantaneous_phase>
  </equation>

  and <math|<around|\||z<around|(|t|)>|\|>> is the envelope of
  <math|u<around|(|t|)>>. Thus, <math|u<around|(|t|)>> has been written as a
  cosine wave with a \Pslowly\Q varying amplitude and an instantaneous
  frequency; frequency modulation in the usual sense says that the frequency
  modulated wave is

  <\align>
    <tformat|<table|<row|<cell|\<mu\><around|(|t|)>>|<cell|=<around|\||z<around|(|t|)>|\|>*cos
    <around|[|\<phi\><around|(|t|)>+m<around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<Re\>*<around|{|<around|\||z<around|(|t|)>|\|>*exp
    <around|[|i*<around|(|\<phi\><around|(|t|)>+m<around|(|t|)>|)>|]>|}><eq-number>>>|<row|<cell|>|<cell|=\<Re\>*<around|{|<around|\||z<around|(|t|)>|\|>*exp
    <around|[|i*\<phi\><around|(|t|)>|]>*exp
    <around|[|i*m<around|(|t|)>|]>|}><eq-number>>>|<row|<cell|>|<cell|=\<Re\>*<around|{|z<around|(|t|)>*exp
    <around|[|i*m<around|(|t|)>|]>|}><eq-number><label|eq:frequency_modulation_derivation>>>>>
  </align>

  This physical reasoning, together with the fact that it coincides with the
  usual definition whenever both are applicable and because this proposed
  definition applies in cases where the usual one does not, leads us to
  propose our definition as a generalization of the usual notion of frequency
  modulation.

  As a simple application, we calculate the spectrum of an arbitrary real
  waveform <math|u<around|(|t|)>> frequency modulated by <math|b*sin
  2*\<pi\>*a*t>. Let <math|z<around|(|t|)>> be the pre-envelope of
  <math|u<around|(|t|)>>. Observe first that if <math|F<around|(|f|)>> is the
  Fourier transform of the complex waveform
  <math|y<around|(|t|)>=z<around|(|t|)>*exp <around|[|i*b*sin
  2*\<pi\>*a*t|]>> then the spectrum of its real part, which is what we are
  seeking, is <math|<around|[|F<around|(|f|)>+F<rsup|\<ast\>>*<around|(|-f|)>|]>/2>;
  thus it suffices to compute <math|F<around|(|f|)>>. Recalling that

  <\equation>
    exp <around|[|i*b*sin 2*\<pi\>*a*t|]>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|b|)>*exp
    <around|(|i*2*\<pi\>*n*a*t|)><label|eq:bessel_expansion>
  </equation>

  where <math|J<rsub|n>>, <math|n\<geq\>0> is the ordinary Bessel function of
  order <math|n> and <math|J<rsub|-n><around|(|x|)>=<around|(|-1|)><rsup|n>*J<rsub|n><around|(|x|)>>,
  we have

  <\equation>
    y<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|b|)>*z<around|(|t|)>*exp
    <around|[|i*2*\<pi\>*n*a*t|]><label|eq:y_expansion>
  </equation>

  If <math|Z<around|(|f|)>> is the Fourier transform of
  <math|z<around|(|t|)>> and <math|\<delta\><around|(|f|)>> is the Dirac
  delta function, the convolution theorem gives

  <\equation>
    F<around|(|f|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|b|)>*Z<around|(|f|)>\<ast\>\<delta\>*<around|(|f-n*a|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|b|)>*Z*<around|(|f-n*a|)><label|eq:F_convolution>
  </equation>

  To express this directly in terms of <math|U<around|(|f|)>>, the Fourier
  transform of the given <math|u<around|(|t|)>> according to
  Proposition<nbsp><reference|prop:fourier_pre_envelope> is:

  <\equation>
    Z<around|(|f|)>=<around|(|1+<text|sgn
    >f|)>*U<around|(|f|)><label|eq:Z_in_terms_of_U>
  </equation>

  where

  <\equation>
    <text|sgn >f=<choice|<tformat|<table|<row|<cell|+1>|<cell|f\<gtr\>0>>|<row|<cell|0>|<cell|f=0>>|<row|<cell|-1>|<cell|f\<less\>0>>>>><label|eq:signum_function>
  </equation>

  and we find

  <\equation>
    F<around|(|f|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|b|)>*<around|[|1+<text|sgn><around|(|f-n*a|)>|]>*U*<around|(|f-n*a|)><label|eq:F_final>
  </equation>

  As remarked, <math|<around|[|F<around|(|f|)>+F<rsup|\<ast\>>*<around|(|-f|)>|]>/2>
  is the required spectrum.

  <\thebibliography|99>
    <bibitem|rice1944>S. O. Rice, \PMathematical analysis of random noise,\Q
    Bell Sys. Tech. J., vol. 23, pp. 1\U160, 1944.

    <bibitem|titchmarsh1937>E. C. Titchmarsh, \PIntroduction to the Theory of
    Fourier Integrals,\Q Oxford University Press, New York, N. Y., 1937.

    <bibitem|gabor1946>D. Gabor, \PTheory of communication,\Q J. IEEE, pt. 3,
    vol. 93, pp. 429\U457, 1946.

    <bibitem|woodward1953>P. M. Woodward, \PProbability and Information
    Theory,\Q McGraw-Hill Book Co., Inc., New York, N. Y., 1953.

    <bibitem|ville1948>J. A. Ville, \PThéorie et applications de la notion de
    signal analytique,\Q Cables et Transmissions, (2nd ed.) no. 1, pp.
    61\U74, 1948.

    <bibitem|james1950>James, Nichols, and Phillips, \PTheory of
    Servomechanisms,\Q M.I.T. Rad. Lab. Ser., McGraw-Hill Book Co., Inc., New
    York, N. Y., vol. 25, 1950.
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|7>>
    <associate|auto-6|<tuple|6|9>>
    <associate|auto-7|<tuple|7|11>>
    <associate|auto-8|<tuple|69|13>>
    <associate|bib-gabor1946|<tuple|gabor1946|13>>
    <associate|bib-james1950|<tuple|james1950|13>>
    <associate|bib-rice1944|<tuple|rice1944|13>>
    <associate|bib-titchmarsh1937|<tuple|titchmarsh1937|13>>
    <associate|bib-ville1948|<tuple|ville1948|13>>
    <associate|bib-woodward1953|<tuple|woodward1953|13>>
    <associate|cor:cross_power_spectrum|<tuple|12|7>>
    <associate|cor:frequency_response|<tuple|16|8>>
    <associate|cor:midband_independence|<tuple|7|5>>
    <associate|cor:uncorrelated|<tuple|11|6>>
    <associate|def:frequency_modulation|<tuple|19|11>>
    <associate|eq:F_convolution|<tuple|66|13>>
    <associate|eq:F_final|<tuple|69|13>>
    <associate|eq:Ic|<tuple|4|2>>
    <associate|eq:Is|<tuple|5|2>>
    <associate|eq:R_formula|<tuple|47|10>>
    <associate|eq:U_definition|<tuple|18|5>>
    <associate|eq:Z_in_terms_of_U|<tuple|67|13>>
    <associate|eq:amplitude_phase|<tuple|58|12>>
    <associate|eq:bessel_expansion|<tuple|64|12>>
    <associate|eq:bessel_integral|<tuple|55|11>>
    <associate|eq:convolution|<tuple|9|4>>
    <associate|eq:correlation_antisymmetry|<tuple|28|7>>
    <associate|eq:correlation_negative|<tuple|27|7>>
    <associate|eq:correlation_symmetry|<tuple|22|6>>
    <associate|eq:cross_correlation|<tuple|20|6>>
    <associate|eq:cross_correlation_computation|<tuple|24|6>>
    <associate|eq:cross_correlation_result|<tuple|26|6>>
    <associate|eq:cross_power_spectrum|<tuple|21|6>>
    <associate|eq:cross_power_spectrum_result|<tuple|29|7>>
    <associate|eq:double_hilbert_correlation|<tuple|30|7>>
    <associate|eq:envelope_convolution|<tuple|39|9>>
    <associate|eq:envelope_density|<tuple|43|10>>
    <associate|eq:envelope_equivalence|<tuple|16|4>>
    <associate|eq:envelope_formula|<tuple|46|10>>
    <associate|eq:envelope_squared_fourier|<tuple|36|8>>
    <associate|eq:filter_convolution|<tuple|33|8>>
    <associate|eq:filter_output_fourier|<tuple|35|8>>
    <associate|eq:fourier_pre_envelope|<tuple|17|5>>
    <associate|eq:frequency_modulation|<tuple|56|11>>
    <associate|eq:frequency_modulation_complex|<tuple|57|12>>
    <associate|eq:frequency_modulation_derivation|<tuple|63|12>>
    <associate|eq:frequency_response_output|<tuple|34|8>>
    <associate|eq:gaussian_density|<tuple|41|9>>
    <associate|eq:hilbert_alt|<tuple|23|6>>
    <associate|eq:hilbert_convolution|<tuple|10|4>>
    <associate|eq:hilbert_def|<tuple|7|3>>
    <associate|eq:hilbert_fourier|<tuple|8|3>>
    <associate|eq:instantaneous_phase|<tuple|59|12>>
    <associate|eq:joint_density|<tuple|42|10>>
    <associate|eq:joint_density_transformed|<tuple|52|11>>
    <associate|eq:magnitude_squared|<tuple|51|11>>
    <associate|eq:output_variance|<tuple|40|9>>
    <associate|eq:polar1|<tuple|53|11>>
    <associate|eq:polar2|<tuple|54|11>>
    <associate|eq:pre_envelope|<tuple|11|4>>
    <associate|eq:pre_envelope_autocorrelation|<tuple|32|7>>
    <associate|eq:pre_envelope_expansion|<tuple|12|4>>
    <associate|eq:rice_components|<tuple|3|2>>
    <associate|eq:rice_envelope|<tuple|6|2>>
    <associate|eq:rice_form|<tuple|1|2>>
    <associate|eq:rice_midband|<tuple|2|2>>
    <associate|eq:same_autocorrelation|<tuple|31|7>>
    <associate|eq:sigma_squared|<tuple|44|10>>
    <associate|eq:signum_function|<tuple|68|13>>
    <associate|eq:sine_expansion|<tuple|13|4>>
    <associate|eq:substitution1|<tuple|48|11>>
    <associate|eq:substitution2|<tuple|49|11>>
    <associate|eq:substitution_result|<tuple|50|11>>
    <associate|eq:u_inverse_fourier|<tuple|19|5>>
    <associate|eq:y_expansion|<tuple|65|13>>
    <associate|eq:z_components|<tuple|14|4>>
    <associate|eq:z_definition|<tuple|45|10>>
    <associate|eq:z_exponential|<tuple|15|4>>
    <associate|prop:bandlimited_envelope|<tuple|17|8>>
    <associate|prop:cross_correlation_hilbert|<tuple|10|6>>
    <associate|prop:filter_pre_envelope|<tuple|15|8>>
    <associate|prop:fourier_pre_envelope|<tuple|8|5>>
    <associate|prop:hilbert_convolution|<tuple|4|4>>
    <associate|prop:hilbert_cosine|<tuple|1|3>>
    <associate|prop:hilbert_double|<tuple|2|3>>
    <associate|prop:hilbert_fourier|<tuple|3|3>>
    <associate|prop:pre_envelope_autocorrelation|<tuple|14|7>>
    <associate|prop:pre_envelope_characterization|<tuple|9|5>>
    <associate|prop:same_spectrum|<tuple|13|7>>
    <associate|sec:definitions|<tuple|3|4>>
    <associate|sec:filters|<tuple|5|7>>
    <associate|sec:frequency|<tuple|7|11>>
    <associate|sec:hilbert|<tuple|2|3>>
    <associate|sec:probability|<tuple|6|9>>
    <associate|sec:properties|<tuple|4|5>>
    <associate|thm:envelope_density|<tuple|18|10>>
    <associate|thm:rice_equivalence|<tuple|6|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      rice1944

      rice1944

      titchmarsh1937

      gabor1946

      woodward1953

      ville1948

      titchmarsh1937

      rice1944

      rice1944
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Hilbert
      Transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Definitions
      and Main Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Properties
      of Pre-Envelopes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Application
      to Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Probability
      Density for Filter Output> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Application
      to Frequency Modulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>