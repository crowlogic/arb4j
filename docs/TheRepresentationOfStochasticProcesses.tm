<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Recipe For The Eigenfunctions of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    An extension to the approach of solving for the eigenfunctions of
    \ Gaussian integral covariance operators described in
    <newblock><with|font-shape|italic|Stochastic finite elements: a spectral
    approach> is described for the class of wide-sense stationary Gaussian
    processes. It is applicable \ non-square-integrable kernels over an
    unbounded (noncompact) domains if the canonical metric is such that the
    corresponding metric entropy integral is finite thus rendering the
    integral covariance operator compact relative to the canonical metric
    induced by thge process. This essentially provides an effective version
    of (the ineffective) Aronszajn's theorem for stationary Gaussian
    procesees.\ 
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Spectral Approach to Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>The Karhunen-Loeve Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|2tab|1.1.1<space|2spc>Derivation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.1.2<space|2spc>Reproducing Kernel Hilbert Spaces
    (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.2<space|2spc>Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|1.2.1<space|2spc>Error Minimization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|1.2.2<space|2spc>Uniqueness of the Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.3<space|2spc>Solution of the Integral Equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|1.4<space|2spc>Exact Solutions For Stationary
    Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|1.4.1<space|2spc><with|color|dark
    red|font-family|rm|<with|mode|math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|t-s|)>f<around*|(|t|)>\<mathd\>t>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|2tab|1.4.2<space|2spc>Simplifying The Convolution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Appendix>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>A Theorem On The Development of
    Symmetric Nuclei <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>
  </table-of-contents>

  <section|The Spectral Approach to Stochastic Processes>

  <subsection|The Karhunen-Loeve Expansion>

  The Karhunen-Loeve expansion is spectral representation theorem which
  expands random processes <math|w*<around|(|x,\<theta\>|)>> in terms of
  countable sets of orthogonal random variables in the form

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|i=0><rsup|\<infty\>>\<mu\><rsub|i><around|(|\<theta\>|)>*g<rsub|i><around|(|x|)><label|KL>
  </equation>

  where <math|<around|{|\<mu\><rsub|i><around|(|\<theta\>|)>|}>> is a set of
  random variable projections and <math|<around|{|g<rsub|i><around|(|x|)>|}>>
  are the eigenfunctions of the integral covariance operator associated to
  the Gaussian process having the covariance kernel of
  <math|w*<around|(|x,\<theta\>|)>>. Since the Karhunen-Loeve(KL) equation
  (<reference|2.5>) is a quantization of the random process it can be viewed
  as a representation of the process <math|w*<around|(|x,\<theta\>|)>> as a
  curve in the Hilbert space spanned by the set
  <math|<around|{|g<rsub|i><around|(|x|)>|}>> expressed as a direct sum of
  orthogonal projections in this Hilbert space whereby the magnitudes of the
  projections on successive basis vectors are proportional to the
  corresponding eigenvalues of the covariance function associated with the
  eigenfunctions of the process <math|w*<around|(|x,\<theta\>|)>>. ors or
  filters acting on processes with independent increments.

  <subsubsection|Derivation>

  <\theorem>
    The random process <math|w<around*|(|x,\<theta\>|)>> can be represented
    by the Karhunen-Loeve expansion defined by the Fourier-like series as

    <\equation>
      w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n><around|(|\<theta\>|)>*f<rsub|n><around|(|x|)>
    </equation>

    where <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>> is a said
    to be a set of 'random' variables to be determined by projecting the
    process <math|w<around*|(|x,\<theta\>|)>> onto the <math|n-th>
    eigenfunction and <math|\<lambda\><rsub|n>> is the <math|n>-th eigenvalue
    corresponding to the n-th eigenfunction of the corresponding integral
    covariance operator <math|<around|{|f<rsub|n><around|(|x|)>|}>>
  </theorem>

  <\proof>
    Let <math|w*<around|(|x,\<theta\>|)>> be a random process, function of
    the position vector <math|x> defined over the domain <math|D>, with
    <math|\<theta\>> belonging to the space of random events
    <math|\<Omega\>>. Let <math|<wide|w|\<bar\>><around|(|x|)>> denote the
    expected value of <math|w*<around|(|x,\<theta\>|)>> over all possible
    realizations of the process, and <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>
    denote its covariance function. By definition of the covariance function,
    it is bounded, symmetric and positive definite. Thus, it has the
    eigenfunction expansion <cite-detail|stochasticFiniteElements|2.3.1>

    <\equation>
      C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)><label|2.7>
    </equation>

    where <math|\<lambda\><rsub|n>> and <math|f<rsub|n><around|(|x|)>> are
    the eigenvalue and the eigenfunction of the covariance kernel. And,
    specifically, that they are the solution to the integral equation

    <\equation>
      <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|n><around|(|x<rsub|1>|)>*d*x<rsub|1>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|2>|)><label|2.8><style-only*|>
    </equation>

    Due to the symmetry and the positive definiteness of the covariance
    kernel, its eigenfunctions are orthogonal and form a complete set. They
    can be normalized according to the following criterion

    <\equation>
      <big|int><rsub|D>f<rsub|n><around|(|x|)>*f<rsub|m><around|(|x|)>*d*x=\<delta\><rsub|n*m><label|2.9>
    </equation>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Clearly,
    <math|w<around|(|x,\<theta\>|)>> can be written as

    <\equation>
      w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+\<alpha\><around|(|x,\<theta\>|)><label|2.10>
    </equation>

    where <math|\<alpha\><around|(|x,\<theta\>|)>> is a process with zero
    mean and covariance function <math|C<around*|(|x<rsub|1>,x<rsub|2>|)>>.
    The process <math|\<alpha\><around|(|x,\<theta\>|)>> can be expanded in
    terms of the eigenfunctions <math|f<rsub|n><around|(|x|)>> as

    <\equation>
      \<alpha\><around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.11>
    </equation>

    Second order properties of the random variables <math|\<xi\><rsub|n>> can
    be determined by multiplying both sides of equation (<reference|2.11>) by
    <math|\<alpha\><around|(|x<rsub|2>,\<theta\>|)>> and taking the
    expectation on both sides. Specifically, it is found that

    <\equation>
      <tabular|<tformat|<table|<row|<cell|C<around|(|x<rsub|1>,x<rsub|2>|)>>|<cell|=<around|\<langle\>|\<alpha\><around|(|x<rsub|1>,\<theta\>|)>*\<alpha\><around|(|x<rsub|2>,\<theta\>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|m=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|m><around|(|x<rsub|2>|)>>>>>><label|2.12>
    </equation>

    Then, multiplying both sides of equation (<reference|2.12>) by
    <math|f<rsub|k><around|(|x<rsub|2>|)>>, integrating over the domain
    <math|D>, and making use of the orthogonality of the eigenfunctions,
    yields

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|k><around|(|x<rsub|2>|)>*d*x<rsub|2>>|<cell|=\<lambda\><rsub|k>*f<rsub|k><around|(|x<rsub|1>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*f<rsub|n><around|(|x<rsub|1>|)>>>>>>
    </equation>

    Multiplying once more by <math|f<rsub|l><around|(|x<rsub|1>|)>> and
    integrating over <math|D> gives

    <\equation>
      <big|int><rsub|D><big|int><rsub|D>f<rsub|l><around|(|x<rsub|1>|)>*f<rsub|k><around|(|x<rsub|1>|)>*d*x<rsub|1>=<big|sum><rsub|n=0><rsup|\<infty\>>E*<around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*\<delta\><rsub|n*l>
    </equation>

    Then, using equation (<reference|2.9>) leads to

    <\equation>
      \<lambda\><rsub|k>*\<delta\><rsub|k*l>=<sqrt|\<lambda\><rsub|k>*\<lambda\><rsub|l>>*<around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>><label|2.15>
    </equation>

    Equation (<reference|2.15>) can be rearranged to give

    <\equation>
      <around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|k*l>
    </equation>

    Thus, the random process <math|w*<around|(|x,\<theta\>|)>> can be written
    as

    <\equation>
      w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.17>
    </equation>

    where

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>=0
    </equation>

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m><label|2.19>
    </equation>

    and <math|\<lambda\><rsub|n>,f<rsub|n><around|(|x|)>> are solution to
    equation (<reference|2.8>). Truncating the series in equation
    (<reference|2.17>) at the <math|M<rsup|t*h>> term, gives

    <\equation>
      w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|M>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.20>
    </equation>

    An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>>
    can be obtained by multiplying equation (<reference|2.11>) by
    <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
    That is,

    <\equation>
      \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)>*d*x|<sqrt|\<lambda\><rsub|n>>><label|2.21>
    </equation>
  </proof>

  <subsubsection|Reproducing Kernel Hilbert Spaces (RKHS)>

  The essential thing that the Reproducing Kernel Hilbert Space (RKHS)
  paradigm provides, is that either of equations (<reference|2.11>) or
  (<reference|2.20>), are expressions for the congruence that maps the
  Hilbert space spanned by the functions <math|f<rsub|n><around|(|x|)>> to
  the Hilbert space spanned by the random process, or equivalently, the set
  of random variables <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>>.
  It is this congruence along with the covariance function of the process
  that determines uniquely the random process
  <math|w*<around|(|x,\<theta\>|)>> as can be seen by observing the
  similarity of equations (<reference|2.11>) and (<reference|2.20>) with
  equations (<reference|2.7>) and (<reference|2.8>), respectively. If a
  function can be represented in terms of linear operations on the family
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, then <math|f> belongs to the
  RKHS corresponding to the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>,
  and the congruence between the two Hilbert spaces can be realized by the
  same linear operations used to represent <math|f> in terms of
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, <math|x<rsub|2>\<in\>D>.\ 

  Another point of practical importance is that the expansion given by
  equation (<reference|2.19>) can be used in a numerical simulation scheme to
  obtain numerical realizations of the random process. It is optimal in the
  Fourier sense, as it minimizes the mean square error resulting from
  truncation after a finite number of terms.It is well known from functional
  analysis that the steeper a bilinear form decays to zero as a function of
  one of its arguments, the more terms are needed in its spectral
  representation in order to reach a preset accuracy. Noting that the Fourier
  transform operator is a spectral representation, it may be concluded that
  the faster the autocorrelation function tends to zero, the broader is the
  corresponding spectral density, and the greater the number of requisite
  terms to represent the underlying random process by the Karhunen-Loeve
  expansion. Most theorems are limited to bounded-intervals and
  square-integrable kernels. This setup does not induce the ergodic
  assumption for the process since the domain is bounded; however, for many
  purposes the ergodic condition is not necessary but it may restored by
  extending the limits of integration in equation (<reference|2.33>) to
  infinity.<cite-detail|stochasticFiniteElements|2.3.2><cite-detail|stationaryAndRelatedStochasticProcesses|5.6>

  <subsection|Properties>

  <subsubsection|Error Minimization>

  <\lemma>
    <strong|Error Minimization>: The generalized coordinate system defined by
    the eigenfunctions of the covariance kernel is optimal in the sense that
    the mean-square error resulting from a finite representation of the
    process <math|w*<around|(|x,\<theta\>|)>> is minimized.
  </lemma>

  <\proof>
    Given a complete orthonormal set of functions
    <math|h<rsub|n><around|(|x|)>>, the process
    <math|w*<around|(|x,\<theta\>|)>> can be approximated in a convergent
    series of the form

    <\equation>
      w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<xi\><rsub|n><around|(|\<theta\>|)>*h<rsub|n><around|(|x|)><label|2.22>
    </equation>

    Truncating equation (<reference|2.21>) at the <math|M<rsup|t*h>> term
    results in an error <math|\<epsilon\><rsub|M>> equal to

    <\equation>
      \<epsilon\><rsub|M>=<big|sum><rsub|n=M+1><rsup|\<infty\>>\<lambda\><rsub|n>*\<xi\><rsub|n><around|(|\<theta\>|)>*h<rsub|n><around|(|x|)><label|2.23>
    </equation>

    Multiplying equation (<reference|2.21>) by <math|h<rsub|m><around|(|x|)>>
    and integrating throughout gives

    <\equation>
      \<xi\><rsub|m><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>w*<around|(|x,\<theta\>|)>*h<rsub|m><around|(|x|)>*d*x|<sqrt|\<lambda\><rsub|m>>><label|2.24>
    </equation>

    where use is made of the orthogonality property of the set
    <math|h<rsub|n><around|(|x|)>>. Substituting equation (<reference|2.23>)
    for <math|\<xi\><rsub|m><around|(|\<theta\>|)>> back into equation
    (<reference|2.22>), the mean-square error
    <math|\<epsilon\><rsub|M><rsup|2>> can be written as

    <\equation>
      \<epsilon\><rsub|M><rsup|2>=<around*|[|<big|sum><rsub|m=M+1><rsup|\<infty\>><big|sum><rsub|n=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D><around|\<langle\>|\<xi\><rsub|m><around|(|\<theta\>|)>*\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|n><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2>|]><rsup|2>
    </equation>

    Integrating equation (<reference|2.24>) over <math|D> and using the
    orthonormality of the set <math|<around|{|h<rsub|i><around|(|x|)>|}>>
    yields

    <\equation>
      <big|int><rsub|D>\<epsilon\><rsub|M><rsup|2>*d*x=<big|sum><rsub|m=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2><label|2.26>
    </equation>

    The problem, then, is to minimize <math|<big|int><rsub|D>\<epsilon\><rsub|M><rsup|2>>
    subject to the orthonormality of the functions
    <math|h<rsub|n><around|(|x|)>>. In other words, the solution minimizes
    the functional given by the equation

    <\equation>
      <with|font-base-size|9|\<cal-F\><around|[|h<around|(|x|)>|]>=<big|sum><rsub|m=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2>-\<lambda\><rsub|m>*<around*|[|<big|int><rsub|D>h<rsub|m><around|(|x|)>*h<rsub|m><around|(|x|)>*d*x-1|]>>
    </equation>

    Differentiating equation (<reference|2.26>) with respect to
    <math|h<rsub|i><around|(|x|)>> and setting the result equal to zero,
    gives

    <\equation>
      <frac|\<partial\>*\<cal-F\><around|[|h<around|(|x|)>|]>|\<partial\>*h<rsub|i><around|(|x|)>>=<big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|1>|)>*d*x<rsub|1>-\<lambda\><rsub|i>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>=0
    </equation>

    which is satisfied when

    <\equation>
      <big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\><rsub|i>*h<rsub|i><around|(|x<rsub|1>|)>
    </equation>
  </proof>

  <subsubsection|Uniqueness of the Expansion>

  <\lemma>
    <strong|Uniqueness>: The random variables appearing in an expansion of
    the kind given by equation (<reference|2.10>) are orthonormal if and only
    if the orthonormal functions <math|<around|{|f<rsub|n><around|(|x|)>|}>>
    and the constants <math|<around|{|\<lambda\><rsub|n>|}>> are respectively
    the eigenfunctions and the eigenvalues of the covariance kernel as given
    by equation (<reference|2.8>).
  </lemma>

  <\proof>
    The "if" part is an immediate consequence of equation (<reference|2.11>).
    To show the "only if" part, equation (<reference|2.12>) can be used with

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m>
    </equation>

    \ to obtain

    <\equation>
      C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
    </equation>

    Multiplying both sides by <math|f<rsub|m><around|(|x<rsub|2>|)>> and
    integrating over <math|D> gives

    <\equation>
      <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|2>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*\<delta\><rsub|n*m>=\<lambda\><rsub|m>*f<rsub|m><around|(|x<rsub|1>|)>
    </equation>
  </proof>

  <subsection|Solution of the Integral Equation>

  The usefulness of the Karhunen-Loeve expansion hinges on the ability to
  solve the integral equation of the form

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\>*f<around|(|x<rsub|1>|)><label|2.33>
  </equation>

  where <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is an autocovariance
  function. Equation (<reference|2.33>) is a homogeneous Fredholm integral
  equation of the second kind. Being an autocovariance function, by
  definition the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is bounded,
  symmetric, and positive definite. This fact simplifies the ensuing analysis
  considerably by virtue of the fact that positive definite kernels implies
  the existence of an RKHS for the kernel and its spectral density given by
  its Fourier transform is non-negative and non-decreasing over its domain of
  definition by Aronszajn's Theorem and Bochner's theorem respectively.

  <subsection|Exact Solutions For Stationary Processes>

  At the time of writing of <cite|stochasticFiniteElements> there was no
  general method for the solution of the integral equation (<reference|2.33>)
  corresponding to irrational spectra and furthermore most of the results are
  for finite bounded intervals <cite-detail|stochasticFiniteElements|2.3.2><space|1em>and
  thus do not presume ergodicity which may however be restored by extending
  the limits of integration in equation (<reference|2.33>) to infinity
  <cite-detail|stochasticFiniteElements|2.3.2> Here, we present an apparently
  novel an rather elegant way way to deduce the eigenfunctions of any
  stationary process, kernel square-integrable or not, domain unbounded or
  not.

  In <cite-detail|stochasticFiniteElements|2.3.2> a Galerkin type procedure,
  equivalent to the variational solution and also the Rayleigh-Ritz
  method<cite|theRayleighRitzMethodForIntegralCovarianceOperatorEigenspaces>
  is described for the solution of the Fredholm equation (<reference|2.33>)
  where <math|h<rsub|i><around|(|x|)>> is any complete set but here it will
  be shown that the best choice is not just any complete set of functions in
  the Hilbert space <math|H> but the specific complete orthogonal set given
  by orthogonal complement of the the Fourier transforms of the orthogonal
  polynomials whose orthogonality measure is equal to the spectral density of
  the process.\ 

  <\definition>
    Let the term 'spectral basis set' denote the orthogonal polynomials whose
    orthogonality measure is equal to the spectral density of the process
    which is given by the Fourier transform of the covariance kernel
    function.\ 
  </definition>

  For example, suppose that the kernel is given by a stationary
  (translation-invariant) process where the covariance is a function of one
  variable given by the difference between two points only

  <\equation>
    C<around*|(|t,s|)>=J<rsub|0><around*|(|t-s|)>
  </equation>

  Each eigenfunction of the kernel <math|C<around|(|t-s|)>> may then be
  represented exactly as

  <\equation>
    f<rsub|k><around|(|x|)>=*h<rsub|k><around|(|x|)><label|2.74>
  </equation>

  by defining <math|h<rsub|i><around*|(|x|)>> to be the orthogonal complement
  of the normalized Fourier transforms <math|Y<rsub|n><around*|(|y|)>> which
  are given by normalizing

  <\equation>
    <wide|T|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>T<rsub|n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x
  </equation>

  \<cdot\>

  the finite Fourier transform of the spectral basis set
  <math|T<rsub|n>>(here the Chebyshev type-I
  polynomials<cite|finiteFourierTransformsOfClassicalOrthogonalPolynomials>
  which is just the usual infinite Fourier transform with the integration
  restricted to the range <math|-1*\<ldots\>*1> since
  <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>> or
  equivalently taking the functions value to be 0 outside the range <math|-1>
  to <math|1>). Taking the Fourier transform of the elements of the spectral
  basis set takes it back into the time/space domain from the
  spectral(frequency) domain and by orthogonalizing the with respect to the
  unweighted <math|L<rsup|2>> inner product the optimal basis for the
  representation of the covariance function itself is constructed by noting
  that the partial sums of <math|h<rsub|i><around*|(|x|)>> will then
  pointwisely converge to <math|K=J<rsub|0>>\ 

  \ of the orthogonal polynomials spanning the spectral basis set
  <math|T<rsub|n>> given by the Gram-Schidt recursions

  <\equation>
    h<rsub|i><around|(|y|)>=<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>=<wide|T<rsup|>|^><rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|<wide|T|^><rsub|n><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>|\<rangle\>>>*<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>
  </equation>

  which in the case when <math|K=J<rsub|0>> the spectral density is seen to
  be equal to

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  so that we identify the spectral density with the Chebyshev polynomials of
  the first kind <math|T<rsub|n>>, since their orthogonality measure is, in
  fact, equal to the spectral density in the case
  <math|K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>>. Recalling that the
  Chebyshev polynomials' orthogonality relation is

  <\equation>
    <big|int><rsub|-1><rsup|1>T<rsub|n><around|(|\<omega\>|)>*T<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|\<pi\>>|<cell|n=m=0>>|<row|<cell|<frac|\<pi\>|2>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
  </equation>

  \;

  \ This error is equal to the difference between the left hand side and the
  right hand side of equation (<reference|2.33>). Substituting equation
  (<reference|2.74>) into equation (<reference|2.33>) yields the following
  expression for the error

  <\equation>
    e<rsub|N>=<big|sum><rsub|i=0><rsup|N>d<rsub|i><rsup|<around|(|k|)>>*<around*|[|<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>-\<lambda\><rsub|n>*h<rsub|i><around|(|x<rsub|1>|)>|]>
  </equation>

  Requiring the error to be orthogonal to the approximating space yields
  equations of the following form <math|\<forall\>j=1,\<ldots\>,N>

  <\equation>
    <around|(|e<rsub|N>,h<rsub|j><around|(|x|)>|)>=0
  </equation>

  Equivalently,

  <\equation>
    <big|sum><rsub|i=1><rsup|N>d<rsub|i><rsup|<around|(|k|)>><around*|[|<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>*h<rsub|j><around|(|x<rsub|1>|)>*d*x<rsub|1>|]>-\<lambda\><rsub|n>*<big|int><rsub|D>h<rsub|i><around|(|x|)>*h<rsub|j><around|(|x|)>*d*x=0<label|2.77>
  </equation>

  Denoting

  <\equation>
    C<rsub|i*j>=<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*h<rsub|j><around|(|x<rsub|1>|)>*d*x<rsub|1>*d*x<rsub|2><label|2.78>
  </equation>

  \;

  <\equation>
    B<rsub|i*j>=<big|int><rsub|D>h<rsub|i><around|(|x|)>*h<rsub|j><around|(|x|)>*<space|0.17em>d*x<label|2.79>
  </equation>

  <\equation>
    D<rsub|i*j>=d<rsup|<around|(|j|)>><rsub|i><text|>
  </equation>

  <\equation>
    \<Lambda\><rsub|i*j>=\<delta\><rsub|i*j>*\<lambda\><rsub|j><space|1em>
  </equation>

  equation (<reference|2.77>) becomes

  <\equation>
    C*D=\<Lambda\>B*D<label|2.82>
  </equation>

  where <math|C>, <math|B> and <math|D> are three <math|N>-dimensional
  matrices whose elements are given by equations
  (<reference|2.78>)-(<reference|2.79>). Equation (<reference|2.82>)
  represents a generalized algebraic eigenvalue problem which may be solved
  for the matrix <math|D> and the eigenvalues <math|\<lambda\><rsub|k>>.
  Backsubstituting into equation (<reference|2.74>) yields the eigenfunctions
  of the covariance kernel. The preceding procedure can be implemented using
  piecewise polynomials as the basis for the expansion. With this choice of
  basis functions, the columns of the matrix <math|<math-bf|D>> become the
  eigenvectors computed at the respective nodal points of the induced mesh,
  and the <math|i*j<rsup|t*h>> element of the matrix <math|<math-bf|C>>
  becomes the weighted correlation between the process at nodes <math|i> and
  <math|j>. Note that both matrices <math|<math-bf|C>> and <math|<math-bf|B>>
  are symmetric positive definite, a fact that substantially simplifies the
  numerical solution. The Galerkin scheme described above can be shown to be
  equivalent to a variational treatment of the problem. This property ensures
  that the computed eigenvalues are a lower bound of the correspondingly
  numbered exact eigenvalues. This implies that the convergence of each
  eigenvalue is monotonic in <math|N>. Further, note that the accuracy in
  estimating the eigenvalues is better than that achieved for the
  eigenfunctions (Delves and Mohamed, 1985).

  \;

  \;

  \;

  <subsubsection|<math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|t-s|)>f<around*|(|t|)>\<mathd\>t>>

  <\lemma>
    <label|ortho>The functions

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around*|(|-1|)><rsup|n><sqrt|<frac|4n+1|\<pi\>>>j<rsub|2n><around*|(|y|)>>>>>>
    </equation>

    are orthonormal over the interval <math|0> to <math|\<infty\>>, i.e.,

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|n*m>,
    </equation*>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta.
  </lemma>

  <\proof>
    Consider the integral

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y
    </equation>

    Substituting <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>>, we get:

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)><sqrt|<frac|4*m+1|y>>*<around|(|-1|)><rsup|m>*J<rsub|2*m+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
    </equation>

    This simplifies to:

    <\equation>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>*J<rsub|2*m+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
    </equation>

    Using the orthogonality relation for Bessel functions with
    <math|\<nu\>=-<frac|1|2>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>+2*n+1><around|(|t|)>*J<rsub|\<nu\>+2*m+1><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|2*<around|(|2*n+\<nu\>+1|)>>
    </equation>

    for <math|\<nu\>=-<frac|1|2>>, we have:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|t|)>*J<rsub|2*m+<frac|1|2>><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|4*n+1>
    </equation>

    Substituting this result back into the integral, we have:

    <\equation>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m><frac|\<delta\><rsub|n*m>|4*n+1>
    </equation>

    For <math|n\<neq\>m>, <math|\<delta\><rsub|n*m>=0>, yielding <math|I=0>.
    For <math|n=m>, <math|\<delta\><rsub|n*m>=1>, giving:

    <\equation>
      I=<frac|<sqrt|<around|(|4*n+1|)><rsup|2>>|4*n+1>=<frac|4*n+1|4*n+1>=1
    </equation>

    Hence, <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>> are orthonormal.
  </proof>

  <\theorem>
    The eigenvalues of

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>\<ast\>\<psi\><rsub|n><around|(|x|)>*d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation>

    are given by

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)><space|0.17em>d*x>>|<row|<cell|>|<cell|=<sqrt|<frac|4n+1|\<pi\>>><frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>>>>
    </equation>

    where <math|\<psi\><rsub|n><around|(|x|)>> is the orthonormal set defined
    in Lemma 1.
  </theorem>

  <\proof>
    To show that <math|\<psi\><rsub|n><around|(|y|)>> are eigenfunctions of
    the integral operator with kernel <math|J<rsub|0>*<around|(|x-y|)>> and
    to find the corresponding eigenvalues, we start with the given equation:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation*>

    where

    <\equation*>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation*>

    and the eigenvalues are:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    To find <math|\<lambda\><rsub|n>>, we compute:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Substituting <math|\<psi\><rsub|n><around|(|x|)>>:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)><sqrt|<frac|4*n+1|x>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Using the integral of products of Bessel functions:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>x<rsup|-<frac|1|2>>*J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    Thus:

    <\equation*>
      \<lambda\><rsub|n>=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    This completes the proof that <math|\<psi\><rsub|n><around|(|y|)>> are
    eigenfunctions of the integral operator with kernel
    <math|J<rsub|0>*<around|(|x-y|)>> and the corresponding eigenvalues are
    as given.
  </proof>

  <\definition>
    Let <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of
    the first kind,\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|j<rsub|n><around|(|z|)>>|<cell|=<sqrt|<frac|\<pi\>|2*z>>*J<rsub|n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|sin
      <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
      <around|(|z|)>*R<rsub|n-1,<frac|3|2>><around|(|z|)>|<sqrt|z>>>>>>>
    </equation>

    where <math|R<rsub|n,v><around|(|z|)>> are the so-called Lommel
    polynomials <cite|modifiedLommelPolynomials>

    <\equation>
      R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|2|z>|)><rsup|n><rsub|>*<rsub|2>F<rsub|3><around*|(|<around*|[|-<frac|n|2>,<frac|1|2>-<frac|n|2>|]>;<around*|[|v,-n,1-v-n|]>;-z<rsup|2>|)>
    </equation>

    where <math|*<rsub|2>F<rsub|3>> is a generalized hypergeometric function
    which are really rational functions which are said to be \Ppolynomial in
    <math|<frac|1|z>>\Q.\ 
  </definition>

  \;

  <\conjecture>
    The series

    <\equation>
      <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|t|)>>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|t|)>>>>>>
    </equation>

    converges uniformly for all complex <math|t> except the origin where it
    has a regular singular point where <math|lim<rsub|t\<rightarrow\>0>J<rsub|0><around*|(|t|)>=1>.
  </conjecture>

  <\conjecture>
    The eigenfunctions of the stationary integral covariance operator\ 

    <\equation>
      <around*|[|T \<psi\><rsub|n>|]><around*|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x=\<lambda\><rsub|n>\<psi\><rsub|n><around*|(|x|)><label|T>
    </equation>

    are given by

    <\equation>
      \<psi\><rsub|n><around*|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>
    </equation>

    and the eigenvalues are given by

    <math|<\text>
      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>>>>>>
      </equation>
    </text>>

    where <math|<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>> is the Pochhammer
    symbol(ascending/rising factorial).
  </conjecture>

  <\definition>
    The spectral density of a stationary process is the Fourier tranform of
    the covariance kernel due to Wiener-Khinchine theorem.
  </definition>

  <\definition>
    Let <math|S<rsub|n><around*|(|x|)>> be the orthogonal polynomials whose
    orthogonality measure is equal to the spectral density of the process.
    These polynomials shall be called the spectral polynomials corresponding
    to the process.
  </definition>

  <\example>
    Let the kernel function be given by <math|K<around*|(|t,s|)>=J<rsub|0><around*|(|t-s|)>>
    then identify the orthogonal polynomial sequence associated with the
    spectral density\ 

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|2|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
    </equation>

    as being twice the orthogonality measure of the Type-I Chebyshev
    polynomials <math|T<rsub|n><around*|(|x|)>> so that the orthogonal
    polynomial sequence is identified as\ 

    <\equation>
      S<rsub|n><around*|(|x|)>=<sqrt|2>T<rsub|n><around*|(|x|)>
    </equation>

    \ so that\ 

    <\equation>
      <big|int><rsub|-1><rsup|1>S<rsub|n><around|(|\<omega\>|)>*S<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|2\<pi\>>|<cell|n=m=0>>|<row|<cell|\<pi\>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
    </equation>
  </example>

  <\remark>
    \ If the spectral density does not equal the orthogonality measure of a
    known set of orthogonal polynomials then such a set can always be
    generated by applying the Gram-Schmidt process to the monomials so that
    they are transformed into a set that is orthogonal with respect any given
    spectral density (of a stationary process).
  </remark>

  <\definition>
    The sequence <math|<wide|S|^><rsub|n><around|(|y|)>> of Fourier
    transforms of the spectral polynomials <math|S<rsub|n><around*|(|x|)>> is
    given by

    <\equation>
      <wide|S|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>S<rsub|n><around*|(|x|)>e<rsup|i
      x y>\<mathd\>x
    </equation>
  </definition>

  <\example>
    The Fourier transforms of the Chebyshev polynomials are just the usual
    infinite Fourier transforms with the integration restricted to the range
    <math|-1*\<ldots\>*1> since <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>).
    Equivalently, the spectral density function can be extended to take the
    value 0 outside the interval <math|<around*|[|-1,1|]>>. The derivation of

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
      y>*T<rsub|n><around|(|x|)>d*y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
      y>*T<rsub|n><around|(|x|)>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
      y> <rsub|2>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|1|2>-<frac|x|2>|)>*<rsub|>d*x>>|<row|<cell|>|<cell|=<with|font-base-size|12|<frac|i*|y>*><around*|(|e<rsup|-i
      y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
    </equation>

    where

    <\equation>
      F<rsub|n><rsup|\<pm\>><around*|(|y|)>=<rsub|3>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|\<pm\>i
      y|2>|)>
    </equation>

    can be found in <cite|finiteFourierTransforms>.

    \;
  </example>

  <\definition>
    Let <math|Y<rsub|n><around*|(|y|)>> be the normalized spectral
    polynomials <math|S<rsub|n><around*|(|x|)>>
  </definition>

  <\example>
    \ When <math|K=J<rsub|0>> the spectral polynomials are given by

    <\equation>
      S<rsub|n><around*|(|x|)>=<sqrt|2>T<rsub|n><around*|(|x|)>
    </equation>

    so that \ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Y<rsub|n><around*|(|y|)>>|<cell|=<frac|<wide|T|^><rsub|n><around|(|y|)>|<around*|\||<wide|T|^><rsub|n>|\|>>>>|<row|<cell|>|<cell|=<frac|i*|y><around*|(|<frac|e<rsup|-i
      y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>|)>>>>>>
    </equation>

    where the <math|L<rsup|2>> norm of <math|<wide|T|^><rsub|n><around|(|y|)>>
    is given by

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|n>|\|><rsub|>>|<cell|=<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|T|^><rsub|n><around|(|y|)><rsup|2>\<mathd\>y>>>|<row|<cell|>|<cell|=<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>>>>>
    </equation>
  </example>

  \ 

  <\conjecture>
    The eigenfunctions of the integral covariance operator (<reference|T>)
    are given by the orthogonal complement of the normalized Fourier
    transforms <math|Y<rsub|n><around*|(|y|)>> of the spectral polynomials
    (via the Gram-Schmidt process)

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=Y<rsup|\<perp\>><rsub|n><around|(|y|)>=Y<rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|Y<rsub|n><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m><around|(|y|)>
    </equation>

    can be equivalently expressed as

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|2n+<frac|1|2>|*\<pi\>>>*<big|int><rsub|-1><rsup|1>P<rsub|2*n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x>>>>>
    </equation>
  </conjecture>

  <\remark>
    Since <math|T> is compact due to its self-adjointness and convergence of
    the eigenvalues to <math|0> it converges uniformly since compactness
    implies uniform convergence of the eigenfunctions. TODO: cite/theorems
    from <cite-detail|gaussianProcessIntroduction|3. Reproducing Kernel
    Hilbert Space of a Gaussian Process>
  </remark>

  <subsubsection|Simplifying The Convolution>

  Apply the addition theorem

  <\equation*>
    J<rsub|0>*<around|(|x-y|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>
  </equation*>

  to the integral covariance operator

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><big|int><rsub|0><rsup|\<infty\>>*J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y<space|1em>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><big|int><rsub|0><rsup|\<infty\>>*J<rsub|k>*<around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)><space|0.17em>d*y>>>>>
  </equation*>

  Where <math|\<psi\><rsub|n><around|(|y|)>> is:

  <\equation*>
    \<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
  </equation*>

  Substituting\ 

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)><space|0.17em>d*y>>|<row|<cell|>|<cell|=<frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>>>>>>
  </equation*>

  Now, putting it all back into the expansion for
  <math|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>:

  <\equation*>
    <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>
  </equation*>

  <\conjecture>
    \;

    <\equation>
      <big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k><around*|(|x|)><rsup|2>=<frac|1|\<pi\>>
    </equation>
  </conjecture>

  <section|Appendix>

  <subsection|A Theorem On The Development of Symmetric Nuclei>

  <\theorem>
    <cite-detail|whittakerAndWatsonCourseOfModernAnalysis|11.70> Let
    <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> be a complete set of
    orthogonal functions satisfying the homogeneous integral equation with
    symmetric nucleus

    <\equation>
      \<phi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    the corresponding characteristic numbers being
    <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<lambda\><rsub|3>,\<ldots\>>Now
    suppose that the series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
    is uniformly convergent when <math|0\<leqslant\>a\<leq\>\<alpha\>\<leq\>b\<leqslant\>\<infty\>>,<math|0\<leqslant\>a\<leq\>\<gamma\>\<leq\>b\<leqslant\>\<infty\>>.
    Then it will be shown that

    <\equation>
      K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>
  </theorem>

  <\proof>
    For consider the symmetric nucleus

    <\equation>
      H<around|(|\<alpha\>,\<gamma\>|)>=K<around|(|\<alpha\>,\<gamma\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    If this nucleus is not identically zero, it will possess at least one
    characteristic number <math|\<mu\>>. Let
    <math|\<psi\><around|(|\<gamma\>|)>> be any solution of the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>H<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    which does not vanish identically. Multiply by
    <math|\<phi\><rsub|m><around|(|\<alpha\>|)>> and integrate term-by-term
    (which we may do since the series converges uniformly by hypothesis
    proved by other means), and get

    <\equation>
      <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<alpha\>=\<mu\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<xi\>*d*\<alpha\>=0
    </equation>

    Therefore <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to
    <math|\<phi\><rsub|1><around|(|\<alpha\>|)>,\<phi\><rsub|2><around|(|\<alpha\>|)>,\<ldots\>>;
    and so taking the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    we have

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    Therefore <math|\<mu\>> is a characteristic number of
    <math|K<around|(|\<alpha\>,\<gamma\>|)>>, and so
    <math|\<psi\><around|(|\<alpha\>|)>> must be a linear combination of the
    functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> corresponding to
    this number; let

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=<big|sum><rsub|m>a<rsub|m>*\<phi\><rsub|m><around|(|\<alpha\>|)>
    </equation>

    Multiply by <math|\<phi\><rsub|m><around|(|\<gamma\>|)>> and integrate;
    then since <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to all the
    functions <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>, we see that
    <math|a<rsub|m>=0>, so, contrary to hypothesis,
    <math|\<psi\><around|(|\<alpha\>|)>=0>. The contradiction implies that
    the nucleus <math|H<around|(|\<alpha\>,\<gamma\>|)>> must be identically
    zero; that is to say, <math|K<around|(|\<alpha\>,\<gamma\>|)>> can be
    expanded in the given series, if it is uniformly convergent.
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|7>
      <bibitem*|1><label|bib-stationaryAndRelatedStochasticProcesses>Harald
      Cramér<localize| and >M.R.<nbsp>Leadbetter.
      <newblock><with|font-shape|italic|Stationary and Related Processes:
      Sample Function Properties and Their Applications>. <newblock>Wiley
      Series in Probability and Mathematical Statistics. 1967.<newblock>

      <bibitem*|2><label|bib-finiteFourierTransforms>Atul Dixit, Lin Jiu,
      Victor<nbsp>H Moll<localize|, and >Christophe Vignat. <newblock>The
      finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|3><label|bib-theRayleighRitzMethodForIntegralCovarianceOperatorEigenspaces>María<nbsp>Dolores<nbsp>Jiménez-Gamero,
      Ebner, Bruno<localize| and >Bojana Milo²evi¢. <newblock>Eigenvalues
      approximation of integral covariance operators with applications to
      weighted <math|L<rsup|2>> statistics.
      <newblock><with|font-shape|italic|ArXiv preprint>, 2408.08064:0,
      2024.<newblock>

      <bibitem*|4><label|bib-whittakerAndWatsonCourseOfModernAnalysis>George<nbsp>Neville<nbsp>Watson
      Edmund Taylor Whittaker. <newblock><with|font-shape|italic|A course of
      modern analysis: an introduction to the general theory of infinite
      processes and of analytic functions; with an account of the principal
      transcendental functions>. <newblock>University Press, 1920.<newblock>

      <bibitem*|5><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>

      <bibitem*|6><label|bib-modifiedLommelPolynomials>R.<nbsp>Wong K.F. Lee.
      <newblock>Asymptotic expansion of the modified lommel polynomials
      <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>

      <bibitem*|7><label|bib-gaussianProcessIntroduction>Steven<nbsp>P.<nbsp>Lalley.
      <newblock>Introduction to gaussian processes.
      <newblock>https://galton.uchicago.edu/<math|\<sim\>>elalley/Courses/386/GaussianProcesses.pdf,
      2013.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|2.10|<tuple|6|2>>
    <associate|2.11|<tuple|7|3>>
    <associate|2.12|<tuple|8|3>>
    <associate|2.15|<tuple|11|3>>
    <associate|2.17|<tuple|13|3>>
    <associate|2.19|<tuple|15|3>>
    <associate|2.20|<tuple|16|4>>
    <associate|2.21|<tuple|17|4>>
    <associate|2.22|<tuple|18|5>>
    <associate|2.23|<tuple|19|5>>
    <associate|2.24|<tuple|20|5>>
    <associate|2.26|<tuple|22|5>>
    <associate|2.33|<tuple|29|6>>
    <associate|2.7|<tuple|3|2>>
    <associate|2.74|<tuple|31|7>>
    <associate|2.77|<tuple|38|8>>
    <associate|2.78|<tuple|39|8>>
    <associate|2.79|<tuple|40|8>>
    <associate|2.8|<tuple|4|2>>
    <associate|2.82|<tuple|43|8>>
    <associate|2.9|<tuple|5|2>>
    <associate|KL|<tuple|1|1>>
    <associate|T|<tuple|57|12>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.4.1|9>>
    <associate|auto-11|<tuple|1.4.2|15>>
    <associate|auto-12|<tuple|2|16>>
    <associate|auto-13|<tuple|2.1|16>>
    <associate|auto-14|<tuple|79|17>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|2>>
    <associate|auto-4|<tuple|1.1.2|4>>
    <associate|auto-5|<tuple|1.2|4>>
    <associate|auto-6|<tuple|1.2.1|4>>
    <associate|auto-7|<tuple|1.2.2|6>>
    <associate|auto-8|<tuple|1.3|6>>
    <associate|auto-9|<tuple|1.4|6>>
    <associate|bib-finiteFourierTransforms|<tuple|2|17>>
    <associate|bib-gaussianProcessIntroduction|<tuple|7|17>>
    <associate|bib-modifiedLommelPolynomials|<tuple|6|17>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|17>>
    <associate|bib-stochasticFiniteElements|<tuple|5|17>>
    <associate|bib-theRayleighRitzMethodForIntegralCovarianceOperatorEigenspaces|<tuple|3|17>>
    <associate|bib-whittakerAndWatsonCourseOfModernAnalysis|<tuple|4|17>>
    <associate|ortho|<tuple|5|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements

      stochasticFiniteElements

      stationaryAndRelatedStochasticProcesses

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      theRayleighRitzMethodForIntegralCovarianceOperatorEigenspaces

      finiteFourierTransformsOfClassicalOrthogonalPolynomials

      modifiedLommelPolynomials

      finiteFourierTransforms

      gaussianProcessIntroduction

      whittakerAndWatsonCourseOfModernAnalysis
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Spectral Approach to Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Karhunen-Loeve Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Derivation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2<space|2spc>Reproducing Kernel Hilbert
      Spaces (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Error Minimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Uniqueness of the
      Expansion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Solution of the Integral
      Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Exact Solutions For
      Stationary Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.4.1<space|2spc><with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|t-s|)>f<around*|(|t|)>\<mathd\>t>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|1.4.2<space|2spc>Simplifying The
      Convolution <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>A Theorem On The Development
      of Symmetric Nuclei <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>