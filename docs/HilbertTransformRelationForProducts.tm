<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Hilbert Transform Relations for
  Products>|<doc-author|<author-data|<author-name|Gerald D.
  Cain>|<author-affiliation|Department of Electrical and Electronic
  Engineering, Polytechnic of Central London, London W1,
  England>>>|<doc-date|>>

  <abstract-data|<\abstract>
    A general formula for the Hilbert transform of a product of
    complex-valued functions is developed. Certain simplifications are then
    exhibited for products often encountered in the context of modulation and
    signal processing. The approach chosen is one of frequency partitioning;
    this permits signal definition on complementary sections of the frequency
    axis and leads to compact and easily manipulated expressions.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Hilbert
    Transform Definition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Bedrosian's
    Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Generalization
    and Analytic Signals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>General
    Product Formula for Complex-Valued Functions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Products
    of Spectrally Disjoint Signals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Summary>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgment>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Hilbert transform is a useful analytical tool that has been applied
  extensively in signal and system theory. While this transform provides a
  tidy means of relating certain orthogonal time or frequency functions, the
  actual computation of transform pairs and the reduction of transform
  expressions is usually a difficult task.

  One important problem is that of finding Hilbert transforms of products
  since most useful applications are replete with instances requiring
  multiplication of functions. Product relationships came under scrutiny in
  connection with narrow-band signal representation. Some controversy
  <cite|Lerner1960|Kelly1960|Urkowitz1962|Bedrosian1963|Rihaczek1966|Rubin1966|Nuttall1966>
  surrounded this matter before Bedrosian's product theorem was introduced
  <cite|Bedrosian1963|Nuttall1966>. Bedrosian's theorem, however, is
  applicable only in circumstances that are often overly restrictive. The
  purpose of this letter is to present a more general result and to show the
  relevance of work by Tricomi <cite|Tricomi1951> and Titchmarsh
  <cite|Titchmarsh1937>; also, some special simplifications for expressions
  common in modulation and signal processing analyses are demonstrated. These
  results can be used to advantage in a variety of specific situations (for
  example, <cite|Cain1965>).

  <section|Hilbert Transform Definition>

  <\definition>
    <label|def:hilbert>The Hilbert transform
    <math|\<cal-H\><around|[|g<around|(|t|)>|]>> of a function
    <math|g<around|(|t|)>> is the linear operator defined as

    <\equation>
      \<cal-H\><around|[|g<around|(|t|)>|]>=<frac|1|\<pi\>>*<space|0.17em><with|math-font-family|rm|p.v.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|g<around|(|\<tau\>|)>|t-\<tau\>>*<space|0.17em>d*\<tau\><label|eq:hilbert_def>
    </equation>

    where the integration is taken in the Cauchy principal value sense and
    <math|\<cal-H\><around|[|\<cdummy\>|]>> denotes the Hilbert transform.
  </definition>

  If <math|t> is identified as a time variable, the Hilbert transform may be
  viewed as a <math|-90<rsup|\<circ\>>> phase-shift operator; such a
  viewpoint is often beneficial in understanding the usefulness of this
  transform. Since constants are lost in Hilbert transformation, we
  stipulate, in order to provide for unique inverse transformation, that no
  functions with DC components be allowed. It will be assumed that all
  indicated Hilbert transforms are being taken in a distributional sense so
  that we can cater for \Ppower\Q-type signals (such as sinusoids) which so
  frequently arise in communication studies, as well as the finite energy
  signals originally specified in <cite|Bedrosian1963>.

  <section|Bedrosian's Theorem>

  <\theorem>
    [Bedrosian's Theorem]<label|thm:bedrosian> Let <math|x<around|(|t|)>> and
    <math|y<around|(|t|)>> be (generally) complex-valued time functions. If
    the following sufficiency conditions hold:

    <\enumerate>
      <item>Denoting <math|f<rsub|c>> as the smallest frequency value along
      the positive <math|f> axis at which the Fourier transform
      <math|Y<around|(|f|)>> is nonzero, it is found that
      <math|X<around|(|f|)>> vanishes below <math|-f<rsub|c>>.

      <item>Labeling as <math|-f<rsub|n>> the largest frequency value along
      the negative <math|f> axis at which <math|Y<around|(|f|)>> is nonzero,
      we find that <math|X<around|(|f|)>> vanishes above <math|f<rsub|n>>.
    </enumerate>

    Then,

    <\equation>
      \<cal-H\>*<around|[|x<around|(|t|)>*y<around|(|t|)>|]>=x<around|(|t|)>*\<cal-H\><around|[|y<around|(|t|)>|]><label|eq:bedrosian>
    </equation>
  </theorem>

  <\remark>
    If <math|Y<around|(|f|)>> happens to be nonzero throughout an interval
    adjoining the origin, one is confronted with the special problem of
    accommodating the point <math|f=0> in any declaration of <math|f<rsub|c>>
    or <math|-f<rsub|n>>. This problem can be overcome by the conceptual
    artifice of sidestepping the frequency origin; that is, for a continuous
    spectrum <math|Y<around|(|f|)>> which is contiguous to the frequency
    origin from the positive frequency side, it is necessary to assign
    <math|f<rsub|c>> an arbitrarily small positive value, say
    <math|\<epsilon\><rsub|+>>. Similarly, if on the negative frequency axis
    <math|Y<around|(|f|)>> is nonzero on an interval adjacent to the origin,
    then <math|-f<rsub|n>> is chosen to be the small negative offset
    <math|-\<epsilon\><rsub|->>. This means, for instance, that if
    <math|Y<around|(|f|)>> has nonzero continuous spectral content straddling
    the origin, a delta function at the origin (that is, a constant
    <math|x<around|(|t|)>>, which is not allowable due to our initial
    stipulation) is the only spectrum for <math|X<around|(|f|)>> that would,
    according to this theorem, satisfy equation<nbsp><eqref|eq:bedrosian>.
  </remark>

  Clearly, Bedrosian's theorem is not generally applicable for spectrally
  overlapping double-sided baseband signals.

  <section|Generalization and Analytic Signals>

  In the case of a single-sided <math|Y<around|(|f|)>> that vanishes along
  the positive (or negative) frequency axis, no <math|f<rsub|c>> (or
  <math|-f<rsub|n>>) is encountered; therefore, there is no constraint on the
  extent of <math|X<around|(|f|)>> for negative (positive) frequency. It is
  important to note that conditions (a) and (b) are sufficiency conditions
  only and that equation<nbsp><eqref|eq:bedrosian> might, in some examples,
  hold true even if these conditions fail.

  One of the simplest cases meeting the qualifications of the theorem is that
  of a low-pass signal <math|x<around|(|t|)>> strictly band-limited inside
  <math|<around|(|-f<rsub|c>,f<rsub|c>|)>> combined with a high-pass signal
  <math|y<around|(|t|)>> with no spectral content inside that interval.
  Another obvious case is that in which both signals are analytic; this case
  will enable us to extend Bedrosian's theorem.

  We can form analytic signals from real-valued <math|r> and <math|s>:

  <\align>
    <tformat|<table|<row|<cell|z<around|(|t|)>>|<cell|=r<around|(|t|)>+j*\<cal-H\><around|[|r<around|(|t|)>|]><eq-number><label|eq:analytic_z>>>|<row|<cell|w<around|(|t|)>>|<cell|=s<around|(|t|)>+j*\<cal-H\><around|[|s<around|(|t|)>|]><eq-number><label|eq:analytic_w>>>>>
  </align>

  Employing equation<nbsp><eqref|eq:bedrosian> and equating real parts, we
  are led to an expression that is independent of spectral considerations:

  <\equation>
    \<cal-H\>*<around|[|r<around|(|t|)>*s<around|(|t|)>|]>=r<around|(|t|)>*\<cal-H\><around|[|s<around|(|t|)>|]>+\<cal-H\><around|[|r<around|(|t|)>|]>*s<around|(|t|)>+\<cal-H\>*<around|[|\<cal-H\><around|[|r<around|(|t|)>|]>*\<cal-H\><around|[|s<around|(|t|)>|]>|]><label|eq:tricomi>
  </equation>

  Equation<nbsp><eqref|eq:tricomi> seems to have been derived first (and more
  rigorously than was done here) by Tricomi <cite|Tricomi1951>, although it
  appears to have seen little use in engineering literature.

  <section|General Product Formula for Complex-Valued Functions>

  We now obtain a new equation with the form of
  equation<nbsp><eqref|eq:tricomi> which is true for complex-valued
  functions. Introduce two new arbitrary real-valued functions
  <math|u<around|(|t|)>> and <math|w<around|(|t|)>>. Then three additional
  equations like equation<nbsp><eqref|eq:tricomi> are written out, where
  <math|r*s> is replaced first by <math|-u*w>, then by <math|j*v*s>, and
  finally by <math|j*n*u>. These three equations are added to
  equation<nbsp><eqref|eq:tricomi> and we find that, upon defining

  <\align>
    <tformat|<table|<row|<cell|x<around|(|t|)>>|<cell|=r<around|(|t|)>+j*u<around|(|t|)><eq-number><label|eq:x_general>>>|<row|<cell|y<around|(|t|)>>|<cell|=s<around|(|t|)>+j*w<around|(|t|)><eq-number><label|eq:y_general>>>>>
  </align>

  to be general complex-valued functions, we have

  <\equation>
    \<cal-H\>*<around|[|x<around|(|t|)>*y<around|(|t|)>|]>=x<around|(|t|)>*\<cal-H\><around|[|y<around|(|t|)>|]>+y<around|(|t|)>*\<cal-H\><around|[|x<around|(|t|)>|]>+\<cal-H\>*<around|[|\<cal-H\><around|[|x<around|(|t|)>|]>*\<cal-H\><around|[|y<around|(|t|)>|]>|]><label|eq:general_product>
  </equation>

  Thus, equation<nbsp><eqref|eq:bedrosian> is just a degenerate form of
  equation<nbsp><eqref|eq:general_product> that is obtained when conditions
  (a) and (b) hold. Or the last two terms in
  equation<nbsp><eqref|eq:general_product> may be looked upon as a correction
  factor generally needed when applying equation<nbsp><eqref|eq:bedrosian>
  with no heed to the spectral properties of <math|x> and <math|y>. As a
  practical matter, of course, evaluation of the right-hand side of
  equation<nbsp><eqref|eq:general_product> is best avoided, since three
  different Hilbert transforms (one of which is again the transform of a
  product) are required.

  A further simplification is interesting. In
  equation<nbsp><eqref|eq:general_product> choose <math|y> to be identically
  equal to <math|x> and note that two successive Hilbert transforms of a
  function result in multiplication of the original function by <math|-1>. We
  find for this arbitrary function <math|x> that

  <\equation>
    \<cal-H\>*<around|[|x<around|(|t|)>*x<around|(|t|)>|]>=x<around|(|t|)>*\<cal-H\><around|[|x<around|(|t|)>|]>+x<around|(|t|)>*\<cal-H\><around|[|x<around|(|t|)>|]>-x<around|(|t|)>*x<around|(|t|)>=2*x<around|(|t|)>*\<cal-H\><around|[|x<around|(|t|)>|]>-x<around|(|t|)><rsup|2><label|eq:titchmarsh>
  </equation>

  This is a generalization of one of Titchmarsh's real-valued results
  <cite|Titchmarsh1937> to complex-valued functions.

  <section|Products of Spectrally Disjoint Signals>

  If it happens that the two functions involved in the general formula
  equation<nbsp><eqref|eq:general_product> have spectra that occupy
  complementary segments of the frequency axis, some simplification of
  equation<nbsp><eqref|eq:general_product> is possible even when conditions
  (a) and (b) are not directly satisfied. For ease of illustration, assume an
  uncomplicated case where <math|x<around|(|t|)>> is devoid of spectral
  content over the intervals <math|<around|[|-f<rsub|d>,-f<rsub|c>|]>> and
  <math|<around|[|f<rsub|c>,f<rsub|d>|]>> where <math|Y<around|(|f|)>>
  resides. Following a frequency partitioning approach <cite|Haber1972>, we
  define

  <\equation>
    x<around|(|t|)>=x<rsub|1><around|(|t|)>+x<rsub|2><around|(|t|)><label|eq:partition>
  </equation>

  with <math|x<rsub|1>>, the low-pass portion of <math|x>, possessing a
  spectrum limited to <math|<around|(|-f<rsub|c>,f<rsub|c>|)>>, and
  <math|x<rsub|2>> being the high-pass content of <math|x>, with a spectrum
  lying outside <math|<around|[|-f<rsub|d>,f<rsub|d>|]>>.

  Now equation<nbsp><eqref|eq:general_product> yields the same as two
  separate applications of equation<nbsp><eqref|eq:bedrosian>:

  <\align>
    <tformat|<table|<row|<cell|\<cal-H\>*<around|[|x<around|(|t|)>*y<around|(|t|)>|]>>|<cell|=x<rsub|1><around|(|t|)>*\<cal-H\><around|[|y<around|(|t|)>|]>+x<rsub|2><around|(|t|)>*y<around|(|t|)><eq-number><label|eq:spectral1>>>|<row|<cell|\<cal-H\>*<around|[|x<around|(|t|)>*y<around|(|t|)>|]>>|<cell|=x<rsub|1><around|(|t|)>*y<around|(|t|)>+x<rsub|2><around|(|t|)>*\<cal-H\><around|[|y<around|(|t|)>|]><eq-number><label|eq:spectral2>>>>>
  </align>

  Alternate forms are obtained by substituting for either <math|x<rsub|1>> or
  <math|x<rsub|2>> via equation<nbsp><eqref|eq:partition>.

  A category of problems of considerable importance is that where
  <math|y<around|(|t|)>> is composed of a sum of sinusoids with frequencies
  falling inside the bandwidth of <math|x<around|(|t|)>>. Assuming that there
  are no sinusoids in <math|x> which are coincident with those comprising
  <math|y>, the two spectra are effectively complementary. That is,
  assignment of the value zero to <math|X<around|(|f|)>> at those isolated
  points where <math|Y<around|(|f|)>> is contributing delta functions does
  not (for spectra of practical significance) alter the mathematical
  recoverability of <math|x<around|(|t|)>>. Therefore, treating only a simple
  monochromatic <math|y>,

  <\equation>
    <tabular|<tformat|<cwith|1|-1|1|-1|font-base-size|8>|<table|<row|<cell|\<cal-H\>*<around|[|x<around|(|t|)>*cos
    2*\<pi\>*f<rsub|c>*t|]>>|<cell|=x<around|(|t|)>*\<cal-H\>*<around|[|cos
    2*\<pi\>*f<rsub|c>*t|]>+\<cal-H\><around|[|x<around|(|t|)>|]>*cos
    2*\<pi\>*f<rsub|c>*t-\<cal-H\><around|[|x<around|(|t|)>|]>*\<cal-H\>*<around|[|cos
    2*\<pi\>*f<rsub|c>*t|]>>>|<row|<cell|>|<cell|=x<around|(|t|)>*sin
    2*\<pi\>*f<rsub|c>*t+\<cal-H\><around|[|x<around|(|t|)>|]>*cos
    2*\<pi\>*f<rsub|c>*t-x<around|(|t|)>*sin
    2*\<pi\>*f<rsub|c>*t>>>>><label|p>
  </equation>

  where the last two terms may be thought of as correction terms that modify
  transforms taken directly in terms of the symbols on the left-hand side of
  the equation. If <math|x> is real-valued, the correction terms in
  equation<nbsp><eqref|eq:cosine_product1> take the form of a lower
  single-sideband version of <math|-\<cal-H\><around|[|x<around|(|t|)>|]>>,
  while equation<nbsp><eqref|eq:cosine_product2> utilizes a lower
  single-sideband relationship for <math|x<around|(|t|)>>.

  <section|Summary>

  A general Hilbert transform product theorem is given by
  equation<nbsp><eqref|eq:general_product>. This equation is the principal
  result of this letter and embraces the results of three earlier
  investigators. If the component functions have spectra that are disjoint,
  the more specific equations<nbsp><eqref|eq:spectral1>,
  <eqref|eq:spectral2>, or their alternates may be used; straightforward
  modification will be necessary if the spectral pattern is more complicated
  than that assumed here for demonstration purposes.
  Equations<nbsp><eqref|eq:cosine_product1> and <eqref|eq:cosine_product2>
  are particularly helpful relationships in many signal processing
  applications since multiplication by sinusoids is common. All of these
  equations accommodate either real or complex-valued functions that are free
  of additive constant components; the equations in <eqref|p> additionally
  require that <math|x<around|(|t|)>> does not contain sinusoids of frequency
  <math|f<rsub|c>>.

  <section*|Acknowledgment>

  The author thanks the reviewers for their helpful comments.

  <\thebibliography|11>
    <bibitem|Lerner1960>R. M. Lerner, \PA matched filter detection system for
    complicated Doppler shifted signals,\Q <em|IRE Trans. Inform. Theory>,
    vol. IT-6, pp. 375\U385, June 1960.

    <bibitem|Kelly1960>E. J. Kelly, I. S. Reed, and W. L. Root, \PThe
    detection of radar echoes in noise,\Q <em|J. Soc. Ind. Appl. Math.>, vol.
    8, pp. 309\U341, June 1960.

    <bibitem|Urkowitz1962>H. Urkowitz, \PHilbert transforms of band-pass
    functions,\Q <em|Proc. IRE (Corresp.)>, vol. 50, p. 2143, Oct. 1962.

    <bibitem|Bedrosian1963>E. Bedrosian, \PA product theorem for Hilbert
    transforms,\Q <em|Proc. IEEE (Corresp.)>, vol. 51, pp. 868\U869, May
    1963.

    <bibitem|Rihaczek1966>A. W. Rihaczek and E. Bedrosian, \PHilbert
    transforms and the complex representation of real signals,\Q <em|Proc.
    IEEE (Lett.)>, vol. 54, pp. 434\U435, Mar. 1966.

    <bibitem|Rubin1966>W. L. Rubin and J. V. DiFranco, \PConcerning the
    complex representation of narrow-band signals,\Q <em|Proc. IEEE (Lett.)>,
    vol. 54, p. 1088, Aug. 1966.

    <bibitem|Nuttall1966>A. H. Nuttall and E. Bedrosian, \POn the quadrature
    approximation to the Hilbert transform of modulated signals,\Q <em|Proc.
    IEEE (Lett.)>, vol. 54, pp. 1458\U1459, Oct. 1966.

    <bibitem|Tricomi1951>F. G. Tricomi, \POn the finite Hilbert
    transformation,\Q <em|Quart. J. Math. Oxford ser. 2>, pp. 199\U211, 1951.

    <bibitem|Titchmarsh1937>E. C. Titchmarsh, <em|Introduction to the Theory
    of Fourier Integrals>. London, England: Oxford Univ. Press, 1937, p. 137.

    <bibitem|Cain1965>G. D. Cain, \PHilbert transform description of linear
    filtering,\Q <em|Electron. Lett.>, vol. 1, pp. 232\U233, June 1965.

    <bibitem|Haber1972>F. Haber, \PSignal representation,\Q <em|IEEE Trans.
    Commun. Technol. (Corresp.)>, vol. 8, pp. 360\U382, July 27, 1972.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-6|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-7|<tuple|7|5|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-8|<tuple|7|5|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-9|<tuple|7|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Bedrosian1963|<tuple|Bedrosian1963|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Cain1965|<tuple|Cain1965|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Haber1972|<tuple|Haber1972|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Kelly1960|<tuple|Kelly1960|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Lerner1960|<tuple|Lerner1960|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Nuttall1966|<tuple|Nuttall1966|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Rihaczek1966|<tuple|Rihaczek1966|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Rubin1966|<tuple|Rubin1966|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Titchmarsh1937|<tuple|Titchmarsh1937|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Tricomi1951|<tuple|Tricomi1951|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-Urkowitz1962|<tuple|Urkowitz1962|6|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|def:hilbert|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:analytic_w|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:analytic_z|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:bedrosian|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:general_product|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:hilbert_def|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:partition|<tuple|10|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:spectral1|<tuple|11|5|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:spectral2|<tuple|12|5|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:titchmarsh|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:tricomi|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:x_general|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:y_general|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|p|<tuple|13|?|../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|thm:bedrosian|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Lerner1960

      Kelly1960

      Urkowitz1962

      Bedrosian1963

      Rihaczek1966

      Rubin1966

      Nuttall1966

      Bedrosian1963

      Nuttall1966

      Tricomi1951

      Titchmarsh1937

      Cain1965

      Bedrosian1963

      Tricomi1951

      Titchmarsh1937

      Haber1972
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Hilbert
      Transform Definition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Bedrosian's
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Generalization
      and Analytic Signals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>General
      Product Formula for Complex-Valued Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Products
      of Spectrally Disjoint Signals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgment>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>