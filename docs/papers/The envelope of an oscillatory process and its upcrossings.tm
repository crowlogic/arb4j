<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The envelope of an oscillatory process and its
  upcrossings>|<doc-author|<author-data|<author-name|A. M. HASOFER AND P.
  PETOCZ>|<author-affiliation|University of New South Wales>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    envelope of an oscillatory process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    joint density function of <with|mode|math|R<around|(|t|)>> and its
    derivative> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    expected rate of upcrossings at level <with|mode|math|u> by the envelope>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Let <math|X<around|(|t|)>> be a real-valued stochastic process with sample
  functions which are almost surely continuously differentiable. We say that
  <math|X<around|(|t|)>> has an <with|font-shape|italic|upcrossing at level
  <math|u>> at time <math|t> if <math|X<around|(|t|)>=u>,
  <math|<wide|X|\<dot\>><around|(|t|)>\<gtr\>0>.

  Let

  <\equation>
    p<around|(|t;x,y|)>=<frac|\<partial\><rsup|2>|\<partial\>*x*<space|0.17em>\<partial\>*y>*\<bbb-P\><around*|(|X<around|(|t|)>\<leq\>x,<space|0.17em><wide|X|\<dot\>><around|(|t|)>\<leq\>y|)>
  </equation>

  be the joint density function of <math|X<around|(|t|)>> and
  <math|X<rprime|'><around|(|t|)>>. It is well known that under fairly weak
  conditions, the expected rate of upcrossings at level <math|u>,
  <math|q<rsub|u><around|(|t|)>>, is given by the formula

  <\equation>
    <label|eq:expected_rate><tabular|<tformat|<table|<row|<cell|q<rsub|u><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>y*p<around|(|t;u,y|)>*d*y>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>y*<frac|\<partial\><rsup|2>|\<partial\>*u*<space|0.17em>\<partial\>*y>*\<bbb-P\><around*|(|X<around|(|t|)>\<leq\>u,<space|0.17em>X<rprime|'><around|(|t|)>\<leq\>y|)>*d*y>>>>>
  </equation>

  Let\ 

  <\equation>
    <label|eq:lambda_i>\<lambda\><rsub|i>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\><rsup|i>*d*F<around|(|x|)>\<forall\>i=0,1,2,\<ldots\>
  </equation>

  When <math|X<around|(|t|)>> is a stationary Gaussian process with zero mean
  and spectrum <math|F<around|(|x|)>>, <math|q<rsub|u>> is a constant given
  by

  <\equation>
    <with|font-base-size|14|<label|eq:stationary_gaussian>q<rsub|u>=<frac|e<rsup|-<frac|1|2>*<frac|u<rsup|2>|\<lambda\><rsub|0>>>|2*\<pi\>*<sqrt|\<lambda\><rsub|0>>>*>
  </equation>

  where

  \;

  The rate of upcrossings is useful for obtaining bounds on the distribution
  of the maximum of <math|X<around|(|t|)>> in <math|<around|(|0,T|)>>. In
  fact

  <\equation>
    <label|eq:probability_bound>P*<around*|{|max<rsub|0\<leq\>t\<leq\>T>
    X<around|(|t|)>\<gtr\>u<around|\||X<around|(|0|)>|\|>\<less\>u|}>\<leq\><frac|<big|int><rsub|0><rsup|T>q<rsub|u><around|(|t|)>*d*t|P*<around|[|X<around|(|0|)>\<less\>u|]>>
  </equation>

  This bound is close for high levels when <math|X<around|(|t|)>> has a
  comparatively wide spectrum, but is too large for narrow-band processes.
  For the latter case, it is known that the sample functions take the form of
  a modulated wave, and that a better approximation to the distribution of
  the maximum is obtained by replacing the process <math|X<around|(|t|)>> by
  its envelope.

  The envelope of a stationary Gaussian process <math|X<around|(|t|)>> with
  zero mean is defined as follows: Let the real form of the spectral
  representation of <math|X<around|(|t|)>> be

  <\equation>
    <label|eq:real_form_spectral>X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    \<lambda\>*t*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
    \<lambda\>*t*<space|0.17em>d*V<around|(|\<lambda\>|)>
  </equation>

  where <math|U<around|(|\<lambda\>|)>> and <math|V<around|(|\<lambda\>|)>>
  are real, uncorrelated processes with orthogonal increments, satisfying

  <\equation>
    E<around|[|U<around|(|\<lambda\>|)>|]>=E<around|[|V<around|(|\<lambda\>|)>|]>=0
  </equation>

  <\equation>
    E<around|[|U<rsup|2><around|(|x|)>|]>=E<around|[|V<rsup|2><around|(|x|)>|]>=G<around|(|\<lambda\>|)>
  </equation>

  The quadrature process <math|<wide|X|^><around|(|t|)>> is defined by

  <\equation>
    <label|eq:quadrature_process><wide|X|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    \<lambda\>*t*<space|0.17em>d*U<around|(|\<lambda\>|)>-cos
    \<lambda\>*t*<space|0.17em>d*V<around|(|\<lambda\>|)>
  </equation>

  It is easy to see that <math|<wide|X|^><around|(|t|)>> is a stationary
  Gaussian process with the same spectrum as <math|X<around|(|t|)>> and that
  <math|X<around|(|t|)>>, <math|<wide|X|^><around|(|t|)>> are uncorrelated.
  The envelope <math|R<around|(|t|)>> is then defined by

  <\equation>
    <label|eq:envelope>R<around|(|t|)>=<sqrt|X<rsup|2><around|(|t|)>+<wide|X|^><rsup|2><around|(|t|)>>
  </equation>

  It can be shown that the marginal distribution of <math|R<around|(|t|)>> is
  Rayleigh, that the derivative <math|R<rprime|'><around|(|t|)>> has a
  Gaussian marginal distribution, and that it is independent of
  <math|R<around|(|t|)>>. Furthermore the rate of upcrossings of
  <math|R<around|(|t|)>> is given by

  <\equation>
    <label|eq:rayleigh_rate>q<rsub|u><rsup|R>=<frac|\<Delta\>|<sqrt|2*\<pi\>>>*<frac|u|\<lambda\><rsub|0>>*e<rsup|-<frac|1|2>*<frac|u<rsup|2>|\<lambda\><rsub|0>>>
  </equation>

  where

  <\equation>
    \<Delta\>=<frac|\<lambda\><rsub|0>*\<lambda\><rsub|2>-\<lambda\><rsub|1><rsup|2>|\<lambda\><rsub|0><rsup|2>>
  </equation>

  The above results are proved in <cite|cramer1967>. It is to be noted that,
  with the exception of equations <reference|eq:expected_rate> and
  <reference|eq:probability_bound>, the given formulae are only valid for
  stationary Gaussian processes.

  Formula <reference|eq:stationary_gaussian> has been generalized to
  non-stationary Gaussian processes by Leadbetter <cite|leadbetter1966>. In
  this paper, we generalize Formula <reference|eq:rayleigh_rate> to a class
  of non-stationary Gaussian processes, the class of oscillatory processes.

  <section|Oscillatory processes>

  Since the concept of envelope is particularly useful for narrow-band
  processes, we require that the class of non-stationary processes considered
  be such that some form of concept of spectrum can be defined for them.

  The class of oscillatory processes is the class of Gaussian processes with
  zero mean which are obtained by passing a stationary Gaussian process with
  zero mean through a linear, but not time-invariant filter.

  Oscillatory processes have been introduced by Priestley
  <cite|priestley1965>.

  Let <math|X<around|(|t|)>> be a stationary process with zero mean, having
  spectral representation

  <\equation>
    <label|eq:spectral_representation>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*d*\<zeta\><around|(|\<lambda\>|)>
  </equation>

  with

  <\equation>
    E*<around|[|d*\<zeta\>|]>=0
  </equation>

  <\equation>
    E<around|[|<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)>
  </equation>

  Then the oscillatory process <math|Y<around|(|t|)>> is given by

  <\equation>
    <label|eq:oscillatory_process>Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*x<around|(|u|)>*d*u
  </equation>

  We define a time-dependent gain function <math|A<around|(|t,\<lambda\>|)>>
  by

  <\equation>
    <label|eq:gain_function>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<lambda\>*u>*d*u
  </equation>

  Then

  <\equation>
    <label|eq:oscillatory_representation>Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<zeta\><around|(|\<lambda\>|)>
  </equation>

  Analogously to stationary processes, we define the 'evolutionary spectrum'
  of <math|Y<around|(|t|)>> by

  <\equation>
    <label|eq:evolutionary_spectrum>d*F<rsup|\<ast\>><around|(|\<lambda\>|)>=<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
  </equation>

  <section|The envelope of an oscillatory process>

  Let

  <\equation>
    <label|eq:complex_a>A<around|(|t,\<lambda\>|)>=a<around|(|t,\<lambda\>|)>+i*\<beta\>*<around|(|t,\<lambda\>|)>
  </equation>

  Using the real form of the spectral representation for
  <math|X<around|(|t|)>> given by <reference|eq:real_form_spectral>, we
  obtain

  <\equation>
    <label|eq:real_form_y>Y<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    \<lambda\>*t*<space|0.17em>d*U<rsup|\<ast\>><around|(|\<lambda\>|)>+sin
    \<lambda\>*t*<space|0.17em>d*V<rsup|\<ast\>><around|(|\<lambda\>|)>
  </equation>

  where

  <\equation>
    <label|eq:du_star>d*U<rsup|\<ast\>><around|(|\<lambda\>|)>=a<around|(|t,\<lambda\>|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+\<beta\>*<around|(|t,\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>
  </equation>

  and

  <\equation>
    <label|eq:dv_star>d*V<rsup|\<ast\>><around|(|\<lambda\>|)>=a<around|(|t,\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>-\<beta\>*<around|(|t,\<lambda\>|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>
  </equation>

  We then define the quadrature process as

  <\equation>
    <label|eq:quadrature_y><wide|Y|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    \<lambda\>*t*<space|0.17em>d*U<rsup|\<ast\>><around|(|\<lambda\>|)>-cos
    \<lambda\>*t*<space|0.17em>d*V<rsup|\<ast\>><around|(|\<lambda\>|)>
  </equation>

  Finally, we define the envelope, <math|R<around|(|t|)>>, by

  <\equation>
    <label|eq:envelope_r>R<around|(|t|)>=<sqrt|Y<rsup|2><around|(|t|)>+<wide|Y|^><rsup|2><around|(|t|)>>
  </equation>

  <section|The joint density function of <math|R<around|(|t|)>> and its
  derivative>

  To obtain the joint density function of <math|R<around|(|t|)>> and its
  derivative, <math|R<rprime|'><around|(|t|)>>, we first find the covariance
  matrix of the four Gaussian processes <math|Y<around|(|t|)>>,
  <math|<wide|Y|^><around|(|t|)>>, <math|Y<rprime|'><around|(|t|)>>,
  <math|<wide|Y|^><rprime|'><around|(|t|)>>. This is given by

  <\equation>
    <label|eq:covariance_matrix><around*|[|<tabular*|<tformat|<table|<row|<cell|\<sigma\><rsub|0>>|<cell|0>|<cell|\<tau\><rsub|0>>|<cell|\<tau\><rsub|1>>>|<row|<cell|0>|<cell|\<sigma\><rsub|0>>|<cell|-\<tau\><rsub|1>>|<cell|\<tau\><rsub|0>>>|<row|<cell|\<tau\><rsub|0>>|<cell|-\<tau\><rsub|1>>|<cell|\<sigma\><rsub|2>>|<cell|0>>|<row|<cell|\<tau\><rsub|1>>|<cell|\<tau\><rsub|0>>|<cell|0>|<cell|\<sigma\><rsub|2>>>>>>|]>
  </equation>

  where

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<sigma\><rsub|0>>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<alpha\><around*|(|t,\<lambda\>|)><rsup|2>+\<beta\><around*|(|t,\<lambda\>|)><rsup|2><space|0.17em>d*G<around|(|\<lambda\>|)>>>|<row|<cell|\<tau\><rsub|0>>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<alpha\><around*|(|t,\<lambda\>|)><wide|\<alpha\>|\<dot\>><around*|(|t,\<lambda\>|)>+\<beta\>*<around*|(|t,\<lambda\>|)><wide|\<beta\>|\<dot\>><around*|(|t,\<lambda\>|)>d*G<around|(|\<lambda\>|)>>>|<row|<cell|\<tau\><rsub|1>>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<lambda\>*<around*|(|\<alpha\><around*|(|t,\<lambda\>|)><rsup|2>+\<beta\><around*|(|t,\<lambda\>|)><rsup|2>|)>+<around*|(|\<alpha\><around*|(|t,\<lambda\>|)><wide|\<beta\>|\<dot\>><around*|(|t,\<lambda\>|)>-\<beta\><around*|(|t,\<lambda\>|)><wide|\<alpha\>|\<dot\>><around*|(|t,\<lambda\>|)>|)><space|0.17em>d*G<around|(|\<lambda\>|)>>>|<row|<cell|\<sigma\><rsub|2>>|<cell|=>|<cell|<with|font-base-size|6|<big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|2>*<around|(|\<alpha\><around*|(|t,\<lambda\>|)><rsup|2>+\<beta\><around*|(|t,\<lambda\>|)><rsup|2>|)>+2\<lambda\>*<around*|(|\<alpha\><around*|(|t,\<lambda\>|)><wide|\<beta\>|\<dot\>><around*|(|t,\<lambda\>|)>-\<beta\><around*|(|t,\<lambda\>|)><wide|\<alpha\>|\<dot\>><around*|(|t,\<lambda\>|)>|)>+<around*|(|<wide|\<alpha\>|\<ddot\>><around|(|t,\<lambda\>|)>+<wide|\<beta\>|\<ddot\>>*<around|(|t,\<lambda\>|)>|)><space|0.17em>d*G<around|(|\<lambda\>|)>>>>>>>
  </equation>

  In the above formulae

  <\equation>
    d*G<around|(|\<lambda\>|)>=E<around|[|<around|{|d*U<around|(|\<lambda\>|)>|}><rsup|2>|]>
  </equation>

  At this stage, we change the scale of <math|Y> and <math|t> to make

  <\equation>
    \<sigma\><rsub|0>=\<sigma\><rsub|2>=1
  </equation>

  We now make the following transformation of variables:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Y>|<cell|=R*cos
    \<theta\>>>|<row|<cell|<wide|Y|^>>|<cell|=R*sin
    \<theta\>>>|<row|<cell|Y<rprime|'>>|<cell|=R<rprime|'>*cos
    \<theta\>-Z*sin \<theta\>>>|<row|<cell|<wide|Y|^><rprime|'>>|<cell|=R<rprime|'>*sin
    \<theta\>+Z*cos \<theta\>>>>>><label|eq:transformation>
  </equation>

  After some algebra, we obtain the following form for the joint density
  function of <math|R> and <math|R<rprime|'>>,
  <math|g<around|(|R,R<rprime|'>|)>>:

  <\equation>
    <with|font-base-size|16|<label|eq:joint_density><tabular|<tformat|<table|<row|<cell|<with|font-base-size|12|g<around|(|R,R<rprime|'>|)>>>|<cell|=<with|font-base-size|12|<frac|R
    |<sqrt|2*\<pi\>*\<Delta\>>>>e<rsup|-<frac|<around|(|1-\<tau\><rsub|1><rsup|2>|)>*R<rsup|2>-2*\<tau\><rsub|0>*R*R<rprime|'>+R<rprime|'><rsup|2>|2*\<Delta\>>>>>|<row|<cell|>|<cell|=<with|font-base-size|12|<frac|R
    |<sqrt|2*\<pi\>*<around*|(|1-\<tau\><rsub|0><rsup|2>-\<tau\><rsub|1><rsup|2>|)>>>>e<rsup|-<frac|<around|(|1-\<tau\><rsub|1><rsup|2>|)>*R<rsup|2>-2*\<tau\><rsub|0>*R*R<rprime|'>+R<rprime|'><rsup|2>|2**<around*|(|1-\<tau\><rsub|0><rsup|2>-\<tau\><rsub|1><rsup|2>|)>>>>>>>>>
  </equation>

  \;

  where

  <\equation>
    \<Delta\>=1-\<tau\><rsub|0><rsup|2>-\<tau\><rsub|1><rsup|2>
  </equation>

  <section|The expected rate of upcrossings at level <math|u> by the
  envelope>

  Assuming that suitable regularity conditions are satisfied, we now apply
  Formula <reference|eq:expected_rate> to the process <math|R<around|(|t|)>>,
  and obtain, denoting as before the expected rate of upcrossings at level
  <math|u> by <math|q<rsub|u><around|(|t|)>>:

  <\equation>
    <label|eq:expected_rate_envelope>q<rsub|u><around|(|t|)>=<sqrt|<frac|\<Delta\>|2*\<pi\>>>*u*e<rsup|-<frac|u<rsup|2>|2>*<around|(|1+\<tau\><rsub|1><rsup|2>|)>>+\<Phi\>*<around*|(|<frac|\<tau\><rsub|0>*u|<sqrt|\<Delta\>>>|)>*\<tau\><rsub|1>*u<rsup|2>*e<rsup|<frac|-u<rsup|2>|2>>
  </equation>

  where <math|\<Phi\><around|(|\<cdummy\>|)>> is the standard normal
  distribution.

  It is easy to verify that when <math|\<alpha\><rprime|'>=\<beta\><rprime|'>=0>,
  Formula <reference|eq:expected_rate_envelope> reduces, as required, to
  Formula <reference|eq:rayleigh_rate>.

  However, it is interesting to note that when
  <math|\<tau\><rsub|0>\<neq\>0>, Formula
  <reference|eq:expected_rate_envelope> behaves very differently from Formula
  <reference|eq:rayleigh_rate> for high levels <math|u>, thus indicating that
  the stationarity assumption for Gaussian processes is not robust as far as
  the distribution of upcrossings and maxima is concerned. This finding can
  be confirmed by looking at the behaviour of the expected rate of
  upcrossings of <math|Y<around|(|t|)>>, as given by the formula of
  Leadbetter <cite|leadbetter1966>.

  <\thebibliography|3>
    <bibitem|cramer1967>Cram�r, H. and Leadbetter, M. R. (1967)
    <with|font-shape|italic|Stationary and Related Stochastic Processes>.
    Wiley, New York.

    <bibitem|leadbetter1966>Leadbetter, M. R. (1966) On crossings of levels
    and curves by a wide class of stochastic processes.
    <with|font-shape|italic|Ann. Math. Statist.> 37, 260-267.

    <bibitem|priestley1965>Priestley, M. B. (1965) Evolutionary spectra and
    non-stationary processes. <with|font-shape|italic|J. R. Statist. Soc. B>
    27, 204-229.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|5|5>>
    <associate|auto-6|<tuple|33|6>>
    <associate|bib-cramer1967|<tuple|cramer1967|6>>
    <associate|bib-leadbetter1966|<tuple|leadbetter1966|6>>
    <associate|bib-priestley1965|<tuple|priestley1965|6>>
    <associate|eq:complex_a|<tuple|20|4>>
    <associate|eq:covariance_matrix|<tuple|26|4>>
    <associate|eq:du_star|<tuple|22|4>>
    <associate|eq:dv_star|<tuple|23|4>>
    <associate|eq:envelope|<tuple|10|2>>
    <associate|eq:envelope_r|<tuple|25|4>>
    <associate|eq:evolutionary_spectrum|<tuple|19|3>>
    <associate|eq:expected_rate|<tuple|2|1>>
    <associate|eq:expected_rate_envelope|<tuple|33|5>>
    <associate|eq:gain_function|<tuple|17|3>>
    <associate|eq:joint_density|<tuple|31|5>>
    <associate|eq:lambda_i|<tuple|3|1>>
    <associate|eq:oscillatory_process|<tuple|16|3>>
    <associate|eq:oscillatory_representation|<tuple|18|3>>
    <associate|eq:probability_bound|<tuple|5|2>>
    <associate|eq:quadrature_process|<tuple|9|2>>
    <associate|eq:quadrature_y|<tuple|24|4>>
    <associate|eq:rayleigh_rate|<tuple|11|2>>
    <associate|eq:real_form_spectral|<tuple|6|2>>
    <associate|eq:real_form_y|<tuple|21|4>>
    <associate|eq:spectral_representation|<tuple|13|3>>
    <associate|eq:stationary_gaussian|<tuple|4|1>>
    <associate|eq:transformation|<tuple|30|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramer1967

      leadbetter1966

      priestley1965

      leadbetter1966
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      envelope of an oscillatory process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      joint density function of <with|mode|<quote|math>|R<around|(|t|)>> and
      its derivative> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      expected rate of upcrossings at level <with|mode|<quote|math>|u> by the
      envelope> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>