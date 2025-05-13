<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A UNIQUENESS PROBLEM FOR THE ENVELOPE<next-line>OF AN
  OSCILLATORY PROCESS>|<doc-author|<author-data|<author-name|A. M.
  HASOFER>|<author-affiliation|School of Mathematics, Department of
  Statistics, The University of New South Wales, P.O.Box 1, Kensington,
  N.S.W. 2033, Australia.>>>|<doc-date|J. Appl. Prob. 16, 822-829
  (1979)<next-line>Received 20 September 1978; revision received 21 November
  1978.>>

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
    of natural representa- tions which all lead to a unique envelope process.
  </abstract>>

  <no-indent><with|font-series|bold|NON-STATIONARY STOCHASTIC PROCESSES;
  TIME-VARYING FILTERS; ENVELOPE PROCESSES>

  <\table-of-contents|toc>
    \;
  </table-of-contents>

  <section|Introduction>

  In a previous paper <cite|hasofer1978>, the author described a method for
  obtaining an envelope process for a class of non-stationary stochastic
  processes. This is the class of oscillatory processes introduced by
  Priestley <cite|priestley1965>. For an oscillatory process
  <math|Y<around|(|t|)>>, one defines a 'quadrature process'
  <math|<wide|Y|^><around|(|t|)>>. The envelope process,
  <math|R<around|(|t|)>>, is then defined by

  <\equation>
    <label|eq:envelope>R<around|(|t|)>=<sqrt|Y<rsup|2><around|(|t|)>+<wide|Y|^><rsup|2><around|(|t|)>>.
  </equation>

  It has come to the author's notice that similar definitions for the
  envelope were given by Arens in 1957 <cite|arens1957>, and Yang in 1972
  <cite|yang1972>.

  Further analysis has, however, uncovered the fact that the proposed
  definition of the quadrature process may not be unique, but may depend on
  the particular representation chosen for <math|Y<around|(|t|)>> in terms of
  an underlying stationary process. This lack of uniqueness is exhibited by a
  counterexample.

  It is then shown that for a class of oscillatory processes which is of
  particular interest, the class of transient processes, there is a class of
  natural representa- tions which all lead to a unique quadrature process.

  <section|Background and notation>

  Let <math|X<around|(|t|)>> be a real-valued stationary stochastic process
  with zero mean and finite variance. Let its spectral representation be

  <\equation>
    <label|eq:spectral>X<around|(|t|)>=<big|int>cos
    \<lambda\>*t*d*U<around|(|\<lambda\>|)>+sin
    \<lambda\>*t*d*V<around|(|\<lambda\>|)>.
  </equation>

  (See Hasofer and Petocz <cite|hasofer1978>.)

  It is well known that <math|X<around|(|t|)>> uniquely determines the two
  uncorrelated processes with orthogonal increments
  <math|U<around|(|\<lambda\>|)>> and <math|V<around|(|\<lambda\>|)>>, e.g.
  through the formulae (<cite|cramer1967>, p. 136)

  <\equation>
    <label|eq:u_lambda>U<around|(|\<lambda\>|)>=<text|l.i.m.><rsub|T\<to\>\<infty\>><frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|sin
    \<lambda\>*t|t>*X<around|(|t|)>*d*t,
  </equation>

  <\equation>
    <label|eq:v_lambda>V<around|(|\<lambda\>|)>=<text|l.i.m.><rsub|T\<to\>\<infty\>><frac|1|\<pi\>>*<big|int><rsub|-T><rsup|T><frac|1-cos
    \<lambda\>*t|t>*X<around|(|t|)>*d*t.
  </equation>

  The Hilbert transform of <math|X<around|(|t|)>>,
  <math|<wide|X|^><around|(|t|)>>, is defined by the formula

  <\equation>
    <label|eq:hilbert><wide|X|^><around|(|t|)>=<big|int>sin
    \<lambda\>*t*d*U<around|(|\<lambda\>|)>-cos
    \<lambda\>*t*d*V<around|(|\<lambda\>|)>.
  </equation>

  It is to be noted that <math|X<around|(|t|)>> defines
  <math|<wide|X|^><around|(|t|)>> uniquely. This is easily seen from the fact
  that the Hilbert transform of <math|<wide|X|^><around|(|t|)>> is
  <math|-X<around|(|t|)>>.

  Next we define the oscillatory process <math|Y<around|(|t|)>> by the
  formula

  <\equation>
    <label|eq:oscillatory>Y<around|(|t|)>=<big|int>h<around|(|t,u|)>*X<around|(|u|)>*d*u,
  </equation>

  where <math|h<around|(|t,u|)>> is the impulse response function of a
  linear, non-time-invariant filter. This may be written in the form

  <\equation>
    <label|eq:y_spectral>Y<around|(|t|)>=<big|int>cos
    \<lambda\>*t*d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>+sin
    \<lambda\>*t*d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)>
  </equation>

  (see <cite|hasofer1978>).

  We then define the quadrature process <math|<wide|Y|^><around|(|t|)>> by
  the equation

  <\equation>
    <label|eq:quadrature><wide|Y|^><around|(|t|)>=<big|int>sin
    \<lambda\>*t*d*U<rsup|\<ast\>><around|(|t,\<lambda\>|)>-cos
    \<lambda\>*t*d*V<rsup|\<ast\>><around|(|t,\<lambda\>|)>.
  </equation>

  It is easy to see that this definition is equivalent to

  <\equation>
    <label|eq:quadrature_alt><wide|Y|^><around|(|t|)>=<big|int>h<around|(|t,u|)>*<wide|X|^><around|(|u|)>*d*u.
  </equation>

  Finally, it is useful to have a definition of
  <math|<wide|X|^><around|(|t|)>>, <math|<wide|Y|^><around|(|t|)>> in terms
  of the complex-valued representation of <math|X<around|(|t|)>>.

  Let

  <\equation>
    <label|eq:complex_rep>X<around|(|t|)>=<big|int>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>.
  </equation>

  Assuming that <math|\<zeta\><around|(|\<lambda\>|)>> has a.s. no jump at
  the origin (corresponding to no jump for the spectrum
  <math|F<around|(|\<lambda\>|)>> of <math|X<around|(|t|)>>), we have

  <\equation>
    <label|eq:x_hat_complex><wide|X|^><around|(|t|)>=<text|Im
    >2*<big|int>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>.
  </equation>

  Further we can write

  <\equation>
    <label|eq:y_complex>Y<around|(|t|)>=<big|int>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>
  </equation>

  where

  <\equation>
    <label|eq:a_t_lambda>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>=<big|int>h<around|(|t,u|)>*e<rsup|i*\<lambda\>*u>*d*u.
  </equation>

  We then easily see that

  <\equation>
    <label|eq:y_hat_complex><wide|Y|^><around|(|t|)>=<text|Im
    >2*<big|int>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>.
  </equation>

  There is a difficulty about the definition <eqref|eq:quadrature_alt> in the
  following sense. Suppose that there exists another representation of
  <math|Y<around|(|t|)>> of the form

  <\equation>
    <label|eq:alt_rep>Y<around|(|t|)>=<big|int>h<rprime|'><around|(|t,u|)>*X<rprime|'><around|(|u|)>*d*u,
  </equation>

  where <math|X<rprime|'><around|(|t|)>> is a stationary stochastic process
  with zero mean and finite variance. The existence of an infinity of
  representations of <math|Y<around|(|t|)>> of the form <eqref|eq:alt_rep>
  has been pointed out by Priestley (<cite|priestley1965>, p. 205). The
  quadrature process of <math|Y<around|(|t|)>> derived from the
  representation <eqref|eq:alt_rep> is

  <\equation>
    <label|eq:alt_quadrature><wide|Y|^><rprime|'><around|(|t|)>=<big|int>h<rprime|'><around|(|t,u|)>*<wide|X|^><rprime|'><around|(|u|)>*d*u.
  </equation>

  The question then arises: is <math|<wide|Y|^><rprime|'><around|(|t|)>>
  equal to <math|<wide|Y|^><around|(|t|)>>, or in other words, is the
  definition of the quadrature process given in <eqref|eq:quadrature_alt>
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
    <label|eq:x_counter>X<around|(|t|)>=\<xi\><rsub|1>*cos
    t+\<xi\><rsub|2>*cos 2*t+\<xi\><rsub|3>*sin t+\<xi\><rsub|4>*sin 2*t.
  </equation>

  This process can be easily checked to have zero mean and finite variance
  and to be stationary.

  The Hilbert space spanned by <math|X<around|(|t|)>> (see Cramér and
  Leadbetter <cite|cramer1967>, p. 105) is in this case just an ordinary
  four-dimensional Euclidian space, and all linear operators in this space
  are four-by-four matrices. In the sequel of this section we shall use the
  Hilbert space operator notation interchangeably with matrix notation.

  Let <math|Y<around|(|t|)>> be defined by

  <\equation>
    <label|eq:y_counter>Y<around|(|t|)>=<big|int>h<around|(|t,u|)>*X<around|(|u|)>*d*u,
  </equation>

  where <math|h<around|(|t,u|)>> is the impulse response function of a
  linear, non-time-invariant filter.

  To simplify the exposition, we introduce the following notation. Let
  <math|\<xi\>=<around|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>|)><rprime|'>>
  be the column vector of the four random variables
  <math|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>,\<xi\><rsub|4>>. Let
  <math|F> denote the mapping <math|\<xi\>\<to\>X<around|(|t|)>>. As pointed
  out above, this mapping is invertible. In the present case, this is almost
  obvious. For instance

  <\equation>
    <label|eq:xi_example>\<xi\><rsub|2>=<frac|1|\<pi\>>*<big|int>X<around|(|t|)>*cos
    2*t*d*t.
  </equation>

  Let <math|H> denote the mapping <math|X<around|(|t|)>\<to\><wide|X|^><around|(|t|)>>.
  In our case, we have

  <\equation>
    <label|eq:x_hat_counter><wide|X|^><around|(|t|)>=\<xi\><rsub|1>*sin
    t+\<xi\><rsub|2>*sin 2*t-\<xi\><rsub|3>*cos t-\<xi\><rsub|4>*cos 2*t.
  </equation>

  Finally let <math|K> denote the operator representing the
  non-time-invariant filter. Thus we can write

  <\align>
    <tformat|<table|<row|<cell|Y>|<cell|=K*F*\<xi\>,<eq-number><label|eq:y_operator>>>|<row|<cell|<wide|Y|^>>|<cell|=K*H*F*\<xi\>.<eq-number><label|eq:y_hat_operator>>>>>
  </align>

  Now let <math|T> denote a four-by-four orthogonal matrix. Then the vector
  <math|\<xi\><rprime|'>=T*\<xi\>> will still consist of four independent
  standard normal variables. We now note that we can write <math|Y> in the
  form

  <\equation>
    <label|eq:y_alt_form>Y=K*F*T<rsup|-1>*T*\<xi\>,
  </equation>

  or

  <\equation>
    <label|eq:y_alt_form2>Y=K<rprime|'>*F*\<xi\><rprime|'>,
  </equation>

  where

  <\equation>
    <label|eq:k_prime>K<rprime|'>=K*F*T<rsup|-1>*F<rsup|-1>
  </equation>

  and

  <\equation>
    <label|eq:xi_prime>\<xi\><rprime|'>=T*\<xi\>.
  </equation>

  This constitutes an alternative representation to <eqref|eq:y_operator>.
  Corresponding to it, we have

  <\equation>
    <label|eq:y_hat_prime><wide|Y|^><rprime|'>=K<rprime|'>*H*F*\<xi\><rprime|'>.
  </equation>

  We shall take as <math|T> the well-known orthogonal matrix

  <\equation>
    <label|eq:t_matrix>T=<matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|1>|<cell|1>>|<row|<cell|1>|<cell|-1>|<cell|1>|<cell|-1>>|<row|<cell|1>|<cell|1>|<cell|-1>|<cell|-1>>|<row|<cell|1>|<cell|-1>|<cell|-1>|<cell|1>>>>>
  </equation>

  and carry out the operations described above. We obtain

  <\equation>
    <label|eq:y_hat_result><wide|Y|^><around|(|t|)>=<big|int>h<around|(|t,u|)>*<around|[|-\<xi\><rsub|3>*cos
    u-\<xi\><rsub|4>*cos 2*u+\<xi\><rsub|1>*sin u+\<xi\><rsub|2>*sin
    2*u|]>*d*u
  </equation>

  while

  <\equation>
    <label|eq:y_hat_prime_result><wide|Y|^><rprime|'><around|(|t|)>=<big|int>h<around|(|t,u|)>*<around|[|\<xi\><rsub|2>*cos
    u-\<xi\><rsub|4>*cos 2*u-\<xi\><rsub|4>*sin u+\<xi\><rsub|3>*sin
    2*u|]>*d*u.
  </equation>

  From these representations it is easy to calculate the cross-covariances,
  which turn out to be

  <\equation>
    <label|eq:cov1>E*<around|[|Y<around|(|u|)>*<wide|Y|^><around|(|v|)>|]>=<big|int><big|int>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around|[|sin
    <around|(|t<rsub|2>-t<rsub|1>|)>+sin 2*<around|(|t<rsub|2>-t<rsub|1>|)>|]>*d*t<rsub|1>*d*t<rsub|2>
  </equation>

  <\equation>
    <label|eq:cov2>E*<around|[|Y<around|(|u|)>*<wide|Y|^><rprime|'><around|(|v|)>|]>=<big|int><big|int>h<around|(|u,t<rsub|1>|)>*h<around|(|v,t<rsub|2>|)>*<around|[|cos
    <around|(|2*t<rsub|1>+t<rsub|2>|)>-cos
    <around|(|t<rsub|1>+2*t<rsub|2>|)>|]>*d*t<rsub|1>*d*t<rsub|2>;
  </equation>

  two utterly dissimilar covariances.

  <section|The class of transient processes>

  We shall now consider a special class of oscillatory processes, which is of
  great practical interest, and for which there exists a class of 'natural'
  representations.

  We refer to the case of 'transient' processes. By this we mean processes
  which are asymptotically stationary. For example, if the process
  <math|Y<around|(|t|)>> is the solution of a linear differential equation
  with given initial conditions, and a forcing function which is a stationary
  process <math|X<around|(|t|)>>, <math|Y<around|(|t|)>> would often be
  asymptotically stationary, and we would call it a 'transient' process.

  We shall make our definition precise in the following way. We assume that
  we have a family of oscillatory processes

  <\equation>
    <label|eq:y_t0>Y<around|(|t<rsub|0>;t|)>=<big|int>h<around|(|t<rsub|0>;t,u|)>*X<around|(|u|)>*d*u.
  </equation>

  (We think of <math|t<rsub|0>> as being the point at which the process
  <math|Y> is initiated.)

  We further assume that as <math|t<rsub|0>> tend to <math|-\<infty\>>,
  <math|h<around|(|t<rsub|0>;t,u|)>> tends to a limit
  <math|h*<around|(|t-u|)>>, and <math|Y<around|(|t<rsub|0>;t|)>> tends to a
  stationary process

  <\equation>
    <label|eq:y_stationary>Y<around|(|t|)>=<big|int>h*<around|(|t-u|)>*X<around|(|u|)>*d*u.
  </equation>

  We shall further assume that the kernel <math|h*<around|(|t-u|)>> is
  invertible. Writing for short

  <\align>
    <tformat|<table|<row|<cell|Y>|<cell|=K*X,<eq-number><label|eq:y_short>>>|<row|<cell|<wide|Y|^>>|<cell|=K*<wide|X|^>,<eq-number><label|eq:y_hat_short>>>>>
  </align>

  we have

  <\equation>
    <label|eq:x_from_y>X=K<rsup|-1>*Y.
  </equation>

  Suppose now that there exists a second representation of
  <math|Y<around|(|t<rsub|0>;t|)>> of the form

  <\equation>
    <label|eq:y_t0_alt>Y<around|(|t<rsub|0>;t|)>=<big|int>h<rprime|'><around|(|t<rsub|0>;t,u|)>*X<rprime|'><around|(|u|)>*d*u,
  </equation>

  which, as <math|t<rsub|0>\<to\>-\<infty\>>, tends to

  <\equation>
    <label|eq:y_stationary_alt>Y<around|(|t|)>=<big|int>h<rprime|'>*<around|(|t-u|)>*X<rprime|'><around|(|u|)>*d*u.
  </equation>

  We write these relations as

  <\align>
    <tformat|<table|<row|<cell|Y>|<cell|=K<rprime|'>*X<rprime|'>,<eq-number><label|eq:y_short_alt>>>|<row|<cell|<wide|Y|^>>|<cell|=K<rprime|'>*<wide|X|^><rprime|'>,<eq-number><label|eq:y_hat_short_alt>>>>>
  </align>

  We have, on account of <eqref|eq:x_from_y>,

  <\equation>
    <label|eq:x_rel>X=K<rsup|-1>*K<rprime|'>*X<rprime|'>.
  </equation>

  We now note that <math|K<rsup|-1>*K<rprime|'>> is a time-invariant linear
  filter. It is easily verified that on account of this fact we have

  <\equation>
    <label|eq:x_hat_rel><wide|X|^>=K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'>,
  </equation>

  for the Hilbert transformation commutes with time-invariant filters.

  It follows from <eqref|eq:x_rel> and <eqref|eq:x_hat_rel> that

  <\equation>
    <label|eq:y_t0_rel>Y<around|(|t<rsub|0>|)>=K*K<rsup|-1>*K<rprime|'>*X<rprime|'>=K<rprime|'>*X<rprime|'>,
  </equation>

  and that

  <\equation>
    <label|eq:y_hat_t0_rel><wide|Y|^><around|(|t<rsub|0>|)>=K*<wide|X|^>=K*K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'>,
  </equation>

  while

  <\equation>
    <label|eq:y_hat_prime_t0><wide|Y|^><rprime|'><around|(|t<rsub|0>|)>=K<rprime|'>*<wide|X|^><rprime|'>.
  </equation>

  We use now the spectral representation of <math|X<rprime|'>>:

  <\equation>
    <label|eq:x_prime_spectral>X<rprime|'><around|(|t|)>=<big|int>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>,
  </equation>

  and obtain

  <\align>
    <tformat|<table|<row|<cell|Y<around|(|t<rsub|0>;t|)>>|<cell|=<big|int>A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>,<eq-number><label|eq:y_t0_spectral1>>>|<row|<cell|>|<cell|=<big|int>A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>,<eq-number><label|eq:y_t0_spectral2>>>>>
  </align>

  where <math|A<rprime|'>> corresponds to the operator
  <math|K*K<rsup|-1>*K<rprime|'>> and <math|A<rprime|''>> corresponds to
  <math|K<rprime|'>>.

  It easily follows that

  <\equation>
    <label|eq:a_diff><big|int><around|\||A<rprime|'>-A<rprime|''>|\|><rsup|2>*d*F<rprime|'><around|(|\<lambda\>|)>=0*<text|for
    each >t,
  </equation>

  where <math|F<rprime|'><around|(|\<lambda\>|)>> is the spectral
  distribution of <math|X<rprime|'>>. This means that
  <math|A<rprime|'><around|(|t<rsub|0>;t,\<lambda\>|)>=A<rprime|''><around|(|t<rsub|0>;t,\<lambda\>|)>>
  for <math|F<rprime|'>>-almost every <math|\<lambda\>>, and thus the two
  representations are essentially the same in the limit as
  <math|t<rsub|0>\<to\>-\<infty\>>.

  Therefore, the quadrature process <math|<wide|Y|^><around|(|t|)>> is
  uniquely determined in the class of representations corresponding to
  asymptotically stationary (transient) processes with invertible,
  time-invariant limiting kernels.

  <\theorem>
    <label|thm:uniqueness>Let <math|Y<around|(|t|)>> be a transient process,
    i.e., <math|Y<around|(|t|)>=<big|int>h*<around|(|t-u|)>*X<around|(|u|)>*d*u>
    with <math|h> invertible and <math|X> stationary. Then, for any
    alternative representation <math|Y<around|(|t|)>=<big|int>h<rprime|'>*<around|(|t-u|)>*X<rprime|'><around|(|u|)>*d*u>
    with <math|X<rprime|'>> stationary and <math|h<rprime|'>> invertible, the
    quadrature process <math|<wide|Y|^><around|(|t|)>> defined via

    <\equation*>
      <wide|Y|^><around|(|t|)>=<big|int>h*<around|(|t-u|)>*<wide|X|^><around|(|u|)>*d*u
    </equation*>

    is unique (up to <math|F<rprime|'>>-null sets), i.e., does not depend on
    the choice of representation.
  </theorem>

  <\proof>
    Given two such representations, we have
    <math|X=K<rsup|-1>*K<rprime|'>*X<rprime|'>>, where <math|K> and
    <math|K<rprime|'>> are the convolution operators associated with <math|h>
    and <math|h<rprime|'>>, respectively. Since <math|K<rsup|-1>*K<rprime|'>>
    is time-invariant, the Hilbert transform commutes with it:

    <\equation*>
      <wide|X|^>=K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'>.
    </equation*>

    Therefore,

    <\equation*>
      <wide|Y|^><around|(|t|)>=K*<wide|X|^>=K*K<rsup|-1>*K<rprime|'>*<wide|X|^><rprime|'>=K<rprime|'>*<wide|X|^><rprime|'>=<wide|Y|^><rprime|'><around|(|t|)>.
    </equation*>

    Thus, the quadrature process is independent of the representation.
  </proof>

  <section|Conclusion>

  We have shown that the definition of the quadrature process, and hence the
  envelope process, for a general oscillatory process may depend on the
  particular representation chosen for the process as the output of a linear,
  non-time-invariant filter with stationary input. However, for the important
  subclass of transient processes, there exists a class of natural
  representations (those with invertible, time-invariant limiting kernels)
  which all lead to the same quadrature process. Thus, in this case, the
  envelope process is uniquely defined.

  <section*|Acknowledgements>

  The author thanks Professor M. B. Priestley for helpful discussions.

  <\thebibliography|9>
    <bibitem|hasofer1978>A. M. Hasofer and A. Petocz (1978) \PEnvelope
    processes for oscillatory stochastic processes,\Q
    <with|font-shape|italic|J. Appl. Prob.> <with|font-series|bold|15>,
    1\U15.

    <bibitem|priestley1965>M. B. Priestley (1965) \PEvolutionary spectra and
    non-stationary processes,\Q <with|font-shape|italic|J. Roy. Statist. Soc.
    Ser. B> <with|font-series|bold|27>, 204\U237.

    <bibitem|arens1957>T. Arens (1957) \PÜber die Hüllkurve zufälliger
    Schwingungen,\Q <with|font-shape|italic|Z. Angew. Math. Mech.>
    <with|font-series|bold|37>, 385\U398.

    <bibitem|yang1972>C. T. Yang (1972) \POn the envelope of a nonstationary
    random process,\Q <with|font-shape|italic|IEEE Trans. Inform. Theory>
    <with|font-series|bold|18>, 603\U606.

    <bibitem|cramer1967>H. Cramér and M. R. Leadbetter (1967)
    <with|font-shape|italic|Stationary and Related Stochastic Processes>,
    Wiley, New York.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|9>>
    <associate|auto-6|<tuple|5|9>>
    <associate|auto-7|<tuple|5|9>>
    <associate|bib-arens1957|<tuple|arens1957|9>>
    <associate|bib-cramer1967|<tuple|cramer1967|9>>
    <associate|bib-hasofer1978|<tuple|hasofer1978|9>>
    <associate|bib-priestley1965|<tuple|priestley1965|9>>
    <associate|bib-yang1972|<tuple|yang1972|9>>
    <associate|eq:a_diff|<tuple|50|8>>
    <associate|eq:a_t_lambda|<tuple|13|3>>
    <associate|eq:alt_quadrature|<tuple|16|4>>
    <associate|eq:alt_rep|<tuple|15|3>>
    <associate|eq:complex_rep|<tuple|10|3>>
    <associate|eq:cov1|<tuple|31|6>>
    <associate|eq:cov2|<tuple|32|6>>
    <associate|eq:envelope|<tuple|1|1>>
    <associate|eq:hilbert|<tuple|5|2>>
    <associate|eq:k_prime|<tuple|25|5>>
    <associate|eq:oscillatory|<tuple|6|2>>
    <associate|eq:quadrature|<tuple|8|3>>
    <associate|eq:quadrature_alt|<tuple|9|3>>
    <associate|eq:spectral|<tuple|2|2>>
    <associate|eq:t_matrix|<tuple|28|5>>
    <associate|eq:u_lambda|<tuple|3|2>>
    <associate|eq:v_lambda|<tuple|4|2>>
    <associate|eq:x_counter|<tuple|17|4>>
    <associate|eq:x_from_y|<tuple|37|7>>
    <associate|eq:x_hat_complex|<tuple|11|3>>
    <associate|eq:x_hat_counter|<tuple|20|5>>
    <associate|eq:x_hat_rel|<tuple|43|7>>
    <associate|eq:x_prime_spectral|<tuple|47|8>>
    <associate|eq:x_rel|<tuple|42|7>>
    <associate|eq:xi_example|<tuple|19|5>>
    <associate|eq:xi_prime|<tuple|26|5>>
    <associate|eq:y_alt_form|<tuple|23|5>>
    <associate|eq:y_alt_form2|<tuple|24|5>>
    <associate|eq:y_complex|<tuple|12|3>>
    <associate|eq:y_counter|<tuple|18|4>>
    <associate|eq:y_hat_complex|<tuple|14|3>>
    <associate|eq:y_hat_operator|<tuple|22|5>>
    <associate|eq:y_hat_prime|<tuple|27|5>>
    <associate|eq:y_hat_prime_result|<tuple|30|6>>
    <associate|eq:y_hat_prime_t0|<tuple|46|7>>
    <associate|eq:y_hat_result|<tuple|29|6>>
    <associate|eq:y_hat_short|<tuple|36|7>>
    <associate|eq:y_hat_short_alt|<tuple|41|7>>
    <associate|eq:y_hat_t0_rel|<tuple|45|7>>
    <associate|eq:y_operator|<tuple|21|5>>
    <associate|eq:y_short|<tuple|35|7>>
    <associate|eq:y_short_alt|<tuple|40|7>>
    <associate|eq:y_spectral|<tuple|7|3>>
    <associate|eq:y_stationary|<tuple|34|6>>
    <associate|eq:y_stationary_alt|<tuple|39|7>>
    <associate|eq:y_t0|<tuple|33|6>>
    <associate|eq:y_t0_alt|<tuple|38|7>>
    <associate|eq:y_t0_rel|<tuple|44|7>>
    <associate|eq:y_t0_spectral1|<tuple|48|8>>
    <associate|eq:y_t0_spectral2|<tuple|49|8>>
    <associate|thm:uniqueness|<tuple|1|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hasofer1978

      priestley1965

      arens1957

      yang1972

      hasofer1978

      cramer1967

      hasofer1978

      priestley1965

      cramer1967
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>