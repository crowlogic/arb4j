<TeXmacs|2.1.4>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Complex Processes for Envelopes of Normal
  Noise>|<doc-author|<author-data|<author-name|RICHARD
  ARENS>>>|<doc-date|September 1957>>

  <abstract-data|<\abstract>
    The paper presents a brief exposition of the technique of complex normal
    random variables as utilized in the study of the envelopes of Gaussian
    noise processes. The central concept is the pre-envelope z(t) of a real
    normal process. The pre-envelope z(t) of a real function x(t) is a
    complex function whose real part is x(t) and whose absolute value is the
    envelope, in the sense of high-frequency theory, of x(t). The joint
    probability density for z(t), z'(t) is found and used to get the
    threshold crossing rate. Consideration of nonstationary processes is
    included.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Pre-Envelope Process Examined> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Complex
    Normal Distributions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Return
    to the Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Alarm
    Rate for the Envelope> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Mobile
    Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgment>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The envelope <math|r<around*|(|t|)>> of a real function x of one variable
  (\Ptime\Q) is obtained, according to one conception of the envelope, by
  forming the conjugate (Hilbert transform) function y of x and taking the
  absolute value <math|<around|\||z<around|(|t|)>|\|>> of
  <math|z<around|(|t|)>=x<around|(|t|)>+i*y<around|(|t|)>>. We call the
  function z the pre-envelope of x. Its spectrum is supported wholly by one
  half the frequency axis; we choose the positive half. When two \Psignals\Q
  <math|x<rsub|1>>, <math|x<rsub|2>> are superposed, the pre-envelope of
  <math|x<rsub|1>+x<rsub|2>> is the sum of the pre-envelopes
  <math|z<rsub|1>>, <math|z<rsub|2>> of <math|x<rsub|1>>, <math|x<rsub|2>>,
  respectively; and more generally if x is filtered with output at time t

  <\equation>
    <label|eq:filtered_output><big|int><rsub|0><rsup|\<infty\>>W*<around|(|t-s|)>*x<around|(|s|)>*d*s
  </equation>

  then the pre-envelope of the output is at time t

  <\equation>
    <label|eq:pre_envelope_output><big|int><rsub|0><rsup|\<infty\>>W*<around|(|t-s|)>*z<around|(|s|)>*d*s
  </equation>

  where <math|z<around*|(|t|)>> is the pre-envelope of
  <math|x<around*|(|t|)>>. In dealing with linear systems it is evidently
  better to utilize the pre-envelope, because then at each stage between
  successive filterings the envelope can be readily inspected. (This
  procedure is often employed for aesthetic reasons independent of
  envelopes.) We shall, however, be concerned with random processes rather
  than a single time series in this paper.

  Accordingly, let <math|x> be a sample function from some real normal
  (so-called \PGaussian\Q) stationary process. Form
  <math|z<around*|(|t|)>=x<around*|(|t|)>+i*y<around*|(|t|)>> where z is the
  pre-envelope of <math|x<around*|(|t|)>>. This gives rise to a new random
  process which is stationary, normal and, of course, complex. We first prove
  this and then illustrate the utility of such complex processes by
  calculating the \Palarm rate\Q (see Section<nbsp><reference|sec:alarm_rate>)
  or threshold-crossing rate for a \Pnoise\Q envelope. Our object is,
  however, more to exhibit the technique and illustrate the principles of
  complex valued random processes. Our experience has been that such
  technique is practically indispensable for treating envelope questions for
  nonstationary processes, and considerably more convenient for arriving at
  the known results than the known treatment of the stationary case.

  <section|The Pre-Envelope Process Examined><label|sec:pre_envelope_process>

  Bunimovich<cite|bunimovich> has pointed out that if we have a real valued
  function,

  <\equation>
    <label|eq:real_valued_function>x<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|2*\<pi\>*i*\<lambda\>t>*d*X<around|(|\<lambda\>|)>
  </equation>

  where X is of bounded variation and

  <\equation>
    d*X*<around|(|-\<lambda\>|)>=d*X<around|(|\<lambda\>|)>
  </equation>

  \ since <math|x> is real, then the absolute value of

  <\equation>
    <label|eq:complex_form>x<around|(|t|)>+i*y<around|(|t|)>=x<around|(|t|)>*<big|int><rsub|0><rsup|+\<infty\>>e<rsup|2*\<pi\>*i*\<lambda\>t>*d*X<around|(|f|)>+d
    X<around*|(|0<rsup|+>|)>-dX<around*|(|0<rsup|->|)>
  </equation>

  is the Rice<cite|rice> envelope of <eqref|eq:real_valued_function>. It is
  clear that z is linearly determined by x. Hence z is also a normal,
  stationary process, although, as pointed out earlier, a complex one. Here
  we confine ourselves to the calculation of the autocorrelation for the z
  process, which is by definition (E = expected value or expectation),

  <\equation>
    <label|eq:autocorrelation>E*<around|[|z<around|(|t|)>*z<around|(|s|)>|]>=R<rsub|z>*<around|(|t-s|)>
  </equation>

  a justified notation because it depends only on <math|t-s>. We aim to
  express <math|R<rsub|z><around|(|t|)>> in terms of the integrated power
  spectrum W for the x process, in terms of which the autocorrelation of the
  latter is given by

  <\equation>
    <label|eq:autocorrelation_x>E*<around|[|x<around|(|t|)>*x<around|(|s|)>|]>=R*<around|(|t-s|)>=<big|int><rsub|0><rsup|\<infty\>>cos
    2*\<pi\>*f*<around|(|t-s|)>*d*W<around|(|f|)>
  </equation>

  We expand the cosine, obtaining briefly an array cos cos + sin sin, where
  the first factor in each case depends on t and the second on s. For the
  expectation of <math|x<around|(|t|)>*y<around|(|s|)>> we remark that the
  expectation of a linear functional is the linear functional of the
  expectation. The linear functional here intended is the Hilbert transform
  applied to the second appearing function x, in
  <eqref|eq:autocorrelation_x>. Thus the expectation of
  <math|x<around|(|t|)>*y<around|(|s|)>> is an integral like
  <eqref|eq:autocorrelation_x> with cos cos + sin sin replaced by cos sin
  \<minus\> sin cos, since the Hilbert transform of cos is sin and that of
  sin is \<minus\> cos. Operating, instead, on the t-dependent factors gives
  the expectation of <math|y<around|(|t|)>*x<around|(|s|)>> with the array
  sin cos + cos sin, and for <math|y<around|(|t|)>*y<around|(|s|)>> we obtain
  the array sin sin + cos cos. Adding the integrals for
  <math|x<around|(|t|)>*x<around|(|s|)>>,
  <math|y<around|(|t|)>*y<around|(|s|)>>,
  <math|-i*x<around|(|t|)>*y<around|(|s|)>>, and
  <math|i*y<around|(|t|)>*x<around|(|s|)>>, and dividing by 2 gives the
  quantity called for in <eqref|eq:autocorrelation>, whence

  <\equation>
    <label|eq:rz_expression>R<rsub|z>*<around|(|t-s|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|2*\<pi\>*i*f*<around|(|t-s|)>>*d*W<around|(|f|)>
  </equation>

  <section|Complex Normal Distributions>

  Just as in vector analysis, there is a point in introducing complex
  processes only if in subsequent operations, no further reference to the
  real components is necessary. In order to gain such facility, some basic
  ideas have to be kept in mind. The probability density F(z) of a complex
  random variable z is a real function defined in the complex plane. Also it
  is nonnegative and has integral one over the plane. If, for example,

  <\equation>
    <label|eq:prob_density>F<around|(|z|)>=<frac|e<rsup|-<frac|z*z<rsup|\<ast\>>|2*\<sigma\><rsup|2>>>|2*\<pi\>*\<sigma\><rsup|2>>*
  </equation>

  then we call z a normally distributed random variable with zero mean and
  semivariance <math|\<sigma\><rsup|2>>. This latter is half the mean (E) of
  <math|z*z<rsup|\<ast\>>=<around|\||z|\|><rsup|2>>. The probability density
  for <math|r=<around|\||z|\|>> can be obtained from <eqref|eq:prob_density>
  by changing to polar coordinates and integrating over the angle and takes
  the form

  <\equation>
    <label|eq:rayleigh>F<rsub|1><around|(|r|)>=<frac|r|\<sigma\><rsup|2>>*e<rsup|-<frac|r<rsup|2>*|2\<sigma\><rsup|2>>>*<space|1em>\<forall\>r\<geq\>0
  </equation>

  sometimes called \PRayleigh type with parameter <math|\<sigma\><rsup|2>>\Q.
  If w is a complex normally distributed random variable with mean m which
  may, of course, be complex, then <math|w=m+z> where z is distributed by
  <eqref|eq:prob_density>. The probability density for
  <math|r=<around|\||w|\|>> can be obtained via polar coordinates, and is

  <\equation>
    <label|eq:prob_density_r>F<rsub|2><around|(|r|)>=<frac|r|\<sigma\><rsup|2>>*I<rsub|0>*<around*|(|<frac|r
    |\<sigma\><rsup|2>>*\<mu\>*e<rsup|-<frac|r<rsup|2>+\<mu\><rsup|2>|2
    \<sigma\><rsup|2>>>|)>
  </equation>

  where <math|r\<geq\>0>, and <math|\<mu\>=<around|\||m|\|>>. This
  corresponds to the distribution of the envelope of signal plus noise.
  <math|\<mu\>> is the signal envelope and <math|\<sigma\><rsup|2>> is the
  mean square of the noise.

  The typical jointly normal probability density for n complex random
  variables is given by

  <\equation>
    <label|eq:joint_prob>F<around|(|z<rsub|1>,\<ldots\>,z<rsub|n>|)>=C*e<rsup|-<frac|1|2><big|sum><rsub|i,j>q<rsub|i*j>*z<rsub|i>*z<rsub|j><rsup|\<ast\>>>
  </equation>

  where <math|q<rsub|i*j>=q<rsub|j*i>> and
  <math|C=<around|(|2*\<pi\>|)><rsup|-n>\<times\>> determinant of
  <math|<around|(|q<rsub|i*j>|)>>. The inverse
  <math|<around|(|r<rsub|i*j>|)>> of the matrix
  <math|<around|(|q<rsub|i*j>|)>> has this property

  <\equation>
    <label|eq:inverse_property>r<rsub|i*j>=E*<around|[|z<rsub|i>*z<rsub|j><rsup|\<ast\>>|]>
  </equation>

  <section|Return to the Pre-Envelope Process>

  In a possibly nonstationary, normal process we have a joint probability
  density like <eqref|eq:joint_prob> for the values
  <math|z<around|(|t<rsub|1>|)>=z<rsub|1>,\<ldots\>,z<around|(|t<rsub|n>|)>=z<rsub|n>>
  of a sample function z, and the <math|r<rsub|i*j>> of
  <eqref|eq:inverse_property> takes the form

  <\equation>
    <label|eq:r_ij_form>r*<around|(|t<rsub|i>,t<rsub|j>|)>=E*<around|[|z<around|(|t<rsub|i>|)>*z<around|(|t<rsub|j>|)><rsup|\<ast\>>|]>
  </equation>

  where r is a function of two variables characterizing the process. If the
  process is stationary, this depends only on <math|t<rsub|i>-t<rsub|j>> and
  may be written\ 

  <\equation>
    r<rsub|i*j>=r*<around|(|t<rsub|i>,t<rsub|j>|)>=R<rsub|z>*<around|(|t<rsub|i>-t<rsub|j>|)>
  </equation>

  In view of <eqref|eq:autocorrelation>, this <math|R<rsub|z>> is given for
  the pre-envelope process by <eqref|eq:rz_expression>. If a process
  characterized by <eqref|eq:r_ij_form> (i.e., by specifying r) is subjected
  to a linear operation <math|w=L<around|(|z|)>>, then w is again a normally
  distributed complex random variable, provided there are no convergence
  difficulties in the carrying out of the operation L. In carrying out the
  operation L on the function z, there will usually occur a dummy variable t,
  as in the examples

  <\equation>
    <label|eq:linear_op1>L<around|(|z|)>=a*<around*|\<nobracket\>|<frac|d|d*t>*z<around|(|t|)>|\|><rsub|t=t<rsub|1>>
  </equation>

  <\equation>
    <label|eq:linear_op2>L<around|(|z|)>=<big|int><rsub|b><rsup|a>A<around|(|t|)>*z<around|(|t|)>*d*t
  </equation>

  These and similar functional operations may be written as

  <\equation>
    <label|eq:functional_op>L<around|(|z|)>=<big|int>L<around|(|t|)><around|[|z<around|(|t|)>|]>
  </equation>

  Naturally, the t in <eqref|eq:linear_op1>\U<eqref|eq:functional_op> may be
  replaced by any other letter without altering the significance, hence the
  name dummy variable. Supposing that the questions alluded to do not impede
  us, then

  <\equation>
    <label|eq:expected_w_squared>E<around|[|<around|\||w|\|><rsup|2>|]>=E<around*|[|<big|int>L<around|(|t|)><around|[|z<around|(|t|)>|]>*<big|int><wide|L<around|(|s|)>|\<bar\>><around|[|z<around|(|s|)>|]>|]>
  </equation>

  <\equation>
    =<big|int><big|int>L<around|(|t|)><wide|L<around|(|s|)>|\<bar\>><around|[|z<around|(|t|)>*z<around|(|s|)><rsup|\<ast\>>|]>]
  </equation>

  <\equation>
    =<big|int><big|int>L<around|(|t|)><wide|L<around|(|s|)>|\<bar\>><around|[|r*<around|(|t,s|)>|]>
  </equation>

  <\equation>
    <frac|\<partial\>|\<partial\>*t>*r*<around|(|t,s|)><mid|\|><rsub|s=t=0>
  </equation>

  <\equation>
    <frac|\<partial\>|\<partial\>*s>*r*<around|(|t,s|)><mid|\|><rsub|s=t=0>
  </equation>

  <\equation>
    <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*r*<around|(|t,s|)><mid|\|><rsub|s=t=0>
  </equation>

  i.e., we have the automatically hermitean matrix. Thus the probability
  density of <math|w=L<around|(|z|)>> is given by

  <\equation>
    <label|eq:prob_density_w>F<around|(|w|)>=<frac|e<rsup|-<frac|<around|\||w|\|><rsup|2>|2
    \<tau\><rsup|2>>>|2*\<pi\>*\<tau\><rsup|2>>*
  </equation>

  where <math|\<tau\><rsup|2>> is given by

  <\equation>
    <label|eq:tau_squared>\<tau\><rsup|2>(=E<around|[|<around|\||w|\|><rsup|2>|]>)=<big|int><big|int>L<around|(|t|)><wide|L<around|(|s|)>|\<bar\>><around|[|r*<around|(|t,s|)>|]>
  </equation>

  The full utility of the complex method (examples in
  Section<nbsp><reference|sec:alarm_rate>) is not attained until also two or
  more linear functions of a given process z can be treated. Such a
  generalization of <eqref|eq:tau_squared> is easily obtained. Let the linear
  functionals be

  <\equation>
    <label|eq:linear_functionals>w<rsub|1>=L<rsub|1><around|[|z|]>,\<ldots\>,w<rsub|n>=L<rsub|n><around|[|z|]>
  </equation>

  Then, analogous to, and generalizing <eqref|eq:tau_squared>,

  <\equation>
    <label|eq:expected_wi_wj>E*<around|[|w<rsub|i>*w<rsub|j><rsup|\<ast\>>|]>=<big|int><big|int>L<rsub|i><around|(|t|)><wide|L<rsub|j><around|(|s|)>|\<bar\>><around|[|r*<around|(|t,s|)>|]>
  </equation>

  <\equation>
    <label|eq:matrix><matrix|<tformat|<table|<row|<cell|r*<around|(|0,0|)>>|<cell|r<rsub|1>*<around|(|0,0|)>>>|<row|<cell|r<rsub|2>*<around|(|0,0|)>>|<cell|r<rsub|12>*<around|(|0,0|)>>>>>>
  </equation>

  If these numbers are taken as the <math|r<rsub|i*j>> and the
  <math|q<rsub|i*j>> calculated in terms of them, then <eqref|eq:joint_prob>
  gives the joint probability density of the variables
  <eqref|eq:linear_functionals>. Of course the z's in <eqref|eq:joint_prob>
  have to be replaced by w's.

  <section|Alarm Rate for the Envelope><label|sec:alarm_rate>

  By this we mean the following. Let x be a stationary normal process
  specified by an R as in <eqref|eq:autocorrelation_x>. Let P(T) be the
  probability that the envelope will rise above a level V in a certain
  interval of time T, i.e.,

  <\equation>
    <label|eq:probability_rise>P<around|(|T|)>=<text|prob.
    ><around|{|<around|\||z<around|(|0|)>|\|>\<less\>V\<less\><around|\||z<around|(|T|)>|\|>|}>
  </equation>

  If for small T we have

  <\equation>
    <label|eq:small_t>P<around|(|T|)>=p*T+q
  </equation>

  where q tends to 0 faster than T, as T tends to 0, then p is the alarm rate
  associated with the level V. Now <eqref|eq:probability_rise> could be
  evaluated by setting up the bivariate distribution <eqref|eq:joint_prob>
  again mentioned in Section V and integrating, but this labor is
  unnecessary.

  Rice<cite|rice> solves this problem by using the joint distribution for
  <math|<around|\||z<around|(|t|)>|\|>> and
  <math|<frac|d|d*t><around|\||z<around|(|t|)>|\|>>. We shall, however, use
  the joint distribution of the two linear functionals

  <\equation>
    <label|eq:linear_functionals_specific>w<rsub|1>=L<around|[|z|]>=<around|[|z<around|(|t|)>|]><rsub|t=0>
  </equation>

  <\equation>
    w<rsub|2>=M<around|(|t|)><around|[|z<around|(|t|)>|]>=<around|[|z<rprime|'><around|(|t|)>|]><rsub|t=0>
  </equation>

  and hope that our performance may encourage the reader to use complex
  variables for other envelope problems.

  We actually do not need stationarity; so let the z process be specified as
  by <eqref|eq:r_ij_form>. [We recapitulate: if the datum is a real process
  such as <eqref|eq:autocorrelation_x>, we form first
  <eqref|eq:rz_expression> and take <math|r*<around|(|t,s|)>=R<rsub|z>*<around|(|t-s|)>>.]
  With the <math|r<rsub|i*j>> to use in <eqref|eq:joint_prob> for
  <math|w<rsub|1>>, <math|w<rsub|2>*<around|(|i,j=1,2|)>> we have, according
  to <eqref|eq:matrix>, the following array:

  <\equation>
    <label|eq:array_matrix><matrix|<tformat|<table|<row|<cell|r*<around|(|0,0|)>>|<cell|r<rsub|1>*<around|(|0,0|)>>>|<row|<cell|r<rsub|2>*<around|(|0,0|)>>|<cell|r<rsub|12>*<around|(|0,0|)>>>>>>
  </equation>

  where the indices in <eqref|eq:array_matrix> denote partial derivatives.
  Let the determinant of <eqref|eq:array_matrix> be called D. Then the
  inverse is, omitting the <math|<around|(|0,0|)>>'s from
  <eqref|eq:array_matrix>,

  <\equation>
    <label|eq:inverse_matrix><around|(|q<rsub|i*j>|)>=<frac|1|D><matrix|<tformat|<table|<row|<cell|r<rsub|12>>|<cell|-r<rsub|1>>>|<row|<cell|-r<rsub|2>>|<cell|r>>>>>
  </equation>

  The joint probability density for <math|z<around|(|0|)>>,
  <math|z<rprime|'><around|(|0|)>> is, therefore,

  <\equation>
    <label|eq:joint_prob_density>F<around|(|z,w|)>=D*<around|(|2*\<pi\>|)><rsup|-2>*exp
    <around|(|-2<rsup|-1>*Q|)>
  </equation>

  where <math|>

  <\equation>
    Q=D<rsup|-1>*<around|(|r<rsub|12>*<around|\||z*<around|\||<rsup|2>-2*\<frak-R\>*<around*|(|r<rsub|1>*w*z<rsup|\<ast\>>|)>+r|\|>*w|\|><rsup|2>|)>
  </equation>

  , <math|\<frak-R\><around*|(|x|)>> denoting \Preal part\Q of <math|x.> In
  the stationary case, <eqref|eq:array_matrix> takes the form

  <\equation>
    <label|eq:stationary_matrix><matrix|<tformat|<table|<row|<cell|R<rsub|z><around|(|0|)>>|<cell|-R<rprime|'><rsub|z><around|(|0|)>>>|<row|<cell|+R<rprime|'><rsub|z><around|(|0|)>>|<cell|-R<rprime|''><around|(|0|)>>>>>>.
  </equation>

  Reference to <eqref|eq:rz_expression> discloses that

  <\equation>
    <label|eq:rz_0>R<rsub|z><around|(|0|)>=<big|int><rsub|0><rsup|\<infty\>>d*W<around|(|\<lambda\>|)>=R<around|(|0|)>=<text|``mean
    power''>
  </equation>

  <\equation>
    <label|eq:rz_prime_0>R<rprime|'><rsub|z><around|(|0|)>=2*\<pi\>*i*<big|int><rsub|0><rsup|\<infty\>>\<lambda\>d*W<around|(|\<lambda\>|)><text|(pure
    imaginary)>
  </equation>

  and

  <\equation>
    <label|eq:rz_double_prime_0>R<rprime|''><around|(|0|)>=-4*\<pi\><rsup|2>*<big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|2>*d*W<around|(|\<lambda\>|)>\<less\>0
  </equation>

  The convergence of these integrals would seem to be the only assumption
  needed to justify the result.

  Proceeding from <eqref|eq:joint_prob_density>, a kinematic consideration
  provides a short cut to the alarm rate. We choose to think of
  <eqref|eq:joint_prob_density> as giving the position and velocity
  distribution of a gas in the plane; and we desire the rate at which matter
  diffuses out of the circle of radius V about 0. Consider the rate of
  diffusion over an element h of arc of this circle. The rotational
  invariance of the distribution makes this rate independent of where on the
  circle h is placed, and so we place it at <math|z=V>. We may think of it as
  a small vertical segment whose endpoints are V, V + ih. The particles that
  will cross with velocity w in one second are those in the parallelogram of
  area uh, determined by h and the vector <math|w=u+i*v>, provided
  <math|u\<gtr\>0>, and hence have relative mass
  <math|F<around|(|V,w|)>*u*h>. Integrating overall relevant
  <math|<around|(|u,v|)>>, we obtain

  <\equation>
    <label|eq:integral_rate>h*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>F<around|(|V,u+i*v|)>*u*<space|0.17em>d*u*<space|0.17em>d*v
  </equation>

  This is the rate of diffusion of mass over an arc of length h of the
  circle. Multiplying by <math|2*\<pi\>*V/h> yields the diffusion rate for
  the whole circle. Laying aside the kinematic terminology which has now
  served its heuristic purpose, we say that this [i.e.,
  <eqref|eq:integral_rate> with <math|h=2*\<pi\>*V>] is the probability that
  a particle will escape from the circle per unit of time; and this is, of
  course, the alarm rate.

  It remains to evaluate <eqref|eq:integral_rate>. We set <math|z=V>,
  <math|w=u+i*v>, in <eqref|eq:joint_prob_density>, and the alarm rate is
  readily evaluated as

  <\equation>
    <label|eq:alarm_rate><frac|V|\<tau\>>**e<rsup|-*<frac|V<rsup|2>|2\<tau\><rsup|2>>>*<around*|[|<frac|D|2*\<pi\>*\<tau\>>*e<rsup|-**<frac|V<rsup|2>*\<frak-R\><around*|(|r<rsub|1>|)>|2
    \<tau\><rsup|2>>>+<frac|V|\<tau\>><rsup|>*\<frak-R\><around*|(|r<rsub|1>*|)><text|erf><around*|(|<frac|V*\<frak-R\>*<around*|(|r<rsub|1>|)>|D*\<tau\>>*|)>|]>
  </equation>

  where\ 

  <\equation>
    <with|font-base-size|12|erf<around|(|y|)>=<frac|<big|int><rsub|-y><rsup|0>e<rsup|-2*x<rsup|2>>*<space|0.17em>d*x|2*\<pi\>>>
  </equation>

  In the stationary case, there is considerable simplification because the
  real part <math|\<frak-R\><around*|(|r<rsub|1>|)>> of
  <math|r<rsub|1>=R<rprime|'><rsub|z><around|(|0|)>> is 0, and we have
  nothing but a constant, <math|<frac|D|2*\<pi\>*\<tau\>>>, multiplied by the
  envelope's probability density at V [see <eqref|eq:rayleigh>]. This is then
  Rice's result.

  <section|Mobile Filters>

  The generality of <eqref|eq:alarm_rate> in going beyond the stationary case
  might have been pointless were it not for the fact that \PGaussian noise\Q
  may be encountered which is not stationary. Of course in that case a
  pre-envelope process cannot be constructed via <eqref|eq:rz_expression>. A
  consideration of the genesis of such noise is helpful, however. It usually
  arises because stationary noise is sent through a mobile (= nonstationary)
  device. It often happens that a formula of the type

  <\equation>
    <label|eq:formula_type><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|s|)>*x<around|(|s|)>*<space|0.17em>d*s=z<around|(|t|)>
  </equation>

  can be discovered such that for a real input <math|x<around|(|t|)>>,
  <math|z<around|(|t|)>> represents the pre-envelope for the output, i.e.,
  <math|z<around|(|t|)>> is the real output and
  <math|<around|\||z<around|(|t|)>|\|>> is the envelope of the output. Then
  the function <eqref|eq:r_ij_form> for the pre-envelope of the output is as
  follows

  <\equation>
    <label|eq:r_output>r*<around|(|t,s|)>=E<around*|[|<big|int><big|int>x<around|(|u|)>*x<around|(|v|)>*A<rsup|\<ast\>><around|(|u|)>*A<rsup|\<ast\>><around|(|v|)>*<space|0.17em>d*u*<space|0.17em>d*v|]>=<big|int><big|int>R*<around|(|u-v|)>*A<rsup|\<ast\>><around|(|v|)>*A<rsup|\<ast\>><around|(|u|)>*<space|0.17em>d*v*<space|0.17em>d*u
  </equation>

  If <math|A<rsup|\<ast\>>> has a Fourier transform

  <\equation>
    <label|eq:fourier_transform>\<Phi\><around|(|\<lambda\>|)>=<big|int>A<rsup|\<ast\>><around|(|v|)>*e<rsup|-2*\<pi\>*i*\<lambda\>*v>*<space|0.17em>d*v
  </equation>

  the Fourier inversion formula enables us to write also

  <\equation>
    <label|eq:fourier_inversion>r*<around|(|t,s|)>=<big|int>\<Phi\><rsup|\<ast\>><around|(|\<lambda\>|)>*\<Phi\><rsup|\<ast\>><around|(|\<lambda\>|)>*d*W<around|(|\<lambda\>|)>
  </equation>

  <section*|Acknowledgment>

  Thanks are due T. L. Gottier and Dr. E. Ackerlind of the Radio Corporation
  of America, Los Angeles, Calif., for encouragement and to the second named
  especially for enlightening discussion.

  <\thebibliography|9>
    <bibitem|rice>S. O. Rice, \PMathematical analysis of random noise,\Q
    Bell. Sys. Tech. J., vol. 23, p. 282; 1944, and vol. 24, p. 109; 1945.

    <bibitem|bunimovich>V. I. Bunimovitch, \PThe fluctuation process as a
    vibration with random amplitude and phase,\Q J. Tech. Phys., USSR, vol.
    14, p. 1231; November, 1949.

    <bibitem|doob>J. L. Doob, \PStochastic Processes,\Q John Wiley & Sons,
    Inc. New York, N.Y.; 1953.

    <bibitem|khintchine>A. Khintchine, \PKorrelationstheorie der stationären
    stochastischen Prozesse,\Q Math. Ann., vol. 109 p. 604; 1934.

    <bibitem|lawson>J. L. Lawson and G. E. Uhlenbeck, \PThreshold Signals,\Q
    M.I.T. Rad. Lab. Ser., McGraw-Hill Book Co., Inc., New York, N.Y., vol.
    24, p. 154; 1947.

    <bibitem|cramer>V. Cramer, \POn the theory of stationary random
    processes,\Q Ann. Math., vol. 41, p. 215; 1940.

    <bibitem|blanc>A. Blanc-Lapierre and R. Fortet, \PTheorie des Fonctions
    Aleatoires,\Q Masson, Paris; 1953.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-4|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-5|<tuple|5|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-6|<tuple|6|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-7|<tuple|48|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-8|<tuple|48|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-blanc|<tuple|blanc|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-bunimovich|<tuple|bunimovich|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-cramer|<tuple|cramer|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-doob|<tuple|doob|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-khintchine|<tuple|khintchine|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-lawson|<tuple|lawson|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-rice|<tuple|rice|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:alarm_rate|<tuple|43|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:array_matrix|<tuple|34|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:autocorrelation|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:autocorrelation_x|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:complex_form|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:expected_w_squared|<tuple|19|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:expected_wi_wj|<tuple|28|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:filtered_output|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:formula_type|<tuple|45|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:fourier_inversion|<tuple|48|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:fourier_transform|<tuple|47|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:functional_op|<tuple|18|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:integral_rate|<tuple|42|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:inverse_matrix|<tuple|35|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:inverse_property|<tuple|13|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:joint_prob|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:joint_prob_density|<tuple|36|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:linear_functionals|<tuple|27|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:linear_functionals_specific|<tuple|32|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:linear_op1|<tuple|16|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:linear_op2|<tuple|17|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:matrix|<tuple|29|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:pre_envelope_output|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:prob_density|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:prob_density_r|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:prob_density_w|<tuple|25|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:probability_rise|<tuple|30|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:r_ij_form|<tuple|14|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:r_output|<tuple|46|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:rayleigh|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:real_valued_function|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:rz_0|<tuple|39|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:rz_double_prime_0|<tuple|41|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:rz_expression|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:rz_prime_0|<tuple|40|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:small_t|<tuple|31|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:stationary_matrix|<tuple|38|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:tau_squared|<tuple|26|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|sec:alarm_rate|<tuple|5|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|sec:pre_envelope_process|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      bunimovich

      rice

      rice
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Pre-Envelope Process Examined> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Complex
      Normal Distributions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Return
      to the Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Alarm
      Rate for the Envelope> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Mobile
      Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgment>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>