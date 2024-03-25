<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectral Representation of Stochastic
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    This is a nearly verbatim reproduction of most of the first two chapters
    of Roger<nbsp>G.<nbsp>Ghanem<localize| and >Pol<nbsp>D.<nbsp>Spanos.
    <newblock><with|font-shape|italic|Stochastic finite elements: a spectral
    approach>. <newblock>Springer-Verlag, Berlin, Heidelberg, 1991.<newblock>
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Spectral Approach to Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Karhunen-Loeve Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|2tab|1.1.1<space|2spc>Derivation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.1.2<space|2spc>Spectral Covariance Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|1.1.3<space|2spc>Reproducing Kernel Hilbert Spaces
    (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|1.2<space|2spc>Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|1.2.1<space|2spc>Error Minimization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|1.2.2<space|2spc>Uniqueness of the Expansion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|2tab|1.2.3<space|2spc>Expansion of Gaussian Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|1.2.4<space|2spc>Minimum Representation Entropy
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|1.3<space|2spc>Solution of the Integral Equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|1.4<space|2spc>Irrational Spectra
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|2tab|1.4.1<space|2spc>Wiener process
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|1.5<space|2spc>Numerical Solution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>
  </table-of-contents>

  <section|The Spectral Approach to Stochastic Processes>

  Following verabatim(for the most part) the excellent account of the theory
  of the spectral representation of stochastic proceses
  <cite|stochasticFiniteElements>, the central concepts of the theory of
  representation for random processes can be formulated where the majority of
  the results have been derived for the class of second order processes. A
  very important result is the <verbatim|Gelfand an-Vilenkin spectral
  representation of random processes> which, in its most general form, can be
  stated as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int>g<around|(|x|)>*d*\<mu\><around|(|\<theta\>|)><label|2.1>
  </equation>

  where <math|w*<around|(|x,\<theta\>|)>> is a stochastic process whose
  covariance function <math|C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>>
  admits of the decomposition

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int>g<around|(|x<rsub|1>|)>*g<around|(|x<rsub|2>|)>*d*\<mu\><rsub|1><around|(|\<theta\>|)>*d*\<mu\><rsub|2><around|(|\<theta\>|)><label|2.2>
  </equation>

  In equation (2.1), <math|g<around|(|x|)>> is a deterministic function.
  Further, <math|d*\<mu\><around|(|\<theta\>|)>> is an orthogonal set
  function, also termed orthogonal stochastic measure, defined on the
  <math|\<sigma\>>-field <math|\<Psi\>> of random events. An important
  specialization of the spectral decomposition occurs if the process
  <math|w*<around|(|x,\<theta\>|)>> is wide stationary. In this case,
  equation (<reference|2.1>) can be shown to reduce to the Wiener-Khintchine
  relation (Yaglom, 1962) and the following equations hold

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsup|T>*x>*d*\<mu\><around|(|\<omega\>,\<theta\>|)>
  </equation>

  and

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsup|1>*x<rsub|1>-\<omega\><rsup|2>*x<rsub|2>|)><rsup|T>>*S<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  Here, the symbol <math|T> denotes vector transposition,
  <math|S<around|(|\<omega\>|)>> is the usual <verbatim|spectral density> of
  the stationary process, and <math|\<omega\>> is the <verbatim|wave number
  vector>.

  The preceding representations have had a strong impact on the subsequent
  development of the theory of random processes. However, their applications
  have been restricted to randomly excited deterministic systems. This is
  largely attributed to the fact that all of these representations involve
  differentials of random functions, and are therefore set in an infinite
  dimensional space, not readily amenable to computational algorithms. An
  analagous problem arises in <cite-detail|stochasticInferenceTheory|Ch.1
  Bibliogaphical notes, p.18> where the hoped for revolution in von Neumann's
  zero-sum two person sum games formal similarity to a problem in inference
  theory on the nature of the distinguishibility of hypothesis due to the
  fact that no one has so far been able to generalize the theory to the
  realistic case of stochastic processses due to the infinite-dimensionality
  just mentioned.\ 

  \ An alternative formulation of the spectral representation, and one which
  is extensively used in the sequel, is the Karhunen-Loeve expansion whereby
  a random process <math|w*<around|(|x,\<theta\>|)>> can be expanded in terms
  of a denumerable set of orthogonal random variables in the form

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<mu\><rsub|i><around|(|\<theta\>|)>*g<rsub|i><around|(|x|)>
  </equation>

  where <math|<around|{|\<mu\><rsub|i><around|(|\<theta\>|)>|}>> is a set of
  orthogonal random variables and <math|<around|{|g<rsub|i><around|(|x|)>|}>>
  are deterministic functions, which can be related to the covariance kernel
  of <math|w*<around|(|x,\<theta\>|)>>. Note that since equation (2.5)
  constitutes a representation of the random process in terms of a
  denumerable set of random variables, it may be regarded as an abstract
  discretization of the random process. It is important to note that this
  equation can be viewed as a representation of the process
  <math|w*<around|(|x,\<theta\>|)>> as a curve in the Hilbert space spanned
  by the set <math|<around|{|g<rsub|i><around|(|x|)>|}>>. The random process
  <math|w*<around|(|x,\<theta\>|)>> is expressed as a direct sum of
  orthogonal projections in this Hilbert space whereby the magnitudes of the
  projections on successive basis vectors are proportional to the
  corresponding eigenvalues of the covariance function associated with the
  process <math|w*<around|(|x,\<theta\>|)>>. Collectively, the
  representations discussed up to <cite-detail|stochasticFiniteElements|2.2>
  can be thought of as linear operators or filters acting on processes with
  independent increments (Doob, 1953). Given the crucial role that the
  Karhunen-Loeve expansion has in relation to the methods discussed in
  <cite-detail|stochasticFiniteElements|2.3> its essential features shall be
  reiterated.

  <subsection|Karhunen-Loeve Expansion>

  <subsubsection|Derivation>

  One of the major difficulties associated with the numerical incorporation
  of random processes in finite element analyses, is the necessity of dealing
  with infinite-dimensional spaces. The major conceptual difficulty from the
  viewpoint of the class of problems considered involves the treatment of
  functions defined on abstract spaces of random variables defined on
  <math|\<sigma\>>-fields of random events. The most widely used method, the
  Monte Carlo simulation, consists of sampling these functions at randomly
  chosen elements of this <math|\<sigma\>>-field, in a random,
  collocation-like, scheme. Obviously, a quite large number of points needs
  to be sampled if a good approximation is to be achieved. I've always
  thought the method was a terrible hack and led to no good. The
  Karhunen-Loeve expansion is a muc theoretically elegant and computationally
  appealing way to deal with abstract measures spaces can sometimes have
  limited physical intuitive support. It works by expanding functions in
  Fourier-like series as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n><around|(|\<theta\>|)>*f<rsub|n><around|(|x|)>
  </equation>

  where <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>> is a usually
  said to be a set of random variables to be determined,
  <math|\<lambda\><rsub|n>> is some constant, and
  <math|<around|{|f<rsub|n><around|(|x|)>|}>> is an orthonormal set of
  deterministic functions. I find it a bit of a misnomer to refer to the
  sequence <math|\<xi\><rsub|n><around*|(|\<theta\>|)>> as random variables
  because none of the mathematics is dependent upon the stochastic nature to
  which they are usually applied or regarded. For instance, the realization
  of a well known complex analytic function with a very elaborate behaviour
  can be shown to be the principal realization of a Gaussian process having a
  certain kernel. In this instance, even though we use the mathematics of
  randomness and stochastics the function to which it applies can be computed
  to any degree of precision at any given point and in that sense there is
  nothing random about it, other than the fact that I have yet to point out
  to everyone how it comes together.\ 

  <subsubsection|Spectral Covariance Representations>

  Let <math|w*<around|(|x,\<theta\>|)>> be a random process, function of the
  position vector <math|x> defined over the domain <math|D>, with
  <math|\<theta\>> belonging to the space of random events <math|\<Omega\>>.
  Let <math|<wide|w|\<bar\>><around|(|x|)>> denote the expected value of
  <math|w*<around|(|x,\<theta\>|)>> over all possible realizations of the
  process, and <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> denote its covariance
  function. By definition of the covariance function, it is bounded,
  symmetric and positive definite. Thus, it has the spectral decomposition
  <cite-detail|stochasticFiniteElements|2.3.1>

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  where <math|\<lambda\><rsub|n>> and <math|f<rsub|n><around|(|x|)>> are the
  eigenvalue and the eigenfunction of the covariance kernel. And,
  specifically, that they are the solution to the integral equation

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|n><around|(|x<rsub|1>|)>*d*x<rsub|1>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  Due to the symmetry and the positive definiteness of the covariance kernel,
  its eigenfunctions are orthogonal and form a complete set. They can be
  normalized according to the following criterion

  <\equation>
    <big|int><rsub|D>f<rsub|n><around|(|x|)>*f<rsub|m><around|(|x|)>*d*x=\<delta\><rsub|n*m>
  </equation>

  where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Clearly,
  <math|w<around|(|x,\<theta\>|)>> can be written as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+\<alpha\><around|(|x,\<theta\>|)>
  </equation>

  where <math|\<alpha\><around|(|x,\<theta\>|)>> is a process with zero mean
  and covariance function <math|C<around*|(|x<rsub|1>,x<rsub|2>|)>>. The
  process <math|\<alpha\><around|(|x,\<theta\>|)>> can be expanded in terms
  of the eigenfunctions <math|f<rsub|n><around|(|x|)>> as

  <\equation>
    \<alpha\><around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.11>
  </equation>

  Second order properties of the random variables <math|\<xi\><rsub|n>> can
  be determined by multiplying both sides of equation (2.11) by
  <math|\<alpha\><around|(|x<rsub|2>,\<theta\>|)>> and taking the expectation
  on both sides. Specifically, it is found that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|C<around|(|x<rsub|1>,x<rsub|2>|)>>|<cell|=<around|\<langle\>|\<alpha\><around|(|x<rsub|1>,\<theta\>|)>*\<alpha\><around|(|x<rsub|2>,\<theta\>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|m=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|m><around|(|x<rsub|2>|)>>>>>>
  </equation>

  Then, multiplying both sides of equation (2.12) by
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

  Then, using equation (2.9) leads to

  <\equation>
    \<lambda\><rsub|k>*\<delta\><rsub|k*l>=<sqrt|\<lambda\><rsub|k>*\<lambda\><rsub|l>>*<around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>
  </equation>

  Equation (2.15) can be rearranged to give

  <\equation>
    <around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|k*l>
  </equation>

  Thus, the random process <math|w*<around|(|x,\<theta\>|)>> can be written
  as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>
  </equation>

  where

  <\equation>
    <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>=0
  </equation>

  <\equation>
    <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m>
  </equation>

  and <math|\<lambda\><rsub|n>,f<rsub|n><around|(|x|)>> are solution to
  equation (2.8). Truncating the series in equation (2.17) at the
  <math|M<rsup|t*h>> term, gives

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|M>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>
  </equation>

  An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>> can
  be obtained by multiplying equation (<reference|2.11>) by
  <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
  That is,

  <\equation>
    \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)>*d*x|<sqrt|\<lambda\><rsub|n>>>
  </equation>

  <subsubsection|Reproducing Kernel Hilbert Spaces (RKHS)>

  The essential thing that the Reproducing Kernel Hilbert Space (RKHS)
  (Aronszajn, 1950; Parzen, 1959), either of equations (2.11) or (2.20), is
  an expression for the congruence that maps the Hilbert space spanned by the
  functions <math|f<rsub|n><around|(|x|)>> to the Hilbert space spanned by
  the random process, or equivalently, the space spanned by the set of random
  variables <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>>. It is
  this congruence along with the covariance function of the process that
  determines uniquely the random process <math|w*<around|(|x,\<theta\>|)>>.
  Observe the similarity of equations (<reference|2.11>) and (2.20) with
  equations (2.7) and (2.8), respectively. Indeed, it can be shown (Parzen,
  1959) that if a function can be represented in terms of linear operations
  on the family <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, then <math|f>
  belongs to the RKHS corresponding to the kernel
  <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>, and the congruence between the
  two Hilbert spaces means of the same linear operations used to represent
  <math|f> in terms of <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>,
  <math|x<rsub|2>\<in\>D>.\ 

  Another point of practical importance is that the expansion given by
  equation (2.19) can be used in a numerical simulation scheme to obtain
  numerical realizations of the random process. It is optimal in the Fourier
  sense, as it minimizes the mean square error resulting from truncation
  after a finite number of terms.It is well known from functional analysis
  that the steeper a bilinear form decays to zero as a function of one of its
  arguments, the more terms are needed in its spectral representation in
  order to reach a preset accuracy. Noting that the Fourier transform
  operator is a spectral representation, it may be concluded that the faster
  the autocorrelation function tends to zero, the broader is the
  corresponding spectral density, and the greater the number of requisite
  terms to represent the underlying random process by the Karhunen-Loeve
  expansion.\ 

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
      w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<xi\><rsub|n><around|(|\<theta\>|)>*h<rsub|n><around|(|x|)>.
    </equation>

    Truncating equation (2.21) at the <math|M<rsup|t*h>> term results in an
    error <math|\<epsilon\><rsub|M>> equal to

    <\equation>
      \<epsilon\><rsub|M>=<big|sum><rsub|n=M+1><rsup|\<infty\>>\<lambda\><rsub|n>*\<xi\><rsub|n><around|(|\<theta\>|)>*h<rsub|n><around|(|x|)>.
    </equation>

    Multiplying equation (2.21) by <math|h<rsub|m><around|(|x|)>> and
    integrating throughout gives

    <\equation>
      \<xi\><rsub|m><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>w*<around|(|x,\<theta\>|)>*h<rsub|m><around|(|x|)>*d*x|<sqrt|\<lambda\><rsub|m>>>
    </equation>

    where use is made of the orthogonality property of the set
    <math|h<rsub|n><around|(|x|)>>. Substituting equation (2.23) for
    <math|\<xi\><rsub|m><around|(|\<theta\>|)>> back into equation (2.22),
    the mean-square error <math|\<epsilon\><rsub|M><rsup|2>> can be written
    as

    <\equation>
      \<epsilon\><rsub|M><rsup|2>=<around*|[|<big|sum><rsub|m=M+1><rsup|\<infty\>><big|sum><rsub|n=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D><around|\<langle\>|\<xi\><rsub|m><around|(|\<theta\>|)>*\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|n><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2>|]><rsup|2>
    </equation>

    Integrating equation (2.24) over <math|D> and using the orthonormality of
    the set <math|<around|{|h<rsub|i><around|(|x|)>|}>> yields

    <\equation>
      <big|int><rsub|D>\<epsilon\><rsub|M><rsup|2>*d*x=<big|sum><rsub|m=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2>
    </equation>

    The problem, then, is to minimize <math|<big|int><rsub|D>\<epsilon\><rsub|M><rsup|2>>
    subject to the orthonormality of the functions
    <math|h<rsub|n><around|(|x|)>>. In other words, the solution minimizes
    the functional given by the equation

    <\equation>
      <with|font-base-size|9|\<cal-F\><around|[|h<around|(|x|)>|]>=<big|sum><rsub|m=M+1><rsup|\<infty\>><big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|m><around|(|x<rsub|1>|)>*h<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|1>*d*x<rsub|2>-\<lambda\><rsub|m>*<around*|[|<big|int><rsub|D>h<rsub|m><around|(|x|)>*h<rsub|m><around|(|x|)>*d*x-1|]>>
    </equation>

    Differentiating equation (2.26) with respect to
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
    the kind given by equation (2.10) are orthonormal if and only if the
    orthonormal functions <math|<around|{|f<rsub|n><around|(|x|)>|}>> and the
    constants <math|<around|{|\<lambda\><rsub|n>|}>> are respectively the
    eigenfunctions and the eigenvalues of the covariance kernel as given by
    equation (2.8).
  </lemma>

  <\proof>
    The "if" part is an immediate consequence of equation (2.11). To show the
    "only if" part, equation (2.12) can be used with

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
  given by equation (2.17) with the random variables
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

  <subsection|Irrational Spectra>

  There is no general method for the solution of the integral equation
  (<reference|2.33>) corresponding to irrational spectra.

  \;

  \;

  <subsubsection|Wiener process>

  Another kernel that may be treated by the same method is the kernel of the
  Wiener process. It is given by the equation

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=min
    <around|(|x<rsub|1>,x<rsub|2>|)>\<forall\><around|(|x<rsub|1>,x<rsub|2>|)>\<in\><around|[|0,T|]>\<times\><around|[|0,T|]>
  </equation>

  The resulting normalized eigenfunctions and eigenvalues are

  <\equation>
    f<rsub|n><around|(|x<rsub|1>|)>=<sqrt|2>*sin
    <around*|(|<frac|n*\<pi\>*x<rsub|1>|T>|)>
  </equation>

  and

  <\equation>
    \<lambda\><rsub|n>=<frac|4*T<rsup|2>|\<pi\><rsup|2>*<around|(|2*n+1|)><rsup|2>>\<forall\>n=0,1,\<ldots\>
  </equation>

  Note that the Wiener process is an example of a nonstationary process, a
  fact that emphasizes the generality of the Karhunen-Loeve expansion and its
  applicability to such processes.

  <\remark>
    A final remark is in order concerning the choice of the domain <math|D>
    of definition of the random process being investigated. Taking <math|D>
    to be the finite domain over which the process is being observed may
    often be the most obvious choice. Clearly, this choice does not induce
    the ergodic assumption for the process, which involves observing infinite
    length records. This is by no means a handicap of this approach since the
    ergodic assumption is usually introduced for convenience and is not
    necessary for the present study. If ergodicity is needed for some
    particular problem, then it may be recovered by extending the limits of
    integration in equation (<reference|2.33>) to
    infinity.<cite-detail|stochasticFiniteElements|2.3.2>
  </remark>

  <subsection|Numerical Solution>

  In this section, a Galerkin type procedure is described for the solution of
  the Fredholm equation (2.33). Let <math|h<rsub|i><around|(|x|)>> be a
  complete set of functions in the Hilbert space <math|H>. Each eigenfunction
  of the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> may be represented
  as

  <\equation>
    f<rsub|k><around|(|x|)>=<big|sum><rsub|i=1><rsup|N>d<rsub|i><rsup|<around|(|k|)>>*h<rsub|i><around|(|x|)>
  </equation>

  with an error <math|e<rsub|N>> resulting from truncating the summation
  after the <math|N>th term. This error is equal to the difference between
  the left hand side and the right hand side of equation (2.33). Substituting
  equation (2.74) into equation (2.33) yields the following expression for
  the error

  <\equation>
    e<rsub|N>=<big|sum><rsub|i=1><rsup|N>d<rsub|i><rsup|<around|(|k|)>>*<around*|[|<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>-\<lambda\><rsub|n>*h<rsub|i><around|(|x<rsub|1>|)>|]>
  </equation>

  Requiring the error to be orthogonal to the approximating space yields
  equations of the following form

  <\equation>
    <around|(|e<rsub|N>,h<rsub|j><around|(|x|)>|)>=0\<forall\>j=1,\<ldots\>,N
  </equation>

  Equivalently,

  <\equation>
    <big|sum><rsub|i=1><rsup|N>d<rsub|i><rsup|<around|(|k|)>><around*|[|<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>*h<rsub|j><around|(|x<rsub|1>|)>*d*x<rsub|1>|]>-\<lambda\><rsub|n>*<big|int><rsub|D>h<rsub|i><around|(|x|)>*h<rsub|j><around|(|x|)>*d*x=0
  </equation>

  Denoting

  <\equation>
    C<rsub|i*j>=<big|int><rsub|D><big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*h<rsub|j><around|(|x<rsub|1>|)>*d*x<rsub|1>*d*x<rsub|2>
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

  equation (2.77) becomes

  <\equation>
    C*D=A*B*D
  </equation>

  where <math|C>, <math|B> and <math|D> are three <math|N>-dimensional
  matrices whose elements are given by equations (2.78)-(2.79). Equation
  (2.82) represents a generalized algebraic eigenvalue problem which may be
  solved for the matrix <math|D> and the eigenvalues
  <math|\<lambda\><rsub|k>>. Backsubstituting into equation (2.74) yields the
  eigenfunctions of the covariance kernel. The preceding procedure can be
  implemented using piecewise polynomials as the basis for the expansion.
  With this choice

  of basis functions, the columns of the matrix <math|<math-bf|D>> become the
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

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>

      <bibitem*|2><label|bib-stochasticInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>
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
    <associate|2.11|<tuple|11|4>>
    <associate|2.2|<tuple|2|1>>
    <associate|2.33|<tuple|35|8>>
    <associate|2.79|<tuple|44|10>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.2.4|8>>
    <associate|auto-11|<tuple|1.3|8>>
    <associate|auto-12|<tuple|1.4|8>>
    <associate|auto-13|<tuple|1.4.1|8>>
    <associate|auto-14|<tuple|1.5|9>>
    <associate|auto-15|<tuple|47|10>>
    <associate|auto-2|<tuple|1.1|3>>
    <associate|auto-3|<tuple|1.1.1|3>>
    <associate|auto-4|<tuple|1.1.2|3>>
    <associate|auto-5|<tuple|1.1.3|5>>
    <associate|auto-6|<tuple|1.2|6>>
    <associate|auto-7|<tuple|1.2.1|6>>
    <associate|auto-8|<tuple|1.2.2|7>>
    <associate|auto-9|<tuple|1.2.3|7>>
    <associate|bib-stochasticFiniteElements|<tuple|1|10>>
    <associate|bib-stochasticInferenceTheory|<tuple|2|10>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements

      stochasticInferenceTheory

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements

      stochasticFiniteElements
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Spectral Approach to Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Karhunen-Loeve Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Derivation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2<space|2spc>Spectral Covariance
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.1.3<space|2spc>Reproducing Kernel Hilbert
      Spaces (RKHS) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Error Minimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Uniqueness of the
      Expansion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|1.2.3<space|2spc>Expansion of Gaussian
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|1.2.4<space|2spc>Minimum Representation
      Entropy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Solution of the Integral
      Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Irrational Spectra
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|2tab>|1.4.1<space|2spc>Wiener process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Numerical Solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>