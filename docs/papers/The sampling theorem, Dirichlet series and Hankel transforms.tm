<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The sampling theorem, Dirichlet series and Hankel
  transforms>|<doc-author|<author-data|<author-name|Dieter
  Klusch>|<author-affiliation|Institut für Mathematik I (WE 1), Freie
  Universität Berlin, Germany>>>|<doc-date|Received 9 April
  1991<next-line>Revised 19 December 1991>>

  <abstract-data|<\abstract>
    Some very surprising relations between fundamental theorems and formulas
    of signal analysis, of analytic number theory and of applied analysis are
    presented. It is shown that generalized forms of the classical
    Whittaker-Kotelnikov-Shannon sampling theorem as well as of the
    Brown-Butzer-Splettstöÿer approximate sampling expansion for
    non-band-limited signal functions can be deduced via the theory of
    Dirichlet series with functional equations from a new summation formula
    for Hankel transforms. This counterpart to Poisson's summation formula is
    shown to be essentially ``equivalent'' to the famous functional equation
    of Riemann's zeta-function, to the ``modular relation'' of the
    theta-function, to the Nielsen-Doetsch summation formula for Bessel
    functions and to the partial fraction expansion of the periodic Hilbert
    kernel.
  </abstract>>

  <no-indent><with|font-series|bold|Keywords:> Approximate sampling theorem;
  Whittaker's cardinal series; Hankel transforms; Dirichlet series; Riemann's
  zeta-function; theta-transformation; Bessel functions.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Riemann's
    functional equation and Hankel transforms>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Poisson
    formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Sampling
    theorems and Hankel transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The Whittaker-Shannon sampling theorem states that every signal function
  <math|f:\<bbb-R\>\<to\>\<bbb-C\>> that is band-limited to
  <math|<around|[|-\<pi\>*W,\<pi\>*W|]>> for some <math|W\<gtr\>0>, i.e., its
  Fourier transform <math|<wide|f|^><around|(|\<nu\>|)>> vanishes for almost
  all <math|<around|\||\<nu\>|\|>\<gtr\>\<pi\>*W>, can be completely
  reconstructed from its sampled values <math|f*<around|(|n/W|)>>,
  <math|n\<in\>\<bbb-Z\>>, in terms of Whittaker's cardinal series (cf.
  <cite|28|32>)

  <\equation>
    f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<around*|(|<frac|n|W>|)><math-up|sinc><around*|(|W*t-n|)>,<space|1em>t\<in\>\<bbb-R\>,<label|eq:whittaker_cardinal>
  </equation>

  where <math|<math-up|sinc><around|(|t|)>\<assign\><frac|sin
  \<pi\>*t|\<pi\>*t>>, <math|t\<neq\>0>, and
  <math|<math-up|sinc><around|(|0|)>\<assign\>1> is the Dirichlet kernel.
  There are various extensions of this Lagrange-type interpolation formula
  which is the theoretical basis of modern pulse-code modulation
  communication systems. It has been proved by Butzer et al. (cf.
  <cite|7|8|9|10>) that the Brown-Butzer-Splettstöÿer approximate sampling
  theorem for not necessarily band limited functions

  <\equation>
    f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>,<space|1em>t\<in\>\<bbb-R\>,<label|eq:brown_butzer>
  </equation>

  is essentially \Pequivalent\Q to three fundamental theorems in three
  different fields, namely to the Poisson summation formula of Fourier
  analysis, to a particular form of Cauchy's integral formula in complex
  function theory, as well as to the Euler-Maclaurin summation formula of
  numerical analysis. Hence the sampling theorem plays a unique role in
  various branches of analysis (cf. <cite|5>).

  In the present paper, it is proved by means of the theory of Dirichlet
  series that generalized forms of the sampling expansions
  <eqref|eq:whittaker_cardinal> and <eqref|eq:brown_butzer> can also be
  deduced via a Poisson-type duality formula (cf.
  Theorem<nbsp><reference|thm:poisson_type> below) from five important
  theorems of the theory of integral transforms, of analytic number theory
  and of the theory of special functions of mathematical physics. In
  particular, <eqref|eq:whittaker_cardinal> and <eqref|eq:brown_butzer> are
  deduced from a general summation formula for ordinary Hankel integral
  transforms (cf. Theorems<nbsp><reference|thm:hankel_shannon>
  and<nbsp><reference|thm:riemann_hankel> below), which is shown to be
  \Pequivalent\Q to the famous functional equation of Riemann's zeta-function
  (cf. Theorem<nbsp><reference|thm:riemann_functional> below), to the
  \Pmodular relation\Q of Jacobi's theta-function (cf.
  Lemma<nbsp><reference|lem:theta_relation> below), to the well-known
  Nielsen-Doetsch summation formula for Bessel functions of the first kind
  (cf. Lemma<nbsp><reference|lem:bessel_summation> below) as well as to the
  partial fraction expansion of the periodic \PHilbert-kernel\Q (cf.
  Lemma<nbsp><reference|lem:hilbert_kernel> below).

  Results of this special type on nontrivial relations between fundamental
  theorems of signal analysis, analytic number theory and applied analysis
  are obviously new. Demonstrably they are unparalleled in the vast
  literature of signal theory and Fourier analysis (cf. <cite|8|21>).

  On the other hand, they also extend well-known results of the theory of
  Dirichlet series with functional equations and related arithmetical
  identities due to many authors (see, e.g., <cite|2|3|4|11|12|13|14|22>). In
  fact, none of these papers contains any explicit contribution to modern
  signal analysis or to the \Pequivalent\Q characterisation of Riemann's
  functional equation by summation properties of Hankel transforms (cf.
  Theorem<nbsp><reference|thm:riemann_functional> below). The same fact holds
  for the classical deep works <cite|15|17|19|20|27|29>, which form the basis
  of our considerations. By the way, we too extend an interesting result of
  <cite|18> (see also <cite|1|26>) on the famous Voronoi summation formula
  and its relation to Dirichlet series.

  Concerning the preliminaries, let <math|L<rsup|p><around|(|\<bbb-R\>|)>>,
  <math|1\<leq\>p\<leq\>\<infty\>>, denote the space of all complex-valued
  Lebesgue measurable functions <math|f> defined on <math|\<bbb-R\>> for
  which the norms

  <\equation>
    <around|\<\|\|\>|f|\<\|\|\>><rsub|p>\<assign\><around*|(|<big|int><rsub|\<bbb-R\>><around|\||f<around|(|u|)>|\|><rsup|p>*<space|0.17em>d*u|)><rsup|1/p>,<space|1em>1\<leq\>p\<less\>\<infty\>,<space|1em><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>\<assign\><with|math-font-family|rm|ess<space|0.17em>sup><rsub|u\<in\>\<bbb-R\>><around|\||f<around|(|u|)>|\|><label|eq:lp_norm>
  </equation>

  are finite. By <math|C<around|(|\<bbb-R\>|)>>, denote the space of all
  uniformly continuous and bounded functions on <math|\<bbb-R\>> endowed with
  the supremum norm <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|C>>. The
  Fourier transform <math|<wide|f|^>> of <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>
  is defined by

  <\equation>
    <wide|f|^><around|(|u|)>\<assign\><big|int><rsub|\<bbb-R\>>f<around|(|u|)>*e<rsup|-i*u*u>*<space|0.17em>d*u,<space|1em>u\<in\>\<bbb-R\>,<label|eq:fourier_transform>
  </equation>

  and of <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> by the limit in the
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>-norm of

  <\equation>
    <big|int><rsub|-R><rsup|R>f<around|(|u|)>*e<rsup|-i*u*u>*<space|0.17em>d*u,<space|1em>R\<to\>\<infty\>.<label|eq:fourier_l2>
  </equation>

  If <math|f\<in\>L<rsup|p><around|(|\<bbb-R\>|)>>, <math|p=1> or <math|2>,
  is such that <math|<wide|f|^>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>, then
  the Fourier inversion formula

  <\equation>
    f<around|(|t|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|\<bbb-R\>><wide|f|^><around|(|u|)>*e<rsup|i*u*t>*<space|0.17em>d*u,<space|1em>t\<in\>\<bbb-R\>,<label|eq:fourier_inversion>
  </equation>

  holds at each point of continuity of <math|f>. The bilateral Laplace
  transform <math|\<cal-L\><rsub|z><around|{|f|}>> of
  <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and <math|f> being of bounded
  exponential growth is defined in its strip of convergence <math|S> by

  <\equation>
    \<cal-L\><rsub|z><around|{|f|}>\<assign\><big|int><rsub|\<bbb-R\>>f<around|(|u|)>*e<rsup|-z*u>*<space|0.17em>d*u,<space|1em>z\<in\>S.<label|eq:laplace_transform>
  </equation>

  The Hankel transform of <math|f\<in\>L<rsup|1><around|(|\<bbb-R\><rsub|+>|)>>
  is defined for <math|s\<in\>\<bbb-R\><rsub|+>> by

  <\equation>
    <around|(|H<rsub|\<nu\>>*f|)><around|(|s|)>\<assign\><big|int><rsub|0><rsup|\<infty\>>f<around|(|t|)><sqrt|s*t>*J<rsub|\<nu\>>*<around|(|2*<sqrt|s*t>|)>*<space|0.17em>d*t,<label|eq:hankel_transform>
  </equation>

  where <math|J<rsub|\<nu\>>> is the Bessel function of the first kind of
  order <math|\<nu\>\<geq\>0>.

  <section|Riemann's functional equation and Hankel
  transforms><label|sec:riemann>

  As remarked above, one aim is to deduce the sampling theorems from
  Riemann's functional equation. In view of Fourier's inversion theorem (cf.
  <eqref|eq:fourier_inversion> below) it is quite sufficient to base further
  investigations on the following generalized functional equation of
  Riemann's type.

  <\definition>
    <label|def:riemann_functional>Let <math|<around|{|\<lambda\><rsub|n>|}>>
    and <math|<around|{|\<mu\><rsub|n>|}>> be two sequences of positive
    numbers strictly increasing to infinity, and
    <math|<around|{|a<rsub|n>|}>> and <math|<around|{|b<rsub|n>|}>> two
    sequences of complex numbers not identically zero. Consider the functions
    <math|\<phi\><around|(|s|)>> and <math|\<psi\><around|(|s|)>> represented
    as absolutely convergent Dirichlet series in the half-plane
    <math|<math-up|Re>s\<gtr\>1>:

    <\equation>
      \<phi\><around|(|s|)>=<big|sum><rsub|n\<geq\>1><frac|a<rsub|n>|\<lambda\><rsub|n><rsup|s>>,<space|1em>\<psi\><around|(|s|)>=<big|sum><rsub|n\<geq\>1><frac|b<rsub|n>|\<mu\><rsub|n><rsup|s>>.<label|eq:dirichlet_series>
    </equation>

    State that <math|\<phi\>> and <math|\<psi\>> satisfy the functional
    equation if there exists a meromorphic function <math|\<chi\>> with the
    following properties:

    <\enumerate>
      <item>

      <\align>
        <tformat|<table|<row|<cell|\<chi\><around|(|s|)>=\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<phi\><around|(|s|)>,>|<cell|<space|1em><math-up|Re>s\<gtr\>1,<eq-number><label|eq:chi_right>>>|<row|<cell|\<chi\><around|(|s|)>=\<pi\><rsup|-<around|(|1-s|)>/2>*\<Gamma\><around*|(|<frac|1-s|2>|)>*\<psi\>*<around|(|1-s|)>,>|<cell|<space|1em><math-up|Re>s\<less\>0.<eq-number><label|eq:chi_left>>>>>
      </align>

      <item><math|\<chi\><around|(|s|)>> has only simple poles in
      <math|\<bbb-C\>> at <math|s=0> and <math|s=1>, i.e.,
      <math|\<phi\><around|(|s|)>> is analytic in
      <math|\<bbb-C\>\<setminus\><around|{|1|}>> and
      <math|<around|(|s-1|)>*\<phi\><around|(|s|)>> is an entire function
      whose order one regards as finite.
    </enumerate>
  </definition>

  In view of <eqref|eq:chi_right>, further set:

  <\equation>
    a<rsub|0>\<assign\>-2*\<psi\><around|(|0|)>,<space|1em>b<rsub|0>\<assign\><math-up|res><rsub|s=1>\<phi\><around|(|s|)>,<space|1em>\<lambda\><rsub|0>=\<mu\><rsub|0>\<assign\>0,<label|eq:residue_definition>
  </equation>

  <\equation>
    a<rsub|-n>\<assign\>a<rsub|n>,<space|1em>b<rsub|-n>\<assign\>b<rsub|n>,<space|1em>\<lambda\><rsub|-n>\<assign\>-\<lambda\><rsub|n>,<space|1em>\<mu\><rsub|-n>\<assign\>-\<mu\><rsub|n>,<space|1em>n\<in\>\<bbb-N\>.<label|eq:symmetric_extension>
  </equation>

  The following lemmas are originally due to Hamburger (cf. <cite|4|11|19>).

  <\lemma>
    <label|lem:theta_relation>Riemann's functional equation
    <eqref|eq:chi_right>\U<eqref|eq:chi_left> is \Pequivalent\Q to the
    theta-relation

    <\equation>
      <big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>a<rsub|n>*exp
      <around|(|-\<pi\>*\<lambda\><rsub|n><rsup|2>*\<tau\>|)>=\<tau\><rsup|-1/2>*<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>b<rsub|n>*exp
      <around|(|-\<pi\>*\<mu\><rsub|n><rsup|2>*\<tau\><rsup|-1>|)>,<space|1em><math-up|Re>\<tau\>\<gtr\>0.<label|eq:theta_relation_eq>
    </equation>
  </lemma>

  The behaviour of <eqref|eq:theta_relation_eq> under the one-sided Laplace
  transform is given by the generalized Nielsen-Doetsch formula for
  Schlömilch series (cf. <cite|11|15|16|23|24|31>):

  <\lemma>
    <label|lem:bessel_summation>The theta-relation
    <eqref|eq:theta_relation_eq> is \Pequivalent\Q to the Bessel summation
    formula

    <\with|font-base-size|9>
      <\equation>
        <frac|\<Gamma\>*<around|(|\<nu\>+1|)>|\<pi\><rsup|\<nu\>>>*<around*|[|b<rsub|0>*t<rsup|\<nu\>>+2*<big|sum><rsub|n\<geq\>1>b<rsub|n>*\<mu\><rsub|n><rsup|\<nu\>>*J<rsub|\<nu\>>*<around|(|2*\<pi\>*\<mu\><rsub|n>*t|)>|]>=<frac|t<rsup|\<nu\>-1/2>|\<pi\><rsup|\<nu\>+1/2>>*<around*|[|<frac|a<rsub|0>|\<Gamma\>*<around|(|\<nu\>+1|)>>*e<rsup|\<mu\>*t>+2*<big|sum><rsub|n\<in\>\<bbb-N\>>a<rsub|n>*<around|(|t-\<lambda\><rsub|n>|)><rsub|+><rsup|\<nu\>-1/2>|]><label|eq:bessel_summation_eq>
      </equation>
    </with>

    where <math|t\<in\>\<bbb-R\><rsub|+>,\<nu\>\<geq\>0>.
  </lemma>

  We now transfer <eqref|eq:bessel_summation_eq> to the space of Hankel
  transforms. More generally, prove the following obviously new
  \Pequivalence\Q theorem, which extends, e.g., researches of <cite|11>.

  <\theorem>
    <label|thm:riemann_functional>Let <math|f:\<bbb-R\><rsub|+>\<to\>\<bbb-C\>>
    be such that, for <math|\<xi\>\<gtr\>0> and <math|q\<geq\><frac|1|2>>,

    <\equation>
      g<rsub|\<xi\>,0><around|(|t|)>\<assign\>f<around|(|t|)>*t<rsup|1/4>*<around|(|t-\<xi\>|)><rsup|q-1/4>\<in\>L<rsup|2><around|(|\<bbb-R\><rsub|+>|)>\<cap\>C<around|(|\<bbb-R\><rsub|+>|)><label|eq:hankel_condition_1>
    </equation>

    and, for <math|\<xi\>\<gtr\>0> and <math|q\<gtr\><frac|3|2>>,

    <\equation>
      g<rsub|\<xi\>,q><around|(|t|)>=O<around|(|t<rsup|-\<nu\>-1>|)>,<space|1em>t\<to\>\<infty\>.<label|eq:hankel_condition_2>
    </equation>

    Define the operator

    <\equation>
      <around|(|T<rsub|\<nu\>>*f|)><around|(|\<xi\>|)>\<assign\><big|int><rsub|0><rsup|\<infty\>>g<rsub|\<xi\>,q><around|(|t|)>*<space|0.17em>d*t.<label|eq:operator_definition>
    </equation>

    Then Riemann's functional equation <eqref|eq:chi_right>\U<eqref|eq:chi_left>
    is \Pequivalent\Q to the Hankel summation formula

    <\equation>
      <frac|\<Gamma\>*<around|(|\<nu\>+1|)>|\<pi\><rsup|\<nu\>>>*<around*|[|b<rsub|0>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>b<rsub|n>*\<mu\><rsub|n><rsup|\<nu\>>*<around|(|H<rsub|\<nu\>>*f|)>*<around|(|T<rsub|2>*\<mu\><rsub|n><rsup|2>|)>|]>=<frac|\<pi\><rsup|\<nu\>-1/2>|\<Gamma\>*<around|(|\<nu\>+1/2|)>>*<around*|[|a<rsub|0>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>a<rsub|n>*<around|(|T<rsub|\<nu\>>*f|)><around|(|\<lambda\><rsub|n>|)>|]><label|eq:hankel_summation_formula>
    </equation>

    valid for <math|\<nu\>\<gtr\><frac|1|2>>.
  </theorem>

  <\proof>
    Show that <eqref|eq:theta_relation_eq> and
    <eqref|eq:hankel_summation_formula> are \Pequivalent\Q. The assertion
    then follows from Lemma<nbsp><reference|lem:theta_relation>.

    Multiply <eqref|eq:bessel_summation_eq> by
    <math|g<rsub|\<xi\>,q><around|(|t|)>=f<around|(|t|)>\<in\>L<rsup|1><around|(|\<bbb-R\><rsub|+>|)>\<cap\>C<around|(|\<bbb-R\><rsub|+>|)>>.
    Integration over <math|\<bbb-R\><rsub|+>> then yields by
    <eqref|eq:operator_definition>:

    <\equation>
      <with|font-base-size|9|<frac|\<pi\><rsup|\<nu\>>|\<Gamma\>*<around|(|\<nu\>+1|)>>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>b<rsub|n>*\<mu\><rsub|n><rsup|\<nu\>>*<big|int><rsub|0><rsup|\<infty\>>f<around|(|t|)>*J<rsub|\<nu\>>*<around|(|2*\<pi\>*\<mu\><rsub|n>*t|)>*<space|0.17em>d*t=<frac|\<pi\><rsup|\<nu\>+1/2>|\<Gamma\>*<around|(|\<nu\>+1/2|)>>*<around*|[|a<rsub|0>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|m\<in\>\<bbb-N\>>a<rsub|n>*<around|(|T<rsub|\<nu\>>*f|)><around|(|\<lambda\><rsub|n>|)>|]><label|eq:hankel_proof_1>>
    </equation>

    For <math|\<nu\>\<gtr\>0> the asymptotic equality

    <\equation>
      J<rsub|\<nu\>><around|(|z|)>=<sqrt|<frac|2|\<pi\>*z>>*cos
      <around*|(|z-<frac|\<nu\>*\<pi\>|2>-<frac|\<pi\>|4>|)><space|1em>\<forall\>z\<to\>\<infty\><label|eq:bessel_asymptotic>
    </equation>

    holds, and since <math|g<rsub|\<xi\>,q><around|(|t|)>=t<rsup|-1/4>*f<around|(|t|)>\<in\>L<rsup|1><around|(|\<bbb-R\><rsub|+>|)>\<cap\>C<around|(|\<bbb-R\><rsub|+>|)>>,
    exchange by <eqref|eq:operator_definition> the order of summation and
    integration on the left-hand side of <eqref|eq:hankel_proof_1>. By
    condition <eqref|eq:hankel_condition_2> and in view of
    <eqref|eq:dirichlet_series> one has for <math|\<nu\>\<gtr\><frac|1|2>>
    and some constant <math|c\<gtr\>0>,

    <\equation>
      c<around*|\||<big|sum><rsub|m\<in\>\<bbb-N\>>a<rsub|n>*g<rsub|\<xi\>,q><around|(|t|)>*<space|0.17em>d*t|\|>\<leq\>c*<big|sum><rsub|m\<geq\>1><around|\||a<rsub|n>|\|>*\<lambda\><rsub|n><rsup|2*\<mu\>-1>.<label|eq:hankel_bound>
    </equation>

    Hence the interchange of summation and integration on the right-hand side
    of <eqref|eq:hankel_proof_1> is permissible and:

    <\equation>
      <with|font-base-size|9|<frac|\<Gamma\>*<around|(|\<nu\>+1|)>|\<pi\><rsup|\<nu\>>>*<around*|[|b<rsub|0>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>b<rsub|n>*\<mu\><rsub|n><rsup|\<nu\>>*<big|int><rsub|0><rsup|\<infty\>>f<around|(|t|)>*J<rsub|\<nu\>>*<around|(|2*\<pi\>*\<mu\><rsub|n>*t|)>*<space|0.17em>d*t|]>=<frac|\<pi\><rsup|\<nu\>-1/2>|\<Gamma\>*<around|(|\<nu\>+1/2|)>>*<around*|[|a<rsub|0>*<around|(|T<rsub|\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>a<rsub|n>*<around|(|T<rsub|\<nu\>>*f|)><around|(|\<lambda\><rsub|n>|)>|]><label|eq:hankel_proof_2>>
    </equation>

    which by <eqref|eq:hankel_transform> and <eqref|eq:operator_definition>
    yields <eqref|eq:hankel_summation_formula>.

    Now to the converse direction. Prove a generalized version of
    <eqref|eq:theta_relation_eq> by applying
    <eqref|eq:hankel_summation_formula> with
    <math|\<nu\>=2*m\<gtr\><frac|1|2>> to the function

    <\equation>
      f<around|(|t|)>=t<rsup|2*\<mu\>-m-1/2>*exp
      <around|{|-\<pi\>*t*\<tau\><rsup|-1>|}>\<forall\>t\<in\>\<bbb-R\><rsub|+>,<label|eq:test_function>
    </equation>

    where <math|\<mu\>\<gtr\>0> and <math|<math-up|Re>\<tau\>\<gtr\>0>.
    Verify directly that

    <\equation>
      g<rsub|2*m><around|(|t|)>=f<around|(|t|)>*t<rsup|-\<mu\>>*<around|(|t-\<xi\>|)><rsup|2*m-1/2>\<forall\>\<xi\>\<gtr\>0,<label|eq:test_satisfies_1>
    </equation>

    satisfies <eqref|eq:hankel_condition_1> and
    <eqref|eq:hankel_condition_2>.

    By <eqref|eq:hankel_transform> one has for
    <math|s\<in\>\<bbb-R\><rsub|+>>,

    <\equation>
      <around|(|H<rsub|\<nu\>>*f|)><around|(|s|)>=<around*|(|<frac|\<pi\>|2>|)><rsup|2*\<mu\>-m>*<big|int><rsub|0><rsup|\<infty\>>t<rsup|2*\<mu\>-m-1/2>*e<rsup|-\<pi\>*t*\<tau\><rsup|-1>>*J<rsub|2*m>*<around|(|2*<sqrt|s*t>|)>*<space|0.17em>d*t.<label|eq:hankel_computed>
    </equation>

    Using Hankel's generalisation of Weber's first exponential integral (cf.
    <cite|31>), obtain the Hankel transform of <eqref|eq:test_function>:

    <\equation>
      <around|(|H<rsub|\<nu\>>*f|)><around|(|s|)>=2<rsup|2*\<mu\>-m><around*|(|<frac|\<pi\>|\<tau\>>|)><rsup|\<mu\>>*s<rsup|\<mu\>-1/2>*M<rsub|2*m-\<mu\>,\<mu\>>*<around|[|2*\<pi\>*s*\<tau\><rsup|-1>|]>,<label|eq:hankel_whittaker>
    </equation>

    where <math|M<around|(|z|)>> is the Whittaker function of the first kind.
    By <eqref|eq:operator_definition> one has for <math|\<xi\>\<geq\>0>,

    <\equation>
      <around|(|T<rsub|2*m>*f|)><around|(|\<xi\>|)>=<around*|(|<frac|\<pi\>|2*\<mu\>>|)><rsup|2>*<big|int><rsub|max
      <around|(|0,\<xi\>|)>><rsup|\<infty\>>t<rsup|2*<around|(|\<mu\>-m|)>-1/2>*e<rsup|-\<pi\>*t*\<tau\><rsup|-1>>*<space|0.17em>d*t.<label|eq:operator_computed>
    </equation>

    For the case <math|\<xi\>=0> in <eqref|eq:operator_computed>, obtain by
    Euler's representation of the <math|\<Gamma\>>-function,

    <\equation>
      <around|(|T<rsub|2*m>*f|)><around|(|0|)>=<around*|(|<frac|\<pi\>|2*\<mu\>>|)><rsup|2>*\<Gamma\>*<around|(|2*\<mu\>|)>,<space|1em><around|(|T<rsub|2*m+1>*f|)><around|(|0|)>=<around*|(|<frac|\<pi\>|2*\<mu\>+1/2>|)><rsup|2>*\<Gamma\>*<around|(|2*\<mu\>+1/2|)>.<label|eq:operator_zero>
    </equation>

    For the case <math|\<xi\>\<gtr\>0> in <eqref|eq:operator_computed>, the
    Whittaker integral representation of the Whittaker function
    <math|W<around|(|z|)>> of the second kind is needed (cf. <cite|33>):

    <\equation>
      W<rsub|\<kappa\>,\<mu\>><around|(|z|)>=<frac|e<rsup|-z/2>*z<rsup|\<kappa\>+1/2>|\<Gamma\>*<around|(|\<mu\>-\<kappa\>+1|)>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-z*t>*t<rsup|\<mu\>-\<kappa\>-1/2>*<around|(|1+t|)><rsup|\<kappa\>+\<mu\>>*<space|0.17em>d*t,<label|eq:whittaker_integral>
    </equation>

    valid for <math|<math-up|Re>z\<gtr\>0> and
    <math|<math-up|Re><around|(|\<mu\>-\<kappa\>|)>\<gtr\>-1/2>.

    Now substitute <math|t=\<xi\>+\<tau\>*\<nu\>/\<pi\>>,
    <math|\<nu\>\<gtr\>0>, in <eqref|eq:operator_computed>. Then in view of
    <eqref|eq:whittaker_integral>, obtain by straightforward computation:

    <\equation>
      <around|(|T<rsub|2*m>*f|)><around|(|\<xi\>|)>=<around*|(|<frac|\<pi\>|2*\<mu\>+1/2>|)><rsup|2>*\<xi\><rsup|\<mu\>-1/2>*exp
      <around*|{|-<frac|\<pi\>*\<xi\>|\<tau\>>|}>*W<rsub|2*m-\<mu\>,\<mu\>>*<around|[|\<pi\>*\<xi\>*\<tau\><rsup|-1>|]>.<label|eq:operator_xi>
    </equation>

    Inserting <eqref|eq:hankel_whittaker>, <eqref|eq:operator_zero> and
    <eqref|eq:operator_xi> into <eqref|eq:hankel_summation_formula>, obtain
    the Whittaker transformation formula

    <\equation>
      <tabular|<tformat|<table|<row|<cell|b<rsub|0>*<sqrt|\<tau\>>*\<pi\>+<around|(|\<tau\>*\<pi\>|)><rsup|\<mu\>>*<big|sum><rsub|n\<geq\>1>b<rsub|n>*\<mu\><rsub|n><rsup|2*m-1>*exp
      <around*|{|-<frac|\<mu\><rsub|n>*\<pi\>|\<tau\>>|}>*M<rsub|2*m-\<mu\>,\<mu\>>*<around|[|\<mu\><rsub|n>*\<pi\>*\<tau\>|]><eq-number>>>|<row|<cell|=<frac|\<Gamma\>*<around|(|2*m+1|)>*\<Gamma\>*<around|(|2*\<mu\>|)>|\<Gamma\>*<around|(|2*m+1/2|)>*\<Gamma\>*<around|(|2*\<mu\>+1/2|)>>*<around*|[|a<rsub|0>*\<pi\>+<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<lambda\><rsub|n><rsup|\<mu\>-1/2>*exp
      <around*|{|-<frac|\<lambda\><rsub|n>*\<pi\>|\<tau\>>|}>*W<rsub|2*m-\<mu\>,\<mu\>>*<around|[|\<lambda\><rsub|n>*\<pi\>*\<tau\><rsup|-1>|]>|]><label|eq:whittaker_theta>>>>>>
    </equation>

    valid for <math|<math-up|Re>\<tau\>\<gtr\>0>, <math|\<mu\>\<gtr\>0> and
    <math|m\<gtr\>1/2>.

    Finally, observe that (cf. <cite|16>)

    <\equation>
      M<rsub|1/2+m,m><around|(|z|)>=z<rsup|1/2+m>*exp
      <around*|{|-<frac|z|2>|}>,<space|1em>W<rsub|1/4-m,1/4+m><around|(|z|)>=z<rsup|1/4-m>*exp
      <around|{|z|}>,<space|1em><math-up|Re>z\<gtr\>0,<space|1em>m\<in\>\<bbb-R\><rsub|+>.<label|eq:whittaker_special>
    </equation>

    Hence the Whittaker theta-relation <eqref|eq:whittaker_theta> degenerates
    for <math|\<mu\>=m+1/4> to <eqref|eq:theta_relation_eq> and
    Theorem<nbsp><reference|thm:riemann_functional> is proved.
  </proof>

  <\remark>
    <label|rem:remarks_2_5>

    <\enumerate>
      <item>In the case <math|a<rsub|n>=b<rsub|n>=1> and
      <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n>, equation
      <eqref|eq:chi_right>\U<eqref|eq:chi_left> becomes Riemann's functional
      equation for the ordinary <math|\<zeta\>>-function while
      <eqref|eq:theta_relation_eq> reduces to the linear transformation
      formula for Jacobi's elliptic theta-function
      <math|\<vartheta\><rsub|3><around|(|0\|\<tau\>|)>>,
      <eqref|eq:bessel_summation_eq> is the classical Nielsen-Doetsch
      summation formula for Bessel functions (cf. <cite|15|31>) and
      <eqref|eq:hankel_summation_formula> degenerates to a series
      transformation formula which at first has been studied without rigorous
      proof by Erdelyi (cf. <cite|1|17>) in the theory of special functions
      of mathematical physics.

      <item>Note that the Whittaker theta-relation <eqref|eq:whittaker_theta>
      is a far-reaching extension of the \Pmodular relation\Q
      <eqref|eq:theta_relation_eq>. Hence the Hankel formula
      <eqref|eq:hankel_summation_formula> can be regarded as a counterpart to
      Poisson's duality formula for Fourier transforms.
    </enumerate>
  </remark>

  <section|Poisson formula><label|sec:poisson>

  The following \Pequivalent\Q characterisation of
  <eqref|eq:theta_relation_eq> is originally due to Hamburger and Siegel (cf.
  <cite|4|11|19|29>).

  <\lemma>
    <label|lem:hilbert_kernel>The theta-relation <eqref|eq:theta_relation_eq>
    is \Pequivalent\Q to the partial fraction expansion

    <\equation>
      F<around|(|z|)>\<assign\>a<rsub|0>+2*<big|sum><rsub|n\<geq\>1>a<rsub|n>*e<rsup|-2*\<pi\>*\<lambda\><rsub|n><rsup|2>*z>=<frac|\<pi\>*z|\<pi\>*z>+<big|sum><rsub|n\<geq\>1><frac|2*b<rsub|n>*z|<around|(|\<pi\>*z|)><rsup|2>+\<mu\><rsub|n><rsup|2>>,<space|1em><math-up|Re>z\<gtr\>0.<label|eq:partial_fraction>
    </equation>
  </lemma>

  For further investigations, only the fact that <eqref|eq:theta_relation_eq>
  implies the expansion <eqref|eq:partial_fraction> of the generalized
  periodic \PHilbert kernel\Q is needed (cf. <cite|6>). In view of
  <eqref|eq:partial_fraction>, give the next definition.

  <\definition>
    <label|def:class_An>For <math|z=x+i*y\<in\>\<bbb-C\>> and fixed
    <math|\<eta\>\<gtr\>0>, consider the strip <math|S>:
    <math|<around|\||x|\|>\<less\>\<eta\>>, <math|y\<in\>\<bbb-R\>>.

    Denote by <math|A<rsub|\<eta\>>> the class of functions
    <math|\<Omega\>:\<bbb-C\>\<to\>\<bbb-C\>> with the following properties:

    <\enumerate>
      <item><math|\<Omega\><around|(|z|)>> is analytic in <math|S>.

      <item>There exists a positive number <math|\<delta\>\<less\>\<eta\>> so
      that <math|\<Omega\>*<around|(|\<pm\>\<delta\>+i*y|)>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>.

      <item>Two sequences of positive numbers
      <math|<around|{|\<alpha\><rsub|\<mu\>>|}>> and
      <math|<around|{|\<beta\><rsub|\<mu\>>|}>> strictly increasing to
      infinity can be determined so that uniformly for
      <math|<around|\||x|\|>\<leq\>\<delta\>>,

      <\equation>
        \<Omega\>*<around|(|x+i*\<alpha\><rsub|\<mu\>>|)>=O<around|(|1|)>,<space|1em>\<Omega\>*<around|(|x-i*\<beta\><rsub|\<mu\>>|)>=O<around|(|1|)>,<space|1em>\<mu\>\<to\>\<infty\>,<label|eq:hankel_class_1>
      </equation>

      and with <math|F<around|(|z|)>> defined by <eqref|eq:partial_fraction>,

      <\equation>
        \<Omega\>*<around|(|x+i*\<alpha\><rsub|\<mu\>>|)>*F*<around|(|x+i*\<alpha\><rsub|\<mu\>>|)>=O<around|(|1|)>,<space|1em>\<Omega\>*<around|(|x-i*\<beta\><rsub|\<mu\>>|)>*F*<around|(|x-i*\<beta\><rsub|\<mu\>>|)>=O<around|(|1|)>,<space|1em>\<mu\>\<to\>\<infty\>.<label|eq:hankel_class_2>
      </equation>
    </enumerate>
  </definition>

  For the class <math|A<rsub|\<eta\>>>, prove the following theorem (cf.
  <cite|19>).

  <\theorem>
    <label|thm:residue_formula>Let <math|\<Omega\>\<in\>A<rsub|\<eta\>>>.
    Then the Hankel summation formula <eqref|eq:hankel_summation_formula>
    implies the residue formula

    <\equation>
      <big|sum><rsub|n>\<Omega\>*<around|(|i*\<mu\><rsub|n>|)>=<big|sum><rsub|n>a<rsub|n>*e<rsup|-2*\<pi\>*i*\<lambda\><rsub|n>*y>+<frac|1|2*\<pi\>*i>*<big|int><rsub|<around|(|-\<delta\>|)>>\<Omega\><around|(|z|)>*F<around|(|z|)>*<space|0.17em>d*z.<label|eq:residue_formula_eq>
    </equation>
  </theorem>

  <\proof>
    Function <math|F<around|(|z|)>> defined by <eqref|eq:partial_fraction> is
    analytic in <math|\<bbb-C\>> except for simple poles at
    <math|z=i*\<mu\><rsub|n>>, <math|n\<in\>\<bbb-Z\>>. For
    <math|0\<less\>\<delta\>\<less\>\<eta\>>, consider the fixed straight
    lines <math|<around|(|\<pm\>\<delta\>|)>\<assign\><around|(|\<pm\>\<delta\>-i*\<infty\>,\<pm\>\<delta\>+i*\<infty\>|)>>.

    By <eqref|eq:hankel_class_2>, the Phragmén-Lindelöf principle and
    Cauchy's theorem:

    <\equation>
      <big|int><rsub|<around|(|\<delta\>|)>>\<Omega\><around|(|z|)>*F<around|(|z|)>*<space|0.17em>d*z=<big|int><rsub|<around|(|-\<delta\>|)>>\<Omega\><around|(|z|)>*F<around|(|z|)>*<space|0.17em>d*z+2*\<pi\>*i*<big|sum><rsub|n>b<rsub|n>*\<Omega\>*<around|(|i*\<mu\><rsub|n>|)>.<label|eq:residue_proof_1>
    </equation>

    Since <math|F<around|(|z|)>> is an odd function of <math|z>:

    <\equation>
      <frac|1|\<pi\>*i>*<big|sum><rsub|n>b<rsub|n>*\<Omega\>*<around|(|i*\<mu\><rsub|n>|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|<around|(|\<delta\>|)>>F<around|(|z|)>*<around|{|\<Omega\><around|(|z|)>+\<Omega\>*<around|(|-z|)>|}>*<space|0.17em>d*z.<label|eq:residue_proof_2>
    </equation>

    By Lemma<nbsp><reference|lem:hilbert_kernel>, <math|F<around|(|z|)>> is
    also represented for <math|<math-up|Re>z\<gtr\>0> by the absolutely
    convergent Dirichlet series on the left-hand side of
    <eqref|eq:partial_fraction>. Hence inserting in
    <eqref|eq:residue_proof_2>, with <eqref|eq:hankel_class_1> and Lebesgue's
    dominated convergence theorem:

    <\equation>
      <frac|1|\<pi\>*i>*<big|sum><rsub|n>b<rsub|n>*\<Omega\>*<around|(|i*\<mu\><rsub|n>|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|<around|(|\<delta\>|)>>a<rsub|0>*<around|{|\<Omega\><around|(|z|)>+\<Omega\>*<around|(|-z|)>|}>*<space|0.17em>d*z+<frac|1|\<pi\>*i>*<big|sum><rsub|n\<geq\>1>a<rsub|n>*<big|int><rsub|<around|(|\<delta\>|)>>e<rsup|-2*\<pi\>*\<lambda\><rsub|n>>*<around|{|\<Omega\><around|(|z|)>+\<Omega\>*<around|(|-z|)>|}>*<space|0.17em>d*z.<label|eq:residue_proof_3>
    </equation>

    Now by <eqref|eq:hankel_class_1> relation <eqref|eq:residue_proof_3> also
    holds for the imaginary axis. Hence:

    <\equation>
      <big|sum><rsub|n>b<rsub|n>*\<Omega\>*<around|(|i*\<mu\><rsub|n>|)>=a<rsub|0>*<big|int><rsub|\<bbb-R\>>\<Omega\>*<around|(|i*y|)>*<space|0.17em>d*y+<big|sum><rsub|n\<neq\>0>a<rsub|n>*<big|int><rsub|\<bbb-R\>>e<rsup|-2*\<pi\>*i*\<lambda\><rsub|n>*y>*\<Omega\>*<around|(|i*y|)>*<space|0.17em>d*y.<label|eq:residue_proof_4>
    </equation>

    Hence by Lemma<nbsp><reference|lem:theta_relation> and
    Theorem<nbsp><reference|thm:riemann_functional> the assertion of
    Theorem<nbsp><reference|thm:residue_formula> is proved.
  </proof>

  <\remark>
    <label|rem:theta_special>As an illustration of
    Theorem<nbsp><reference|thm:residue_formula>, take
    <math|\<Omega\><around|(|z|)>=exp <around|{|z<rsup|2>*\<pi\>*\<tau\><rsup|-1>|}>>,
    <math|<math-up|Re>\<tau\>\<gtr\>0>, and <math|a<rsub|n>=b<rsub|n>=1>,
    <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n>. Then
    <math|F<around|(|z|)>=i*cot <around|(|i*\<pi\>*z|)>> and
    <math|\<Omega\>\<in\>A<rsub|\<eta\>>>. Hence
    <eqref|eq:residue_formula_eq> yields an important special case of
    <eqref|eq:theta_relation_eq>, i.e., the well-known linear transformation
    formula for the theta-function <math|\<vartheta\><rsub|3><around|(|0\|\<tau\>|)>>.
  </remark>

  Now use Theorem<nbsp><reference|thm:residue_formula> to deduce a Poisson
  formula.

  Denote by <math|A> the class of all functions
  <math|g:\<bbb-R\>\<to\>\<bbb-C\>> with the properties

  <\equation>
    g\<in\>L<rsup|1><around|(|\<bbb-R\>|)>\<cap\>C<around|(|\<bbb-R\>|)>,<space|1em><text|with
    ><wide|g|^>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>,<label|eq:class_A_prop_1>
  </equation>

  <\equation>
    \<cal-L\><rsub|z*u>*<around|{|g*<around|(|a*u|)>|}>,<space|1em>a\<gtr\>0,<text|is
    defined in >S,<text|and satisfies ><eqref|eq:hankel_class_1><text|and
    ><eqref|eq:hankel_class_2>.<label|eq:class_A_prop_2>
  </equation>

  <\theorem>
    <label|thm:poisson_type>Let <math|g\<in\>A>. Then the Hankel summation
    formula <eqref|eq:hankel_summation_formula> implies the Poisson-type
    summation formula

    <\equation>
      <sqrt|2*\<pi\>>*<big|sum><rsub|n>a<rsub|n>*<wide|g|^><around|(|2*\<pi\>*\<lambda\><rsub|n>*a|)>=a<rsup|-1>*<big|sum><rsub|n>b<rsub|n>*<wide|g|^><around|(|\<mu\><rsub|n>*\<pi\>*a<rsup|-1>|)>,<space|1em>a\<in\>\<bbb-R\><rsub|+>.<label|eq:poisson_summation>
    </equation>
  </theorem>

  <\proof>
    By well-known facts from the theory of bilateral Laplace transforms (cf.
    <cite|16>), function

    <\equation>
      \<Omega\><around|(|z|)>\<assign\>\<cal-L\><rsub|z*u>*<around|{|g*<around|(|a*u|)>|}>=a<rsup|-1>*<big|int><rsub|\<bbb-R\>>g<around|(|u|)>*e<rsup|-z*a<rsup|-1>*u>*<space|0.17em>d*u<label|eq:poisson_proof_1>
    </equation>

    is analytic in its strip of convergence <math|S>, and the
    Riemann-Lebesgue lemma yields

    <\equation>
      lim<rsub|<around|\||y|\|>\<to\>\<infty\>>
      \<Omega\>*<around|(|x+i*y|)>=0,<label|eq:riemann_lebesgue>
    </equation>

    uniformly for <math|<around|\||x|\|>\<leq\>\<delta\>\<less\>\<eta\>>.

    By <eqref|eq:riemann_lebesgue>, have

    <\equation>
      \<Omega\>*<around|(|i*y|)>=a<rsup|-1>*<sqrt|2*\<pi\>>*<wide|g|^><around|(|y*a<rsup|-1>|)>.<label|eq:poisson_proof_2>
    </equation>

    Hence by Theorem<nbsp><reference|thm:residue_formula> and Fourier's
    inversion formula <eqref|eq:fourier_inversion>:

    <\equation>
      <big|sum><rsub|n>b<rsub|n>*<wide|g|^><around|(|\<mu\><rsub|n>*\<pi\>*a<rsup|-1>|)>=<big|sum><rsub|n>a<rsub|n>*e<rsup|-2*\<pi\>*i*\<lambda\><rsub|n>*y>*<wide|g|^><around|(|y*a<rsup|-1>|)>*<space|0.17em>d*y=a*<sqrt|2*\<pi\>>*<big|sum><rsub|n>a<rsub|n>*<wide|g|^><around|(|2*\<pi\>*\<lambda\><rsub|n>*a|)>.<label|eq:poisson_proof_3>
    </equation>

    This proves <eqref|eq:poisson_summation>.
  </proof>

  <\remark>
    <label|rem:poisson_remarks>

    <\enumerate>
      <item>The special case <math|a=1> of
      Theorem<nbsp><reference|thm:poisson_type> with the Hankel formula
      <eqref|eq:hankel_summation_formula> replaced by Riemann's functional
      equation <eqref|eq:chi_right>\U<eqref|eq:chi_left> has been proved by
      means of the theory of almost periodic Schwarz distributions via
      Cauchy's theorem in <cite|22>.

      <item>The special case of <eqref|eq:poisson_summation> for even
      functions <math|g>, <math|a=1> and <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n>
      has been deduced from Riemann's functional equation
      <eqref|eq:chi_right>\U<eqref|eq:chi_left> by Ferrar (cf. <cite|1|18>)
      and Patterson <cite|26>. Their methods of proof are mainly based upon
      Mellin's inversion formula and Cauchy's residue theorem.
    </enumerate>
  </remark>

  <section|Sampling theorems and Hankel transforms><label|sec:sampling>

  For <math|\<sigma\>\<geq\>0> and <math|1\<leq\>p\<less\>\<infty\>>, let
  <math|B<rsub|\<sigma\>><rsup|p>> be the class of entire functions
  <math|f:\<bbb-C\>\<to\>\<bbb-C\>> of exponential type <math|\<sigma\>>,
  i.e.,

  <\equation>
    <around|\||f<around|(|z|)>|\|>\<less\>exp
    <around|(|\<sigma\><around|\||y|\|>|)><around|\<\|\|\>|f|\<\|\|\>><rsub|C>,<space|1em>z=x+i*y\<in\>\<bbb-C\>,<label|eq:exponential_type>
  </equation>

  which belong to <math|L<rsup|p><around|(|\<bbb-R\>|)>> when restricted to
  <math|\<bbb-R\>>. Have

  <\equation>
    B<rsub|\<sigma\>><rsup|p>\<subseteq\>B<rsub|\<sigma\>><rsup|q>,<space|1em>1\<leq\>p\<leq\>q\<leq\>\<infty\>,<label|eq:bsp_inclusion>
  </equation>

  and the Paley-Wiener theorem states that a function
  <math|f\<in\>L<rsup|p><around|(|\<bbb-R\>|)>>, <math|1\<less\>p\<less\>2>,
  has an extension to <math|\<bbb-C\>> as an element of
  <math|B<rsub|\<sigma\>><rsup|p>> if and only if
  <math|<wide|f|^><around|(|\<nu\>|)>=0> for
  <math|<around|\||\<nu\>|\|>\<geq\>\<sigma\>>. Hence in view of
  <eqref|eq:bsp_inclusion>, say that <math|f> is band-limited to
  <math|\<pi\>*W> if <math|f\<in\>B<rsub|W><rsup|p>> for some
  <math|W\<gtr\>0> and <math|1\<less\>p\<leq\>\<infty\>> (cf. <cite|8>).

  Now use Theorem<nbsp><reference|thm:poisson_type> to deduce from
  <eqref|eq:hankel_summation_formula> the classical form of the
  Whittaker-Shannon sampling theorem (cf. <cite|8>).

  <\theorem>
    <label|thm:hankel_shannon>For some <math|W\<gtr\>0>,
    <math|1\<less\>p\<less\>\<infty\>>, let <math|f\<in\>B<rsub|W><rsup|p>>
    be such that <eqref|eq:class_A_prop_2> holds with
    <math|a=<around|(|2*\<pi\>*W|)><rsup|-1>>. Then the Hankel summation
    formula <eqref|eq:hankel_summation_formula> implies

    <\equation>
      f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>,<space|1em>t\<in\>\<bbb-R\>,<label|eq:hankel_shannon_result>
    </equation>

    the series being absolutely and uniformly convergent.
  </theorem>

  <\proof>
    Trivially,

    <\equation>
      f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<around*|(|<frac|n|W>|)><math-up|sinc><around|(|n|)>,<space|1em>t\<in\>\<bbb-R\>.<label|eq:hankel_shannon_proof_1>
    </equation>

    Now let <math|g\<in\>B<rsub|W><rsup|p>> with <eqref|eq:class_A_prop_2>.
    Then the Paley-Wiener theorem yields <math|<wide|g|^><around|(|\<nu\>|)>=0>
    for <math|<around|\||\<nu\>|\|>\<geq\>2*\<pi\>*W> and by
    Theorem<nbsp><reference|thm:poisson_type> with <math|a=b<rsub|n>=1>,
    <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n>, <math|n\<in\>\<bbb-N\>>:

    <\equation>
      <sqrt|2*\<pi\>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>><wide|g|^><around*|(|<frac|n|W>|)>=<wide|g|^><around|(|0|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|\<bbb-R\>>g<around|(|u|)>*<space|0.17em>d*u.<label|eq:hankel_shannon_proof_2>
    </equation>

    Let <math|f<rsub|1>,f<rsub|2>\<in\>B<rsub|W><rsup|p>> and apply
    <eqref|eq:hankel_shannon_proof_2> to <math|g<rsub|1><around|(|u|)>\<assign\>f<rsub|1><around|(|u|)>*f<rsub|2>*<around|(|t-u|)>\<in\>B<rsub|W><rsup|p>>
    with <eqref|eq:class_A_prop_2>. Then the convolution integral
    <math|f<rsub|1>\<ast\>f<rsub|2>> can be replaced by the discrete version
    (cf. <cite|8>):

    <\equation>
      <around|(|f<rsub|1>\<ast\>f<rsub|2>|)><around|(|t|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|\<bbb-R\>>f<rsub|1><around|(|u|)>*f<rsub|2>*<around|(|t-u|)>*<space|0.17em>d*u=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<rsub|1><around*|(|<frac|n|W>|)>*f<rsub|2>*<around*|(|t-<frac|n|W>|)>,<space|1em>t\<in\>\<bbb-R\>.<label|eq:hankel_shannon_proof_3>
    </equation>

    Take <math|f<rsub|1>=f> and <math|f<rsub|2><around|(|\<cdummy\>|)>=<math-up|sinc><around|{|W\<cdot\>|}>>
    in <eqref|eq:hankel_shannon_proof_3>. Then the commutativity of the
    integral <math|f<rsub|1>\<ast\>f<rsub|2>> yields

    <\equation>
      <big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>f<around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>=f<around|(|t|)><math-up|sinc><around|(|0|)>,<label|eq:hankel_shannon_proof_4>
    </equation>

    and in view of <eqref|eq:hankel_shannon_proof_1> obtain
    <eqref|eq:hankel_shannon_result>.

    Finally, the convergence assertion follows from a theorem of Nikol'skii
    <cite|25>, which states that for any <math|h\<gtr\>0> and
    <math|f\<in\>B<rsub|\<sigma\>><rsup|p>>,
    <math|1\<less\>p\<leq\>\<infty\>>:

    <\equation>
      sup<rsub|u\<in\>\<bbb-R\>><around|\||f*<around|(|u-h*n|)>|\|><rsup|p>\<less\><big|sum><rsub|n><around|\<\|\|\>|f|\<\|\|\>><rsub|p><rsup|p>.<label|eq:nikol_skii>
    </equation>

    Hence Theorem<nbsp><reference|thm:hankel_shannon> is proved.
  </proof>

  Now generalize Theorem<nbsp><reference|thm:hankel_shannon> by applying
  Theorem<nbsp><reference|thm:poisson_type> to a special function and to the
  case of Dirichlet series <eqref|eq:dirichlet_series> with
  <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n>.

  <\theorem>
    <label|thm:riemann_hankel>For <math|t\<in\>\<bbb-R\>> fixed and
    <math|W\<gtr\>0>, let

    <\equation>
      g<rsub|1><around|(|u|)>\<assign\>f<around|(|u|)><math-up|sinc><around|{|W*<around|(|t-u|)>|}>\<in\>A,<label|eq:riemann_hankel_setup>
    </equation>

    where

    <\equation>
      f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>\<cap\>C<around|(|\<bbb-R\>|)>,<space|1em><text|with
      ><wide|f|^>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>.<label|eq:riemann_hankel_condition>
    </equation>

    Then the Hankel summation formula <eqref|eq:hankel_summation_formula>
    implies for <math|t\<in\>\<bbb-R\>>,

    <\equation>
      f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>a<rsub|n>*<wide|f|^><around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>+R<around|(|f,\<phi\>,\<psi\>,W|)><around|(|t|)>,<label|eq:riemann_hankel_result>
    </equation>

    where the remainder

    <\equation>
      R<around|(|f,\<phi\>,\<psi\>,W|)><around|(|t|)>\<assign\><frac|1|<sqrt|2*\<pi\>>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>><around*|{|1-b<rsub|n>*e<rsup|-2*\<pi\>*i*n*y>|}>*<big|int><rsub|<around|(|2*n-1|)>*\<pi\>*W><rsup|<around|(|2*n+1|)>*\<pi\>*W><wide|f|^><around|(|v|)>*e<rsup|i*t*v>*<space|0.17em>d*v<label|eq:remainder_formula>
    </equation>

    is uniformly bounded in <math|t\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Need the generalized Parseval formula

    <\equation>
      <big|int><rsub|\<bbb-R\>>f<rsub|1><around|(|u|)><wide|f<rsub|2><around|(|u|)>|\<bar\>><space|0.17em>d*u=<big|int><rsub|\<bbb-R\>><wide|f|^><rsub|1><around|(|v|)><wide|<wide|f|^><rsub|2><around|(|v|)>|\<bar\>><space|0.17em>d*v,<space|1em>f<rsub|1>,f<rsub|2>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>,<label|eq:parseval>
    </equation>

    where the bar indicates complex conjugates.

    Take <math|f<rsub|1><around|(|u|)>=f<around|(|u|)>*e<rsup|-i*y*u>>,
    <math|y\<in\>\<bbb-R\>>, and <math|f<rsub|2><around|(|u|)>=<math-up|sinc><around|{|W*<around|(|t-u|)>|}>>.
    Since

    <\equation>
      <wide|f|^><rsub|1><around|(|v|)>=<wide|f|^>*<around|(|v+y|)><label|eq:proof_f1_hat>
    </equation>

    and

    <\equation>
      <wide|f|^><rsub|2><around|(|v|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|2*\<pi\>>>*W<rsup|-1>*e<rsup|-i*t*v>,>|<cell|<around|\||v|\|>\<less\>\<pi\>*W,>>|<row|<cell|0,>|<cell|<around|\||v|\|>\<gtr\>\<pi\>*W,>>>>><label|eq:proof_f2_hat>
    </equation>

    obtain from <eqref|eq:parseval>,

    <\equation>
      <wide|f|^><around|(|y|)>=e<rsup|-i*y*t>*<frac|1|<sqrt|2*\<pi\>*W>>*<big|int><rsub|-\<pi\>*W+y><rsup|+\<pi\>*W+y><wide|f|^><around|(|v|)>*e<rsup|i*t*v>*<space|0.17em>d*v.<label|eq:proof_convolution>
    </equation>

    Directly show that <math|g<rsub|t>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>\<cap\>C<around|(|\<bbb-R\>|)>>
    and <math|<wide|g|^><rsub|t>\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>. Hence
    by Theorem<nbsp><reference|thm:poisson_type> with
    <math|a=<around|(|2*\<pi\>*W|)><rsup|-1>>,
    <math|\<lambda\><rsub|n>=\<mu\><rsub|n>=n> and by
    <eqref|eq:proof_convolution>:

    <\equation>
      <big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>a<rsub|n>*g<rsub|t><around*|(|<frac|n|W>|)>=W*<sqrt|2*\<pi\>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>b<rsub|n>*<wide|g|^><rsub|t>*<around|(|2*\<pi\>*W*n|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>><big|int><rsub|<around|(|2*n-1|)>*\<pi\>*W><rsup|<around|(|2*n+1|)>*\<pi\>*W><wide|f|^><around|(|v|)>*e<rsup|i*t*v>*<space|0.17em>d*v*e<rsup|-2*\<pi\>*i*n*W*t>.<label|eq:proof_poisson>
    </equation>

    Now split off the integral in Fourier's inversion formula
    <eqref|eq:fourier_inversion> in the form

    <\equation>
      f<around|(|t|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>><big|int><rsub|<around|(|2*n-1|)>*\<pi\>*W><rsup|<around|(|2*n+1|)>*\<pi\>*W><wide|f|^><around|(|v|)>*e<rsup|i*t*v>*<space|0.17em>d*v.<label|eq:proof_fourier_split>
    </equation>

    Hence subtraction of <eqref|eq:proof_poisson> from
    <eqref|eq:proof_fourier_split> leads to the required result
    <eqref|eq:riemann_hankel_result> with the remainder
    <eqref|eq:remainder_formula>.

    Finally, observe that by the Hamburger-Siegel theorem (cf.
    <cite|19|29|30>) the sequence <math|<around|{|b<rsub|n>|}>> is bounded.
    Hence there is an absolute constant <math|c\<geq\>2> so that

    <\equation>
      <around|\||R<around|(|f,\<phi\>,\<psi\>,W|)><around|(|t|)>|\|>\<less\><frac|c|<sqrt|2*\<pi\>>>*<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>><big|int><rsub|<around|(|2*n-1|)>*\<pi\>*W><rsup|<around|(|2*n+1|)>*\<pi\>*W><around|\||<wide|f|^><around|(|v|)>|\|>*<space|0.17em>d*v=c<around|\<\|\|\>|<wide|f|^>|\<\|\|\>><rsub|1>.<label|eq:remainder_bound>
    </equation>

    This proves Theorem<nbsp><reference|thm:riemann_hankel>.
  </proof>

  <\remark>
    <label|rem:sampling_remarks>

    <\enumerate>
      <item>If <math|b<rsub|0>=<math-up|res><rsub|s=1>\<zeta\><around|(|s|)>=1>,
      then with an absolute constant <math|c\<geq\>2>,

      <\equation>
        <around|\||R<around|(|f,\<phi\>,\<psi\>,W|)><around|(|t|)>|\|>\<less\><frac|c|<sqrt|2*\<pi\>>>*<big|sum><rsub|n\<neq\>0><big|int><rsub|<around|(|2*n-1|)>*\<pi\>*W><rsup|<around|(|2*n+1|)>*\<pi\>*W><around|\||<wide|f|^><around|(|v|)>*<around|\||<space|0.17em>d*v=<frac|c|<sqrt|2*\<pi\>>>*<big|int><rsub|<around|\||v|\|>\<gtr\>\<pi\>*W>|\|>*<wide|f|^><around|(|v|)>|\|>*<space|0.17em>d*v.<label|eq:remainder_zeta>
      </equation>

      Hence in this case, <math|lim<rsub|W\<to\>\<infty\>>
      R<around|(|f,\<phi\>,\<psi\>,W|)><around|(|t|)>=0> uniformly in
      <math|t\<in\>\<bbb-R\>> and <eqref|eq:riemann_hankel_result> becomes

      <\equation>
        f<around|(|t|)>=lim<rsub|W\<to\>\<infty\>>
        <big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>a<rsub|n>*<wide|f|^><around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>,<label|eq:limit_form>
      </equation>

      uniformly in <math|t\<in\>\<bbb-R\>>.

      <item>If, in addition, <math|f> is band-limited to
      <math|<around|[|-\<pi\>*W,\<pi\>*W|]>>, i.e.,
      <math|<wide|f|^><around|(|\<nu\>|)>=0> for almost all
      <math|<around|\||\<nu\>|\|>\<gtr\>\<pi\>*W>, then <eqref|eq:limit_form>
      admits the form

      <\equation>
        f<around|(|t|)>=<big|sum><rsub|n=-\<infty\>><rsup|+\<infty\>>a<rsub|n>*<wide|f|^><around*|(|<frac|n|W>|)><math-up|sinc><around|{|W*t-n|}>,<space|1em>t\<in\>\<bbb-R\>.<label|eq:band_limited_form>
      </equation>

      Since the sequence <math|<around|{|a<rsub|n>|}>> is bounded, it follows
      from <eqref|eq:nikol_skii> that the series in
      <eqref|eq:band_limited_form> converges absolutely and uniformly.

      <item>Consider the special case <math|a<rsub|n>=b<rsub|n>=1> of
      Theorem<nbsp><reference|thm:riemann_hankel>. By definition
      <eqref|eq:residue_definition> and well-known facts from the theory of
      the <math|\<zeta\>>-function (cf. <cite|30>), have

      <\equation>
        a<rsub|0>=-2*\<zeta\><around|(|0|)>=1,<space|1em>b<rsub|0>=<math-up|res><rsub|s=1>\<zeta\><around|(|s|)>=1.<label|eq:zeta_values>
      </equation>

      Hence the special Hankel summation formula (cf. <cite|17|24>)

      <\equation>
        <frac|\<pi\>|\<Gamma\>*<around|(|\<nu\>+1|)>>*<around|(|T<rsub|\<nu\>+1>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1>n<rsup|-\<nu\>>*<around|(|H<rsub|\<nu\>>*f|)>*<around|(|\<pi\><rsup|2>*n<rsup|2>|)>=<frac|\<pi\><rsup|\<nu\>-1/2>|\<Gamma\>*<around|(|\<nu\>+1/2|)>>*<around*|[|<around|(|T<rsub|1,\<nu\>>*f|)><around|(|0|)>+2*<big|sum><rsub|n\<geq\>1><around|(|T<rsub|1,\<nu\>>*f|)><around|(|n<rsup|2>|)>|]>,<label|eq:special_hankel>
      </equation>

      valid for <math|\<nu\>\<gtr\><frac|1|2>>, implies the classical forms
      <eqref|eq:whittaker_cardinal> and <eqref|eq:brown_butzer> of the
      sampling theorem.
    </enumerate>
  </remark>

  <\thebibliography|99>
    <bibitem|1>R. Bellman, <with|font-shape|italic|A Brief Introduction to
    Theta Functions>, Holt, Rinehart & Winston, New York, 1961.

    <bibitem|2>B.C. Berndt, Identities involving the coefficients of a class
    of Dirichlet series I, <with|font-shape|italic|Trans. Amer. Math. Soc.>
    <with|font-series|bold|137> (1969) 345\U359.

    <bibitem|3>S. Bochner, Some properties of modular relations,
    <with|font-shape|italic|Ann. of Math.> <with|font-series|bold|53> (1951)
    332\U363.

    <bibitem|4>S. Bochner and K. Chandrasekharan, On Riemann's functional
    equation, <with|font-shape|italic|Ann. of Math.>
    <with|font-series|bold|63> (1956) 336\U359.

    <bibitem|5>P.L. Butzer, M. Hauss and R.L. Stens, The sampling theorem and
    its unique role in various branches of mathematics,
    <with|font-shape|italic|Mitt. Math. Ges. Hamburg>
    <with|font-series|bold|12>(3) (1991) 523\U547.

    <bibitem|6>P.L. Butzer and R.J. Nessel, <with|font-shape|italic|Fourier
    Analysis and Approximation I>, Birkhäuser, Basel, 1971.

    <bibitem|7>P.L. Butzer, S. Ries and R.L. Stens, Shannon's sampling
    theorem, Cauchy's integral formula and related results, in: P.L. Butzer,
    R.L. Stens and B.Sz. Nagy, Eds., <with|font-shape|italic|Anniversary
    Volume on Approximation Theory and Functional Analysis>, Internat. Ser.
    Numer. Math. <with|font-series|bold|65>, Birkhäuser, Basel, 1984, pp.
    363\U377.

    <bibitem|8>P.L. Butzer, W. Splettstöÿer and R.L. Stens, The sampling
    theorem and linear prediction in signal analysis,
    <with|font-shape|italic|Jahresber. Deutsch. Math.-Verein.>
    <with|font-series|bold|90> (1988) 1\U70.

    <bibitem|9>P.L. Butzer and R.L. Stens, The Poisson summation formula,
    Whittaker's cardinal series and approximate integration, in:
    <with|font-shape|italic|Proc. Second Edmonton Conf. on Approximation
    Theory>, Canad. Math. Soc. Proc. <with|font-series|bold|3>, Amer.
    Mathematical Soc., Providence, RI, 1983, pp. 19\U36.

    <bibitem|10>P.L. Butzer and R.L. Stens, The Euler-Maclaurin summation
    formula, the sampling theorem, and approximate integration over the real
    axis, <with|font-shape|italic|Linear Algebra Appl.>
    <with|font-series|bold|52/53> (1983) 141\U155.

    <bibitem|11>K. Chandrasekharan and H. Joris, Dirichlet series with
    functional equations and related arithmetical identities,
    <with|font-shape|italic|Acta Arith.> <with|font-series|bold|24> (1973)
    165\U191.

    <bibitem|12>K. Chandrasekharan and S. Mandelbrojt, On Riemann's
    functional equation, <with|font-shape|italic|Ann. of Math.>
    <with|font-series|bold|66> (1957) 285\U296.

    <bibitem|13>K. Chandrasekharan and R. Narasimhan, Hecke's functional
    equation and arithmetical identities, <with|font-shape|italic|Ann. of
    Math.> <with|font-series|bold|74> (1961) 1\U23.

    <bibitem|14>K. Chandrasekharan and R. Narasimhan, Functional equations
    with multiple gamma factors and the average order of arithmetical
    functions, <with|font-shape|italic|Ann. of Math.>
    <with|font-series|bold|76> (1962) 93\U136.

    <bibitem|15>G. Doetsch, Summatorische Eigenschaften der Besselschen
    Funktionen und andere Funktionalrelationen, die mit der linearen
    Transformationsformel der Thetafunktion äquivalent sind,
    <with|font-shape|italic|Compositio Math.> <with|font-series|bold|1>
    (1935) 85\U97.

    <bibitem|16>G. Doetsch, <with|font-shape|italic|Handbuch der
    Laplace-Transformation>, Vols. I\UIII, Birkhäuser, Basel, 1955.

    <bibitem|17>A. Erdelyi, Gewisse Reihentransformationen, die mit der
    linearen Transformationsformel der Thetafunktion zusammenhängen,
    <with|font-shape|italic|Compositio Math.> <with|font-series|bold|4>
    (1937) 406\U423.

    <bibitem|18>W.L. Ferrar, Summation formulae and their relation to
    Dirichlet Series II, <with|font-shape|italic|Compositio Math.>
    <with|font-series|bold|4> (1936\U37) 394\U405.

    <bibitem|19>H. Hamburger, Über einige Beziehungen, die mit der
    Funktionalgleichung der Riemannschen <math|\<zeta\>>-Funktion äquivalent
    sind, <with|font-shape|italic|Math. Ann.> <with|font-series|bold|85>
    (1922) 129\U140.

    <bibitem|20>E. Hecke, <with|font-shape|italic|Dirichlet Series, Modular
    Functions and Quadratic Forms>, Princeton Univ. Press, Princeton, NJ,
    1938.

    <bibitem|21>J.R. Higgins, Five short stories about the cardinal series,
    <with|font-shape|italic|Bull. Amer. Math. Soc.>
    <with|font-series|bold|12> (1985) 45\U89.

    <bibitem|22>J.P. Kahane and S. Mandelbrojt, L'équation fonctionelle de
    Riemann et la formule sommatoire de Poisson, <with|font-shape|italic|Ann.
    Sci. École Norm. Sup.> <with|font-series|bold|75> (1958) 57\U80.

    <bibitem|23>D. Klusch, The sampling theorem, Dirichlet series and Bessel
    functions, <with|font-shape|italic|Math. Nachr.>
    <with|font-series|bold|154> (1991) 129\U139.

    <bibitem|24>D. Klusch, On the summation of Bessel functions and Hankel
    transforms, <with|font-shape|italic|J. Math. Anal. Appl.>
    <with|font-series|bold|160> (1991) 303\U313.

    <bibitem|25>S.M. Nikol'skii, <with|font-shape|italic|Approximation of
    Functions of Several Variables and Imbedding Theorems>, Springer, Berlin,
    1975.

    <bibitem|26>S.J. Patterson, <with|font-shape|italic|An Introduction to
    the Theory of the Riemann Zeta-function>, Cambridge Univ. Press,
    Cambridge, 1989.

    <bibitem|27>B. Riemann, Über die Anzahl der Primzahlen unter einer
    gegebenen Grösse, <with|font-shape|italic|Monatsber. Akad. Berlin> (1859)
    671\U680.

    <bibitem|28>C.E. Shannon, Communication in the presence of noise,
    <with|font-shape|italic|Proc. IRE> <with|font-series|bold|37> (1949)
    10\U21.

    <bibitem|29>C.L. Siegel, Bemerkung zu einem Satz von Hamburger über die
    Funktionalgleichung der Riemannschen Zetafunktion,
    <with|font-shape|italic|Math. Ann.> <with|font-series|bold|86> (1922)
    276\U279.

    <bibitem|30>E.C. Titchmarsh, <with|font-shape|italic|The Theory of the
    Riemann Zeta-function>, Oxford Univ. Press, Oxford, 1967.

    <bibitem|31>G.N. Watson, <with|font-shape|italic|A Treatise on the Theory
    of Bessel Functions>, Cambridge Univ. Press, Cambridge, 1922.

    <bibitem|32>E.T. Whittaker, On the functions which are represented by the
    expansion of the interpolation-theory, <with|font-shape|italic|Proc. Roy.
    Soc. Edinburgh> <with|font-series|bold|35> (1915) 181\U194.

    <bibitem|33>E.T. Whittaker and G.N. Watson, <with|font-shape|italic|A
    Course of Modern Analysis>, Cambridge Univ. Press, Cambridge, 4th ed.,
    1973.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|6>>
    <associate|auto-4|<tuple|4|8>>
    <associate|auto-5|<tuple|73|11>>
    <associate|bib-1|<tuple|1|11>>
    <associate|bib-10|<tuple|10|11>>
    <associate|bib-11|<tuple|11|11>>
    <associate|bib-12|<tuple|12|11>>
    <associate|bib-13|<tuple|13|11>>
    <associate|bib-14|<tuple|14|11>>
    <associate|bib-15|<tuple|15|11>>
    <associate|bib-16|<tuple|16|11>>
    <associate|bib-17|<tuple|17|11>>
    <associate|bib-18|<tuple|18|11>>
    <associate|bib-19|<tuple|19|12>>
    <associate|bib-2|<tuple|2|11>>
    <associate|bib-20|<tuple|20|12>>
    <associate|bib-21|<tuple|21|12>>
    <associate|bib-22|<tuple|22|12>>
    <associate|bib-23|<tuple|23|12>>
    <associate|bib-24|<tuple|24|12>>
    <associate|bib-25|<tuple|25|12>>
    <associate|bib-26|<tuple|26|12>>
    <associate|bib-27|<tuple|27|12>>
    <associate|bib-28|<tuple|28|12>>
    <associate|bib-29|<tuple|29|12>>
    <associate|bib-3|<tuple|3|11>>
    <associate|bib-30|<tuple|30|12>>
    <associate|bib-31|<tuple|31|12>>
    <associate|bib-32|<tuple|32|12>>
    <associate|bib-33|<tuple|33|12>>
    <associate|bib-4|<tuple|4|11>>
    <associate|bib-5|<tuple|5|11>>
    <associate|bib-6|<tuple|6|11>>
    <associate|bib-7|<tuple|7|11>>
    <associate|bib-8|<tuple|8|11>>
    <associate|bib-9|<tuple|9|11>>
    <associate|def:class_An|<tuple|7|6>>
    <associate|def:riemann_functional|<tuple|1|3>>
    <associate|eq:band_limited_form|<tuple|71|11>>
    <associate|eq:bessel_asymptotic|<tuple|21|4>>
    <associate|eq:bessel_summation_eq|<tuple|15|3>>
    <associate|eq:brown_butzer|<tuple|2|1>>
    <associate|eq:bsp_inclusion|<tuple|51|8>>
    <associate|eq:chi_left|<tuple|11|3>>
    <associate|eq:chi_right|<tuple|10|3>>
    <associate|eq:class_A_prop_1|<tuple|43|7>>
    <associate|eq:class_A_prop_2|<tuple|44|7>>
    <associate|eq:dirichlet_series|<tuple|9|3>>
    <associate|eq:exponential_type|<tuple|50|8>>
    <associate|eq:fourier_inversion|<tuple|6|2>>
    <associate|eq:fourier_l2|<tuple|5|2>>
    <associate|eq:fourier_transform|<tuple|4|2>>
    <associate|eq:hankel_bound|<tuple|22|4>>
    <associate|eq:hankel_class_1|<tuple|36|6>>
    <associate|eq:hankel_class_2|<tuple|37|6>>
    <associate|eq:hankel_computed|<tuple|26|5>>
    <associate|eq:hankel_condition_1|<tuple|16|4>>
    <associate|eq:hankel_condition_2|<tuple|17|4>>
    <associate|eq:hankel_proof_1|<tuple|20|4>>
    <associate|eq:hankel_proof_2|<tuple|23|4>>
    <associate|eq:hankel_shannon_proof_1|<tuple|53|9>>
    <associate|eq:hankel_shannon_proof_2|<tuple|54|9>>
    <associate|eq:hankel_shannon_proof_3|<tuple|55|9>>
    <associate|eq:hankel_shannon_proof_4|<tuple|56|9>>
    <associate|eq:hankel_shannon_result|<tuple|52|8>>
    <associate|eq:hankel_summation_formula|<tuple|19|4>>
    <associate|eq:hankel_transform|<tuple|8|2>>
    <associate|eq:hankel_whittaker|<tuple|27|5>>
    <associate|eq:laplace_transform|<tuple|7|2>>
    <associate|eq:limit_form|<tuple|70|10>>
    <associate|eq:lp_norm|<tuple|3|2>>
    <associate|eq:nikol_skii|<tuple|57|9>>
    <associate|eq:operator_computed|<tuple|28|5>>
    <associate|eq:operator_definition|<tuple|18|4>>
    <associate|eq:operator_xi|<tuple|31|5>>
    <associate|eq:operator_zero|<tuple|29|5>>
    <associate|eq:parseval|<tuple|62|10>>
    <associate|eq:partial_fraction|<tuple|35|6>>
    <associate|eq:poisson_proof_1|<tuple|46|7>>
    <associate|eq:poisson_proof_2|<tuple|48|8>>
    <associate|eq:poisson_proof_3|<tuple|49|8>>
    <associate|eq:poisson_summation|<tuple|45|7>>
    <associate|eq:proof_convolution|<tuple|65|10>>
    <associate|eq:proof_f1_hat|<tuple|63|10>>
    <associate|eq:proof_f2_hat|<tuple|64|10>>
    <associate|eq:proof_fourier_split|<tuple|67|10>>
    <associate|eq:proof_poisson|<tuple|66|10>>
    <associate|eq:remainder_bound|<tuple|68|10>>
    <associate|eq:remainder_formula|<tuple|61|9>>
    <associate|eq:remainder_zeta|<tuple|69|10>>
    <associate|eq:residue_definition|<tuple|12|3>>
    <associate|eq:residue_formula_eq|<tuple|38|6>>
    <associate|eq:residue_proof_1|<tuple|39|7>>
    <associate|eq:residue_proof_2|<tuple|40|7>>
    <associate|eq:residue_proof_3|<tuple|41|7>>
    <associate|eq:residue_proof_4|<tuple|42|7>>
    <associate|eq:riemann_hankel_condition|<tuple|59|9>>
    <associate|eq:riemann_hankel_result|<tuple|60|9>>
    <associate|eq:riemann_hankel_setup|<tuple|58|9>>
    <associate|eq:riemann_lebesgue|<tuple|47|7>>
    <associate|eq:special_hankel|<tuple|73|11>>
    <associate|eq:symmetric_extension|<tuple|13|3>>
    <associate|eq:test_function|<tuple|24|4>>
    <associate|eq:test_satisfies_1|<tuple|25|5>>
    <associate|eq:theta_relation_eq|<tuple|14|3>>
    <associate|eq:whittaker_cardinal|<tuple|1|1>>
    <associate|eq:whittaker_integral|<tuple|30|5>>
    <associate|eq:whittaker_special|<tuple|34|5>>
    <associate|eq:whittaker_theta|<tuple|33|5>>
    <associate|eq:zeta_values|<tuple|72|11>>
    <associate|lem:bessel_summation|<tuple|3|3>>
    <associate|lem:hilbert_kernel|<tuple|6|6>>
    <associate|lem:theta_relation|<tuple|2|3>>
    <associate|rem:poisson_remarks|<tuple|11|8>>
    <associate|rem:remarks_2_5|<tuple|5|6>>
    <associate|rem:sampling_remarks|<tuple|14|10>>
    <associate|rem:theta_special|<tuple|9|7>>
    <associate|sec:intro|<tuple|1|1>>
    <associate|sec:poisson|<tuple|3|6>>
    <associate|sec:riemann|<tuple|2|3>>
    <associate|sec:sampling|<tuple|4|8>>
    <associate|thm:hankel_shannon|<tuple|12|8>>
    <associate|thm:poisson_type|<tuple|10|7>>
    <associate|thm:residue_formula|<tuple|8|6>>
    <associate|thm:riemann_functional|<tuple|4|4>>
    <associate|thm:riemann_hankel|<tuple|13|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      28

      32

      7

      8

      9

      10

      5

      8

      21

      2

      3

      4

      11

      12

      13

      14

      22

      15

      17

      19

      20

      27

      29

      18

      1

      26

      4

      11

      19

      11

      15

      16

      23

      24

      31

      11

      31

      33

      16

      15

      31

      1

      17

      4

      11

      19

      29

      6

      19

      16

      22

      1

      18

      26

      8

      8

      8

      25

      19

      29

      30

      30

      17

      24
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Riemann's
      functional equation and Hankel transforms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Poisson
      formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Sampling
      theorems and Hankel transforms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>