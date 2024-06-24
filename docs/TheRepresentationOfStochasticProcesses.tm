<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|parchment|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Representations of Stochastic
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    Most of the first two chapters of Roger<nbsp>G.<nbsp>Ghanem<localize| and
    >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
    finite elements: a spectral approach> are covered and a method of
    calculating the eigenfunctions and eigenvalues of any integral covariance
    operator of a stationary process is detailed.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Spectral Approach to Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>The Gelfand-Vilenkin Spectral
    Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>The Karhunen-Loeve Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc>Derivation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|1.2.2<space|2spc>Spectral Covariance Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|1.2.3<space|2spc>Reproducing Kernel Hilbert Spaces
    (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.3<space|2spc>Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|1.3.1<space|2spc>Error Minimization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|2tab|1.3.2<space|2spc>Uniqueness of the Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|1.3.3<space|2spc>Expansion of Gaussian Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|2tab|1.3.4<space|2spc>Minimum Representation Entropy
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|1.4<space|2spc>Solution of the Integral Equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|1.5<space|2spc>Exact Solutions For Stationary
    Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|1.6<space|2spc>Irrational Spectra and Ergodicity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>
  </table-of-contents>

  <section|The Spectral Approach to Stochastic Processes>

  <subsection|The Gelfand-Vilenkin Spectral Representation>

  The majority of the results on the representation of random processes have
  been derived for the class of second order
  processes<cite|stochasticFiniteElements>; one of the most important of
  which is the <verbatim|Gelfand-Vilenkin spectral representation> which
  states in its most general form

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int>g<around|(|x|)>*d*\<mu\><around|(|\<theta\>|)><label|2.1>
  </equation>

  where <math|w*<around|(|x,\<theta\>|)>> is a stochastic process whose
  covariance function <math|C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>> can
  be expressed as

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int>g<around|(|x<rsub|1>|)>*g<around|(|x<rsub|2>|)>*d*\<mu\><rsub|1><around|(|\<theta\>|)>*d*\<mu\><rsub|2><around|(|\<theta\>|)><label|2.2>
  </equation>

  In equation (<reference|2.1>), <math|g<around|(|x|)>> is a deterministic
  function and <math|d*\<mu\><around|(|\<theta\>|)>> is an orthogonal set
  function, also termed orthogonal stochastic measure, defined on the
  <math|\<sigma\>>-field <math|\<Psi\>> of random events. An important
  specialization of the spectral expansion occurs if the process
  <math|w*<around|(|x,\<theta\>|)>> is wide stationary. In this case,
  equation (<reference|2.1>) can be shown to reduce to the Wiener-Khintchine
  relation <cite|correlationTheoryOfStationaryRandomProcesses> and we have

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsup|T>*x>*d*\<mu\><around|(|\<omega\>,\<theta\>|)>
  </equation>

  and

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>*x<rsub|1>-\<omega\><rsub|2>*x<rsub|2>|)><rsup|T>>*S<around|(|\<omega\>|)>*d*\<omega\><label|S>
  </equation>

  where the symbol <math|T> denotes vector transposition,
  <math|S<around|(|\<omega\>|)>> is the usual <verbatim|spectral density> of
  the stationary process, and <math|\<omega\>> is the <verbatim|wave number
  vector>. In the equation for <math|C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>>:

  <\itemize>
    <item><math|e<rsup|i*<around|(|\<omega\><rsub|1>*x<rsub|1>-\<omega\><rsub|2>*x<rsub|2>|)><rsup|T>>>
    represents the complex exponential function used in Fourier transforms,
    indicating oscillations at frequencies <math|\<omega\><rsub|1>> and
    <math|\<omega\><rsub|2>> along dimensions <math|x<rsub|1>> and
    <math|x<rsub|2>>, respectively.

    <item><math|\<omega\><rsub|1>> and <math|\<omega\><rsub|2>> are spatial
    frequency components corresponding to different axes/dimensions (e.g.,
    <math|x<rsub|1>> and <math|x<rsub|2>>). They indicate how the wave's
    frequency components vary along these dimensions.

    <item>The term <math|S<around|(|\<omega\>|)>> represents the spectral
    density of the process at frequency <math|\<omega\>>, detailing how
    energy is distributed across different frequencies.

    <item>The integral sums these contributions across all frequencies to
    calculate the covariance between two points <math|x<rsub|1>> and
    <math|x<rsub|2>> in the process, incorporating the spatial structure and
    dependence of the process.
  </itemize>

  The impact of these spectral representations on the theory of random
  processes is significant but limited to deterministic systems subjected to
  random excitations. This limitation arises because these representations
  require differentials of random functions, placing them in an
  infinite-dimensional space, which complicates the development of
  computational algorithms. Similarly,<cite-detail|stochasticProcessesInferenceTheory|Ch.1
  Bibliogaphical notes, p.18> highlights a challenge in extending von
  Neumann's zero-sum two-person games to stochastic processes, hindered by
  the same issue of infinite-dimensionality.\ 

  <subsection|The Karhunen-Loeve Expansion>

  The Karhunen-Loeve expansion is an extensively used spectral representation
  theorem, whereby a random process <math|w*<around|(|x,\<theta\>|)>> can be
  expanded in terms of a denumerable set of orthogonal random variables in
  the form

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<mu\><rsub|i><around|(|\<theta\>|)>*g<rsub|i><around|(|x|)>
  </equation>

  where <math|<around|{|\<mu\><rsub|i><around|(|\<theta\>|)>|}>> is a set of
  orthogonal random variables and <math|<around|{|g<rsub|i><around|(|x|)>|}>>
  are deterministic functions, which can be related to the covariance kernel
  of <math|w*<around|(|x,\<theta\>|)>>. Note that since equation
  (<reference|2.5>) constitutes a representation of the random process in
  terms of a denumerable set of random variables, it is a quantization of the
  random process. It is important to note that this equation can be viewed as
  a representation of the process <math|w*<around|(|x,\<theta\>|)>> as a
  curve in the Hilbert space spanned by the set
  <math|<around|{|g<rsub|i><around|(|x|)>|}>> expressed as a direct sum of
  orthogonal projections in this Hilbert space whereby the magnitudes of the
  projections on successive basis vectors are proportional to the
  corresponding eigenvalues of the covariance function associated with the
  process <math|w*<around|(|x,\<theta\>|)>>. Collectively, the
  representations discussed up to <cite-detail|stochasticFiniteElements|2.2>
  can be thought of as linear operators or filters acting on processes with
  independent increments.

  <subsubsection|Derivation>

  The Karhunen-Loeve expansion is abtheoretically elegant and computationally
  appealing way to deal with measures spaces. It works by expanding functions
  in Fourier-like series as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n><around|(|\<theta\>|)>*f<rsub|n><around|(|x|)>
  </equation>

  where <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>> is a said to
  be a set of 'random' variables to be determined, <math|\<lambda\><rsub|n>>
  is some constant, and <math|<around|{|f<rsub|n><around|(|x|)>|}>> is an
  orthonormal set of deterministic basis functions. I find it a bit of a
  misnomer to refer to the sequence <math|\<xi\><rsub|n><around*|(|\<theta\>|)>>
  as random variables because in many instances these formulas are applied to
  deterministic, defined exact functions that do not involve randomness and
  in fact the theorems related to the Karhunen-Loeve expansion do not depend
  on any concepts that are inherently stochastic.

  <subsubsection|Spectral Covariance Representations>

  Let <math|w*<around|(|x,\<theta\>|)>> be a random process, function of the
  position vector <math|x> defined over the domain <math|D>, with
  <math|\<theta\>> belonging to the space of random events <math|\<Omega\>>.
  Let <math|<wide|w|\<bar\>><around|(|x|)>> denote the expected value of
  <math|w*<around|(|x,\<theta\>|)>> over all possible realizations of the
  process, and <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> denote its covariance
  function. By definition of the covariance function, it is bounded,
  symmetric and positive definite. Thus, it has the eigenfunction expansion
  <cite-detail|stochasticFiniteElements|2.3.1>

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)><label|2.7>
  </equation>

  where <math|\<lambda\><rsub|n>> and <math|f<rsub|n><around|(|x|)>> are the
  eigenvalue and the eigenfunction of the covariance kernel. And,
  specifically, that they are the solution to the integral equation

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|n><around|(|x<rsub|1>|)>*d*x<rsub|1>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|2>|)><label|2.8><style-only*|>
  </equation>

  Due to the symmetry and the positive definiteness of the covariance kernel,
  its eigenfunctions are orthogonal and form a complete set. They can be
  normalized according to the following criterion

  <\equation>
    <big|int><rsub|D>f<rsub|n><around|(|x|)>*f<rsub|m><around|(|x|)>*d*x=\<delta\><rsub|n*m><label|2.9>
  </equation>

  where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Clearly,
  <math|w<around|(|x,\<theta\>|)>> can be written as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+\<alpha\><around|(|x,\<theta\>|)><label|2.10>
  </equation>

  where <math|\<alpha\><around|(|x,\<theta\>|)>> is a process with zero mean
  and covariance function <math|C<around*|(|x<rsub|1>,x<rsub|2>|)>>. The
  process <math|\<alpha\><around|(|x,\<theta\>|)>> can be expanded in terms
  of the eigenfunctions <math|f<rsub|n><around|(|x|)>> as

  <\equation>
    \<alpha\><around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.11>
  </equation>

  Second order properties of the random variables <math|\<xi\><rsub|n>> can
  be determined by multiplying both sides of equation (<reference|2.11>) by
  <math|\<alpha\><around|(|x<rsub|2>,\<theta\>|)>> and taking the expectation
  on both sides. Specifically, it is found that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|C<around|(|x<rsub|1>,x<rsub|2>|)>>|<cell|=<around|\<langle\>|\<alpha\><around|(|x<rsub|1>,\<theta\>|)>*\<alpha\><around|(|x<rsub|2>,\<theta\>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|m=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|m><around|(|x<rsub|2>|)>>>>>><label|2.12>
  </equation>

  Then, multiplying both sides of equation (<reference|2.12>) by
  <math|f<rsub|k><around|(|x<rsub|2>|)>>, integrating over the domain
  <math|D>, and making use of the orthogonality of the eigenfunctions, yields

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

  An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>> can
  be obtained by multiplying equation (<reference|2.11>) by
  <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
  That is,

  <\equation>
    \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)>*d*x|<sqrt|\<lambda\><rsub|n>>><label|2.21>
  </equation>

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
  infinity.<cite-detail|stochasticFiniteElements|2.3.2>

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

  <subsubsection|Expansion of Gaussian Processes>

  Let <math|w*<around|(|x,\<theta\>|)>> be a Gaussian process with covariance
  function <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>. Then
  <math|w*<around|(|x,\<theta\>|)>> has the Karhunen-Loeve decomposition
  given by equation (<reference|2.17>) with the random variables
  <math|\<xi\><rsub|i><around|(|\<theta\>|)>> forming a Gaussian vector. That
  is, any subset of <math|<around|{|\<xi\><rsub|i><around|(|\<theta\>|)>|}>>
  is jointly Gaussian. Since these random variables are uncorrelated, their
  Gaussian property implies their independence. Some important consequences
  derive from this property. Specifically,

  <\equation>
    <around|\<langle\>|\<xi\><rsub|1><around|(|\<theta\>|)>,\<ldots\>,\<xi\><rsub|2*n+1><around|(|\<theta\>|)>|\<rangle\>>=0
  </equation>

  and

  <\equation>
    <around|\<langle\>|\<xi\><rsub|1><around|(|\<theta\>|)>,\<ldots\>,\<xi\><rsub|2*n><around|(|\<theta\>|)>|\<rangle\>>=<big|sum><big|prod><around|\<langle\>|\<xi\><rsub|i><around|(|\<theta\>|)>*\<xi\><rsub|j><around|(|\<theta\>|)>|\<rangle\>>
  </equation>

  where the summation extends over all the partitions of the set
  <math|<around|{|\<xi\><rsub|i><around|(|\<theta\>|)>|}><rsup|2*n><rsub|i=1>>
  into sets of two elements, and the product is over all such sets in a given
  partition. Furthermore, it can be shown (Loeve, 1977) that for Gaussian
  processes, the Karhunen-Loeve expansion is almost surely convergent.

  <subsubsection|Minimum Representation Entropy>

  The minimum representation of entropy property is worth mentioning even
  though it only references and no details were given in
  <cite|stochasticFiniteElements>.

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

  In this section, a Galerkin type procedure is described for the solution of
  the Fredholm equation (<reference|2.33>) where
  <math|h<rsub|i><around|(|x|)>> is not just any complete set of functions in
  the Hilbert space <math|H> but a complete orthogonal set given by
  orthogonalizing the Fourier transforms of the orthogonal polynomials whose
  orthogonality measure is equal to the spectral density of the process.\ 

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

  <subsection|Irrational Spectra and Ergodicity>

  At the time of writing of <cite|stochasticFiniteElements> there was no
  general method for the solution of the integral equation (<reference|2.33>)
  corresponding to irrational spectra and furthermore most of the results are
  for finite bounded intervals. <cite-detail|stochasticFiniteElements|2.3.2>
  Most theorems are limited to bounded-intervals and therefore do not presume
  ergodicity which may restored by extending the limits of integration in
  equation (<reference|2.33>) to infinity and modifying the portions of the
  corresponding lemmas and theorems that depend on boundedness of the
  interval or square-integrability of the
  kernel.<cite-detail|stochasticFiniteElements|2.3.2>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|4>
      <bibitem*|1><label|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials>Atul
      Dixit, Lin Jiu, Victor<nbsp>H Moll<localize|, and >Christophe Vignat.
      <newblock>The finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|2><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>

      <bibitem*|3><label|bib-stochasticProcessesInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>

      <bibitem*|4><label|bib-correlationTheoryOfStationaryRandomProcesses>A.M.<nbsp>Yaglom.
      <newblock><with|font-shape|italic|Correlation Theory of Stationary and
      Related Random Functions>, <localize|volume> I: Basic Results<localize|
      of ><with|font-shape|italic|Applied Probability>. <newblock>Springer
      New York, 1987.<newblock>
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
    <associate|2.1|<tuple|1|1>>
    <associate|2.10|<tuple|10|4>>
    <associate|2.11|<tuple|11|4>>
    <associate|2.12|<tuple|12|4>>
    <associate|2.15|<tuple|15|5>>
    <associate|2.17|<tuple|17|5>>
    <associate|2.19|<tuple|19|5>>
    <associate|2.2|<tuple|2|2>>
    <associate|2.20|<tuple|20|5>>
    <associate|2.21|<tuple|21|5>>
    <associate|2.22|<tuple|22|6>>
    <associate|2.23|<tuple|23|6>>
    <associate|2.24|<tuple|24|6>>
    <associate|2.26|<tuple|26|7>>
    <associate|2.33|<tuple|35|8>>
    <associate|2.7|<tuple|7|3>>
    <associate|2.74|<tuple|37|9>>
    <associate|2.77|<tuple|44|10>>
    <associate|2.78|<tuple|45|10>>
    <associate|2.79|<tuple|46|10>>
    <associate|2.8|<tuple|8|4>>
    <associate|2.82|<tuple|49|10>>
    <associate|2.9|<tuple|9|4>>
    <associate|S|<tuple|4|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.3.3|8>>
    <associate|auto-11|<tuple|1.3.4|8>>
    <associate|auto-12|<tuple|1.4|8>>
    <associate|auto-13|<tuple|1.5|9>>
    <associate|auto-14|<tuple|1.6|11>>
    <associate|auto-15|<tuple|1.6|11>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.2.1|3>>
    <associate|auto-5|<tuple|1.2.2|3>>
    <associate|auto-6|<tuple|1.2.3|5>>
    <associate|auto-7|<tuple|1.3|6>>
    <associate|auto-8|<tuple|1.3.1|6>>
    <associate|auto-9|<tuple|1.3.2|7>>
    <associate|bib-correlationTheoryOfStationaryRandomProcesses|<tuple|4|11>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|1|11>>
    <associate|bib-stochasticFiniteElements|<tuple|2|11>>
    <associate|bib-stochasticProcessesInferenceTheory|<tuple|3|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements

      correlationTheoryOfStationaryRandomProcesses

      stochasticProcessesInferenceTheory

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      finiteFourierTransformsOfClassicalOrthogonalPolynomials

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Spectral Approach to Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Gelfand-Vilenkin
      Spectral Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Karhunen-Loeve Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Derivation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Spectral Covariance
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.2.3<space|2spc>Reproducing Kernel Hilbert
      Spaces (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.3.1<space|2spc>Error Minimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|1.3.2<space|2spc>Uniqueness of the
      Expansion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.3.3<space|2spc>Expansion of Gaussian
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|1.3.4<space|2spc>Minimum Representation
      Entropy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Solution of the Integral
      Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Exact Solutions For
      Stationary Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Irrational Spectra and
      Ergodicity <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>