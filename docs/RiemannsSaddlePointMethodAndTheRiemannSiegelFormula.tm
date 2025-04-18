<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Riemann's Saddle-point Method and the Riemann-Siegel
  Formula>>

  \;

  <\abstract>
    Riemann's way to calculate his zeta function on the critical line was
    based on an application of his saddle-point technique for approximating
    integrals that seems astonishing even today. His contour integral for the
    remainder in the Dirichlet series for the zeta function involved not an
    isolated saddle, nor a saddle near a pole or an end-point or several
    coalescing saddles, but the configuration, unfamiliar even now, of a
    saddle close to an infinite string of poles. Riemann evaluated the
    associated integral exactly, and the resulting Riemann-Siegel formula
    underlies ways of computing the Riemann zeros and one of the physical
    approaches to the Riemann hypothesis.
  </abstract>

  2000 Mathematics Subject Classification: 01A55, 11M26, 11Y35, 30B50, 30E15,
  34E05, 41A60.

  Keywords and Phrases: zeta function, steepest descent, asymptotics.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1 Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2 Outline
    derivation of Riemann-Siegel remainder integral>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3 Leading-order
    remainder> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4 Higher orders
    and concluding remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  \;

  <section*|1 Introduction>

  This book marks Riemann's death 150 years ago by celebrating his many
  achievements. I want to focus on one startlingly original aspect of his
  research that was never published in his lifetime, namely his application
  of the saddle-point method to the calculation of his eponymous zeta
  function. The underlying story is well known [1]. Nearly seventy years
  after Riemann died, Siegel [2] (reprinted in [3]) reconstructed his
  calculation from incomplete notes discovered posthumously, and elucidated
  what is now called the Riemann-Siegel formula.

  The formula involves a contour integral, that Riemann approximated by a
  variant of his saddle-point method. In its simplest and most familiar form
  <math|<around|[|4,5|]>>, this involves integrands dominated by an
  exponential containing a large parameter. The approximation consists in
  expanding the integrand about its critical point on the integration path \U
  the complex saddle (stationary point of the exponent) leading in lowest
  order to a Gaussian integral that is easily evaluated. This version of the
  method is usually attributed to Debye [6], although he pointed out that he
  learned it from an 1863 paper by Riemann, published posthumously [7] with
  additional material by Schwarz. Riemann had concentrated on the
  approximation of certain hypergeometric functions with complex variables;
  this seems a specialised application, but it was clear that Riemann
  understood that the technique can be applied in more general cases. Between
  Riemann's and Debye's paper, the method was discovered independently by
  Nekrasov [8].

  Sometimes, the technique is called the method of steepest descents. This
  refers to rotating the integration contour to pass through the saddle in
  the direction for which the real part of the exponent decreases fastest. If
  instead the contour is rotated (by <math|\<pi\>/4> at the saddle) so that
  the real part of the exponent remains constant \U that is, the integrand is
  oscillatory \U the same technique is called the stationary-phase method. In
  this form, it was anticipated by Stokes [9] (reprinted in [10]) and later
  developed by Kelvin [11].

  Nowadays, we are familiar with a number of generalizations of the
  saddle-point method [4]: as one or more parameters are varied, the saddle
  can coincide with an end-point of the integral, or a pole or branch-point,
  or several saddles can coalesce (chapter 36 of [12]). In these variants,
  the approximation depends on identifying a special function for which the
  local behaviour can be captured exactly. For the simplest saddle-point
  method, this is the Gaussian integral; for the saddle near an end-point or
  a pole, it is the error function; for two coalescing saddles, it is the
  Airy function [13]. Further extensions include deforming the integrands to
  get approximations that remain uniformly valid into the ordinary
  saddle-point regime far from the coalescences [14-16], understanding the
  high orders of the expansions [17, 18], and multiple integrals
  <math|<around|[|4,19|]>>.

  In Riemann's approximation of the zeta function, his genius was to apply
  the saddle-point method to a situation that to my knowledge nobody else has
  considered in the intervening 150 years: a saddle close to an infinite
  string of poles. To explain this, it is necessary to reproduce previously
  published material [1, 2]. I will do so in a streamlined way
  (`Siegel-Edwards lite').

  <section*|2 Outline derivation of Riemann-Siegel remainder integral>

  Riemann approximated <math|\<zeta\><around|(|s|)>> high on the critical
  line <math|s=1/2+<math-up|i>t>, i.e. <math|t> real and <math|t\<gg\>1>. For
  this is is necessary to start by analytically continuing the Dirichlet
  series

  <\equation*>
    \<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>,
  </equation*>

  which converges only for <math|<math-up|Re>s\<gtr\>1>. On the critical
  line, it is convenient to approximate not the complex function
  <math|\<zeta\>*<around|(|1/2+<math-up|i>t|)>> but the function
  <math|Z<around|(|t|)>>, which the functional equation for
  <math|\<zeta\><around|(|s|)>> guarantees is real for real <math|t> :

  <\equation*>
    Z<around|(|t|)>=exp <around|(|<math-up|i>\<theta\><around|(|t|)>|)>*\<zeta\>*<around*|(|<frac|1|2>+<math-up|i>t|)>,<text|where
    >\<theta\><around|(|t|)>=arg <around*|(|\<Gamma\>*<around*|(|<frac|1|4>+<frac|1|2><math-up|i>t|)>|)>-<frac|1|2>*t*log
    \<pi\>.
  </equation*>

  <\padded-center>
    <image|https://cdn.mathpix.com/cropped/2025_04_18_d8f5075a239815e0df73g-03.jpg|0.4par|||>
  </padded-center>

  <with|font-series|bold|Figure 1:> Complex plane <math|z> of the integrand,
  and integration contours, in the Riemann-Siegel integrals. Dots indicate
  the poles, the star indicates the saddle, and the dashed line is the branch
  cut.

  In the Dirichlet series (2.1), the first <math|N> terms are retained, and
  the continuation is accomplished modifying the terms <math|n\<gtr\>N> using
  the following form of the Hankel integral [12] for the gamma function:

  <\equation*>
    1=-<frac|\<Gamma\><around|(|s|)>|2*\<pi\><math-up|i>>*<big|int><rsub|C><with|math-font-family|rm|<nbsp>d>z<frac|exp
    <around|(|-z|)>|<around|(|-z|)><rsup|s>>*<around|(|s\<neq\>0,-1,-2*\<cdots\>|)>.
  </equation*>

  Here the <math|z> plane is cut along the positive real axis and the contour
  is shown in figure 1. Elementary manipulations now give a representation of
  <math|Z<around|(|t|)>> in which the tail of the Dirichlet series is
  resummed:

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|Z<around|(|t|)>=>|<cell|<big|sum><rsub|n=1><rsup|N><frac|exp
      <around|(|<math-up|i><around|(|\<theta\><around|(|t|)>-t*log
      n|)>|)>|<sqrt|n>>>>|<row|<cell|>|<cell|-<frac|exp
      <around|(|<math-up|i>\<theta\><around|(|t|)>|)>*\<Gamma\>*<around*|(|<frac|1|2>-<math-up|i>t|)>|2*\<pi\><math-up|i>>*<big|int><rsub|C><with|math-font-family|rm|<nbsp>d>z<frac|<around|(|-z|)><rsup|-<frac|1|2>+<math-up|i>t>*exp
      <around|(|-N*z|)>|exp <around|(|z|)>-1>.>>>>
    </aligned>
  </equation*>

  This is the required analytic continuation. The next step is to expand the
  contour to <math|<math-up|C><rsub|N>> (figure 1), to capture the first
  <math|N\<gtr\>0> poles on both the positive imaginary and the negative
  imaginary axes. This leads to

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|Z<around|(|t|)>=>|<cell|<big|sum><rsub|n=1><rsup|N><frac|exp
      <around|(|<math-up|i><around|(|\<theta\><around|(|t|)>-t*log
      n|)>|)>|<sqrt|n>>>>|<row|<cell|>|<cell|+f<around|(|t|)>*<big|sum><rsub|n=1><rsup|N><frac|exp
      <around|(|<math-up|i><around|(|-\<theta\><around|(|t|)>+t*log
      n|)>|)>|<sqrt|n>>+R<rsub|N><around|(|t|)>>>>>
    </aligned>
  </equation*>

  with the remainder now given by

  <\equation*>
    R<rsub|N><around|(|t|)>=-<frac|exp <around|(|<math-up|i>\<theta\><around|(|t|)>|)>*\<Gamma\>*<around*|(|<frac|1|2>-<math-up|i>t|)>|2*\<pi\><math-up|i>>*<big|int><rsub|C<rsub|N>><with|math-font-family|rm|<nbsp>d>z<frac|<around|(|-z|)><rsup|-<frac|1|2>+<math-up|i>t>*exp
    <around|(|-N*z|)>|exp <around|(|z|)>-1>
  </equation*>

  Gamma function manipulations (reflection and duplication formulas [12])
  give the prefactor of the second sum as

  <\equation*>
    f<around|(|t|)>=2*exp <around|(|2<math-up|i>\<theta\><around|(|t|)>|)>*\<Gamma\>*<around*|(|<frac|1|2>-<math-up|i>t|)>*<around|(|2*\<pi\>|)><rsup|-<frac|1|2>+<math-up|i>t>*cos
    <around*|(|<frac|1|2>*\<pi\>*<around*|(|<frac|1|2>-<math-up|i>t|)>|)>=1
  </equation*>

  Therefore the <math|N> terms of the second series in (2.5) are the complex
  conjugates of their counterparts in the first series, and

  <\equation*>
    Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N><frac|cos
    <around|(|\<theta\><around|(|t|)>-t*log
    n|)>|<sqrt|n>>+R<rsub|N><around|(|t|)>
  </equation*>

  This representation, exact for all values of <math|t> and <math|N>, is the
  starting point of the derivation of the Riemann-Siegel formula. The series
  (called 'the main sum', or 'the approximate functional equation') is real,
  and so is <math|Z<around|(|t|)>>. Therefore <math|R<rsub|N><around|(|t|)>>
  is also real, though this is not obvious from the expression (2.6). The
  reappearance, in the tail of the Dirichlet series, of the complex
  conjugates of the first <math|N> terms of the series, is an example of the
  general asymptotic phenomenon of resurgence, in which the high orders of a
  divergent series can be expressed in terms of the low orders of the series
  <math|<around|[|17,20,21|]>>. The main sum itself is quite accurate: even
  the term <math|n=1> possesses zeros with the correct asymptotic densities,
  and the remaining <math|N-1> terms shift the approximate zeros close to
  their exact locations.

  <section*|3 Leading-order remainder>

  Now the theory moves from exactness to approximation for large <math|t>.
  The exponent in the numerator of the integrand in (2.6) possesses a saddle,
  at <math|z<rsub|s>>, given by

  <\equation*>
    <frac|<math-up|d>|<with|math-font-family|rm|<nbsp>d>z>*<around*|(|<around*|(|-<frac|1|2>+<math-up|i>t|)>*log
    z-N*z|)>=0<space|1em>\<Rightarrow\>z=z<rsub|s>=<frac|<math-up|i>t|N>-<frac|1|2*N>
  </equation*>

  We want this saddle to lie close to the contour <math|<math-up|C><rsub|N>>,
  so that it dominates the integral for <math|R<rsub|N>>. This can be
  achieved by choosing

  <\equation*>
    N=<around*|[|<sqrt|<frac|t|2*\<pi\>>>|]>,
  </equation*>

  in which [...] denotes the integer part (floor function). Denoting the
  fractional part of <math|<sqrt|>*<around|(|t/2*\<pi\>|)>> by <math|p>, i.e.

  <\equation*>
    <sqrt|<frac|t|2*\<pi\>>>=N+p*<space|1em><around|(|0\<leq\>p\<less\>1|)>
  </equation*>

  the location of the saddle can be written as

  <\equation*>
    z<rsub|s>=<frac|2*\<pi\><math-up|i><around|(|N+p|)><rsup|2>|N>-<frac|1|2*N>\<rightarrow\>2*\<pi\><math-up|i><around|(|N+2*p|)>*<text|as
    >N\<rightarrow\>\<infty\>.
  </equation*>

  As <math|N> increases, <math|z<rsub|s>> approaches the imaginary axis.
  Figures 2(a,b) show the normalized modulus of the numerator of the
  integrand in (2.6) along the straight line through the saddle in the
  direction of steepest descent there, namely

  <\equation*>
    M<around|(|x|)>=<around*|\||<around*|(|<frac|z|z<rsub|0>>|)><rsup|-<frac|1|2>+<math-up|i>t>*exp
    <around*|(|-N*<around*|(|z-z<rsub|0>|)>|)>|\|>*<text|, for
    >z=z<rsub|0>+x*exp <around*|(|<frac|1|4><math-up|i>\<pi\>|)>,
  </equation*>

  where <math|z<rsub|0>=z<rsub|s>>, compared with the Gaussian approximation
  (quadratic expansion about <math|z<rsub|0>> ). The Gaussian fit is almost
  perfect, even for the relatively small value illustrated.

  A point not emphasized in the Riemann-Siegel literature is that it is only
  for <math|0\<less\>p\<less\>1/2> that the large <math|N> location (3.4) of
  the saddle lies between the poles <math|N> and <math|N+1>, so that
  <math|<math-up|C><rsub|N>> can pass through it; for
  <math|1/2\<less\>p\<less\>1>, the saddle lies above the pole <math|N+1>.
  But this does not matter: it is not necessary for the
  <math|<math-up|C><rsub|N>> to pass exactly through the saddle. In fact it
  is convenient to expand the integral not through <math|z<rsub|s>> but
  through the location <math|z<rsub|c>> of the pole <math|N> :

  <\equation*>
    z<rsub|c>=2*\<pi\><math-up|i>N=z<rsub|s>-4*\<pi\><math-up|i>p*<text|for
    >N\<gg\>1.
  </equation*>

  As figures 2(c,d) illustrate, the modulus <math|M> of the integrand (i.e.
  (3.5) with <math|z<rsub|0>=z<rsub|c>>), is still close to Gaussian. The
  maximum is shifted, and the fit for fixed <math|N> deteriorates as <math|p>
  increases, because the path passes further from the saddle, traversing
  regions of ascent where <math|M> is large. For all <math|p>, the fit
  improves as <math|N> increases.

  Expanding about <math|z<rsub|c>> to quadratic order, the remainder becomes,
  after more manipulations and using the large <math|t> (Stirling)
  approximation for the gamma function [1],

  <\equation*>
    R<rsub|N>*<around*|(|2*\<pi\>*<around|(|N+p|)><rsup|2>|)><below|\<longrightarrow\>|N\<gg\>1><around*|(|<frac|2*\<pi\>|t>|)><rsup|1/4>*<around|(|-1|)><rsup|N+1>*\<Psi\><around|(|p|)>
  </equation*>

  in which

  <\equation*>
    \<Psi\><around|(|p|)>=<frac|exp <around*|(|<math-up|i><around*|(|<frac|1|8>*\<pi\>-2*\<pi\>*p<rsup|2>|)>|)>|2*\<pi\><math-up|i>>*<big|int><rsub|L><with|math-font-family|rm|<nbsp>d>u<frac|exp
    <around*|(|<frac|<math-up|i>u<rsup|2>|4*\<pi\>>+2*p*u|)>|exp
    <around|(|u|)>-1>
  </equation*>

  <\padded-center>
    <image|https://cdn.mathpix.com/cropped/2025_04_18_d8f5075a239815e0df73g-06.jpg|0.8par|||>
  </padded-center>

  <with|font-series|bold|Figure 2:> Full curves: (a,b) modulus <math|M>
  (equation (3.5)) of the Riemann-Siegel integral (2.6) along straight
  <math|45<rsup|\<circ\>>> (locally steepest) path <math|<math-up|L><rsub|N>>
  through the saddle <math|z<rsub|s>> (equation (3.4)), with <math|N=3>, for
  (a): <math|p=0.2> and (b): <math|p=0.8>. (c,d): as (a), (b) for the path
  through <math|z<rsub|c>> (equation (3.6)) crossing the pole <math|N>; for
  (c), <math|N=3>, and for (d), <math|N=20>. Dashed curves: corresponding
  Gaussian approximations.

  The contour L passes from upper right to lower left, crossing the imaginary
  axis between <math|u=0> and <math|u=2*\<pi\><math-up|i>>. Careful analysis
  [1] shows that the segments of the contour <math|<math-up|C><rsub|N>> thus
  neglected give contributions negligible in comparison with that from L.

  Thus Riemann identified the dominant contribution to
  <math|R<rsub|N><around|(|t|)>> as an integral whose numerator is Gaussian
  and whose denominator is a string of poles. As explained elsewhere [1, 2],
  he was able to evaluate this integral exactly. The result is

  <\equation*>
    \<Psi\><around|(|p|)>=<frac|cos 2*\<pi\>*<around*|(|p<rsup|2>-p-<frac|1|16>|)>|cos
    2*\<pi\>*p>
  </equation*>

  (the derivation involves two relations between <math|\<Psi\><around|(|p|)>>
  and <math|\<Psi\>*<around|(|p+1/2|)>>). Despite appearances, this is an
  entire function: the zeros <math|p=<around|(|n+1/2|)>*\<pi\>> of the
  denominator are cancelled by those of the numerator.... Thus, almost
  casually, without fanfare, in an achievement unmatched from his day to
  ours, Riemann established the leading-order correction to the main sum in
  (2.8), so that

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|Z<around|(|t|)>=>|<cell|2*<big|sum><rsub|n=1><rsup|N><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*log
      n|)>|<sqrt|n>>>>|<row|<cell|>|<cell|+<around*|(|<frac|2*\<pi\>|t>|)><rsup|1/4>*<around|(|-1|)><rsup|N+1><frac|cos
      2*\<pi\>*<around*|(|p<rsup|2>-p-<frac|1|16>|)>|cos
      2*\<pi\>*p>+O<around*|(|<frac|1|t<rsup|1/2>>|)>.>>>>
    </aligned>
  </equation*>

  Note that this expression is real, indicating that the saddle-point
  approximation preserves the essence of the functional equation.

  <section*|4 Higher orders and concluding remarks>

  Riemann did more than calculate the leading-order remainder: he developed a
  systematic expansion scheme, to derive higher orders as a series in powers
  of <math|<around|(|2*\<pi\>/t|)><rsup|1/4>>, involving derivatives of
  <math|\<Psi\><around|(|p|)>>. I do not describe these higher corrections
  here, because there is a more direct procedure, stimulated by an idea of
  Keating [22] and elaborated elsewhere [23]. This is based directly on the
  Dirichlet series (2.1), from which the remainder, correcting the main sum,
  is given formally by

  <\equation*>
    R<rsub|N><around|(|t|)>=exp <around|(|<math-up|i>\<theta\><around|(|t|)>|)>*<big|sum><rsub|N+1><rsup|\<infty\>><frac|1|n<rsup|<frac|1|2>+<math-up|i>t>>-exp
    <around|(|-<math-up|i>\<theta\><around|(|t|)>|)>*<big|sum><rsub|1><rsup|N><frac|1|n<rsup|<frac|1|2>-<math-up|i>t>>.
  </equation*>

  The procedure consists of expanding each sum about its limit <math|N>, and
  also <math|\<theta\><around|(|t|)>>, for <math|t\<gg\>1>. The resulting
  terms are all real, as they must be, and coincide with those obtained
  rigorously by Riemann and Siegel. Moreover, the formal procedure enables
  the high-order behaviour of the series to be established, indicating that
  it diverges factorially, although in a slightly unfamiliar way [23].

  In the main sum (2.8), the upper limit <math|N> depends on <math|t>
  according to (3.2). Therefore the main sum is a discontinuous function of
  <math|t>. But the exact function <math|Z<around|(|t|)>> is continuous and
  also smooth, so one role of the Riemann-Siegel correction terms is to
  systematically reduce the discontinuities in the value and derivatives of
  the main sum. There are several more sophisticated expansions of
  <math|Z<around|(|t|)>> [23-27], in which the discontinuities are smoothed.

  All methods currently used for numerical calculations of the zeta function
  and its zeros are based on the Riemann-Siegel formula. The principal
  difficulty is computing the main sum, but this has been overcome in several
  ways [28, 29].

  The Riemann-Siegel formula has a physical interpretation. One approach to
  the Riemann hypothesis is based on the conjecture that
  <math|Z<around|(|t|)>> is the spectral determinant (characteristic
  polynomial) of a quantum Hamiltonian operator whose classical counterpart
  is a chaotic dynamical system [30-32]. On this analogy, the heights
  <math|t> of the Riemann zeros correspond to quantum energy levels. This
  quantum system, and its classical counterpart, have not been identified,
  but several of their properties are known. In particular, the
  Riemann-Siegel main sum is the counterpart of an expansion of the quantum
  spectral determinant as a sum over combinations of periodic orbits of the
  classical system [30,33, 34], and the divergence of the series for the
  remainder <math|R<rsub|N><around|(|t|)>> suggests the nature of the complex
  classical periodic orbits [23]. Further insights into the conjectured
  underlying classical dynamical system might be hidden in the detailed form
  of the series of Riemann-Siegel corrections, involving
  <math|\<Psi\><around|(|t|)>>.

  If Riemann had not left hints of his way of calculating
  <math|Z<around|(|t|)>> in his Nachlass, and if Siegel had not discovered
  and deciphered Riemann's notes, it is likely that we would still be unaware
  of their formula today. The Riemann-Siegel formula underlies one approach
  to the Riemann hypothesis, it is implicated in connections between quantum
  mechanics chaotic dynamics, and the prime numbers, and it is employed in
  computations of the Riemann zeros. Riemann's achievement, innovative in so
  many ways, in particular his application of the saddle-point method to an
  integral with a string of poles, still seems magical....

  <section*|References>

  [1] Edwards, H. M., 2001, Riemann's Zeta Function, Dover Publications,
  Mineola, New York.<next-line><vspace*|2> Siegel, C. L., 1932, Über Riemanns
  Nachlass zur analytisches Zahlentheorie Quellen und Studien zur Geschichte
  der Mathematik, Astronomie, und Physik 2, 45-80.<next-line><vspace*|3>
  Siegel, C. L., 1966, Carl Ludwig Siegel Gesammelte Abhandlungen,
  SpringerVerlag, Berlin.<next-line><vspace*|4> Wong, R., 1989, Asymptotic
  approximations to integrals, Academic Press, New York and
  London.<next-line><vspace*|5> de Bruijn, N. G., 1958, Asymptotic Methods in
  Analysis, North-Holland, reprinted by Dover books 1981,
  Amsterdam.<next-line><vspace*|6> Debye, P., 1909, Näherungsformeln für die
  Zylinderfunktionen für grosse Werte des Arguments und unbeschränkt
  veränderliche Werte des Index Math. Ann 67, 535-558.<next-line><vspace*|7>
  Riemann, B., 1863, Sullo svoglimento del quoziente di due serie
  ipergeometriche in frazione continua infinita in Complete works, 2nd. ed,
  pp 424-430 eds., Dover 1963, New York.<next-line><vspace*|8> Petrova, S. S.
  & Solov'ev, A. D., 1997, The Origin of the Method of Steepest Descent,
  Historia Mathematica 24, 361-375.<next-line><vspace*|9> Stokes, G. G.,
  1847, On the numerical calculation of a class of definite integrals and
  infinite series, Trans. Camb. Phil. Soc. 9, 379-407.<next-line><vspace*|10>
  Stokes, G. G., 1883, Mathematical and Physical Papers, Unversity Press,
  Cambridge.<next-line><vspace*|11> Kelvin, L., 1887, On the waves produced
  by single impulse on water of any depth, or in a dispersive medium, Philos.
  Mag. 23, 252-255.<next-line><vspace*|12> DLMF,2010, NIST Handbook of
  Mathematical Functions, Cambridge University Press, Cambridge
  http://dlmf.nist.gov.<next-line><vspace*|13> Airy, G. B., 1838, On the
  intensity of light in the neighbourhood of a caustic, Trans. Camb. Phil.
  Soc. 6, 379-403.<next-line><vspace*|14> Chester, C., Friedman, B. & Ursell,
  F., 1957, An extension of the method of steepest descents, Proc. Camb.
  Phil. Soc. 53, 599-611.<next-line><vspace*|15> Duistermaat, J. J., 1974,
  Oscillatory Integrals, Lagrange Immersions and Unfolding of Singularities,
  Communs Pure App. Math. 27, 207-281.<next-line><vspace*|16> Berry, M. V.,
  1976, Waves and Thom's theorem, Advances in Physics 25,
  1-26.<next-line><vspace*|17> Dingle, R. B., 1973, Asymptotic Expansions:
  their Derivation and Interpretation, Academic Press, New York and
  London.<next-line><vspace*|18> Berry, M. V. & Howls, C. J., 1991,
  Hyperasymptotics for integrals with saddles, Proc. Roy. Soc. Lond. A434,
  657-675.<next-line><vspace*|19> Howls, C. J., 1997, Hyperasymptotics for
  multidimensional integrals, exact remainder terms and the global connection
  problem, Proc. Roy. Soc. Lond. A453, 2271-2294.<next-line><vspace*|20>
  Écalle, J., 1985, Les fonctions résurgentes (3 volumes). Pub. math.
  Orsay<next-line><vspace*|21> Berry, M. V. & Howls, C. J., 2015, Divergent
  series: taming the tails in The Princeton Companion to Applied Mathematics,
  ed. Higham, N., Princeton University Press, Princeton,
  pp634-640<next-line><vspace*|22> Keating, J. P., 1993, The Riemann
  zeta-function and quantum chaology in Quantum Chaos eds. Casati, G.,
  Guarneri, I. & Smilansky, U., North-Holland, Amsterdam, pp.
  145-185.<next-line><vspace*|23> Berry, M. V., 1995, The Riemann-Siegel
  formula for the zeta function: high orders and remainders,
  Proc.Roy.Soc.Lond. A450, 439-462.<next-line><vspace*|24> Paris, R. B.,
  1994, An asymptotic representation for the Riemann zeta function on the
  critical line, Proc. Roy. Soc. Lond. A446, 565-587.<next-line><vspace*|25>
  Paris, R. B. & Cang, S., 1997, An exponentially-improved Gram-type formula
  for the Riemann zeta function, Methods. Appl. Anal. 4,
  326-338.<next-line><vspace*|26> Paris, R. B. & Cang, S., 1997, An
  asymptotic representation for <math|\<zeta\>*<around|(|1/2+i*t|)>>,
  Methods. Appl. Anal. 4, 449-470.<next-line><vspace*|27> Kuznetsov, A.,
  2007, On he Riemann-Siegel formula, Proc. R. Soc. A 463,
  2557-2568.<next-line><vspace*|28> Odlyzko, A. M. & Schönhage, A., 1988,
  Fast Algorithms for Multiple Evaluations of the Riemann Zeta Function,
  Trans. Amer. Math. Soc. 309, 797-809.<next-line><vspace*|29> Hiary, G. A.,
  2011, Fast methods to compute the Riemann zeta function, Ann. Math. 174,
  891-946.<next-line><vspace*|30> Berry, M. V., 1986, Riemann's zeta
  function: a model for quantum chaos? in Quantum chaos and statistical
  nuclear physics eds. Seligman, T. H. & Nishioka, H., Vol. 263, pp.
  1-17.<next-line><vspace*|31> Berry, M. V. & Keating, J. P., 1999, The
  Riemann zeros and eigenvalue asymptotics, SIAM Review 41,
  236-266.<next-line><vspace*|32> Berry, M. V., 2008, Three quantum
  obsessions, Nonlinearity 21, T19-T26.<next-line><vspace*|33> Berry, M. V. &
  Keating, J. P., 1992, A new approximation for
  <math|\<zeta\>*<around|(|1/2+<math-up|i>t|)>> and quantum spectral
  determinants, Proc. Roy. Soc. Lond. A437, 151-173.<next-line><vspace*|34>
  Keating, J. P. & Sieber, M., 1994, Calculation of spectral determinants,
  Proc. Roy. Soc. Lond. A447, 413-437.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|?|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|?|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|?|7|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|?|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2
      Outline derivation of Riemann-Siegel remainder integral>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3
      Leading-order remainder> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4
      Higher orders and concluding remarks>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>