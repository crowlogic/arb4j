<TeXmacs|1.99.18>

<style|<tuple|article|alt-colors|framed-theorems>>

<\body>
  \ 

  <doc-data|<doc-title|<with|font-base-size|8|Complex Dynamics of The
  Hyperbolic Tangent of The Logarithm Of One Minus The Square of The Hardy Z
  Function>>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>crowlogic@proton.me\<gtr\> >|<\author-affiliation>
    <date>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>The Schröder Equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.1.1<space|2spc>Koenig's Linearization Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.2<space|2spc>Eigenfunctions of Compact Composition
    Operators <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|1.2.1<space|2spc>The Frobenius-Perron Transfer
    Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|1.2.2<space|2spc>Spectra of the Newton Map of the S
    Transform and Composition Operators <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|1.3<space|2spc>Physical Interpretations of the
    Cauchy-Riemann Equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Operator <with|color|dark red|font-family|rm|<with|mode|math|S<rsup|a><rsub|f><around*|(|t|)>=tanh<around*|(|ln<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>The Curve <with|color|dark
    red|font-family|rm|<with|mode|math|Re<around*|(|S<around*|(|t|)>|)>=0>>
    is a Bernoullian Lemniscate <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|2.2<space|2spc>The Curve <with|color|dark
    red|font-family|rm|<with|mode|math|Im<around*|(|S<around*|(|t|)>|)>=0>>
    is a Conjugate Pair of Rectangular Hyperbolas
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.3<space|2spc>Newton Maps and Flows of
    <with|color|dark red|font-family|rm|<with|mode|math|S<rsub|f><around*|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|2tab|2.3.1<space|2spc>Factoring Out The Double-Root at the
    Origin of <with|color|dark red|font-family|rm|<with|mode|math|N<rsub|S<rsub|f>><around*|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|2tab|2.3.2<space|2spc>The Newton Flow
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|2tab|2.3.3<space|2spc>The Desingularized Newton Flow For
    Entire Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    <with|par-left|2tab|2.3.4<space|2spc>The Continuous Desingularized Newton
    Flow for Meromorphic Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|2tab|2.3.5<space|2spc>The Continuous Newton Flow
    <with|color|dark red|font-family|rm|<with|mode|math|<wide|\<cal-N\>|\<bar\>><around*|(|S<rsub|f>|)>>>
    and Its Approximation <with|color|dark
    red|font-family|rm|<with|mode|math|<wide|\<cal-N\>|\<bar\>><rsup|h><around*|(|S<rsub|f>|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Riemann Zeta <with|color|dark red|font-family|rm|<with|mode|math|\<zeta\>>>
    Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>The Riemann Hypothesis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|2tab|3.1.1<space|2spc>Lines of Constant Phase and the
    Riemann Hypothesis <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    <with|par-left|1tab|3.2<space|2spc>The Hardy Z Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>>

    <with|par-left|2tab|3.2.1<space|2spc>The Phase of<with|color|dark
    red|font-family|rm|<with|mode|math|>> <with|color|dark
    red|font-family|rm|<with|mode|math|\<zeta\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    <with|par-left|1tab|3.3<space|2spc>The Function <with|color|dark
    red|font-family|rm|<with|mode|math|X<around*|(|t|)>=<around*|(|S\<circ\>Z|)><around*|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <with|par-left|2tab|3.3.1<space|2spc>Integration Along a Curve: A Newton
    Iteration for the Angle <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    <with|par-left|2tab|3.3.2<space|2spc>Roots of <with|color|dark
    red|font-family|rm|<with|mode|math|X<around*|(|t|)>>> on the Real Line
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Linearizing
    > <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Appendix>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>The Spectral Theorem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Index>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  TODO: Hilbert space stuff

  See <cite-detail|HilbertPrimer|Chapter 6> and define Banach spaces.

  \;

  There are many functions such as the Hardy <math|Z<around*|(|t|)>>
  function, Riemann xi <math|\<xi\><around*|(|t|)>> function, and the
  Dirichlet eta <math|\<eta\><around*|(|t|)>> function which are equivalent
  to the Riemann zeta <math|\<zeta\><around*|(|t|)>> function in the sense
  that they have a set of roots which coincides with those of
  <math|\<zeta\><around*|(|t|)>> up to an affine transform.\ 

  Another function which has some intriguing properties and shares the same
  roots, <math|X<around*|(|t|)>=S<around*|(|Z<around*|(|t|)>|)>=C<rsub|Z><around*|(|S<around*|(|t|)>|)>>,
  shall be introduced which is a composition
  <math|C<rsub|\<phi\>><around*|(|f|)>> of the rational meromorphic quartic
  where <math|\<phi\><around*|(|t|)>><math|=S<around*|(|t|)>=tanh<around*|(|ln<around*|(|1-t<rsup|2>|)>|)>=<frac|<around*|(|1-t<rsup|2>|)><rsup|2>-1|<around*|(|1-t<rsup|2>|)><rsup|2>+1>>
  and <math|f> is the Hardy Z function which has the property that it is
  known, independently of the Riemann hypothesis, that
  <math|Z<around*|(|t|)>\<in\>\<bbb-R\>\<forall\>t\<in\>\<bbb-R\>>, that is,
  <math|Z> is real-valued when <math|t> is real. The curves where the real
  and imaginary parts of <math|Z<around*|(|t|)>> vanish independently do not
  cross orthogonally beause they meet at infinity. All roots of <math|Z> are
  roots of <math|X> but the converse is not true.

  TODO: explain how the curves behave for the <math|\<zeta\>> <math|\<xi\>>
  and \<eta\>

  <\big-figure|>
    TODO: insert arb4j generated figures here showing the traces of the real
    and imaginary zero loci of each of the mentioned functions
  </big-figure>

  The curves <math|Re<around*|(|X<around*|(|t|)>|)>=0>
  <math|<infix-and>Im<around*|(|X<around*|(|t|)>|)>=0><space|1em>are
  orthogonal when they intersect at \ 1 point at the root on the real axis
  for a total of 5 intersection points. This means that for every root of
  <math|Z<around*|(|t|)>> there are 5 roots of <math|X<around*|(|t|)>> where
  the 4 \ roots consist of pair of points and their mirror conjugates; that
  is, if <math|\<rho\>=x+i y> is a root <math|X<around*|(|\<rho\>|)>=0> of
  <math|X> then so is its complement <math|<wide|\<rho\>|\<bar\>>=x-i y>

  <subsection|The Schröder Equation>

  <\definition>
    Schröder's equation is functional eigenvalue equation for the composition
    operator\ 

    <\equation>
      C<rsub|h>f<around*|(|x|)>:f<around*|(|\<nosymbol\>x|)>\<rightarrow\>f<around*|(|h<around*|(|x|)>|)>
    </equation>

    <math|> in one independent variable; where a function,
    <math|h<around*|(|x|)>>, is given and a function,
    <math|\<Psi\><around*|(|x|)>>, is sought which satisifes

    <\equation>
      \<Psi\><around*|(|h<around*|(|x|)>|)>=s \<Psi\><around*|(|x|)>
    </equation>

    where <math|s=<wide|h|\<dot\>><around*|(|0|)>> is the eigenvalue.
  </definition>

  <subsubsection|Koenig's Linearization Theorem>

  Let <math|f<rsub|t<rsub|0>><around*|(|t|)>=f<around*|(|t<rsub|0>+t|)>> be a
  function\<less\> such that the fixed-point of interest corresponds to the
  origin such that <math|f<rsub|t<rsub|0>><around*|(|0|)>=0> and
  <math|f<around*|(|t<rsub|0>|)>=0>.

  <\definition>
    A holomorphic function <math|f<around*|(|t|)>> that is one-to-one is said
    to be injective in a domain <math|t\<in\>B\<subset\><rsub|>\<bbb-C\>>
    such that <math|f<around*|(|z<rsub|1>|)>\<neq\>f<around*|(|z<rsub|2>|)>>
    when <math|z<rsub|1>\<neq\>z<rsub|2>> and is also said to be univalent or
    conformal. The inverse function <math|z=f<rsup|-1><around*|(|w|)>> is
    then also necessarily conformal in the same domain <math|B>.
  </definition>

  <\theorem>
    (<strong|Koenigs Linearization Theorem>) If the magnitude (absolute
    value) of the multiplier <math|\<lambda\>=<wide|f|\<dot\>><around*|(|0|)>>
    of a holomorphic map <math|f> is not strictly equal to 0 or 1, that is
    <math|<around*|\||\<lambda\>|\|>\<nsubset\><around*|{|0,1|}>>,<space|1em>then
    a local holomorphic change of coordinates
    <math|w=\<phi\><around*|(|z|)>>, called the <samp|Koenig's
    function><index|Koenig's function>, unique up to a scalar multiplication
    by nonzero constant, exists, having a fixed-point at the origin
    <math|\<phi\><around*|(|0|)>=0> such that Schröder's equation is true\ 

    <\equation>
      \<phi\>*\<circ\>f\<circ\>\<phi\><rsup|-1>=\<lambda\>
      w\<forall\>w\<in\>\<varepsilon\><rsub|0><label|kc>
    </equation>

    for some neighborhood <math|\<varepsilon\><rsub|0>> of the origin
    0<math|>.<cite|Milnor2006> <cite-detail|Milnor2006|Theorem
    8.2><cite-detail|Shapiro1998CompositionOA|2. Koenig's Theorem, Part
    I.><cite-detail|edcd|1.7>
  </theorem>

  <\lemma>
    <strong|(<verbatim|<em|The Simplicity Lemma><verbatim|>>)> The Koenig's
    function <math|\<phi\>*> is the only solution to the eigenvalue equation
    as all of the other solutions are constant multiples of powers of
    \<sigma\>
  </lemma>

  <subsection|Eigenfunctions of Compact Composition Operators>

  Compactness of a composition operator can be determined by determining how
  it maps the unit disc, and somehow the action of the operator is conjugate
  to a dilation of a Mobius transform acting on this \PKoenig domain\Q
  <math|S<around*|(|U|)>> where <math|U> is the unit disc.
  <cite-detail|shapiro1993composition|Ch.6 Compactness and Eigenfunctions>

  <\equation>
    <big|int><rsub|-\<pi\>><rsup|\<pi\>><around*|\||S<around*|(|e<rsup|i
    \<theta\>>|)>|\|><rsup|2>\<mathd\>\<theta\>=<frac|14 \<pi\>|5>=2.8 \<pi\>
  </equation>

  <subsubsection|The Frobenius-Perron Transfer Operator>

  <\definition>
    The (Frobenius-Perron) <verbatim|transfer operator><index|transfer
    operator><index|transfer operator><cite-detail|ds2|Ch9>, also known as
    the <verbatim|Koopman operator> <cite|Koopman1931>is defined as
    normalized sum over the inverse branches of an iteration function
    <math|f\<in\>C<rsup|1>>\ 

    <\equation>
      \<cal-K\> f<around*|(|x|)>=<big|sum><rsub|y\<in\>f<rsup|-1><around*|(|x|)>><frac|f<around*|(|y|)>|<around*|\||<wide|f|\<dot\>><around*|(|y|)>|\|>>
    </equation>

    which is a linear operator which determines how densities evolve under
    the action of <math|f<around*|(|x|)>>; There exists an invariant measure
    <math|\<varphi\>> of the map is the measure which is unchanged by the
    action of <math|f> and satisifies

    <\equation>
      \<cal-K\> \<varphi\><around*|(|x|)>=\<varphi\><around*|(|x|)>
    </equation>
  </definition>

  <subsubsection|Spectra of the Newton Map of the S Transform and Composition
  Operators>

  The transfer operator of the Newton map

  <\equation>
    N<rsub|S><around*|(|t|)>=t-<frac|S<around*|(|t|)>|<wide|S|\<dot\>><around*|(|t|)>>
  </equation>

  \ of the <math|S> transform<\footnote>
    From hereon <math|S> will be referred to as a (linear) operator or a
    transform when it is being applied to functions or other functionals and
    as just a regular meromorphic rational quartic function when its argument
    is real or complex variable.
  </footnote> is given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<cal-K\>
    N<rsub|S><around*|(|t|)>>|<cell|=<big|sum><rsub|s\<in\>N<rsup|-1><rsub|S><around*|(|t|)>><frac|N<rsub|S><around*|(|s|)>|<around*|\||<wide|N|\<dot\>><rsub|S><around*|(|s|)>|\|>>>>|<row|<cell|>|<cell|=<big|sum><rsub|s\<in\>N<rsup|-1><rsub|S><around*|(|t|)>><frac|s-<frac|S<around*|(|s|)>|<wide|S|\<dot\>><around*|(|s|)>>|<around*|\||<wide|N|\<dot\>><rsub|S><around*|(|s|)>|\|>>>>|<row|<cell|>|<cell|=\<ldots\>>>>>>
  </equation>

  which should be related to the transfer operator of the composition
  operator of the Newton map of X

  <\equation>
    <tabular|<tformat|<table|<row|<cell|>|<cell|\<cal-K\>
    N<rsub|X><around*|(|t|)>>|<cell|=<rsub|>\<cal-K\>N<rsub|C<rsub|Z><around*|(|S|)>><around*|(|t|)>>>|<row|<cell|>|<cell|>|<cell|=<big|sum><rsub|s\<in\>N<rsup|-1><rsub|X><around*|(|t|)>><frac|N<rsub|X><around*|(|s|)>|<around*|\||<wide|N|\<dot\>><rsub|X><around*|(|s|)>|\|>>>>>>>
  </equation>

  Spectra stuff here: <cite|cowen1994spectra>

  <subsection|Physical Interpretations of the Cauchy-Riemann Equations>

  The physical interpretation<cite-detail|krantz2012handbook|14.2.2 III> of
  the Cauchy\URiemann equations\ 

  <\equation>
    <frac|\<partial\>Re|\<partial\>x>=<frac|\<partial\>Im|\<partial\>y>
  </equation>

  <\equation>
    <frac|\<partial\>Re|\<partial\>y>=-<frac|\<partial\>Im|\<partial\>x>
  </equation>

  going back to Riemann's work on function theory<rsup|>
  <cite|klein2018riemann> is that the real part of an analytic function
  <math|f> is the velocity potential of an incompressible fluid flow in the
  complex plane and the its imaginary part is the corresponding stream
  function.\ 

  When the pair of twice continuously differentiable functions
  <math|<around*|{|Re<around*|(|f<around*|(|x+i
  y|)>|)>,Im<around*|(|f<around*|(|x+i y|)>|)>|}>> of <math|f> satisfies the
  Cauchy\URiemann equations its real part <math|Re<around*|(|f|)>> is its
  velocity potential and the gradient of the real part <math|\<nabla\>Re> is
  its velocity vector defined by

  <\equation>
    \<nabla\>Re=<frac|\<partial\>Re<around*|(|f<around*|(|x+i
    y|)>|)>|\<partial\>x>+i<frac|\<partial\>Re<around*|(|f<around*|(|x+i
    y|)>|)>|\<partial\>y>
  </equation>

  By differentiating the Cauchy\URiemann equations a second time, it is shown
  that real part solves<nbsp><hlink|Laplace's
  equation|https://en.wikipedia.org/wiki/Laplace%27s_equation>:

  <next-line>

  <\equation>
    <frac|\<partial\><rsup|2>Re<around*|(|f<around*|(|x+i
    y|)>|)>|\<partial\>x<rsup|2>>+<frac|\<partial\><rsup|2>Re<around*|(|f<around*|(|x+i
    y|)>|)>|\<partial\>y<rsup|2>>=0
  </equation>

  That is, the real part of an analytic function is harmonic which means that
  it is incompressible since the divergence of its gradient vanishes and can
  therefore go no lower. The imaginary part also satisfies the Laplace
  equation, by a similar analysis. The Cauchy\URiemann equations also imply
  that the dot product of the gradients of the real and imaginary parts
  vanishes

  <\equation>
    \<nabla\>Re \<cdummy\>\<nabla\>Im=0
  </equation>

  which indicates that the gradient of the real part must point along the
  streamlines of the flow where the imaginary part is constant
  <math|Im=const> and therefore the curves of constant real part
  <math|Re=const> are the corresponding orthogonal equipotential curves.

  <section|The Operator <math|S<rsup|a><rsub|f><around*|(|t|)>=tanh<around*|(|ln<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)>|)>>>

  <\definition>
    Let the operator which takes a complex analytic function from
    <math|<wide|\<bbb-C\>|\<bar\>>\<rightarrow\><wide|\<bbb-C\>|\<bar\>>> and
    returns the hyperbolic tangent of the logarithm of one minus the square
    of that function, divided by a scaling factor <math|a>, be defined by

    <\equation>
      S<rsup|a><rsub|f><around*|(|t|)>=S<rsup|a><around*|(|f<around*|(|t|)>|)>=tanh<around*|(|ln<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)>|)>=<dfrac|<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)><rsup|2>-1|<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)><rsup|2>+1>
    </equation>

    where <math|f<around*|(|t|)>\<in\><wide|\<bbb-C\>|\<bar\>>\<forall\>t\<in\><wide|\<bbb-C\>|\<bar\>>>
    is an analytic function of a single complex variable whose domain is the
    extended complex plane. If <math|a> is not specified then it is assumed
    to be equal to 1, e.g, <math|S<rsub|f><around*|(|t|)>=S<rsup|a><rsub|f><around*|(|t|)>>.When
    the function <math|f<around*|(|t|)>> is the identity function
    <math|f:t\<rightarrow\>t> then we have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|S<rsup|a><around*|(|t|)>>|<cell|=S<rsup|a><rsub|t\<rightarrow\>t><around*|(|t|)>>>|<row|<cell|>|<cell|=<dfrac|<around*|(|1-<around*|(|<frac|t|a>|)><rsup|2>|)><rsup|2>-1|<around*|(|1-<around*|(|<frac|t|a>|)><rsup|2>|)><rsup|2>+1>>>|<row|<cell|>|<cell|=1-<frac|2|1+<around*|(|1-<around*|(|<frac|t|a>|)><rsup|2>|)><rsup|2>>>>>>>
    </equation>

    which is a quartic, a rational (meromorphic) function of degree 4 from
    <math|<wide|\<bbb-C\>|\<bar\>>\<rightarrow\><wide|\<bbb-C\>|\<bar\>>>
    with a double-root at the origin.
  </definition>

  <\theorem>
    The function <math|S<rsub|t\<rightarrow\>t><around*|(|t|)>> is in the
    Hardy class <math|H<rsup|2>>

    <\proof>
      Recall that a function is in the Hardy class <math|H<rsup|p>> if\ 

      <\equation*>
        sup<rsub|0\<leqslant\>r\<less\>1><around*|(|<frac|<big|int><rsub|0><rsup|2\<pi\>><around*|\||f<around*|(|r
        e<rsup|i a>|)>|\|><rsup|p>\<mathd\>a|2
        \<pi\>>|)><rsup|<frac|1|p>>\<less\>\<infty\>
      </equation*>

      then let <math|p=2> and note that

      <\equation>
        <sqrt|<frac|1|2\<pi\>><big|int><around*|\||S<around*|(|r e<rsup|i
        a>|)>|\|><rsup|2>\<mathd\>x>=<sqrt|<frac|1|2
        \<pi\>><frac|2\<pi\><rsup|4><around*|(|r<rsup|8>-2*r<rsup|4>+8|)>|<around*|(|r<rsup|4>-2|)>*<around*|(|r<rsup|8>+4|)>>>
      </equation>

      is bounded <math|\<forall\>0\<leqslant\>r\<less\>1>

      \;
    </proof>
  </theorem>

  <subsection|The Curve <math|Re<around*|(|S<around*|(|t|)>|)>=0> is a
  Bernoullian Lemniscate>

  <\theorem>
    The zero set <math|<around*|{|t:Re<around*|(|S<around*|(|t|)>|)>=0|}>>of
    the real part <math|Re<around*|(|S<around*|(|t|)>|)>> of
    <math|S<around*|(|t|)>> where <math|t=x+i y> is a horizontally oriented
    lemniscate of Bernoulli, also known as a hyperbolic
    lemniscate<cite-detail|lawrence1972catalog|5.3 p.121>, at the origin with
    parameter <math|2>. That is,

    <\equation>
      <around*|{|<around*|(|x,y|)>:Re<around*|(|S<around*|(|x+i
      y|)>|)>=0|}>=<around*|{|<around*|(|x,y|)>:<around*|(|x<rsup|2>+y<rsup|2>|)><rsup|2>=2<around*|(|x<rsup|2>-y<rsup|2>|)>|}>
    </equation>

    <\proof>
      \;

      The parametric equations<cite|coxeter1989introduction> for the
      lemniscate of Bernoulli with scale parameter 2 are given by

      <\equation>
        <tabular|<tformat|<table|<row|<cell|x<around*|(|t|)>>|<cell|=2<frac|
        cos<around*|(|t|)>|1+sin<rsup|2><around*|(|t|)>>>>|<row|<cell|y<around*|(|t|)>>|<cell|=2<frac|
        sin<around*|(|t|)> cos<around*|(|t|)>|1+sin<rsup|2><around*|(|t|)>>=x<around*|(|t|)>
        sin<around*|(|t|)>>>>>>
      </equation>

      Let us combine the coordinate functions
      <math|<around*|(|x<around*|(|t|)>,y<around*|(|t|)>|)>\<in\>\<bbb-R\><rsup|2>>
      into an equivalent function <math|z<around*|(|t|)>\<in\><wide|\<bbb-C\>|\<bar\>>>

      <\equation>
        <tabular|<tformat|<table|<row|<cell|z<around*|(|t|)>>|<cell|=x<around*|(|t|)>+i
        y<around*|(|t|)>>>|<row|<cell|>|<cell|=<frac|2 cos<around*|(|t|)>|1-i
        sin<around*|(|t|)>>>>>>>
      </equation>

      where it can be shown that

      <\equation>
        <tabular|<tformat|<table|<row|<cell|S<around*|(|z<around*|(|t|)>|)>>|<cell|=S<rsub|z><around*|(|t|)>>>|<row|<cell|>|<cell|=S<around*|(|<frac|S
        cos<around*|(|t|)>|1-i sin<around*|(|t|)>>|)>>>|<row|<cell|>|<cell|=i<frac|32
        cos<around*|(|t|)><rsup|2> sin<around*|(|t|)>|20 cos<around*|(|2t|)>
        +cos<around*|(|4t|)>-13>>>>>>
      </equation>

      so that\ 

      <\equation>
        Re<around*|(|S<rsub|z><around*|(|<around*|\<nobracket\>|t|)>|\<nobracket\>>|)>=0\<forall\>t\<in\>\<bbb-R\>
      </equation>

      and thus <math|z<around*|(|t|)>> is a geodesic of the real part of
      <math|S>
    </proof>
  </theorem>

  \;

  <subsection|The Curve <math|Im<around*|(|S<around*|(|t|)>|)>=0> is a
  Conjugate Pair of Rectangular Hyperbolas>

  <\theorem>
    The zero set <math|<around*|{|t:Im<around*|(|S<around*|(|t|)>|)>=0|}>> of
    the imaginary part <math|Im<around*|(|S<around*|(|t|)>|)>> of
    <math|S<around*|(|t|)>> where <math|t=x+i y> \ is a conjugate pair of
    rectangular hyperbolas.

    \;

    <\equation>
      <around*|{|<around*|(|x,y|)>:Im<around*|(|S<around*|(|x+i
      y|)>|)>=<around*|{|<around*|(|x,y|)>:x<rsup|2>-y<rsup|2>=1|}>|}>
    </equation>

    <\proof>
      \;

      The parametric equations<cite|coxeter1989introduction> for the
      equilaterial (rectangular) hyperbola with unit parameter are given by

      <\equation>
        <tabular|<tformat|<table|<row|<cell|x<around*|(|t|)>>|<cell|=sec<around*|(|t|)>>|<cell|>>|<row|<cell|y<around*|(|t|)>>|<cell|=tan<around*|(|t|)>>|<cell|>>>>>
      </equation>

      which are combined into a complex-valued function

      <\equation>
        <tabular|<tformat|<table|<row|<cell|z<around*|(|t|)>>|<cell|=x<around*|(|t|)>+i
        y<around*|(|t|)>>>|<row|<cell|>|<cell|=sec<around*|(|t|)>+i
        tan<around*|(|t|)>>>>>>
      </equation>

      where it can be shown that

      <\equation>
        <tabular|<tformat|<table|<row|<cell|S<around*|(|z<around*|(|t|)>|)>>|<cell|=S<around*|(|sec<around*|(|t|)>+i
        tan<around*|(|t|)>|)>>>|<row|<cell|>|<cell|=-<frac|2
        (cos<around*|(|2t|)>-3)<rsup|2>|20 cos<around*|(|2t|)>
        +cos<around*|(|4t|)>-13>>>>>>
      </equation>

      so that\ 

      <\equation>
        Im<around*|(|S<around*|(|z<around*|(|t|)>|)>|)>=0\<forall\>t\<in\>\<bbb-R\>
      </equation>

      and thus <math|z<around*|(|t|)>> is a geodesic of the imaginary part of
      <math|S>

      \;
    </proof>
  </theorem>

  <subsection|Newton Maps and Flows of <math|S<rsub|f><around*|(|t|)>>>

  <\definition>
    Let <math|N<rsub|f><around*|(|t|)>> denote the <verbatim|Newton
    map><index|Newton map> of <math|f<around*|(|t|)>>

    <\equation>
      N<rsub|f><around*|(|t|)>=t-<frac|f<around*|(|t|)>|<wide|f|\<dot\>><around*|(|t|)>>
    </equation>
  </definition>

  <\definition>
    The Newton map <math|N<rsub|S<rsub|f>><around*|(|t|)>> of the composition
    <math|S<rsub|f><around*|(|t|)>=S<around*|(|f<around*|(|t|)>|)>> is a
    rational meromorphic function of <math|f<around*|(|t|)>> given by\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|N<rsub|S<rsub|f>><around*|(|t|)>>|<cell|=t-<frac|S<rsub|f><around*|(|t|)>|<wide|S|\<dot\>><rsub|f><around*|(|t|)>>>>|<row|<cell|>|<cell|=t-<frac|<frac|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1<rsup|>-f<around*|(|t|)><rsup|2>|)><rsup|2>+1>|<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>>>>|<row|<cell|>|<cell|=t-<frac|1|8><frac|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|1+f<around*|(|*t|)><rsup|2>|)><rsup|2>+1|)><rsup|2>*<around*|(|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|)>|f*<around*|(|t|)><wide|f|\<dot\>><around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)><around*|(|1+<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>|)>>>>>>><label|NS>
    </equation>

    where <math|<wide|S|\<dot\>><rsub|f><around*|(|t|)>> is the derivative of
    the composite function <math|S<around*|(|f<around*|(|t|)>|)>><index|functional
    derivative> given by

    <math|<\text>
      <\equation>
        <wide|S|\<dot\>><rsub|f><around*|(|t|)>=<frac|\<mathd\>|\<mathd\>t>S<around*|(|f<around*|(|t|)>|)>=*<wide|S|\<dot\>><around*|(|f<around*|(|t|)>|)><wide|f|\<dot\>><around*|(|t|)>=<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>><label|ds>
      </equation>
    </text>>

    which is just the usual derivative of S multiplied by the derivate of
    <math|f> which can be found with an application of the usual chain rule
    of calculus and simplifying the algebra by combining like terms,
    factoring and rearranging terms.

    \;
  </definition>

  <\theorem>
    The Newton map of <math|S<rsub|f>> transforms superattractive
    <math|<around*|(|\<lambda\>=0|)>> fixed-points of
    \ <math|N<rsub|f><around*|(|t|)>> to geometrically attractive
    fixed-points of <math|N<rsub|S<rsub|f>><around*|(|t|)>>

    <\proof>
      \;

      There is geometrically attractive fixed-point at <math|t=0> with
      multiplier equal to

      <\equation>
        \<lambda\><rsub|N<rsub|S<rsub|f>><around*|(|0|)>>=<around*|\||1-<frac|1+\<lambda\><rsub|N<rsub|f>><around*|(|0|)>|2>|\|>
      </equation>

      TODO: prove this.. apply S to some other functions and see how it
      transforms the multipliers of the fixed-points\ 

      \;
    </proof>
  </theorem>

  <subsubsection|Factoring Out The Double-Root at the Origin of
  <math|N<rsub|S<rsub|f>><around*|(|t|)>>>

  If <math|m=m<rsub|f><around*|(|\<alpha\>|)>> is the multiplicity of the
  root of <math|f> at the point <math|\<alpha\>> then <math|f> factorizes as\ 

  <\equation>
    f<around*|(|x|)>=<around*|(|x-\<alpha\>|)><rsup|m>g<around*|(|x|)>
  </equation>

  where <math|g<around*|(|\<alpha\>|)>=0>.

  <subsubsection|The Newton Flow>

  <\definition>
    The <verbatim|Newton flow><index|Newton flow>
    <math|\<cal-N\><rsub|S<rsub|>><around*|(|f|)>> of
    <math|S<rsup|><rsub|f><around*|(|t|)>> is defined by the differential
    equation

    <\equation>
      <wide|z|\<dot\>><around*|(|t|)>=<frac|\<mathd\>|\<mathd\>t>z<around*|(|t|)>=-<frac|S<rsub|f><around*|(|z<around*|(|t|)>|)>|<wide|S|\<dot\>><rsub|f><around*|(|z<around*|(|t|)>|)>>
    </equation>

    which is approximated by the relaxed Newton method where the limit of the
    step size is taken towards zero , it is defined by\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<cal-N\><rsup|h><rsub|S><around*|(|f|)>>|<cell|=t-h<frac|S<rsub|f><around*|(|t|)>|<wide|S|\<dot\>><rsub|f><around*|(|t|)>>>>|<row|<cell|>|<cell|=t-<frac|h<frac|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1<rsup|>-f<around*|(|t|)><rsup|2>|)><rsup|2>+1>|<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>>>>|<row|<cell|>|<cell|=t-<frac|h|8><frac|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|1+f<around*|(|*t|)><rsup|2>|)><rsup|2>+1|)><rsup|2>*<around*|(|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|)>|f*<around*|(|t|)><wide|f|\<dot\>><around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)><around*|(|1+<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>|)>>>>>>>
    </equation>

    <label|rnm>

    where <math|h> is taken to be a small number which is used to approximate
    the flow <math|<wide|z|\<dot\>><around*|(|t|)>>\ 
  </definition>

  The Newton flow <math|\<cal-N\><around*|(|f|)>> has the drawback that it is
  undefined at the critical points of <math|f>. To remedy this situation
  there exists the desingularized Newton flow for entire functions.\ 

  <subsubsection|The Desingularized Newton Flow For Entire Functions>

  <\definition>
    If <math|f> is an entire function then an equivalent
    <verbatim|desingularized Newton flow<index|desingularized Newton flow
    (for entire functions)>> which is devoid of singularities at the critical
    points is given by

    <\equation>
      <wide|z|\<dot\>><around*|(|t|)>=-<wide|<wide|f|\<dot\>><around*|(|z<around*|(|t|)>|)>|\<bar\>>f<around*|(|z<around*|(|t|)>|)>
    </equation>

    <cite|jongen1988continuous>
  </definition>

  The function of interest here, <math|S<rsub|f>>, is meromorphic and
  therefore will be divergent at the poles of <math|S<rsub|f>>. To rectify
  this situation we can apply the continuous Newton method for mermorphic
  functions which defines an equivalent real holomorphic vector field devoid
  of any singularities.

  <subsubsection|The Continuous Desingularized Newton Flow for Meromorphic
  Functions>

  <\lemma>
    <label|dl>(Desingularization Lemma) The flow defined by

    <\equation>
      <wide|\<cal-N\>|\<bar\>><around*|(|f|)>=-<frac|<wide|<wide|f|\<dot\>>|\<bar\>><around*|(|z|)>f<around*|(|z|)>|<around*|(|1+<around*|\||f<around*|(|z|)>|\|><rsup|4>|)>*><label|nm>
    </equation>

    is a <verbatim|real analytic vector field> <cite|Peitgen1988GlobalAO>
    defined on the whole complex plane <math|\<bbb-C\>> with the properties
    that

    <\enumerate-roman>
      <item>Trajectories of <math|\<cal-N\>> are also trajectories of
      <math|<wide|\<cal-N\>|\<bar\>><around*|(|f|)>>

      <item>A critical point of <math|f> is an equilibrium state for
      <math|<wide|\<cal-N\>|\<bar\>><around*|(|f|)>>

      <item><math|<wide|\<cal-N\>|\<bar\>><around*|(|f|)>=-<wide|\<cal-N\>|\<bar\>><around*|(|<frac|1|f>|)>>
    </enumerate-roman>
  </lemma>

  <subsubsection|The Continuous Newton Flow
  <math|<wide|\<cal-N\>|\<bar\>><around*|(|S<rsub|f>|)>> and Its
  Approximation <math|<wide|\<cal-N\>|\<bar\>><rsup|h><around*|(|S<rsub|f>|)>>>

  Apply Lemma <reference|dl> to define a real analytic vector field on
  <math|\<bbb-C\>>

  <\equation>
    <wide|\<cal-N\>|\<bar\>><around*|(|S<rsub|f>|)>=-<frac|<wide|<wide|S<rsub|f>|\<dot\>>|\<bar\>><around*|(|z|)>S<rsub|f><around*|(|z|)>|<around*|(|1+<around*|\||S<rsub|f><around*|(|z|)>|\|><rsup|4>|)>*><label|nm>
  </equation>

  which is approximated by a similiarly modified relaxed Newton's method\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<cal-N\><rsup|h><around*|(|S<rsub|f>|)>>|<cell|=t-h<frac|<wide|<wide|S|\<dot\>>|\<bar\>><rsub|f><around*|(|t|)>S<rsub|f><around*|(|t|)>|<around*|(|1+<around*|\||S<rsub|f><around*|(|z|)>|\|><rsup|4>|)>>>>>>>
  </equation>

  where <math|h> is accuracy of the solution. TODO: insert some figures

  <section|The Riemann Zeta <math|\<zeta\>> Function>

  <\definition>
    The Riemann zeta function is defined by\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<zeta\><around*|(|s|)>>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>\<forall\>Re<around*|(|s|)>\<gtr\>1>>|<row|<cell|>|<cell|=<frac|1|1-2<rsup|1-s>><big|sum><rsub|n=1><rsup|\<infty\>><frac|<around*|(|-1|)><rsup|n+1>|n<rsup|s>>\<forall\>Re<around*|(|s|)>\<gtr\>0>>>>>
    </equation>

    and its argument has a representation as

    <\equation>
      S<around*|(|t|)>=<frac|1|\<pi\>>arg<around*|(|\<zeta\><around*|(|<frac|1|2>+i
      t|)>|)>=<frac|1|\<pi\>><big|int><rsub|<frac|1|2>><rsup|\<infty\>>Im<around*|(|<frac|<wide|\<zeta\>|\<dot\>><around*|(|\<sigma\>+i
      t|)>|\<zeta\><around*|(|\<sigma\>+i
      t|)>>|)>\<mathd\>\<sigma\>\<forall\>t\<in\>\<bbb-R\>\<backslash\><around*|{|0|}>
    </equation>

    <index|Riemann zeta function>

    \;
  </definition>

  <subsection|The Riemann Hypothesis>

  <\conjecture>
    <label|rh>(The Riemann Hypothesis)

    Bernhard Riemann conjectured <cite|riemann> that,

    <\equation*>
      <around*|{|Re<around*|(|t|)>=<frac|1|2>:\<zeta\><around*|(|t|)>=0\<forall\>t\<neq\>-2n\<forall\>t\<in\><wide|\<bbb-C\>|\<bar\>>,n\<in\>\<bbb-N\><rsup|+>|}>
    </equation*>

    ,all of the roots that are not negative even integers where
    <math|\<zeta\><around*|(|-2n|)>=0> all lie on the <verbatim|critical
    line><index|critical line> <math|Re<around*|(|<frac|1|2>|)>> in the
    complex plane such that <math|\<zeta\><around*|(|\<sigma\>+i s|)>=0> only
    when <math|\<sigma\>=<frac|1|2>> where
    <math|\<bbb-R\><rsup|+>\<ni\>s\<gtr\>0>.
  </conjecture>

  <subsubsection|Lines of Constant Phase and the Riemann Hypothesis>

  The following theorem is the main result of <cite|constantPhaseRH>.

  <\theorem>
    \;

    <\enumerate-numeric>
      <item>If all lines of constant phase
      <math|arg<around*|(|\<zeta\><around*|(|t|)>|)>=>kn of <math|\<zeta\>>
      where <math|k\<in\>\<bbb-N\>> merge with the critical line

      OR

      <item>all points where <math|<wide|\<zeta\>|\<dot\>><around*|(|t|)>>
      vanishes are located on the critical line and the phases of
      <math|\<zeta\>> at consecutive zeros of <math|<wide|\<zeta\>|\<dot\>>>
      differs by <math|\<pi\>>
    </enumerate-numeric>

    \ then the Riemann Hypothesis (<reference|rh>) is true.
  </theorem>

  <subsection|The Hardy Z Function>

  <\definition>
    (The Gamma and Log Gamma functions)

    Let

    <\equation>
      \<Gamma\><around*|(|t|)>=<around*|(|t-1|)>!=<big|int><rsub|0><rsup|\<infty\>>x<rsup|t-1>
      e<rsup|-x>\<mathd\>x\<forall\>Re<around*|(|t|)>\<gtr\>0
    </equation>

    be the gamma function<index|gamma function> and

    <\equation>
      ln\<Gamma\><around*|(|t|)>=ln<around*|(|\<Gamma\><around*|(|t|)>|)>
    </equation>

    \ be the principle branch of the logarithm of the <math|\<Gamma\>>
    function.
  </definition>

  <subsubsection|The Phase of<math|> <math|\<zeta\>>>

  The <math|Riemann-Siegel> theta function <math|\<vartheta\><around*|(|t|)>>
  corresponds to the smooth part of the phase of the zeta function which has
  a jump discontinuity when <math|t> is equal to the imaginary part of a
  Riemann zero on the critical line.

  <\definition>
    (The Riemann-Siegel vartheta function)\ 

    Let

    <\equation>
      \<vartheta\><around*|(|t|)>=-<frac|i|2><around*|(|ln
      \<Gamma\><around*|(|<frac|1|4>+<frac|i t|2>|)>-ln
      \<Gamma\><around*|(|<frac|1|4>-<frac|i
      t|2>|)>|)>-<frac|ln<around*|(|\<pi\>|)> t|2>
    </equation>

    be the the Riemann-Siegel (var)theta function<index|Riemann-Siegel
    (var)theta function>.
  </definition>

  <\definition>
    (The Hardy Z function)

    Let

    <\equation>
      Z<around*|(|t|)>=e<rsup|i \<vartheta\><around*|(|t|)>>\<zeta\><around*|(|<frac|1|2>+i
      t|)>
    </equation>

    be the Hardy Z function which has the property that
    <math|Z<around*|(|t|)>> is real when <math|t> is real, that is,
    <math|Z<around*|(|t|)>\<in\>\<bbb-R\>\<forall\>t\<in\>\<bbb-R\>>
    independently of the Riemann hypothesis. \ <index|Hardy Z function>
  </definition>

  <\big-figure|<image|zetaKnowsAboutVartheta.eps|416.25pt|195.75pt||>>
    <math|Illustration> of the relationship between vartheta
    <math|\<vartheta\>> and the argument of zeta <math|\<zeta\>> on the
    critical line
  </big-figure>

  <subsection|The Function <math|X<around*|(|t|)>=<around*|(|S\<circ\>Z|)><around*|(|t|)>>>

  <\definition>
    (The X function)

    Let <math|X<around*|(|t|)>> be defined as the composition of the <math|S>
    function with the Hardy <math|Z> function

    <\equation>
      X<around*|(|t|)>=C<rsub|Z><around*|(|S|)><around*|(|t|)>=<around*|(|S\<circ\>Z|)><around*|(|t|)>=S<around*|(|Z<around*|(|t|)>|)>=<frac|<around*|(|1-Z<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1-Z<around*|(|t|)><rsup|2>|)><rsup|2>+1>
    </equation>
  </definition>

  <subsubsection|Integration Along a Curve: A Newton Iteration for the Angle>

  In order to find an explicit expression for the angle
  <math|\<theta\><rsub|m><around*|(|h|)>> in the implicit formula Formula
  (<reference|angle>) we can use a modified Newton's method that converges to
  the angle in which to step given a basepoint <math|t>, a direction
  <math|a>, and a magnitude <math|h> to minimize the real part of a function
  <math|f>.

  \;

  <\with|font-base-size|14>
    <\definition>
      Let the Newton map for the roots of the real part of\ 

      <\equation>
        X<around*|(|t+h e<rsup|i a>|)>
      </equation>

      be defined by

      <\equation*>
        <tabular|<tformat|<cwith|1|2|1|2|font-base-size|12>|<table|<row|<cell|<label|N>N<rsub|\<theta\><rsub|m>><around*|(|a<rsub|m,k>;t,h|)>>|<cell|=frac<around*|(|a<rsub|m,k-1>+tanh<around*|(|<frac|Re<around*|(|X<around*|(|t+h
        e<rsup|i a>|)>|)>|Re<around*|(|<frac|\<mathd\>|\<mathd\>a>X<around*|(|t+h
        e<rsup|i a>|)>|)><rsub|>>|)><rsub|a=a<rsub|m,k-1>><rsub|>|)>>>|<row|<cell|>|<cell|=frac<around*|(|a<rsub|m,k-1>+tanh<around*|(|<frac|Re<around*|(|X<around*|(|t+h
        e<rsup|i a>|)>|)>|\<pi\> Im<around*|(|<wide|X|\<dot\>><around*|(|t+h
        e<rsup|i a>|)> h e<rsup|i \ a>|)><rsub|>>|)><rsub|a=a<rsub|m,k-1>><rsub|>|)><with|font-series|bold|>>>>>>
      </equation*>

      TODO: this takes a special form, see\ 
    </definition>
  </with>

  where the initial <math|<around*|(|k=0|)>> angle of the first(<math|m=0>)
  step of length <math|h> is <math|a<rsub|m,0>=<frac|\<theta\><rsub|m-1>|\<pi\>>>
  where we normalize by <math|\<pi\>> since the variable has domain
  <math|<around*|[|-1,1|]>> (the angle at the previous point ) or
  <math|a<rsub|0,0>=<frac|3|4>> which is \ -45\F for the initial element of
  the sequence wheen <math|m=0>, that is, the (initial)boundary conditions
  are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|a<rsub|m,0>>|<cell|=<choice|<tformat|<table|<row|<cell|<frac|3|4>>|<cell|m=0>>|<row|<cell|<frac|\<theta\><rsub|m-1>|\<pi\>>>|<cell|m\<geqslant\>1>>>>>>>>>>
  </equation>

  and the corresponding curve is traversed in a positive clockwise direction
  moving initially into the upper-left quadrant . Let the angle at the
  <math|m>-th step (of length <math|h>) be defined as the limit

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<theta\><rsub|m>>|<cell|=
    \<theta\><rsub|m><around*|(|t,h|)>\<in\><around*|[|-\<pi\>,+\<pi\>|]>>>|<row|<cell|>|<cell|=\<pi\>lim<rsub|k\<rightarrow\>\<infty\>>N<rsub|\<theta\><rsub|m>><around*|(|a<rsub|m,k>;t,h|)>>>>>>
  </equation>

  which is dependent on the basepoint <math|t> and radius <math|h>, but the
  when the dependence is not written as <math|\<theta\><rsub|m><around*|(|t,h|)>>
  it is still implied unless otherwise noted. The notation
  <math|<wide|Y|\<dot\>><around*|(|t|)>=<frac|\<mathd\>|\<mathd\>t>Y<around*|(|t|)>>
  is the more concise notation for first-deriative.

  <subsubsection|Roots of <math|X<around*|(|t|)>> on the Real Line>

  The critical line of the zeta function <math|Re<around*|(|s|)>=<frac|1|2>>
  corresponds to the real line <math|Im<around*|(|s|)>=0> of the Z and X
  functions

  <section|Linearizing >

  <\definition>
    Let the Newton map of the shifted <math|X> function\ 

    <\equation>
      X<rsub|n><around*|(|t|)>=X<around*|(|z<rsub|n>+t|)>
    </equation>

    where <math|z<rsub|n>> is the <math|n>-th root of the Hardy Z function on
    the real line, starting with\ 

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|z<rsub|1>>|<cell|\<cong\><code|14.1347251>\<ldots\>>>|<row|<cell|z<rsub|2>>|<cell|=<code|21.0220396>\<ldots\>>>|<row|<cell|\<ldots\>>|<cell|\<ldots\>>>>>>
    </equation*>

    , be denoted

    <\equation>
      <tabular|<tformat|<table|<row|<cell|N<rsub|X<rsub|z<rsub|n>>><around*|(|t|)>>|<cell|=t-<frac|X<rsub|z<rsub|n>><around*|(|t|)>|<wide|X|\<dot\>><rsub|z<rsub|n>><around*|(|t|)>>>>>>>
    </equation>

    TODO: this has nice symmetric factorized form, see (<reference|NS>)
  </definition>

  <section|Appendix>

  <subsection|The Spectral Theorem>

  <\theorem>
    The Spectral Theorem

    Let <math|U:\<cal-S\><around*|(|\<bbb-R\><rsup|n>|)>\<rightarrow\>\<cal-S\><around*|(|\<bbb-R\><rsup|n>|)>>
    be unitary then <math|U> extends uniquely to a unitary operator on all of
    <math|L<rsup|2><around*|(|\<bbb-R\><rsup|n>|)>> and all generalized
    eigenvalues <math|\<lambda\>> lie on the unit circle
    <math|<around*|\||\<lambda\>|\|>=1>. The space
    <math|L<rsup|2><around*|(|\<bbb-R\><rsup|n>|)>> can be expressed as a
    direct integral\ 

    <\equation>
      <big|int><rsub|<around*|\||\<lambda\>|\|>=1>\<cal-H\><around*|(|\<lambda\>|)>d\<mu\><around*|(|\<lambda\>|)>
    </equation>

    of Hilbert spaces <math|\<cal-H\><around*|(|\<lambda\>|)><wide*|\<subset\>|\<wide-bar\>>E<rsub|\<lambda\>>>
    so that <math|U> sends the function <math|h\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|n>|)>>
    to the function <math|U h> with <math|\<lambda\>>-component\ 

    <\equation>
      <around*|(|U h|)>=\<lambda\> h<rsub|\<lambda\>>\<in\>\<cal-H\><around*|(|\<lambda\>|)>
    </equation>

    and its set of generized eigenvectors forms a complete basis.
    <cite-detail|MonsterMoonshine|Theorem 1.3.2>
  </theorem>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|17>
      <bibitem*|1><label|bib-HilbertPrimer>C.<nbsp>Alabiso<localize| and
      >I.<nbsp>Weiss. <newblock><with|font-shape|italic|A Primer on Hilbert
      Space Theory: Linear Spaces, Topological Spaces, Metric Spaces, Normed
      Spaces, and Topological Groups>. <newblock>UNITEXT for Physics.
      Springer International Publishing, 2014.<newblock>

      <bibitem*|2><label|bib-edcd>D.S.<nbsp>Alexander,
      F.<nbsp>Iavernaro<localize|, and >A.<nbsp>Rosa.
      <newblock><with|font-shape|italic|Early Days in Complex Dynamics: A
      History of Complex Dynamics in One Variable During 1906-1942>.
      <newblock>History of mathematics. American Mathematical Society,
      2012.<newblock>

      <bibitem*|3><label|bib-cowen1994spectra>Carl<nbsp>C Cowen<localize| and
      >Barbara<nbsp>D MacCluer. <newblock>Spectra of some composition
      operators. <newblock><with|font-shape|italic|Journal of Functional
      Analysis>, 125(1):223\U251, 1994.<newblock>

      <bibitem*|4><label|bib-coxeter1989introduction>H.S.M.<nbsp>Coxeter<localize|
      and >H.S.M.<nbsp>Coxeter. <newblock><with|font-shape|italic|Introduction
      to Geometry>. <newblock>Wiley Classics Library. Wiley, 1989.<newblock>

      <bibitem*|5><label|bib-MonsterMoonshine>Terry Gannon.
      <newblock><with|font-shape|italic|Moonshine Beyond the Monster: The
      Bridge Connecting Algebra, Modular Forms, and Physics>.
      <newblock>Cambridge University Press, Cambridge Monographs on
      Mathematical Physics, 2006.<newblock>

      <bibitem*|6><label|bib-jongen1988continuous>H<nbsp>Th Jongen, Peter
      Jonker<localize|, and >Frank Twilt. <newblock>The continuous,
      desingularized newton method for meromorphic functions.
      <newblock><localize|In ><with|font-shape|italic|Newton's Method and
      Dynamical Systems>, <localize|pages >81\U121. Springer, 1988.<newblock>

      <bibitem*|7><label|bib-klein2018riemann>Felix Klein.
      <newblock><with|font-shape|italic|On Riemann's theory of algebraic
      functions and their integrals>. <newblock>Cambridge: Macmillan and
      Bowes, 1893.<newblock>

      <bibitem*|8><label|bib-Koopman1931>B.<nbsp>O.<nbsp>Koopman.
      <newblock>Hamiltonian systems and transformation in hilbert space.
      <newblock><with|font-shape|italic|Proceedings of the National Academy
      of Sciences>, 17(5):315\U318, 1931.<newblock>

      <bibitem*|9><label|bib-krantz2012handbook>S.G.<nbsp>Krantz.
      <newblock><with|font-shape|italic|Handbook of Complex Variables>.
      <newblock>Birkhauser Boston, 2012.<newblock>

      <bibitem*|10><label|bib-lawrence1972catalog>J.D.<nbsp>Lawrence<localize|
      and >D.L.<nbsp>Lawrence. <newblock><with|font-shape|italic|A Catalog of
      Special Plane Curves>. <newblock>Dover Books on Mathematics. Dover
      Publications, 1972.<newblock>

      <bibitem*|11><label|bib-Milnor2006>John Milnor.
      <newblock><with|font-shape|italic|Dynamics in One Complex Variable>.
      <newblock>Annals of Mathematics Studies 160. Princeton University
      Press, 2nd<localize| edition>, 2006.<newblock>

      <bibitem*|12><label|bib-Peitgen1988GlobalAO>Heinz-Otto Peitgen, Michael
      Prufer<localize|, and >Klaus Schmitt. <newblock>Global aspects of the
      continuous and discrete newton method: a case study.
      <newblock><with|font-shape|italic|Acta Applicandae Mathematicae>,
      13:123\U202, 1988.<newblock>

      <bibitem*|13><label|bib-riemann>Berhhard Riemann. <newblock>Ueber die
      anzahl der primzahlen unter einer gegebenen grosse (on the number of
      prime numbers below a given size). <newblock><with|font-shape|italic|Monatsberichte
      der Berliner Akademie>, R1:145, 1859.<newblock>

      <bibitem*|14><label|bib-constantPhaseRH>Wolfgang<nbsp>P Schleich, Iva
      Bezd¥ková, Moochan<nbsp>B Kim, Paul<nbsp>C Abbott, Helmut Maier,
      Hugh<nbsp>L Montgomery<localize|, and >John<nbsp>W Neuberger.
      <newblock>Equivalent formulations of the riemann hypothesis based on
      lines of constant phase. <newblock><with|font-shape|italic|Physica
      Scripta>, 93(6):65201, 2018.<newblock>

      <bibitem*|15><label|bib-Shapiro1998CompositionOA>J.<nbsp>H.<nbsp>Shapiro.
      <newblock>Composition operators and schroder's functional equation.
      <newblock><with|font-shape|italic|Contemporary Mathematics>,
      (213):213\U228, 1998.<newblock>

      <bibitem*|16><label|bib-shapiro1993composition>J.H.<nbsp>Shapiro.
      <newblock><with|font-shape|italic|Composition Operators and Classical
      Function Theory>. <newblock>Universitext (Berlin. Print).
      Springer-Verlag, 1993.<newblock>

      <bibitem*|17><label|bib-ds2>Yakov Sinai.
      <newblock><with|font-shape|italic|Dynamical Systems II: Ergodic Theory
      with Applications to Dynamical Systems and Statistical Mechanics>.
      <newblock>Springer-Verlag, 1989.<newblock>
    </bib-list>
  </bibliography>

  <\the-index|idx>
    <index+1|critical line|<pageref|auto-28>>

    <index+1|desingularized Newton flow (for entire
    functions)|<pageref|auto-22>>

    <index+1|functional derivative|<pageref|auto-17>>

    <index+1|gamma function|<pageref|auto-31>>

    <index+1|Hardy Z function|<pageref|auto-34>>

    <index+1|Koenig's function|<pageref|auto-5>>

    <index+1|Newton flow|<pageref|auto-20>>

    <index+1|Newton map|<pageref|auto-16>>

    <index+1|Riemann zeta function|<pageref|auto-26>>

    <index+1|Riemann-Siegel (var)theta function|<pageref|auto-33>>

    <index+1|transfer operator|<pageref|auto-8>>
  </the-index>
