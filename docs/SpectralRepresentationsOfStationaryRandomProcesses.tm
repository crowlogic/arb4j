<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  TODO: replace labels and references

  <text-dots>start page 103<text-dots>

  <section*|Spectral Representation of the Correlation Function>

  Recall Khinchin's formula

  <\equation>
    B<around|(|\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*\<tau\>>*d*F<around|(|\<omega\>|)><text|>
  </equation>

  for the correlation function <math|B<around|(|\<tau\>|)>> of a stationary
  random process <math|X<around|(|t|)>> (see (2.52) above). The function
  <math|F<around|(|\<omega\>|)>> in this formula is a bounded monotone
  nondecreasing function of <math|\<omega\>>. It is clear that this function
  is determined by the formula for <math|B<around|(|\<tau\>|)>> only to
  within an arbitrary additional constant, which can be chosen so that
  <math|F*<around|(|-\<infty\>|)>=0>.

  In the real case, as is well known, <math|B*<around|(|-\<tau\>|)>=B<around|(|\<tau\>|)>>
  for all <math|\<tau\>> and, hence

  <\equation>
    B<around|(|\<tau\>|)>=<frac|<around|[|B<around|(|\<tau\>|)>+B*<around|(|-\<tau\>|)>|]>|2>*
  </equation>

  Therefore in this case (2.52) can be rewritten in the form

  <\equation>
    B<around|(|\<tau\>|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    <around|(|\<omega\>*\<tau\>|)>*d*F<around|(|\<omega\>|)>=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>cos
    <around|(|\<omega\>*\<tau\>|)>*d*G<around|(|\<omega\>|)><text|>
  </equation>

  where\ 

  <\equation>
    d*G<around|(|\<omega\>|)>=d*F<around|(|\<omega\>|)>+d*F*<around|(|-\<omega\>|)>\<forall\>\<omega\>\<gtr\>0
  </equation>

  \ (see (2.53)). Moreover, it is easy to show that the relation
  <math|B<around|(|\<tau\>|)>=B*<around|(|-\<tau\>|)>> implies that the
  increments of <math|F<around|(|\<omega\>|)>> on intervals symmetric about
  the point <math|\<omega\>=0> must coincide. Thus

  <\equation>
    d*G<around|(|\<omega\>|)>=2*d*F<around|(|\<omega\>|)>
  </equation>

  \ for <math|\<omega\>\<gtr\>0>, and if the function
  <math|F<around|(|\<omega\>|)>> is continuous at the point
  <math|\<omega\>=0>, then

  \ 

  <\equation>
    G<around|(|\<omega\>|)>=2*F<around|(|\<omega\>|)>+<text|const>
  </equation>

  (However, if <math|F<around|(|\<omega\>|)>> is discontinuous at
  <math|\<omega\>=0>, then <math|G<around|(|\<omega\>|)>> will have the same,
  and not a two-fold jump at this point.) It is convenient to assume, when
  the function <math|G<around|(|\<omega\>|)>> is considered, that
  <math|G*<around|(|-\<omega\>|)>=0> (where <math|G*<around|(|-\<omega\>|)>>
  is the value of <math|G<around|(|\<omega\>|)>> just before its possible
  jump at the point <math|\<omega\>=0>). Note that if
  <math|X<around|(|\<tau\>|)>> is <math|\<mu\>> of <math|X>, then

  <\equation>
    B<around|(|\<tau\>|)>=b<around|(|\<tau\>|)>+m<rsup|2>
  </equation>

  , where <math|b<around|(|\<tau\>|)>> is a centered correlation function,
  which also permits representation in the form (2.52). Therefore, if
  <math|X<around|(|\<tau\>|)>> = <math|m>, then the function
  <math|F<around|(|\<omega\>|)>> in (2.52) for <math|B<around|(|\<tau\>|)>>
  will necessarily satisfy the relation

  <\equation>
    F<around|(|\<omega\>|)>-F*<around|(|-\<omega\>|)>\<gtr\><frac|m<rsup|2>|2>*
  </equation>

  \ (i.e. <math|\<omega\>=0> will be the discontinuity point of
  <math|F<around|(|\<omega\>|)>>, and its jump at <math|\<omega\>=0> will not
  be less than <math|m<rsup|2>>). Further in this section, we shall again
  assume that <math|X<around|(|\<tau\>|)>> = 0 (i.e. whenever
  <math|X<around|(|\<tau\>|)>> = <math|m>, we shall assume that the value of
  <math|m> has already been subtracted from all the values of the process, so
  that <math|B<around|(|\<tau\>|)>> is actually a centered correlation
  function).

  In practical applications of stationary random processes, the correlation
  function <math|B<around|(|\<tau\>|)>> usually tends to zero as
  <math|<around|\||\<tau\>|\|>\<rightarrow\>\<infty\>> (cf. (1.36) in Sec.
  4). Suppose that the absolute value of <math|B<around|(|\<tau\>|)>> falls
  off so rapidly as <math|<around|\||\<tau\>|\|>\<rightarrow\>\<infty\>>,
  that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||B<around|(|t|)>|\|>*d*t\<less\>\<infty\><space|1em><around|(|2.66|)>
  </equation>

  (this condition is also usually fulfilled for practical situations). Then
  the function <math|B<around|(|t|)>> can be represented as the Fourier
  integral

  <\equation>
    B<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*f<around|(|\<omega\>|)>*d*\<omega\><space|1em><around|(|2.67|)>
  </equation>

  where <math|f<around|(|\<omega\>|)>> is a bounded and continuous function
  of <math|\<omega\>>. The representation (2.67) is also possible under some
  other conditions imposed on <math|B<around|(|t|)>>. For instance, (2.66)
  can be replaced by a less restrictive condition

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||B<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\><space|1em><around|(|2.68|)>
  </equation>

  but in this case the function <math|f<around|(|\<omega\>|)>> will no longer
  be necessarily continuous and bounded.<rsup|18> Formula (2.67) is a
  particular case of formula (2.52); it indicates that, subject to the
  condition (2.66) (or (2.68)),

  <\equation>
    F<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\><rprime|'>|)>*d*\<omega\><rprime|'><space|1em><around|(|2.69|)>
  </equation>

  where

  <\equation>
    f<around|(|\<omega\>|)>=F<rprime|'><around|(|\<omega\>|)><space|1em><around|(|2.70|)>
  </equation>

  so that <math|F<around|(|\<omega\>|)>> is a differentiable function. In the
  case of a real process <math|X<around|(|t|)>>, where the function
  <math|B<around|(|t|)>> is even, the function <math|f<around|(|\<omega\>|)>>
  will also be even, and the Fourier integral representation (2.67) can be
  rewritten as

  <\equation>
    B<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    <around|(|\<omega\>*t|)>*g<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <\equation>
    g<around|(|\<omega\>|)>=2*f<around|(|\<omega\>|)> <around|(|2.71|)>
  </equation>

  It is clear that in this case <math|g<around|(|\<omega\>|)>=G<rprime|'><around|(|\<omega\>|)>>
  and

  <\equation>
    G<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<omega\><rprime|'>>g<around|(|\<omega\><rprime|'>|)>*d*\<omega\><rprime|'>
  </equation>

  where <math|G<around|(|\<omega\>|)>> is a function appearing in (2.53).

  The Fourier representation (2.52) or (2.67) of the correlation function
  <math|B<around|(|t|)>> is called the spectral representation of the
  correlation function. The function <math|F<around|(|\<omega\>|)>> appearing
  in this representation is called the spectral distribution function of the
  stationary random process <math|X<around|(|t|)>>. If, however, the
  relations (2.69) and (2.67) hold, then <math|f<around|(|\<omega\>|)>> is
  called the spectral density (<with|font-shape|italic|function>) of the
  process <math|X<around|(|t|)>>).<next-line>By virtue of (2.52)

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<around|(|\<omega\>|)>=B<around|(|0|)>=<around|\<langle\>|X<around|(|t|)>|\<rangle\>><rsup|2>
  </equation>

  so that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<around|(|\<omega\>|)>=F<around|(|\<omega\>|)>-F*<around|(|-\<infty\>|)>\<less\>\<infty\>
  </equation>

  We see that the spectral distribution function is necessarily bounded. If
  there exists a spectral density <math|f<around|(|\<omega\>|)>>, then
  obviously

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|\<omega\>|)>*d*\<omega\>=B<around|(|0|)>\<less\>\<infty\>
  </equation>

  thus the spectral density is always integrable. Moreover, since
  <math|F<around|(|\<omega\>|)>> is a monotone nondecreasing function, the
  spectral density <math|f<around|(|\<omega\>|)>=F<rprime|'><around|(|\<omega\>|)>>
  is everywhere non-negative:

  <\equation>
    f<around|(|\<omega\>|)>\<geq\>0
  </equation>

  Conversely, if <math|f<around|(|\<omega\>|)>> is an integrable non-negative
  function, the function (2.69) will obviously be bounded and monotone
  nondecreasing, i.e. the function (2.67) will satisfy the conditions of
  Khinchin's theorem. Thus, Khinchin's theorem acquires a particularly simple
  form when applied to rapidly falling off functions
  <math|B<around|(|\<tau\>|)>> representable in the form of the Fourier
  integral (e.g. to functions satisfying the condition (2.66) or (2.68)): a
  rapidly falling off function <math|B<around|(|t|)>> will be a correlation
  function if, and only if, its Fourier transform
  <math|f<around|(|\<omega\>|)>> is everywhere non-negative.

  So far, we have not yet explained in this section how one proves Khinchin's
  theorem, which is so important for the entire content of the section; but
  this is discussed in Note 13, referring to Sec. 7. As indicated in that
  Note, Khinchin's theorem is a simple consequence of the following two
  statements, taken together:

  (a) The class of functions <math|B<around|(|t|)>>, which are correlation
  functions of stationary random processes, coincides with the class of
  positive definite functions of the variable <math|t> (see above, Sec. 4 for
  a real case and Sec. 5 for a complex case).

  (b) A continuous function <math|B<around|(|t|)>> of the real variable
  <math|t> is positive definite if, and only if, it can be represented in the
  form (2.52), where <math|F<around|(|\<omega\>|)>> is bounded and
  nondecreasing (this statement was proved independently by Bochner and
  Khinchin, but was first published by Bochner and therefore is known as
  Bochner's theorem; see, e.g., Bochner (1959) and also Note 3 to
  Introduction).

  In the preceding section it was emphasized that Khinchin's theorem lies at
  the basis of almost all the proofs of the spectral representation theorem
  for stationary random processes. It is, however, obvious that if we proved
  the spectral representation theorem without using Khinchin's theorem, this
  would also clearly imply the possibility of representing
  <math|B<around|(|t|)>> in the form (2.52). Indeed, replacing
  <math|X*<around|(|t+\<tau\>|)>> and <math|X<around|(|t|)>> in the formula
  <math|B<around|(|t|)>=<around|\<langle\>|X*<around|(|t+\<tau\>|)>*X<around|(|t|)>|\<rangle\>>>
  by their spectral representation (2.61) and then using (2.1) by definition
  (2.62) of the corresponding Fourier\UStieltjes integral and the property
  (b') of the random function <math|Z<around|(|\<omega\>|)>>, we obtain at
  once (2.52), where

  <\equation>
    F*<around|(|\<omega\>+\<Delta\>*\<omega\>|)>-F<around|(|\<omega\>|)>=<around|\||Z*<around|(|\<omega\>+\<Delta\>*\<omega\>|)>-Z<around|(|\<omega\>|)>|\|><rsup|2>
  </equation>

  so that <math|F<around|(|\<omega\>|)>> is clearly a nondecreasing function.
  Formula (2.76) can also be written in the differential form:

  <\equation>
    <around|\<langle\>|d*Z<around|(|\<omega\>|)><rsup|2>|\<rangle\>>=d*F<around|(|\<omega\>|)>
  </equation>

  Moreover, <math|<around|(|2.77|)>> can be combined with the property
  <math|<around|(|b<rprime|'>|)>> of <math|Z<around|(|\<omega\>|)>> in the
  form of a single symbolic relation

  <\equation>
    <around|\<langle\>|d*Z<around|(|\<omega\>|)>*d*Z<around|(|\<omega\><rprime|'>|)>|\<rangle\>>=\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*d*F<around|(|\<omega\>|)>*d*\<omega\><rprime|'>
  </equation>

  where <math|\<delta\><around|(|\<omega\>|)>> is the Dirac delta-function.
  It is easy to see that the substitution of <math|<around|(|2.78|)>> into
  the expression for the mean value of any double integral with respect to
  <math|d*Z<around|(|\<omega\>|)>> and <math|d*Z<around|(|\<omega\><rprime|'>|)>>
  gives the correct result. As the simplest example we consider the following
  derivation of Khinchin's formula <math|<around|(|2.52|)>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|X*<around|(|t+\<tau\>|)>*X<around|(|t|)>|\<rangle\>>>|<cell|=<around*|\<langle\>|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+\<tau\>|)>>*d*Z<around|(|\<omega\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\><rprime|'>*t>*d*Z<around|(|\<omega\><rprime|'>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+\<tau\>|)>-i*\<omega\><rprime|'>*t>*<around|\<langle\>|d*Z<around|(|\<omega\>|)>*d*Z<around|(|\<omega\><rprime|'>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+\<tau\>|)>-i*\<omega\><rprime|'>*t>*\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*d*F<around|(|\<omega\>|)>*d*\<omega\><rprime|'>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>>*d*F<around|(|\<omega\>|)>>>>>>
  </equation>

  Quite similarly, the following more general result can be derived:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|\<omega\><rprime|'>|)>*d*Z<around|(|\<omega\><rprime|'>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*h<around|(|\<omega\><rprime|'>|)>*\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*d*F<around|(|\<omega\>|)>
  </equation>

  where <math|g<around|(|\<omega\>|)>> and <math|h<around|(|\<omega\>|)>> are
  any two complex functions whose squared absolute values are integrable with
  respect to <math|d*F<around|(|\<omega\>|)>>. Note also that if the spectral
  density <math|f<around|(|\<omega\>|)>> exists, then the relations
  <math|<around|(|2.77|)>> and <math|<around|(|2.78|)>> obviously take the
  form

  <\equation>
    <around|\<langle\>|d*Z<around|(|\<omega\>|)><rsup|2>|\<rangle\>>=f<around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <\equation>
    <around|\<langle\>|d*Z<around|(|\<omega\>|)>*d*Z<around|(|\<omega\><rprime|'>|)>|\<rangle\>>=\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*f<around|(|\<omega\>|)>*d*\<omega\>*d*\<omega\><rprime|'>
  </equation>

  Formulae <math|<around|(|2.76|)>*\U<around|(|2.78|)>> and
  <math|<around|(|2.80|)>*\U<around|(|2.81|)>> establish the relationship
  between the spectral representation of the correlation function (determined
  by the functions <math|F<around|(|\<omega\>|)>> and
  <math|f<around|(|\<omega\>|)>>) and the spectral representation of the
  stationary random process <math|X<around|(|t|)>> itself, which includes the
  random point function <math|Z<around|(|\<omega\>|)>> or the random interval
  function

  <\equation>
    Z*<around|(|\<Delta\>*\<omega\>|)>=Z<around|(|\<omega\><rsub|2>|)>-Z<around|(|\<omega\><rsub|1>|)>
  </equation>

  where <math|\<Delta\>*\<omega\>=<around|[|\<omega\><rsub|1>,\<omega\><rsub|2>|]>>.
  We shall see in Sec. 11 that this relationship gives physical meaning to
  Khinchin's mathematical theorem and permits one to verify it experimentally
  when the stationary process <math|X<around|(|t|)>> is realized in the form
  of oscillations of some measurable physical quantity <math|X>. Now,
  however, we shall consider some more special questions bearing on the
  indicated relationship.

  We begin with the particular case where the function
  <math|F<around|(|\<omega\>|)>> is a "step-function", which changes (namely,
  increases by a positive value) only at discrete discontinuity points but
  takes a constant value between any two discontinuities (cf. Figs. 1(a) and
  1(b)). In this case (2.76) and (2.77) imply that the random interval
  function <math|Z*<around|(|\<Delta\>*\<omega\>|)>> is concentrated entirely
  on a discrete set of discontinuity points
  <math|\<omega\><rsub|1>,\<omega\><rsub|2>>,... of the function
  <math|F<around|(|\<omega\>|)>>, i.e. <math|Z*<around|(|\<Delta\>*\<omega\>|)>=0>
  for all intervals <math|\<Delta\>*\<omega\>> that do not contain any of
  these points. It is clear that then the spectral representation (2.58)
  reduces to the representation (2.31) or (2.38)) of the process
  <math|X<around|(|t|)>> as a superposition of separate uncorrelated harmonic
  oscillations with random amplitudes and phases, i.e. <math|X<around|(|t|)>>
  will be a process with a discrete spectrum in the sense explained in Sec.
  7. Moreover, (2.52) shows that the corresponding correlation function
  <math|B<around|(|t|)>> has the form (2.33) or, respectively, (2.39). We see
  that the representability of the correlation function
  <math|B<around|(|t|)>> of the process <math|X<around|(|t|)>> in the form of
  a sum of harmonics (or, in the real case, of cosine functions) implies that
  the corresponding random process <math|X<around|(|t|)>> is a sum of
  uncorrelated random harmonic oscillations. This particular case of the
  general spectral representation theorem is due to Slutsky (see Note 7).

  In the general case the nondecreasing function
  <math|F<around|(|\<omega\>|)>> can be represented as a sum of a continuous
  function <math|F<rsub|c><around|(|\<omega\>|)>> and a "step-function"
  <math|F<rsub|j><around|(|\<omega\>|)>> constructed from the "jumps"
  (discontinuities) of <math|F<around|(|\<omega\>|)>>. By virtue of (2.76)
  and (2.77), the discontinuity point of <math|F<rsub|j><around|(|\<omega\>|)>>
  corresponds to the discontinuity point of the random function
  <math|Z<around|(|\<omega\>|)>>, where changes jumpwise by a random variable
  <math|X<rsub|k>>, such that

  <\equation>
    <around|\<langle\>|X<rsub|k><rsup|2>|\<rangle\>>=f<rsub|k>
  </equation>

  \ (here <math|f<rsub|k>> is the increment of the function
  <math|F<around|(|\<omega\>|)>>).

  <text-dots>end of page 108

  <with|font-size|0.71|*The terminology relating to spectral representations
  has not yet been finally established. For instance, the terms "spectral
  distribution function" and "spectral density (function)" are often used in
  relation to the function <math|G<around|(|\<omega\>|)>> and
  <math|g<around|(|\<omega\>|)>=2*\<pi\>*\<omega\>> of the non-negative
  frequency <math|\<omega\>>. Moreover, the Fourier expansions in harmonics
  <math|e<rsup|i*\<omega\>*t>> or <math|cos <around|(|\<omega\>*t|)>>, where
  <math|\<omega\>> is the angular frequency (measured in "radians per
  second"), is often replaced by expansions in functions
  <math|e<rsup|2*\<pi\>*i*\<Omega\>*t>> or <math|cos
  <around|(|2*\<pi\>*\<Omega\>*t|)>>, where <math|\<Omega\>> is the ordinary
  frequency measured in Hertz (i.e. cycles per second). In this case the
  spectral density <math|f<around|(|\<omega\>|)>> must be replaced by the
  density <math|f<rsub|1><around|(|\<omega\>|)>=2*\<pi\>*f*<around|(|2*\<pi\>*\<omega\>|)>>,
  which is <math|2*\<pi\>> times higher. (Note also that the term "power
  spectrum", or simply "spectrum", is widely used in all the applied
  literature instead of the term "spectral density" preferred by
  mathematicians. (The term "spectrum" has, in mathematics, another meaning,
  which will be explained below in this section.) As to the spectral
  distribution function, it is rarely used in the applied literature, but if
  used it is generally called the "integrated spectrum".)>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_27.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Spectral
      Representation of the Correlation Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>