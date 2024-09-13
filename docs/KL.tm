<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Karhunen - Loève Expansion>

  Let <math|X<around|(|t|)>> be an arbitrary mean square continuous random
  process given on the interval <math|a\<leq\>t\<leq\>b> of the
  <math|t>-axis, and let <math|B<around|(|t,s|)>=<around|\<langle\>|X<around|(|t|)>*X<around|(|s|)>|\<rangle\>>>
  be a correlation function of <math|X<around|(|t|)>>. Consider the integral
  equation

  <\equation>
    <big|int><rsub|a><rsup|b>B<around|(|t,s|)>*\<psi\><around|(|s|)>*d*s=\<lambda\>*\<psi\><around|(|t|)>,<space|1em>a\<leq\>t\<leq\>b.
  </equation>

  Equation (4.384) is a linear integral equation with a symmetric (or, in the
  complex case, Hermitian) positive definite kernel. According to the general
  theory of such integral equations, it has a denumerable set of nonnegative
  eigenvalues <math|\<lambda\><rsub|j>>, <math|j=1,2>,..., which are matched
  by a denumerable set of eigenfunctions <math|\<psi\><rsub|j><around|(|t|)>>,
  <math|j=1,2>,..., forming a complete orthonormal set of functions on
  <math|<around|[|a,b|]>>. Hence, any square integrable function can be
  expanded into a series in functions <math|\<psi\><rsub|j><around|(|t|)>>,
  and\ 

  <\equation>
    <big|int><rsub|a><rsup|b>\<psi\><rsub|j><around|(|t|)>*\<psi\><rsub|k><around|(|t|)>*d*t=\<delta\><rsub|j*k>.
  </equation>

  Moreover, by virtue of Mercer's theorem,

  <\equation>
    B<around|(|t,s|)>=<big|sum><rsub|j=1><rsup|\<infty\>>\<lambda\><rsub|j>*\<psi\><rsub|j><around|(|t|)><wide|\<psi\><rsub|j><around|(|s|)>|\<bar\>>
  </equation>

  where the series converges uniformly in both variables.<rsup|<math|115>>

  The representation of the correlation function <math|B<around|(|t,s|)>> in
  the form (4.386) is clearly a particular case of representation (4.382),
  where the set <math|A> is discrete and consists of integers <math|j=1>, 2,
  ... . Hence, (4.386) implies the possibility of representing the random
  process <math|X<around|(|t|)>> as

  <\equation>
    X<around|(|t|)>=<big|sum><rsub|j=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|j>>*\<psi\><rsub|j><around|(|t|)>*Z<rsub|j>
  </equation>

  where, according to (4.381b) and (4.383),

  <\equation>
    <around|\<langle\>|Z<rsub|j><wide|Z<rsub|k>|\<bar\>>|\<rangle\>>=\<delta\><rsub|j*k>
  </equation>

  Conversely, if the random process <math|X<around|(|t|)>>,
  <math|a\<leq\>t\<leq\>b>, can be represented in the form (4.387), where the
  random variables <math|Z<rsub|j>> and function
  <math|\<psi\><rsub|j><around|(|t|)>> satisfy conditions (4.388) and
  (4.385), then evidently

  <\equation>
    <tabular|<tformat|<table|<row|<cell|B<around|(|t,s|)>>|<cell|=<around|\<langle\>|X<around|(|t|)><wide|X<around|(|s|)>|\<bar\>>|\<rangle\>>=<around*|\<langle\>|<big|sum><rsub|j=1><rsup|\<infty\>><big|sum><rsub|k=1><rsup|\<infty\>><around|(|\<lambda\><rsub|j>*\<lambda\><rsub|k>|)><rsup|1/2>*\<psi\><rsub|j><around|(|t|)><wide|\<psi\><rsub|k><around|(|s|)>|\<bar\>>Z<rsub|j><wide|Z<rsub|k>|\<bar\>>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|\<infty\>>\<lambda\><rsub|j>*\<psi\><rsub|j><around|(|t|)><wide|\<psi\><rsub|j><around|(|s|)>|\<bar\>>>>>>>
  </equation>

  Multiplying both sides of this relation by
  <math|\<psi\><rsub|k><around|(|t|)>> and integrating the result with
  respect to <math|t> from <math|a> to <math|b>, we immediately find that the
  functions <math|\<psi\><rsub|k><around|(|t|)>> and the nonnegative
  constants <math|\<lambda\><rsub|k>> must be eigenfunctions and eigenvalues
  of the integral equation (4.384). Thus, the orthonormal family of functions
  <math|\<psi\><rsub|j><around|(|t|)>> and the constant coefficients
  <math|\<lambda\><rsub|j>> appearing in the representation (4.387) of the
  process <math|X<around|(|t|)>> coincide with the eigenfunctions and
  eigenvalues of integral equations (4.380). We see that the correlation
  function <math|B<around|(|t,s|)>> determines uniquely the orthonormal
  functions <math|\<psi\><rsub|j><around|(|t|)>> and constants
  <math|\<lambda\><rsub|j>>, provided that the random variables
  <math|Z<rsub|j>> satisfy (4.388). It follows from this that the random
  variables <math|Z<rsub|j>> are determined uniquely by the process
  <math|X<around|(|t|)>>: equations (4.387) and (4.385) clearly imply that\ 

  <\equation>
    Z<rsub|j>=\<lambda\><rsub|j><rsup|-1/2>*<big|int><rsub|a><rsup|b>X<around|(|t|)><wide|\<psi\><rsub|j><around|(|t|)>|\<bar\>>d*t.
  </equation>

  If, however, the validity of the orthonormality condition (4.385) is not
  required, then the representation of the process <math|X<around|(|t|)>> in
  the form (4.387), where <math|Z<rsub|j>> satisfy (4.388), is determined
  with a high degree of arbitrariness.<rsup|<math|116>> Note also that if
  <math|X<around|(|t|)>> is a Gaussian random process, then, according to
  (4.389), the random variables <math|Z<rsub|j>> also have a Gaussian
  probability distribution. In particular, if <math|X<around|(|t|)>> is a
  real Gaussian process with mean value zero, then the coefficients
  <math|Z<rsub|n>> are independent Gaussian random variables.

  Representation (4.387) of a random process <math|X<around|(|t|)>> as a
  series in eigenfunctions of the correlation kernel
  <math|B<around|(|t,s|)>=<around|\<langle\>|X<around|(|t|)>*X<around|(|s|)>|\<rangle\>>>
  is, of course, very natural and theoretically simple. It is no wonder
  therefore that such a representation has been introduced independently by a
  number of scientists.<rsup|<math|117>> At present the mathematicians
  commonly call it the Karhunen-Loève expansion after the names of two of
  these scientists. In the applied literature, however, it is also sometimes
  used under the name of "proper orthogonal decomposition" or "canonical
  decomposition", or else "the expansion in empirical orthogonal functions".
  Note that the variances <math|\<lambda\><rsub|n>> of the random variables
  <math|Z<rsub|n>> in most practical applications decrease rapidly with the
  number <math|n> (if, as is usually done, the eigenvalues
  <math|\<lambda\><rsub|n>> are arranged in the decreasing order, i.e.,
  <math|\<lambda\><rsub|1>\<geq\>\<lambda\><rsub|2>\<geq\>\<lambda\><rsub|3>\<geq\>>...).
  Therefore, the few first terms of expansion (4.387) usually determine
  almost all the variability of <math|X<around|(|t|)>>, so that in practice
  all the terms of the series, with the exception of the first few terms, may
  often be neglected.<rsup|<math|118>>

  <section|Oscillatory Processes and Evolutionary Spectra>

  We know that if the correlation function <math|B<around|(|t,s|)>> of a
  random process <math|X<around|(|t|)>> can be represented in the form
  (4.382), then there exists the generalized spectral representation of
  <math|X<around|(|t|)>> of the form (4.380). It is clear, however, that the
  given correlation function <math|B<around|(|t,s|)>> very often admits a
  multitude of different representations of the form (4.382). (E.g., if
  <math|-\<infty\>\<less\>a\<leq\>t\<leq\>b\<less\>\<infty\>>, then there
  exist many different representations of the function
  <math|B<around|(|t,s|)>> in the form of the sum (4.386), which is a very
  particular case of (4.382); see Note 116 and cf. also Note 129.) Thus, the
  given random process <math|X<around|(|t|)>> often has a lot of widely
  differing generalized spectral representations. Therefore, it is not
  surprising that not every generalized spectral representation is
  interesting for applications, but only special classes of such
  representations possessing some useful property or other.

  We have considered above two special classes of generalized spectral
  representations: Karhunen-Loève expansions of mean square continuous
  processes <math|X<around|(|t|)>> on a finite interval, and moving average
  representations of stationary processes <math|X<around|(|t|)>>. We now turn
  to one more such special class, namely the class of so-called evolutionary
  spectral representations. For these new generalized spectral
  representations, the parametric set <math|A> coincides with the frequency
  axis <math|-\<infty\>\<less\>\<omega\>\<less\>\<infty\>>, but they differ
  from ordinary spectral representations (2.61) of stationary processes
  <math|X<around|(|t|)>> in that now both the spectral representation itself
  and the corresponding spectral distribution function (or spectral density)
  can change slowly over time. Correspondingly, a random processes
  <math|X<around|(|t|)>> which has an evolutionary spectral representation
  is, in general, weakly nonstationary.

  Evolutionary spectral representations were first introduced by Granger and
  Hatanaka and (in more detail) by Priestley in the
  mid-1960s.<rsup|<math|128>> These representations have the form

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<omega\>>*A<around|(|t,\<omega\>|)>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is a random function with uncorrelated
  increments, which satisfies the ordinary relation (2.78):

  <\equation>
    <around|\<langle\>|d*Z<around|(|\<omega\>|)>*d<wide|Z<around|(|\<omega\><rprime|'>|)>|\<bar\>>|\<rangle\>>=\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*d*F<around|(|\<omega\>|)>*d*\<omega\><rprime|'>
  </equation>

  and <math|A<around|(|t,\<omega\>|)>> is a "slowly varying" function of
  <math|t> satisfying the condition spectral density depend on the specific
  choice of the family of functions <math|A<rsub|t><around|(|\<omega\>|)>>
  appearing on the right-hand side of (4.406).<rsup|<math|129>> A random
  process <math|X<around|(|t|)>> having at least one representation of the
  form (4.406), where the functions <math|A<rsub|t><around|(|\<omega\>|)>>
  and the random measure <math|d*Z<around|(|\<omega\>|)>> satisfy the
  above-indicated conditions, is called an oscillatory process. Since the
  functions <math|A<around|(|t,\<omega\>|)>> clearly satisfy the conditions
  to be imposed on <math|\<varphi\><around|(|t,a|)>>, the class of
  oscillatory processes certainly includes all the stationary processes
  having a finite variance.<rsup|<math|130>>

  Note that any generalized spectral representation (4.380), where the
  parametric set <math|A> may be taken to be a straight line (or a part of a
  straight line), may be written as (4.406). In fact, in such a case the set
  <math|A> may be considered to be the real line
  <math|-\<infty\>\<less\>\<omega\>\<less\>\<infty\>> (or a part of it),
  while <math|\<varphi\><around|(|t,a|)>=\<varphi\><around|(|t,\<omega\>|)>>
  may be written as <math|exp <around|(|i*t*\<omega\>|)>*A<around|(|t,\<omega\>|)>>,
  where <math|A<around|(|t,\<omega\>|)>=exp
  <around|(|-i*t*\<omega\>|)>*\<varphi\><around|(|t,\<omega\>|)>>. Of course,
  it would not be physically meaningful to interpret <math|\<omega\>> as the
  frequency in all cases, and to consider the product
  <math|A<around|(|t,\<omega\>|)>*exp <around|(|i*t*\<omega\>|)>> as an
  amplitude modulated sinusoidal oscillation. In the physical theory of
  oscillations the function <math|A<around|(|t|)>*exp
  <around|(|i*t*\<omega\><rsub|0>|)>> is said to describe the amplitude
  modulated oscillation of frequency <math|\<omega\><rsub|0>> only if the
  "amplitude" <math|A<around|(|t|)>> is a slowly varying (compared to
  <math|exp <around|(|i*t*\<omega\><rsub|0>|)>>) function, i.e., if the
  Fourier transform of <math|A<around|(|t|)>> includes mainly frequencies
  much lower than <math|\<omega\><rsub|0>>; it is even often assumed that
  this transform must be concentrated in a neighborhood of zero frequency.
  This is the reason for requiring that <math|<around|\||d*K<around|(|\<Theta\>,\<omega\>|)>|\|>>
  be maximal at <math|\<Theta\>=0> for any fixed <math|\<omega\>>.

  Since <math|A<around|(|t,\<omega\>|)>> is a slowly varying function of
  time, it is clear that the process (4.406) may be regarded as being
  "approximately stationary" throughout rather long time intervals. If,
  however, we examine the behavior of <math|X<around|(|t|)>> during two such
  intervals which are sufficiently far apart, we shall find that although
  <math|X<around|(|t|)>> is practically stationary in both intervals, the
  spectral distribution function of the two "portions" of
  <math|X<around|(|t|)>> will, in general, be different (i.e., the spectral
  distribution of the power of <math|X<around|(|t|)>> varies slowly over
  time).<rsup|<math|131>>

  Example. Modulated Stationary Processes. A class of nonstationary random
  processes which are often encountered in applications is the class of
  modulated (or weighted) stationary processes <math|X<around|(|t|)>>. These
  processes are obtained when a stationary random process
  <math|X<rsub|0><around|(|t|)>> is multiplied by some nonrandom modulating
  (or weighting) function <math|A<around|(|t|)>>:\ 
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|2|?|../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|3|?|../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|4|?|../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Karhunen
      - Loève Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>