</body>

<\initial>
  <\collection>
    <associate|info-flag|none>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|legal>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|N|<tuple|46|8>>
    <associate|NS|<tuple|29|5>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.2.2|2>>
    <associate|auto-11|<tuple|1.3|3>>
    <associate|auto-12|<tuple|2|3>>
    <associate|auto-13|<tuple|2.1|4>>
    <associate|auto-14|<tuple|2.2|4>>
    <associate|auto-15|<tuple|2.3|5>>
    <associate|auto-16|<tuple|Newton map|5>>
    <associate|auto-17|<tuple|functional derivative|5>>
    <associate|auto-18|<tuple|2.3.1|5>>
    <associate|auto-19|<tuple|2.3.2|5>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-20|<tuple|Newton flow|5>>
    <associate|auto-21|<tuple|2.3.3|6>>
    <associate|auto-22|<tuple|desingularized Newton flow (for entire
    functions)|6>>
    <associate|auto-23|<tuple|2.3.4|6>>
    <associate|auto-24|<tuple|2.3.5|6>>
    <associate|auto-25|<tuple|3|6>>
    <associate|auto-26|<tuple|Riemann zeta function|6>>
    <associate|auto-27|<tuple|3.1|6>>
    <associate|auto-28|<tuple|critical line|6>>
    <associate|auto-29|<tuple|3.1.1|6>>
    <associate|auto-3|<tuple|1.1|2>>
    <associate|auto-30|<tuple|3.2|7>>
    <associate|auto-31|<tuple|gamma function|7>>
    <associate|auto-32|<tuple|3.2.1|7>>
    <associate|auto-33|<tuple|Riemann-Siegel (var)theta function|7>>
    <associate|auto-34|<tuple|Hardy Z function|7>>
    <associate|auto-35|<tuple|2|7>>
    <associate|auto-36|<tuple|3.3|7>>
    <associate|auto-37|<tuple|3.3.1|7>>
    <associate|auto-38|<tuple|3.3.2|8>>
    <associate|auto-39|<tuple|4|8>>
    <associate|auto-4|<tuple|1.1.1|2>>
    <associate|auto-40|<tuple|5|8>>
    <associate|auto-41|<tuple|5.1|8>>
    <associate|auto-42|<tuple|52|9>>
    <associate|auto-43|<tuple|17|9>>
    <associate|auto-5|<tuple|Koenig's function|2>>
    <associate|auto-6|<tuple|1.2|2>>
    <associate|auto-7|<tuple|1.2.1|2>>
    <associate|auto-8|<tuple|transfer operator|2>>
    <associate|auto-9|<tuple|transfer operator|2>>
    <associate|bib-HilbertPrimer|<tuple|1|9>>
    <associate|bib-Koopman1931|<tuple|8|9>>
    <associate|bib-Milnor2006|<tuple|11|9>>
    <associate|bib-MonsterMoonshine|<tuple|5|9>>
    <associate|bib-Peitgen1988GlobalAO|<tuple|12|9>>
    <associate|bib-Shapiro1998CompositionOA|<tuple|15|9>>
    <associate|bib-constantPhaseRH|<tuple|14|9>>
    <associate|bib-cowen1994spectra|<tuple|3|9>>
    <associate|bib-coxeter1989introduction|<tuple|4|9>>
    <associate|bib-ds2|<tuple|17|9>>
    <associate|bib-edcd|<tuple|2|9>>
    <associate|bib-jongen1988continuous|<tuple|6|9>>
    <associate|bib-klein2018riemann|<tuple|7|9>>
    <associate|bib-krantz2012handbook|<tuple|9|9>>
    <associate|bib-lawrence1972catalog|<tuple|10|9>>
    <associate|bib-riemann|<tuple|13|9>>
    <associate|bib-shapiro1993composition|<tuple|16|9>>
    <associate|dl|<tuple|15|6>>
    <associate|ds|<tuple|30|5>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnr-1|<tuple|1|2>>
    <associate|kc|<tuple|3|2>>
    <associate|nm|<tuple|37|6>>
    <associate|rh|<tuple|17|6>>
    <associate|rnm|<tuple|34|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      HilbertPrimer

      Milnor2006

      Milnor2006

      Shapiro1998CompositionOA

      edcd

      shapiro1993composition

      ds2

      Koopman1931

      cowen1994spectra

      krantz2012handbook

      klein2018riemann

      lawrence1972catalog

      coxeter1989introduction

      coxeter1989introduction

      jongen1988continuous

      Peitgen1988GlobalAO

      riemann

      constantPhaseRH

      MonsterMoonshine
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        TODO: insert arb4j generated figures here showing the traces of the
        real and imaginary zero loci of each of the mentioned functions
      </surround>|<pageref|auto-2>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2>|>
        <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|Illustration>>
        of the relationship between vartheta <with|color|<quote|dark
        red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<vartheta\>>>
        and the argument of zeta <with|color|<quote|dark
        red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<zeta\>>> on the
        critical line
      </surround>|<pageref|auto-35>>
    </associate>
    <\associate|idx>
      <tuple|<tuple|Koenig's function>|<pageref|auto-5>>

      <tuple|<tuple|transfer operator>|<pageref|auto-8>>

      <tuple|<tuple|transfer operator>|<pageref|auto-9>>

      <tuple|<tuple|Newton map>|<pageref|auto-16>>

      <tuple|<tuple|functional derivative>|<pageref|auto-17>>

      <tuple|<tuple|Newton flow>|<pageref|auto-20>>

      <tuple|<tuple|desingularized Newton flow (for entire
      functions)>|<pageref|auto-22>>

      <tuple|<tuple|Riemann zeta function>|<pageref|auto-26>>

      <tuple|<tuple|critical line>|<pageref|auto-28>>

      <tuple|<tuple|gamma function>|<pageref|auto-31>>

      <tuple|<tuple|Riemann-Siegel (var)theta function>|<pageref|auto-33>>

      <tuple|<tuple|Hardy Z function>|<pageref|auto-34>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Schröder Equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Koenig's Linearization
      Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Eigenfunctions of Compact
      Composition Operators <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>The Frobenius-Perron
      Transfer Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Spectra of the Newton Map
      of the S Transform and Composition Operators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Physical Interpretations of
      the Cauchy-Riemann Equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Operator <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|S<rsup|a><rsub|f><around*|(|t|)>=tanh<around*|(|ln<around*|(|1-<around*|(|<frac|f<around*|(|t|)>|a>|)><rsup|2>|)>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The Curve
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|Re<around*|(|S<around*|(|t|)>|)>=0>>
      is a Bernoullian Lemniscate <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>The Curve
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|Im<around*|(|S<around*|(|t|)>|)>=0>>
      is a Conjugate Pair of Rectangular Hyperbolas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Newton Maps and Flows of
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|S<rsub|f><around*|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|2.3.1<space|2spc>Factoring Out The
      Double-Root at the Origin of <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|N<rsub|S<rsub|f>><around*|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|2.3.2<space|2spc>The Newton Flow
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|2.3.3<space|2spc>The Desingularized Newton
      Flow For Entire Functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|2tab>|2.3.4<space|2spc>The Continuous
      Desingularized Newton Flow for Meromorphic Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|2tab>|2.3.5<space|2spc>The Continuous Newton Flow
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|\<cal-N\>|\<bar\>><around*|(|S<rsub|f>|)>>>
      and Its Approximation <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|<wide|\<cal-N\>|\<bar\>><rsup|h><around*|(|S<rsub|f>|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Riemann Zeta <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<zeta\>>>
      Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>The Riemann Hypothesis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|2tab>|3.1.1<space|2spc>Lines of Constant Phase
      and the Riemann Hypothesis <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>The Hardy Z Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|2tab>|3.2.1<space|2spc>The Phase
      of<with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|>>
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<zeta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>The Function
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|X<around*|(|t|)>=<around*|(|S\<circ\>Z|)><around*|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|2tab>|3.3.1<space|2spc>Integration Along a Curve:
      A Newton Iteration for the Angle <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      <with|par-left|<quote|2tab>|3.3.2<space|2spc>Roots of
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|X<around*|(|t|)>>>
      on the Real Line <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Linearizing
      > <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>The Spectral Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Index>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>