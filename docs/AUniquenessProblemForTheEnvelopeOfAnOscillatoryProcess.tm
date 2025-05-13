<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A UNIQUENESS PROBLEM FOR THE ENVELOPE OF AN
  OSCILLATORY PROCESS>|<doc-author|<author-data|<author-name|A. M.
  HASOFER>|<author-affiliation|Postal address: School of Mathematics,
  Department of Statistics, The University of New South Wales, P.O.Box 1,
  Kensington, N.S.W. 2033, Australia.>>>|<doc-date|>>

  <abstract-data|<\abstract>
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

    NON-STATIONARY STOCHASTIC PROCESSES; TIME-VARYING FILTERS; ENVELOPE
    PROCESSES
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Background and
    notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|The
    counterexample> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|The class of
    transient processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section*|Introduction>

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

  <section*|Background and notation>

  Let <math|X<around|(|t|)>> be a real-valued stationary stochastic process
  with zero mean and finite variance. Let its spectral representation be

  <\equation>
    X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    \<lambda\>*t*<space|0.17em>d*U<around|(|\<lambda\>|)>+sin
    \<lambda\>*t*<space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:spectral>
  </equation>

  (See Hasofer and Petocz<nbsp><cite|hasoferpetocz>.)

  It is well known that <math|X<around|(|t|)>> uniquely determines the two
  uncorrelated processes with orthogonal increments
  <math|U<around|(|\<lambda\>|)>> and <math|V<around|(|\<lambda\>|)>>, e.g.
  through the formulae<nbsp><cite-detail|cramerleadbetter|p. 136>

  <\align>
    <tformat|<table|<row|<cell|U<around|(|\<lambda\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
    \<lambda\>*t|t>*X<around|(|t|)>*<space|0.17em>d*t<eq-number><label|eq:Ulambda>>>|<row|<cell|V<around|(|\<lambda\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    <frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-cos
    \<lambda\>*t|t>*X<around|(|t|)>*<space|0.17em>d*t<eq-number><label|eq:Vlambda>>>>>
  </align>

  The Hilbert transform of <math|X<around|(|t|)>>,
  <math|<wide|X|^><around|(|t|)>>, is defined by the formula

  <\equation>
    <wide|X|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    \<lambda\>*t*<space|0.17em>d*U<around|(|\<lambda\>|)>-cos
    \<lambda\>*t*<space|0.17em>d*V<around|(|\<lambda\>|)><label|eq:hilbert>
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
    \<lambda\>*t*<space|0.17em>d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>+sin
    \<lambda\>*t*<space|0.17em>d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)><label|eq:Yspectral>
  </equation>

  (see<nbsp><cite|hasoferpetocz>).

  We then define the quadrature process <math|<wide|Y|^><around|(|t|)>> by
  the equation

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>sin
    \<lambda\>*t*<space|0.17em>d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>-cos
    \<lambda\>*t*<space|0.17em>d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)>.<label|eq:Yquad>
  </equation>

  It is easy to see that this definition is equivalent to

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<wide|X|^><around|(|u|)>*<space|0.17em>d*u.<label|eq:Yquadequiv>
  </equation>

  Finally, it is useful to have a definition of
  <math|<wide|X|^><around|(|t|)>,<wide|Y|^><around|(|t|)>> in terms of the
  complex-valued representation of <math|X<around|(|t|)>>.

  Let

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:Xcomplex>
  </equation>

  Assuming that <math|\<zeta\><around|(|\<lambda\>|)>> has a.s. no jump at
  the origin (corresponding to no jump for the spectrum
  <math|F<around|(|\<lambda\>|)>> of <math|X<around|(|t|)>>), we have

  <\equation>
    <wide|X|^><around|(|t|)>=<math-up|Im>2*<big|int><rsub|0><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:Xhatcomplex>
  </equation>

  Further we can write

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:Ycomplex>
  </equation>

  where

  <\equation>
    A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*e<rsup|i*u*\<lambda\>>*d*u.<label|eq:Adef>
  </equation>

  We then easily see that

  <\equation>
    <wide|Y|^><around|(|t|)>=<math-up|Im>2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>.<label|eq:Yhatcomplex>
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

  <section*|The counterexample>

  Let <math|<around|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>|)>>
  be four independent standard normal random variables. We consider the
  stochastic process <math|X<around|(|t|)>> defined by

  <\equation>
    X<around|(|t|)>=\<xi\><rsub|1>*cos t+\<xi\><rsub|2>*cos
    2*t+\<xi\><rsub|3>*sin t+\<xi\><rsub|4>*sin 2*t.<label|eq:Xcounter>
  </equation>

  This process can be easily checked to have zero mean and finite variance
  and to be stationary.

  The Hilbert space spanned by <math|X<around|(|t|)>> (see Cramér and
  Leadbetter<nbsp><cite-detail|cramerleadbetter|p. 105>) is in this case just
  an ordinary four-dimensional Euclidian space, and all linear operators in
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
  <math|\<b-xi\>=<around|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>|)><rprime|'>>
  be the column vector of the four random variables
  <math|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>>.

  Let <math|F> denote the mapping <math|\<b-xi\>\<rightarrow\>X<around|(|t|)>>.
  As pointed out above, this mapping is invertible. In the present case, this
  is almost obvious. For instance

  <\equation>
    \<xi\><rsub|2>=<frac|1|\<pi\>>*<big|int><rsub|-\<pi\>><rsup|+\<pi\>>X<around|(|t|)>*cos
    2*t*<space|0.17em>d*t<label|eq:xi2>
  </equation>

  Let <math|H> denote the mapping <math|X<around|(|t|)>\<rightarrow\><wide|X|^><around|(|t|)>>.
  In our case, we have

  <\equation>
    <wide|X|^><around|(|t|)>=\<xi\><rsub|1>*sin t+\<xi\><rsub|2>*sin
    2*t-\<xi\><rsub|3>*cos t-\<xi\><rsub|4>*cos 2*t<label|eq:Xhatcounter>
  </equation>

  Finally let <math|K> denote the operator representing the
  non-time-invariant filter. Thus we can write

  <\align>
    <tformat|<table|<row|<cell|Y>|<cell|=K*F*\<xi\><eq-number><label|eq:YKFxi>>>|<row|<cell|<wide|Y|^>>|<cell|=K*H*F*\<xi\><eq-number><label|eq:YKHFXI>>>>>
  </align>

  Now let <math|T> denote a four-by-four orthogonal matrix. Then the vector
  <math|\<xi\><rprime|'>=T*\<xi\>> will still consist of four independent
  standard normal variables. We now note that we can write <math|Y> in the
  form

  <\equation>
    Y=K*F*T<rsup|-1>*F<rsup|-1>*F*T*\<xi\><label|eq:Yaltform1>
  </equation>

  or

  <\equation>
    Y=K<rprime|'>*F*\<xi\><rprime|'><label|eq:Yaltform2>
  </equation>

  where

  <\equation>
    K<rprime|'>=K*F*T<rsup|-1>*F<rsup|-1><label|eq:Kprime>
  </equation>

  and

  <\equation>
    \<xi\><rprime|'>=T*\<xi\>.<label|eq:xiprime>
  </equation>

  This constitutes an alternative representation to<nbsp><eqref|eq:YKFxi>.
  Corresponding to it, we have

  <\equation>
    <wide|Y|^><rprime|'>=K<rprime|'>*H*F*\<xi\><rprime|'>.<label|eq:Yhatprime>
  </equation>

  We shall take as <math|T> the well-known orthogonal matrix

  <\equation>
    T=<frac|1|2><around*|[|<tabular*|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|1>|<cell|1>>|<row|<cell|-1>|<cell|-1>|<cell|1>|<cell|1>>|<row|<cell|1>|<cell|-1>|<cell|-1>|<cell|1>>|<row|<cell|-1>|<cell|1>|<cell|-1>|<cell|1>>>>>|]><label|eq:Tmatrix>
  </equation>

  and carry out the operations described above. We obtain

  <\equation>
    <wide|Y|^><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*<around*|[|-\<xi\><rsub|3>*cos
    u-\<xi\><rsub|4>*cos 2*u+\<xi\><rsub|1>*sin u+\<xi\><rsub|2>*sin
    2*u|]>*d*u<label|eq:Yhatcounter>
  </equation>

  while

  <\equation>
    <wide|Y|^><rprime|'><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|t,u|)>*<around*|[|\<xi\><rsub|2>*cos
    u-\<xi\><rsub|1>*cos 2*u-\<xi\><rsub|4>*sin u+\<xi\><rsub|3>*sin
    2*u|]>*d*u<label|eq:Yhatprimecounter>
  </equation>

  From these representations it is easy to calculate the cross-covariances,
  which turn out to be

  <\align>
    <tformat|<cwith|1|-1|1|-1|font-base-size|9>|<table|<row|<cell|E*<around|[|Y<around|(|u|)>*<wide|Y|^><around|(|v|)>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>><big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around*|[|sin
    <around|(|t<rsub|2>-t<rsub|1>|)>+sin 2*<around|(|t<rsub|2>-t<rsub|1>|)>|]>*d*t<rsub|1>*d*t<rsub|2><eq-number><label|eq:cov1>>>|<row|<cell|E*<around|[|Y<around|(|u|)>*<wide|Y|^><rprime|'><around|(|v|)>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>><big|int><rsub|-\<infty\>><rsup|+\<infty\>>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around*|[|cos
    <around|(|2*t<rsub|1>+t<rsub|2>|)>-cos
    <around|(|t<rsub|1>+2*t<rsub|2>|)>|]>*d*t<rsub|1>*d*t<rsub|2><eq-number><label|eq:cov2>>>>>
  </align>

  two utterly dissimilar covariances.

  <section*|The class of transient processes>

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

  We further assume that as <math|t<rsub|0>> tend to <math|-\<infty\>>,
  <math|h<around|(|t<rsub|0>;t,u|)>> tends to a limit
  <math|h*<around|(|t-u|)>>, and <math|Y<around|(|t<rsub|0>;t|)>> tends to a
  stationary process

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>h*<around|(|t-u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:Ystationary>
  </equation>

  We shall further assume that the kernel <math|h*<around|(|t-u|)>> is
  invertible. Writing for short

  <\align>
    <tformat|<table|<row|<cell|Y<rsub|t<rsub|0>>>|<cell|=K<rsub|t<rsub|0>>*X<eq-number><label|eq:Yt0K>>>|<row|<cell|Y>|<cell|=K*X<eq-number><label|eq:YK>>>>>
  </align>

  we have

  <\equation>
    X=K<rsup|-1>*Y<label|eq:XfromY>
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

  We write these relations as

  <\align>
    <tformat|<table|<row|<cell|Y<rsub|t<rsub|0>>>|<cell|=K<rsub|t<rsub|0>><rprime|'>*X<rprime|'><eq-number><label|eq:Yt0Kprime>>>|<row|<cell|Y>|<cell|=K<rprime|'>*X<rprime|'><eq-number><label|eq:YKprime>>>>>
  </align>

  We have, on account of<nbsp><eqref|eq:XfromY>,

  <\equation>
    X=K<rsup|-1>*K<rprime|'>*X<rprime|'><label|eq:XKprime>
  </equation>

  We now note that <math|K<rsup|-1>*K<rprime|'>> is a time-invariant linear
  filter. It is easily verified that on account of this fact we have

  <\equation>
    <wide|X|^>=K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'><label|eq:XhatKprime>
  </equation>

  for the Hilbert transformation commutes with time-invariant filters.

  It follows from<nbsp><eqref|eq:XKprime> and<nbsp><eqref|eq:XhatKprime> that

  <\equation>
    Y<rsub|t<rsub|0>>=K<rsub|t<rsub|0>>*K<rsup|-1>*K<rprime|'>*X<rprime|'>=K<rsub|t<rsub|0>><rprime|'>*X<rprime|'><label|eq:Yt0KprimeX>
  </equation>

  and that

  <\align>
    <tformat|<table|<row|<cell|<wide|Y|^><rsub|t<rsub|0>>>|<cell|=K<rsub|t<rsub|0>>*<wide|X|^><eq-number>>>|<row|<cell|>|<cell|=K<rsub|t<rsub|0>>*K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'><eq-number><label|eq:YhatKprime>>>>>
  </align>

  while

  <\equation>
    <wide|Y|^><rsub|t<rsub|0>><rprime|'>=K<rsub|t<rsub|0>><rprime|'>*<wide|X|^><rprime|'><label|eq:YhatprimeK>
  </equation>

  We use now the spectral representation of <math|X<rprime|'>>:

  <\equation>
    X<rprime|'><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:XprimeSpectral>
  </equation>

  and obtain

  <\align>
    <tformat|<table|<row|<cell|Y<around|(|t<rsub|0>;t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:Yt0A>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:Yt0Aprime>>>>>
  </align>

  where <math|A<rprime|'>> corresponds to the operator
  <math|K<rsub|t<rsub|0>>*K<rsup|-1>*K<rprime|'>> and <math|A<rprime|''>>
  corresponds to <math|K<rsub|t<rsub|0>><rprime|'>>.

  It easily follows that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||A<rprime|'>-A<rprime|''>|\|><rsup|2>*d*F<rprime|'><around|(|\<lambda\>|)>=0*<space|1em><text|for
    each >t<label|eq:AAdiff>
  </equation>

  where <math|F<rprime|'><around|(|\<lambda\>|)>> is the spectral
  distribution of <math|X<rprime|'>>.

  Finally we have

  <\align>
    <tformat|<table|<row|<cell|<wide|Y|^><around|(|t<rsub|0>;t|)>>|<cell|=<math-up|Im>2*<big|int><rsub|0><rsup|\<infty\>>A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:YhatA>>>|<row|<cell|<wide|Y|^><rprime|'><around|(|t<rsub|0>;t|)>>|<cell|=<math-up|Im>2*<big|int><rsub|0><rsup|\<infty\>>A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:YhatAprime>>>>>
  </align>

  from which it follows that <math|<wide|Y|^><around|(|t<rsub|0>;t|)>=<wide|Y|^><rprime|'><around|(|t<rsub|0>,t|)>>.
  Thus uniqueness of the quadrature process is established for all
  representations of <math|Y<around|(|t<rsub|0>,t|)>> satisfying the stated
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
    Y<around|(|t<rsub|0>|)>=0,<space|1em><frac|d*Y<around|(|t<rsub|0>|)>|d*t>=0<label|eq:ODEinit>
  </equation>

  The solution can be written as

  <\equation>
    Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|t<rsub|0>><rsup|t>X<around|(|\<tau\>|)>*h*<around|(|t-\<tau\>|)>*d*\<tau\>,<space|1em><around|(|t\<geq\>t<rsub|0>|)><label|eq:ODEsol>
  </equation>

  where

  <\equation>
    h<around|(|t|)>=<frac|1|\<omega\><rsub|1>>*e<rsup|-\<zeta\>*\<omega\><rsub|0>*t>*sin
    \<omega\><rsub|1>*t<label|eq:ODEh>
  </equation>

  and <math|\<omega\><rsub|1>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>.

  It is easy to verify that all the conditions specified above are fulfilled
  and thus in this case, a `natural' representation to use for obtaining the
  quadrature process is<nbsp><eqref|eq:Yt0t>.

  <section*|References>

  <\enumerate>
    <item><label|arens> Arens, R. (1957) Complex processes for envelopes of
    normal noise. IRE Trans. Inf. Theory 3, 204-207.

    <item><label|cramerleadbetter> Cramér, H. and Leadbetter, M. R. (1967)
    Stationary and Related Stochastic Processes. Wiley, New York.

    <item><label|hasoferpetocz> Hasofer, A. M. and Petocz, P. (1978) The
    envelope of an oscillatory process and its upcrossings (abstract). Adv.
    Appl. Prob. 10, 711-716.

    <item><label|priestley> Priestley, M. B. (1965) Evolutionary spectra and
    non-stationary processes. J. R. Statist. Soc. B 27, 204-229.

    <item><label|yang> Yang, J. N. (1972) Non-stationary envelope process and
    first-excursion probability. J. Structural Mech. 1, 231-248.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|arens|<tuple|1|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|16|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|32|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|57|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cramerleadbetter|<tuple|2|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:AAdiff|<tuple|51|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Adef|<tuple|13|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Kprime|<tuple|25|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:ODE|<tuple|54|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:ODEh|<tuple|57|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:ODEinit|<tuple|55|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:ODEsol|<tuple|56|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Tmatrix|<tuple|28|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ulambda|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Vlambda|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:XKprime|<tuple|42|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Xcomplex|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Xcounter|<tuple|17|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:XfromY|<tuple|37|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:XhatKprime|<tuple|43|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Xhatcomplex|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Xhatcounter|<tuple|20|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:XprimeSpectral|<tuple|48|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YK|<tuple|36|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YKFxi|<tuple|21|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YKHFXI|<tuple|22|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YKprime|<tuple|41|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yalt|<tuple|15|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yaltform1|<tuple|23|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yaltform2|<tuple|24|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ycomplex|<tuple|12|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ycounter|<tuple|18|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ydef|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YhatA|<tuple|52|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YhatAprime|<tuple|53|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YhatKprime|<tuple|46|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yhatcomplex|<tuple|14|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yhatcounter|<tuple|29|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yhatprime|<tuple|27|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:YhatprimeK|<tuple|47|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yhatprimecounter|<tuple|30|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yquad|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yquadequiv|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yquadprime|<tuple|16|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yspectral|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ystationary|<tuple|34|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0A|<tuple|49|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0Aprime|<tuple|50|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0K|<tuple|35|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0Kprime|<tuple|40|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0KprimeX|<tuple|44|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0t|<tuple|33|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Yt0tprime|<tuple|38|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Ytprime|<tuple|39|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:cov1|<tuple|31|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:cov2|<tuple|32|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:envelope|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:hilbert|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:spectral|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:xi2|<tuple|19|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:xiprime|<tuple|26|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|hasoferpetocz|<tuple|3|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|priestley|<tuple|4|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|yang|<tuple|5|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Background
      and notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|The
      counterexample> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|The
      class of transient processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>