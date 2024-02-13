<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Karhunen-Loeve Expansion and the Spectral
  Representation of Stochastic Processes>>

  Following <cite|stochasticFiniteElements>,a rigorous exposition of the
  basic concepts of the theory of representation for random processes can be
  formulated (Parzen, 1959). This theory is quite rich and mature
  mathematical subject. The development of the theory parallels that of the
  modern theory of random processes, and has had its origin in the need for
  more sophisticated models in applied statistics. Most of the related
  results have been derived for the class of second order processes. Perhaps
  the most important result is the spectral representation of random
  processes (Gel'fand and Vilenkin, 1964), which, in its most general form,
  can be stated as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int>g<around|(|x|)>*d*\<mu\><around|(|\<theta\>|)>
  </equation>

  where <math|w*<around|(|x,\<theta\>|)>> is a stochastic process whose
  covariance function <math|C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>>
  admits of the decomposition

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int>g<around|(|x<rsub|1>|)>*g<around|(|x<rsub|2>|)>*d*\<mu\><rsub|1><around|(|\<theta\>|)>*d*\<mu\><rsub|2><around|(|\<theta\>|)>.
  </equation>

  In equation (2.1), <math|g<around|(|x|)>> is a deterministic function.
  Further, <math|d*\<mu\><around|(|\<theta\>|)>> is an orthogonal set
  function, also termed orthogonal stochastic measure, defined on the
  <math|\<sigma\>>-field <math|\<Psi\>> of random events. An important
  specialization of the spectral decomposition occurs if the process
  <math|w*<around|(|x,\<theta\>|)>> is wide stationary. In this case,
  equation (2.1) can be shown to reduce to the Wiener-Khintchine relation
  (Yaglom, 1962) and the following equations hold

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rsup|T>*x>*d*\<mu\><around|(|\<omega\>,\<theta\>|)>
  </equation>

  and

  <\equation>
    C<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsup|1>*x<rsub|1>-\<omega\><rsup|2>*x<rsub|2>|)><rsup|T>>*S<around|(|\<omega\>|)>*d*\<omega\>.
  </equation>

  Here, the symbol <math|T> denotes vector transposition,
  <math|S<around|(|\<omega\>|)>> is the usual spectral density of the
  stationary process, and <math|\<omega\>> is the wave number vector.

  The preceding representations have had a strong impact on the subsequent
  development of the theory of random processes. However, their applications
  have been restricted to randomly excited deterministic systems. This is
  largely attributed to the fact that all of these representations involve
  differentials of random functions, and are therefore set in an infinite
  dimensional space, not readily amenable to computational algorithms. An
  alternative formulation of the spectral representation, and one which is
  extensively used in the sequel, is the Karhunen-Loeve expansion whereby a
  random process <math|w*<around|(|x,\<theta\>|)>> can be expanded in terms
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
  process <math|w*<around|(|x,\<theta\>|)>>. Given the crucial role that the
  Karhunen-Loeve expansion has in relation to the methods discussed in this
  monograph, it will be treated in greater detail in section (2.3).

  Collectively, the representations discussed thus far can be thought of as
  linear operators or filters acting on processes with independent increments
  (Doob, 1953). Interestingly, these concepts can be generalized to allow for
  the representation of nonlinear functionals of the orthogonal stochastic
  measures <math|d*\<mu\><around|(|\<theta\>|)>>. The theory of nonlinear
  functionals was developed by Volterra (1913). He generalized the Taylor
  expansion of functions to the case of functionals. It was Wiener, however,
  who first applied Volterra's ideas to stochastic analysis, and developed
  what is now known as the Homogeneous Chaos. Based on Wiener's work, Cameron
  and Martin (1947) developed the Fourier-Hermite expansion, which is a
  Fourier-type expansion for nonlinear functionals. Again, it was Wiener
  (1958) who first applied the

  <subsection*|Karhunen-Loeve Expansion>

  <subsubsection*|Derivation>

  One of the major difficulties associated with the numerical incorporation
  of random processes in finite element analyses, is the necessity to deal
  with abstract measures spaces that have limited physical intuitive support.
  The major conceptual difficulty from the viewpoint of the class of problems
  considered herein, involves the treatment of functions defined on these
  abstract spaces, namely random variables defined on the
  <math|\<sigma\>>-field of random events. The most widely used method, the
  Monte Carlo simulation, consists of sampling these functions at randomly
  chosen elements of this <math|\<sigma\>>-field, in a random,
  collocation-like, scheme. Obviously, a quite large number of points needs
  to be sampled if a good approximation is to be achieved. A theoretically
  more sound and more appealing approach would be to expand these functions
  in a Fourier-type series as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n><around|(|\<theta\>|)>*f<rsub|n><around|(|x|)>
  </equation>

  where <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>> is a set of
  random variables to be determined, <math|\<lambda\><rsub|n>> is some
  constant, and <math|<around|{|f<rsub|n><around|(|x|)>|}>> is an orthonormal
  set of deterministic functions. This is exactly what the Karhunen-Loeve
  expansion achieves. The expansion was derived independently by a number of
  investigators (Karhunen, 1947; Loeve, 1948; Kac and Siegert, 1947).

  Let <math|w*<around|(|x,\<theta\>|)>> be a random process, function of the
  position vector <math|x> defined over the domain <math|D>, with
  <math|\<theta\>> belonging to the space of random events <math|\<Omega\>>.
  Let <math|<wide|w|\<bar\>><around|(|x|)>> denote the expected value of
  <math|w*<around|(|x,\<theta\>|)>> over all possible realizations of the
  process, and <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> denote its covariance
  function. By definition of the covariance function, it is bounded,
  symmetric and positive definite. Thus, it has the spectral decomposition
  (Courant and Hilbert, 1953)

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  where <math|\<lambda\><rsub|n>> and <math|f<rsub|n><around|(|x|)>> are the
  eigenvalue and the eigenfunction of the covariance kernel. And,
  specifically, that they are the solution to the integral equation

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|n><around|(|x<rsub|1>|)>*d*x<rsub|1>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  Due to the symmetry and the positive definiteness of the covariance kernel
  (Loeve, 1977), its eigenfunctions are orthogonal and form a complete set.
  They can be normalized according to the following criterion

  <\equation>
    <big|int><rsub|D>f<rsub|n><around|(|x|)>*f<rsub|m><around|(|x|)>*d*x=\<delta\><rsub|n*m>,
  </equation>

  where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Clearly,
  <math|w*<around|(|x,\<theta\>|)>> can be written as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+\<alpha\><around|(|x,\<theta\>|)>
  </equation>

  where <math|\<alpha\><around|(|x,\<theta\>|)>> is a process with zero mean
  and covariance

  The process <math|\<alpha\><around|(|x,\<theta\>|)>> can be expanded in
  terms of the eigenfunctions <math|f<rsub|n><around|(|x|)>> as

  <\equation>
    \<alpha\><around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>
  </equation>

  Second order properties of the random variables <math|\<xi\><rsub|n>> can
  be determined by multiplying both sides of equation (2.11) by
  <math|\<alpha\><around|(|x<rsub|2>,\<theta\>|)>> and taking the expectation
  on both sides. Specifically, it is found that

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<around|\<langle\>|\<alpha\><around|(|x<rsub|1>,\<theta\>|)>*\<alpha\><around|(|x<rsub|2>,\<theta\>|)>|\<rangle\>>=<big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|m=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|m><around|(|x<rsub|2>|)>.
  </equation>

  Then, multiplying both sides of equation (2.12) by
  <math|f<rsub|k><around|(|x<rsub|2>|)>>, integrating over the domain
  <math|D>, and making use of the orthogonality of the eigenfunctions, yields

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|k><around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\><rsub|k>*f<rsub|k><around|(|x<rsub|1>|)>
  </equation>

  <\equation>
    =<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*f<rsub|n><around|(|x<rsub|1>|)>.
  </equation>

  Multiplying once more by <math|f<rsub|l><around|(|x<rsub|1>|)>> and
  integrating over <math|D>, gives

  <\equation>
    <big|int><rsub|D><big|int><rsub|D>f<rsub|l><around|(|x<rsub|1>|)>*f<rsub|k><around|(|x<rsub|1>|)>*d*x<rsub|1>=<big|sum><rsub|n=0><rsup|\<infty\>>E*<around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*\<delta\><rsub|n*l>.
  </equation>

  Then, using equation (2.9) leads to

  <\equation>
    \<lambda\><rsub|k>*\<delta\><rsub|k*l>=<sqrt|\<lambda\><rsub|k>*\<lambda\><rsub|l>>*<around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>.
  </equation>

  Equation (2.15) can be rearranged to give

  <\equation>
    <around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|k*l>.
  </equation>

  Thus, the random process <math|w*<around|(|x,\<theta\>|)>> can be written
  as

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>.
  </equation>

  where,

  <\equation>
    <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>=0,<space|1em><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m>.
  </equation>

  and <math|\<lambda\><rsub|n>,f<rsub|n><around|(|x|)>> are solution to
  equation (2.8). Truncating the series in equation (2.17) at the
  <math|M<rsup|t*h>> term, gives

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|M>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>.
  </equation>

  An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>> can
  be obtained by multiplying equation (2.11) by
  <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
  That is,

  <\equation>
    \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|1|<sqrt|\<lambda\><rsub|n>>>*<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)>*d*x.
  </equation>

  Viewed from a Reproducing Kernel Hilbert Space (RKHS) point of view
  (Aronszajn, 1950; Parzen, 1959), either of equations (2.11) or (2.20), is
  an expression for the congruence that maps the Hilbert space spanned by the
  functions <math|f<rsub|n><around|(|x|)>> to the Hilbert space spanned by
  the random process, or equivalently, the space spanned by the set of random
  variables <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>>. It is
  this congruence along with the covariance function of the process that
  determines uniquely the random process <math|w*<around|(|x,\<theta\>|)>>.
  Observe the similarity of equations (2.11) and (2.20) with equations (2.7)
  and (2.8), respectively. Indeed, it can be shown (Parzen, 1959) that if a
  function can be represented in terms of linear operations on the family
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, then <math|f> belongs to the
  RKHS corresponding to the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>,
  and the congruence between the two Hilbert spaces means of the same linear
  operations used to represent <math|f> in terms of
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, <math|x<rsub|2>\<in\>D>. Another
  point of practical importance is that the expansion given by equation
  (2.19) can be used in a numerical simulation scheme to obtain numerical
  realizations of the random process. In fact, this simulation procedure is
  used in conjunction with the Monte Carlo method for one of the illustrative
  examples in Chapter IV. It is optimal in the Fourier sense, as it minimizes
  the mean square error resulting from truncation after a finite number of
  terms. The expansion is used extensively in the fields of detection,
  estimation, pattern recognition, and image processing as an efficient tool
  to store random processes (Deviijver and Kittler, 1982). It is worth noting
  at this point that the Karhunen-Loeve expansion was independently derived
  in connection with stochastic turbulence problems (Lumley, 1970). In that
  context, the associated eigenfunctions can be identified with the
  characteristic eddies of the turbulence field.

  It is well known from functional analysis that the steeper a bilinear form
  decays to zero as a function of one of its arguments, the more terms are
  needed in its spectral representation in order to reach a preset accuracy.
  Noting that the Fourier transform operator is a spectral representation, it
  may be concluded that the faster the autocorrelation function tends to
  zero, the broader is the corresponding spectral density, and the greater
  the number of requisite terms to represent the underlying random process by
  the Karhunen-Loeve expansion.

  For the special case of a random process possessing a rational spectrum,
  the integral eigenvalue problem can be replaced by an equivalent
  differential equation that is easier to solve (Van Trees, 1968). In the
  same context, it is reminded that a necessary and sufficient condition for
  a process to have a finite dimensional Markov realization is that its
  spectrum be rational (Kree and Soize, 1986). Further, note that analytical
  solutions for the integral equation (2.8) are obtainable for some quite
  important and practical forms of the kernel
  <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> (Juncosa, 1945; Slepian and
  Pollak, 1961; Van Trees, 1968), some of which are treated later in this
  chapter.

  It may seem that any complete set of functions can be used in lieu of the
  eigenfunctions of the covariance kernel in the expansion (2.11). However,
  it will now be shown that the Karhunen-Loeve expansion as described above,
  has some desirable properties that make it a preferable choice for some of
  the objectives of the present approach.

  <subsubsection*|Properties>

  <paragraph|Error Minimizing Property>

  The generalized coordinate system defined by the eigenfunctions of the
  covariance kernel is optimal in the sense that the mean-square error
  resulting from a finite representation of the process
  <math|w*<around|(|x,\<theta\>|)>> is minimized. This property can be proved
  as follows.

  Given a complete orthonormal set of functions
  <math|h<rsub|n><around|(|x|)>>, the process
  <math|w*<around|(|x,\<theta\>|)>> can be approximated in a convergent
  series of the form

  <\equation>
    w*<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<xi\><rsub|n><around|(|\<theta\>|)>*h<rsub|n><around|(|x|)>.
  </equation>

  . Truncating the series in equation (2.17) at the <math|M<rsup|t*h>> term,
  gives

  <\equation>
    w*<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|M>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)>.
  </equation>

  An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>> can
  be obtained by multiplying equation (2.11) by
  <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
  That is,

  <\equation>
    \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|1|<sqrt|\<lambda\><rsub|n>>>*<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)>*d*x.
  </equation>

  Viewed from a Reproducing Kernel Hilbert Space (RKHS) point of view
  (Aronszajn, 1950; Parzen, 1959), either of equations (2.11) or (2.20), is
  an expression for the congruence that maps the Hilbert space spanned by the
  functions <math|f<rsub|n><around|(|x|)>> to the Hilbert space spanned by
  the random process, or equivalently, the space spanned by the set of random
  variables <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>>. It is
  this congruence along with the covariance function of the process that
  determines uniquely the random process <math|w*<around|(|x,\<theta\>|)>>.
  Observe the similarity of equations (2.11) and (2.20) with equations (2.7)
  and (2.8), respectively. Indeed, it can be shown (Parzen, 1959) that if a
  function can be represented in terms of linear operations on the family
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, then <math|f> belongs to the
  RKHS corresponding to the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>,
  and the congruence between the two Hilbert spaces means of the same linear
  operations used to represent <math|f> in terms of
  <math|<around|{|C|(>\<cdot\>,x<rsub|2>)}>, <math|x<rsub|2>\<in\>D>. Another
  point of practical importance is that the expansion given by equation
  (2.19) can be used in a numerical simulation scheme to obtain numerical
  realizations of the random process. In fact, this simulation procedure is
  used in conjunction with the Monte Carlo method for one of the illustrative
  examples in Chapter IV. It is optimal in the Fourier sense, as it minimizes
  the mean square error resulting from truncation after a finite number of
  terms. The expansion is used extensively in the fields of detection,
  estimation, pattern recognition, and image processing as an efficient tool
  to store random processes (Deviijver and Kittler, 1982). It is worth noting
  at this point that the Karhunen-Loeve expansion was independently derived
  in connection with stochastic turbulence problems (Lumley, 1970). In that
  context, the associated eigenfunctions can be identified with the
  characteristic eddies of the turbulence field.

  Differentiating equation (2.26) with respect to
  <math|h<rsub|i><around|(|x|)>> and setting the result equal to zero, gives

  <\equation>
    <frac|\<partial\>*\<cal-F\><around|[|h<around|(|x|)>|]>|\<partial\>*h<rsub|i><around|(|x|)>>=<big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|1>|)>*d*x<rsub|1>-\<lambda\><rsub|i>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>=0
  </equation>

  which is satisfied when

  <\equation>
    <big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<rsub|i><around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\><rsub|i>*h<rsub|i><around|(|x<rsub|1>|)>
  </equation>

  <subsubsection*|Uniqueness of the Expansion>

  The random variables appearing in an expansion of the kind given by
  equation (2.10) are orthonormal if and only if the orthonormal functions
  <math|<around|{|f<rsub|n><around|(|x|)>|}>> and the constants
  <math|<around|{|\<lambda\><rsub|n>|}>> are respectively the eigenfunctions
  and the eigenvalues of the covariance kernel as given by equation (2.8).

  The "if" part is an immediate consequence of equation (2.11). To show the
  "only if" part, equation (2.12) can be used with
  <math|<around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m>>
  to obtain

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>.
  </equation>

  Multiplying both sides by <math|f<rsub|m><around|(|x<rsub|2>|)>> and
  integrating over <math|D> gives

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|m><around|(|x<rsub|2>|)>*d*x<rsub|2>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*\<delta\><rsub|n*m>=\<lambda\><rsub|m>*f<rsub|m><around|(|x<rsub|1>|)>
  </equation>

  In the context of this last theorem, it is interesting to note that some
  investigators (e.g., Lawrence, 1987) have used an expansion of the kind
  given by equation (2.11) with orthogonal random variables and orthogonal
  deterministic functions that do not satisfy equation (2.8). It is obvious
  that such an expansion cannot form a basis for the representation of random
  processes.

  <subsubsection*|Expansion of Gaussian Processes>

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
    <around|\<langle\>|\<xi\><rsub|1><around|(|\<theta\>|)>,\<ldots\>,\<xi\><rsub|2*n><around|(|\<theta\>|)>|\<rangle\>>=<big|sum><big|prod><around|\<langle\>|\<xi\><rsub|i><around|(|\<theta\>|)>*\<xi\><rsub|j><around|(|\<theta\>|)>|\<rangle\>>,
  </equation>

  where the summation extends over all the partitions of the set
  <math|<around|{|\<xi\><rsub|i><around|(|\<theta\>|)>|}><rsup|2*n><rsub|i=1>>
  into sets of two elements, and the product is over all such sets in a given
  partition. Furthermore, it can be shown (Loeve, 1977) that for Gaussian
  processes, the Karhunen-Loeve expansion is almost surely convergent.

  <subsection*|Other Properties>

  In addition to the mean-square error minimizing property, the
  Karhunen-Loeve expansion has some additional desirable properties. Of
  these, the minimum representation of entropy property is worth mentioning.
  These properties, however, are not relevant to the present study and will
  not be discussed any further. A detailed study of the properties of the
  Karhunen-Loeve expansion is given by Devijver and Kittler (1982).

  <subsection*|Solution of the Integral Equation>

  <subsubsection*|Preliminary Remarks>

  The usefulness of the Karhunen-Loeve expansion hinges on the ability to
  solve the integral equation of the form

  <\equation>
    <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\>*f<around|(|x<rsub|1>|)>,
  </equation>

  where <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is an autocovariance
  function. Equation (2.33) is a homogeneous Fredholm integral equation of
  the second kind. The theory underlying this kind of equations has been
  extensively investigated and is well documented in a number of monographs
  (Mikhlin, 1957). Being an autocovariance function, the kernel
  <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is bounded, symmetric, and
  positive definite. This fact simplifies the ensuing analysis considerably
  in

  <subsubsection*|Nonrational Spectra>

  There is no general method for the solution of the integral equation (2.33)
  corresponding to nonrational spectra. Several of these equations have been
  investigated and explicit solutions have been obtained for certain
  covariance kernels. The method described in the previous section may be
  applied successfully to a number of these kernels as will be demonstrated
  for the case of the triangular kernel given by the equation

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=1-d*<around|\||x<rsub|1>-x<rsub|2>|\|>,<space|1em><around|\||x<rsub|1>-x<rsub|2>|\|>\<in\><around|[|0,<frac|1|d>|]>.
  </equation>

  Here, <math|d> is a parameter which can be used to adjust the distance of
  null correlation between <math|w*<around|(|x<rsub|1>,\<theta\>|)>> and
  <math|w*<around|(|x<rsub|2>,\<theta\>|)>>. Consider realizations of this
  process on the interval <math|<around|[|0,a|]>>. The eigenfunctions and
  eigenvalues of <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> are obtained as the
  solution to the integral equation

  <\equation>
    <big|int><rsub|0><rsup|a><around|(|1-d*<around|\||x<rsub|1>-x<rsub|2>|\|>|)>*f<rsub|n><around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>.
  </equation>

  Differentiating equation (2.57) twice with respect to <math|x<rsub|2>>, the
  following equivalent differential equation is obtained

  <\equation>
    f<rsub|n><rprime|''><around|(|x|)>+\<omega\><rsub|n><rsup|2>*f<rsub|n><around|(|x|)>=0,<space|1em>0\<leq\>x\<leq\>a.
  </equation>

  The associated boundary conditions are given by the equations

  <\equation>
    f<rsub|n><rprime|'><around|(|a|)>=-f<rsub|n><rprime|'><around|(|0|)>,
  </equation>

  and

  <\equation>
    f<rsub|n><rprime|'><around|(|0|)>=<frac|f<rsub|n><around|(|0|)>+f<rsub|n><around|(|a|)>|2-<frac|a|d>>.
  </equation>

  and

  <\equation>
    \<omega\><rsub|n>=<sqrt|<frac|2*d|\<lambda\><rsub|n>>>
  </equation>

  The solution of equation (2.58) subjected to the boundary conditions
  described by equations (2.59) and (2.60) is, for <math|n> odd,

  <\equation>
    f<rsub|n><around|(|x|)>=<sqrt|<frac|a|2>>*<frac|cos
    <around|(|\<omega\><rsub|n>*x|)>+tan <around|(|<frac|\<omega\><rsub|n>*a|2>|)>*sin
    <around|(|\<omega\><rsub|n>*x|)>|<sqrt|<frac|a|2>+<frac|tan<rsup|2><around|(|<frac|\<omega\><rsub|n>*a|2>|)>-1|4*\<omega\><rsub|n>>*sin
    <around|(|2*\<omega\><rsub|n>*a|)>+<frac|sin<rsup|2><around|(|\<omega\><rsub|n>*a|)>|\<omega\><rsub|n>>*tan
    <around|(|<frac|\<omega\><rsub|n>*a|2>|)>>>
  </equation>

  and, for <math|n> even,

  <\equation>
    f<rsub|n><around|(|x|)>=<sqrt|<frac|a|2>>*<frac|cos
    <around|(|\<omega\><rsub|n>*x|)>|<sqrt|<frac|a|2>+<frac|sin
    <around|(|2*\<omega\><rsub|n>*a|)>|4*\<omega\><rsub|n>>>>
  </equation>

  where <math|\<omega\><rsub|n>> is the solution to the following equation

  <\equation>
    tan <around|(|<frac|\<omega\><rsub|n>*a|2>|)>=\<omega\><rsub|n>*<around|(|<frac|2|a>-a|)>*<space|1em><text|for><space|1em>n=2,4,6*\<ldots\>
  </equation>

  and

  <\equation>
    \<omega\><rsub|n>=<frac|\<pi\>*n|a>*<space|1em><text|for><space|1em>n=1,3,5*\<ldots\>
  </equation>

  Figure (2.8) shows a plot of the first four eigenfunctions associated with
  this kernel. The eigenvalues are shown in Figure (2.9) for various values
  of <math|d>. Figures (2.10)-(2.14) show the exact kernel, its four-term
  approximation, its ten-term approximation and the corresponding errors.

  Another kernel that may be treated by the same method is the kernel of the
  Wiener process. It is given by the equation

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=min
    <around|(|x<rsub|1>,x<rsub|2>|)>,<space|1em><around|(|x<rsub|1>,x<rsub|2>|)>\<in\><around|[|0,T|]>\<times\><around|[|0,T|]>.
  </equation>

  The resulting normalized eigenfunctions and eigenvalues are

  <\equation>
    f<rsub|n><around|(|x<rsub|1>|)>=<sqrt|2>*sin
    <around|(|<frac|n*\<pi\>*x<rsub|1>|T>|)>
  </equation>

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-10|<tuple|31|6|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-11|<tuple|43|7|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-2|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-3|<tuple|21|4|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-4|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-5|<tuple|26|5|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-6|<tuple|28|6|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-7|<tuple|30|6|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-8|<tuple|30|6|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|auto-9|<tuple|30|6|../../.TeXmacs/texts/scratch/no_name_27.tm>>
    <associate|bib-stochasticFiniteElements|<tuple|1|7|../../.TeXmacs/texts/scratch/no_name_27.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Karhunen-Loeve Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|Derivation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|4tab>|Error Minimizing Property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|Uniqueness of the Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|Expansion of Gaussian Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Other Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Solution of the Integral Equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|Preliminary Remarks
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|Nonrational Spectra
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>