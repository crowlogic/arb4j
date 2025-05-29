<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A UNIQUENESS PROBLEM FOR THE ENVELOPE OF AN
  OSCILLATORY PROCESS>|<doc-author|<author-data|<author-name|A. M.
  HASOFER>|<author-affiliation|Postal address: School of Mathematics,
  Department of Statistics, The University of New South Wales, P.O.Box 1,
  Kensington, N.S.W. 2033, Australia.>>>|<doc-date|Dec.1979>>

  <\abstract>
    In a previous paper, the author has described a method for obtaining
    envelope processes for oscillatory stochastic processes. These are
    processes which can be represented as the output of a time-varying linear
    filter whose input is a stationary process.

    It is shown in this paper that the proposed definition of the envelope
    process may not be unique, but may depend on the particular
    representation of the oscillatory process chosen.

    It is then shown that for a class of oscillatory processes which is of
    particular interest, the class of transient processes, there is a class
    of natural representations which all lead to a unique envelope process.

    <with|font-series|bold|Keywords:> NON-STATIONARY STOCHASTIC PROCESSES;
    TIME-VARYING FILTERS; ENVELOPE PROCESSES
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Background
    and notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    counterexample> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    class of transient processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  In a previous paper<nbsp><cite|hasoferpetocz>, the author described a
  method for obtaining an envelope process for a class of non-stationary
  stochastic processes. This is the class of oscillatory processes introduced
  by Priestley<nbsp><cite|priestley>. For an oscillatory process
  <math|Y<around|(|t|)>>, one defines a `quadrature process'
  <math|<wide|Y|^><around|(|t|)>>. The envelope process,
  <math|R<around|(|t|)>>, is then defined by

  <\equation>
    R<around|(|t|)>=<sqrt|Y<rsup|2><around|(|t|)>+<wide|Y|^><rsup|2><around|(|t|)>><label|eq:envelope>
  </equation>

  It has come to the author's notice that similar definitions for the
  envelope were given by Arens in 1957<nbsp><cite|arens>, and Yang in
  1972<nbsp><cite|yang>.

  Further analysis has, however, uncovered the fact that the proposed
  definition of the quadrature process may not be unique, but may depend on
  the particular representation chosen for <math|Y<around|(|t|)>> in terms of
  an underlying stationary process. This lack of uniqueness is exhibited by a
  counterexample.

  It is then shown that for a class of oscillatory processes which is of
  particular interest, the class of transient processes, there is a class of
  natural representations which all lead to a unique quadrature process.

  <section|Background and notation>

  Let <math|X<around|(|t|)>> be a real-valued stationary stochastic process
  with zero mean and finite variance. Let its spectral representation be

  <\equation>
    X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:spectral>
  </equation>

  (See Hasofer and Petocz<nbsp><cite|hasoferpetocz>.)

  It is well known that <math|X<around|(|t|)>> uniquely determines the two
  uncorrelated processes with orthogonal increments
  <math|U<around|(|\<lambda\>|)>> and <math|V<around|(|\<lambda\>|)>>, e.g.
  through the formulae<nbsp><cite-detail|cramerleadbetter|p. 136>

  <\align>
    <tformat|<table|<row|<cell|U<around|(|\<lambda\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
    <around|(|\<lambda\>*t|)>|t>*X<around|(|t|)>*<space|0.17em>d*t<eq-number><label|eq:Ulambda>>>|<row|<cell|V<around|(|\<lambda\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-cos
    <around|(|\<lambda\>*t|)>|t>*X<around|(|t|)>*<space|0.17em>d*t<eq-number><label|eq:Vlambda>>>>>
  </align>

  The Hilbert transform of <math|X<around|(|t|)>>,
  <math|<wide|X|^><around|(|t|)>>, is defined by the formula

  <\equation>
    <wide|X|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>-cos
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:hilbert>
  </equation>

  It is to be noted that <math|<wide|X|^><around|(|t|)>> defines
  <math|X<around|(|t|)>> uniquely. This is easily seen from the fact that the
  Hilbert transform of <math|<wide|X|^><around|(|t|)>> is
  <math|-X<around|(|t|)>>.

  Next we define the oscillatory process <math|Y<around|(|t|)>> by the
  formula

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:Ydef>
  </equation>

  where <math|h<around|(|t,u|)>> is the impulse response function of a
  linear, non-time-invariant filter. This may be written in the form

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>+sin
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)><label|eq:Yspectral>
  </equation>

  (see<nbsp><cite|hasoferpetocz>).

  We then define the quadrature process <math|<wide|Y|^><around|(|t|)>> by
  the equation

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>-cos
    <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)><label|eq:Yquad>
  </equation>

  It is easy to see that this definition is equivalent to

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<wide|X|^><around|(|u|)>*<space|0.17em>d*u.<label|eq:Yquadequiv>
  </equation>

  Finally, it is useful to have a definition of
  <math|<wide|X|^><around|(|t|)>>, <math|<wide|Y|^><around|(|t|)>> in terms
  of the complex-valued representation of <math|X<around|(|t|)>>. Let

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)><label|eq:Xcomplex>
  </equation>

  Assuming that <math|\<zeta\><around|(|\<lambda\>|)>> has a.s. no jump at
  the origin (corresponding to no jump for the spectrum
  <math|F<around|(|\<lambda\>|)>> of <math|X<around|(|t|)>>), we have

  <\equation>
    <wide|X|^><around|(|t|)>=<text|Im><around*|(|2*<big|int><rsub|0><rsup|+\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)>|)><label|eq:Xhatcomplex>
  </equation>

  Further we can write

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)><label|eq:Ycomplex>
  </equation>

  where

  <\equation>
    A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<lambda\>*u>*<space|0.17em>d*u.<label|eq:Adef>
  </equation>

  We then easily see that

  <\equation>
    <wide|Y|^><around|(|t|)>=<text|Im><around*|(|2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)>|)>.<label|eq:Yhatcomplex>
  </equation>

  There is a difficulty about the definition<nbsp><eqref|eq:Yquadequiv> in
  the following sense. Suppose that there exists another representation of
  <math|Y<around|(|t|)>> of the form

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'><around|(|t,u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:Yalt>
  </equation>

  where <math|X<rprime|'><around|(|t|)>> is a stationary stochastic process
  with zero mean and finite variance. The existence of an infinity of
  representations of <math|Y<around|(|t|)>> of the form<nbsp><eqref|eq:Yalt>
  has been pointed out by Priestley<nbsp><cite-detail|priestley|p. 205>. The
  quadrature process of <math|Y<around|(|t|)>> derived from the
  representation<nbsp><eqref|eq:Yalt> is

  <\equation>
    <wide|Y|^><rprime|'><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'><around|(|t,u|)>*<wide|X|^><rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:Yquadprime>
  </equation>

  The question then arises: is <math|<wide|Y|^><rprime|'><around|(|t|)>>
  equal to <math|<wide|Y|^><around|(|t|)>>, or in other words, is the
  definition of the quadrature process given in<nbsp><eqref|eq:Yquadequiv>
  independent of the particular representation of <math|Y<around|(|t|)>> as
  the output of a linear, non-time-invariant filter with a stationary input
  process?

  In this note, we shall answer this question in the negative. In fact we
  shall exhibit a counterexample, which yields two completely different
  quadrature processes <math|<wide|Y|^><around|(|t|)>> and
  <math|<wide|Y|^><rprime|'><around|(|t|)>> for two different representations
  of <math|Y<around|(|t|)>>.

  However, the lack of invariance of <math|<wide|Y|^><around|(|t|)>> does not
  necessarily invalidate its use. In fact we shall show that for a
  particularly interesting class of oscillatory processes, namely the class
  of 'transient' processes, there is a class of natural representations, all
  of which lead to the same quadrature process, which can then be taken as
  the natural one.

  <section|The counterexample>

  Let <math|<around|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>|)>>
  be four independent standard normal random variables. We consider the
  stochastic process <math|X<around|(|t|)>> defined by

  <\equation>
    X<around|(|t|)>=\<xi\><rsub|1>*cos t+\<xi\><rsub|2>*cos
    2*t+\<xi\><rsub|3>*sin t+\<xi\><rsub|4>*sin 2*t<label|eq:Xcounter>
  </equation>

  This process can be easily checked to have zero mean and finite variance
  and to be stationary.

  The Hilbert space spanned by <math|X<around|(|t|)>> (see Cramér and
  Leadbetter<nbsp><cite-detail|cramerleadbetter|p. 105>) is in this case just
  an ordinary four-dimensional Euclidean space, and all linear operators in
  this space are four-by-four matrices. In the sequel of this section we
  shall use the Hilbert space operator notation interchangeably with matrix
  notation.

  Let <math|Y<around|(|t|)>> be defined by

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:Ycounter>
  </equation>

  where <math|h<around|(|t,u|)>> is the impulse response function of a
  linear, non-time-invariant filter.

  To simplify the exposition, we introduce the following notation. Let

  <\equation>
    \<b-xi\>=<around|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>|)><rsup|T>=<matrix|<tformat|<table|<row|<cell|\<xi\><rsub|1>>>|<row|<cell|\<xi\><rsub|2>>>|<row|<cell|\<xi\><rsub|3>>>|<row|<cell|\<xi\><rsub|4>>>>>>
  </equation>

  \ be the column vector of the four random variables
  <math|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>>. We can
  express <math|X<around|(|t|)>> in terms of <math|\<b-xi\>> as:

  <\equation>
    X<around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|cos
    t>|<cell|cos 2*t>|<cell|sin t>|<cell|sin
    2*t>>>>>|]>*\<b-xi\><label|eq:Xmatrix>
  </equation>

  This mapping from <math|\<b-xi\>> to <math|X<around|(|t|)>> is invertible.
  In the present case, this is almost obvious. For instance

  <\equation>
    \<xi\><rsub|2>=<frac|1|\<pi\>>*<big|int><rsub|-\<pi\>><rsup|+\<pi\>>X<around|(|t|)>*cos
    2*t*<space|0.17em>d*t<label|eq:xi2>
  </equation>

  The Hilbert transform <math|<wide|X|^><around|(|t|)>> can be expressed as:

  <\equation>
    <wide|X|^><around|(|t|)>=\<xi\><rsub|1>*sin t+\<xi\><rsub|2>*sin
    2*t-\<xi\><rsub|3>*cos t-\<xi\><rsub|4>*cos 2*t<label|eq:Xhatcounter>
  </equation>

  or in matrix form:

  <\equation>
    <wide|X|^><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|sin
    t>|<cell|sin 2*t>|<cell|-cos t>|<cell|-cos
    2*t>>>>>|]>*\<b-xi\><label|eq:Xhatmatrix>
  </equation>

  The oscillatory process <math|Y<around|(|t|)>> can be written as:

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)><around*|[|<tabular*|<tformat|<table|<row|<cell|cos
    u>|<cell|cos 2*u>|<cell|sin u>|<cell|sin
    2*u>>>>>|]>*<space|0.17em>d*u*<space|0.17em>\<b-xi\><label|eq:YKFxi>
  </equation>

  Similarly, the quadrature process is:

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*<wide|X|^><around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)><around*|[|<tabular*|<tformat|<table|<row|<cell|sin
    u>|<cell|sin 2*u>|<cell|-cos u>|<cell|-cos
    2*u>>>>>|]>*<space|0.17em>d*u*<space|0.17em>\<b-xi\><label|eq:YKHFXI>
  </equation>

  Now let <math|T> denote a four-by-four orthogonal matrix. Then the vector
  <math|\<b-xi\><rprime|'>=T*\<b-xi\>> will still consist of four independent
  standard normal variables. We can write <math|Y<around|(|t|)>> in an
  alternative form by noting that:

  <\equation>
    \<b-xi\>=T<rsup|-1>*
  </equation>

  <\equation>
    \<b-xi\><rprime|'>=T<rsup|\<perp\>>*\<b-xi\><rprime|'>
  </equation>

  Therefore:

  <\align>
    <tformat|<table|<row|<cell|Y<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)><around*|[|<tabular*|<tformat|<table|<row|<cell|cos
    u>|<cell|cos 2*u>|<cell|sin u>|<cell|sin
    2*u>>>>>|]>*<space|0.17em>d*u*<space|0.17em>T<rsup|\<perp\>>*\<b-xi\><rprime|'><eq-number><label|eq:Yaltform1>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)><around*|[|<tabular*|<tformat|<table|<row|<cell|cos
    u>|<cell|cos 2*u>|<cell|sin u>|<cell|sin
    2*u>>>>>|]>*T<rsup|\<perp\>>d*u*<space|0.17em>\<b-xi\><rprime|'><eq-number><label|eq:Yaltform2>>>>>
  </align>

  This gives us a new representation where:

  <\equation>
    X<rprime|'><around|(|u|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|cos
    u>|<cell|cos 2*u>|<cell|sin u>|<cell|sin
    2*u>>>>>|]>*T<rsup|\<perp\>>*\<b-xi\><rprime|'><label|eq:Xprime>
  </equation>

  We shall take as <math|T> the well-known orthogonal matrix

  <\equation>
    T=<frac|1|2><around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|1>|<cell|1>>|<row|<cell|-1>|<cell|-1>|<cell|1>|<cell|1>>|<row|<cell|1>|<cell|-1>|<cell|-1>|<cell|1>>|<row|<cell|-1>|<cell|1>|<cell|-1>|<cell|1>>>>>|]><label|eq:Tmatrix>
  </equation>

  This gives us:

  <\align>
    <tformat|<table|<row|<cell|\<xi\><rprime|'><rsub|1>>|<cell|=<frac|1|2>*<around|(|\<xi\><rsub|1>+\<xi\><rsub|2>+\<xi\><rsub|3>+\<xi\><rsub|4>|)><eq-number><label|eq:xi1prime>>>|<row|<cell|\<xi\><rprime|'><rsub|2>>|<cell|=<frac|1|2>*<around|(|-\<xi\><rsub|1>-\<xi\><rsub|2>+\<xi\><rsub|3>+\<xi\><rsub|4>|)><eq-number><label|eq:xi2prime>>>|<row|<cell|\<xi\><rprime|'><rsub|3>>|<cell|=<frac|1|2>*<around|(|\<xi\><rsub|1>-\<xi\><rsub|2>-\<xi\><rsub|3>+\<xi\><rsub|4>|)><eq-number><label|eq:xi3prime>>>|<row|<cell|\<xi\><rprime|'><rsub|4>>|<cell|=<frac|1|2>*<around|(|-\<xi\><rsub|1>+\<xi\><rsub|2>-\<xi\><rsub|3>+\<xi\><rsub|4>|)><eq-number><label|eq:xi4prime>>>>>
  </align>

  Computing <math|T<rsup|T>>:

  <\equation>
    T<rsup|T>=<frac|1|2><around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|-1>|<cell|1>|<cell|-1>>|<row|<cell|1>|<cell|-1>|<cell|-1>|<cell|1>>|<row|<cell|1>|<cell|1>|<cell|-1>|<cell|-1>>|<row|<cell|1>|<cell|1>|<cell|1>|<cell|1>>>>>|]><label|eq:Ttranspose>
  </equation>

  This transformation gives us a new stationary process:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|X<rprime|'><around|(|u|)>>|<cell|=\<xi\><rprime|'><rsub|1>*<around|(|cos
    u-cos 2*u+sin u-sin 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|2>*<around|(|-cos
    u-cos 2*u-sin u+sin 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|3>*<around|(|cos
    u+cos 2*u-sin u-sin 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|4>*<around|(|-cos
    u+cos 2*u-sin u+sin 2*u|)>>>>>><label|eq:Xprimeexplicit>
  </equation>

  The corresponding Hilbert transform is:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|X|^><rprime|'><around|(|u|)>>|<cell|=\<xi\><rprime|'><rsub|1>*<around|(|sin
    u-sin 2*u-cos u+cos 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|2>*<around|(|-sin
    u-sin 2*u+cos u+cos 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|3>*<around|(|sin
    u+sin 2*u+cos u+cos 2*u|)>+>>|<row|<cell|>|<cell|\<xi\><rprime|'><rsub|4>*<around|(|-sin
    u+sin 2*u+cos u-cos 2*u|)>>>>>><label|eq:Xhatprimeexplicit>
  </equation>

  We obtain for the original representation:

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*<around|[|-\<xi\><rsub|3>*cos
    u-\<xi\><rsub|4>*cos 2*u+\<xi\><rsub|1>*sin u+\<xi\><rsub|2>*sin
    2*u|]>*<space|0.17em>d*u<label|eq:Yhatcounter>
  </equation>

  while for the alternative representation:

  <\equation>
    <wide|Y|^><rprime|'><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*<around|[|\<xi\><rsub|2>*cos
    u-\<xi\><rsub|1>*cos 2*u-\<xi\><rsub|4>*sin u+\<xi\><rsub|3>*sin
    2*u|]>*<space|0.17em>d*u<label|eq:Yhatprimecounter>
  </equation>

  From these representations it is easy to calculate the cross-covariances,
  which turn out to be:

  <\align>
    <tformat|<table|<row|<cell|E*<around|[|Y<around|(|u|)>*<wide|Y|^><around|(|v|)>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>><big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around|[|sin
    <around|(|t<rsub|2>-t<rsub|1>|)>+sin 2*<around|(|t<rsub|2>-t<rsub|1>|)>|]>*<space|0.17em>d*t<rsub|1>*<space|0.17em>d*t<rsub|2><eq-number><label|eq:cov1>>>|<row|<cell|E*<around|[|Y<around|(|u|)>*<wide|Y|^><rprime|'><around|(|v|)>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>><big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around|[|cos
    <around|(|2*t<rsub|1>+t<rsub|2>|)>-cos
    <around|(|t<rsub|1>+2*t<rsub|2>|)>|]>*<space|0.17em>d*t<rsub|1>*<space|0.17em>d*t<rsub|2><eq-number><label|eq:cov2>>>>>
  </align>

  two utterly dissimilar covariances.

  <section|The class of transient processes>

  We shall now consider a special class of oscillatory processes, which is of
  great practical interest, and for which there exists a class of 'natural'
  representations. We refer to the case of 'transient' processes. By this we
  mean processes which are asymptotically stationary. For example, if the
  process <math|Y<around|(|t|)>> is the solution of a linear differential
  equation with given initial conditions, and a forcing function which is a
  stationary process <math|X<around|(|t|)>>, <math|Y<around|(|t|)>> would
  often be asymptotically stationary, and we would call it a 'transient'
  process.

  We shall make our definition precise in the following way. We assume that
  we have a family of oscillatory processes

  <\equation>
    Y<around|(|t<rsub|0>;t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t<rsub|0>;t,u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:Yt0t>
  </equation>

  (We think of <math|t<rsub|0>> as being the point at which the process
  <math|Y> is initiated.)

  We further assume that as <math|t<rsub|0>> tends to <math|-\<infty\>>,
  <math|h<around|(|t<rsub|0>;t,u|)>> tends to a limit
  <math|h*<around|(|t-u|)>>, and <math|Y<around|(|t<rsub|0>;t|)>> tends to a
  stationary process

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h*<around|(|t-u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:Ystationary>
  </equation>

  We shall further assume that the kernel <math|h*<around|(|t-u|)>> is
  invertible, meaning there exists a kernel <math|g*<around|(|t-u|)>> such
  that:

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>g*<around|(|t-u|)>*Y<around|(|u|)>*<space|0.17em>d*u<label|eq:XfromY>
  </equation>

  Suppose now that there exists a second representation of
  <math|Y<around|(|t<rsub|0>;t|)>> of the form

  <\equation>
    Y<around|(|t<rsub|0>;t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'><around|(|t<rsub|0>;t,u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:Yt0tprime>
  </equation>

  which, as <math|t<rsub|0>\<rightarrow\>-\<infty\>>, tends to

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'>*<around|(|t-u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:Ytprime>
  </equation>

  We have, on account of<nbsp><eqref|eq:XfromY>,

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>g*<around|(|t-v|)>*<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'>*<around|(|v-u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u*<space|0.17em>d*v=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>k*<around|(|t-u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:XKprime>
  </equation>

  where

  <\equation>
    k*<around|(|t-u|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>g*<around|(|t-v|)>*h<rprime|'>*<around|(|v-u|)>*<space|0.17em>d*v<label|eq:kkernel>
  </equation>

  We now note that <math|k*<around|(|t-u|)>> represents a time-invariant
  linear filter. It is easily verified that on account of this fact we have

  <\equation>
    <wide|X|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>k*<around|(|t-u|)>*<wide|X|^><rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:XhatKprime>
  </equation>

  for the Hilbert transformation commutes with time-invariant filters. It
  follows from<nbsp><eqref|eq:XKprime> and<nbsp><eqref|eq:XhatKprime> that

  <\equation>
    Y<around|(|t<rsub|0>;t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t<rsub|0>;t,v|)>*<big|int><rsub|-\<infty\>><rsup|+\<infty\>>k*<around|(|v-u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u*<space|0.17em>d*v=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'><around|(|t<rsub|0>;t,u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:Yt0KprimeX>
  </equation>

  and that

  <\equation>
    <wide|Y|^><around|(|t<rsub|0>;t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t<rsub|0>;t,v|)>*<big|int><rsub|-\<infty\>><rsup|+\<infty\>>k*<around|(|v-u|)>*<wide|X|^><rprime|'><around|(|u|)>*<space|0.17em>d*u*<space|0.17em>d*v<label|eq:YhatKprime>
  </equation>

  while

  <\equation>
    <wide|Y|^><rprime|'><around|(|t<rsub|0>;t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<rprime|'><around|(|t<rsub|0>;t,u|)>*<wide|X|^><rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:YhatprimeK>
  </equation>

  We use now the spectral representation of <math|X<rprime|'>>:

  <\equation>
    X<rprime|'><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)><label|eq:XprimeSpectral>
  </equation>

  and obtain

  <\align>
    <tformat|<table|<row|<cell|Y<around|(|t<rsub|0>;t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:Yt0A>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:Yt0Aprime>>>>>
  </align>

  where <math|A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>> corresponds to
  the compound filter operation and <math|A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>>
  corresponds to the direct filter <math|h<rprime|'><around|(|t<rsub|0>;t,u|)>>.
  It easily follows that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>-A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<rprime|'><around|(|\<lambda\>|)>=0*<space|1em><text|for
    each >t<label|eq:AAdiff>
  </equation>

  where <math|F<rprime|'><around|(|\<lambda\>|)>> is the spectral
  distribution of <math|X<rprime|'>>. Finally we have

  <\align>
    <tformat|<table|<row|<cell|<wide|Y|^><around|(|t<rsub|0>;t|)>>|<cell|=<text|Im><around*|(|2*<big|int><rsub|0><rsup|\<infty\>>A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)>|)><eq-number><label|eq:YhatA>>>|<row|<cell|<wide|Y|^><rprime|'><around|(|t<rsub|0>;t|)>>|<cell|=<text|Im><around*|(|2*<big|int><rsub|0><rsup|\<infty\>>A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<zeta\><around|(|\<lambda\>|)>|)><eq-number><label|eq:YhatAprime>>>>>
  </align>

  from which it follows that <math|<wide|Y|^><around|(|t<rsub|0>;t|)>=<wide|Y|^><rprime|'><around|(|t<rsub|0>;t|)>>.
  Thus uniqueness of the quadrature process is established for all
  representations of <math|Y<around|(|t<rsub|0>;t|)>> satisfying the stated
  assumptions, and it can be taken as the natural quadrature process.

  As an example of a transient process, consider the process
  <math|Y<around|(|t|)>> which is the solution of the second-order linear
  differential equation with constant coefficients

  <\equation>
    <frac|d<rsup|2>*Y|d*t<rsup|2>>+2*\<zeta\>*\<omega\><rsub|0>*<frac|d*Y|d*t>+\<omega\><rsub|0><rsup|2>*Y=X<around|(|t|)><label|eq:ODE>
  </equation>

  where <math|X<around|(|t|)>> is a stationary process with zero mean and
  finite variance. Initial conditions are

  <\equation>
    Y<around|(|t<rsub|0>|)>=0<label|eq:ODEinit>
  </equation>

  and

  <\equation>
    <frac|d*Y<around|(|t<rsub|0>|)>|d*t>=0
  </equation>

  The solution can be written as

  <\equation>
    Y<around|(|t<rsub|0>;t|)>=<big|int><rsub|t<rsub|0>><rsup|t>X<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>|)>*<space|0.17em>d*\<tau\>\<forall\><around|(|t\<geq\>t<rsub|0>|)><label|eq:ODEsol>
  </equation>

  where

  <\equation>
    h<around|(|t|)>=<frac|1|\<omega\><rsub|1>>*e<rsup|-\<zeta\>*\<omega\><rsub|0>*t>*sin
    <around|(|\<omega\><rsub|1>*t|)><label|eq:ODEh>
  </equation>

  and <math|\<omega\><rsub|1>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>.

  It is easy to verify that all the conditions specified above are fulfilled
  and thus in this case, a `natural' representation to use for obtaining the
  quadrature process is<nbsp><eqref|eq:Yt0t>.

  <\thebibliography|9>
    <bibitem|arens>Arens, R. (1957). <newblock>Complex processes for
    envelopes of normal noise. <newblock><with|font-shape|italic|IRE
    Transactions on Information Theory>, 3:204\U207.

    <bibitem|cramerleadbetter>Cramér, H. and Leadbetter, M. R. (1967).
    <newblock><with|font-shape|italic|Stationary and Related Stochastic
    Processes>. <newblock>Wiley, New York.

    <bibitem|hasoferpetocz>Hasofer, A. M. and Petocz, P. (1978).
    <newblock>The envelope of an oscillatory process and its upcrossings
    (abstract). <newblock><with|font-shape|italic|Advances in Applied
    Probability>, 10:711\U716.

    <bibitem|priestley>Priestley, M. B. (1965). <newblock>Evolutionary
    spectra and non-stationary processes.
    <newblock><with|font-shape|italic|Journal of the Royal Statistical
    Society, Series B>, 27:204\U229.

    <bibitem|yang>Yang, J. N. (1972). <newblock>Non-stationary envelope
    process and first-excursion probability.
    <newblock><with|font-shape|italic|Journal of Structural Mechanics>,
    1:231\U248.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|7>>
    <associate|auto-5|<tuple|64|10>>
    <associate|auto-6|<tuple|64|?>>
    <associate|bib-arens|<tuple|arens|10>>
    <associate|bib-cramerleadbetter|<tuple|cramerleadbetter|10>>
    <associate|bib-hasoferpetocz|<tuple|hasoferpetocz|10>>
    <associate|bib-priestley|<tuple|priestley|10>>
    <associate|bib-yang|<tuple|yang|10>>
    <associate|eq:AAdiff|<tuple|57|9>>
    <associate|eq:Adef|<tuple|13|3>>
    <associate|eq:ODE|<tuple|60|9>>
    <associate|eq:ODEh|<tuple|64|10>>
    <associate|eq:ODEinit|<tuple|61|9>>
    <associate|eq:ODEsol|<tuple|63|9>>
    <associate|eq:Tmatrix|<tuple|31|6>>
    <associate|eq:Ttranspose|<tuple|36|6>>
    <associate|eq:Ulambda|<tuple|3|2>>
    <associate|eq:Vlambda|<tuple|4|2>>
    <associate|eq:XKprime|<tuple|48|8>>
    <associate|eq:Xcomplex|<tuple|10|3>>
    <associate|eq:Xcounter|<tuple|17|4>>
    <associate|eq:XfromY|<tuple|45|7>>
    <associate|eq:XhatKprime|<tuple|50|8>>
    <associate|eq:Xhatcomplex|<tuple|11|3>>
    <associate|eq:Xhatcounter|<tuple|22|5>>
    <associate|eq:Xhatmatrix|<tuple|23|5>>
    <associate|eq:Xhatprimeexplicit|<tuple|38|6>>
    <associate|eq:Xmatrix|<tuple|20|5>>
    <associate|eq:Xprime|<tuple|30|5>>
    <associate|eq:XprimeSpectral|<tuple|54|8>>
    <associate|eq:Xprimeexplicit|<tuple|37|6>>
    <associate|eq:YKFxi|<tuple|24|5>>
    <associate|eq:YKHFXI|<tuple|25|5>>
    <associate|eq:Yalt|<tuple|15|3>>
    <associate|eq:Yaltform1|<tuple|28|5>>
    <associate|eq:Yaltform2|<tuple|29|5>>
    <associate|eq:Ycomplex|<tuple|12|3>>
    <associate|eq:Ycounter|<tuple|18|4>>
    <associate|eq:Ydef|<tuple|6|2>>
    <associate|eq:YhatA|<tuple|58|9>>
    <associate|eq:YhatAprime|<tuple|59|9>>
    <associate|eq:YhatKprime|<tuple|52|8>>
    <associate|eq:Yhatcomplex|<tuple|14|3>>
    <associate|eq:Yhatcounter|<tuple|39|6>>
    <associate|eq:YhatprimeK|<tuple|53|8>>
    <associate|eq:Yhatprimecounter|<tuple|40|7>>
    <associate|eq:Yquad|<tuple|8|3>>
    <associate|eq:Yquadequiv|<tuple|9|3>>
    <associate|eq:Yquadprime|<tuple|16|4>>
    <associate|eq:Yspectral|<tuple|7|3>>
    <associate|eq:Ystationary|<tuple|44|7>>
    <associate|eq:Yt0A|<tuple|55|9>>
    <associate|eq:Yt0Aprime|<tuple|56|9>>
    <associate|eq:Yt0KprimeX|<tuple|51|8>>
    <associate|eq:Yt0t|<tuple|43|7>>
    <associate|eq:Yt0tprime|<tuple|46|8>>
    <associate|eq:Ytprime|<tuple|47|8>>
    <associate|eq:cov1|<tuple|41|7>>
    <associate|eq:cov2|<tuple|42|7>>
    <associate|eq:envelope|<tuple|1|1>>
    <associate|eq:hilbert|<tuple|5|2>>
    <associate|eq:kkernel|<tuple|49|8>>
    <associate|eq:spectral|<tuple|2|2>>
    <associate|eq:xi1prime|<tuple|32|6>>
    <associate|eq:xi2|<tuple|21|5>>
    <associate|eq:xi2prime|<tuple|33|6>>
    <associate|eq:xi3prime|<tuple|34|6>>
    <associate|eq:xi4prime|<tuple|35|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hasoferpetocz

      priestley

      arens

      yang

      hasoferpetocz

      cramerleadbetter

      hasoferpetocz

      priestley

      cramerleadbetter
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Background
      and notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      counterexample> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      class of transient processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>