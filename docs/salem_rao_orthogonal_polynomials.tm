<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\abstract>
    We develop the theory of orthogonal polynomials associated with the
    Salem\URao kernel weight <math|w<around|(|u|)>=e<rsup|u>/<around|(|e<rsup|e<rsup|u>>+1|)>>
    on <math|\<bbb-R\>>. The moments of this weight are identified as
    <math|\<mu\><rsub|k>=F<rsup|<around|(|k|)>><around|(|1|)>> where
    <math|F<around|(|s|)>=\<Gamma\><around|(|s|)>*<around|(|1-2<rsup|1-s>|)>*\<zeta\><around|(|s|)>>
    is entire, yielding a closed-form moment formula for arbitrary index
    <math|k> in terms of the Taylor coefficients of <math|log \<Gamma\>> and
    the Stieltjes constants. We derive a general closed-form expression for
    <math|\<mu\><rsub|k>> as a finite double sum, establish the Hankel
    determinantal representation <math|P<rsub|n><around|(|u|)>=\<Delta\><rsub|n-1><rsup|-1>*det
    <around|(|\<mu\><rsub|i+j>*<text|'s and powers of >u|)>> for the
    <math|n>-th monic orthogonal polynomial at arbitrary index <math|n>,
    prove strict positivity of all Hankel determinants
    <math|\<Delta\><rsub|n>\<gtr\>0> via Carleman's criterion and a support
    argument, and give the three-term recurrence with closed-form recurrence
    coefficients <math|\<alpha\><rsub|n>>, <math|\<beta\><rsub|n>> expressed
    through the moment sequence.
  </abstract>

  <documentclass*|11pt|amsart> <usepackage|amssymb,amsmath,amsthm,mathrsfs>
  <usepackage*|margin=1in|geometry> <usepackage|hyperref>

  <numberwithin|equation|section> par-first=12pt

  <new-theorem|theorem|Theorem>[section] <new-theorem|corollary|Corollary><new-theorem|lemma|Lemma><new-theorem|proposition|Proposition><theoremstyle|definition>
  <new-theorem|definition|Definition><new-theorem|remark|Remark><new-theorem|notation|Notation>

  <assign|baselinestretch|<macro|1.4>>

  <title*|Salem--Rao Orthogonal Polynomials|Orthogonal Polynomials Associated
  with the Salem--Rao Kernel Weight>

  <author|S. Crowley><address|Dallas, Texas> <date|<date|>>

  <subjclass*|2020|33C45, 42C05, 11M06> <keywords|orthogonal polynomials,
  Salem--Rao weight, Fermi--Dirac kernel, Stieltjes constants, Mellin
  transform, Favard's theorem, Hankel determinant>

  <maketitle><assign|tocdepth-nr|2>

  <\table-of-contents|toc>
    \;
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The Fermi\UDirac distribution <math|<around|(|e<rsup|x>+1|)><rsup|-1>> and
  its associated Mellin transform are classical objects in analytic number
  theory and mathematical physics. Under the logarithmic change of variable
  <math|x=e<rsup|u>>, the kernel <math|x<rsup|s-1>/<around|(|e<rsup|x>+1|)>>
  pulls back to <math|e<rsup|s*u>/<around|(|e<rsup|e<rsup|u>>+1|)>>, whose
  restriction to <math|s=1> defines a rapidly decaying, strictly positive
  weight on the real line. We call this the <em|Salem\URao kernel weight>,
  <math|w<around|(|u|)>=e<rsup|u>/<around|(|e<rsup|e<rsup|u>>+1|)>>, and
  develop in this paper the complete theory of the orthogonal polynomial
  sequence <math|<around|{|P<rsub|n>|}><rsub|n\<ge\>0>> generated
  by<nbsp><math|w>.

  The paper is organized as follows. Section<nbsp><reference|sec:weight>
  establishes analytic properties. Section<nbsp><reference|sec:moments>
  proves the closed-form moment formula at arbitrary index.
  Section<nbsp><reference|sec:OP> constructs the <math|n>-th orthogonal
  polynomial via the Hankel determinant for general<nbsp><math|n>.
  Section<nbsp><reference|sec:recurrence> proves the three-term recurrence
  with closed-form coefficients.

  <section|The Salem\URao Weight><label|sec:weight>

  <\definition>
    [Salem\URao kernel weight]<label|def:weight> Let
    <math|\<ell\>\<assign\>log 2>. The <em|Salem\URao kernel weight> is

    <\equation>
      <label|eq:weight>w<around|(|u|)>\<assign\><frac|e<rsup|u>|e<rsup|e<rsup|u>>+1>,<space|2em>u\<in\>\<bbb-R\>.
    </equation>
  </definition>

  <\proposition>
    [Analytic properties]<label|prop:integrability> The weight <math|w>
    satisfies:

    <\enumerate>
      <item*|<with|font-shape|right|(i)>><math|w<around|(|u|)>\<gtr\>0> for
      all <math|u\<in\>\<bbb-R\>>.

      <item*|<with|font-shape|right|(ii)>><math|w\<in\>L<rsup|p><around|(|\<bbb-R\>|)>>
      for every <math|1\<le\>p\<le\>\<infty\>>.

      <item*|<with|font-shape|right|(iii)>>The measure
      <math|w<around|(|u|)>*<space|0.17em>d*u> has finite moments of all
      orders.

      <item*|<with|font-shape|right|(iv)>>The measure
      <math|w<around|(|u|)>*<space|0.17em>d*u> is determinate
      <with|font-shape|right|(>uniquely determined by its
      moments<with|font-shape|right|)>.
    </enumerate>
  </proposition>

  <\proof>
    (i) Immediate: <math|e<rsup|u>\<gtr\>0> and
    <math|e<rsup|e<rsup|u>>+1\<gtr\>1>.

    (ii) As <math|u\<to\>-\<infty\>>, <math|w<around|(|u|)>\<sim\><tfrac|1|2>e<rsup|u>>
    (exponential decay). As <math|u\<to\>+\<infty\>>,
    <math|w<around|(|u|)>\<sim\>e<rsup|u-e<rsup|u>>> (super-exponential
    decay). Hence <math|w<rsup|p>> is integrable for every
    <math|1\<le\>p\<less\>\<infty\>>, and <math|w> is bounded, so
    <math|w\<in\>L<rsup|\<infty\>>>.

    (iii) For any <math|k\<ge\>0>, <math|<around|\||u|\|><rsup|k>*w<around|(|u|)>>
    is dominated by an integrable function: on
    <math|<around|(|-\<infty\>,0|]>> by <math|C<rsub|k>*e<rsup|u/2>>, and on
    <math|<around|[|0,\<infty\>|)>> by <math|C<rsub|k><rprime|'>*e<rsup|u-e<rsup|u>>>,
    both integrable.

    (iv) The super-exponential decay of <math|w> implies that moments grow at
    most factorially: <math|<around|\||\<mu\><rsub|k>|\|>\<le\>C<rsup|k>*k>!
    for some constant <math|C\<gtr\>0>. Therefore
    <math|<big|sum><rsub|k=1><rsup|\<infty\>>\<mu\><rsub|2*k><rsup|-1/<around|(|2*k|)>>=+\<infty\>>,
    and the measure is determinate by Carleman's criterion.
  </proof>

  <section|Closed-Form Moments at Arbitrary Index><label|sec:moments>

  <subsection|The entire function <math|F> and the moment identity>

  <\definition>
    <label|def:F>Define

    <\equation>
      <label|eq:Fdef>F<around|(|s|)>\<assign\>\<Gamma\><around|(|s|)>*<around*|(|1-2<rsup|1-s>|)>*\<zeta\><around|(|s|)>,<space|2em>s\<in\>\<bbb-C\>.
    </equation>

    Since <math|1-2<rsup|1-s>=-\<ell\>*<space|0.17em><around|(|s-1|)>+O<around|(|<around|(|s-1|)><rsup|2>|)>>
    and <math|\<zeta\><around|(|s|)>=<around|(|s-1|)><rsup|-1>+O<around|(|1|)>>,
    the simple pole of <math|\<zeta\>> at <math|s=1> is cancelled, and
    <math|F> is entire.
  </definition>

  <\definition>
    [Moments]<label|def:moments>

    <\equation>
      <label|eq:moments>\<mu\><rsub|k>\<assign\><big|int><rsub|\<bbb-R\>>u<rsup|k>*<space|0.17em>w<around|(|u|)>*<space|0.17em>d*u,<space|2em>k=0,1,2,\<ldots\>
    </equation>
  </definition>

  <\theorem>
    [Moment\Uderivative identity]<label|thm:momentF> For every integer
    <math|k\<ge\>0>,

    <\equation>
      <label|eq:momentF>\<mu\><rsub|k>=F<rsup|<around|(|k|)>><around|(|1|)>=<frac|d<rsup|k>|d*s<rsup|k>>*<around*|[|\<Gamma\><around|(|s|)>*<around|(|1-2<rsup|1-s>|)>*\<zeta\><around|(|s|)>|]><mid|\|><rsub|s=1>.
    </equation>

    Equivalently, <math|F*<around|(|1+\<epsilon\>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|\<mu\><rsub|k>|k!>*\<epsilon\><rsup|k>>
    is the exponential generating function of the moment sequence.
  </theorem>

  <\proof>
    Substitute <math|x=e<rsup|u>> in<nbsp><eqref|eq:moments> to get
    <math|\<mu\><rsub|k>=<big|int><rsub|0><rsup|\<infty\>><around|(|log
    x|)><rsup|k>*<around|(|e<rsup|x>+1|)><rsup|-1>*<space|0.17em>d*x>. The
    standard Mellin transform identity <math|F<around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*<around|(|e<rsup|x>+1|)><rsup|-1>*<space|0.17em>d*x>
    for <math|\<Re\><around|(|s|)>\<gtr\>0>, differentiated <math|k> times
    (justified by dominated convergence) and evaluated at <math|s=1>, gives
    <math|\<mu\><rsub|k>=F<rsup|<around|(|k|)>><around|(|1|)>>.
  </proof>

  <subsection|The coefficient sequences>

  We now express <math|\<mu\><rsub|k>> in closed form as a finite sum. We
  factor <math|F*<around|(|1+\<epsilon\>|)>=\<Gamma\>*<around|(|1+\<epsilon\>|)>\<cdot\>\<eta\><around|(|\<epsilon\>|)>>
  where <math|\<eta\><around|(|\<epsilon\>|)>\<assign\><around|(|1-2<rsup|-\<epsilon\>>|)>*\<zeta\>*<around|(|1+\<epsilon\>|)>>.

  <\notation>
    <label|not:coefficients>We define three coefficient sequences, each given
    in closed form for arbitrary index.

    <vspace*|1fn><no-indent><with|font-series|bold|(A) Gamma coefficients.>
    Write <math|\<Gamma\>*<around|(|1+\<epsilon\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>g<rsub|n>*\<epsilon\><rsup|n>>.
    The Taylor expansion of <math|log \<Gamma\>> about <math|z=1> is

    <\equation>
      <label|eq:logGamma>log \<Gamma\>*<around|(|1+\<epsilon\>|)>=<big|sum><rsub|m=1><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>*\<zeta\><around|(|m|)>|m>*<space|0.17em>\<epsilon\><rsup|m>
    </equation>

    where <math|\<zeta\><around|(|1|)>> is interpreted as <math|\<gamma\>>
    (the Euler\UMascheroni constant). Define the sequence
    <math|<around|{|c<rsub|m>|}><rsub|m\<ge\>1>> by
    <math|c<rsub|m>\<assign\><around|(|-1|)><rsup|m>*\<zeta\><around|(|m|)>/m>
    (with <math|c<rsub|1>=-\<gamma\>>). Then the Taylor coefficients of the
    exponential are given by the complete exponential Bell polynomials:

    <\equation>
      <label|eq:gn>g<rsub|n>=<frac|1|n!>*<space|0.17em>B<rsub|n><around|(|1!<space|0.17em>c<rsub|1>,<space|0.27em>2!<space|0.17em>c<rsub|2>,<space|0.27em>\<ldots\>,<space|0.27em>n!<space|0.17em>c<rsub|n>|)>,<space|2em>n\<ge\>0,
    </equation>

    with <math|g<rsub|0>=1>. By the recurrence for Bell polynomials this
    equivalently reads

    <\equation>
      <label|eq:gn_recurrence>g<rsub|0>=1,<space|2em>g<rsub|n>=<frac|1|n>*<big|sum><rsub|j=1><rsup|n>j*<space|0.17em>c<rsub|j>*<space|0.17em>g<rsub|n-j>=<frac|1|n>*<big|sum><rsub|j=1><rsup|n><frac|<around|(|-1|)><rsup|j>*\<zeta\><around|(|j|)>|1>*<space|0.17em>g<rsub|n-j>,<space|2em>n\<ge\>1.
    </equation>

    <vspace*|1fn><no-indent><with|font-series|bold|(B) Eta coefficients.>
    Write <math|\<eta\><around|(|\<epsilon\>|)>\<assign\><around|(|1-2<rsup|-\<epsilon\>>|)>*\<zeta\>*<around|(|1+\<epsilon\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*\<epsilon\><rsup|n>>.
    Define the Stieltjes constants <math|\<gamma\><rsub|n>> by

    <\equation>
      <label|eq:zeta_Laurent>\<zeta\>*<around|(|1+\<epsilon\>|)>=<frac|1|\<epsilon\>>+<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*\<gamma\><rsub|n>|n!>*<space|0.17em>\<epsilon\><rsup|n>.
    </equation>

    Also <math|1-2<rsup|-\<epsilon\>>=<big|sum><rsub|j=1><rsup|\<infty\>><frac|<around|(|-1|)><rsup|j+1>*\<ell\><rsup|j>|j!>*\<epsilon\><rsup|j>>.
    The Cauchy product (with the <math|\<epsilon\><rsup|-1>> in
    <math|\<zeta\>> absorbing one power of <math|\<epsilon\>> from the other
    factor) gives

    <\equation>
      <label|eq:an>a<rsub|n>=<big|sum><rsub|j=0><rsup|n><frac|<around|(|-1|)><rsup|j+1>*\<ell\><rsup|j+1>|<around|(|j+1|)>!>\<cdot\><frac|<around|(|-1|)><rsup|n-j>*\<gamma\><rsub|n-j>|<around|(|n-j|)>!>,<space|2em>n\<ge\>0,
    </equation>

    where <math|\<gamma\><rsub|0>\<assign\>\<gamma\>>.

    <vspace*|1fn><no-indent><with|font-series|bold|(C) Product coefficients.>
    The Taylor coefficient of <math|\<epsilon\><rsup|n>> in
    <math|F*<around|(|1+\<epsilon\>|)>=\<Gamma\>*<around|(|1+\<epsilon\>|)>\<cdot\>\<eta\><around|(|\<epsilon\>|)>>
    is

    <\equation>
      <label|eq:bn>b<rsub|n>=<big|sum><rsub|j=0><rsup|n>g<rsub|j>*<space|0.17em>a<rsub|n-j>,<space|2em>n\<ge\>0.
    </equation>
  </notation>

  <\theorem>
    [Closed-form moment formula]<label|thm:moments_general> For every integer
    <math|k\<ge\>0>,

    <\equation>
      <label|eq:muk>\<mu\><rsub|k>=k!<space|0.17em>b<rsub|k>=k!<big|sum><rsub|j=0><rsup|k>g<rsub|j>*<space|0.17em>a<rsub|k-j>,
    </equation>

    where <math|g<rsub|j>> is given by<nbsp><eqref|eq:gn> and
    <math|a<rsub|m>> by<nbsp><eqref|eq:an>. Expanding fully, this is the
    finite double sum

    <\equation>
      <label|eq:muk_full><boxed|\<mu\><rsub|k>=k!<big|sum><rsub|j=0><rsup|k><frac|B<rsub|j><around|(|1!<space|0.17em>c<rsub|1>,\<ldots\>,j!<space|0.17em>c<rsub|j>|)>|j!>*<big|sum><rsub|r=0><rsup|k-j><frac|<around|(|-1|)><rsup|r+1>*\<ell\><rsup|r+1>|<around|(|r+1|)>!>\<cdot\><frac|<around|(|-1|)><rsup|k-j-r>*\<gamma\><rsub|k-j-r>|<around|(|k-j-r|)>!>>
    </equation>

    where <math|c<rsub|m>=<around|(|-1|)><rsup|m>*\<zeta\><around|(|m|)>/m>
    <with|font-shape|right|(>with <math|c<rsub|1>=-\<gamma\>><with|font-shape|right|)>,
    <math|\<ell\>=log 2>, and <math|\<gamma\><rsub|p>> is the <math|p>-th
    Stieltjes constant <with|font-shape|right|(><math|\<gamma\><rsub|0>=\<gamma\>><with|font-shape|right|)>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:momentF>, <math|\<mu\><rsub|k>/k>! is the
    coefficient of <math|\<epsilon\><rsup|k>> in
    <math|F*<around|(|1+\<epsilon\>|)>>. Since
    <math|F*<around|(|1+\<epsilon\>|)>=\<Gamma\>*<around|(|1+\<epsilon\>|)>\<cdot\>\<eta\><around|(|\<epsilon\>|)>>,
    the Cauchy product formula for power series gives
    <math|\<mu\><rsub|k>/k!=b<rsub|k>=<big|sum><rsub|j=0><rsup|k>g<rsub|j>*a<rsub|k-j>>.
    Substituting<nbsp><eqref|eq:gn> and<nbsp><eqref|eq:an>
    yields<nbsp><eqref|eq:muk_full>.
  </proof>

  <\remark>
    <label|rem:logGamma_series>The series<nbsp><eqref|eq:logGamma> follows
    from the Weierstrass product for <math|\<Gamma\>>:

    <\equation*>
      log \<Gamma\>*<around|(|1+z|)>=-\<gamma\>*z+<big|sum><rsub|m=2><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>*\<zeta\><around|(|m|)>|m>*z<rsup|m>,<space|2em><around|\||z|\|>\<less\>1,
    </equation*>

    which extends to <math|<around|\||z|\|>\<le\>1> by Abel's theorem except
    at <math|z=-1>. The identification <math|c<rsub|1>=-\<gamma\>> is
    consistent with the convention <math|\<zeta\><around|(|1|)>\<to\>\<gamma\>>
    in the formal series, since the Weierstrass product gives the <math|m=1>
    contribution as <math|-\<gamma\>*z>.
  </remark>

  <\remark>
    <label|rem:Bell_explicit>The complete exponential Bell polynomial has the
    explicit form

    <\equation*>
      B<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=<big|sum><rsub|\<pi\>\<in\>\<Pi\><around|(|n|)>><big|prod><rsub|B\<in\>\<pi\>>x<rsub|<around|\||B|\|>>=n!<big|sum><rsub|<stack|<tformat|<table|<row|<cell|k<rsub|1>+2*k<rsub|2>+\<cdots\>+n*k<rsub|n>=n>>|<row|<cell|k<rsub|i>\<ge\>0>>>>>><big|prod><rsub|i=1><rsup|n><frac|x<rsub|i><rsup|k<rsub|i>>|i!<rsup|k<rsub|i>><space|0.17em>k<rsub|i>!>
    </equation*>

    where <math|\<Pi\><around|(|n|)>> is the set of all partitions of
    <math|<around|{|1,\<ldots\>,n|}>>. Thus <math|g<rsub|n>>
    in<nbsp><eqref|eq:gn> is a polynomial in
    <math|\<gamma\>,\<zeta\><around|(|2|)>,\<zeta\><around|(|3|)>,\<ldots\>,\<zeta\><around|(|n|)>>
    with rational coefficients.
  </remark>

  <section|Orthogonal Polynomials at Arbitrary Index><label|sec:OP>

  <\definition>
    [Inner product]<label|def:ip> For <math|f,g\<in\>L<rsup|2><around|(|\<bbb-R\>,w<around|(|u|)>*<space|0.17em>d*u|)>>,
    define

    <\equation>
      <label|eq:ip><around|\<langle\>|f,g|\<rangle\>><rsub|w>\<assign\><big|int><rsub|\<bbb-R\>>f<around|(|u|)>*<space|0.17em>g<around|(|u|)>*<space|0.17em>w<around|(|u|)>*<space|0.17em>d*u.
    </equation>
  </definition>

  <subsection|Hankel determinants>

  <\definition>
    [Hankel matrices and determinants]<label|def:Hankel> For <math|n\<ge\>0>,
    the <math|<around|(|n+1|)>\<times\><around|(|n+1|)>> <em|Hankel matrix>
    is

    <\equation>
      <label|eq:Hankel_matrix>H<rsub|n>\<assign\><around*|(|\<mu\><rsub|i+j>|)><rsub|0\<le\>i,j\<le\>n>=<matrix|<tformat|<table|<row|<cell|\<mu\><rsub|0>>|<cell|\<mu\><rsub|1>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|n>>>|<row|<cell|\<mu\><rsub|1>>|<cell|\<mu\><rsub|2>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|n+1>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<mu\><rsub|n>>|<cell|\<mu\><rsub|n+1>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|2*n>>>>>>,
    </equation>

    and the <em|Hankel determinant> is <math|\<Delta\><rsub|n>\<assign\>det
    H<rsub|n>>. We set <math|\<Delta\><rsub|-1>\<assign\>1>.
  </definition>

  <\theorem>
    [Positivity of all Hankel determinants]<label|thm:Hankel_pos> For every
    <math|n\<ge\>0>, <math|\<Delta\><rsub|n>\<gtr\>0>.
  </theorem>

  <\proof>
    For any polynomial <math|q<around|(|u|)>=<big|sum><rsub|j=0><rsup|n>c<rsub|j>*u<rsup|j>>
    of degree <math|\<le\>n>, not identically zero, we have

    <\equation*>
      <around|\<langle\>|q,q|\<rangle\>><rsub|w>=<big|sum><rsub|i,j=0><rsup|n>c<rsub|i>*c<rsub|j>*<space|0.17em>\<mu\><rsub|i+j>=<math-bf|c><rsup|\<top\>>H<rsub|n><space|0.17em><math-bf|c>.
    </equation*>

    Since <math|w\<gtr\>0> on all of <math|\<bbb-R\>> and the support of
    <math|w*<space|0.17em>d*u> contains infinitely many points (indeed it is
    all of <math|\<bbb-R\>>), the polynomial <math|q> cannot vanish
    <math|w>-a.e. unless <math|q\<equiv\>0>. Hence
    <math|<around|\<langle\>|q,q|\<rangle\>><rsub|w>\<gtr\>0> for every
    nonzero <math|<math-bf|c>\<in\>\<bbb-R\><rsup|n+1>>, so <math|H<rsub|n>>
    is positive definite, and <math|\<Delta\><rsub|n>=det H<rsub|n>\<gtr\>0>.
  </proof>

  <subsection|The <math|n>-th monic orthogonal polynomial>

  <\theorem>
    [Determinantal formula for <math|P<rsub|n>>]<label|thm:Pn> For each
    <math|n\<ge\>0>, the unique monic polynomial <math|P<rsub|n>> of degree
    <math|n> satisfying <math|<around|\<langle\>|P<rsub|n>,u<rsup|j>|\<rangle\>><rsub|w>=0>
    for <math|0\<le\>j\<le\>n-1> is given by

    <\equation>
      <label|eq:Pn_det>P<rsub|n><around|(|u|)>=<frac|1|\<Delta\><rsub|n-1>><det|<tformat|<table|<row|<cell|\<mu\><rsub|0>>|<cell|\<mu\><rsub|1>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|n>>>|<row|<cell|\<mu\><rsub|1>>|<cell|\<mu\><rsub|2>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|n+1>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|\<mu\><rsub|n-1>>|<cell|\<mu\><rsub|n>>|<cell|\<cdots\>>|<cell|\<mu\><rsub|2*n-1>>>|<row|<cell|1>|<cell|u>|<cell|\<cdots\>>|<cell|u<rsup|n>>>>>>,
    </equation>

    where <math|\<Delta\><rsub|n-1>=det <around|(|\<mu\><rsub|i+j>|)><rsub|0\<le\>i,j\<le\>n-1>>
    and <math|\<Delta\><rsub|-1>\<assign\>1>. All entries
    <math|\<mu\><rsub|k>> are given in closed form
    by<nbsp><eqref|eq:muk_full>.
  </theorem>

  <\proof>
    Write <math|P<rsub|n><around|(|u|)>=u<rsup|n>+<big|sum><rsub|j=0><rsup|n-1>p<rsub|j>*u<rsup|j>>.
    The orthogonality conditions <math|<around|\<langle\>|P<rsub|n>,u<rsup|i>|\<rangle\>><rsub|w>=0>
    for <math|i=0,\<ldots\>,n-1> give the linear system

    <\equation>
      <label|eq:orthsys><big|sum><rsub|j=0><rsup|n-1>p<rsub|j>*<space|0.17em>\<mu\><rsub|i+j>=-\<mu\><rsub|i+n>,<space|2em>i=0,\<ldots\>,n-1.
    </equation>

    This is an <math|n\<times\>n> system with coefficient matrix
    <math|<around|(|\<mu\><rsub|i+j>|)><rsub|0\<le\>i,j\<le\>n-1>=H<rsub|n-1>>,
    which is positive definite by Theorem<nbsp><reference|thm:Hankel_pos>,
    hence nonsingular. The unique solution exists and is given by Cramer's
    rule. Assembling <math|P<rsub|n><around|(|u|)>=<big|sum><rsub|j=0><rsup|n-1>p<rsub|j>*u<rsup|j>+u<rsup|n>>
    and rewriting Cramer's formula as a single
    <math|<around|(|n+1|)>\<times\><around|(|n+1|)>> determinant with the
    last row <math|<around|(|1,u,\<ldots\>,u<rsup|n>|)>>
    yields<nbsp><eqref|eq:Pn_det>.
  </proof>

  <\corollary>
    [Squared norms]<label|cor:norms> The squared norm of <math|P<rsub|n>> is

    <\equation>
      <label|eq:norm>h<rsub|n>\<assign\><around|\<langle\>|P<rsub|n>,P<rsub|n>|\<rangle\>><rsub|w>=<frac|\<Delta\><rsub|n>|\<Delta\><rsub|n-1>>,<space|2em>n\<ge\>0.
    </equation>

    In particular <math|h<rsub|n>\<gtr\>0> for all <math|n>.
  </corollary>

  <\proof>
    This is a standard identity: expand <math|<around|\<langle\>|P<rsub|n>,P<rsub|n>|\<rangle\>><rsub|w>>
    using the Hankel determinantal form. The leading coefficient of
    <math|P<rsub|n>> (which is <math|1>, since <math|P<rsub|n>> is monic)
    contributes <math|\<Delta\><rsub|n>/\<Delta\><rsub|n-1>> by cofactor
    expansion along the last row of<nbsp><eqref|eq:Pn_det> applied to
    <math|<around|\<langle\>|P<rsub|n>,u<rsup|n>|\<rangle\>><rsub|w>>, and
    all lower-order terms vanish by orthogonality.
  </proof>

  <section|Three-Term Recurrence><label|sec:recurrence>

  <\theorem>
    [Favard recurrence]<label|thm:recurrence> The monic orthogonal
    polynomials <math|<around|{|P<rsub|n>|}><rsub|n\<ge\>0>> satisfy

    <\equation>
      <label|eq:recurrence>P<rsub|n+1><around|(|u|)>=<around|(|u-\<alpha\><rsub|n>|)>*<space|0.17em>P<rsub|n><around|(|u|)>-\<beta\><rsub|n>*<space|0.17em>P<rsub|n-1><around|(|u|)>,<space|2em>n\<ge\>0,
    </equation>

    with <math|P<rsub|-1>\<equiv\>0>, <math|P<rsub|0>\<equiv\>1>, and
    recurrence coefficients

    <\equation>
      <label|eq:alpha_n>\<alpha\><rsub|n>=<frac|<around|\<langle\>|u*<space|0.17em>P<rsub|n>,P<rsub|n>|\<rangle\>><rsub|w>|h<rsub|n>>,<space|2em>n\<ge\>0,
    </equation>

    <\equation>
      <label|eq:beta_n>\<beta\><rsub|n>=<frac|h<rsub|n>|h<rsub|n-1>>,<space|2em>n\<ge\>1,
    </equation>

    where <math|h<rsub|n>=\<Delta\><rsub|n>/\<Delta\><rsub|n-1>>. In
    particular <math|\<beta\><rsub|n>\<gtr\>0> for all <math|n\<ge\>1>.
  </theorem>

  The existence and uniqueness of the three-term
  recurrence<nbsp><eqref|eq:recurrence> with
  coefficients<nbsp><eqref|eq:alpha_n>\U<eqref|eq:beta_n> is Favard's theorem
  applied to the determinate measure <math|w<around|(|u|)>*<space|0.17em>d*u>
  (Proposition<nbsp><reference|prop:integrability>(iv)).

  We verify<nbsp><eqref|eq:alpha_n>. Since <math|P<rsub|n+1>> is monic of
  degree <math|n+1>, <math|u*<space|0.17em>P<rsub|n><around|(|u|)>-P<rsub|n+1><around|(|u|)>>
  has degree <math|\<le\>n>, so

  <\equation*>
    u*<space|0.17em>P<rsub|n><around|(|u|)>=P<rsub|n+1><around|(|u|)>+<big|sum><rsub|j=0><rsup|n>d<rsub|j>*P<rsub|j><around|(|u|)>
  </equation*>

  for some scalars <math|d<rsub|j>>. Taking the inner product with
  <math|P<rsub|n>> and using orthogonality gives
  <math|<around|\<langle\>|u*<space|0.17em>P<rsub|n>,P<rsub|n>|\<rangle\>><rsub|w>=d<rsub|n>*<space|0.17em>h<rsub|n>>,
  hence <math|d<rsub|n>=<around|\<langle\>|u*<space|0.17em>P<rsub|n>,P<rsub|n>|\<rangle\>><rsub|w>/h<rsub|n>=:\<alpha\><rsub|n>>.

  Taking the inner product with <math|P<rsub|n-1>> gives
  <math|<around|\<langle\>|u*<space|0.17em>P<rsub|n>,P<rsub|n-1>|\<rangle\>><rsub|w>=d<rsub|n-1>*<space|0.17em>h<rsub|n-1>>.
  By symmetry of the inner product and the fact that
  <math|u*<space|0.17em>P<rsub|n-1>> has a <math|P<rsub|n>> component with
  coefficient <math|1> (since <math|P<rsub|n>> is monic), we get
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|3.1|2>>
    <associate|auto-5|<tuple|3.2|2>>
    <associate|auto-6|<tuple|4|4>>
    <associate|auto-7|<tuple|4.1|4>>
    <associate|auto-8|<tuple|4.2|5>>
    <associate|auto-9|<tuple|5|5>>
    <associate|cor:norms|<tuple|14|5>>
    <associate|def:F|<tuple|3|2>>
    <associate|def:Hankel|<tuple|11|4>>
    <associate|def:ip|<tuple|10|4>>
    <associate|def:moments|<tuple|4|2>>
    <associate|def:weight|<tuple|1|1>>
    <associate|eq:Fdef|<tuple|2|2>>
    <associate|eq:Hankel_matrix|<tuple|14|4>>
    <associate|eq:Pn_det|<tuple|15|5>>
    <associate|eq:alpha_n|<tuple|19|5>>
    <associate|eq:an|<tuple|9|3>>
    <associate|eq:beta_n|<tuple|20|5>>
    <associate|eq:bn|<tuple|10|3>>
    <associate|eq:gn|<tuple|6|3>>
    <associate|eq:gn_recurrence|<tuple|7|3>>
    <associate|eq:ip|<tuple|13|4>>
    <associate|eq:logGamma|<tuple|5|3>>
    <associate|eq:momentF|<tuple|4|2>>
    <associate|eq:moments|<tuple|3|2>>
    <associate|eq:muk|<tuple|11|3>>
    <associate|eq:muk_full|<tuple|12|3>>
    <associate|eq:norm|<tuple|17|5>>
    <associate|eq:orthsys|<tuple|16|5>>
    <associate|eq:recurrence|<tuple|18|5>>
    <associate|eq:weight|<tuple|1|1>>
    <associate|eq:zeta_Laurent|<tuple|8|3>>
    <associate|not:coefficients|<tuple|6|3>>
    <associate|prop:integrability|<tuple|2|2>>
    <associate|rem:Bell_explicit|<tuple|9|4>>
    <associate|rem:logGamma_series|<tuple|8|4>>
    <associate|sec:OP|<tuple|4|4>>
    <associate|sec:intro|<tuple|1|1>>
    <associate|sec:moments|<tuple|3|2>>
    <associate|sec:recurrence|<tuple|5|5>>
    <associate|sec:weight|<tuple|2|1>>
    <associate|thm:Hankel_pos|<tuple|12|4>>
    <associate|thm:Pn|<tuple|13|5>>
    <associate|thm:momentF|<tuple|5|2>>
    <associate|thm:moments_general|<tuple|7|3>>
    <associate|thm:recurrence|<tuple|15|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Salem\URao Weight> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Closed-Form
      Moments at Arbitrary Index> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>The entire function
      <with|mode|<quote|math>|F> and the moment identity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>The coefficient sequences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Orthogonal
      Polynomials at Arbitrary Index> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Hankel determinants
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>The
      <with|mode|<quote|math>|n>-th monic orthogonal polynomial
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Three-Term
      Recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>