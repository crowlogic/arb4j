<TeXmacs|2.1.2>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral characteristics of nonstationary random
  processes - a critical review>|<doc-author|<author-data|<author-name|G.
  Michaelov>|<author-affiliation|School of Engineering and Applied Science,
  The George Washington University, Washington, DC, 20052,
  USA>>>|<doc-author|<author-data|<author-name|S.
  Sarkani>|<author-affiliation|School of Engineering and Applied Science, The
  George Washington University, Washington, DC, 20052,
  USA>>>|<doc-author|<author-data|<author-name|L.D.
  Lutes>|<author-affiliation|Department of Civil Engineering, Texas A&M
  University, College Station, TX 77098, USA>>>|<doc-date|>|<doc-title-options|cluster-all>>

  <abstract-data|<\abstract>
    This article analyzes the approaches to defining "spectral
    characteristics" derived from the spectral functions of nonstationary
    random processes. The processes considered are those for which an
    evolutionary power spectrum as designated by Priestley can be defined.
    Two basic approaches to defining spectral characteristics are reviewed.
    The first, characterized as geometric, leads to Vanmarke's spectral
    moments, which have proven to be very useful characteristics for
    stationary processes. However, these moments may be infinite for
    nonstationary processes, which creates problems for applications. The
    second approach, viewed as nongcometric, is based on Di Paola's
    pre-envelope covariances. The advantages and deficiencies of both
    approaches are discussed. It is also shown that the nongeometric spectral
    characteristics can be directly defined from the frequency domain as
    integrals of the one-sided auto- and crossspectra of the evolutionary
    process and its derivatives. These nongeometric spectral characteristics
    are then used in defining parameters that characterize the central
    frequency and the bandwidth of evolutionary processes. To this end, the
    probability distributions of the process envelope are analyzed. It is
    demonstrated that suitable central frequencies and bandwidth factors can
    be defined from the probability density functions of the derivatives of
    the envelope and the phase. \<copyright\> 1999 Elsevier Science Ltd. All
    rights reserved.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.
    Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.
    Nonstationary processes with evolutionary power spectral density>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3. Spectral
    moments of stationary and evolutionary processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4. The
    pre-envelope for stationary and nonstationary processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5. Spectra of
    an evolutionary process and its derivatives>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6. Central
    frequency and bandwidth factor for evolutionary processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7. Concluding
    remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix A:
    Probability distribution of envelope and phase of evolutionary processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section*|1. Introduction>

  The probabilistic analysis of structural and mechanical vibrations deals
  with the description and characterization of structural loadings and
  response that are modeled as random processes. This characterization is not
  simple due to the complex mathematical structure of the response random
  process, which evolves both in probability distribution space and in time.
  From a strict probabilistic viewpoint, the complete description of a random
  process requires that joint probability density functions (PDFs) be
  specified over any given set of points in the time domain. Because such an
  approach is difficult to use in applications, random vibration analysis is
  quite often performed in the frequency domain. In this technique, spectral
  density functions - representing the distribution of power or energy over
  frequency - are most commonly used as random process descriptors. The most
  renowned among these descriptors is the power spectral density (PSD) of
  stationary processes. The relative ease with which PSDs of related
  processes can be computed, such as in obtaining the PSD of a derivative
  process or in determining the PSD of the response from the PSD of the
  loading, is not the only factor determining the popularity of the
  frequency-domain approach. A number of parameters derived from PSDs are
  also employed in the probabilistic assessment of structural failure - for
  example, to compute barrier crossing rates, or the distribution of peaks
  and extreme values.

  The parameters in question are, generally, the spectral moments - the
  moments of the onesided PSD with respect to the frequency origin. Since
  they were first introduced by Vanmarke<nbsp><cite|Vanmarke1972> the
  spectral moments have been perceived primarily as geometric characteristics
  of the PSD. Other frequency-domain parameters such as "central frequency"
  and "bandwidth factor" are also usually defined as geometric
  characteristics.

  Application of spectral methods, and spectral moments in particular, to
  nonstationary random processes, however, is more complicated than for
  stationary processes. One such difficulty is the definition of an
  appropriate power or energy spectrum. Unlike a stationary process, for
  which the PSD is the only such spectrum that makes physical sense, a
  nonstationary process allows various possibilities and approaches. Among
  the several nonstationary spectra defined are the energy spectrum, the
  double-frequency spectrum, the Weigner spectrum, and Priestley's
  evolutionary power spectrum. For a discussion of the advantages and
  disadvantages of the different nonstationary spectrum definitions the
  reader is referred to Bendat and Piersol<nbsp><cite|BendatPiersol1986>,
  Priestley<nbsp><cite|Priestley1988>, and
  Michaelov<nbsp><cite|Michaelov1997>. This paper will consider only
  evolutionary processes - those nonstationary processes for which an
  evolutionary power spectral density (EPSD) function can be defined - since
  these seem to be most important for applications of nonstationary
  stochastic models.

  There is no theoretical obstacle to applying the geometric definition of
  spectral characteristics to evolutionary processes. The moments are simply
  taken along the frequency coordinate of the EPSD, which is a two-parameter
  function of time and frequency. These transient spectral moments, however,
  have been proven to possess significant difficulties in some applications.
  Such difficulties were first reported by Corotis et
  al.<nbsp><cite|Corotis1972>, for the case of the transient response of a
  single-degree-of-freedom system (simple oscillator) to stationary Gaussian
  white noise. It was found that only the zero-order spectral moment exists.
  In particular, the integrals for the first and the second spectral moments
  were found to be unbounded. At the same time, all three of these spectral
  moments of the stationary response of the system - the process reached in
  the limit as time approaches infinity - are finite. For the particular case
  considered, Corotis et al.<nbsp><cite|Corotis1972> were able to avoid this
  difficulty by splitting the integrals of the spectral moments into
  convergent and nonconvergent parts and ignoring the nonconvergent parts
  altogether. Such an operation, however, is difficult enough even for the
  EPSD of the transient response to stationary white noise, which is
  undoubtedly the simplest nonstationary case of the response of simple
  oscillator. It is hardly possible to perform when the response is a result
  of a general evolutionary excitation.

  Probably the first to question the usefulness of the spectral moments for
  nonstationary processes was Di Paola<nbsp><cite|DiPaola1985>. Di Paola's
  approach to defining nonstationary spectral characteristics derives from
  the introduction of a new complex-valued random process. The real part of
  this "pre-envelope" process is equal to the original nonstationary process,
  while the imaginary part is an auxiliary random process related to the real
  part. Di Paola defined all spectral characteristics as the auto- and
  cross-covariances of the pre-envelope process and its derivatives. As a
  result, all spectral characteristics up to the order corresponding to the
  highest derivative with finite variance become finite. Di
  Paola<nbsp><cite|DiPaola1985> further demonstrated that when the process
  becomes stationary the resulting spectral characteristics are reduced to
  the well-known spectral moments. Unfortunately, his work has remained
  largely unused. In many recent publications, such as the random vibration
  texts of Nigam and Narayanan<nbsp><cite|NigamNarayanan1994> and Soong and
  Grigoriu<nbsp><cite|SoongGrigoriu1993> the only nonstationary spectral
  characteristics considered are the moments of the evolutionary spectrum.

  In this article, the problem of defining the spectral characteristics of an
  evolutionary process is analyzed again. Here, the concepts of "spectral
  moments" and "pre-envelope covariances" are presented, and the advantages
  and disadvantages of one definition over the other are examined. It will be
  demonstrated that Di Paola's spectral characteristics<nbsp><cite|DiPaola1985>
  can be introduced directly from the frequency domain, without resorting to
  the pre-envelope process. The time-domain interpretation of these spectral
  characteristics as covariances of the various derivatives of the
  preenvelope process is shown to be important because it allows
  investigation of bandwidth properties of evolutionary processes from a new
  perspective. This investigation is pursued by analyzing the probability
  distribution of the envelope and phase of an evolutionary process. Based on
  the probability distributions of the derivative processes of the envelope
  and the phase, the bandwidth properties of the evolutionary process are
  quantified and the appropriate definitions of the "central frequency" and
  "bandwidth factor" for evolutionary processes are given.

  For simplicity all processes considered in this study are taken to be
  zero-mean.

  <section*|2. Nonstationary processes with evolutionary power spectral
  density>

  A real-valued evolutionary process <math|X<around|(|t|)>>, as defined by
  Priestley<nbsp><cite|Priestley1965>, can be expressed in the general form
  of a Fourier-Stieltjes integral as

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><math-up|d>Z<around|(|\<omega\>|)><label|eq:1>
  </equation>

  in which <math|A<around|(|t,\<omega\>|)>> is a complex-valued deterministic
  amplitude modulating function and <math|Z<around|(|\<omega\>|)>> is a
  complex-valued random function, such that an "embedded" stationary process
  <math|X<rsub|s><around|(|t|)>> exists whose spectral decomposition is

  <\equation>
    X<rsub|S><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t><math-up|d>Z<around|(|\<omega\>|)><label|eq:2>
  </equation>

  For the process <math|X<around|(|t|)>> to be real, the complex modulating
  function must be such that <math|A<around|(|t,-\<omega\>|)>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>>,
  where * denotes complex-conjugate. Comparing Eq.<nbsp><eqref|eq:2> to the
  Fourier transform integral suggests an interpretation of
  <math|<math-up|d>Z<around|(|\<omega\>|)>=<wide|X|^><rsub|S><around|(|\<omega\>|)><math-up|d>\<omega\>>
  in which <math|<wide|X|^><rsub|S><around|(|\<omega\>|)>> is the Fourier
  transform of <math|X<rsub|S><around|(|t|)>>, but caution must be used since
  a stationary process does not have a Fourier transform in a mean-square
  sense. Of course, the Fouricr transform relationship which does exist for a
  stationary process is the one between the autocovariance function and the
  power spectral density (PSD), and this relationship holds for
  Eq.<nbsp><eqref|eq:2> if

  <\equation>
    E<around*|[|<with|math-font-family|rm|<nbsp>d>Z<around*|(|\<omega\><rsub|1>|)><math-up|d>Z<around*|(|\<omega\><rsub|2>|)>|]>=S<rsub|X*X><around*|(|\<omega\><rsub|1>|)>*\<delta\>*<around*|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)><math-up|d>\<omega\><rsub|1><with|math-font-family|rm|<nbsp>d>\<omega\><rsub|2><label|eq:3>
  </equation>

  in which <math|S<rsub|X*X><around|(|\<omega\>|)>> denotes the PSD of the
  stationary <math|X<rsub|S><around|(|t|)>> and
  <math|\<delta\><around|(|\<cdummy\>|)>> is Dirac's delta-function.

  Eq.<nbsp><eqref|eq:1> is a frequency-domain statement that an evolutionary
  process results when some stationary process <math|X<rsub|S><around|(|t|)>>
  passes through a time-variant deterministic filter with gain
  <math|A<around|(|t,\<omega\>|)>>. If <math|A<around|(|t,\<omega\>|)>> is
  slowly varying in time in comparison to the oscillations of
  <math|X<rsub|S><around|(|t|)>>, which is usually the case of practical
  interest, the spectral decomposition in Eq.<nbsp><eqref|eq:1> represents an
  instantaneous frequency decomposition of the
  process<nbsp><cite|Priestley1965>. There is no problem defining the
  evolutionary process even if the "slowly varying" condition is violated,
  but then the evolutionary spectral density would not give the frequency
  decomposition of the process, since it ignores the frequency content of
  <math|A<around|(|t,\<omega\>|)>>. Eq.<nbsp><eqref|eq:1> can also be
  expressed in the time domain through a convolution integral if the Fourier
  transform of <math|A<around|(|t,\<omega\>|)>*exp
  <around|(|i*\<omega\>*t|)>> along its <math|\<omega\>> coordinate exists.
  In particular if

  <\equation>
    a<around|(|t,\<tau\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>><math-up|d>\<omega\>
  </equation>

  <\equation>
    A<around|(|t,\<omega\>|)>*exp <around|(|i*\<omega\>*t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>a<around|(|t,\<tau\>|)>*e<rsup|i*\<omega\>*\<tau\>><math-up|d>\<tau\><label|eq:4>
  </equation>

  then the resulting expression for <math|X<rsub|S><around|(|t|)>> becomes

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>a<around|(|t,\<tau\>|)>*X<rsub|S><around|(|\<tau\>|)><math-up|d>\<tau\><label|eq:5>
  </equation>

  This expression is rarely used in practice, though, because
  Eq.<nbsp><eqref|eq:1> is more convenient in derivations. The evolutionary
  power spectral density (EPSD) of <math|X<around|(|t|)>> is defined as

  <\equation>
    G<rsub|X*X><around|(|t,\<omega\>|)>=<around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)><label|eq:6>
  </equation>

  At any given instant of time, the EPSD represents the spectral distribution
  of the instantaneous power of the process. Similarly, for a fixed
  frequency, the EPSD represents the time variation of the spectral amplitude
  associated with this frequency.

  For two processes, <math|X<around|(|t|)>> and <math|Y<around|(|t|)>>, that
  can be written in the form of Eq.<nbsp><eqref|eq:1>, an evolutionary
  cross-spectrum can be defined as

  <\equation>
    G<rsub|X*Y><around|(|t,\<omega\>|)>=A<rsub|X><rsup|\<ast\>><around|(|t,\<omega\>|)>*A<rsub|Y><around|(|t,\<omega\>|)>*S<rsub|X*Y><around|(|\<omega\>|)><label|eq:7>
  </equation>

  where <math|A<rsub|X><around|(|t,\<omega\>|)>> and
  <math|A<rsub|Y><around|(|t,\<omega\>|)>> are the modulating functions of
  the two processes, <math|S<rsub|X*Y><around|(|\<omega\>|)>> is the
  stationary cross-spectrum of the embedded stationary processes
  <math|X<rsub|S><around|(|t|)>> and <math|Y<rsub|S><around|(|t|)>>. Like a
  stationary PSD, the integral of <math|G<rsub|X*X><around|(|t,\<omega\>|)>>
  over the entire frequency range renders the transient variance of the
  process, <math|\<sigma\><rsub|X><rsup|2><around|(|t|)>> and the integral of
  <math|G<rsub|X*Y><around|(|t,\<omega\>|)>> gives the cross-covariance of
  the two evolutionary processes, <math|K<rsub|X*Y><around|(|t,t|)>>.

  It should be understood that EPSD does not apply to all nonstationary
  processes but only to those that allow representation in the form of
  Eq.<nbsp><eqref|eq:1>. Thus, the developments presented hereafter are
  strictly applicable to this nonstationary class only. Although this
  category of evolutionary processes is somewhat limiting, it contains a
  number of classes of nonstationary processes important in application.
  These include the modulated stationary processes, filtered modulated white
  noise, and modulated filtered white noise<nbsp><cite|NigamNarayanan1994>.
  Part of the interest these evolutionary processes hold for application is
  due exactly to the limitation of their definition. The reason for this is
  that for practical purposes a random loading must be evaluated from a
  limited number of recorded observations. Expectations can be computed from
  a single realization only for the ergodic processes, which by definition
  are stationary. In order to delegate ergodic properties to a nonstationary
  process, one must assume that the nonstationary behavior is due to some
  kind of deterministic departure from otherwise "perfect" stationarity. Such
  an assumption is incorporated into Eqs.<nbsp><eqref|eq:1>
  and<nbsp><eqref|eq:5>, which represent a superposition of two time
  variations: the first one deterministic, and the second one stochastic but
  stationary.

  Of particular interest are not only the statistical properties of the
  evolutionary <math|X<around|(|t|)>> but also the properties of its first
  derivative. By differentiating Eq.<nbsp><eqref|eq:1>, the latter can also
  be expressed in an evolutionary form as

  <\equation>
    <wide|X|\<dot\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|1><around|(|t,\<omega\>|)>*exp
    <around|(|i*\<omega\>*t|)><math-up|d>Z<around|(|\<omega\>|)><label|eq:9>
  </equation>

  where

  <\equation>
    A<rsub|1><around|(|t,\<omega\>|)>=<wide|A|\<dot\>><around|(|t,\<omega\>|)>+<around|(|i*\<omega\>|)>*A<around|(|t,\<omega\>|)><label|eq:10>
  </equation>

  is its modulating function. Accordingly, the autospectrum of
  <math|<wide|X|\<dot\>><around|(|t|)>> becomes

  <\equation>
    G<rsub|<wide|X|\<dot\>>*<wide|X|\<dot\>>><around|(|t,\<omega\>|)>=<around*|\||A<rsub|1><around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)><label|eq:11>
  </equation>

  and an evolutionary cross-spectrum of <math|X<around|(|t|)>> and
  <math|<wide|X|\<dot\>><around|(|t|)>> can be found from
  Eq.<nbsp><eqref|eq:7> as

  <\equation>
    G<rsub|X*<wide|X|\<dot\>>><around|(|t,\<omega\>|)>=G<rsub|<wide|X|\<dot\>>*X><rsup|\<ast\>><around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*A<rsub|<math-up|I>><around|(|t,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><label|eq:12>
  </equation>

  <section*|3. Spectral moments of stationary and evolutionary processes>

  The power spectral density <math|S<rsub|X*X><around|(|\<omega\>|)>> of a
  stationary process <math|X<rsub|S><around|(|t|)>> is an even function of
  <math|\<omega\>>, which allows the so-called "one-sided" PSD to be defined
  as <math|2*S<rsub|X*X><around|(|\<omega\>|)>> for positive (physical)
  frequencies only. The <math|n>th spectral moment is defined as the
  <math|n>th moment of this one-sided PSD, with respect to the frequency
  origin:

  <\equation>
    \<lambda\><rsub|n>=2*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|n>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|n>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:13>
  </equation>

  Vanmarke<nbsp><cite|Vanmarke1972>, who frist introduced
  Eq.<nbsp><eqref|eq:13>, suggested that the moments of the PSD should be
  used as frequency-domain (spectral) characteristics of a random process in
  exactly the same way that the moments of the PDF - the expectations - are
  used as time-domain characteristics of a random process.

  In addition to this purely geometric argument, there are at least two
  important reasons why the stationary spectral moments have gained
  popularity in stochastic analysis of vibration. The first is that each
  moment of order <math|2*j> is equal to the variance of the <math|j> th
  derivative of the process; that is,

  <\equation>
    \<sigma\><rsub|X<rsup|<around|(|j|)>>><rsup|2>=\<lambda\><rsub|2*j>=2*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2*j>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:14>
  </equation>

  in which <math|X<rsup|<around|(|j|)>>> denotes the <math|j> th derivative
  of <math|X<around|(|t|)>>. The advantage of Eq.<nbsp><eqref|eq:14> is that
  the variance of a derivative can be computed by integration in the
  frequency domain. This operation can even be carried out numerically, and
  for many applications it is much simpler than the alternative of
  differentiating a process's covariance in the time domain.

  The second important property of the spectral moments is that they can be
  used to define measures of the shape of the PSD in much the same way that
  moments are used in other engineering applications (for example, to
  characterize a beam's cross-section). The PSD shape measurement is deemed
  necessary because shape may be a good indicator of the oscillatory behavior
  of a process's time histories - including the two distinctive cases known
  as narrowband and broadband. The two parameters most commonly defined are a
  "central frequency" and a "bandwidth factor."

  The geometric arguments view the central frequency as the abscissa of the
  "mass" center of the one-sided PSD. Accordingly, a central frequency,
  <math|\<omega\><rsub|c>>, is expressed in terms of the first and zeroorder
  spectral moments as

  <\equation>
    \<omega\><rsub|c>=<frac|\<lambda\><rsub|1>|\<lambda\><rsub|0>><label|eq:15>
  </equation>

  In a complete PSD-PDF analogy, for which the one-sided PSD is normalized by
  <math|\<lambda\><rsub|0>> so that the area under its curve is unity,
  <math|\<omega\><rsub|c>> corresponds to the expected value obtained from
  the PDF.

  Similarly, a process's bandwidth can be quantified in terms of the PSD-PDF
  analogy for standard deviation. For comparative purposes, however, a
  dimensionless parameter is more useful and such a parameter can be found in
  the PSD analogy to the coefficient of variation. This is equal to

  <\equation>
    s=<frac|<sqrt|\<lambda\><rsub|2>/\<lambda\><rsub|0>-\<omega\><rsub|c><rsup|2>>|\<omega\><rsub|c>>=<sqrt|<frac|\<lambda\><rsub|0>*\<lambda\><rsub|2>|\<lambda\><rsub|1><rsup|2>>-1><label|eq:16>
  </equation>

  In geometric terms this is the "radius of gyration" of the spectral mass
  around its geometric center normalized by <math|\<omega\><rsub|c>>. This
  parameter, however, has the inconvenience of taking on very large values
  for very broadband cases; therefore, the most commonly used bandwidth
  factor is defined as

  <\equation>
    q=<frac|s|<sqrt|s<rsup|2>+1>>=<sqrt|1-<frac|\<lambda\><rsub|1><rsup|2>|\<lambda\><rsub|0>*\<lambda\><rsub|2>>><label|eq:17>
  </equation>

  which is always between zero and unity, as is evident from the Schwartz
  inequality. The parameter <math|q> defined in Eq.<nbsp><eqref|eq:17> tends
  to be low (closer to zero) for narrowband processes and high (close to
  unity) for broadband processes.

  It is a straightforward matter to extend the spectral moment definitions
  [Eq.<nbsp><eqref|eq:13>] to evolutionary processes since the EPSD, like the
  PSD of a stationary process, is a real-valued, even function of
  <math|\<omega\>>. Accordingly, the transient spectral moments of an
  evolutionary process <math|X<around|(|t|)>> are defined as the moments of
  its one-sided EPSD, i.e.

  <\equation>
    \<lambda\><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|n>*G<rsub|X*X><around|(|t,\<omega\>|)><math-up|d>\<omega\>=2*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|n>*G<rsub|X*X><around|(|t,\<omega\>|)><math-up|d>\<omega\><label|eq:18>
  </equation>

  The first property of stationary spectral moments - the equivalence of the
  even moments to the variance of the process and its derivatives - does not
  hold completely. Only the first spectral moment is equal to the variance of
  the process; all the other moments of even order are different from the
  variances of the process derivatives, i.e.

  <\equation>
    \<sigma\><rsub|X><rsup|2><around|(|t|)>=\<lambda\><rsub|0><around|(|t|)>*<space|1em>\<sigma\><rsub|X<rsup|<around|(|j|)>>><rsup|2><around|(|t|)>\<neq\>\<lambda\><rsub|2*j><around|(|t|)>*<space|1em><text|for
    >j\<gtr\>0<label|eq:19>
  </equation>

  The differences can be most easily seen for the variance of
  <math|<wide|X|\<dot\>><around|(|t|)>> when the expression for its EPSD is
  considered. Using Eqs.<nbsp><eqref|eq:9> and<nbsp><eqref|eq:10> yields

  <\equation>
    \<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>=\<lambda\><rsub|2><around|(|t|)>+2*<big|int><rsub|0><rsup|\<infty\>><around*|[|2*\<omega\><math-up|Im><around*|[|A<rsup|\<ast\>><around|(|t,\<omega\>|)>*<wide|A|\<dot\>><around|(|t,\<omega\>|)>|]>+<around|\||<wide|A|\<dot\>><around|(|t,\<omega\>|)>|\|><rsup|2>|]><math-up|d>\<omega\><label|eq:20>
  </equation>

  Evidently, the difference between the variance,
  <math|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>, and the
  second spectral moment, <math|\<lambda\><rsub|2><around|(|t|)>>, is due to
  terms that contain the furst derivative of the modulating function. Thus,
  one cannot compute <math|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>
  by simple integrations on <math|G<rsub|X*X><around|(|t,\<omega\>|)>>.
  However, if <math|A<around|(|t,\<omega\>|)>> is a slowly varying function
  of time, as is usually required for applied evolutionary processes,
  <math|<wide|A|\<dot\>><around|(|t,\<omega\>|)>> will be much smaller in
  magnitude than <math|A<around|(|t,\<omega\>|)>>. Therefore,
  <math|\<lambda\><rsub|2><around|(|t|)>> may dominate the right hand side of
  Eq.<nbsp><eqref|eq:20> and the variance of
  <math|<wide|X|\<dot\>><around|(|t|)>> may be approximated by the second
  spectral moment. This would surely constitute a convenience for
  applications if it were not for situations in which the integral for
  <math|\<lambda\><rsub|2><around|(|t|)>> becomes divergent while the exact
  <math|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>> is finite.

  Considering the second important feature of the stationary spectral
  moments, there is no conceptual obstacle to extending the geometric
  arguments to define the characteristics of the EPSD shape. Therefore, the
  transient spectral moments can bc used to define a "central frequency" and
  a "bandwidth factor" for the EPSD in a straightforward manner as

  <\equation>
    \<omega\><rsub|c><around|(|t|)>=<frac|\<lambda\><rsub|1><around|(|t|)>|\<lambda\><rsub|0><around|(|t|)>><label|eq:21>
  </equation>

  <\equation>
    q<around|(|t|)>=<sqrt|1-<frac|\<lambda\><rsub|1><around|(|t|)><rsup|2>|\<lambda\><rsub|0><around|(|t|)>*\<lambda\><rsub|2><around|(|t|)>>><label|eq:22>
  </equation>

  Note that, as with any other property of a nonstationary process, the
  central frequency and bandwidth of the EPSD are instantaneous properties.
  In other words, it should be acknowledged that a single process may be
  narrowband at one moment in time and broadband at another. Similarly, even
  if a process stays, for example, narrowband over extended time intervals,
  the predominant frequency may shift.

  It was already mentioned that a situation with divergent spectral moments
  was discovered by Corotis et al.<nbsp><cite|Corotis1972>, for one of the
  simplest cases of an evolutionary process. The investigators considered the
  response of a simple oscillator to stationary white noise which, being a
  time-variant filtering of a stationary process, is an evolutionary process.
  It was discovered that the transient spectral moments converge only for
  <math|n=0> and diverge for <math|n=1,2> while
  <math|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>> is finite. To
  overcome this difficulty the expressions containing the convergent terms of
  the integrals for the first and the second spectral moments were isolated
  and approximations of the spectral moments were computed by integrating the
  convergent terms only.

  Concerns with the application usefulness of the transient spectral moment
  and the spectral characteristics defined through Eqs.<nbsp><eqref|eq:21>
  and<nbsp><eqref|eq:22> do not arise from a conceptual viewpoint. Rather, it
  is situations like the one encountered by Corotis et
  al.<nbsp><cite|Corotis1972>, and the possibility that even low-order
  spectral moments are unbounded, that hamper the application of transient
  spectral moments. These difficulties cannot generally be resolved by an
  approach that removes nonconvergent parts from a complex function like the
  EPSD, because systematic procedures for identifying a function as
  nonconvergent do not exist. Moreover, there may be many ways to separate
  some complicated expression into the sum of two expressions. Different
  results will be obtained for the "convergent" part depending on the
  separation of terms which is used. It could even be that both of the
  separate terms are found to be divergent if a poor choice is used. That is
  why the problem of defining spectral characteristics (which are at least
  suitable to quantify bandwidth properties of evolutionary processes) needs
  to be approached from some other (nongeometric) viewpoint.

  Note also that use of the convergent parts of a transient spectral moment
  fundamentally changes the geometric basis of spectral characteristics as
  moments of the one-sided EPSD. Accordingly, the central frequency or the
  bandwidth factor computed by such a scheme would not have the strict
  geometric sense of its stationary counterparts, although they definitely
  can be used as bandwidth measures. This fact changes the whole perspective
  on spectral characteristics of nonstationary processes: it points out that
  these parameters may be defined in different ways, among which the spectral
  moments approach is not the most appropriate for application.

  <section*|4. The pre-envelope for stationary and nonstationary processes>

  The first to consider the problem of spectral characteristics from a
  nongeometric viewpoint was Di Paola<nbsp><cite|DiPaola1985>. The basic idea
  of his approach is to establish a time-domain interpretation of the
  spectral moments. Note that even the equivalence of a given even-order
  stationary spectral moment to the variance of a derivative of the process
  [Eq.<nbsp><eqref|eq:14>] cannot be considered as its true time-domain
  interpretation. This equivalence simply utilizes the symmetry of
  <math|\<omega\><rsup|2*j>*S<rsub|X*X><around|(|\<omega\>|)>> with respect
  to the origin of the frequency axis. For nonstationary spectral moments
  this symmetry can be applied only to the zero-order spectral moment of an
  EPSD which is equal to the variance of the corresponding evolutionary
  process.

  Di Paola noted that a one-sided spectrum is effectively a product of the
  usual PSD and the double Heaviside function. This, from a mathematical
  viewpoint, forms a convolution between the inverse Fourier transforms of
  the PSD and the Heaviside function. This convolution generates a
  complex-valued analytic process in the time domain. Di Paola demonstrated
  that the covariance structure of this process, which is the so-called
  "pre-envelope", introduced to the random vibration theory by
  Arens<nbsp><cite|Arens1957> and Dugundji<nbsp><cite|Dugundji1958>, can be
  used to establish time-domain interpretations of stationary spectral
  moments and that nonstationary spectral characteristics may be defined in
  an analogous way.

  The pre-envelope <math|\<Psi\><around|(|t|)>> of the nonstationary
  <math|X<around|(|t|)>> process is defined as a modulation of a preenvelope
  <math|\<Psi\><rsub|S><around|(|t|)>> for the stationary process
  <math|X<rsub|S><around|(|t|)>>. The stationary pre-envelope is defined as
  the complex process

  <\equation>
    \<Psi\><rsub|S><around|(|t|)>=X<rsub|S><around|(|t|)>+i*Y<rsub|S><around|(|t|)><label|eq:23>
  </equation>

  in which the real process <math|Y<rsub|S><around|(|t|)>> is the Hilbert
  transform of <math|X<rsub|S><around|(|t|)>>. The distinguishing
  characteristics of this pre-envelope are that its real part is the original
  stationary process <math|X<rsub|S><around|(|t|)>>, and its Fourier
  transform is one-sided, being zero for negative <math|\<omega\>> values.
  The latter property is easily verified from the frequency integral
  representation of the Hilbert transform:

  <\equation>
    Y<rsub|S><around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*\<omega\>*t|)><math-up|sgn><around|(|\<omega\>|)><math-up|d>Z<around|(|\<omega\>|)><label|eq:24>
  </equation>

  in which sgn(.) is the signum function. The corresponding time domain
  relationship is the convolution integral

  <\equation>
    Y<rsub|S><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|X<rsub|S><around|(|\<tau\>|)>|t-\<tau\>><math-up|d>\<tau\><label|eq:25>
  </equation>

  The one-sided Fourier transform of <math|\<Psi\><rsub|S><around|(|t|)>>
  also gives it a one-sided PSD, <math|S<rsub|\<Psi\>*\<Psi\>><around|(|\<omega\>|)>>.
  The nonstationary pre-envelope can be defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Psi\><around|(|t|)>>|<cell|=X<around|(|t|)>+i*Y<around|(|t|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<around|[|1+<math-up|sgn><around|(|\<omega\>|)>|]><math-up|d>Z<around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*exp
    <around|(|i*\<omega\>*t|)><math-up|d>Z<around|(|\<omega\>|)>>>>>><label|eq:26>
  </equation>

  The spectral decomposition of the pre-envelope <math|\<Psi\><around|(|t|)>>
  is quite similar to that of <math|X<around|(|t|)>> itself, but it exhibits
  power only within the positive frequency range. It may also be noted that
  the nonstationary "auxiliary" process <math|Y<around|(|t|)>> is not the
  Hilbert transform of <math|X<around|(|t|)>>, even though
  <math|Y<rsub|S<around|(|t|)>>> is the Hilbert transform of
  <math|X<rsub|S><around|(|t|)>>. Rather, <math|Y<around|(|t|)>> is the
  modulation of the stationary auxiliary process
  <math|Y<rsub|S><around|(|t|)>>,

  <\equation>
    Y<around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*\<omega\>*t|)>*A<around|(|t,\<omega\>|)><math-up|sgn><around|(|\<omega\>|)><math-up|d>Z<around|(|\<omega\>|)><label|eq:27>
  </equation>

  and it can be expressed in the time domain as

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>a<around|(|t,\<tau\>|)>*Y<rsub|S><around|(|\<tau\>|)><math-up|d>\<tau\>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|a<around|(|t,\<tau\>|)>*X<rsub|S><around|(|u|)>|\<tau\>-u><with|math-font-family|rm|<nbsp>d>u<with|math-font-family|rm|<nbsp>d>\<tau\><label|eq:28>
  </equation>

  The nonstationary envelope used by Di Paola for <math|X<around|(|t|)>> will
  be denoted by <math|V<around|(|t|)>>, and is defined as

  <\equation>
    V<around|(|t|)>=<around|\||\<Psi\><around|(|t|)>|\|>=<sqrt|X<rsup|2><around|(|t|)>+Y<rsup|2><around|(|t|)>><label|eq:29>
  </equation>

  Its covariance function can be written as

  <\equation>
    K<rsub|\<Psi\>*\<Psi\>><around*|(|t<rsub|1>,t<rsub|2>|)>=E*<around*|[|\<Psi\><rsup|\<ast\>><around*|(|t<rsub|1>|)>*\<Psi\><around*|(|t<rsub|2>|)>|]>=2*K<rsub|X*X><around*|(|t<rsub|1>,t<rsub|2>|)>+2*i*K<rsub|X*Y><around*|(|t<rsub|1>,t<rsub|2>|)><label|eq:30>
  </equation>

  where <math|K<rsub|X*X><around*|(|t<rsub|1>,t<rsub|2>|)>> and
  <math|K<rsub|X*Y><around*|(|t<rsub|1>,t<rsub|2>|)>> are the autocovariance
  of <math|X<around|(|t|)>>, and the cross-covariance of
  <math|X<around|(|t|)>> and <math|Y<around|(|t|)>>, respectively. These can
  be found as

  <\equation>
    K<rsub|X*X><around*|(|t<rsub|1>,t<rsub|2>|)>=E*<around*|[|X<rsup|\<ast\>><around*|(|t<rsub|1>|)>*X<around*|(|t<rsub|2>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*<around*|(|t<rsub|2>-t<rsub|1>|)>>*A<rsup|\<ast\>><around*|(|t<rsub|1>,\<omega\>|)>*A<around*|(|t<rsub|2>,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:31>
  </equation>

  and

  <\equation>
    K<rsub|X*Y><around*|(|t<rsub|1>,t<rsub|2>|)>=E*<around*|[|X<rsup|\<ast\>><around*|(|t<rsub|1>|)>*Y<around*|(|t<rsub|2>|)>|]>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*<around*|(|t<rsub|2>-t<rsub|1>|)>>*A<rsup|\<ast\>><around*|(|t<rsub|1>,\<omega\>|)>*A<around*|(|t<rsub|2>,\<omega\>|)><math-up|sgn><around|(|\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:32>
  </equation>

  Substituting Eqs.<nbsp><eqref|eq:31> and<nbsp><eqref|eq:32> into
  Eq.<nbsp><eqref|eq:30> results in

  <\equation>
    K<rsub|\<Psi\>*\<Psi\>><around*|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|[|i*\<omega\>*<around*|(|t<rsub|2>-t<rsub|1>|)>|]>*A<rsup|\<ast\>><around*|(|t<rsub|1>,\<omega\>|)>*A<around*|(|t<rsub|2>,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:33>
  </equation>

  and taking the above expression for <math|t<rsub|1>=t<rsub|2>=t> yields the
  variance of <math|\<Psi\><around|(|t|)>> as

  <\equation>
    \<sigma\><rsub|\<Psi\>><rsup|2><around|(|t|)>=K<rsub|\<Psi\>*\<Psi\>><around|(|t,t|)>=4*<big|int><rsub|0><rsup|\<infty\>><around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\>=4*<big|int><rsub|0><rsup|\<infty\>>G<rsub|X*X><around|(|t,\<omega\>|)><math-up|d>\<omega\>=2*\<sigma\><rsub|X><rsup|2><around|(|t|)><label|eq:34>
  </equation>

  which demonstrates that the variance of the pre-envelope is directly
  related to the integral of the one-sided EPSD. This is the result that
  prompted Di Paola and his co-workers<nbsp><cite|DiPaolaPetrucci1990|Muscolino1988|LutesSarkani1997>
  to investigate in detail the covariance structure of
  <math|\<Psi\><around|(|t|)>> and establish its association with
  frequencydomain integrals.

  To review the results achieved by Di Paola's investigation, consider the
  vector <math|\<Psi\><rsub|n><around|(|t|)>> formed by all derivatives of
  <math|\<Psi\><around|(|t|)>> up to order <math|n>, i.e.

  <\equation>
    \<Psi\><rsub|n><around|(|t|)>=<around*|[|\<Psi\><around|(|t|)>,<wide|\<Psi\>|\<dot\>><around|(|t|)>,<wide|\<Psi\>|\<ddot\>><around|(|t|)>,\<ldots\>,\<Psi\><rsup|<around|(|n|)>><around|(|t|)>|]><rsup|T><label|eq:35>
  </equation>

  The cross-covariance of any two derivatives
  <math|\<Psi\><rsup|<around|(|j|)>><around|(|t|)>> and
  <math|\<Psi\><rsup|<around|(|k|)>><around|(|t|)>> can be found as

  <\equation>
    K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around*|(|t<rsub|1>,t<rsub|2>|)>=<frac|\<partial\><rsup|j+k>*K<rsub|\<Psi\>*\<Psi\>><around*|(|t<rsub|1>,t<rsub|2>|)>|\<partial\>*t<rsub|1><rsup|j>*\<partial\>*t<rsub|2><rsup|k>>=4*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*<around*|(|t<rsub|2>-t<rsub|1>|)>>*A<rsub|j><rsup|\<ast\>><around*|(|t<rsub|1>,\<omega\>|)>*A<rsub|k><around*|(|t<rsub|2>,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:36>
  </equation>

  where the functions <math|A<rsub|j><around|(|t,\<omega\>|)>> are defined in
  a recurrent manner as

  <\equation>
    A<rsub|j><around|(|t,\<omega\>|)>=i*\<omega\>*A<rsub|j-1><around|(|t,\<omega\>|)>+<wide|A|\<dot\>><rsub|j-1><around|(|t,\<omega\>|)>,<space|1em>A<rsub|0><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)><label|eq:37>
  </equation>

  For a stationary <math|X<rsub|S><around|(|t|)>>

  <\equation>
    A<around|(|t,\<omega\>|)>=1,<space|1em>A<rsub|j><around|(|t,\<omega\>|)>=<around|(|i*\<omega\>|)><rsup|j><label|eq:38>
  </equation>

  Therefore, the cross-covariance relationship becomes

  <\equation>
    K<rsub|\<Psi\><rsub|S><rsup|<around|(|j|)>>*\<Psi\><rsub|S><rsup|<around|(|k|)>>><around|(|t<rsub|1>,t<rsub|2>|)>=K<rsub|\<Psi\><rsub|S><rsup|<around|(|j|)>>*\<Psi\><rsub|S><rsup|<around|(|k|)>>><around|(|\<tau\>|)>=4*<around|(|-1|)><rsup|j>*i<rsup|j+k>*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|j+k>*exp
    <around|[|i*\<omega\>*\<tau\>|]>*S<rsub|X*X><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:39>
  </equation>

  where <math|\<tau\>=t<rsub|2>-t<rsub|1>>. Setting <math|\<tau\>=0> gives

  <\equation>
    K<rsub|\<Psi\><rsub|S><rsup|<around|(|j|)>>*\<Psi\><rsub|S><rsup|<around|(|k|)>>><around|(|0|)>=2*<around|(|-1|)><rsup|j>*i<rsup|j+k>*\<lambda\><rsub|j+k><label|eq:40>
  </equation>

  where the <math|\<lambda\><rsub|j+k>> are the stationary spectral moments
  of Eq.<nbsp><eqref|eq:13>. Thus, the higher order spectral moments in the
  stationary case are proportional to the autocovariances and
  cross-covariances of the derivatives of the pre-envelope. From
  Eq.<nbsp><eqref|eq:40> the spectral moments arc expressed as

  <\equation>
    \<lambda\><rsub|j+k>=<frac|<around|(|-1|)><rsup|k>*i<rsup|j+k>|2>*K<rsub|\<Psi\><rsub|S><rsup|<around|(|j|)>>*\<Psi\><rsub|S><rsup|<around|(|k|)>>><around|(|0|)><label|eq:41>
  </equation>

  For the first three stationary moments, this formula yields

  <\equation>
    \<lambda\><rsub|0>=0.5*K<rsub|\<Psi\><rsub|S>*\<Psi\><rsub|S>><around|(|0|)>,<space|1em>\<lambda\><rsub|1>=-0.5*i*K<rsub|\<Psi\><rsub|S>*<wide|\<Psi\>|\<dot\>><rsub|S>><around|(|0|)>,<space|1em>\<lambda\><rsub|2>=0.5*K<rsub|<wide|\<Psi\>|\<dot\>><rsub|S>*<wide|\<Psi\>|\<dot\>><rsub|S>><around|(|0|)><label|eq:42>
  </equation>

  Based on these direct relationships between pre-envelope covariances and
  spectral moments in the stationary case, Di Paola<nbsp><cite|DiPaola1985>
  suggested that "spectral moments" for evolutionary processes should be
  defined by an analog of Eq.<nbsp><eqref|eq:41>. In particular, the
  time-dependent spectral characteristics are simply

  <\equation>
    c<rsub|j*k><around|(|t|)>=<frac|<around|(|-1|)><rsup|k>*i<rsup|j+k>|2>*K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)><label|eq:43>
  </equation>

  Note that in the nonstationary case two indices are needed to distinguish
  the spectral parameters from one another since
  <math|K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)>>
  is not a function of <math|j+k>, as was true in the stationary case.

  It can be easily seen that the <math|c<rsub|j*k><around|(|t|)>> from
  Eq.<nbsp><eqref|eq:43> - strictly defined as time-domain covariances \Ucan
  also be given a frequency-domain interpretation. These parameters are
  zero-order moments of the one-sided auto- and cross-spectra of the process
  <math|X<around|(|t|)>> and its derivatives. In particular, for the first
  four spectral characteristics one can write

  <\align>
    <tformat|<table|<row|<cell|c<rsub|00><around|(|t|)>>|<cell|=<frac|1|2>K<rsub|\<Psi\>*\<Psi\>><around|(|t,t|)>=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|X*X><around|(|t,\<omega\>|)><math-up|d>\<omega\>=\<sigma\><rsub|X><rsup|2><around|(|t|)>>>|<row|<cell|c<rsub|11><around|(|t|)>>|<cell|=<frac|1|2>*K<rsub|<wide|\<psi\>|\<dot\>><wide|\<psi\>|\<dot\>>><around|(|t,t|)>=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|<wide|X|\<dot\>>*<wide|X|\<dot\>>><around|(|t,\<omega\>|)><math-up|d>\<omega\>=\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>|<row|<cell|c<rsub|01><around|(|t|)>>|<cell|=c<rsub|10><rsup|\<ast\>><around|(|t|)>=-<frac|1|2>*i*K<rsub|\<Psi\>*<wide|\<psi\>|\<dot\>>><around|(|t,t|)>=-2*i*<big|int><rsub|0><rsup|\<infty\>>G<rsub|X*<wide|X|\<dot\>>><around|(|t,\<omega\>|)><math-up|d>\<omega\><eq-number><label|eq:44>>>>>
  </align>

  <section*|5. Spectra of an evolutionary process and its derivatives>

  As previously noted, the problem with the spectral characteristics defined
  by Di Paola<nbsp><cite|DiPaola1985> is not mathematical, but may be related
  to interpretation. The introduction of the complex pre-envelope process is
  not intuitively obvious, and this may be the major factor inhibiting
  widespread adoption of this model to characterize evolutionary processes.
  On the other hand, it is intuitively obvious that all the spectral
  properties of an evolutionary process and its derivatives must be reflected
  in the autospectra and cross-spectra of those processes. It is, thus, quite
  possible to define spectral characteristics of an evolutionary process
  based on computations with these spectra, without ever defining a
  pre-envelope<nbsp><cite|Michaelov1997>. This approach will be reviewed
  here.

  The auto- and cross-spectra for a stationary <math|X<rsub|S><around|(|t|)>>
  process can be expressed in terms of the PSD
  <math|S<rsub|X*X><around|(|\<omega\>|)>> as

  <\equation>
    S<rsub|X<rsup|<around|(|j|)>>*X<rsup|<around|(|k|)>>><around|(|\<omega\>|)>=<around|(|-1|)><rsup|j>*i<rsup|j+k>*\<omega\><rsup|<around|(|j+k|)>>*S<rsub|X*X><around|(|\<omega\>|)><label|eq:45>
  </equation>

  Clearly the right-hand side of this equation contains the
  <math|\<omega\><rsup|n>*S<rsub|X*X><around|(|\<omega\>|)>> term which is
  needed in Eq.<nbsp><eqref|eq:13> in defining the stationary spectral
  moments. Thus, one can rewrite the expression for these moments as

  <\equation>
    \<lambda\><rsub|j+k>=<around|(|-1|)><rsup|k>*i<rsup|j+k>*2*<big|int><rsub|0><rsup|\<infty\>>S<rsub|X<rsup|<around|(|j|)>>*X<rsup|<around|(|k|)>>><around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:46>
  </equation>

  Therefore, based on exactly the same arguments as those presented in the
  previous section, one can define nonstationary spectral characteristics as

  <\equation>
    c<rsub|j*k><around|(|t|)>=<around|(|-1|)><rsup|k>*i<rsup|j+k>*2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|X<rsup|<around|(|j|)>>*X<rsup|<around|(|k|)>>><around|(|t,\<omega\>|)><math-up|d>\<omega\><label|eq:47>
  </equation>

  It can be seen that the <math|c<rsub|j*k><around|(|t|)>> from
  Eq.<nbsp><eqref|eq:47> are identical to those defined by Di
  Paola<nbsp><cite|DiPaola1985> in Eq.<nbsp><eqref|eq:43>. This is confirmed
  by an examination of Eq.<nbsp><eqref|eq:44> for the first four spectral
  characteristics. The present approach is definitely simpler than the one
  based on pre-envelope covariances, yet the arguments for both definitions
  are similar. Note also that it is not easy [although it is not impossible,
  if one considers the auxiliary process <math|Y<around|(|t|)>> from
  Eq.<nbsp><eqref|eq:26>] to deduce the time-domain interpretation
  [Eq.<nbsp><eqref|eq:43>] from Eq.<nbsp><eqref|eq:47>. At the same time,
  Eq.<nbsp><eqref|eq:44> demonstrates that it is relatively easy to deduce
  the frequency-domain definition [Eq.<nbsp><eqref|eq:47>] from the
  time-domain definition [Eq.<nbsp><eqref|eq:43>].

  <section*|6. Central frequency and bandwidth factor for evolutionary
  processes>

  The previous two sections demonstrate that spectral characteristics for
  nonstationary processes can be consistently defined without geometric
  analogics. Moreover, both time-domain and fre-quency-domain interpretation
  of the nongeometric spectral characteristics have been established. It has
  been demonstrated that these nongeometric spectral characteristics include
  the variance of the nonstationary response and its derivatives, with
  <math|c<rsub|k*k><around|(|t|)>> being the variance of
  <math|X<rsup|<around|(|k|)>><around|(|t|)>>. Also the characteristics
  become identical to spectral moments for the special case of a stationary
  process, for which such spectral moments have been found to be very useful.
  The major motivation for using these alternative evolutionary spectral
  characteristics, of course, is their convergence, with
  <math|c<rsub|j*k><around|(|t|)>> being convergent so long the variances of
  <math|X<rsup|<around|(|j|)>><around|(|t|)>> and
  <math|X<rsup|<around|(|k|)>><around|(|t|)>> are finite. However, it is not
  clear why and how the <math|c<rsub|j*k><around|(|t|)>> values can be used
  to define physical concepts such as "central frequency" and "bandwidth" of
  evolutionary processes. In particular, it is known that concepts from
  stationary processes may not work impeccably when directly applied to
  nonstationary processes, as demonstrated by the nonconvergent evolutionary
  spectral moments. These topics of central frequency and bandwidth factor
  will now be investigated.

  As was already pointed out, the geometric bandwidth characteristics of the
  PSD of a stationary process are directly related to the characteristic
  signature of the time histories of a random process; that is, they reveal
  weather the process is narrowband or broadband, low-frequency or
  highfrequency. Because of this relationship, "central frequency" and
  "bandwidth factor" are worth investigating from a perspective other than
  one that relies on the geometric properties of the EPSD shape. Based on
  this perspective, one can then evaluate the most appropriate definition of
  nonstationary spectral characteristics. This approach, which one may deem
  "physical" as compared to the "geometric" approach, is considered in the
  following part of the article.

  A perspective on bandwidth and central frequency can certainly be gained
  from an investigation of the envelope and phase of an evolutionary process.
  The envelope <math|V<around|(|t|)>> was already defined in a previous
  section as the modulus of the complex-valued pre-envelope process
  <math|\<Psi\><around|(|t|)>> [Eq.<nbsp><eqref|eq:29>]. This definition also
  suggests that the processes <math|X<around|(|t|)>> and
  <math|Y<around|(|t|)>> can be expressed in the form of

  <\equation>
    X<around|(|t|)>=V<around|(|t|)>*cos <around|(|U<around|(|t|)>|)><label|eq:48>
  </equation>

  and

  <\equation>
    Y<around|(|t|)>=V<around|(|t|)>*sin <around|(|U<around|(|t|)>|)><label|eq:49>
  </equation>

  where <math|U<around|(|t|)>> is the phase process. The bandwidth properties
  of <math|X<around|(|t|)>> would be reflected in the properties of
  <math|V<around|(|t|)>> and <math|U<around|(|t|)>>. For a narrowband,
  stationary <math|X<around|(|t|)>>, for example, both the amplitude
  <math|V<around|(|t|)>> and the phase <math|U<around|(|t|)>> would be
  "slowly varying", the former around some average amplitude and the latter
  around some <math|\<omega\><rsub|c>*t>, where <math|\<omega\><rsub|c>> has
  the meaning of central frequency. That is why it is worth investigating the
  probability structure of <math|V<around|(|t|)>> and <math|U<around|(|t|)>>
  from which the parameters quantifying these "slowly-varying" behaviors can
  be deduced.

  Before beginning this investigation, it is worth noting that an envelope of
  <math|X<around|(|t|)>> can be defined for some auxiliary process
  <math|Y<around|(|t|)>> which is not necessarily equal to the one presented
  in Eq.<nbsp><eqref|eq:26>. Accordingly, for each particular
  <math|Y<around|(|t|)>> there will be different probability distribution of
  the envelope and the phase, which will result in different formulas for the
  central frequency and the bandwidth factor. For stationary processes, all
  <math|Y<rsub|S<around|(|t|)>>> suitable for envelope definition can be
  written as<nbsp><cite|LutesSarkani1997>

  <\equation>
    Y<rsub|S><around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|[|i*\<omega\>*t|]>*g<around|(|\<omega\>|)><math-up|d>Z<around|(|\<omega\>|)><label|eq:50>
  </equation>

  in which <math|g<around|(|\<omega\>|)>> is a real-valued odd function of
  <math|\<omega\>>. Such a function has two important properties for the
  envelope definition: (1) <math|X<rsub|S<around|(|t|)>>> and
  <math|Y<rsub|S<around|(|t|)>>> are uncorrelated and (2)
  <math|<wide|X|\<dot\>><rsub|S<around|(|t|)>>> and
  <math|<wide|Y|\<dot\>><rsub|S><around|(|t|)>> are uncorrelated. When the
  processes are Gaussian the lack of correlation also assures the statistical
  independence of <math|X<rsub|S><around|(|t|)>> from
  <math|Y<rsub|S><around|(|t|)>> and of <math|<wide|X|\<dot\>><rsub|S><around|(|t|)>>
  from <math|<wide|Y|\<dot\>><rsub|S><around|(|t|)>>. Furthermore,
  <math|g<around|(|\<omega\>|)>> is also usually required to be such that (3)
  <math|X<rsub|S<around|(|t|)>>> and <math|Y<rsub|S><around|(|t|)>> have the
  same variance and (4) <math|<wide|X|\<dot\>><rsub|S<around|(|t|)>>> and
  <math|<wide|Y|\<dot\>><rsub|S><around|(|t|)>> have the same variance. If
  the process <math|X<rsub|S><around|(|t|)>> is narrowband, the last two
  conditions can be satisfied if <math|g<around|(|\<omega\>|)>> is required
  to be equal to 1 in the neighborhood of the central frequency
  <math|\<omega\><rsub|c>>. Mathematically, the four conditions for the
  auxiliary process <math|Y<rsub|S><around|(|t|)>> are

  <\equation>
    E<around*|[|X<rsub|S<around*|(|t|)>>Y<rsub|S<around*|(|t|)>>|]>=0
  </equation>

  <\equation>
    E<around*|[|<wide|X|\<dot\>><rsub|S<around*|(|t|)>><wide|Y|\<dot\>><rsub|S<around*|(|t|)>>|]>=0<label|eq:51>
  </equation>

  <\equation>
    \<sigma\><rsub|X><rsup|2>=\<sigma\><rsub|Y><rsup|2>
  </equation>

  <\equation>
    \<sigma\><rsub|<wide|X|\<dot\>>><rsup|2>=\<sigma\><rsub|<wide|Y|\<dot\>>><rsup|2>
  </equation>

  Many functions <math|g<around|(|\<omega\>|)>> can satisfy the four
  requirements in Eq.<nbsp><eqref|eq:51> for a stationary auxiliary process.
  The simplest choice is <math|g<around|(|\<omega\>|)>=<math-up|sgn><around|(|\<omega\>|)>>,
  which corresponds to the Hilbert transform of
  <math|X<rsub|S><around|(|t|)>>. Another popular choice for narrowband
  processes is <math|g<around|(|\<omega\>|)>=\<omega\>/\<omega\><rsub|t>>,
  which gives and results in the so-called "energy-based" envelope. Other
  possible choices for a narrowband process are
  <math|g<around|(|\<omega\>|)>=<around*|(|\<omega\>/\<omega\><rsub|c>|)><rsup|n>>
  with <math|n> odd. These correspond to a <math|Y<rsub|S><around|(|t|)>>
  that is proportional to an odd-order derivative of
  <math|X<rsub|S><around|(|t|)>>.

  The situation, however, is not as simple for evolutionary processes as it
  is for stationary. To be sure, one can define a generalized evolutionary
  <math|Y<around|(|t|)>> as

  <\equation>
    Y<around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*g<around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:52>
  </equation>

  whose time derivative is found as

  <\equation>
    <wide|Y|\<dot\>><around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|1><around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*g<around|(|\<omega\>|)><math-up|d>\<omega\><label|eq:53>
  </equation>

  Similar to the stationary situation, the above choice assures that (1) and
  (2) in Eq.<nbsp>(<reference|eq:51>) with stationary
  <math|X<rsub|S><around|(|t|)>> and <math|Y<rsub|S><around|(|t|)>> replaced
  by the corresponding evolutionary <math|X<around|(|t|)>> and
  <math|Y<around|(|t|)>> are satisfied. It is not possible, however, to
  assure that (3) and (4) are satisfied in general for arbitrary
  <math|A<around|(|t,\<omega\>|)>> and <math|S<rsub|X*X><around|(|\<omega\>|)>>.
  The only choice that obviously satisfies all conditions in
  Eq.<nbsp><eqref|eq:51> is <math|g<around|(|\<omega\>|)>=<math-up|sgn><around|(|\<omega\>|)>>,
  which results in the <math|Y<around|(|t|)>> already defined in
  Eq.<nbsp><eqref|eq:26>. Thus, the modulated Hilbert transform
  [Eq.<nbsp><eqref|eq:26>] is the only desirable choice for defining the
  envelope of an evolutionary process. The definitions of "central frequency"
  and "bandwidth factor" that would result from the envelope corresponding to
  Eq.<nbsp><eqref|eq:26> are the reasonable choices for the evolutionary
  processes. Accordingly, this is the situation considered here.

  The interest hereafter is in the marginal probability distributions of the
  envelope, <math|V<around|(|t|)>>, the phase, <math|U<around|(|t|)>>, and
  their derivatives, <math|<wide|V|\<dot\>><around|(|t|)>> and
  <math|<wide|U|\<dot\>><around|(|t|)>>. For a stationary Gaussian
  <math|X<rsub|S><around|(|t|)>> these distributions are readily available in
  the literature. The expressions are independent of time and can be written
  as<nbsp><cite|Sveshnikov1966>

  <\align>
    <tformat|<table|<row|<cell|p<rsub|V<rsub|S>><around|(|\<nu\>|)>>|<cell|=<frac|\<nu\>|\<sigma\><rsub|X><rsup|2>>*e<rsup|-<frac|\<nu\><rsup|2>|2*\<sigma\><rsub|X><rsup|2>>>*<space|10em>\<forall\>0\<leqslant\>\<nu\>\<leqslant\>\<infty\><eq-number><label|eq:54>>>|<row|<cell|p<rsub|U<rsub|S>><around|(|u|)>>|<cell|=<frac|1|2*\<pi\>>*<space|13em>\<forall\>0\<leqslant\>u\<leqslant\>2*\<pi\><eq-number><label|eq:55>>>|<row|<cell|p<rsub|<wide|V|\<dot\>><rsub|S>><around|(|<wide|\<nu\>|\<dot\>>|)>>|<cell|=<frac|1|<sqrt|2*\<pi\>>*\<sigma\><rsub|<wide|X|\<dot\>>>*q>*e<rsup|-<frac|<wide|\<nu\>|\<dot\>><rsup|2>|2*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2>*q<rsup|2>>><space|7em>\<forall\>-\<infty\>\<leqslant\><wide|\<nu\>|\<dot\>>\<leqslant\>\<infty\><eq-number><label|eq:56>>>|<row|<cell|p<rsub|<wide|U|\<dot\>><rsub|S>><around|(|<wide|u|\<dot\>>|)>>|<cell|=<frac|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2>*q<rsup|2>|\<sigma\><rsub|X><rsup|2>>*<around*|[|<frac|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2>*q<rsup|2>|\<sigma\><rsub|X><rsup|2>>+<around*|(|<wide|u|\<dot\>>-\<omega\><rsub|c>|)><rsup|2>|]><rsup|-<frac|3|2>><space|2em>\<forall\>-\<infty\>\<leqslant\><wide|u|\<dot\>>\<leqslant\>\<infty\><eq-number><label|eq:57>>>>>
  </align>

  In these equations, <math|\<sigma\><rsub|X><rsup|2>,\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2>,\<omega\><rsub|c>>,
  and <math|q> are the variance of <math|X<rsub|S><around|(|t|)>>, the
  variance of <math|<wide|X|\<dot\>><rsub|S><around|(|t|)>>, the central
  frequency defined in Eq.<nbsp><eqref|eq:15>, and the bandwidth factor
  defined in Eq.<nbsp><eqref|eq:17>, respectively. Among the four PDFs,
  Eq.<nbsp><eqref|eq:54> demonstrates that the envelopc,
  <math|V<rsub|S><around|(|t|)>>, is Rayleigh distributed and
  Eq.<nbsp><eqref|eq:55> shows that the phase,
  <math|U<rsub|S><around|(|t|)>>, is uniformly distributed, over the interval
  <math|<around|[|0,2*\<pi\>|]>>. In neither of these equations, however, do
  the parameters <math|\<omega\><rsub|c>> and <math|q> appear.

  The central frequency appears in the PDF of
  <math|<wide|U|\<dot\>><rsub|S><around|(|t|)>> only. Examination of
  <math|p<rsub|<wide|U|\<dot\>><rsub|S>><around|(|<wide|u|\<dot\>>|)>>
  reveals that it is symmetric with respect to <math|\<omega\><rsub|c>>. Thus
  the mean value of <math|<wide|U|\<dot\>><rsub|s><around|(|t|)>> is

  <\equation>
    E<around*|[|<wide|U|\<dot\>><rsub|S><around|(|t|)>|]>=\<omega\><rsub|c><label|eq:58>
  </equation>

  which can be considered to be the definition of <math|\<omega\><rsub|c>>.
  The central frequency is, in fact, the mean value of the phase derivative.

  The bandwidth factor appears in the PDFs of both
  <math|<wide|V|\<dot\>><rsub|S><around|(|t|)>> and
  <math|<wide|U|\<dot\>><rsub|S><around|(|t|)>>. Eq.<nbsp><eqref|eq:56> shows
  that the distribution of <math|<wide|V|\<dot\>><rsub|S<around|(|t|)>>> is
  Gaussian with mean zero and with standard deviation equal to
  <math|\<sigma\><rsub|<wide|X|\<dot\>>>*q>. Thus, the bandwidth factor of a
  stationary Gaussian process scales the standard deviation of the derivative
  of its envelope. For fixed values of other parameters such as
  <math|\<sigma\><rsub|X>> and <math|\<sigma\><rsub|<wide|X|\<dot\>>>>, a
  process having a lower bandwidth factor also has a smaller variance of
  <math|<wide|V|\<dot\>><rsub|S><around|(|t|)>>. Therefore, the PDF of
  <math|<wide|V|\<dot\>><rsub|S><around|(|t|)>> is more bounded around its
  (zero) mean value, and there is very little probability that
  <math|<wide|V|\<dot\>><rsub|S><around|(|t|)>> takes on large values. Since
  its derivative is small, the amplitude of the process,
  <math|V<rsub|S><around|(|t|)>>, cannot change drastically over short
  periods of time in any time history. That is,
  <math|V<rsub|S><around|(|t|)>> must be slowly varying.

  Similar considerations hold for the PDF of
  <math|<wide|U|\<dot\>><rsub|S><around|(|t|)>>. Even though the second
  moment, <math|E<around*|[|<wide|U|\<dot\>><rsub|S><rsup|2><around|(|t|)>|]>>
  and, as a result, the standard deviation,
  <math|\<sigma\><rsub|<wide|U|\<dot\>><rsub|S>>>, are unbounded it can be
  seen that the dispersion of this PDF around its mean value is again
  controlled by the <math|q> factor (for fixed <math|\<sigma\><rsub|X>> and
  <math|\<sigma\><rsub|<wide|X|\<dot\>>>> ). Thus, the probability that
  <math|<wide|U|\<dot\>><around|(|t|)>> deviates from the mean
  <math|\<omega\><rsub|c>> is lower for a process with lower <math|q> factor.
  As a result, a time history of the phase <math|U<rsub|S><around|(|t|)>>
  would also be slowly varying around <math|\<omega\><rsub|c>*t>.

  Thus, the bandwidth factor of a stationary Gaussian process can be
  quantified from the dispersion of the probability distributions of the
  derivatives of the envelope and the phase,
  <math|<wide|V|\<dot\>><rsub|S><around|(|t|)>> and
  <math|<wide|U|\<dot\>><rsub|S><around|(|t|)>>, respectively. It should be
  noted, though, that the bandwidth factor can be considered a characteristic
  of <math|X<rsub|S><around|(|t|)>> just as much as it is a characteristic of
  <math|<wide|X|\<dot\>><rsub|S><around|(|t|)>>.

  It seems advantageous to identify the definitions suitable for "central
  frequency" and "bandwidth factor" for evolutionary processes based on an
  analysis similar to that given for stationary processes. The probability
  distributions of the envelope and the phase of an evolutionary Gaussian
  <math|X<around|(|t|)>> with auxiliary <math|Y<around|(|t|)>> in the form of
  Eq.<nbsp><eqref|eq:26> have been studied by a number of investigators
  (e.g.<nbsp><cite|Muscolino1988|Yang1972>). The expressions of all marginal
  PDFs, however, are usually not provided. For completeness and to present
  the PDFs in the form most appropriate for this analysis, a technique for
  deriving all formulas of interest is presented in Appendix A. The
  corresponding marginal PDFs are

  <\align>
    <tformat|<table|<row|<cell|p<rsub|V><around|(|\<nu\>,t|)>>|<cell|=<frac|v|\<sigma\><rsub|X><rsup|2><around|(|t|)>>*exp
    <around*|(|-<frac|v<rsup|2>|2*\<sigma\><rsub|X><rsup|2><around|(|t|)>>|)><eq-number><label|eq:59>>>|<row|<cell|p<rsub|U><around|(|u,t|)>>|<cell|=<frac|1|2*\<pi\>>*<space|1em>0\<leqslant\>u\<leqslant\>2*\<pi\><eq-number><label|eq:60>>>>>
  </align>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|p<rsub|<wide|V|\<dot\>>><around|(|<wide|\<nu\>|\<dot\>>,t|)>>|<cell|=<frac|\<Delta\><around|(|t|)>e<rsup|-<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>*<wide|\<nu\>|\<dot\>><rsup|2>|2*<around*|(|\<Delta\><rsup|2><around|(|t|)>+\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>|<sqrt|2*\<pi\>>*<around*|(|\<Delta\><rsup|2><around|(|t|)>+\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|)>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>*>>|<row|<cell|>|<cell|\<times\><around*|{|e<rsup|-<frac|<sqrt|2*\<pi\>>*\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)><wide|\<nu\>|\<dot\>>|2*<around*|(|\<Delta\><rsup|2><around|(|t|)>+\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>>+<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)><wide|\<nu\>|\<dot\>>
    \<Phi\><around*|(|<frac|<sqrt|\<Delta\><rsup|2><around|(|t|)>+\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>|>|)>|<sqrt|\<Delta\><rsup|2><around|(|t|)>+\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>>|}>>>>>><label|eq:61>
  </equation>

  <\equation>
    p<rsub|<wide|U|\<dot\>>><around|(|<wide|u|\<dot\>>,t|)>=<frac|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>|2*\<sigma\><rsub|X><rsup|2><around|(|t|)>>*<around*|[|<frac|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>|\<sigma\><rsub|X><rsup|2><around|(|t|)>>+<around|(|<wide|u|\<dot\>>-\<Omega\><around|(|t|)>|)><rsup|2>|]><rsup|-<frac|3|2>><label|eq:62>
  </equation>

  In the above equations, <math|\<sigma\><rsub|X><rsup|2><around|(|t|)>,\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>,
  and <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>> are the
  nonstationary variances and correlation coefficient of
  <math|X<around|(|t|)>> and <math|<wide|X|\<dot\>><around|(|t|)>>. The other
  two parameters appearing in the expressions are

  <\equation>
    \<Omega\><around|(|t|)>=<frac|Q<around|(|t|)>|\<sigma\><rsub|X><rsup|2><around|(|t|)>><label|eq:63>
  </equation>

  and

  <\equation>
    \<Delta\><around|(|t|)>=<sqrt|1-<frac|R<rsup|2><around|(|t|)>+Q<rsup|2><around|(|t|)>|\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>=<sqrt|1-\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>-\<rho\><rsub|X*<wide|Y|\<dot\>>><rsup|2><around|(|t|)>><label|eq:64>
  </equation>

  where <math|R<around|(|t|)>\<equiv\>K<rsub|X*<wide|X|\<dot\>>><around|(|t,t|)>>
  is the covariance of <math|X<around|(|t|)>> and
  <math|<wide|X|\<dot\>><around|(|t|)>> and
  <math|Q<around|(|t|)>\<equiv\>K<rsub|X*<wide|Y|\<dot\>>><around|(|t,t|)>>
  and <math|\<rho\><rsub|X*<wide|Y|\<dot\>>><around|(|t|)>> are the
  covariance and the correlation coefficient of <math|X<around|(|t|)>> and,
  <math|<wide|Y|\<dot\>><around|(|t|)>> respectively.

  Again, it can be seen that the distributions of the amplitude and the phase
  are Rayleigh and uniform, respectively. It may be noted that the Rayleigh
  distribution for an evolutionary envelope has also been found in the past
  by quite different methods. In particular, an approximate Fok-ker-Planck
  equation was derived for an energy-based envelope by modeling that envelope
  as a Markov process, and it was shown that the evolutionary Rayleigh
  distribution was the solution of that Fokker-Planck
  equation<nbsp><cite|SpanosLutes1980|SolomosSpanos1982|SpanosSolomos1983>.
  The distribution of the phase derivative
  <math|<wide|U|\<dot\>><around|(|t|)>> is similar to that in
  Eq.<nbsp><eqref|eq:57> for the stationary process but this time its
  expected value, <math|E<around|[|<wide|U|\<dot\>><around|(|t|)>|]>>, is
  equal to the parameter <math|\<Omega\><around|(|t|)>>. Based on the
  comments regarding the stationary case, this is the parameter that should
  be termed "central frequency".

  The distribution of the envelope derivative,
  <math|<wide|V|\<dot\>><around|(|t|)>> represents an interesting case. At
  first glance, the expression in Eq.<nbsp><eqref|eq:61> looks quite a bit
  more complex than the simple Gaussian expression in the stationary case.
  The reason for this complexity is the non-zero correlation between the
  evolutionary process and its derivative. In particular, if
  <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>=0> is put into this
  equation, then the resulting distribution becomes Gaussian. Under a more
  careful examination, however, the PDF of
  <math|<wide|V|\<dot\>><around|(|t|)>> can be recognized as the so-called
  "Rice distribution", which is usually used for the peaks of a Gaussian
  process. It can be shown that a Rice-distributed random variable can always
  be represented as the sum of two independent random variables, one of which
  is zero-mean Gaussian and the other of which is Rayleigh distributed. For
  the envelope derivative, these two variables are such that the variance of
  the Gaussian distribution is <math|\<Delta\><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>
  and the parameter of the Rayleigh distribution is
  <math|\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>.
  From this, using simple expectation relationships, one can show that

  <\align>
    <tformat|<table|<row|<cell|E<around|[|<wide|V|\<dot\>><around|(|t|)>|]>>|<cell|=<sqrt|0.5*\<pi\>>*\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>>|<row|<cell|E<around*|[|<wide|V|\<dot\>><rsup|2><around|(|t|)>|]>>|<cell|=<around*|[|\<Delta\><rsup|2><around|(|t|)>+2*\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|]>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>|<row|<cell|\<sigma\><rsub|<wide|V|\<dot\>>><rsup|2><around|(|t|)>>|<cell|=<around*|[|\<Delta\><rsup|2><around|(|t|)>+0.43*\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|]>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)><eq-number><label|eq:65>>>>>
  </align>

  The parameter controlling the dispersion of
  <math|p<rsub|<wide|V|\<dot\>>><around|(|<wide|v|\<dot\>>,t|)>>, and thus
  the slow variation of <math|<wide|V|\<dot\>><around|(|t|)>> around its mean
  value, is the standard deviation of <math|<wide|V|\<dot\>><around|(|t|)>>
  equal to <math|<around*|[|\<Delta\><rsup|2><around|(|t|)>+0.43*\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|]><rsup|1/2>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>.

  An examination of the phase derivative PDF in Eq.<nbsp><eqref|eq:62>
  reveals that its second moment is again unbounded and that the parameter
  <math|\<Delta\><around|(|t|)>> now controls the dispersion of the PDF,
  performing the function of the bandwidth factor in the stationary case.
  Evidently, an evolutionary process generally does not have a single
  parameter influencing the dispersion of the PDFs of the derivatives of both
  envelope and phase.

  It can be seen, that all parameters needed to characterize the probability
  distribution of the envelope and the phase processes can be derived from
  the spectral characteristics defined in Eq.<nbsp><eqref|eq:43>. The
  variances of <math|X<around|(|t|)>> and
  <math|<wide|X|\<dot\>><around|(|t|)>> are equal to
  <math|c<rsub|00><around|(|t|)>> and <math|c<rsub|11><around|(|t|)>>,
  respectively. Additionally, the cross-covariances between
  <math|X<around|(|t|)>> and <math|<wide|X|\<dot\>><around|(|t|)>>, and
  between <math|X<around|(|t|)>> and <math|<wide|Y|\<dot\>><around|(|t|)>>
  can be expressed as

  <\equation>
    R<around|(|t|)>=K<rsub|X*<wide|X|\<dot\>>><around|(|t,t|)>=-<math-up|Im><around*|[|c<rsub|01><around|(|t|)>|]><label|eq:66>
  </equation>

  <\equation>
    Q<around|(|t|)>=K<rsub|X*<wide|Y|\<dot\>>><around|(|t,t|)>=<math-up|Re><around*|[|c<rsub|01><around|(|t|)>|]>
  </equation>

  Accordingly, the correlation coefficient between <math|X<around|(|t|)>> and
  <math|<wide|X|\<dot\>><around|(|t|)>> is expressed as

  <\equation>
    \<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>=<frac|-<math-up|Im><around*|[|c<rsub|01><around|(|t|)>|]>|<sqrt|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>><label|eq:67>
  </equation>

  The evolutionary central frequency defined as the expected value of the PDF
  in Eq.<nbsp><eqref|eq:62> is expressed in terms of spectral parameters as

  <\equation>
    \<omega\><rsub|c><around|(|t|)>=\<Omega\><around|(|t|)>=<frac|<math-up|Re><around*|[|c<rsub|01><around|(|t|)>|]>|c<rsub|00><around|(|t|)>><label|eq:68>
  </equation>

  The parameter <math|\<Delta\><around|(|t|)>> is expressed as

  <\equation>
    \<Delta\><around|(|t|)>=<sqrt|1-<frac|<around*|(|<math-up|Re><around*|[|c<rsub|01><around|(|t|)>|]>|)><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>-<frac|<around*|(|<math-up|Im><around*|[|c<rsub|01><around|(|t|)>|]>|)><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>>=<sqrt|1-<frac|<around*|\||c<rsub|01><around|(|t|)>|\|><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>><label|eq:69>
  </equation>

  As previously explained, <math|\<Delta\><around|(|t|)>> or
  <math|\<sigma\><rsub|<wide|V|\<dot\>>><around|(|t|)>/\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>
  might be nominated as the "bandwidth factor" of an evolutionary process.
  There are two problems with these parameter which are both due to their
  functional dependance on the correlation coefficient,
  <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>> as demonstrated by
  Eqs.<nbsp><eqref|eq:64> and<nbsp><eqref|eq:65>. The first problem is wether
  it should be accepted that the bandwidth properties of a process are
  influenced by this correlation coefficient. Note that for stationary
  processes such a question does not exist, since
  <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>\<equiv\>0> and both
  <math|\<Delta\><around|(|t|)>> and <math|\<sigma\><rsub|<wide|V|\<dot\>>><around|(|t|)>/\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>
  are identical to the stationary bandwidth factor <math|q>.

  The second problem relates to special evolutionary processes whose first
  three transient spectral moments are finite so that it is possible to base
  a bandwidth factor on the geometric definition [Eq.<nbsp><eqref|eq:22>]. In
  such a case, it would be desirable for the geometric and nongeometric
  bandwidth factors to render similar values. The most typical example for
  this situation is a modulated stationary process which is an evolutionary
  process whose modulating function varies in time but does not vary with
  frequency [i.e. <math|A<around|(|t,\<omega\>|)>=A<around|(|t|)>>]. The EPSD
  of the modulated stationary process is <math|G<rsub|X*X><around|(|t,\<omega\>|)>=A<rsup|2><around|(|t|)>*S<rsub|X*X><around|(|\<omega\>|)>>.
  It can be easily seen that the transient spectral moments of such a process
  are <math|A<rsup|2><around|(|t|)>> times the spectral moments of
  <math|X<rsub|S><around|(|t|)>>, so that its geometric bandwidth factor is
  constant and equal to the bandwidth factor of
  <math|X<rsub|S><around|(|t|)>>. At the same time, the time derivative
  <math|<wide|A|\<dot\>><around|(|t|)>> is nonzero, resulting in a nonzero
  correlation coefficient. Therefore, <math|\<Delta\><around|(|t|)>> or
  <math|\<sigma\><rsub|<wide|V|\<dot\>>><around|(|t|)>/\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>
  in this case cannot be equal to the geometric bandwidth factor.

  Based on the previous arguments, it seems reasonable to completely exclude
  the correlation coefficient <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>>
  from the bandwidth factor definition. Accordingly, the bandwidth factor of
  an evolutionary process can be defined as dependent only on the correlation
  coefficient <math|\<rho\><rsub|X*<wide|Y|\<dot\>>><around|(|t|)>>, and
  written as

  <\equation>
    q<around|(|t|)>=<sqrt|1-<frac|<around*|(|<math-up|Re><around*|[|c<rsub|01><around|(|t|)>|]>|)><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>>=<sqrt|1-\<rho\><rsub|X*<wide|Y|\<dot\>>><rsup|2><around|(|t|)>><label|eq:70>
  </equation>

  Note that for a modulated stationary process, this definition renders
  results identical to those of the geometric definition.

  The other two bandwidth-related parameters, <math|\<Delta\><around|(|t|)>>
  and <math|\<sigma\><rsub|<wide|V|\<dot\>>><around|(|t|)>/\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>,
  can now be expressed as

  <\equation>
    \<Delta\><around|(|t|)>=<sqrt|q<rsup|2><around|(|t|)>-\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>><label|eq:71>
  </equation>

  <\equation>
    <frac|\<sigma\><rsub|<wide|V|\<dot\>>><around|(|t|)>|\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>>=<sqrt|q<rsup|2><around|(|t|)>-0.57*\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>>
  </equation>

  By using Schwartz inequality properties one can show that
  <math|0\<leqslant\>\<Delta\><around|(|t|)>\<leqslant\>1> always. From the
  properties of <math|\<Delta\><around|(|t|)>> and
  <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>> one can conclude that
  <math|0\<leqslant\><around*|\||\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>|\|>\<leqslant\>q<around|(|t|)>\<leqslant\>1>.

  <section*|7. Concluding remarks>

  The conceptual analysis of spectral characteristics of random processes
  presented in this article reveals the ways in which the problem is more
  complex for nonstationary (evolutionary) processes than for stationary
  processes. The spectral characteristics found to be very useful for
  stationary processes - Vanmarke's spectral moments<nbsp><cite|Vanmarke1972>
  - can be readily defined for evolutionary processes, but one should be
  aware of two potential problems plaguing their use. First, the variances of
  derivatives of the evolutionary process are not equal to the even-order
  spectral moments. Only if the modulating function of the process varies
  slowly in time, can these spectral moments be used as approximations,
  avoiding the need to find derivatives of the modulating function to compute
  the exact variances. This approximation can be utilized for slowly varying
  modulating functions as long as the second potential problem does not
  appear. This second problem is nonconvergence of the integrals for
  low-order evolutionary spectral moments. One cannot expect a spectral
  moment of an arbitrarily large order to be convergent, but if the variance
  of a particular derivative of the process is finite, then it is desirable
  to characterize the process by using spectral parameters which are finite
  up to this order.

  It has been shown that meaningful spectral parameters for an evolutionary
  process can be defined in a simple way as integrals of the one-sided
  autospectra and cross-spectra of the process and its derivatives. These
  parameters are equivalent to those defined earlier by Di
  Paola<nbsp><cite|DiPaola1985>, in a more complex manner, as autocovariances
  and cross-covariances of the pre-envelope process and its derivatives.
  These characteristics do not exhibit either of the problems encountered
  with spectral moments. Moreover, they offer two useful advantages. The
  first advantage is that they are related to the statistics of the envelope
  process and therefore have a more "physical" significance for the process
  than do the spectral moments. The second advantage is that they can be
  computed either through the frequency domain or through the time domain,
  whichever is more appropriate in a particular application.

  The nongeometric spectral characteristics do not allow direct definition of
  bandwidth properties as can be done for spectral moments of the
  evolutionary processes. To overcome this difficulty, the probability
  distributions of the derivatives of the envelope and the phase have been
  analyzed. This analysis reveals that for stationary as well as
  nonstationary processes "central frequency" can be defined as the expected
  value of the phase derivative. At the same time, the suitable "bandwidth
  factor" can be deduced from the property of a narrowband process to possess
  envelope and phase that are slowly varying functions of time. While the
  definition of "central frequency" derived through this approach seems to be
  unambiguous, different possibilities exist for the evolutionary "bandwidth
  factor". Moreover, the analysis suggests that the slow variation of the
  derivatives of the envelope and the phase is influenced by the correlation
  coefficient of the evolutionary process and its derivative - a parameter
  that is not usually associated with a geometric definition of bandwidth.
  For consistency with the situation arising in modulated stationary
  processes, the bandwidth factor definition suggested in this study does not
  depend on this correlation coefficient.

  <section*|Appendix A: Probability distribution of envelope and phase of
  evolutionary processes>

  Consider the evolutionary, zero-mean random vector
  <math|<math-bf|X>=<around|[|X<around|(|t|)>,<wide|X|\<dot\>><around|(|t|)>,Y<around|(|t|)>,<wide|Y|\<dot\>><around|(|t|)>|]><rsup|T>>,
  in which the scalar processes <math|X<around|(|t|)>> and
  <math|Y<around|(|t|)>> defined by Eqs.<nbsp><eqref|eq:1>
  and<nbsp><eqref|eq:26>, and the corresponding random vector
  <math|<math-bf|V>=<around|[|V<around|(|t|)>,<wide|V|\<dot\>><around|(|t|)>,U<around|(|t|)>,<wide|U|\<dot\>><around|(|t|)>|]><rsup|T>>
  which is related to <math|<math-bf|X>> by Eqs.<nbsp><eqref|eq:48>
  and<nbsp><eqref|eq:49>. The PDF of <math|<math-bf|X>> can be written in the
  standard form of

  <\equation>
    p<rsub|<math-bf|X>><around|(|<math-bf|x>,t|)>=<frac|e<rsup|-<frac|1|2><math-bf|x><rsup|T><math-bf|K><rsup|-1><math-bf|x>>|4*\<pi\><rsup|2><sqrt|<around|\||<math-bf|K>|\|>>>*<label|eq:A1>
  </equation>

  in which <math|<math-bf|K>=E<around*|[|<math-bf|XX><rsup|T>|]>> is the
  covariance matrix for <math|<math-bf|X>>. Using,
  <math|R<around|(|t|)>\<equiv\>K<rsub|X*<wide|X|\<dot\>>><around|(|t,t|)>,Q<around|(|t|)>\<equiv\>K<rsub|X*<wide|Y|\<dot\>>><around|(|t,t|)>>
  and the usual notation for variance, one can write <math|<math-bf|K>>. its
  determinant, and its inverse as

  <\equation>
    <math-bf|K>=<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<table|<row|<cell|\<sigma\><rsub|X><rsup|2><around|(|t|)>>|<cell|R<around|(|t|)>>|<cell|0>|<cell|Q<around|(|t|)>>>|<row|<cell|R<around|(|t|)>>|<cell|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>|<cell|-Q<around|(|t|)>>|<cell|0>>|<row|<cell|0>|<cell|-Q<around|(|t|)>>|<cell|\<sigma\><rsub|X><rsup|2><around|(|t|)>>|<cell|R<around|(|t|)>>>|<row|<cell|Q<around|(|t|)>>|<cell|0>|<cell|R<around|(|t|)>>|<cell|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>>>>|]><label|eq:A2>
  </equation>

  <\equation>
    <around|\||<math-bf|K>|\|>=P<rsup|4>
  </equation>

  <\equation>
    <math-bf|K><rsup|-1>=<frac|1|P<rsup|2>><around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<table|<row|<cell|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>|<cell|-R<around|(|t|)>>|<cell|0>|<cell|-Q<around|(|t|)>>>|<row|<cell|-R<around|(|t|)>>|<cell|\<sigma\><rsub|X><rsup|2><around|(|t|)>>|<cell|Q<around|(|t|)>>|<cell|0>>|<row|<cell|0>|<cell|Q<around|(|t|)>>|<cell|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>|<cell|-R<around|(|t|)>>>|<row|<cell|-Q<around|(|t|)>>|<cell|0>|<cell|-R<around|(|t|)>>|<cell|\<sigma\><rsub|X><rsup|2><around|(|t|)>>>>>>|]>
  </equation>

  in which <math|P<rsup|2>=\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>-R<around|(|t|)><rsup|2>-Q<around|(|t|)><rsup|2>>.
  The PDF of <math|<math-bf|V>> is then found from the standard
  transformation formula

  <\equation>
    p<rsub|<math-bf|V>><around|(|<math-bf|v>,t|)>=p<rsub|<math-bf|X>><around|(|<math-bf|x>,t|)><around|\||J|\|><label|eq:A3>
  </equation>

  in which the components of <math|<math-bf|x>> and <math|<math-bf|v>> are
  related to each other in the same way as are those of <math|<math-bf|X>>
  and <math|<math-bf|V>> by Eqs.<nbsp><eqref|eq:48> and<nbsp><eqref|eq:49>.
  The Jacobian of the transformation is

  <\equation>
    J=<around*|\||<frac|\<partial\><math-bf|x>|\<partial\><math-bf|v>>|\|>=v<rsup|2><label|eq:A4>
  </equation>

  Furthermore, it can be found that,\ 

  <\equation>
    x<rsup|2>+y<rsup|2>=v<rsup|2>
  </equation>

  <\equation>
    <wide|x|\<dot\>><rsup|2>+<wide|y|\<dot\>><rsup|2>=<wide|v|\<dot\>><rsup|2>+v*<wide|u|\<dot\>><rsup|2>
  </equation>

  <\equation>
    x<wide|x|\<dot\>>+y<wide|y|\<dot\>>=v*<wide|v|\<dot\>>
  </equation>

  , and

  <\equation>
    x<wide|y|\<dot\>>-<wide|x|\<dot\>>y=v<rsup|2>*<wide|u|\<dot\>>
  </equation>

  Substituting these relationships into Eq.<nbsp><eqref|eq:A3> gives

  <\equation>
    p<rsub|<math-bf|V>><around|(|<math-bf|v>,t|)>=<frac|v<rsup|2>
    e<rsup|-<frac|1|2*P<rsup|2>>*<around*|[|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*v<rsup|2>+\<sigma\><rsub|X><rsup|2><around|(|t|)>*<around*|(|<wide|v|\<dot\>><rsup|2>+v<rsup|2>*<wide|u|\<dot\>><rsup|2>|)>-2*R<around|(|t|)>*v*<wide|v|\<dot\>>-2*Q<around|(|t|)>*v<rsup|2>*<wide|u|\<dot\>>|]>>|4*\<pi\><rsup|2>*P<rsup|2>>*<label|eq:A5>
  </equation>

  which can then be rewritten as

  <\equation>
    p<rsub|<math-bf|V>><around|(|<math-bf|v>,t|)>=<frac|2
    *e<rsup|<around*|{|-<frac|1|2>*<around*|[|<around*|(|1+<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|\<Delta\><rsup|2><around|(|t|)>>|)>*<frac|v<rsup|2>|\<sigma\><rsub|X><rsup|2><around|(|t|)>>+<frac|v<rsup|2>*<around|(|<wide|u|\<dot\>>-\<Omega\><around|(|t|)>|)><rsup|2>|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>-|\<nobracket\>>|\<nobracket\>><around*|\<nobracket\>|<around*|\<nobracket\>|-2*<frac|v|\<sigma\><rsub|X><around|(|t|)>>*<frac|<wide|v|\<dot\>>|\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>>*<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>|\<Delta\><around|(|t|)>>+<frac|<wide|v|\<dot\>><rsup|2>|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>|]>|}>>|4*\<pi\><rsup|2>*\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>
  </equation>

  where <math|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>> denotes the
  correlation coefficient of <math|X<around|(|t|)>> and
  <math|<wide|X|\<dot\>><around|(|t|)>>, and <math|\<Omega\><around|(|t|)>>
  and <math|\<Delta\><around|(|t|)>> arc given by Eqs.<nbsp><eqref|eq:63>
  and<nbsp><eqref|eq:64>, respectively.

  One can now find the distribution of the individual components of
  <math|<math-bf|V>> by integrating the joint PDF in Eq.<nbsp><eqref|eq:A6>.
  Since the phase <math|U<around|(|t|)>> has been taken to have a range of
  <math|<around|[|0,2*\<pi\>|]>>, and the dummy value <math|u> does not
  appear in Eq.<nbsp><eqref|eq:A6>, it is clear that <math|U<around|(|t|)>>
  is independent of the other components, and its marginal distribution is as
  given in Eq.<nbsp><eqref|eq:60>. Performing the appropriate integrations on
  Eq.<nbsp><eqref|eq:A6> gives the joint distributions for
  <math|<around|{|V<around|(|t|)>,<wide|V|\<dot\>><around|(|t|)>|}>> and
  <math|<around|{|V<around|(|t|)>,<wide|U|\<dot\>><around|(|t|)>|}>>,
  respectively as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|p<rsub|V<wide|V|\<dot\>>><around|(|v,<wide|v|\<dot\>>,t|)>>|<cell|=<frac|v
    e<rsup|-<frac|1|2>*<around*|[|<around*|(|1+<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><rsup|2><around|(|t|)>|\<Delta\><rsup|2><around|(|t|)>>|)>*<frac|v<rsup|2>|\<sigma\><rsub|X><rsup|2><around|(|t|)>>-2*<frac|v|\<sigma\><rsub|X><around|(|t|)>>*<frac|<wide|v|\<dot\>>|\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>>*<frac|\<rho\><rsub|X*<wide|X|\<dot\>>><around|(|t|)>|\<Delta\><around|(|t|)>>|\<nobracket\>><around*|\<nobracket\>|+<frac|<wide|v|\<dot\>><rsup|2>|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>|]>>|<sqrt|2*\<pi\>>*\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>>*>>>>><label|eq:A7>
  </equation>

  <\align>
    <tformat|<table|<row|<cell|p<rsub|V<wide|U|\<dot\>>><around|(|v,<wide|u|\<dot\>>,t|)>>|<cell|=<frac|v<rsup|2>
    e<rsup|-<frac|1|2>*<around*|[|<frac|v<rsup|2>|\<sigma\><rsub|X><rsup|2><around|(|t|)>>+<frac|v<rsup|2>*<around|(|<wide|u|\<dot\>>-\<Omega\><around|(|t|)>|)><rsup|2>|\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>>|]>>|<sqrt|2*\<pi\>>*\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><around|(|t|)>*\<Delta\><around|(|t|)>>*<eq-number><label|eq:A8>>>>>
  </align>

  and further integration gives the remaining marginal distributions as in
  Eqs.<nbsp><eqref|eq:59>,<nbsp><eqref|eq:61>, and<nbsp><eqref|eq:62>.

  <\thebibliography|99>
    <bibitem|Vanmarke1972>Vanmarke EH. Properties of spectral moments with
    applications to random vibrations. J Eng Mech Div, ASME 1972;42:215\U20.

    <bibitem|BendatPiersol1986>Bendat J, Piersol AG. Random data: analysis
    and measurement procedures. New York: Wiley, 1986.

    <bibitem|Priestley1988>Pricstley MB. Non-linear and non-stationary time
    series analysis. London, San Diego: Academic Press, 1988.

    <bibitem|Michaelov1997>Michaelov G. Nonstationary extreme response of
    simple oscillators. Doctoral dissertation, The George Washington
    University, Washington, DC, 1997.

    <bibitem|Corotis1972>Corotis RB, Vanmarke FH. Cornell CA. First passage
    of nonstationary random processes. J Eng Mech Div, ASME
    1972;98(EM2):401\U14.

    <bibitem|DiPaola1985>Di Paola M. Transient spectral moments of linear
    systems. SM Archives 1985;10:225\U43.

    <bibitem|NigamNarayanan1994>Nigam NC, Narayanan S. Applications of random
    vibrations. Berlin, New York, New Delhi: Springer-Verlag, 1994.

    <bibitem|SoongGrigoriu1993>Soong TT, Grigoriu M. Random vibrations of
    mechanical and structural systems. Englewood Cliffs NJ: Prentice Hall,
    1993.

    <bibitem|Priestley1965>Priestley MB. Evolutionary spectra and
    nonstationary processes. J Roy Stat Soc 204307.

    <bibitem|Arens1957>Arens R. Complex processes for envelopes of normal
    noise. IRE Transaction of Information Theory 1957;3:204\U7.

    <bibitem|Dugundji1958>Dugundji J. Envelope and pre-envelope of real
    waveforms. IRE Transaction of Information Theory 1958:4:53\U7.

    <bibitem|Muscolino1988>Muscolino G. Nonstationary envelope in random
    vibration theory. Journal of Engng Mech Div 1988;109(EM1):263\U77.

    <bibitem|DiPaolaPetrucci1990>Di Paola M, Petrucci G. Spectral moments and
    pre-envelope covariances of nonseparable processes. Journal of Appl Mech
    1990;57:218\U24.

    <bibitem|LutesSarkani1997>Lutes LD, Sarkani S. Stochastic analysis of
    structural and mechanical vibrations. Englewood Cliffs NJ: Prentice Hall,
    1997.

    <bibitem|Sveshnikov1966>Sveshnikov AA. Applied methods of the theory of
    random functions. Oxford, New York: Pergamon Press, 1966.

    <bibitem|Yang1972>Yang J-N. Nonstationary envelopc process and first
    excursion probability. J Struct Mech 1972; 1(2):231\U49.

    <bibitem|SpanosLutes1980>Spanos P-TD, Lutes LD. Probability of response
    to evolutionary excitation. J Eng Mech Div 1980;106(EM2):213\U24.

    <bibitem|SolomosSpanos1982>Solomos GP, Spanos P-TD. Solution to the
    backward-Kolmogorov equation for a nonstationary oscillation problem. J
    Appl Mech, ASME 1982;49:923\U5.

    <bibitem|SpanosSolomos1983>Spanos P-TD. Solomos GP. Markov approximation
    to transient vibration. J Eng Mech, ASCE 1983;109(4):1134\U50.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|2>>
    <associate|auto-2|<tuple|?|4>>
    <associate|auto-3|<tuple|12|6>>
    <associate|auto-4|<tuple|22|9>>
    <associate|auto-5|<tuple|44|12>>
    <associate|auto-6|<tuple|47|13>>
    <associate|auto-7|<tuple|76|20>>
    <associate|auto-8|<tuple|76|21>>
    <associate|auto-9|<tuple|90|23>>
    <associate|bib-Arens1957|<tuple|Arens1957|23>>
    <associate|bib-BendatPiersol1986|<tuple|BendatPiersol1986|23>>
    <associate|bib-Corotis1972|<tuple|Corotis1972|23>>
    <associate|bib-DiPaola1985|<tuple|DiPaola1985|23>>
    <associate|bib-DiPaolaPetrucci1990|<tuple|DiPaolaPetrucci1990|23>>
    <associate|bib-Dugundji1958|<tuple|Dugundji1958|23>>
    <associate|bib-LutesSarkani1997|<tuple|LutesSarkani1997|23>>
    <associate|bib-Michaelov1997|<tuple|Michaelov1997|23>>
    <associate|bib-Muscolino1988|<tuple|Muscolino1988|23>>
    <associate|bib-NigamNarayanan1994|<tuple|NigamNarayanan1994|23>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|23>>
    <associate|bib-Priestley1988|<tuple|Priestley1988|23>>
    <associate|bib-SolomosSpanos1982|<tuple|SolomosSpanos1982|24>>
    <associate|bib-SoongGrigoriu1993|<tuple|SoongGrigoriu1993|23>>
    <associate|bib-SpanosLutes1980|<tuple|SpanosLutes1980|23>>
    <associate|bib-SpanosSolomos1983|<tuple|SpanosSolomos1983|24>>
    <associate|bib-Sveshnikov1966|<tuple|Sveshnikov1966|23>>
    <associate|bib-Vanmarke1972|<tuple|Vanmarke1972|23>>
    <associate|bib-Yang1972|<tuple|Yang1972|23>>
    <associate|eq:1|<tuple|1|4>>
    <associate|eq:10|<tuple|10|6>>
    <associate|eq:11|<tuple|11|6>>
    <associate|eq:12|<tuple|12|6>>
    <associate|eq:13|<tuple|13|6>>
    <associate|eq:14|<tuple|14|6>>
    <associate|eq:15|<tuple|15|7>>
    <associate|eq:16|<tuple|16|7>>
    <associate|eq:17|<tuple|17|7>>
    <associate|eq:18|<tuple|18|7>>
    <associate|eq:19|<tuple|19|7>>
    <associate|eq:2|<tuple|2|4>>
    <associate|eq:20|<tuple|20|8>>
    <associate|eq:21|<tuple|21|8>>
    <associate|eq:22|<tuple|22|8>>
    <associate|eq:23|<tuple|23|10>>
    <associate|eq:24|<tuple|24|10>>
    <associate|eq:25|<tuple|25|10>>
    <associate|eq:26|<tuple|26|10>>
    <associate|eq:27|<tuple|27|10>>
    <associate|eq:28|<tuple|28|10>>
    <associate|eq:29|<tuple|29|10>>
    <associate|eq:3|<tuple|3|4>>
    <associate|eq:30|<tuple|30|11>>
    <associate|eq:31|<tuple|31|11>>
    <associate|eq:32|<tuple|32|11>>
    <associate|eq:33|<tuple|33|11>>
    <associate|eq:34|<tuple|34|11>>
    <associate|eq:35|<tuple|35|11>>
    <associate|eq:36|<tuple|36|11>>
    <associate|eq:37|<tuple|37|11>>
    <associate|eq:38|<tuple|38|11>>
    <associate|eq:39|<tuple|39|12>>
    <associate|eq:4|<tuple|5|4>>
    <associate|eq:40|<tuple|40|12>>
    <associate|eq:41|<tuple|41|12>>
    <associate|eq:42|<tuple|42|12>>
    <associate|eq:43|<tuple|43|12>>
    <associate|eq:44|<tuple|44|12>>
    <associate|eq:45|<tuple|45|13>>
    <associate|eq:46|<tuple|46|13>>
    <associate|eq:47|<tuple|47|13>>
    <associate|eq:48|<tuple|48|14>>
    <associate|eq:49|<tuple|49|14>>
    <associate|eq:5|<tuple|6|5>>
    <associate|eq:50|<tuple|50|14>>
    <associate|eq:51|<tuple|52|15>>
    <associate|eq:52|<tuple|55|15>>
    <associate|eq:53|<tuple|56|15>>
    <associate|eq:54|<tuple|57|16>>
    <associate|eq:55|<tuple|58|16>>
    <associate|eq:56|<tuple|59|16>>
    <associate|eq:57|<tuple|60|16>>
    <associate|eq:58|<tuple|61|16>>
    <associate|eq:59|<tuple|62|17>>
    <associate|eq:6|<tuple|7|5>>
    <associate|eq:60|<tuple|63|17>>
    <associate|eq:61|<tuple|64|17>>
    <associate|eq:62|<tuple|65|17>>
    <associate|eq:63|<tuple|66|17>>
    <associate|eq:64|<tuple|67|17>>
    <associate|eq:65|<tuple|68|18>>
    <associate|eq:66|<tuple|69|18>>
    <associate|eq:67|<tuple|71|19>>
    <associate|eq:68|<tuple|72|19>>
    <associate|eq:69|<tuple|73|19>>
    <associate|eq:7|<tuple|8|5>>
    <associate|eq:70|<tuple|74|19>>
    <associate|eq:71|<tuple|75|20>>
    <associate|eq:9|<tuple|9|5>>
    <associate|eq:A1|<tuple|77|21>>
    <associate|eq:A2|<tuple|78|21>>
    <associate|eq:A3|<tuple|81|22>>
    <associate|eq:A4|<tuple|82|22>>
    <associate|eq:A5|<tuple|87|22>>
    <associate|eq:A7|<tuple|89|23>>
    <associate|eq:A8|<tuple|90|23>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Vanmarke1972

      BendatPiersol1986

      Priestley1988

      Michaelov1997

      Corotis1972

      Corotis1972

      DiPaola1985

      DiPaola1985

      NigamNarayanan1994

      SoongGrigoriu1993

      DiPaola1985

      Priestley1965

      Priestley1965

      NigamNarayanan1994

      Vanmarke1972

      Corotis1972

      Corotis1972

      DiPaola1985

      Arens1957

      Dugundji1958

      DiPaolaPetrucci1990

      Muscolino1988

      LutesSarkani1997

      DiPaola1985

      DiPaola1985

      Michaelov1997

      DiPaola1985

      LutesSarkani1997

      Sveshnikov1966

      Muscolino1988

      Yang1972

      SpanosLutes1980

      SolomosSpanos1982

      SpanosSolomos1983

      Vanmarke1972

      DiPaola1985
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      Nonstationary processes with evolutionary power spectral density>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      Spectral moments of stationary and evolutionary processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      The pre-envelope for stationary and nonstationary processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.
      Spectra of an evolutionary process and its derivatives>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6.
      Central frequency and bandwidth factor for evolutionary processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7.
      Concluding remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      A: Probability distribution of envelope and phase of evolutionary
      processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>