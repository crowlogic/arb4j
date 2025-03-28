<TeXmacs|2.1.4>

<style|amsart>

<\body>
  <\hide-preamble>
    <assign|abs|<macro|1|\<lvert\><arg|1>\<rvert\>>>

    <assign|blankbox|<macro|1|2|<mini-paragraph|tex-column-width|><frame|<move|[|0pt|0pt><arg|2>]<space|1>>>>
  </hide-preamble>

  <doc-data|<doc-title|The finite Fourier transform of classical
  polynomials>|<doc-author|<author-data|<author-name|Atul
  Dixit>|<author-email|adixit@tulane.edu>|<author-affiliation|Department of
  Mathematics, Tulane University, New Orleans, LA
  70118>>>|<doc-author|<author-data|<author-name|Lin
  Jiu>|<author-email|ljiu@tulane.edu>|<author-affiliation|Department of
  Mathematics, Tulane University, New Orleans, LA
  70118>>>|<doc-author|<author-data|<author-name|Victor H.
  Moll>|<author-email|vhm@tulane.edu>|<author-affiliation|Department of
  Mathematics, Tulane University, New Orleans, LA
  70118>>>|<doc-date|<date|>>|<doc-author|<author-data|<author-name|Christophe
  Vignat>|<author-email|cvignat@math.tulane.edu>|<author-affiliation|Department
  of Mathematics, Tulane University, New Orleans, LA 70118>>>>

  <abstract-data|<abstract-msc|Primary 42A16| Secondary
  33C45>|<abstract-keywords|Fourier transform| orthogonal polynomials| Jacobi
  polynomials| >|<\abstract>
    The finite Fourier transform of a family of orthogonal polynomials
    <math|A<rsub|n>(x)>, is the usual transform of the polynomial extended by
    <math|0> outside their natural domain. Explicit expressions are given for
    the Legendre, Jacobi, Gegenbauer and Chebyshev families.
  </abstract>>

  <assign|nn|<macro|<no-number>>><assign|ba|<macro|>><assign|ea|<macro|>><assign|no|<macro|<no-indent>>><assign|la|<macro|\<lambda\>>><assign|ch|<macro|>><assign|realpart|<macro|<with|font-family|rm|Re>>><assign|imagpart|<macro|<with|font-family|rm|Im>>><assign|pFq|<macro|1|2|3|4|5|<math|<rsub|<arg|1>>F<rsub|<arg|2>>
  <around*|(|<genfrac|||0*pt||<arg|3>|<arg|4>> <mid|\|>
  <arg|5>|)>>>><new-theorem|Definition|Definition>

  [section] <new-theorem|Thm|Theorem><new-theorem|Example|Example><new-theorem|Lem|Lemma><new-theorem|Note|Note><new-theorem|Cor|Corollary><new-theorem|Conj|Conjecture><new-theorem|Prop|Proposition><new-theorem|Problem|Problem><numberwithin|equation|section>

  <section|Introduction><label|sec-intro>

  <reset-counter|equation>

  Compendia of formulas, such as the classical <with|font-shape|italic|Table
  of Integrals, Series and Products> by I.<nbsp>S.<nbsp>Gradshteyn and
  I.<nbsp>M.<nbsp>Ryzhik <cite|gradshteyn-2007a> and the recent
  <with|font-shape|italic|NIST Handbook of Mathematical Functions>
  <cite|olver-2010a> do not contain a systematic collection of Fourier
  transforms of orthogonal polynomials.

  Special cases do appear. For instance, <cite-detail|olver-2010a|formula
  <math|18.17.19>> contains the identity

  <\equation>
    <big|int><rsub|-1><rsup|1>P<rsub|n><around|(|x|)>*e<rsup|\<imath\><la>x>*d*x=\<imath\><rsup|n>*<sqrt|<frac|2*\<pi\>|<la>>>*J<rsub|n+<tfrac|1|2>><around|(|<la>|)>,
  </equation>

  <no-indent>for the <with|font-shape|italic|finite Fourier transform> of the
  Legendre polynomial <math|P<rsub|n>>. Here <math|J<rsub|\<alpha\>>> is the
  Bessel function defined by

  <\equation>
    J<rsub|\<alpha\>><around|(|<la>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>*<around|(|<la>/2|)><rsup|2*k+\<alpha\>>|k!\<Gamma\>*<around|(|k+\<alpha\>+1|)>>.
  </equation>

  <no-indent>A second example is <cite-detail|erderly-1954a|formula
  <math|3.3<around|(|7|)>>, page 123>

  <\equation>
    <big|int><rsub|-1><rsup|1>P<rsub|\<nu\>><around|(|x|)>*e<rsup|\<imath\><la>x>*d*x=<frac|2*\<pi\>*sin
    \<pi\>*\<nu\>|\<nu\>*<around|(|\<nu\>+1|)>>*e<rsup|-\<imath\><la>><pFq|2|2|1,1|-\<nu\>,2+\<nu\>|2*\<imath\><la>>.
  </equation>

  The more natural situation, where the corresponding kernel appears in the
  integrand, is included in the tables. For instance, for the Jacobi
  polynomial, <cite-detail|olver-2010a|18.17.16> gives

  <\equation>
    <label|jacobi-101><big|int><rsub|-1><rsup|1><around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*e<rsup|\<imath\><la>x>*<space|0.17em>d*x=X<rsub|n><around|(|<la>;\<alpha\>,\<beta\>|)><pFq|1|1|n+\<alpha\>+1|2*n+\<alpha\>+\<beta\>+2|-2*\<imath\><la>>,
  </equation>

  <no-indent>with

  <\equation>
    X<rsub|n><around|(|<la>;\<alpha\>,\<beta\>|)>=<frac|<around|(|\<imath\><la>|)><rsup|n>*e<rsup|\<imath\><la>>|n!>*2<rsup|n+\<alpha\>+\<beta\>+1>\<times\>B<around|(|n+\<alpha\>+1,n+\<beta\>+1|)>
  </equation>

  The work presented here was stimulated by results of A.<nbsp>Fokas et al.
  <cite|fokas-2014a>. A second motivation was the fact that the authors were
  unable to find the finite Fourier transform of classical orthogonal
  polynomials readily available in the literature. These results were also
  developed in <cite|fokas-2014a> and some of them appear in
  <cite|greenen-2008a>. The authors wish to thank A. Fokas and T. Koorwinder
  for correspondence on the questions discussed here.

  The goal of this project is to produce closed-form evaluations of definite
  integrals of the form

  <\equation>
    <wide|P|^><around|(|<la>|)>\<assign\><big|int><rsub|a><rsup|b>e<rsup|\<imath\><la>x>*P<around|(|x|)>*<space|0.17em>d*x
  </equation>

  <no-indent>for a variety of polynomials <math|P>, orthogonal on the
  interval <math|<around|[|a,b|]>>. The function
  <math|<wide|P|^><around|(|<la>|)>> is called the
  <with|font-shape|italic|finite Fourier transform> of the polynomial
  <math|P>. The case considered here includes the Legendre polynomial
  <math|P<rsub|n><around|(|x|)>>, the Jacobi polynomial
  <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>, from
  which the Gegenbauer polynomials <math|C<rsub|n><rsup|<around|(|\<nu\>|)>><around|(|x|)>>
  and both types of Chebyshev polynomials <math|T<rsub|n><around|(|x|)>> and
  <math|U<rsub|n><around|(|x|)>> are derived.

  Naturally, depending on the representation given of the polynomial
  <math|P>, it is possible to obtain a variety of expressions for
  <math|<wide|P|^>>. For instance, if an expression for the coefficients of
  <math|P> is available, the identity in Lemma <reference|lemma-intpower> and
  a simple scaling give directly a double-sum representation for
  <math|<wide|P|^><around|(|<la>|)>>.

  <vspace*|0.5fn>It is convenient to introduce the notation

  <\equation>
    E<rsub|n><around|(|x|)>=<big|sum><rsub|j=0><rsup|n><frac|x<rsup|j>|j!>
  </equation>

  <no-indent>for the partial sums of the exponential function. Many of the
  results may be expressed in terms of <math|E<rsub|n>>. The result is
  elementary and it appears in <cite-detail|gradshteyn-2007a|formula
  <math|2.323>>.

  <\Lem>
    <label|lemma-intpower>Let <math|k\<geq\>0> be an integer and <math|<la>>
    an indeterminate. Then,

    <\equation>
      <big|int><rsub|-1><rsup|1>x<rsup|k>*e<rsup|\<imath\><la>x>*d*x=<frac|<around|(|-1|)><rsup|k>*k!|<around|(|\<imath\><la>|)><rsup|k+1>>*<around*|[|e<rsup|\<imath\><la>>*E<rsub|k>*<around|(|-\<imath\><la>|)>-e<rsup|-\<imath\><la>>*E<rsub|k><around|(|\<imath\><la>|)>|]>,<ch>
    </equation>

    <no-indent>and

    <\equation>
      <big|int><rsub|0><rsup|1>x<rsup|k>*e<rsup|\<imath\><la>x>*d*x=<frac|<around|(|-1|)><rsup|k>*k!|<around|(|\<imath\><la>|)><rsup|k+1>>*<around*|[|e<rsup|\<imath\><la>>*E<rsub|k>*<around|(|-\<imath\><la>|)>-1|]>.<ch>
    </equation>
  </Lem>

  <\proof>
    Integrate by parts.
  </proof>

  <\Note>
    The notation is standard. The symbol <math|<around|(|a|)><rsub|n>>
    denotes the shifted factorial, defined by
    <math|<around|(|a|)><rsub|n>=a*<around|(|a+1|)>*\<cdots\>*<around|(|a+n-1|)>>
    and <math|<around|(|a|)><rsub|0>=1>. The elementary properties

    <\eqnarray>
      <tformat|<table|<row|<cell|<around|(|1|)><rsub|n>>|<cell|=>|<cell|n!<eq-number><label|poch-110>>>|<row|<cell|<around|(|a|)><rsub|n>>|<cell|=>|<cell|<frac|\<Gamma\>*<around|(|a+n|)>|\<Gamma\><around|(|a|)>><eq-number><label|poch-111>>>|<row|<cell|<around|(|a+<tfrac|1|2>|)><rsub|n>>|<cell|=>|<cell|<frac|<around|(|2*a|)><rsub|2*n>|2<rsup|2*n><around|(|a|)><rsub|n>><eq-number><label|poch-3>>>|<row|<cell|<around|(|-n|)><rsub|k>>|<cell|=>|<cell|<frac|<around|(|-1|)><rsup|k>*n!|<around|(|n-k|)>!>*<space|2em><text|for
      >n,<space|0.17em>k\<in\>\<bbb-N\><eq-number><label|poch-112>>>|<row|<cell|<around|(|n+1|)><rsub|k>>|<cell|=>|<cell|<frac|<around|(|n+k|)>!|n!>*<space|2em><text|for
      >n,<space|0.17em>k\<in\>\<bbb-N\>,<eq-number><label|poch-113>>>|<row|<cell|<around|(|-a|)><rsub|n>>|<cell|=>|<cell|<around|(|-1|)><rsup|n>*<around|(|a-n+1|)><rsub|n>,<eq-number><label|poch-114>>>>>
    </eqnarray>

    <no-indent>are used throughout.
  </Note>

  <section|Legendre polynomials><label|sec-legendre>

  This section contains a variety of formulas for the finite Fourier
  transform of the Legendre polynomials <math|P<rsub|n><around|(|x|)>>. These
  are orthogonal polynomials on the interval <math|<around|[|-1,1|]>>, with
  weight <math|w<around|(|x|)>\<equiv\>1>. The next theorem gives all the
  results.

  <\Thm>
    <label|fourier-legendre>The finite Fourier transform of the Legendre
    polynomial <math|P<rsub|n><around|(|x|)>> is given by one of the four
    equivalent forms:

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|P<rsub|n>|^><around|(|<la>|)>>|<cell|=>|<cell|2<rsup|n>*<big|sum><rsub|k=0><rsup|n><binom|n|k><binom|<tfrac|1|2><around|(|n+k-1|)>|n><frac|<around|(|-1|)><rsup|k>*k!|<around|(|\<imath\><la>|)><rsup|k+1>>*<around*|[|e<rsup|\<imath\><la>>*E<rsub|k>*<around|(|-\<imath\><la>|)>-e<rsup|-\<imath\><la>>*E<rsub|k><around|(|\<imath\><la>|)>|]><ch>>>|<row|<cell|>|<cell|=>|<cell|\<imath\><rsup|n>*<sqrt|<frac|2*\<pi\>|<la>>>*J<rsub|n+1/2><around|(|<la>|)><ch>>>|<row|<cell|>|<cell|=>|<cell|2*<big|sum><rsub|k=0><rsup|n><frac|<around|(|n+k|)>!|<around|(|n-k|)>!<space|0.17em>k!>*<frac|<around*|[|e<rsup|-\<imath\><la>>*E<rsub|k>*<around|(|2*\<imath\><la>|)>-e<rsup|\<imath\><la>>|]>|<around|(|-2*\<imath\>*\<lambda\>|)><rsup|k+1>><ch>>>|<row|<cell|>|<cell|=>|<cell|2*<big|sum><rsub|k=0><rsup|n><frac|<around|(|n+k|)>!|<around|(|n-k|)>!<space|0.17em>k!>*<frac|<around*|[|<around|(|-1|)><rsup|n+k>*e<rsup|-\<imath\>*\<lambda\>>-e<rsup|\<imath\>*\<lambda\>>|]>|<around|(|-2*\<imath\><la>|)><rsup|k+1>>.<ch>>>>>
    </eqnarray*>
  </Thm>

  <\proof>
    The first formula follows from the explicit representation

    <\equation>
      P<rsub|n><around|(|x|)>=2<rsup|n>*<big|sum><rsub|k=0><rsup|n><binom|n|k><binom|<tfrac|1|2><around|(|n+k-1|)>|n>x<rsup|k><ch>
    </equation>

    <no-indent>given in ?? and Lemma <reference|lemma-intpower>. The second
    expression for <math|<wide|P|^><rsub|n><around|(|<la>|)>> comes from
    their Rodrigues formula

    <\equation>
      P<rsub|n><around|(|x|)>=<frac|1|2<rsup|n>*<space|0.17em>n!><around*|(|<frac|d|d*x>|)><rsup|n>*<around|(|x<rsup|2>-1|)><rsup|n>,<ch>
    </equation>

    (see <cite-detail|gradshteyn-2007a|Formula <math|8.910.2>>) and it
    appears as entry <math|7.242.5> in <cite|gradshteyn-2007a>. Then

    <\equation>
      <wide|P|^><rsub|n><around|(|\<lambda\>|)>=<frac|1|2<rsup|n>*n!>*<big|int><rsub|-1><rsup|1>e<rsup|\<imath\><la>x><around*|(|<frac|d|d*x>|)><rsup|n>*<around|(|x<rsup|2>-1|)><rsup|n>*<space|0.17em>d*x
    </equation>

    <no-indent>and integrating by parts <math|n>-times yields

    <\equation>
      <wide|P|^><rsub|n><around|(|\<lambda\>|)>=<frac|<around|(|-\<imath\>*\<lambda\>|)><rsup|n>|2<rsup|n>*n!>*<big|int><rsub|-1><rsup|1><around|(|x<rsup|2>-1|)><rsup|n>*e<rsup|\<imath\><la>x>*<space|0.17em>d*x.<ch>
    </equation>

    <no-indent>Entry <math|3.387.2> of <cite|gradshteyn-2007a> states that

    <\equation>
      <big|int><rsub|-1><rsup|1><around|(|1-x<rsup|2>|)><rsup|\<nu\>-1>*e<rsup|\<imath\>*\<mu\>*x>*<space|0.17em>d*x=<sqrt|\<pi\>><around*|(|<frac|2|\<mu\>>|)><rsup|\<nu\>-<tfrac|1|2>>*\<Gamma\><around|(|\<nu\>|)>*J<rsub|\<nu\>-<tfrac|1|2>><around|(|\<mu\>|)>.<ch>
    </equation>

    <no-indent>The result is obtained by choosing <math|\<mu\>=<la>> and
    <math|\<nu\>=n+1>.

    <vspace*|0.5fn>The third form of the finite Fourier transform of the
    Legendre polynomials is obtained from their hypergeometric representation

    <\equation>
      P<rsub|n><around|(|x|)>=<pFq|2|1|-n*<space|1em>n+1|1|<frac|1-x|2>>=<big|sum><rsub|k=0><rsup|n><frac|<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|<around|(|1|)><rsub|k>*<space|0.17em>k!><around*|(|<frac|1-x|2>|)><rsup|k>,<ch><label|hyper-legendre>
    </equation>

    <no-indent>that gives

    <\equation>
      <wide|P|^><rsub|n><around|(|\<lambda\>|)>=<big|sum><rsub|k=0><rsup|n><frac|<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|k!<rsup|2>>*<big|int><rsub|-1><rsup|1>e<rsup|\<imath\>*\<lambda\>*x><around*|(|<frac|1-x|2>|)><rsup|k>*<space|0.17em>d*x.<ch>
    </equation>

    <no-indent>A change of variables and the formulas <eqref|poch-113> and
    <eqref|poch-114> give

    <\equation>
      <label|sum-1><wide|P|^><rsub|n><around|(|\<lambda\>|)>=2*e<rsup|\<imath\>*\<lambda\>>*<big|sum><rsub|k=0><rsup|n><frac|<around|(|-1|)><rsup|k>*<around|(|n+k|)>!|<around|(|n-k|)>!k!<rsup|2>>*<big|int><rsub|0><rsup|1>t<rsup|k>*e<rsup|-2*\<imath\>*\<lambda\>*t>*<space|0.17em>d*t.<ch>
    </equation>

    <no-indent>Lemma <reference|lemma-intpower> now gives the stated result.

    <vspace*|0.5fn>To produce the last form for
    <math|<wide|P|^><rsub|n><around|(|\<lambda\>|)>>, let
    <math|t=2*\<imath\>*\<lambda\>> in the third expression for this
    transform. Then, after multiplication by <math|t<rsup|n>> and some
    simplification, the claim is equivalent to the polynomial identity

    <\equation>
      <big|sum><rsub|k=0><rsup|n><frac|<around|(|2*n-k|)>!|k!<around|(|n-k|)>!>*<around|(|-1|)><rsup|k>*t<rsup|k>*<big|sum><rsub|j=0><rsup|n-k><frac|t<rsup|j>|j!>=<big|sum><rsub|k=0><rsup|n><frac|<around|(|2*n-k|)>!|k!<around|(|n-k|)>!>*t<rsup|k>.<ch>
    </equation>

    <no-indent>To simplify the sum, let <math|\<nu\>=k+j> on the left-hand
    side to show that the desired identity is equivalent to

    <\equation>
      <big|sum><rsub|\<nu\>=0><rsup|n><around*|[|<big|sum><rsub|k=0><rsup|\<nu\>><frac|<around|(|-1|)><rsup|k>*<around|(|2*n-k|)>!|k!<space|0.17em><around|(|n-k|)>!<space|0.17em><around|(|\<nu\>-k|)>!>|]>*t<rsup|\<nu\>>=<big|sum><rsub|k=0><rsup|n><frac|<around|(|2*n-k|)>!|k!<space|0.17em><around|(|n-k|)>!>*t<rsup|k>.
    </equation>

    Matching coefficients, the result follows from

    <\equation>
      <big|sum><rsub|j=0><rsup|k><frac|<around|(|-1|)><rsup|j>*<around|(|2*n-j|)>!|j!<space|0.17em><around|(|n-j|)>!<space|0.17em><around|(|k-j|)>!>=<frac|<around|(|2*n-k|)>!|k!<space|0.17em><around|(|n-k|)>!><ch>
    </equation>

    <no-indent>for every <math|0\<leq\>k\<leq\>n>. This is equivalent to the
    binomial identity given in Lemma <reference|binomial-id> below. The proof
    is complete.
  </proof>

  <\Lem>
    <label|binomial-id>For <math|n\<in\>\<bbb-N\>> and
    <math|0\<leq\>k\<leq\>n>

    <\equation>
      <big|sum><rsub|j=0><rsup|k><around|(|-1|)><rsup|j><binom|n|j><binom|2*n-j|2*n-k>=<binom|n|k>.<ch><label|binomial-1>
    </equation>
  </Lem>

  <\proof>
    The proof uses <math|<binom|r|k>=<around|(|-1|)><rsup|k><binom|k-r-1|k>>
    to write

    <\equation>
      <binom|2*n-j|2*n-k>=<binom|2*n-j|k-j>=<around|(|-1|)><rsup|k-j><binom|k-2*n-1|k-j><ch>
    </equation>

    <no-indent>and then <eqref|binomial-1> is converted into Vandermonde
    identity

    <\equation>
      <big|sum><rsub|k=0><rsup|n><binom|a|k><binom|b|n-k>=<binom|a+b|n>.<ch>
    </equation>
  </proof>

  <section|Jacobi polynomials><label|sec-jacobi>

  The Jacobi polynomials <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>,
  defined by

  <\equation>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|1|2<rsup|n>>*<big|sum><rsub|k=0><rsup|n><binom|\<alpha\>+n|k><binom|\<beta\>+n|n-k><around|(|x-1|)><rsup|n-k>*<around|(|x+1|)><rsup|k><ch><label|jacobi-111>
  </equation>

  <no-indent>are orthogonal on <math|<around|[|-1,1|]>> with respect to the
  weight

  <\equation>
    w<around|(|x|)>=<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>.
  </equation>

  <no-indent>This section contains expressions for their finite Fourier
  transform. The hypergeometric representation

  <\equation>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|<around|(|\<alpha\>+1|)><rsub|n>|n!><pFq|2|1|-n,<space|1em>n+\<alpha\>+\<beta\>+1|\<alpha\>+1|<frac|1-x|2>>,<ch>
  </equation>

  <no-indent>is used in the calculations.

  <\theorem>
    <label|fourier-jacobi>The finite Fourier transform of the Jacobi
    polynomials <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
    is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>>|<cell|=>|<cell|2*e<rsup|\<imath\><la>>*<around|(|\<alpha\>+1|)><rsub|n>*<big|sum><rsub|k=0><rsup|n><frac|<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|k>|<around|(|n-k|)>!<around|(|\<alpha\>+1|)><rsub|k>><around*|[|<frac|e<rsup|-2*\<imath\><la>>*E<rsub|k>*<around|(|2*\<imath\><la>|)>-1|<around|(|-2*\<imath\><la>|)><rsup|k+1>>|]><ch>>>|<row|<cell|>|<cell|=>|<cell|2*<big|sum><rsub|k=0><rsup|n><frac|<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|k>|<around|(|-2*\<imath\><la>|)><rsup|k+1>*<around|(|n-k|)>!><ch>>>|<row|<cell|>|<cell|>|<cell|\<times\><around*|[|<around|(|-1|)><rsup|n-k>*e<rsup|-\<imath\><la>>*<around|(|\<beta\>+k+1|)><rsub|n-k>-e<rsup|\<imath\><la>>*<around|(|\<alpha\>+k+1|)><rsub|n-k>|]>,>>>>
    </eqnarray*>

    <no-indent>for <math|<la>\<neq\>0>. For <math|<la>=0>,

    <\equation>
      <wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|0|)>=<frac|<around|(|n+\<alpha\>+\<beta\>+1|)>|2>*<around*|[|<binom|\<alpha\>+n|n-1>-<around|(|-1|)><rsup|n-1><binom|\<beta\>+n|n-1>|]>.
    </equation>
  </theorem>

  <\proof>
    The first statement comes from the hypergeometric form

    <\eqnarray>
      <tformat|<table|<row|<cell|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>|<cell|=>|<cell|<frac|<around|(|\<alpha\>+1|)><rsub|n>|n!><pFq|2|1|-n,<space|1em>n+\<alpha\>+\<beta\>+1|\<alpha\>+1|<frac|1-x|2>><ch><eq-number>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around|(|\<alpha\>+1|)><rsub|n>|n!>*<big|sum><rsub|k=0><rsup|n><frac|<around|(|-n|)><rsub|k>*<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|k>|<around|(|\<alpha\>+1|)><rsub|k>*k!2<rsup|k>>*<around|(|1-x|)><rsup|k><ch>>>>>
    </eqnarray>

    <no-indent>and use Lemma <reference|lemma-intpower> to produce

    <\equation>
      <big|int><rsub|-1><rsup|1><around|(|1-x|)><rsup|k>*e<rsup|\<imath\><la>x>*d*x=-e<rsup|\<imath\><la>>*<frac|k!|<around|(|\<imath\><la>|)><rsup|k+1>>*<around*|[|e<rsup|-2*\<imath\><la>>*E<rsub|k>*<around|(|2*\<imath\><la>|)>-1|]>
    </equation>

    <no-indent>and then <math|<around|(|-n|)><rsub|k>=<around|(|-1|)><rsup|k>*n!/<around|(|n-k|)>>!
    to simplify the result.

    <vspace*|0.5fn>Now use identity (the case <math|m=1> of
    <cite-detail|gradshteyn-2007a|<math|8.961.4>>:

    <\equation>
      <label|der-jacobi><frac|d|d*x>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|n+\<alpha\>+\<beta\>+1|2>*P<rsub|n-1><rsup|<around|(|\<alpha\>+1,\<beta\>+1|)>><around|(|x|)>.<ch>
    </equation>

    <no-indent>and integrate by parts to obtain

    <\equation*>
      <wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>=<frac|e<rsup|\<imath\><la>x>|\<imath\><la>>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)><mid|\|><rsub|-1><rsup|1>-<frac|<around|(|n+\<alpha\>+\<beta\>+1|)>|2*\<imath\><la>><wide|P<rsub|n-1><rsup|<around|(|\<alpha\>+1,\<beta\>+1|)>>|^><around|(|<la>|)>.
    </equation*>

    Introduce the notation for the boundary term

    <\equation>
      a<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|e<rsup|\<imath\><la>x>|\<imath\><la>>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)><mid|\|><rsub|-1><rsup|1>.
    </equation>

    <no-indent>to write the previous computation as the recurrence

    <\equation>
      <wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>=a<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|<la>|)>-<frac|<around|(|n+\<alpha\>+\<beta\>+1|)>|2*\<imath\><la>><wide|P<rsub|n-1><rsup|<around|(|\<alpha\>+1,\<beta\>+1|)>>|^><around|(|<la>|)>.
    </equation>

    <no-indent>Iteration yields

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>>|<cell|=>|<cell|<big|sum><rsub|k=1><rsup|n><around|(|-1|)><rsup|n-k><frac|<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|n-k>|<around|(|2*\<imath\><la>|)><rsup|n-k>>*a<rsub|k><rsup|<around|(|\<alpha\>+n-k,\<beta\>+n-k|)>><around|(|<la>|)>>>|<row|<cell|>|<cell|+>|<cell|<around|(|-1|)><rsup|n><frac|<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|n>|<around|(|2*\<imath\><la>|)><rsup|n>><wide|P<rsub|0><rsup|<around|(|\<alpha\>+n,\<beta\>+n|)>>|^><around|(|<la>|)>.>>>>
    </eqnarray*>

    <no-indent>Evaluate the last term is evaluated as
    <math|a<rsub|0><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|<la>|)>>
    and use

    <\equation>
      P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|1|)>=<binom|\<alpha\>+n|n><text|and
      >P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|-1|)>=<around|(|-1|)><rsup|n><binom|\<beta\>+n|n><ch>
    </equation>

    <no-indent>from <eqref|jacobi-111> to obtain

    <\equation>
      a<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|1|\<imath\><la>>*<around*|[|e<rsup|\<imath\><la>><binom|\<alpha\>+n|n>-<around|(|-1|)><rsup|n>*e<rsup|-\<imath\><la>><binom|\<beta\>+n|n>|]>.<label|boundary-1>
    </equation>

    <no-indent>Some algebraic simplification now gives the stated result. The
    value for <math|<la>=0> comes directly from <eqref|der-jacobi>.
  </proof>

  The next statement represents a hypergeometric rewrite of the last formula
  in Theorem <reference|fourier-jacobi>.

  <\Thm>
    The finite Fourier transform of the Jacobi polynomial is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>>|<cell|=>|<cell|<frac|<around|(|\<beta\>+1|)><rsub|n>|\<imath\><la>n!>*<around|(|-1|)><rsup|n+1>*e<rsup|-\<imath\><la>><pFq|3|1|n+\<alpha\>+\<beta\>+1,-n,1|\<beta\>+1|<frac|-1|2*\<imath\><la>>>+<ch>>>|<row|<cell|>|<cell|>|<cell|<space|2em>+<frac|<around|(|\<alpha\>+1|)><rsub|n>|\<imath\><la>n!>*e<rsup|\<imath\><la>><pFq|3|1|n+\<alpha\>+\<beta\>+1,-n,1|\<alpha\>+1|<frac|1|2*\<imath\><la>>>.>>>>
    </eqnarray*>
  </Thm>

  <\proof>
    The first term in the expression the last formula of Theorem
    <reference|fourier-jacobi> is simplified using <eqref|poch-113> and
    <math|<around|(|\<beta\>+k+1|)><rsub|n-k>=<frac|<around|(|\<beta\>+1|)><rsub|n>|<around|(|\<beta\>+1|)><rsub|k>>>
    to obtain

    <\multline*>
      <tformat|<table|<row|<cell|<frac|<around|(|-1|)><rsup|n-k>*<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|k>*<around|(|\<beta\>+k+1|)><rsub|k>|<around|(|-2*\<imath\><la>|)><rsup|k+1>*<around|(|n-k|)>!>=>>|<row|<cell|<frac|<around|(|-1|)><rsup|n+1>*<around|(|\<beta\>+1|)><rsub|n>|2*\<imath\><la>>*<frac|<around|(|n+\<alpha\>+\<beta\>+1|)><rsub|k>*<around|(|-n|)><rsub|k><around|(|1|)><rsub|k>|<around|(|\<beta\>+1|)><rsub|k>>*<frac|t<rsup|k>|k!>>>>>
    </multline*>

    <no-indent>with <math|t=-1/2*\<imath\><la>>. Summing from <math|k=0> to
    <math|n> gives the first term in the answer. A similar argument
    simplifies the second term in Theorem <reference|fourier-jacobi>.
  </proof>

  <\Note>
    Define

    <\equation>
      A<rsub|n><rsup|<around|(|a,b|)>><around|(|t|)>=<frac|<around|(|a+1|)><rsub|n>|n!><pFq|3|1|n+a+b+1,-n,1|a+1|<frac|1|t>>.
    </equation>

    then the finite Fourier transform of the Jacobi polynomial
    <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>> is
    given by

    <\equation>
      <wide|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|^><around|(|<la>|)>=<frac|1|\<imath\><la>>*<around*|[|<around|(|-1|)><rsup|n+1>*e<rsup|-\<imath\><la>>*A<rsub|n><rsup|<around|(|\<beta\>,\<alpha\>|)>>*<around|(|-2*\<imath\><la>|)>+e<rsup|\<imath\><la>>*A<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*\<imath\><la>|)>|]>.
    </equation>
  </Note>

  <section|A collection of special examples><label|sec-examples>

  This section presents a collection of special cases of the Jacobi
  polynomials and their respective finite Fourier transforms.

  <subsection|Legendre polynomials>

  These polynomials were discussed in Section <reference|sec-jacobi> and
  correspond to the special case <math|\<alpha\>=\<beta\>=0>; that is,

  <\equation>
    P<rsub|n><around|(|x|)>=P<rsub|n><rsup|<around|(|0,0|)>><around|(|x|)>.<ch>
  </equation>

  The first formula in Theorem <reference|fourier-jacobi> reproduces the
  third formula in Theorem <reference|fourier-legendre>. Similarly, the
  second formula in Theorem <reference|fourier-jacobi> gives the last
  expression for the finite Fourier transform of Legendre polynomials in
  Theorem <reference|fourier-legendre>.

  <subsection|Gegenbauer polynomials><label|sec-gegenbauer>

  These polynomials are also special cases of
  <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>:

  <\equation>
    C<rsub|n><rsup|<around|(|\<nu\>|)>><around|(|x|)>=<frac|<around|(|2*\<nu\>|)><rsub|n>|<around|(|\<nu\>+1/2|)><rsub|n>>*P<rsub|n><rsup|<around|(|\<nu\>-1/2,\<nu\>-1/2|)>><around|(|x|)>.<ch>
  </equation>

  <\theorem>
    The finite Fourier transform of the Gegenbauer polynomial
    <math|C<rsub|n><rsup|<around|(|\<nu\>|)>><around|(|x|)>> is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|C<rsub|n><rsup|<around|(|\<nu\>|)>>|^><around|(|<la>|)>>|<cell|=>|<cell|2*<around|(|2*\<nu\>|)><rsub|n>*e<rsup|\<imath\><la>>*<big|sum><rsub|k=0><rsup|n>2<rsup|2*k>*<frac|<around|(|n+2*\<nu\>|)><rsub|k><around|(|\<nu\>|)><rsub|k>|<around|(|n-k|)>!<around|(|2*\<nu\>|)><rsub|2*k>><around*|[|<frac|e<rsup|-2*\<imath\><la>>*E<rsub|k>*<around|(|2*\<imath\><la>|)>-1|<around|(|-2*\<imath\><la>|)><rsup|k+1>>|]><ch>>>|<row|<cell|>|<cell|=>|<cell|<frac|2*<around|(|2*\<nu\>|)><rsub|n><around|(|\<nu\>|)><rsub|n>|<around|(|2*\<nu\>|)><rsub|2*n>>*<big|sum><rsub|k=0><rsup|n>2<rsup|2*k>*<frac|<around|(|n+2*\<nu\>|)><rsub|k>*<around|(|2*\<nu\>+2*k|)><rsub|2*n-2*k>|<around|(|n-k|)>!<around|(|\<nu\>+k|)><rsub|n-k>><around*|[|<frac|<around|(|-1|)><rsup|n-k>*e<rsup|-\<imath\><la>>-e<rsup|\<imath\><la>>|<around|(|-2*\<imath\><la>|)><rsup|k+1>>|]><ch>>>>>
    </eqnarray*>

    <no-indent>and also

    <\multline*>
      <tformat|<table|<row|<cell|<wide|C<rsub|n><rsup|<around|(|\<nu\>|)>>|^><around|(|<la>|)>=<frac|<around|(|2*\<nu\>|)><rsub|n>|\<imath\><la>n!>\<times\><around*|[|<around|(|-1|)><rsup|n+1>*e<rsup|-\<imath\><la>><pFq|3|1|n+2*\<nu\>,-n,1|\<nu\>+<tfrac|1|2>|-<frac|1|2*\<imath\><la>>>+|\<nobracket\>>>>|<row|<cell|<around*|\<nobracket\>|e<rsup|\<imath\><la>><pFq|3|1|n+2*\<nu\>,-n,1|\<nu\>+<tfrac|1|2>|<frac|1|2*\<imath\><la>>>|]>.>>>>
    </multline*>
  </theorem>

  <subsection|Chebyshev polynomials><label|sec-chebyshev>

  The Chebyshev polynomial are related to Gegenbauer polynomials by

  <\equation>
    U<rsub|n><around|(|x|)>=C<rsub|n><rsup|<around|(|1|)>><around|(|x|)>*<text|and
    >T<rsub|n><around|(|x|)>=lim <rsub|\<nu\>\<to\>0><frac|n*C<rsub|n><rsup|<around|(|\<nu\>|)>><around|(|x|)>|2*\<nu\>>,<text|for
    >n\<geq\>1.<ch>
  </equation>

  <no-indent>These formulas are now used to evaluate the finite Fourier
  transform of Chebyshev polynomials.

  <\Thm>
    The finite Fourier transform of the Chebyshev polynomial is given by

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|U<rsub|n>|^><around|(|<la>|)>>|<cell|=>|<cell|e<rsup|\<imath\><la>>*<big|sum><rsub|k=0><rsup|n>2<rsup|2*k+1>*k!<binom|n+k+1|n-k><around*|[|<frac|e<rsup|-2*\<imath\><la>>*E<rsub|k>*<around|(|2*\<imath\><la>|)>-1|<around|(|-2*\<imath\><la>|)><rsup|k+1>>|]><ch>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|n><frac|2<rsup|2*k+1>*<around|(|n+k+1|)>!<space|0.17em>k!|<around|(|2*k+1|)>!<space|0.17em><around|(|n-k|)>!>*<frac|<around*|[|<around|(|-1|)><rsup|n-k>*e<rsup|-\<imath\><la>>-e<rsup|\<imath\><la>>|]>|<around|(|-2*\<imath\><la>|)><rsup|k+1>><ch>>>>>
    </eqnarray*>

    <no-indent>and

    <\eqnarray*>
      <tformat|<table|<row|<cell|<wide|T<rsub|n>|^><around|(|<la>|)>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|n><around|(|-1|)><rsup|k+1><frac|n*2<rsup|k>*<around|(|n+k|)>!k!|<around|(|n-k|)>!<around|(|2*k|)>!<around|(|n+k|)>>*<frac|<around*|[|<around|(|-1|)><rsup|n-k>*e<rsup|-\<imath\><la>>-e<rsup|\<imath\><la>>|]>|<around|(|\<imath\><la>|)><rsup|k+1>>>>>>
    </eqnarray*>
  </Thm>

  <section|Biorthogonality for the Jacobi
  polynomials><label|sec-biorthogonality>

  The sequence of functions <math|<around|{|<frac|1|<sqrt|2>>*e<rsup|\<pi\>*\<imath\>*j*x>:<space|0.17em>j\<in\>\<bbb-Z\>|}>>
  forms an orthonormal family on the Hilbert space
  <math|L<rsup|2><around|[|-1,1|]>>. Therefore, every continuous function
  <math|f> defined on <math|<around|[|-1,1|]>> may be expanded in the form

  <\equation>
    f<around|(|x|)>=<frac|1|<sqrt|2>>*<big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>a<rsub|j><around|(|f|)>*e<rsup|\<pi\>*\<imath\>*j*x>,
  </equation>

  <no>indent where the Fourier coefficients are given by

  <\equation>
    a<rsub|j><around|(|f|)>=<frac|1|<sqrt|2>>*<big|int><rsub|-1><rsup|1>f<around|(|x|)>*e<rsup|-\<pi\>*\<imath\>*j*x>*<space|0.17em>d*x.
  </equation>

  Parseval's identity <cite-detail|hardy-1950a|Theorem <math|14>> states that

  <\equation>
    <big|int><rsub|-1><rsup|1>f<around|(|x|)><wide|g<around|(|x|)>|\<bar\>><space|0.17em>d*x=<big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>a<rsub|j><around|(|f|)><wide|a<rsub|j><around|(|g|)>|\<bar\>>.
  </equation>

  This identity is now made explicit for the case

  <\equation>
    f<around|(|x|)>=P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*<text|and
    >g<around|(|x|)>=Q<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>\<assign\><around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>.
  </equation>

  The Fourier coefficients <math|a<rsub|j><around|(|Q<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>>
  are given in <eqref|jacobi-101> and <math|a<rsub|j><around|(|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>>
  have been evaluated in Theorem <reference|fourier-jacobi>. Parseval's
  identity and the orthogonality of Jacobi polynomials give

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|j=-\<infty\>><rsup|\<infty\>>a<rsub|j><around|(|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)><wide|a<rsub|j><around|(|Q<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>|\<bar\>>>|<cell|=>|<cell|<frac|2<rsup|\<alpha\>+\<beta\>+1>*\<Gamma\>*<around|(|n+\<alpha\>+1|)>*\<Gamma\>*<around|(|n+\<beta\>+1|)>|<around|(|2*n+\<alpha\>+\<beta\>+1|)>*n!\<Gamma\>*<around|(|n+\<alpha\>+\<beta\>+1|)>>*\<delta\><rsub|n,m>,>>>>
  </eqnarray>

  <no-indent>where <math|\<delta\><rsub|n,m>> is Kronecker's delta (<math|1>
  if <math|n=m> and <math|0> if <math|n\<neq\>m>). Only the case
  <math|n\<neq\>m> leads to an interesting relation. A direct calculation
  shows that <math|a<rsub|0>(Q<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=0>,
  so that Parseval's identity is written as

  <\eqnarray*>
    <tformat|<table|<row|<cell|<big|sum><rsub|j\<in\>\<bbb-Z\>,j\<neq\>0>a<rsub|j><around|(|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)><wide|a<rsub|j><around|(|Q<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>|\<bar\>>=0,<space|1em><text|for
    >n\<neq\>m.>>>>
  </eqnarray*>

  To simplify the previous relation, replace <math|<la>=-\<pi\>*j> in
  <eqref|jacobi-101> and use Kummer's identity

  <\equation>
    <pFq|1|1|u|u+v|z>=e<rsup|z><pFq|1|1|v|u+v|-z>
  </equation>

  <no-indent>to obtain

  <\multline*>
    <tformat|<table|<row|<cell|<wide|a<rsub|j><around|(|Q<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>>|)>|\<bar\>>=<frac|<around|(|-1|)><rsup|j>*j<rsup|m>|m!>*2<rsup|m+\<alpha\>+\<beta\>+1/2>*B<around|(|m+\<alpha\>+1,m+\<beta\>+1|)>>>|<row|<cell|<pFq|1|1|m+\<beta\>+1|2*m+\<alpha\>+\<beta\>+2|2*\<pi\>*\<imath\>*j>.>>>>
  </multline*>

  Similiarly, <eqref|fourier-jacobi> with <math|<la>=-\<pi\>*j> gives

  <\multline*>
    <tformat|<table|<row|<cell|a<rsub|j><around|(|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>|)>=<frac|<around|(|-1|)><rsup|j>|2*\<pi\>*\<imath\>*j*n!>>>|<row|<cell|<around*|[|<around|(|-1|)><rsup|n>*<around|(|\<beta\>+1|)><rsub|n><space|0.17em><space|0.17em><pFq|3|1|n+\<alpha\>+\<beta\>+1,-n,1|\<beta\>+1|<frac|1|2*\<pi\>*\<imath\>*j>>-|\<nobracket\>>>>|<row|<cell|<around*|\<nobracket\>|<around|(|\<alpha\>+1|)><rsub|n><space|0.17em><space|0.17em><pFq|3|1|n+\<alpha\>+\<beta\>+1,-n,1|\<alpha\>+1|-<frac|1|2*\<pi\>*\<imath\>*j>>|]>.>>>>
  </multline*>

  Parseval's identity now produces the next result.

  <\theorem>
    Define

    <\equation*>
      W<rsub|n,m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t;j|)>=<around|(|\<alpha\>+1|)><rsub|n>*j<rsup|m-1><pFq|3|1|n+\<alpha\>+\<beta\>+1,-n,1|\<alpha\>+1|<frac|1|t>><pFq|1|1|m+\<alpha\>+1|2*m+\<alpha\>+\<beta\>+2|t>.
    </equation*>

    <no-indent>Then

    <\equation>
      <around|(|-1|)><rsup|n>*<big|sum><rsub|j\<in\>\<bbb-Z\>,<space|0.17em>j\<neq\>0>W<rsub|n,m><rsup|<around|(|\<beta\>,\<alpha\>|)>><around|(|2*\<pi\>*\<imath\>*j;j|)>=<around|(|-1|)><rsup|m-1>*<big|sum><rsub|j\<in\>\<bbb-Z\>,<space|0.17em>j\<neq\>0>W<rsub|n,m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|2*\<pi\>*\<imath\>*j;j|)>.
    </equation>

    In particular, if <math|n> and <math|m> have opposite parity, then

    <\equation>
      <big|sum><rsub|j\<in\>\<bbb-Z\>,<space|0.17em>j\<neq\>0>W<rsub|n,m><rsup|<around|(|\<beta\>,\<alpha\>|)>><around|(|2*\<pi\>*\<imath\>*j;j|)>=<big|sum><rsub|j\<in\>\<bbb-Z\>,<space|0.17em>j\<neq\>0>W<rsub|n,m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|2*\<pi\>*\<imath\>*j;j|)>.
    </equation>
  </theorem>

  <section|An operator point of view><label|sec-operator>

  To obtain the finite Fourier transform of a polynomial start with

  <\equation>
    <big|int><rsub|-1><rsup|1>x<rsup|k>*e<rsup|\<imath\><la>x>*<space|0.17em>d*x=<around|(|-\<imath\>*D|)><rsup|k><around|(|2<text|sinc
    ><la>|)>
  </equation>

  <no-indent>where the <with|font-shape|italic|sinc> function is

  <\equation>
    <text|sinc ><la>=<frac|sin <la>|<la>>
  </equation>

  and <math|D=<frac|d|d<la>>>. The action is extended by linearity to obtain

  <\equation>
    <wide|P|^><around|(|<la>|)>=P*<around|(|-\<imath\>*D|)><around|(|2<text|sinc
    ><la>|)>.
  </equation>

  For instance, for the Chebyshev polynomial

  <\equation>
    U<rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n><around|(|-2|)><rsup|k><binom|n+k+1|n-k><around|(|1-x|)><rsup|k>
  </equation>

  <no-indent>leads to

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|U<rsub|n>|^><around|(|<la>|)>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|n><around|(|-2|)><rsup|k><binom|n+k+1|n-k><around|(|1+\<imath\>*D|)><rsup|k><around|(|2<text|sinc
    ><la>|)><eq-number>>>|<row|<cell|>|<cell|=>|<cell|U<rsub|n>*<around|(|-\<imath\>*D|)><around|(|2<text|sinc
    ><la>|)>.>>>>
  </eqnarray>

  It is elementary to check that

  <\equation>
    <around*|(|<frac|d|d<la>>|)><rsup|n><text|sinc
    ><la>=A<rsub|n><around|(|<la>|)>*sin <la>+B<rsub|n><around|(|<la>|)>*cos
    <la>
  </equation>

  <no-indent>where <math|A<rsub|n>,<space|0.17em>B<rsub|n>> are polynomials
  in <math|1/<la>> that satisfy the recurrences

  <\eqnarray*>
    <tformat|<table|<row|<cell|A<rsub|n+1><around|(|<la>|)>>|<cell|=>|<cell|A<rsub|n><rprime|'><around|(|<la>|)>-B<rsub|n><around|(|<la>|)>>>|<row|<cell|B<rsub|n+1><around|(|<la>|)>>|<cell|=>|<cell|A<rsub|n><around|(|<la>|)>+B<rsub|n><rprime|'><around|(|<la>|)>,>>>>
  </eqnarray*>

  <no-indent>with initial values <math|A<rsub|0><around|(|<la>|)>=1/<la>> and
  <math|B<rsub|0><around|(|<la>|)>=0>. An explicit expression for these
  polynomials can be obtain from

  <\equation>
    <around*|(|<frac|d|d<la>>|)><rsup|n><text|sinc
    ><la>=<big|sum><rsub|j=0><rsup|n><frac|n!|<around|(|n-j|)>!>*<frac|sin
    <around|(|<la>+<around|(|n+j|)><tfrac|\<pi\>|2>|)>|<la><rsup|j+1>>.
  </equation>

  Details of this approach to finite Fourier transform of orthogonal
  polynomials will be given elsewhere.

  <vspace*|1fn><no-indent><with|font-series|bold|Acknowledgments>. The
  authors wish to thank A.<nbsp>Fokas, T. Koorwinder and T. Amdeberhan for
  discussions on the topic presented here. The work of the fourth author was
  partially funded by NSF-DMS <math|1112656>. The first author is a
  postdoctoral fellow and the second author is a graduate student partially
  funded by the same grant.

  <vspace|2fn>

  <\thebibliography|1>
    <bibitem|erderly-1954a>A.<nbsp>Erdélyi.
    <newblock><with|font-shape|italic|Tables of Integral Transforms>,
    volume<nbsp>I. <newblock>McGraw-Hill, New York, 1st edition, 1954.

    <bibitem|fokas-2014a>A.<nbsp>S. Fokas, A.<nbsp>Iserles, and S.<nbsp>A.
    Smitherman. <newblock>The unified method in polygonal domains via the
    explicit Fourier transform of Legendre polynomials. <newblock>In
    A.<nbsp>S. Fokas and B.<nbsp>Pelloni, editors,
    <with|font-shape|italic|Unified Transforms>, page<nbsp>?? SIAM, 2014.

    <bibitem|gradshteyn-2007a>I.<nbsp>S. Gradshteyn and I.<nbsp>M. Ryzhik.
    <newblock><with|font-shape|italic|Table of Integrals, Series, and
    Products>. <newblock>Edited by A. Jeffrey and D. Zwillinger. Academic
    Press, New York, 7th edition, 2007.

    <bibitem|graham-1994a>R.<nbsp>Graham, D.<nbsp>Knuth, and
    O.<nbsp>Patashnik. <newblock><with|font-shape|italic|Concrete
    Mathematics>. <newblock>Addison Wesley, Boston, 2nd edition, 1994.

    <bibitem|greenen-2008a>N.<nbsp>Greene. <newblock>Formulas for the Fourier
    series of orthogonal polynomials in terms of special functions.
    <newblock><with|font-shape|italic|International Journal of Mathematical
    Models and Methods in Applied Sciences>, 2:317\U320, 2008.

    <bibitem|hardy-1950a>G.<nbsp>H. Hardy and W.<nbsp>W. Rogosinski.
    <newblock><with|font-shape|italic|Fourier Series>. <newblock>Cambridge
    University Press, 2nd edition, 1950.

    <bibitem|nemesi-1997a>I.<nbsp>Nemes, M.<nbsp>Petkovsek, H.<nbsp>Wilf, and
    D.<nbsp>Zeilberger. <newblock>How to do MONTHLY problems with your
    computer. <newblock><with|font-shape|italic|Amer. Math. Monthly>,
    104:505\U519, 1997.

    <bibitem|olver-2010a>F.<nbsp>W.<nbsp>J. Olver, D.<nbsp>W. Lozier,
    R.<nbsp>F. Boisvert, and C.<nbsp>W. Clark, editors.
    <newblock><with|font-shape|italic|NIST Handbook of Mathematical
    Functions>. <newblock>Cambridge University Press, 2010.

    <bibitem|petkovsek-1996a>M.<nbsp>Petkov²ek, H.<nbsp>Wilf, and
    D.<nbsp>Zeilberger. <newblock><with|font-shape|italic|A=B>. <newblock>A.
    K. Peters, Ltd., 1st edition, 1996.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-10|<tuple|59|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-2|<tuple|2|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-3|<tuple|3|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-4|<tuple|4|7|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-5|<tuple|4.1|7|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-6|<tuple|4.2|7|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-7|<tuple|4.3|8|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-8|<tuple|5|8|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|auto-9|<tuple|6|10|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-erderly-1954a|<tuple|erderly-1954a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-fokas-2014a|<tuple|fokas-2014a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-gradshteyn-2007a|<tuple|gradshteyn-2007a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-graham-1994a|<tuple|graham-1994a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-greenen-2008a|<tuple|greenen-2008a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-hardy-1950a|<tuple|hardy-1950a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-nemesi-1997a|<tuple|nemesi-1997a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-olver-2010a|<tuple|olver-2010a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|bib-petkovsek-1996a|<tuple|petkovsek-1996a|11|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|binomial-1|<tuple|27|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|binomial-id|<tuple|4|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|boundary-1|<tuple|40|6|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|der-jacobi|<tuple|36|6|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|fourier-jacobi|<tuple|5|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|fourier-legendre|<tuple|3|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|hyper-legendre|<tuple|21|4|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|jacobi-101|<tuple|4|2|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|jacobi-111|<tuple|30|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|lemma-intpower|<tuple|1|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-110|<tuple|10|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-111|<tuple|11|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-112|<tuple|13|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-113|<tuple|14|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-114|<tuple|15|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|poch-3|<tuple|12|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-biorthogonality|<tuple|5|8|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-chebyshev|<tuple|4.3|8|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-examples|<tuple|4|7|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-gegenbauer|<tuple|4.2|7|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-intro|<tuple|1|1|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-jacobi|<tuple|3|5|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-legendre|<tuple|2|3|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sec-operator|<tuple|6|10|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
    <associate|sum-1|<tuple|23|4|../../Downloads/arXiv-1402.5544v1/fourier.tex>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      gradshteyn-2007a

      olver-2010a

      olver-2010a

      erderly-1954a

      olver-2010a

      fokas-2014a

      fokas-2014a

      greenen-2008a

      gradshteyn-2007a

      gradshteyn-2007a

      gradshteyn-2007a

      gradshteyn-2007a

      gradshteyn-2007a

      hardy-1950a
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.<space|2spc>Legendre
      polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.<space|2spc>Jacobi
      polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.<space|2spc>A
      collection of special examples> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1.<space|2spc>Legendre polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2.<space|2spc>Gegenbauer polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|4.3.<space|2spc>Chebyshev polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.<space|2spc>Biorthogonality
      for the Jacobi polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6.<space|2spc>An
      operator point of view> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>