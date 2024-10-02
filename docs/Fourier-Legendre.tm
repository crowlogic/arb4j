<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Fourier-Legendre series of Bessel functions of the
  first kind and the summed series involving
  <math|<space|0.17em><rsub|2>F<rsub|3>> hypergeometric functions that arise
  from them>|<doc-author|<author-data|<author-name|Jack C.
  Straton>>>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    The Bessel function of the first kind <math|J<rsub|N>*<around*|(|k*x|)>>
    is expanded in a Fourier-Legendre series, as is the modified Bessel
    functions of the first kind <math|I<rsub|N>*<around*|(|k*x|)>>. The
    purpose of these expansions in Legendre polynomials was not an attempt to
    rival established <em|numerical methods> for calculating Bessel
    functions, but to provide a form for <math|J<rsub|N>*<around*|(|k*x|)>>
    useful for <em|analytical> work in the area of strong laser fields, where
    analytical integration over scattering angles is essential. Despite their
    primary purpose, we can easily truncate the series at 21 terms to provide
    33-digit accuracy that matches IEEE extended precision in some compilers.
    The analytical theme is furthered by showing that infinite series of
    like-powered contributors (involving <math|<space|0.17em><rsub|2>F<rsub|3>>
    hypergeometric functions) extracted from the Fourier-Legendre series may
    be summed, having values that are inverse powers of the eight primes
    <math|1/<around*|(|2<rsup|i>*3<rsup|j>*5<rsup|k>*7<rsup|l>*11<rsup|m>*13<rsup|n>*17<rsup|o>*19<rsup|p>|)>>
    multiplying powers of the coefficient <math|k>.
  </abstract>>

  <lyxaddress|Department of Physics, Portland State University, Portland, OR
  97207-0751, USA>

  <lyxaddress|straton@pdx.edu>

  <vspace|2pc>

  <with|font-shape|italic|Keywords>: Bessel functions, Fourier-Legendre
  series, Laplace series, Polynomial approximations, Computational
  methods<next-line><with|font-shape|italic|2020 Mathematics Subject
  Classification>: 33C10, 42C10, 41A10, 33F10, 65D20, 68W30

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Fourier-Legendre series of a Bessel function of the first kind>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>A
    Numerical Check> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Summing
    a set of infinite series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Series
    arising from the <with|mode|math|J<rsub|1><around*|(|x|)>>
    Fourier-Legendre series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Series
    arising from the <with|mode|math|I<rsub|n><around*|(|x|)>>
    Fourier-Legendre series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  <no-indent>Bessel functions find application in countless fields, so there
  has naturally been a great deal of research into how best to calculate
  them. Just a few of these approaches range from polynomial
  approximations,<cite|AS p. 369 No. 9.4.1|PolyMillane> to solving integral
  equations,<cite|int_Gross> to rational approximations,<cite|rat_Maass|rat_Mart=0000EDn>
  to expansions in Jacobi or Chebyshev polynomials, <cite|jacobi_cheb_Wimp>.
  The latter are particularly prized by many
  workers.<cite|cheb_Clenshaw|Cheb_Zhang|cheb_Coleman>

  However, the present paper has an entirely different goal from
  <em|numerical> approximations to Bessel functions. We seek a representation
  of the Bessel function <math|J<rsub|N>*<around*|(|k*x|)>> in a form that
  will be useful for <em|analytical> integration over angular variables. The
  work most closely related to the present approach are trigonometric
  approximations.<cite|trig_Molinari>

  This need arises from the use of the Strong Field Approximation (SFA)
  <cite|Reiss1|Reiss3|Reiss4|Reiss5|Reiss6|Faisel2> to calculate atomic
  transition amplitudes in intense laser fields. Unlike perturbation
  expansions that will not converge if an applied laser field is large, the
  SFA is an analytical approximation that is non-perturbative. Keating
  <cite|KeatingPhD> applied it to the production of the positive antihydrogen
  ion and found that the reduction of the transition amplitudes to analytic
  form required the expansion of the resultant Bessel functions
  <math|J<rsub|N>*<around*|(|k*x|)>> in a series of spherical harmonics. We
  have been unable to discover such a Laplace series <cite|Haber> in the
  literature, nor does there seem to be an expansion of the Bessel function
  in a series of Legendre polynomials, to which the Laplace series reduces in
  the common case where the function is independent of the azimuthal angle.
  We recreate herein Keating's derivation, stripped of the specialized SFA
  terminology, and find that we can recast his coefficients from another
  layer of infinite series to a <math|<space|0.17em><rsub|2>F<rsub|3>>
  generalized hypergeometric function. We also extend the method to the
  modified Bessel function of the first kind
  <math|I<rsub|N>*<around*|(|k*x|)>>.

  Though designed as an analytical tool, this Fourier-Legendre series is
  easily converted to a series in powers, we do so as a check on its
  validity. Computer code is given in the appendix for these series that
  provide 33-digit accuracy, matching IEEE extended precision in some
  compilers.

  Of further analytical significance, like-powered contributors extracted
  from the Fourier-Legendre series may be summed, having values that are
  inverse inverse powers of the eight primes
  <math|1/<around*|(|2<rsup|i>*3<rsup|j>*5<rsup|k>*7<rsup|l>*11<rsup|m>*13<rsup|n>*17<rsup|o>*19<rsup|p>|)>>
  multiplying even powers of the coefficient <math|k>.

  <section|The Fourier-Legendre series of a Bessel function of the first
  kind>

  We begin with the assumption <cite|Kellogg>that the series

  <\equation>
    J<rsub|N>*<around*|(|k*x|)>=<big|sum><rsub|L=0><rsup|\<infty\>>a<rsub|L*N><around*|(|k|)>*P<rsub|L><around|(|x|)><space|1em><label|eq:Fourier-Legendre
    series>
  </equation>

  converges uniformly,

  <\footnote>
    Let D be a region in which the above series converges for each value of
    x. Then the series can be said to converge uniformly in D if, for every
    <math|\<varepsilon\>\<gtr\>0>, there exists a number
    <math|N<rprime|'><around|(|\<varepsilon\>|)>> such that, for
    <math|n\<gtr\>N<rprime|'>>, it follows that

    <\equation*>
      <around*|\<nobracket\>|<around*|\||J<rsub|N>*<around*|(|k*x|)>-<big|sum><rsub|L=0><rsup|n>a<rsub|L*N><around*|(|k|)>*P<rsub|L><around|(|x|)>|\|>=<around*|\||<big|sum><rsub|L=n+1><rsup|\<infty\>>a<rsub|L*N><around*|(|k|)>*P<rsub|L><around|(|x|)>|\|>|\<nobracket\>>\<less\>\<varepsilon\>
    </equation*>

    for all x in D.
  </footnote>

  \ where the coefficients are given by the orthogonality of the Legendre
  polynomials,

  <\equation>
    a<rsub|L*N><around*|(|k|)>=<frac|2*L+1|2>*<big|int><rsub|-1><rsup|1>J<rsub|N>*<around*|(|k*x|)>*P<rsub|L><around|(|x|)>*d*x<space|0.27em>.<label|eq:coefficients>
  </equation>

  To find these coefficients we following Keating's approach, first using
  Heine's integral representation of the Bessel function
  <cite|MagnusOberhettingerSoni> for integer indices

  <\equation>
    J<rsub|N>*<around|(|k*x|)>=<frac|i<rsup|-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>>e<rsup|i*k*x*cos
    \<theta\>>*cos <around*|(|N*\<theta\>|)>*d*\<theta\><space|0.27em>,<label|eq:jint>
  </equation>

  so that

  <\equation>
    a<rsub|L*N><around*|(|k|)>=<frac|2*L+1|2>*<big|int><rsub|-1><rsup|1><around*|[|<frac|i<rsup|-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>>e<rsup|i*k*x*cos
    \<theta\>>*cos <around*|(|N*\<theta\>|)>*d*\<theta\>|]>*P<rsub|L><around|(|x|)>*d*x<space|0.27em>.<label|eq:curleyjxtheta>
  </equation>

  By switching the order of integration,

  <\equation>
    a<rsub|L*N><around*|(|k|)>=<frac|2*L+1|2>*<frac|i<rsup|-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>><around*|[|<big|int><rsub|-1><rsup|1>e<rsup|i*k*x*cos
    \<theta\>>*P<rsub|L><around|(|x|)>*d*x|]>*cos
    <around*|(|N*\<theta\>|)>*d*\<theta\><space|0.27em>,<label|eq:scriptjbeforelpinsertion>
  </equation>

  we can expand the plane wave in a series of products of Spherical Bessel
  functions <math|j<rsub|m><around|(|y|)>> and Legendre polynomials<cite|GR5
  p. 987 No. 8.511.4|Joachain p. 671 Eq. (B.46)>

  <\equation>
    e<rsup|i*k*x*cos \<theta\>>=<big|sum><rsub|l<rprime|'>><around|(|2*l<rprime|'>+1|)>*i<rsup|l<rprime|'>>*j<rsub|l<rprime|'>>*<around*|(|k*cos
    \<theta\>|)>*P<rsub|l<rprime|'>><around|(|x|)><space|0.27em>.<label|eq:GR5
    p. 987 No. 8.511.4>
  </equation>

  <no-indent>Then

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|a<rsub|L*N><around*|(|k|)>>|<cell|=>|<cell|<frac|2*L+1|2>*<frac|i<rsup|-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>><around*|[|<big|int><rsub|-1><rsup|1><around*|(|<big|sum><rsub|l<rprime|'>=0><rsup|\<infty\>><around|(|2*l<rprime|'>+1|)>*i<rsup|l<rprime|'>>*j<rsub|l<rprime|'>>*<around*|(|k*cos
    \<theta\>|)>*P<rsub|l<rprime|'>><around|(|x|)>|)>*P<rsub|L><around|(|x|)>*d*x|]>*cos
    <around*|(|N*\<theta\>|)>*d*\<theta\>>>|<row|<cell|>|<cell|=>|<cell|<frac|2*L+1|2>*<frac|i<rsup|-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>><around*|[|<around*|(|<big|sum><rsub|l<rprime|'>=0><rsup|\<infty\>><around|(|2*l<rprime|'>+1|)>*i<rsup|l<rprime|'>>*j<rsub|l<rprime|'>>*<around*|(|k*cos
    \<theta\>|)><frac|2|2*l<rprime|'>+1>*\<delta\><rsub|l<rprime|'>*L>|)>|]>*cos
    <around*|(|N*\<theta\>|)>*d*\<theta\>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|2*L+1|)>*<frac|i<rsup|L-N>|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>>j<rsub|L>*<around*|(|k*cos
    \<theta\>|)>*cos <around*|(|N*\<theta\>|)>*d*\<theta\><space|0.27em>.>>>>><label|eq:scriptj0>
  </equation>

  Using the series expansion <cite|wolfram.com/03.21.06.0019.01>

  <\equation>
    j<rsub|l><around|(|x|)>=<frac|1|2>*<sqrt|\<pi\>><around*|(|<frac|x|2>|)><rsup|l>*<big|sum><rsub|M=0><rsup|\<infty\>><frac|<around*|(|-<frac|1|4>|)><rsup|M>*x<rsup|2*M>|M!\<Gamma\>*<around*|(|l+M+<frac|3|2>|)>><label|eq:wolfram03.21.06.0019.01>
  </equation>

  this becomes

  <\eqnarray>
    <tformat|<table|<row|<cell|a<rsub|L*N><around*|(|k|)><space|-.3cm>>|<cell|=>|<cell|<space|-.3cm><frac|<around|(|2*L+1|)>|<sqrt|\<pi\>>>*i<rsup|L-<text|NN>>*2<rsup|-L-1><around*|(|<big|sum><rsub|M=0><rsup|\<infty\>><frac|<around*|(|-<frac|1|4>|)><rsup|M>*k<rsup|L+2*M>|M!\<Gamma\>*<around*|(|L+M+<frac|3|2>|)>>|)>*<big|int><rsub|0><rsup|\<pi\>>cos<rsup|L+2*M><around|(|\<theta\>|)>*cos
    <around*|(|<text|N>\<theta\>|)>*<space|0.17em>d*\<theta\>.<eq-number><label|eq:a_w_M_sum>>>>>
  </eqnarray>

  Gröbner and Hofreiter<cite|GH p. 110 No. 332.14a> extended an integral over
  the interval <math|<around*|[|0,<frac|\<pi\>|2>|]>> that has three
  branches, to the interval <math|<around*|[|0,\<pi\>|]>> with a prefactor
  <math|<around|(|1+<around|(|-1|)><rsup|m+n>|)>> that renders the central
  one of the three possibilities nonzero only for even values for <math|m+n>.

  <\equation>
    <big|int><rsub|0><rsup|\<pi\>>c*o*s<rsup|m>*\<theta\>*<space|0.17em>c*o*s*<around|(|n*\<theta\>|)>*d*\<theta\>=<around*|(|1+<around|(|-1|)><rsup|m+n>|)>*<frac|\<pi\>|2<rsup|m+1>><binom|m|<frac|m-n|2>><space|1em><around*|[|<with|math-font-family|rm|where<space|0.22em>>m\<geq\>n\<gtr\>-1,<space|0.17em>m-n=2*K|]><space|0.27em>.<label|eq:GR5
    p. 417 No. 3.631.17>
  </equation>

  The other two branches, being for odd <math|m+n> on
  <math|<around*|[|0,<frac|\<pi\>|2>|]>>, are zero on
  <math|<around*|[|0,\<pi\>|]>> when this prefactor is included. (Numerical
  integration also confirms that the contributions from the
  <math|<around*|[|<frac|\<pi\>|2>,\<pi\>|]>> interval cancels the
  contributions from the <math|<around*|[|0,<frac|\<pi\>|2>|]>> on these
  branches.) The fifth edition of Gradshteyn and Ryzhik<cite|GR5 p. 417 No.
  3.631.17> (in which <em|m> and <em|n> are reversed in meaning) nevertheless
  included all three branches and this prefactor on the interval
  <math|<around*|[|0,\<pi\>|]>>. By their seventh edition, Gradshteyn and
  Ryzhik removed this integral entirely despite the correctness of the
  central branch on the interval <math|<around*|[|0,\<pi\>|]>>. Neither
  source noted the lower limit on <em|m> that we found, that
  <math|m\<geq\>n\<gtr\>-1>.

  The final form for the coefficient set of the Fourier-Legendre series for
  the Bessel function <math|J<rsub|N>*<around*|(|k*x|)>> is then

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|a<rsub|L*N><around*|(|k|)>>|<cell|=>|<cell|<sqrt|\<pi\>>*<around|(|2*L+1|)>*2<rsup|-L-1>*i<rsup|L-<text|N>>*<big|sum><rsub|M=0><rsup|\<infty\>><frac|<around*|(|<around*|(|-<frac|1|4>|)><rsup|M>*k<rsup|L+2*M>|)>|2<rsup|L+2*M+1>*<around*|(|M!\<Gamma\>*<around*|(|L+M+<frac|3|2>|)>|)>>>>|<row|<cell|>|<cell|\<times\>>|<cell|<around*|(|1+<around|(|-1|)><rsup|L+2*M+<text|N>>|)><binom|L+2*M|<frac|1|2>*<around|(|L+2*M-<text|N>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|<sqrt|\<pi\>>*2<rsup|-2*L-2>*<around|(|2*L+1|)>*k<rsup|L>*i<rsup|L-N>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>>*<around*|(|1+<around|(|-1|)><rsup|L+N>|)><binom|L|<frac|L-N|2>>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|2>F<rsub|3><around*|(|<frac|L|2>+<frac|1|2>,<frac|L|2>+1;L+<frac|3|2>,<frac|L|2>-<frac|N|2>+1,<frac|L|2>+<frac|N|2>+1;-<frac|k<rsup|2>|4>|)>>>|<row|<cell|>|<cell|=>|<cell|<sqrt|\<pi\>>*<space|0.17em>2<rsup|-2*L-2>*<around|(|2*L+1|)>*k<rsup|L>*i<rsup|L-N>*<around*|(|1+<around|(|-1|)><rsup|L+N>|)>*\<Gamma\>*<around|(|L+1|)>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|2><wide|F|~><rsub|3><around*|(|<frac|L|2>+<frac|1|2>,<frac|L|2>+1;L+<frac|3|2>,<frac|L|2>-<frac|N|2>+1,<frac|L|2>+<frac|N|2>+1;-<frac|k<rsup|2>|4>|)>>>>>><space|0.27em>,<label|eq:a_L_as_2F3>
  </equation>

  where the final two steps are new with the present work. We have included
  the final form using regularized hypergeometric functions
  <cite|wolfram.com/07.26.26.0001.01>

  <\equation>
    <space|0.17em><rsub|2>F<rsub|3><around*|(|a<rsub|1>,a<rsub|2>;b<rsub|1>,b<rsub|2>,b<rsub|3>;z|)>=\<Gamma\><around*|(|b<rsub|1>|)>*\<Gamma\><around*|(|b<rsub|2>|)>*\<Gamma\><around*|(|b<rsub|3>|)>*<space|0.17em><rsub|2><wide|F|~><rsub|3><around*|(|a<rsub|1>,a<rsub|2>;b<rsub|1>,b<rsub|2>,b<rsub|3>;z|)><label|eq:regularized>
  </equation>

  and cancelled the <math|\<Gamma\><around*|(|b<rsub|i>|)>> with gamma
  functions in the denominators of the prefactors. Each give infinities that
  arise whenever <em|N<textgreater|>1> is an integer larger than <em|L>, and
  of the same parity, resulting in indeterminacies in a computation when one
  tries to use the conventional form of the hypergeometric function.

  For the special cases of <math|N=0,<space|0.17em>1> the order of the
  hypergeometric functions is reduced since the parameters
  <math|a<rsub|2>=b<rsub|3>> and <math|a<rsub|1>=b<rsub|2>>, resp., giving

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|a<rsub|L*0><around*|(|k|)>>|<cell|=>|<cell|<frac|<sqrt|\<pi\>>*i<rsup|L>*2<rsup|-2*L-2>*<around|(|2*L+1|)>*k<rsup|L>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>>*<around*|(|1+<around|(|-1|)><rsup|L>|)><binom|L|<frac|L|2>>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>>|<row|<cell|>|<cell|=>|<cell|<sqrt|\<pi\>>*i<rsup|L>*2<rsup|-2*L-2>*<around|(|2*L+1|)>*k<rsup|L>*\<Gamma\>*<around*|(|<frac|L|2>+1|)>*<around*|(|1+<around|(|-1|)><rsup|L>|)><binom|L|<frac|L|2>>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1><wide|F|~><rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>>>>><space|0.27em>,<label|eq:a_L0>
  </equation>

  and

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|a<rsub|L*1><around*|(|k|)>>|<cell|=>|<cell|<frac|<sqrt|\<pi\>>*i<rsup|L-1>*2<rsup|-2*L-2>*<around|(|2*L+1|)>*k<rsup|L>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>>*<around*|(|1+<around|(|-1|)><rsup|L+1>|)><binom|L|<frac|L-1|2>>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+1;<frac|L|2>+<frac|3|2>,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>>|<row|<cell|>|<cell|=>|<cell|i<rsup|L-1>*2<rsup|-L-2>*<around|(|2*L+1|)>*k<rsup|L>*\<Gamma\>*<around*|(|<frac|L|2>+1|)>*<around*|(|1+<around|(|-1|)><rsup|L+1>|)>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1><wide|F|~><rsub|2><around*|(|<frac|L|2>+1;<frac|L|2>+<frac|3|2>,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>>>>><space|0.27em>,<label|eq:a_L1>
  </equation>

  In each special case the first form involving a hypergeometric function has
  no indeterminacies, but we include the regularized hypergeometric function
  version for completeness.

  <section|A Numerical Check>

  Numerical checks are an essential element of any analytical work,
  particularly in checking convergence. Much of my research in physics has
  revolved around writing my own programs to diagonalize very large
  Hamiltonian matrices and I have found that I routinely need to calculate in
  quadruple precision (33-digits) to gain consistent double-precision
  results. Since this research often contains Bessel functions, it made sense
  to craft a quadruple precision approximation for
  <math|J<rsub|0>*<around*|(|k*x|)>>that would both allow for numerical
  checks and be useful for some future project of mine, or of other
  researchers, calculated in quadruple precision. Though Castellanos and
  Rosenthal obtain fifteen-decimal accuracy with their Rational Chebyshev
  Approximations,<cite|Rational Chebyshev> and there is a ZBESJ Bessel
  function double precision package that has 18-digit accuracy (UNIVAC double
  precision),<cite|Amos_double> I found no prepackaged quadruple precision
  routines in a search of software libraries. For this reason I have
  displayed all coefficients in what follows in 33-digits, accuracy that
  matches IEEE selected_real_kind(33, 4931) extended precision<footnote|The
  second argument, 4931, indicates a range <math|10<rsup|-4931>>to
  <math|10<rsup|4931>-1> using128 bits.<cite|floating_point>> available on
  some compilers. These results are given in the appendix so that that
  readers may simply copy and paste them into a calculation routine.

  The first 22 terms in the sum (<reference|eq:Fourier-Legendre series>) are
  then, with <math|k=1> (using E-<math|7> as the programming shorthand for
  <math|\<times\>10<rsup|-7>>),

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|\<cong\>>|<cell|0.9197304100897602393144211940806200*P<rsub|0><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|0.1579420586258518875737139671443637*P<rsub|2><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.003438400944601109232996887872072915*P<rsub|4><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|0.00002919721848828729693660590986125663*P<rsub|6><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.317356952447780977655616563143280*<text|E->7*<space|0.22em>P<rsub|8><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|3.684500844208203027173771096058866*<text|E->10*<space|0.22em>P<rsub|10><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.011830032993845928208803328211457*<text|E->13*<space|0.27em>P<rsub|12><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|9.665964369858912263671995372753346*<text|E->16*<space|0.27em>P<rsub|14><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.009636276824546446525342170924936*<text|E->18*<space|0.27em>P<rsub|16><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|8.266656955927637858991972584174117*<text|E->22*<space|0.27em>P<rsub|18><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|5.448244867762758725890082837839430*<text|E->25*<space|0.27em>P<rsub|20><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|2.952527182137354751675774606663400*<text|E->28*<space|0.27em>P<rsub|22><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.338856158858534469080898670096200*<text|E->31*<space|0.27em>P<rsub|24><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|5.154913186088512926193234837816582*<text|E->35*<space|0.27em>P<rsub|26><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.706231577038503450138564028467634*<text|E->38*<space|0.27em>P<rsub|28><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|4.906893556427796857473097979568289*<text|E->42*<space|0.27em>P<rsub|30><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.237489200717479383020539576221293*<text|E->45*<space|0.27em>P<rsub|32><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|2.759056237537871868604555688548364*<text|E->49*<space|0.27em>P<rsub|34><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|5.477382207172712629199714648396409*<text|E->53*<space|0.27em>P<rsub|36><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|9.744200345578852550688946057050674*<text|E->57*<space|0.27em>P<rsub|38><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.562280711659504489828025148995770*<text|E->60*<space|0.27em>P<rsub|40><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|2.269056283827394368836057470594599*<text|E->60*<space|0.27em>P<rsub|42><around|(|x|)><space|0.27em>.<eq-number><label|eq:Fourier-Legendre
    series-numerical>>>>>
  </eqnarray>

  If we wish to check the convergence of this series at, say, the
  <math|<around*|\||\<varepsilon\>|\|>\<less\>5\<times\>10<rsup|-8>> level of
  the polynomial approximation given by E. E. Allen (and reproduced in
  Abramowitz and Stegun),<cite|AS p. 369 No. 9.4.1>

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|\<cong\>>|<cell|1-2.25<around*|(|<frac|x|3>|)><rsup|2>+1.26562<around*|(|<frac|x|3>|)><rsup|4>-0.316387<around*|(|<frac|x|3>|)><rsup|6>+0.0444479<around*|(|<frac|x|3>|)><rsup|8>>>|<row|<cell|>|<cell|->|<cell|0.0039444<around*|(|<frac|x|3>|)><rsup|10>+0.0002100<around*|(|<frac|x|3>|)><rsup|12><space|0.27em>,<eq-number><label|eq:AS
    p. 369 No. 9.4.1>>>>>
  </eqnarray>

  at the latter's limiting range of <math|x=3> (with a value of
  <math|-0.260052>), we find that truncating the series after the
  <math|P<rsub|12><around|(|x|)>> term (to get contributions through
  <math|x<rsup|12>>) is insufficient, giving two fewer digits of accuracy
  (<math|-0.260045>). This shows that the optimization Allen must have done
  to obtain his approximation has a significant effect.

  Testing accuracy at the 15-digit level shows that we can truncating the
  series after the <math|P<rsub|24><around|(|x|)>> term in the result,
  <math|-0.260051954901933>. This <math|<around*|\||\<varepsilon\>|\|>\<less\>5\<times\>10<rsup|-16>>
  is much better than one would expect from doubling the number of powers in
  our unoptimized approximation with <math|P<rsub|12><around|(|x|)>>. In
  addition, the <em|range> of applicability of the new Legendre approximation
  truncated after <math|P<rsub|24><around|(|x|)>\<sim\>x<rsup|24>>, if one is
  satisfied with <math|<around*|\||\<varepsilon\>|\|>\<less\>5\<times\>10<rsup|-8>>,
  roughly doubles to <math|J<rsub|0><around*|(|6|)>\<cong\>0.15064531>.

  Finally, in our quality checking step, we found that if we imported a
  33-digit version of (<reference|eq:Fourier-Legendre series-numerical>) back
  into the software we had been using to generate it, <em|Mathematica>
  <em|7>, we only obtained a result accurate
  to<math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-32>>, but
  if we imported the 34-digit version actually displayed in
  (<reference|eq:Fourier-Legendre series-numerical>), we obtained a result
  accurate to<math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-34>>
  over the range <math|-3\<leq\>x\<leq\>3>, with
  <math|J<rsub|0><around*|(|3|)>\<cong\>-0.260051954901933437624154695977331>.
  Accuracy exceeds <math|<around*|\||\<varepsilon\>|\|>\<less\>7\<times\>10<rsup|-15>>
  over the range <math|-8\<leq\>x\<leq\>8>, with
  <math|J<rsub|0><around*|(|8|)>\<cong\>0.171650807137560>.

  <section|Summing a set of infinite series>

  If Allen's polynomial approximation <cite|AS p. 369 No. 9.4.1> has its
  powers of three folded into the coefficients, it becomes

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>\<cong\>1-0.25*<space|0.22em>x<rsup|2>+0.0156249*<space|0.17em>x<rsup|4>-0.000434001*<space|0.22em>x<rsup|6>+6.77456*<text|E->6*<space|0.17em>x<rsup|8>-6.6799*<text|E->8*<space|0.17em>x<rsup|10>>>|<row|<cell|+3.952*<text|E->10*<space|0.17em>x<rsup|12><space|0.27em>.<eq-number><label|eq:AS
    p. 369 No. 9.4.1^x>>>>>
  </eqnarray>

  Noting that the third term is <math|1/64.0004>, one is led to wonder if
  each of these coefficients is made up of inverse powers of primes if one
  were to rederive a similar approximation using a process with greater
  accuracy.

  We can easily expand the Legendre polynomials into their constituent terms
  and gather like powers in (<reference|eq:Fourier-Legendre
  series-numerical>) to give an updated polynomial approximation,

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|\<cong\>>|<cell|1.000000000000000000000000000000000000*<space|0.17em>x<rsup|0>>>|<row|<cell|>|<cell|->|<cell|0.2500000000000000000000000000000000000*<space|0.17em>x<rsup|2>>>|<row|<cell|>|<cell|+>|<cell|0.01562500000000000000000000000000000000*<space|0.17em>x<rsup|4>>>|<row|<cell|>|<cell|->|<cell|0.0004340277777777777777777777777777777778*<space|0.17em>x<rsup|6>>>|<row|<cell|>|<cell|+>|<cell|6.781684027777777777777777777777777778*<text|E->6*<space|0.27em>x<rsup|8>>>|<row|<cell|>|<cell|->|<cell|6.781684027777777777777777777777777778*<text|E->8*<space|0.27em>x<rsup|10>>>|<row|<cell|>|<cell|+>|<cell|4.709502797067901234567901234567901235*<text|E->10*<space|0.27em>x<rsup|12>>>|<row|<cell|>|<cell|->|<cell|2.402807549524439405391786344167296548*<text|E->12*<space|0.27em>x<rsup|14>>>|<row|<cell|>|<cell|+>|<cell|9.385966990329841427311665406903502142*<text|E->15*<space|0.27em>x<rsup|16>>>|<row|<cell|>|<cell|->|<cell|2.896903392077111551639402903365278439*<text|E->17*<space|0.27em>x<rsup|18>>>|<row|<cell|>|<cell|+>|<cell|7.242258480192778879098507258413196097*<text|E->20*<space|0.27em>x<rsup|20>>>|<row|<cell|>|<cell|->|<cell|1.496334396734045222954237036862230599*<text|E->22*<space|0.27em>x<rsup|22>>>|<row|<cell|>|<cell|+>|<cell|2.597802772107717400962217077885817011*<text|E->25*<space|0.27em>x<rsup|24>>>|<row|<cell|>|<cell|->|<cell|3.842903509035084912666001594505646466*<text|E->28*<space|0.17em>x<rsup|26>>>|<row|<cell|>|<cell|+>|<cell|4.901662639075363409012757135849038860*<text|E->31*<space|0.27em>x<rsup|28>>>|<row|<cell|>|<cell|->|<cell|5.446291821194848232236396817610043178*<text|E->34*<space|0.27em>x<rsup|30>>>|<row|<cell|>|<cell|+>|<cell|5.318644356635593976793356267197307791*<text|E->37*<space|0.27em>x<rsup|32>>>|<row|<cell|>|<cell|->|<cell|4.600903422695150498956190542558224733*<text|E->40*<space|0.27em>x<rsup|34>>>|<row|<cell|>|<cell|+>|<cell|3.550079801462307483762492702591222788*<text|E->43*<space|0.27em>x<rsup|36>>>|<row|<cell|>|<cell|->|<cell|2.458504017633176927813360597362342651*<text|E->46*<space|0.27em>x<rsup|38>>>|<row|<cell|>|<cell|+>|<cell|1.5365650110207355798833503733514641567*<text|E->49*<space|0.27em>x<rsup|40>>>|<row|<cell|>|<cell|->|<cell|8.7106860035189091830121903251216788929*<text|E->53*<space|0.27em>x<rsup|42>>>|<row|<cell|>|<cell|\<cong\>>|<cell|1-<frac|x<rsup|2>|2<rsup|2>>+<frac|x<rsup|4>|2<rsup|6>>-<frac|x<rsup|6>|2<rsup|8>*3<rsup|2>>+<frac|x<rsup|8>|2<rsup|14>*3<rsup|2>>-<frac|x<rsup|10>|2<rsup|16>*3<rsup|2>*5<rsup|2>>+<frac|x<rsup|12>|2<rsup|20>*3<rsup|4>*5<rsup|2>>-<frac|x<rsup|14>|2<rsup|22>*3<rsup|4>*5<rsup|2>*7<rsup|2>>+<frac|x<rsup|16>|2<rsup|30>*3<rsup|4>*5<rsup|2>*7<rsup|2>>>>|<row|<cell|>|<cell|->|<cell|<frac|x<rsup|18>|2<rsup|32>*3<rsup|8>*5<rsup|2>*7<rsup|2>>+<frac|x<rsup|20>|2<rsup|36>*3<rsup|8>*5<rsup|4>*7<rsup|2>>-<frac|x<rsup|22>|2<rsup|38>*3<rsup|8>*5<rsup|4>*7<rsup|2>*11<rsup|2>>+<frac|x<rsup|24>|2<rsup|44>*3<rsup|10>*5<rsup|4>*7<rsup|2>*11<rsup|2>>-<frac|x<rsup|26>|2<rsup|46>*3<rsup|10>*5<rsup|4>*7<rsup|2>*11<rsup|2>*13<rsup|2>>>>|<row|<cell|>|<cell|+>|<cell|<frac|x<rsup|28>|2<rsup|50>*3<rsup|10>*5<rsup|4>*7<rsup|4>*11<rsup|2>*13<rsup|2>>-<frac|x<rsup|30>|2<rsup|52>*3<rsup|12>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>>+<frac|x<rsup|32>|2<rsup|62>*3<rsup|12>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>>>>|<row|<cell|>|<cell|->|<cell|<frac|x<rsup|34>|2<rsup|64>*3<rsup|12>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>>+<frac|x<rsup|36>|2<rsup|68>*3<rsup|16>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>>-<frac|x<rsup|38>|2<rsup|70>*3<rsup|16>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19<rsup|2>>>>|<row|<cell|>|<cell|+>|<cell|<frac|x<rsup|40>|2<rsup|76>*3<rsup|16>*5<rsup|8>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19<rsup|2>>-<frac|x<rsup|42>|2<rsup|78>*3<rsup|18>*5<rsup|8>*7<rsup|6>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19<rsup|2>><space|0.27em>.<eq-number><label|eq:poly_approx_48_digit>>>>>
  </eqnarray>

  One can see from the repeating digits that the fourth through sixth lines
  in (<reference|eq:poly_approx_48_digit>) have inverses that are powers of
  primes, and one can even see that the fifth term is
  <math|2<rsup|2>*5<rsup|2>> times the sixth. Subsequent terms are not at all
  obviously inverse powers of primes. Indeed, revealing those powers as
  analytic entities required many terms in excess of those required to
  achieve quadruple precision in the numerical results, and significantly
  higher precision.

  One might suppose that that including series terms through
  <math|P<rsub|24><around|(|x|)>> would be sufficient for revealing the
  inverse powers in the coefficient of, say, the <math|x<rsup|16>> term, but
  that is not the case. Increasing the precision from 33 to 48-digits did not
  improve the situation enough. At that series truncation and with 48-digit
  precision, the inverse of the coefficient of the <math|x<rsup|16>> term is
  <math|<with|math-font-family|bf|106542032486495>.*616348409991752462411671619456197>,
  whose integer part is in bold face. (We used the algebra and calculus
  computer software <em|Mathematica> 7 for this work.) This is not a product
  of low-level primes. Adding one more term, <math|P<rsub|26><around|(|x|)>>,
  is sufficient to bring it to <math|<with|math-font-family|bf|106542032486400>.*113376300998684305400416345779209>,
  whose integer part is <math|2<rsup|30>*3<rsup|4>*5<rsup|2>*7<rsup|2>>. One
  additional term makes this <math|<with|math-font-family|bf|106542032486400>.*000104784167278249059923631013442>
  and with every additional term added, the integer part remains the same
  while the fractional part diminishes by several decimal places. The
  coefficient of the <math|x<rsup|24>> term required 40 terms in the series,
  with 48-digit precision, to establish convergence. The coefficient of the
  <math|x<rsup|42>> term required 74 terms in the series, with 50-digit
  precision, to establish convergence.

  All of the coefficients in (<reference|eq:poly_approx_48_digit>) include
  contributions from all 74 terms in the series, calculated with 50-digit
  precision. These were then truncated to the 37-digit precision displayed
  therein, except for the last two that required 38 digits. Taking their
  reciprocals after truncation did not forestall revealing their integer
  parts as powers of primes. The truncated power series gives
  <math|J<rsub|0><around*|(|3|)>\<cong\>-0.2600519549019334376241546959773314809>,
  which matches <em|Mathematica>'s BesselJ[0,3]=<math|-0.2600519549019334376241546959773314368>
  (when set to 37-digit precision) within an error of
  <math|<around*|\||\<varepsilon\>|\|>\<less\>4\<times\>10<rsup|-35>> , as
  does the inverse prime version,

  <no-indent><math|J<rsub|0><around*|(|3|)>\<cong\>-<frac|90658024929169559805594876257679495662633|348615048725002045174179287542005760000000>=-0.2600519549019334376241546959773314809>.

  Close examination of the inverse prime version shows that we have managed
  to translate into integer powers the denominators of the first 22 terms of
  the well-known series representation<cite|GR5 p. 970 No. 8.440>

  <\equation>
    J<rsub|\<nu\>><around*|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k><around*|(|<frac|x|2>|)><rsup|2*k+\<nu\>>|k!\<Gamma\>*<around|(|k+\<nu\>+1|)>>.<label|eq:GR5
    p. 970 No. 8.440>
  </equation>

  (There is a fascinating analogue to this result arising from studies of the
  Bessel difference equation.<cite|Cuchta>) But the outcome worth the trouble
  of this investigation is that this process yields a set of infinite sums
  whose values are inverse powers of primes. The question of why so many
  Legendre polynomials are required to get sufficiently accurate coefficients
  in (<reference|eq:poly_approx_48_digit>) led to an examination of precisely
  how a given <math|x<rsup|n>> contributor from each Legendre polynomial
  contributes to the respective coefficient.

  Looking back at the coefficients in (<reference|eq:Fourier-Legendre
  series-numerical>) when multiplied by the constant terms in the Legendre
  polynomials that multiply them, whose first few are

  <\eqnarray>
    <tformat|<table|<row|<cell|<around*|{|P<rsub|0><around|(|x|)>=1,<space|0.27em>P<rsub|2><around|(|x|)>=<frac|1|2>*<around*|(|3*x<rsup|2>-1|)>,<space|0.27em>P<rsub|4><around|(|x|)>=<frac|1|8>*<around*|(|35*x<rsup|4>-30*x<rsup|2>+3|)>,|\<nobracket\>>>>|<row|<cell|<around*|\<nobracket\>|<space|0.27em>P<rsub|6><around|(|x|)>=<frac|1|16>*<around*|(|231*x<rsup|6>-315*x<rsup|4>+105*x<rsup|2>-5|)>|}><space|0.27em>,<eq-number><label|eq:P0toP6>>>>>
  </eqnarray>

  there is no reason to suspect that

  <\eqnarray>
    <tformat|<table|<row|<cell|0.919730410089760239314421194080620>|<cell|>|<cell|>>|<row|<cell|-<frac|1|2>*<around*|(|-0.157942058625851887573713967144364|)>>|<cell|>|<cell|>>|<row|<cell|+<frac|3|8><around*|(|0.00343840094460110923299688787207292|)>>|<cell|>|<cell|>>|<row|<cell|-<frac|5|16>*<around*|(|-0.0000291972184882872969366059098612566|)>>|<cell|>|<cell|>>|<row|<cell|+\<cdots\>>|<cell|=>|<cell|1<eq-number><label|eq:first4products>>>>>
  </eqnarray>

  rather than some other number close to <em|1>, but one sees uniform
  convergence up through the accuracy of the calculation as one adds
  additional terms, as seen in Table 1.

  <vspace*|.3cm><tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|2ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<cwith|4|4|1|-1|cell-bborder|1ln>|<cwith|5|5|1|-1|cell-bborder|1ln>|<cwith|6|6|1|-1|cell-bborder|1ln>|<cwith|7|7|1|-1|cell-bborder|1ln>|<cwith|8|8|1|-1|cell-bborder|1ln>|<cwith|9|9|1|-1|cell-bborder|1ln>|<cwith|10|10|1|-1|cell-bborder|1ln>|<cwith|11|11|1|-1|cell-bborder|1ln>|<cwith|12|12|1|-1|cell-bborder|1ln>|<cwith|13|13|1|-1|cell-bborder|1ln>|<cwith|14|14|1|-1|cell-bborder|1ln>|<cwith|15|15|1|-1|cell-bborder|1ln>|<cwith|16|16|1|-1|cell-bborder|1ln>|<cwith|17|17|1|-1|cell-bborder|1ln>|<table|<row|<cell|0.919730410089760239314421194080619970661964806513>>|<row|<cell|0.998701439402686183101278177652801821334364120020>>|<row|<cell|0.999990839756911599063652010604829164640891568430>>|<row|<cell|0.999999963887689188843944699951660807338623340119>>|<row|<cell|0.999999999909168357337955807722426205787682516277>>|<row|<cell|0.999999999999841620300892054094280728854756176645>>|<row|<cell|0.99999999999999979732605041136082528291421094660>>|<row|<cell|0.999999999999999999801573588581204243621535893434>>|<row|<cell|0.999999999999999999999846581786952424267000275450>>|<row|<cell|0.999999999999999999999999903953851991585994488442>>|<row|<cell|0.999999999999999999999999999950320420042897103088>>|<row|<cell|0.999999999999999999999999999999978412290228685090>>|<row|<cell|0.999999999999999999999999999999999992008312509362>>|<row|<cell|0.999999999999999999999999999999999999997449396440>>|<row|<cell|0.999999999999999999999999999999999999999999290955>>|<row|<cell|0.999999999999999999999999999999999999999999999827>>|<row|<cell|1.00000000000000000000000000000000000000000000000>>>>>

  Table 1. The constant term of the Legendre series approximation as
  increasing numbers of terms are added from (<reference|eq:Fourier-Legendre
  series-numerical>), to 48 digit accuracy.

  <vspace*|0.4cm>One may more formally concluded that

  <\equation>
    <big|sum><rsub|L=0><rsup|\<infty\>><space|0.17em><rsup|<around|(|2|)>><frac|<sqrt|\<pi\>>*i<rsup|L>*<around|(|2*L+1|)><binom|L|<frac|L|2>><binom|2*L|L><around*|(|<frac|1|2>-<frac|L|2>|)><rsub|<frac|L|2>>*<around*|(|-<frac|L|2>|)><rsub|<frac|L|2>>*<text|2><rsup|-3*L-2><space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|1|4>|)>|<frac|L|2>!<around*|(|<frac|1|2>-L|)><rsub|<frac|L|2>>*\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>>=1<label|eq:1=00003D00003D>
  </equation>

  where the superscript \P(2)\Q on the sum indicates one is summing even
  values only (or one may retain the factor
  <math|<around*|(|1+<around|(|-1|)><rsup|L>|)>> in the sum as we do for
  similar equations below), which is a result we have not seen in the
  literature. The Pochhammer symbols <math|<around*|(|<frac|1|2>-<frac|L|2>|)><rsub|<frac|L|2>>>
  and so on derive from a shift to<cite|PBM3 p. 468 No. 7.3.1.206>

  <\equation>
    P<rsub|n><around|(|x|)>=2<rsup|-n><binom|2*n|n>x<rsup|n>*<space|0.17em><rsub|2>F<rsub|1><around*|(|<frac|1|2>-<frac|n|2>,-<frac|n|2>;<frac|1|2>-n;<frac|1|x<rsup|2>>|)><label|eq:PBM3
    p. 468 No. 7.3.1.206>
  </equation>

  in the explicit sum.<cite|PBM3 p. 430 No. 7.2.1.1>

  One may check that the series (<reference|eq:1=00003D00003D>) converges
  under the Cauchy criterion. That is, if we call a given term in
  (<reference|eq:1=00003D00003D>) <math|u<rsub|L>> and define the partial
  sums

  <\equation>
    S<rsub|n>=<big|sum><rsub|L=0><rsup|n>u<rsub|L><space|0.27em>,<label|eq:S_n>
  </equation>

  then the numerical series (<reference|eq:1=00003D00003D>) is convergent if
  for each <math|\<varepsilon\>\<gtr\>0> there is a number
  <math|N<around|(|\<varepsilon\>|)>> such that

  <\equation>
    <around*|\||S<rsub|m>-S<rsub|n>|\|>\<less\>\<varepsilon\><label|eq:Cauchy>
  </equation>

  for all <math|m\<gtr\>n\<gtr\>N>. If we take, say,
  <math|\<varepsilon\>=10<rsup|-21>>, we see that the difference of the ninth
  and eighth lines <math|S<rsub|10>-S<rsub|9>> in Table 1, above, fulfills
  this bound (with <math|m=10> and <math|n=9>). If we instead take
  <math|\<varepsilon\>=2\<times\>10<rsup|-46>>, we see that the difference of
  the last two lines <math|S<rsub|16>-S<rsub|15>> fulfills this tighter
  bound.

  The summed series (<reference|eq:1=00003D00003D>) was a consequence of our
  expansion of <math|J<rsub|N>*<around*|(|k*x|)>> in a Fourier-Legendre
  series after setting <math|k=1>. Including <em|k> poses no problem despite
  its appearance as the argumemt of the <math|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>
  function as well as there being a <math|k<rsup|L>> factor in the argument
  of the sum. It ends up contributing a very clean factor of
  <math|k<rsup|2*h>> to the right-hand side, below. The 43 verified summed
  series given by the present approach (with <math|0\<leq\>h\<leq\>42>) are

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|L=0><rsup|\<infty\>><space|0.17em>>|<cell|>|<cell|<space|-0.9cm><frac|<sqrt|\<pi\>>*i<rsup|L>*2<rsup|-3*L-2>*<around*|(|1+<around|(|-1|)><rsup|L>|)>*<around|(|2*L+1|)><binom|L|<frac|L|2>><binom|2*L|L><space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|<frac|L|2>-h|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<around*|[|<frac|<around*|(|<frac|1|2>-<frac|L|2>|)><rsub|<frac|L|2>-h>*<around*|(|-<frac|L|2>|)><rsub|<frac|L|2>-h>|<around*|(|<frac|1|2>-L|)><rsub|<frac|L|2>-h>>|]>=<frac|<around|(|-1|)><rsup|h>*2<rsup|-2*h>|h!\<Gamma\>*<around|(|h+1|)>>*k<rsup|2*h><space|0.27em>.<eq-number><label|eq:1/primes^n=00003D00003D>>>>>
  </eqnarray>

  To verify the final, <math|h=42>, summed series, we had to take the upper
  limit on the number of terms in the series <math|\<geq\>h+74> in order to
  obtain a percent difference between left- and right-hand sides that was
  <math|\<leq\>10<rsup|-33>> because the first <em|h> terms in the series do
  not contribute. For <math|h=0>, an upper limit on the number of terms in
  the series <math|\<geq\>h+44> was sufficient.

  We wish to provide two alternative forms for readers seeking to sum a
  series involving

  <no-indent><math|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>>
  hypergeometric functions, who may have somewhat different coefficients than
  the above: One may use the relation<cite|dlmf 5.2.6>

  <\equation>
    <around|(|-a|)><rsub|n>=<around|(|-1|)><rsup|n>*<around|(|a-n+1|)><rsub|n><label|eq:dlmf
    5.2.6>
  </equation>

  and the primary definition of the Pochhammer
  symbol<cite|http://functions.wolfram.com/06.10.02.0001.01>

  <\equation>
    <around|(|a|)><rsub|n>=<frac|\<Gamma\>*<around|(|a+n|)>|\<Gamma\><around|(|a|)>><text|/;>\<neg\><around|(|-a\<in\>\<bbb-Z\>\<wedge\>-a\<geq\>0\<wedge\>n\<in\>\<bbb-Z\>\<wedge\>n\<leq\>-a|)>
  </equation>

  to rewrite the term in square brackets in infinite sum
  (<reference|eq:1/primes^n=00003D00003D>) to give two alternative forms:

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|L=0><rsup|\<infty\>><space|0.17em>>|<cell|>|<cell|<space|-0.9cm><frac|<sqrt|\<pi\>>*i<rsup|L>*2<rsup|-3*L-2>*<around*|(|1+<around|(|-1|)><rsup|L>|)>*<around|(|2*L+1|)><binom|L|<frac|L|2>><binom|2*L|L><space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|<frac|L|2>-h|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<around*|[|<frac|<around|(|-1|)><rsup|<frac|L|2>-h>*<around*|(|h+<frac|1|2>|)><rsub|<frac|L|2>-h>*<around|(|h+1|)><rsub|<frac|L|2>-h>|<around*|(|h+<frac|L|2>+<frac|1|2>|)><rsub|<frac|L|2>-h>>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|L=0><rsup|\<infty\>><space|0.17em><frac|<sqrt|\<pi\>>*i<rsup|L>*2<rsup|-3*L-2>*<around*|(|1+<around|(|-1|)><rsup|L>|)>*<around|(|2*L+1|)><binom|L|<frac|L|2>><binom|2*L|L><space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+<frac|1|2>;<frac|L|2>+1,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|<frac|L|2>-h|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<around*|[|<frac|<around|(|-1|)><rsup|<frac|L|2>-h>*2<rsup|2*h-L>*\<Gamma\>*<around|(|L+1|)>*\<Gamma\>*<around*|(|h+<frac|L|2>+<frac|1|2>|)>|\<Gamma\>*<around|(|2*h+1|)>*\<Gamma\>*<around*|(|L+<frac|1|2>|)>>|]>=<frac|<around|(|-1|)><rsup|h>*2<rsup|-2*h>|h!\<Gamma\>*<around|(|h+1|)>>*k<rsup|2*h><space|0.27em>.<eq-number><label|eq:1/primes^n_gamma>>>>>
  </eqnarray>

  <section|Series arising from the <math|J<rsub|1><around*|(|x|)>>
  Fourier-Legendre series>

  The first 22 terms in the <math|J<rsub|1><around*|(|x|)>> Fourier-Legendre
  series (<reference|eq:Fourier-Legendre series>) are

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|1><around*|(|x|)>>|<cell|\<cong\>>|<cell|0.4635981705953810635941110039338702*P<rsub|1><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|0.02386534565840739796307209416484866*P<rsub|3><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.0003197243559720047638524757623256028*P<rsub|5><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|1.970519180666594250258062929391112*<text|E->6*<space|0.27em>P<rsub|7><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|6.987247473097807218791759410157014*<text|E->9*<space|0.27em>P<rsub|9><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|1.610500056046875027807002442953327*<text|E->11*<space|0.27em>P<rsub|11><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.607086592441628842939248193619909*<text|E->14*<space|0.27em>P<rsub|13><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|3.127311482540796882144713619567442*<text|E->17*<space|0.27em>P<rsub|15><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.891424081787050739827382596616064*<text|E->20*<space|0.27em>P<rsub|17><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|2.123664534779369199214414455720317*<text|E->23*<space|0.27em>P<rsub|19><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.269011201758673511714553707528186*<text|E->26*<space|0.27em>P<rsub|21><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|6.290201939135925763576871358738600*<text|E->30*<space|0.27em>P<rsub|23><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.628135796989325452573870774267213*<text|E->33*<space|0.27em>P<rsub|25><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|9.381575562723076109283258050667642*<text|E->37*<space|0.27em>P<rsub|27><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.894337242415984040941859061022419*<text|E->40*<space|0.27em>P<rsub|29><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|7.794444104104171684395094261174814*<text|E->44*<space|0.27em>P<rsub|31><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.848200759818170134895867052306767*<text|E->47*<space|0.27em>P<rsub|33><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|3.888249639773912225694535890329244*<text|E->51*<space|0.27em>P<rsub|35><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.306978718807123633044120058516188*<text|E->55*<space|0.27em>P<rsub|37><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|1.234022530456621571127590099647796*<text|E->58*<space|0.27em>P<rsub|39><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.883067799255568915649461884255428*<text|E->62*<space|0.27em>P<rsub|41><around|(|x|)>>>|<row|<cell|>|<cell|->|<cell|2.609122884536350861268195351045890*<text|E->66*<space|0.27em>P<rsub|43><around|(|x|)><eq-number><label|eq:Fourier-Legendre
    series-numerical_J1>>>>>
  </eqnarray>

  If we wish to check the convergence of this series at, say, the
  <math|<around*|\||\<varepsilon\>|\|>\<less\>1.3\<times\>10<rsup|-8>> level
  given by the polynomial approximation given by E. E. Allen (and reproduced
  in Abramowitz and Stegun),<cite|AS p. 370 No. 9.4.4>,

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|1><around*|(|x|)>>|<cell|\<cong\>>|<cell|<frac|x|2>-0.062499983*x<rsup|3>+0.0026041448*x<rsup|5>-0.00005424265*x<rsup|7>+6.7568816*<text|E->7*x<rsup|9>>>|<row|<cell|>|<cell|->|<cell|5.3788*<text|E->9*x<rsup|11>+2.087*<text|E->11*x<rsup|13><space|0.27em>,<eq-number><label|eq:AS
    p. 370 No. 9.4.4>>>>>
  </eqnarray>

  at the latter's limiting range of <math|x=3> (with a value of
  <math|0.339059>) , we find that truncating the series after the
  <math|P<rsub|13><around|(|x|)>> term (to get contributions through
  <math|x<rsup|13>>) is insufficient, giving one less digit of accuracy
  (<math|0.339060>), again showing that the optimization Allen must have done
  to obtain his approximation had a significant effect.

  Testing accuracy at the 15-digit level shows that we can truncating the
  series after the <math|P<rsub|25><around|(|x|)>> term in the result,
  <math|0.339058958525937>. This <math|<around*|\||\<varepsilon\>|\|>\<less\>4\<times\>10<rsup|-17>>
  is better than one would expect for doubling the number of powers from the
  <math|P<rsub|13><around|(|x|)>> truncation. In addition, the <em|range> of
  applicability of the new Legendre polynomial approximation truncated after
  <math|P<rsub|24><around|(|x|)>\<sim\>x<rsup|24>>, if one is satisfied with
  <math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-8>>, roughly
  doubles to <math|J<rsub|0><around*|(|6|)>\<cong\>-0.276684>.

  Finally, we confirm that the series through <math|P<rsub|43><around|(|x|)>>
  does give 33-digit accuracy for <math|-3\<leq\>x\<leq\>3>, with
  <math|J<rsub|1><around*|(|3|)>\<cong\>0.33905895852593645892551459720648>.
  Accuracy exceeds <math|<around*|\||\<varepsilon\>|\|>\<less\>9\<times\>10<rsup|-15>>
  over the range <math|-8\<leq\>x\<leq\>8>, with
  <math|J<rsub|1><around*|(|8|)>\<cong\>0.234636346853916>.

  We can again expand the Legendre polynomials into their constituent terms
  and gather like powers in (<reference|eq:Fourier-Legendre
  series-numerical_J1>) to give an updated polynomial approximation,

  <\eqnarray>
    <tformat|<table|<row|<cell|J<rsub|1><around*|(|x|)>>|<cell|\<cong\>>|<cell|0.5000000000000000000000000000000000000*<space|0.17em>x>>|<row|<cell|>|<cell|->|<cell|0.06250000000000000000000000000000000000*<space|0.17em>x<rsup|3>>>|<row|<cell|>|<cell|+>|<cell|0.002604166666666666666666666666666666667*<space|0.17em>x<rsup|5>>>|<row|<cell|>|<cell|->|<cell|0.00005425347222222222222222222222222222222*x<rsup|7>>>|<row|<cell|>|<cell|+>|<cell|6.781684027777777777777777777777777778*<text|E->7*<space|0.27em>x<rsup|9>>>|<row|<cell|>|<cell|->|<cell|5.651403356481481481481481481481481481*<text|E->9*<space|0.27em>x<rsup|11>>>|<row|<cell|>|<cell|+>|<cell|3.363930569334215167548500881834215168*<text|E->11*<space|0.27em>x<rsup|13>>>|<row|<cell|>|<cell|->|<cell|1.501754718452774628369866465104560343*<text|E->13*<space|0.27em>x<rsup|15>>>|<row|<cell|>|<cell|+>|<cell|5.214426105738800792950925226057501190*<text|E->16*<space|0.27em>x<rsup|17>>>|<row|<cell|>|<cell|->|<cell|1.448451696038555775819701451682639219*<text|E->18*<space|0.27em>x<rsup|19>>>|<row|<cell|>|<cell|+>|<cell|3.291935672814899490499321481096907317*<text|E->21*<space|0.27em>x<rsup|21>>>|<row|<cell|>|<cell|->|<cell|6.234726653058521762309320986925960827*<text|E->24*<space|0.27em>x<rsup|23>>>|<row|<cell|>|<cell|+>|<cell|9.991549123491220772931604145714680813*<text|E->27*<space|0.27em>x<rsup|25>>>|<row|<cell|>|<cell|->|<cell|1.372465538941101754523571998037730881*<text|E->29*<space|0.27em>x<rsup|27>>>|<row|<cell|>|<cell|+>|<cell|1.633887546358454469670919045283012953*<text|E->32*<space|0.27em>x<rsup|29>>>|<row|<cell|>|<cell|->|<cell|1.701966194123390072573874005503138493*<text|E->35*<space|0.27em>x<rsup|31>>>|<row|<cell|>|<cell|+>|<cell|1.564307163716351169645104784469796409*<text|E->38*<space|0.27em>x<rsup|33>>>|<row|<cell|>|<cell|->|<cell|1.278028728526430694154497372932840204*<text|E->41*<space|0.27em>x<rsup|35>>>|<row|<cell|>|<cell|+>|<cell|9.342315267006072325690770269976902073*<text|E->45*<space|0.27em>x<rsup|37>>>|<row|<cell|>|<cell|->|<cell|6.146260044082942319533401493405856627*<text|E->48*<space|0.27em>x<rsup|39>>>|<row|<cell|>|<cell|+>|<cell|3.658488121477941856865119936551105135*<text|E->51*<space|0.27em>x<rsup|41>>>|<row|<cell|>|<cell|->|<cell|1.979701364436115723411861437527654294*<text|E->54*<space|0.27em>x<rsup|43>>>|<row|<cell|>|<cell|=>|<cell|<frac|x|2>-<frac|x<rsup|3>|2<rsup|4>>+<frac|x<rsup|5>|2<rsup|7>*3>-<frac|x<rsup|7>|2<rsup|11>*3<rsup|2>>+<frac|x<rsup|9>|2<rsup|15>*3<rsup|2>*5>-<frac|x<rsup|11>|2<rsup|18>*3<rsup|3>*5<rsup|2>>+<frac|x<rsup|13>|2<rsup|21>*3<rsup|4>*5<rsup|2>*7>-<frac|x<rsup|15>|2<rsup|26>*3<rsup|4>*5<rsup|2>*7<rsup|2>>>>|<row|<cell|>|<cell|+>|<cell|<frac|x<rsup|17>|2<rsup|31>*3<rsup|6>*5<rsup|2>*7<rsup|2>>-<frac|x<rsup|19>|2<rsup|34>*3<rsup|8>*5<rsup|3>*7<rsup|2>>+<frac|x<rsup|21>|2<rsup|37>*3<rsup|8>*5<rsup|4>*7<rsup|2>*11>-<frac|x<rsup|23>|2<rsup|41>*3<rsup|9>*5<rsup|4>*7<rsup|2>*11<rsup|2>>>>|<row|<cell|>|<cell|+>|<cell|<frac|x<rsup|25>|2<rsup|45>*3<rsup|10>*5<rsup|4>*7<rsup|2>*11<rsup|2>*13>-<frac|x<rsup|27>|2<rsup|48>*3<rsup|10>*5<rsup|4>*7<rsup|3>*11<rsup|2>*13<rsup|2>>+<frac|x<rsup|29>|2<rsup|51>*3<rsup|11>*5<rsup|5>*7<rsup|4>*11<rsup|2>*13<rsup|2>>-<frac|x<rsup|31>|2<rsup|57>*3<rsup|12>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>>>>|<row|<cell|>|<cell|+>|<cell|<frac|x<rsup|33>|2<rsup|63>*3<rsup|12>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17>-<frac|x<rsup|35>|2<rsup|66>*3<rsup|14>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>>+<frac|x<rsup|37>|2<rsup|69>*3<rsup|16>*5<rsup|6>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19><space|0.27em>,<eq-number><label|eq:J1series>>>|<row|<cell|>|<cell|->|<cell|<frac|x<rsup|39>|2<rsup|73>*3<rsup|16>*5<rsup|7>*7<rsup|4>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19<rsup|2>>+<frac|x<rsup|41>|2<rsup|77>*3<rsup|17>*5<rsup|8>*7<rsup|5>*11<rsup|2>*13<rsup|2>*17<rsup|2>*19<rsup|2>>-<frac|x<rsup|43>|2<rsup|80>*3<rsup|18>*5<rsup|8>*7<rsup|6>*11<rsup|3>*13<rsup|2>*17<rsup|2>*19<rsup|2>>>>>>
  </eqnarray>

  with the latter form an integer-power realization of first 22 terms of the
  well-known series representation<cite|GR5 p. 970 No. 8.440>. This time all
  terms in the first half were truncated to the 37-digit precision displayed
  therein.

  The truncated power series gives <math|J<rsub|1><around*|(|3|)>\<cong\>0.339058958525936458925514597206478894>,
  which matches <em|Mathematica>'s BesselJ[1,3]=<math|0.3390589585259364589255145972064788970>
  (when set to 37-digit precision) within an error of
  <math|<around*|\||\<varepsilon\>|\|>\<less\>3\<times\>10<rsup|-36>>, as
  does the inverse prime version

  <no-indent><math|J<rsub|1><around*|(|3|)>\<cong\><frac|23266944578863553712347684324898325104584007|68622120117447770997443712389847449600000000>=<with|math-level|1|0.3390589585259364589255145972064788941>>.

  The Legendre series, via the above development , gives us another set of
  infinite series (of which we have confirmed <math|0\<leq\>h\<leq\>43>),

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|L=1><rsup|\<infty\>><space|0.17em>>|<cell|>|<cell|<space|-0.9cm><frac|<sqrt|\<pi\>>*i<rsup|L-1>*<around*|(|1+<around|(|-1|)><rsup|L+1>|)>*<around|(|2*L+1|)>*2<rsup|-3*L-2><binom|L|<frac|L-1|2>><binom|2*L|L><around|(|-1|)><rsup|-h+<frac|L|2>-<frac|1|2>>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|-h+<frac|L|2>-<frac|1|2>|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+1;<frac|L|2>+<frac|3|2>,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)><around*|[|<frac|<around*|(|<frac|1|2>-<frac|L|2>|)><rsub|<frac|L-1|2>-h>*<around*|(|-<frac|L|2>|)><rsub|<frac|L-1|2>-h>|<around*|(|<frac|1|2>-L|)><rsub|<frac|L-1|2>-h>>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|L=1><rsup|\<infty\>><space|0.17em><rsup|<around|(|2|)>><frac|<sqrt|\<pi\>>*i<rsup|L-1>*<around*|(|1+<around|(|-1|)><rsup|L+1>|)>*<around|(|2*L+1|)>*2<rsup|-3*L-2><binom|L|<frac|L-1|2>><binom|2*L|L>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|-h+<frac|L|2>-<frac|1|2>|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+1;<frac|L|2>+<frac|3|2>,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)><around*|[|<around|(|-1|)><rsup|-h+<frac|L|2>-<frac|1|2>><frac|<around|(|h+1|)><rsub|-h+<frac|L|2>-<frac|1|2>>*<around*|(|h+<frac|3|2>|)><rsub|-h+<frac|L|2>-<frac|1|2>>|<around*|(|h+<frac|L|2>+1|)><rsub|-h+<frac|L|2>-<frac|1|2>>>|]>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|L=1><rsup|\<infty\>><space|0.17em><rsup|<around|(|2|)>><frac|<sqrt|\<pi\>>*i<rsup|L-1>*<around*|(|1+<around|(|-1|)><rsup|L+1>|)>*<around|(|2*L+1|)>*2<rsup|-3*L-2><binom|L|<frac|L-1|2>><binom|2*L|L>|\<Gamma\>*<around*|(|<frac|1|2>*<around|(|2*L+3|)>|)>*<around*|(|-h+<frac|L|2>-<frac|1|2>|)>!>*k<rsup|L>>>|<row|<cell|>|<cell|\<times\>>|<cell|<space|0.17em><rsub|1>F<rsub|2><around*|(|<frac|L|2>+1;<frac|L|2>+<frac|3|2>,L+<frac|3|2>;-<frac|k<rsup|2>|4>|)><around*|[|<around|(|-1|)><rsup|-h+<frac|L|2>-<frac|1|2>><frac|2<rsup|2*h-L+1>*\<Gamma\>*<around|(|L+1|)>*\<Gamma\>*<around*|(|h+<frac|L|2>+1|)>|\<Gamma\>*<around|(|2*h+2|)>*\<Gamma\>*<around*|(|L+<frac|1|2>|)>>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around|(|-1|)><rsup|h>*2<rsup|-2*h-1>|h!\<Gamma\>*<around|(|h+2|)>>*k<rsup|2*h+1><space|0.27em>.<eq-number><label|eq:J1summedtoprimes>>>>>
  </eqnarray>

  To verify the final summed series, with <math|h=43>, we had to take the
  upper limit on the number of terms in the series <math|\<geq\>h+78> in
  order to obtain a percent difference between left- and right-hand sides
  that was <math|\<leq\>10<rsup|-33>> because the first <em|h> terms in the
  series do not contribute. For <math|h=0>, an upper limit on the number of
  terms in the series <math|\<geq\>h+45> was sufficient.

  <section|Series arising from the <math|I<rsub|n><around*|(|x|)>>
  Fourier-Legendre series>

  Because the modified Bessel functions of the first kind
  <math|I<rsub|N>*<around*|(|k*x|)>> are related to the ordinary Bessel
  functions by the relation <cite|GR5 p. 961 No. 8.406.3>

  <\equation>
    I<rsub|n><around|(|z|)>=i<rsup|-n>*J<rsub|n>*<around|(|i*z|)><space|0.27em>,<label|eq:I_from_J>
  </equation>

  we merely need to multiply by <math|i<rsup|-n>> and set <math|k=i> in
  (<reference|eq:a_L_as_2F3>) to obtain the <math|I<rsub|0><around*|(|x|)>>
  Fourier-Legendre series, the first 24 terms of which are

  <\eqnarray>
    <tformat|<table|<row|<cell|I<rsub|0><around*|(|x|)>>|<cell|\<cong\>>|<cell|1.086521097023589815837941923492506*P<rsub|0><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.1758046819215242662605951354261250*P<rsub|2><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.003709009244052882533923838165527033*P<rsub|4><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.00003095105270992432198613744608777602*<space|0.22em>P<rsub|6><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.381259734719773538320052305224506*<text|E->7*<space|0.22em>P<rsub|8><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.834312601086373005317788906125573*<text|E->10*<space|0.22em>P<rsub|10><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.257172450096213936720667660411978*<text|E->13*<space|0.27em>P<rsub|12><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|9.962746978836018020128433111635975*<text|E->16*<space|0.27em>P<rsub|14><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.037251346110052630963705477046736*<text|E->18*<space|0.27em>P<rsub|16><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|8.470496863240475339343499321604116*<text|E->22*<space|0.27em>P<rsub|18><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|5.570541399858852219278260483523687*<text|E->25*<space|0.27em>P<rsub|20><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.013347383234528850224689041823201*<text|E->28*<space|0.27em>P<rsub|22><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.364338005353527272638479093175249*<text|E->31*<space|0.27em>P<rsub|24><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|5.246088467162281648944660989359565*<text|E->35*<space|0.27em>P<rsub|26><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.734417052236546525979562610169336*<text|E->38*<space|0.27em>P<rsub|28><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|4.982929889631203560686967762401821*<text|E->42*<space|0.27em>P<rsub|30><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.255546430559877621587201790700357*<text|E->45*<space|0.27em>P<rsub|32><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.797096596401706413444068821508193*<text|E->49*P<rsub|34><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|5.548955677049963483909673845071489*<text|E->53*<space|0.27em>P<rsub|36><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|9.865206225205083247212985096531573*<text|E->57*<space|0.27em>P<rsub|38><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.580763691652306983099443761944673*<text|E->60*<space|0.27em>P<rsub|40><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.294688331479205281600814719914093*<text|E->64*<space|0.27em>P<rsub|42><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.031771495580703895127109933386607*<text|E->68*<space|0.27em>P<rsub|44><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.661200772680598752990852186025167*<text|E->72*<space|0.27em>P<rsub|46><around|(|x|)><space|0.27em>.<eq-number><label|eq:Fourier-Legendre
    seriesI0>>>>>
  </eqnarray>

  If we wish to check the convergence of this series at, say, the
  <math|<around*|\||\<varepsilon\>|\|>\<less\>1.6\<times\>10<rsup|-7>> level
  of the polynomial approximation given by E. E. Allen (and reproduced in
  Abramowitz and Stegun) <cite|AS p. 378 No. 9.8.1>,

  <\eqnarray>
    <tformat|<table|<row|<cell|I<rsub|0><around*|(|x|)>>|<cell|\<cong\>>|<cell|1+3.5156229<around*|(|<frac|x|3.75>|)><rsup|2>+3.0899424<around*|(|<frac|x|3.75>|)><rsup|4>+1.2067492<around*|(|<frac|x|3.75>|)><rsup|6>>>|<row|<cell|>|<cell|+>|<cell|0.2659732<around*|(|<frac|x|3.75>|)><rsup|8>+0.0360768<around*|(|<frac|x|3.75>|)><rsup|10>+0.0045813<around*|(|<frac|x|3.75>|)><rsup|12><eq-number><label|eq:AS
    p. 378 No. 9.8.1>>>|<row|<cell|>|<cell|=>|<cell|1+0.25*<space|0.22em>x<rsup|2>+0.0156252*<space|0.22em>x<rsup|4>+0.00043394*<space|0.22em>x<rsup|6>+6.801234*<text|E->6*<space|0.27em>x<rsup|8>+<text|6.56017E-8<space|0.27em>
    >x<rsup|10>>>|<row|<cell|>|<cell|+>|<cell|5.9240*<text|E->10*<space|0.27em>x<rsup|12>>>>>
  </eqnarray>

  <no-indent>at the latter's limiting range of <math|x=3.75> (with a value of
  <math|9.11895>), we find that truncating the series after the
  <math|P<rsub|12><around|(|x|)>> term (to get contributions through
  <math|x<rsup|12>>) is insufficient, giving two fewer digits of accuracy
  (<math|9.1187>). This shows that the optimization Allen must have done to
  obtain his approximation has a significant effect.

  Testing accuracy at the 15-digit level shows that we can truncating the
  series after the <math|P<rsub|28><around|(|x|)>> term in the result,
  <math|9.1189458608445666>, with <math|<around*|\||\<varepsilon\>|\|>\<less\>5\<times\>10<rsup|-17>>.
  In addition, the <em|range> of applicability of the new Legendre
  approximation truncated after <math|P<rsub|24><around|(|x|)>\<sim\>x<rsup|24>>,
  if one is satisfied with <math|<around*|\||\<varepsilon\>|\|>\<less\>1.6\<times\>10<rsup|-7>>
  , roughly doubles to <math|I<rsub|0><around*|(|7.5|)>\<cong\>268.1613>.

  Finally, in our quality checking step, we found that if we imported a
  33-digit version of (<reference|eq:Fourier-Legendre seriesI0>) back into
  the software we had been using to generate it, <em|Mathematica> <em|7>, we
  only obtained a result accurate to<math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-32>>,
  but if we imported the 34-digit version version actually displayed in
  (<reference|eq:Fourier-Legendre seriesI0>), we obtained a result accurate
  to <math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-34>> over
  the range <math|-3.75\<leq\>x\<leq\>3.75>, with
  <math|I<rsub|0><around*|(|3.75|)>\<cong\>9.118945860844566690670997606599715>.
  Accuracy exceeds <math|<around*|\||\<varepsilon\>|\|>\<less\>6\<times\>10<rsup|-14>>
  over the range <math|-8\<leq\>x\<leq\>8>, with
  <math|I<rsub|0><around*|(|8|)>\<cong\>427.5641157218>.

  If we turn our attention to the latter form of the polynomial approximation
  (<reference|eq:AS p. 378 No. 9.8.1>), and compare it with the
  <math|J<rsub|0>> polynomial approximation (<reference|eq:AS p. 369 No.
  9.4.1^x>) one sees that the <math|I<rsub|0>> version is approximately the
  <math|J<rsub|0>> version with all of the negative signs reversed. That the
  correspondence is not exact for the higher-power terms likely is a result
  of the optimization scheme in the two cases having slightly different
  ranges of validity.

  Indeed, if we apply (<reference|eq:I_from_J>) to (<reference|eq:GR5 p. 970
  No. 8.440>), each numerator becomes <math|i<rsup|\<nu\>>*<around|(|-1|)><rsup|k>*i<rsup|2*k+\<nu\>><around*|(|<frac|x|2>|)><rsup|2*k+\<nu\>>=<around|(|-1|)><rsup|\<nu\>><around*|(|<frac|x|2>|)><rsup|2*k+\<nu\>>>which
  indeed gives the series <cite|GR5 p. 971 No. 8.445>

  <\equation>
    I<rsub|\<nu\>><around*|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around*|(|<frac|x|2>|)><rsup|2*k+\<nu\>>|k!\<Gamma\>*<around|(|k+\<nu\>+1|)>><space|0.27em>.<label|eq:GR5
    p. 971 No. 8.445>
  </equation>

  We, thus, need not display our 24-term polynomial approximation for
  <math|I<rsub|0>> apart from the two terms unneeded for the the
  <math|J<rsub|0>> version that are necessary for <math|I<rsub|0>>:

  <\eqnarray>
    <tformat|<table|<row|<cell|...>|<cell|+>|<cell|4.4993212828093539168451396307446688497*<text|E->56*x<rsup|44>>>|<row|<cell|>|<cell|+>|<cell|2.1263333094562164068266255343783879252*<text|E->59*x<rsup|46><space|0.27em>.<eq-number><label|eq:x^44,46>>>>>
  </eqnarray>

  <no-indent>One obtains the other terms by simply negating the negative
  signs in (<reference|eq:poly_approx_48_digit>). This is not true of
  (<reference|eq:Fourier-Legendre seriesI0>) because the arguments of the
  Legendre polynomials do not undergo <math|x\<rightarrow\>i*x> since they
  derive from the definition of the Fourier-Legendre series,
  (<reference|eq:Fourier-Legendre series>). The <em|k>-dependence is entirely
  within the coefficients <math|a<rsub|L*N><around*|(|k|)>>.

  Furthermore, the <math|I<rsub|0>> Legendre series expansion leads to no new
  set of summed series since these would simply be
  (<reference|eq:1/primes^n=00003D00003D>) with <math|k=i*\<kappa\>>.

  Although (<reference|eq:Fourier-Legendre series>) allows one to easily
  compute the Fourier-Legendre series for any <math|J<rsub|n><around*|(|x|)>>
  or <math|I<rsub|n><around*|(|x|)>>, to enable readers to find these series
  for higher indices by recursion <cite|GR5 p. 979 No. 8.471.1 \ p. 981 No.
  8.486.1> we give the first 24 terms in the <math|I<rsub|1><around*|(|x|)>>
  Fourier-Legendre series to complete the required pair:

  <\eqnarray>
    <tformat|<table|<row|<cell|I<rsub|1><around*|(|x|)>>|<cell|\<cong\>>|<cell|0.5386343421852555592809081051666336*<space|0.17em>P<rsub|1><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.02618069164825977449795296407260333*<space|0.17em>P<rsub|3><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|0.0003419851912550806236210094361507344*<space|0.17em>P<rsub|5><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.077651971699656963860267070724864*<space|0.17em><text|E->6*<space|0.27em>P<rsub|7><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.299001518662431414905576324932877*<space|0.17em><text|E->9*<space|0.27em>P<rsub|9><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.671443482954853739162527767203215*<space|0.17em><text|E->11*<space|0.27em>P<rsub|11><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.692744551459235232734936666452704*<space|0.17em><text|E->14*<space|0.27em>P<rsub|13><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.218106754771162455853759838545282*<space|0.17em><text|E->17*<space|0.27em>P<rsub|15><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.966624646773403074824196435937542*<space|0.17em><text|E->20*<space|0.27em>P<rsub|17><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.173686883720901031568436047655748*<space|0.17em><text|E->23*<space|0.27em>P<rsub|19><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.296326265789554875546711294998344*<space|0.17em><text|E->26*<space|0.27em>P<rsub|21><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|6.414855102151415733596588296578833*<space|0.17em><text|E->30*<space|0.27em>P<rsub|23><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.676389925142875786863074285387196*<space|0.17em><text|E->33*<space|0.27em>P<rsub|25><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|9.542035089444710700263714658817980*<space|0.17em><text|E->37*<space|0.27em>P<rsub|27><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.940669572337884276201779460203862*<space|0.17em><text|E->40*<space|0.27em>P<rsub|29><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.911705033029330504663434638574930*<space|0.17em><text|E->44*<space|0.27em>P<rsub|31><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.874426565726980007813411585706840*<space|0.17em><text|E->47*<space|0.27em>P<rsub|33><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.940459072597980181771454632976250*<space|0.17em><text|E->51*<space|0.27em>P<rsub|35><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|7.400090413796917559009186360838868*<space|0.17em><text|E->55*<space|0.27em>P<rsub|37><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.248984620737396858084740490332061*<space|0.17em><text|E->58*<space|0.27em>P<rsub|39><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|1.904842982553207494042180613785837*<space|0.17em><text|E->62*<space|0.27em>P<rsub|41><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|2.637959760920312924684635466402215*<space|0.17em><text|E->66*<space|0.27em>P<rsub|43><around|(|x|)>>>|<row|<cell|>|<cell|+>|<cell|3.332061910821697596383220274010501*<space|0.17em><text|E->70*<space|0.27em>P<rsub|45><around|(|x|)><space|0.22em>.<eq-number><label|eq:Fourier-Legendre
    series-I1>>>>>
  </eqnarray>

  If we wish to check the convergence of this series at, say, the
  <math|<around*|\||\<varepsilon\>|\|>\<less\>8\<times\>10<rsup|-9>> level
  given by the polynomial approximation given by E. E. Allen (and reproduced
  in Abramowitz and Stegun) <cite|AS p. 378 No. 9.8.3>,

  <\eqnarray>
    <tformat|<table|<row|<cell|I<rsub|1><around*|(|x|)>>|<cell|\<cong\>>|<cell|<frac|x|2>+0.0625*x<rsup|3>+0.00260419*x<rsup|5>+0.0000542445*x<rsup|7>+6.79868*<text|E->7*x<rsup|9>+5.48303*<text|E->9*x<rsup|11>>>|<row|<cell|>|<cell|+>|<cell|4.191<text|E>-11*x<rsup|13><space|0.27em>,<eq-number><label|eq:AS
    p. 378 No. 9.8.3>>>>>
  </eqnarray>

  <no-indent>at the latter's limiting range of <math|x=3.75> (with a value of
  <math|7.78002>), we find that truncating the series after the
  <math|P<rsub|13><around|(|x|)>> term (to get contributions through
  <math|x<rsup|13>>) is insufficient, giving three fewer digits of accuracy
  (<math|7.77996>). This again shows that the optimization Allen must have
  done to obtain his approximation has a significant effect.

  Testing accuracy at the 15-digit level shows that we can truncating the
  series after the <math|P<rsub|27><around|(|x|)>> term in the result,
  <math|7.780015229824415>, with <math|<around*|\||\<varepsilon\>|\|>\<less\>4\<times\>10<rsup|-16>>.
  In addition, the <em|range> of applicability of the new Legendre
  approximation truncated after <math|P<rsub|27><around|(|x|)>\<sim\>x<rsup|27>>,
  if one is satisfied with <math|<around*|\||\<varepsilon\>|\|>\<less\>5\<times\>10<rsup|-9>>
  , roughly doubles to <math|I<rsub|1><around*|(|6.5|)>\<cong\>97.735011>.

  Finally, in our quality checking step, we found that if we imported a
  33-digit version of (<reference|eq:Fourier-Legendre series-I1>) back into
  the software we had been using to generate it, <em|Mathematica> <em|7>, we
  only obtained a result accurate to<math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-32>>,
  but if we imported the 34-digit version actually displayed in
  (<reference|eq:Fourier-Legendre seriesI0>), we obtained a result accurate
  to <math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-34>> over
  the range <math|-3.75\<leq\>x\<leq\>3.75>, with
  <math|I<rsub|1><around*|(|3.75|)>\<cong\>7.780015229824415864988676277516113>.
  Accuracy exceeds <math|<around*|\||\<varepsilon\>|\|>\<less\>1\<times\>10<rsup|-18>>
  over the range <math|-8\<leq\>x\<leq\>8>, with
  <math|I<rsub|1><around*|(|8|)>\<cong\>399.873136782560098>.

  Because the above-noted correspondence between the power-series versions of
  <math|J<rsub|0><around|(|x|)>> and <math|I<rsub|0><around|(|x|)>>
  (reversing all of the negative signs in the former to achieve the latter)
  applies as well to <math|J<rsub|1><around|(|x|)>> and
  <math|I<rsub|1><around|(|x|)>>, there is no need to display the
  power-series version of the latter except for the additional term,

  <\equation>
    ...+9.781133223498595471402477458140584456*<text|E>58*x<rsup|45><space|0.27em>.<label|eq:x^45>
  </equation>

  <section|Conclusions>

  We have found the Fourier-Legendre series of modified Bessel functions of
  the first kind <math|I<rsub|N>*<around*|(|k*x|)>> based on that found by
  Keating <cite|KeatingPhD> for the Bessel functions of the first kind
  <math|J<rsub|N>*<around*|(|k*x|)>>, and show that Keating's coefficients,
  comprised of infinite-series, can be reduced to
  <math|<space|0.17em><rsub|2>F<rsub|3>> functions. For <math|N=0> and
  <math|1> we give numerical values for those coefficients up through
  <math|x<rsup|46>> with 33-digit accuracy.

  Each of these infinite Fourier-Legendre series may be decomposed into an
  infinite sum of infinite series, by gathering like powers from the Legendre
  polynomials in each of the terms in the Fourier-Legendre series. We show
  that each of these infinite sub-series converges to values that are inverse
  powers of the first eight primes <math|1/<around*|(|2<rsup|i>*3<rsup|j>*5<rsup|k>*7<rsup|l>*11<rsup|m>*13<rsup|n>*17<rsup|o>*19<rsup|p>|)>>
  multiplying powers of the coefficient <math|k>. Given the relative paucity
  of infinite series whose values are known (e.g., two dozen pages in
  Gradshteyn and Ryzhik compared to their 900 pages of known integrals),
  having even one such to add to the total has the potential to be of use to
  future researchers. We add an infinite set of infinite series of
  <math|<space|0.17em><rsub|2>F<rsub|3>> functions whose values are now
  known.

  <section*|Appendix>

  The code for calculating these series is given in Fortran, below, because
  it can be used as such or called in C and C++ programs and one wishes to
  avoid duplication in this paper. In Fortran 90, quadruple precision is
  instituted as in the following calculation of <math|\<pi\>>:

  <\verbatim>
    \;

    ! -----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----

    ! In gcc46, and later, one compiles the program with

    ! $ gfortran precisiontest.f90 -o precisiontest90

    ! and runs it with

    ! $ ./precisiontest90

    !

    ! The ouptput is

    ! \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 123456789112345678921234567893123

    ! \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 4
    \ \ \ \ \ \ 8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ 16

    ! s_r_k(6,37) \ \ \ = \ \ \ 3.1415927

    ! s_r_k(15,307) \ = \ \ \ 3.1415926535897931

    ! s_r_k(33,4931) = \ \ \ 3.1415926535897932384626433832795028

    !

    ! -----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----

    module precisionkinds! \ \ use ISO_FORTRAN_ENV

    \ \ \ implicit none

    \ \ \ private

    \ \ \ public isp, idp, iqp

    \ \ \ integer, parameter :: isp = selected_real_kind(6, 37)

    \ \ \ integer, parameter :: idp = selected_real_kind(15, 307)

    \ \ \ integer, parameter :: iqp = selected_real_kind(33, 4931)

    end module precisionkinds

    !

    program precisiontest

    \ \ \ use precisionkinds

    \ \ \ implicit none

    \ \ \ real (isp), parameter :: pi1 = 4*atan (1.0_isp)

    \ \ \ real (idp), parameter :: pi2 = 4*atan (1.0_idp)

    \ \ \ real (iqp), parameter :: pi4 = 4*atan (1.0_iqp)

    \ \ \ \ \ \ write (*,*) ' \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 123456789112345678921234567893123'

    \ \ \ \ \ \ write (*,*) ' \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 4',
    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ &

    \ \ \ \ \ \ ' \ \ \ \ \ \ 8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ 16'

    \ \ \ \ \ \ \ \ \ \ write (*,*) 's_r_k(6,37) \ \ \ = ',pi1

    \ \ \ \ \ \ \ \ \ \ write (*,*) 's_r_k(15,307) \ = ',pi2

    \ \ \ \ \ \ \ \ \ \ write (*,*) 's_r_k(33,4931) = ',pi4

    end program precisiontest

    \;
  </verbatim>

  For readers who are modifying legacy programs, the Fortran 77 equivalent
  lines are (two additional compilers are referenced: xlf for PowerPC and
  ifort for Intel Macintosh computers):

  <\verbatim>
    \;

    C $ xlf -o precisiontest77g precisiontest77g.f

    C $ ./precisiontest77g

    C $ ifort precisiontest77g.f -o precisiontest77g_intel

    C

    C \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 4 \ \ \ \ \ \ 8
    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 16

    C intel gives

    Cpi16srk31 \ \ \ = \ \ 3.14159265358979323846264338327950

    C

    C gfortran gives

    C \ \ \ \ \ \ \ \ \ \ \ \ = \ \ 3.14159265358979323846264338327950280

    C xlf gives

    C pi16Q0 \ \ \ \ \ = \ \ 3.1415926535897932384626433832795059

    C pi16srk20 \ \ = \ \ 3.1415926535897932384626433832795059

    C pi16srk31 \ \ = \ \ 3.1415926535897932384626433832795059

    C pi16iesrk31 = \ \ 3.1415926535897932384626433832795059

    C

    C"from Bailey's DQFUN:A thread-safe double-quad precision package

    C \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 3.141592653589793238462643383279502884197169...

    C

    \ \ \ \ \ \ \ \ \ \ real*16 pi16Q0,pi16srk20,pi16iesrk31,pi16srk31

    C

    \ \ \ \ \ \ \ \ \ \ pi16Q0 = 4*atan (1.0Q0)

    \ \ \ \ \ \ \ \ \ \ pi16srk20 = 4*atan
    (Real(1.0,SELECTED_REAL_KIND(20,140)))

    \ \ \ \ \ \ \ \ \ \ pi16srk31 = 4*atan (Real(1.0,SELECTED_REAL_KIND(31)))

    \ \ \ \ \ \ \ \ \ \ pi16iesrk31 = 4*atan
    (Real(1.0,IEEE_SELECTED_REAL_KIND(31)))

    \;
  </verbatim>

  In C and C++, one specifies _Float128. Mathematica and Maple input may be
  generated from the following by replacing the Fortran power operator \P**\Q
  by \P<textasciicircum|>\Q and deleting the continuation indicators \P-\Q in
  column 6.

  For (<reference|eq:Fourier-Legendre series-numerical>) the code is

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ J0(x) = 0.91973041008976023931442119408062*P(0,x) -

    \ \ \ \ \ - \ 0.1579420586258518875737139671443637*P(2,x) +

    \ \ \ \ \ - \ 0.003438400944601109232996887872072915*P(4,x) -

    \ \ \ \ \ - \ 0.00002919721848828729693660590986125663*P(6,x) +

    \ \ \ \ \ - \ 1.31735695244778097765561656314328e-7*P(8,x) -

    \ \ \ \ \ - \ 3.684500844208203027173771096058866e-10*P(10,x) +

    \ \ \ \ \ - \ 7.011830032993845928208803328211447e-13*P(12,x) -

    \ \ \ \ \ - \ 9.665964369858912263671995372753346e-16*P(14,x) +

    \ \ \ \ \ - \ 1.009636276824546446525342170924936e-18*P(16,x) -

    \ \ \ \ \ - \ 8.266656955927637858991972584174117e-22*P(18,x) +

    \ \ \ \ \ - \ 5.448244867762758725890082837839430e-25*P(20,x) -

    \ \ \ \ \ - \ 2.952527182137354751675774606663400e-28*P(22,x) +

    \ \ \ \ \ - \ 1.338856158858534469080898670096200e-31*P(24,x) -

    \ \ \ \ \ - \ 5.154913186088512926193234837816582e-35*P(26,x) +

    \ \ \ \ \ - \ 1.706231577038503450138564028467634e-38*P(28,x) -

    \ \ \ \ \ - \ 4.906893556427796857473097979568289e-42*P(30,x) +

    \ \ \ \ \ - \ 1.237489200717479383020539576221293e-45*P(32,x) -

    \ \ \ \ \ - \ 2.759056237537871868604555688548364e-49*P(34,x) +

    \ \ \ \ \ - \ 5.477382207172712629199714648396409e-53*P(36,x) -

    \ \ \ \ \ - \ 9.744200345578852550688946057050674e-57*P(38,x) +

    \ \ \ \ \ - \ 1.562280711659504489828025148995770e-60*P(40,x) -

    \ \ \ \ \ - \ 2.269056283827394368836057470594599e-64*P(42,x)

    \;
  </verbatim>

  and the corresponding expressions for both forms of
  (<reference|eq:poly_approx_48_digit>) are

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ J0(x) = 1. - 0.25*x**2 + 0.015625*x**4 -

    \ \ \ \ \ - \ 0.0004340277777777777777777777777777777778*x**6 +

    \ \ \ \ \ - \ 6.781684027777777777777777777777777778e-6*x**8 -

    \ \ \ \ \ - \ 6.781684027777777777777777777777777778e-8*x**10 +

    \ \ \ \ \ - \ 4.709502797067901234567901234567901235e-10*x**12 -

    \ \ \ \ \ - \ 2.402807549524439405391786344167296548e-12*x**14 +

    \ \ \ \ \ - \ 9.385966990329841427311665406903502142e-15*x**16 -

    \ \ \ \ \ - \ 2.896903392077111551639402903365278439e-17*x**18 +

    \ \ \ \ \ - \ 7.242258480192778879098507258413196097e-20*x**20 -

    \ \ \ \ \ - \ 1.496334396734045222954237036862230599e-22*x**22 +

    \ \ \ \ \ - \ 2.597802772107717400962217077885817011e-25*x**24 -

    \ \ \ \ \ - \ 3.842903509035084912666001594505646466e-28*x**26 +

    \ \ \ \ \ - \ 4.901662639075363409012757135849038860e-31*x**28 -

    \ \ \ \ \ - \ 5.446291821194848232236396817610043178e-34*x**30 +

    \ \ \ \ \ - \ 5.318644356635593976793356267197307791e-37*x**32 -

    \ \ \ \ \ - \ 4.600903422695150498956190542558224733e-40*x**34 +

    \ \ \ \ \ - \ 3.550079801462307483762492702591222788e-43*x**36 -

    \ \ \ \ \ - \ 2.458504017633176927813360597362342651e-46*x**38 +

    \ \ \ \ \ - \ 1.5365650110207355798833503733514641567e-49*x**40 -

    \ \ \ \ \ - \ 8.7106860035189091830121903251216788929e-53*x**42

    \;
  </verbatim>

  and (for integer arithmetic),

  <\verbatim>
    \;

    J0(x)=x^0*-x^2/(2^2)+x^4/(2^6)-x^6/(2^8*3^2)+x^8/(2^14*3^2)

    -x^10/(2^16*3^2*5^2)+x^12/(2^20*3^4*5^2)-x^14/(2^22*3^4*5^2*7^2)

    +x^16/(2^30*3^4*5^2*7^2)-x^18/(2^32*3^8*5^2*7^2)+x^20/(2^36*3^8*5^4*7^2)

    -x^22/(2^38*3^8*5^4*7^2*11^2)+x^24/(2^44*3^10*5^4*7^2*11^2)

    -x^26/(2^46*3^10*5^4*7^2*11^2*13^2)+x^28/(2^50*3^10*5^4*7^4*11^2*13^2)

    -x^30/(2^52*3^12*5^6*7^4*11^2*13^2)+x^32/(2^62*3^12*5^6*7^4*11^2*13^2)

    -x^34/(2^64*3^12*5^6*7^4*11^2*13^2*17^2)

    +x^36/(2^68*3^16*5^6*7^4*11^2*13^2*17^2)

    -x^38/(2^70*3^16*5^6*7^4*11^2*13^2*17^2*19^2)

    +x^40/(2^76*3^16*5^8*7^4*11^2*13^2*17^2*19^2)

    -x^42/(2^78*3^18*5^8*7^6*11^2*13^2*17^2*19^2)

    \;
  </verbatim>

  For (<reference|eq:Fourier-Legendre series-numerical_J1>)

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ J1(x) = 0.4635981705953810635941110039338702*P(1,x) -

    \ \ \ \ \ - \ 0.02386534565840739796307209416484866*P(3,x) +

    \ \ \ \ \ - \ 0.0003197243559720047638524757623256028*P(5,x) -

    \ \ \ \ \ - \ 1.970519180666594250258062929391112e-6*P(7,x) +

    \ \ \ \ \ - \ 6.987247473097807218791759410157014e-9*P(9,x) -

    \ \ \ \ \ - \ 1.610500056046875027807002442953327e-11*P(11,x) +

    \ \ \ \ \ - \ 2.607086592441628842939248193619909e-14*P(13,x) -

    \ \ \ \ \ - \ 3.127311482540796882144713619567442e-17*P(15,x) +

    \ \ \ \ \ - \ 2.891424081787050739827382596616064e-20*P(17,x) -

    \ \ \ \ \ - \ 2.123664534779369199214414455720317e-23*P(19,x) +

    \ \ \ \ \ - \ 1.269011201758673511714553707528186e-26*P(21,x) -

    \ \ \ \ \ - \ 6.290201939135925763576871358738600e-30*P(23,x) +

    \ \ \ \ \ - \ 2.628135796989325452573870774267213e-33*P(25,x) -

    \ \ \ \ \ - \ 9.381575562723076109283258050667642e-37*P(27,x) +

    \ \ \ \ \ - \ 2.894337242415984040941859061022419e-40*P(29,x) -

    \ \ \ \ \ - \ 7.794444104104171684395094261174814e-44*P(31,x) +

    \ \ \ \ \ - \ 1.848200759818170134895867052306767e-47*P(33,x) -

    \ \ \ \ \ - \ 3.888249639773912225694535890329244e-51*P(35,x) +

    \ \ \ \ \ - \ 7.306978718807123633044120058516188e-55*P(37,x) -

    \ \ \ \ \ - \ 1.234022530456621571127590099647796e-58*P(39,x) +

    \ \ \ \ \ - \ 1.883067799255568915649461884255428e-62*P(41,x) -

    \ \ \ \ \ - \ 2.609122884536350861268195351045890e-66*P(43,x)

    \;
  </verbatim>

  and the corresponding expressions for both forms of
  (<reference|eq:J1series>) are

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ J1(x)= 0.5*x - 0.0625*x**3 +

    \ \ \ \ \ - \ 0.002604166666666666666666666666666666667*x**5 -

    \ \ \ \ \ - \ 0.00005425347222222222222222222222222222222*x**7 +

    \ \ \ \ \ - \ 6.781684027777777777777777777777777778e-7*x**9 -

    \ \ \ \ \ - \ 5.651403356481481481481481481481481481e-9*x**11 +

    \ \ \ \ \ - \ 3.363930569334215167548500881834215168e-11*x**13 -

    \ \ \ \ \ - \ 1.501754718452774628369866465104560343e-13*x**15 +

    \ \ \ \ \ - \ 5.214426105738800792950925226057501190e-16*x**17 -

    \ \ \ \ \ - \ 1.448451696038555775819701451682639219e-18*x**19 +

    \ \ \ \ \ - \ 3.291935672814899490499321481096907317e-21*x**21 -

    \ \ \ \ \ - \ 6.234726653058521762309320986925960827e-24*x**23 +

    \ \ \ \ \ - \ 9.991549123491220772931604145714680813e-27*x**25 -

    \ \ \ \ \ - \ 1.372465538941101754523571998037730881e-29*x**27 +

    \ \ \ \ \ - \ 1.633887546358454469670919045283012953e-32*x**29 -

    \ \ \ \ \ - \ 1.701966194123390072573874005503138493e-35*x**31 +

    \ \ \ \ \ - \ 1.564307163716351169645104784469796409e-38*x**33 -

    \ \ \ \ \ - \ 1.278028728526430694154497372932840204e-41*x**35 +

    \ \ \ \ \ - \ 9.342315267006072325690770269976902073e-45*x**37 -

    \ \ \ \ \ - \ 6.146260044082942319533401493405856627e-48*x**39 +

    \ \ \ \ \ - \ 3.658488121477941856865119936551105135e-51*x**41 -

    \ \ \ \ \ - \ 1.979701364436115723411861437527654294e-54*x**43

    \;
  </verbatim>

  and (for integer arithmetic),

  <\verbatim>
    \;

    J1(x)=x^2/2-x^3/(2^4)+x^5/(2^7*3*-x^7/(2^11*3^2)+x^9/(2^15*3^2*5)

    -x^11/(2^18*3^3*5^2)+x^13/(2^21*3^4*5^2*7)-x^15/(2^26*3^4*5^2*7^2)

    +x^17/(2^31*3^6*5^2*7^2)-x^19/(2^34*3^8*5^3*7^2)+x^21/(2^37*3^8*5^4*7^2*11)

    -x^23/(2^41*3^9*5^4*7^2*11^2)+x^25/(2^45*3^10*5^4*7^2*11^2*13)

    -x^27/(2^48*3^10*5^4*7^3*11^2*13^2)+x^29/(2^51*3^11*5^5*7^4*11^2*13^2)

    -x^31/(2^57*3^12*5^6*7^4*11^2*13^2)+x^33/(2^63*3^12*5^6*7^4*11^2*13^2*17)

    -x^35/(2^66*3^14*5^6*7^4*11^2*13^2*17^2)

    +x^37/(2^69*3^16*5^6*7^4*11^2*13^2*17^2*19)

    -x^39/(2^73*3^16*5^7*7^4*11^2*13^2*17^2*19^2)

    +x^41/(2^77*3^17*5^8*7^5*11^2*13^2*17^2*19^2)

    -x^43/(2^80*3^18*5^8*7^6*11^3*13^2*17^2*19^2)

    \;
  </verbatim>

  For (<reference|eq:Fourier-Legendre seriesI0>) we have

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ \ I(0,x) = 1.086521097023589815837941923492506*P(0,x) +

    \ \ \ \ \ - \ 0.1758046819215242662605951354261250*P(2,x) +

    \ \ \ \ \ - \ 0.003709009244052882533923838165527033*P(4,x) +

    \ \ \ \ \ - \ 0.00003095105270992432198613744608777602*P(6,x) +

    \ \ \ \ \ - \ 1.381259734719773538320052305224506e-7*P(8,x) +

    \ \ \ \ \ - \ 3.834312601086373005317788906125573e-10*P(10,x) +

    \ \ \ \ \ - \ 7.257172450096213936720667660411978e-13*P(12,x) +

    \ \ \ \ \ - \ 9.962746978836018020128433111635975e-16*P(14,x) +

    \ \ \ \ \ - \ 1.037251346110052630963705477046736e-18*P(16,x) +

    \ \ \ \ \ - \ 8.470496863240475339343499321604116e-22*P(18,x) +

    \ \ \ \ \ - \ 5.5705413998588522192782604835236869e-25*P(20,x) +

    \ \ \ \ \ - \ 3.013347383234528850224689041823201e-28*P(22,x) +

    \ \ \ \ \ - \ 1.364338005353527272638479093175249e-31*P(24,x) +

    \ \ \ \ \ - \ 5.246088467162281648944660989359565e-35*P(26,x) +

    \ \ \ \ \ - \ 1.734417052236546525979562610169336e-38*P(28,x) +

    \ \ \ \ \ - \ 4.982929889631203560686967762401821e-42*P(30,x) +

    \ \ \ \ \ - \ 1.255546430559877621587201790700357e-45*P(32,x) +

    \ \ \ \ \ - \ 2.797096596401706413444068821508193e-49*P(34,x) +

    \ \ \ \ \ - \ 5.548955677049963483909673845071489e-53*P(36,x) +

    \ \ \ \ \ - \ 9.865206225205083247212985096531573e-57*P(38,x) +

    \ \ \ \ \ - \ 1.580763691652306983099443761944673e-60*P(40,x) +

    \ \ \ \ \ - \ 2.294688331479205281600814719914093e-64*P(42,x) +

    \ \ \ \ \ - \ 3.031771495580703895127109933386607e-68*P(44,x) +

    \ \ \ \ \ - \ 3.661200772680598752990852186025167e-72*P(46,x)

    \;
  </verbatim>

  and for (<reference|eq:Fourier-Legendre series-I1>) we have

  <\verbatim>
    \;

    \ \ \ \ \ \ \ \ I(1,x) = 0.5386343421852555592809081051666336*P(1,x) +

    \ \ \ \ \ - \ 0.02618069164825977449795296407260333*P(3,x) +

    \ \ \ \ \ - \ 0.0003419851912550806236210094361507344*P(5,x) +

    \ \ \ \ \ - \ 2.077651971699656963860267070724864e-6*P(7,x) +

    \ \ \ \ \ - \ 7.299001518662431414905576324932877e-9*P(9,x) +

    \ \ \ \ \ - \ 1.671443482954853739162527767203215e-11*P(11,x) +

    \ \ \ \ \ - \ 2.692744551459235232734936666452704e-14*P(13,x) +

    \ \ \ \ \ - \ 3.218106754771162455853759838545282e-17*P(15,x) +

    \ \ \ \ \ - \ 2.966624646773403074824196435937542e-20*P(17,x) +

    \ \ \ \ \ - \ 2.173686883720901031568436047655748e-23*P(19,x) +

    \ \ \ \ \ - \ 1.296326265789554875546711294998344e-26*P(21,x) +

    \ \ \ \ \ - \ 6.414855102151415733596588296578833e-30*P(23,x) +

    \ \ \ \ \ - \ 2.676389925142875786863074285387196e-33*P(25,x) +

    \ \ \ \ \ - \ 9.542035089444710700263714658817980e-37*P(27,x) +

    \ \ \ \ \ - \ 2.940669572337884276201779460203862e-40*P(29,x) +

    \ \ \ \ \ - \ 7.911705033029330504663434638574930e-44*P(31,x) +

    \ \ \ \ \ - \ 1.874426565726980007813411585706840e-47*P(33,x) +

    \ \ \ \ \ - \ 3.940459072597980181771454632976205e-51*P(35,x) +

    \ \ \ \ \ - \ 7.400090413796917559009186360838868e-55*P(37,x) +

    \ \ \ \ \ - \ 1.248984620737396858084740490332061e-58*P(39,x) +

    \ \ \ \ \ - \ 1.904842982553207494042180613785837e-62*P(41,x) +

    \ \ \ \ \ - \ 2.637959760920312924684635466402215e-66*P(43,x) +

    \ \ \ \ \ - \ 3.332061910821697596383220274010501e-70*P(45,x)

    \;
  </verbatim>

  <\thebibliography|10>
    <bibitem-with-key|1|AS p. 369 No. 9.4.1>E. E. Allen,\PAnalytical
    approximations,\Q <em|Math. Tables Aids Comp.>
    <with|font-series|bold|<em|8>>, 240-241 (1954); reproduced in
    <em|Handbook of mathematical functions with formulas, graphs, and
    mathematical tables,> ed M. Abramowitz and I. A. Stegun (National Bureau
    of Standards, Applied mathematics series, 55, Washington, 1970), p. 369
    No. 9.4.1.

    <bibitem-with-key|2|PolyMillane>\PPolynomial Approximations to Bessel
    Functions,\Q R. P. Millane and J. L. Eads, I<em|EEE Transactions on
    Antennas and Propagation>, <with|font-series|bold|51>(6), 1398 (1995).

    <bibitem-with-key|3|int_Gross>\PNew Approximations to <math|J<rsub|0>>
    and <math|J<rsub|1>> Bessel Functions,\Q Frank B. Gross, I<em|EEE
    Transactions on Antennas and Propagation>, <with|font-series|bold|43>(8),
    904 (2003).

    <bibitem-with-key|4|rat_Maass>\PPrecise analytic approximations for the
    Bessel function <math|J<rsub|1>>,\Q Fernando Maass and Pablo Martin,
    <em|Results in Physics> <with|font-series|bold|8>, 1234<textendash|>1238
    (2018).

    <bibitem-with-key|5|rat_Mart=0000EDn>\PFractional approximations to the
    Bessel function <math|J<rsub|0>>(x),\Q Pablo MartÃ\<hyphen\>n; Antonio L.
    Guerrero, J. Math. Phys. <with|font-series|bold|26>, 705<textendash|>707
    (1985).

    <bibitem-with-key|6|jacobi_cheb_Wimp>\PPolynomial Expansions of Bessel
    Functions and Some Associated Functions,\Q Jet Wimp, <em|Math. Comp.
    ><with|font-series|bold|16>, 446-458(1962).

    <bibitem-with-key|7|cheb_Clenshaw>C. W. Clenshaw, <em|Mathematical
    Tables>, Vol. 5: \PChebyshev Series for Mathematical Functions.\Q
    Department of Scientific and Industrial Research, 1962 (London: Her
    Majesty<textquoteright|>s Stationery Office), pp. 30-5.

    <bibitem-with-key|8|Cheb_Zhang>\PComparisons of best approximations with
    Chebyshev expansions for functions with logarithmic endpoint
    singularities,\Q Xiaolong Zhang, <em|Numerical Algorithms>
    <with|font-series|bold|94>(3), 1-25 (2023).

    <bibitem-with-key|9|cheb_Coleman>\PChebyshev Expansions for the Bessel
    Function J n (z) in the Complex Plane,\Q J. P. Coleman and A. J.
    Monaghan, Mathematics of Computation 40(161), 343-366 (1983).

    <bibitem-with-key|10|trig_Molinari> \PA Note on Trigonometric
    Approximations of Bessel Functions of the First Kind, and Trigonometric
    Power Sums,\Q Luca Guido Molinari, <em|Fundamental Journal of Mathematics
    and Applications>, <with|font-series|bold|5>(4) 266-272 (2022) .

    <bibitem-with-key|11|Reiss4>\PEffect of an intense electromagnetic filed
    on a weakly bound system,\Q H. R. Reiss. <em|Phys. Rev. A> 22, 1786
    (1980).

    <bibitem-with-key|12|Reiss5>\PTheoretical methods in quantum optics:
    S-matrix and Keldysh techniques for stong-field process,\Q H. R. Reiss.
    Progress in Quantum Electronics 16, 1 (1992).

    <bibitem-with-key|13|Reiss6>\PRelativistic strong-field
    photoionization,\Q H. R. Reiss. Journal of the Optical Society of America
    B 7, 4 p. 570 (1990).

    <bibitem-with-key|14|Faisel2>\PMultiple absorbtion of laser phtons by
    atoms,\Q F. H. M. Faisal. J. Phys. B. vol. 6, 4 (1973).

    <bibitem-with-key|15|Reiss3>\PFoundations of Strong-Field Physics,\Q
    Howard R. Reiss. Lecutres on Ultrafast intense Laser Scinece 1, 94 (2010)
    41.

    <bibitem-with-key|16|Reiss1>\PLimits on Tunneling Theories of
    Strong-Field Ionization,\Q H. R. Reiss. Phys. Rev. Lett. 101, 043002
    (2008).

    <bibitem-with-key|17|KeatingPhD>C. M. Keating, PhD Dissertation, \PUsing
    Strong Laser Fields to Produce Antihydrogen Ions,\Q appendix D,

    https://pdxscholar.library.pdx.edu/open_access_etds/4519/.

    <bibitem-with-key|18|Haber>Howard E. Haber,
    http://scipp.ucsc.edu/<textasciitilde|>haber/ph116C/SphericalHarmonics_12.pdf.

    <bibitem-with-key|19|Kellogg>Oliver D. Kellogg, <em|Foundations of
    Potential Theory> (Springer-Verlag, Berlin, 1929), p 132.

    <bibitem-with-key|20|MagnusOberhettingerSoni>W. Magnus, F. Oberhettinger,
    and R. P. Soni, <em|Formulas and Theorems for the Special Functions of
    Mathematical Physics> (Springer-Verlag, NY, 1966) . p. 81;
    https://functions.wolfram.com/03.01.07.0005.01.

    <bibitem-with-key|21|GR5 p. 987 No. 8.511.4> Gradshteyn, I.S.; Ryzhik,
    I.M. <with|font-shape|italic|Table of Integrals, Series, and Products>,
    5th ed. (Academic: New York, NY, USA, 1994), p. 987 No. 8.511.4.

    <bibitem-with-key|22|Joachain p. 671 Eq. (B.46)> Joachain, C. J.
    <em|Quantum Collision Theory>; North-Holland, NY, 1983; p. 671, (B.46).

    <bibitem-with-key|23|wolfram.com/03.21.06.0019.01>http://functions.wolfram.com/03.21.06.0019.01.

    <bibitem-with-key|24|GH p. 110 No. 332.14a>W. Gröbner und N. Hofreiter,
    <em|Integraltafel Zweiter Teil Bestimmte Integrale> (Springer-Verlag,
    Berlin, 1961), p. 110 No. 332.14a.

    <bibitem-with-key|25|GR5 p. 417 No. 3.631.17>Supra note 21, p. 417 No.
    3.631.17.

    <bibitem-with-key|26|wolfram.com/07.26.26.0001.01>http://functions.wolfram.com/07.26.26.0001.01

    <bibitem-with-key|27|Rational Chebyshev>\QRational Chebyshev
    Approximations of Analytic Functions,\Q Dario Castellanos and William E.
    Rosenthal,

    https://www.fq.math.ca/Scanned/31-3/castellanos.pdf.

    <bibitem-with-key|28|Amos_double>\QALGORITHM 644: A Portable Package for
    Bessel Functions of a Complex Argument and Nonnegative Order,\Q D. E.
    Amos, <em|ACM Transactions on Mathematical Software>,
    <with|font-series|bold|12>(3), 265-273 (1966).

    <bibitem-with-key|29|floating_point>https://fortran-lang.org/en/learn/best_practices/floating_point.

    <bibitem-with-key|30|GR5 p. 970 No. 8.440>Supra note 21, p. 970 No.
    8.440.

    <bibitem-with-key|31|Cuchta>\QThe Bessel Difference Equation,\Q Martin
    Bohner and Tom Cuchta, <em|Proceedings of the American Mathematical
    Society>, <with|font-series|bold|145>(4), 1567<textendash|>1580 (2017).

    <bibitem-with-key|32|PBM3 p. 468 No. 7.3.1.206>Prudnikov, A.P., Brychkov,
    Yu. A., and Marichev, O.I. <with|font-shape|italic|Integrals and Series>;
    (Gorden and Breach, New York, 1986) Vol. 3 p. 468 No. 7.3.1.206.

    <bibitem-with-key|33|PBM3 p. 430 No. 7.2.1.1>Ibid, p. 430 No. 7.2.1.1.

    <bibitem-with-key|34|dlmf 5.2.6>Relation 5.2.6 at
    https://dlmf.nist.gov/search/search?q=pochhammer&p=0&r=0.

    <bibitem-with-key|35|http://functions.wolfram.com/06.10.02.0001.01>http://functions.wolfram.com/06.10.02.0001.01.

    <bibitem-with-key|36|AS p. 370 No. 9.4.4>Supra note 1, p. 370 No. 9.4.4.

    <bibitem-with-key|37|GR5 p. 961 No. 8.406.3>Supra note 21, p. 961 No.
    8.406.3.

    <bibitem-with-key|38|AS p. 378 No. 9.8.1>Supra note 1, p. 378 No. 9.8.1.

    <bibitem-with-key|39|GR5 p. 979 No. 8.471.1 \ p. 981 No. 8.486.1>Supra
    note 21, p. 979 No. 8.471.1; p. 981 No. 8.486.1.

    <bibitem-with-key|40|GR5 p. 971 No. 8.445>Supra note 21, p. 971 No.
    8.445.

    <bibitem-with-key|41|AS p. 378 No. 9.8.3>Supra note 1, p. 378 No. 9.8.3.
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|3|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|4|7|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-5|<tuple|5|12|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-6|<tuple|6|15|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-7|<tuple|7|19|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-8|<tuple|7|19|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-9|<tuple|7|27|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-AS p. 369 No. 9.4.1|<tuple|1|27|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-AS p. 370 No. 9.4.4|<tuple|36|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-AS p. 378 No. 9.8.1|<tuple|38|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-AS p. 378 No. 9.8.3|<tuple|41|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Amos_double|<tuple|28|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Cheb_Zhang|<tuple|8|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Cuchta|<tuple|31|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Faisel2|<tuple|14|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GH p. 110 No. 332.14a|<tuple|24|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 417 No. 3.631.17|<tuple|25|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 961 No. 8.406.3|<tuple|37|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 970 No. 8.440|<tuple|30|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 971 No. 8.445|<tuple|40|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 979 No. 8.471.1 \ p. 981 No.
    8.486.1|<tuple|39|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-GR5 p. 987 No. 8.511.4|<tuple|21|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Haber|<tuple|18|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Joachain p. 671 Eq. (B.46)|<tuple|22|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-KeatingPhD|<tuple|17|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Kellogg|<tuple|19|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-MagnusOberhettingerSoni|<tuple|20|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-PBM3 p. 430 No. 7.2.1.1|<tuple|33|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-PBM3 p. 468 No. 7.3.1.206|<tuple|32|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-PolyMillane|<tuple|2|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Rational Chebyshev|<tuple|27|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Reiss1|<tuple|16|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Reiss3|<tuple|15|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Reiss4|<tuple|11|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Reiss5|<tuple|12|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-Reiss6|<tuple|13|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-cheb_Clenshaw|<tuple|7|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-cheb_Coleman|<tuple|9|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-dlmf 5.2.6|<tuple|34|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-floating_point|<tuple|29|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-http://functions.wolfram.com/06.10.02.0001.01|<tuple|35|29|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-int_Gross|<tuple|3|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-jacobi_cheb_Wimp|<tuple|6|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-rat_Maass|<tuple|4|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-rat_Mart=0000EDn|<tuple|5|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-trig_Molinari|<tuple|10|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-wolfram.com/03.21.06.0019.01|<tuple|23|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|bib-wolfram.com/07.26.26.0001.01|<tuple|26|28|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:1/primes^n=00003D00003D|<tuple|26|11|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:1/primes^n_gamma|<tuple|29|12|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:1=00003D00003D|<tuple|22|10|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:AS p. 369 No. 9.4.1|<tuple|16|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:AS p. 369 No. 9.4.1^x|<tuple|17|7|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:AS p. 370 No. 9.4.4|<tuple|31|13|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:AS p. 378 No. 9.8.1|<tuple|36|16|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:AS p. 378 No. 9.8.3|<tuple|40|18|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Cauchy|<tuple|25|11|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Fourier-Legendre series|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Fourier-Legendre series-I1|<tuple|39|18|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Fourier-Legendre series-numerical|<tuple|15|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Fourier-Legendre series-numerical_J1|<tuple|30|13|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:Fourier-Legendre seriesI0|<tuple|35|16|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:GR5 p. 417 No. 3.631.17|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:GR5 p. 970 No. 8.440|<tuple|19|9|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:GR5 p. 971 No. 8.445|<tuple|37|17|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:GR5 p. 987 No. 8.511.4|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:I_from_J|<tuple|34|15|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:J1series|<tuple|32|14|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:J1summedtoprimes|<tuple|33|15|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:P0toP6|<tuple|20|9|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:PBM3 p. 468 No. 7.3.1.206|<tuple|23|10|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:S_n|<tuple|24|10|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:a_L0|<tuple|13|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:a_L1|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:a_L_as_2F3|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:a_w_M_sum|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:coefficients|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:curleyjxtheta|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:dlmf 5.2.6|<tuple|27|11|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:first4products|<tuple|21|9|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:jint|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:poly_approx_48_digit|<tuple|18|8|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:regularized|<tuple|12|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:scriptj0|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:scriptjbeforelpinsertion|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:wolfram03.21.06.0019.01|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:x^44,46|<tuple|38|17|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:x^45|<tuple|41|18|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|footnote-1|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|footnote-2|<tuple|2|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|footnr-1|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|footnr-2|<tuple|2|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      AS p. 369 No. 9.4.1

      PolyMillane

      int_Gross

      rat_Maass

      rat_Mart=0000EDn

      jacobi_cheb_Wimp

      cheb_Clenshaw

      Cheb_Zhang

      cheb_Coleman

      trig_Molinari

      Reiss1

      Reiss3

      Reiss4

      Reiss5

      Reiss6

      Faisel2

      KeatingPhD

      Haber

      Kellogg

      MagnusOberhettingerSoni

      GR5 p. 987 No. 8.511.4

      Joachain p. 671 Eq. (B.46)

      wolfram.com/03.21.06.0019.01

      GH p. 110 No. 332.14a

      GR5 p. 417 No. 3.631.17

      wolfram.com/07.26.26.0001.01

      Rational Chebyshev

      Amos_double

      floating_point

      AS p. 369 No. 9.4.1

      AS p. 369 No. 9.4.1

      GR5 p. 970 No. 8.440

      Cuchta

      PBM3 p. 468 No. 7.3.1.206

      PBM3 p. 430 No. 7.2.1.1

      dlmf 5.2.6

      http://functions.wolfram.com/06.10.02.0001.01

      AS p. 370 No. 9.4.4

      GR5 p. 970 No. 8.440

      GR5 p. 961 No. 8.406.3

      AS p. 378 No. 9.8.1

      GR5 p. 971 No. 8.445

      GR5 p. 979 No. 8.471.1 \ p. 981 No. 8.486.1

      AS p. 378 No. 9.8.3

      KeatingPhD
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Fourier-Legendre series of a Bessel function of the first kind>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>A
      Numerical Check> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Summing
      a set of infinite series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Series
      arising from the <with|mode|<quote|math>|J<rsub|1><around*|(|x|)>>
      Fourier-Legendre series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Series
      arising from the <with|mode|<quote|math>|I<rsub|n><around*|(|x|)>>
      Fourier-Legendre series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>