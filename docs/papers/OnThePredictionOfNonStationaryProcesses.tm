<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|On the Prediction of Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|N. A.
  Abdrabbo>|<\author-affiliation>
    University of Manchester

    [Received August 1966. Revised January 1967]
  </author-affiliation>>>|<doc-author|<author-data|<author-name|M. B.
  Priestley>|<\author-affiliation>
    University of Manchester

    [Received August 1966. Revised January 1967]
  </author-affiliation>>>|<doc-date|>|<doc-title-options|cluster-all>>

  <abstract-data|<\abstract>
    We consider the problem of linear least-squares prediction for a class of
    nonstationary processes which possess <em|evolutionary spectral
    representations>. It is shown that, under certain conditions, such
    processes admit moving-average representations in terms of time-dependent
    coefficients. This feature enables us to develop a close analogue of the
    Wiener-Kolmogorov approach to the corresponding problem for stationary
    processes.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Evolutionary
    Spectral Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Moving-average
    Representations for Oscillatory Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Discrete-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|3.2<space|2spc>Continuous-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Time-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Discrete-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|4.2<space|2spc>Continuous-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Frequency-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Discussion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Wiener-Kolmogorov \Plinear least-squares\Q approach to the prediction
  and filtering of stationary processes is now well established, and may, in
  principle, be applied to any practical problem involving stationary
  processes whose second-order properties are known. Accounts of this theory
  have been written at various levels of mathematical rigour (see, for
  example, <cite|Doob1953|Bartlett1955|GrenanderRosenblatt1957|Yaglom1962|Whittle1965>),
  but so far the corresponding problem for non-stationary processes has
  received little attention.

  There have been a few isolated attempts to deal with this topic, but in the
  main the approaches have been either too general or too restricted to be
  useful in practical applications. For example,
  Parzen<nbsp><cite|Parzen1961> has solved the non-stationary prediction
  problem in principle, but his approach is a somewhat abstract one, and his
  \Psolution\Q for the optimum predictor is expressed as a certain
  inner-product in a Hilbert space. Cramér<nbsp><cite|Cramer1961a|Cramer1961b>
  considered the same problem, and obtained some interesting results in the
  form of \Pexistence theorems\Q, but did not present a method for
  determining the explicit form of a predictor in terms of the observed
  variables. Similar remarks apply to the work of
  Davis<nbsp><cite|Davis1952>. On the other hand, there have appeared several
  papers written from an engineering standpoint (see, for example,
  <cite|Booton1952|Zadeh1953|Bendat1956>), but in most cases the \Pgeneral
  solution\Q stops with the construction of the well-known integral equation
  (cf.<nbsp><eqref|eq:covariance-integral>) involving the covariance function
  of the process and the unknown \Pcoefficients\Q of the optimal predictor,
  the solution of which is obtainable only when the process obeys some very
  simple model.

  On a different level, Kalman<nbsp><cite|Kalman1960> has studied
  multivariate non-stationary processes corresponding to dynamical systems
  which are governed by known linear differential equations, and has
  established some basic results regarding the analytic structure of optimal
  predictors for such models. However, from the point of view of practical
  application, it would appear that the most useful results so far obtained
  are due to Whittle<nbsp><cite|Whittle1965>, who considered non-stationary
  processes generated by autoregressive models with time-dependent
  coefficients, and obtained explicit recursive relations for the optimal
  predictors. In fact, some of our results for these particular models
  correspond very closely to those obtained by Whittle.

  The success of classical prediction theory for stationary processes is due
  essentially to the fact that such processes admit a spectral representation
  in terms of an orthogonal process. This feature not only simplifies the
  solution of the prediction problem, but also enables one to treat a general
  class of stationary processes by means of a \Pcanonical\Q representation,
  so that the discussion need not be restricted to particular models, such as
  the autoregressive, moving-average, etc. Hitherto, the lack of a similar
  spectral representation for a general class of non-stationary processes has
  no doubt been one of the major stumbling blocks in attempts to generalize
  the classical theory. However, it turns out that the recently developed
  theory of evolutionary spectral representations<nbsp><cite|Priestley1965>
  provides an ideal framework for the formulation and solution of
  non-stationary prediction problems. In fact, by using evolutionary spectral
  representations one obtains a prediction theory which is almost an exact
  parallel of the Wiener-Kolmogorov theory.

  The basic idea underlying this approach is the introduction of the
  evolutionary (i.e., time-dependent) spectrum of a nonstationary process,
  whose form completely determines the values of the \Pcoefficients\Q of the
  optimal linear predictor. This means that even if we are presented with
  observations from a process whose structure is completely unknown we may
  still usefully apply this prediction theory by first estimating the
  evolutionary spectrum (methods for estimating evolutionary spectra have
  been discussed by <cite|Priestley1965|Priestley1966>). Of course, this
  estimation procedure introduces further complications which will not be
  discussed here (see also Section<nbsp><reference|sec:discussion>). In this
  paper we assume throughout that the second-order properties of the process
  are known a priori. We should point out, further, that in this account we
  are not aiming at complete mathematical rigour: rather we aim to show how
  our approach may be used to obtain explicit results for non-stationary
  processes.

  Before discussing the prediction problem, we summarize briefly relevant
  parts of the theory of evolutionary spectra.

  <section|Evolutionary Spectral Representations>

  We consider a class of continuous parameter processes,
  <math|<around|{|X<around|(|t|)>|}>>, with
  <math|E<around|{|X<around|(|t|)>|}>=0>,
  <math|E<around|{|X<rsup|2><around|(|t|)>|}>\<less\>\<infty\>> for all
  <math|t>, for which there exists a family <math|<with|math-font|cal*|F>> of
  functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>
  (defined on the real line and indexed by <math|t>) and a measure
  <math|\<mu\>> on the real line such that
  <math|<around|{|X<around|(|t|)>|}>> admits a spectral representation of the
  form

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)><label|eq:evspec-cont>
  </equation>

  where <math|<around|{|Z<around|(|\<omega\>|)>|}>> is an orthogonal process
  with <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=\<mu\>*<around|(|d*\<omega\>|)>>
  (see also <cite|GrangerHatanaka1964>).

  If there exists a family <math|<with|math-font|cal*|F>> for which each
  <math|\<phi\><rsub|t>> may be written in the form

  <\equation>
    \<phi\><rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)><label|eq:phiA>
  </equation>

  where, for each fixed <math|\<omega\>>, the generalized Fourier transform
  of <math|A<rsub|t><around|(|\<omega\>|)>> (considered as a function of
  <math|t>) has an absolute maximum at the origin, <math|X<around|(|t|)>> is
  termed an <em|oscillatory process> (cf.<nbsp><cite|Priestley1965>), and the
  evolutionary spectrum at time <math|t> with respect to the family
  <math|<with|math-font|cal*|F>> is defined by

  <\equation>
    d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*\<mu\>*<around|(|d*\<omega\>|)>,<space|1em>-\<infty\>\<less\>\<omega\>\<less\>\<infty\><label|eq:evspec>
  </equation>

  For discrete parameter oscillatory processes (i.e., processes defined only
  for <math|t=0,\<pm\>1,\<pm\>2,\<ldots\>>), we have a corresponding
  evolutionary spectral representation,

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*\<omega\>*t>*A<rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)><label|eq:evspec-disc>
  </equation>

  and the evolutionary spectrum at time <math|t> with respect to
  <math|<with|math-font|cal*|F>> is defined by

  <\equation>
    d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*\<mu\>*<around|(|d*\<omega\>|)>,<space|1em>-\<pi\>\<leq\>\<omega\>\<leq\>\<pi\><label|eq:evspec-disc2>
  </equation>

  When the measure <math|\<mu\>> is absolutely continuous (with respect to
  Lebesgue measure), the derivative <math|f<rsub|t><around|(|\<omega\>|)>=F<rsub|t><rprime|'><around|(|\<omega\>|)>>
  exists for all <math|\<omega\>>, and is termed the <em|evolutionary
  spectral density function> at time <math|t>.

  In both the continuous and discrete cases we may normalize the functions
  <math|A<rsub|t><around|(|\<omega\>|)>> so that
  <math|A<rsub|0><around|(|\<omega\>|)>=1> for all <math|\<omega\>>. With
  this convention, <math|\<mu\>*<around|(|d*\<omega\>|)>\<equiv\>d*F<rsub|0><around|(|\<omega\>|)>>,
  the evolutionary spectrum at time zero.

  <section|Moving-average Representations for Oscillatory Processes>

  As in the prediction theory of stationary processes, we begin by
  constructing a one-sided moving-average representation for a class of
  oscillatory processes, the distinction with the stationary case being that
  the coefficients in the moving-average scheme are now time-dependent.

  <subsection|Discrete-parameter Processes>

  Suppose that <math|X<around|(|t|)>> has a representation of the
  form<nbsp><eqref|eq:evspec-disc>, and that <math|\<mu\>> is absolutely
  continuous with respect to <math|d*\<omega\>>. Then we may write
  <math|f<rsub|t><around|(|\<omega\>|)>> in the form

  <\equation>
    f<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*f<around|(|\<omega\>|)><label|eq:ftA>
  </equation>

  where <math|f<around|(|\<omega\>|)>=d*\<mu\>/d*\<omega\>>. Note that
  <math|f<around|(|\<omega\>|)>\<equiv\>f<rsub|0><around|(|\<omega\>|)>> must
  be integrable. Suppose now that

  <\equation>
    <big|int><rsub|-\<pi\>><rsup|\<pi\>>log
    f<around|(|\<omega\>|)>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C1>
  </equation>

  (Condition<nbsp>C1)

  Then it follows that (see<nbsp><cite|Doob1953>, p.<nbsp>160) there exists a
  function <math|\<psi\><around|(|\<omega\>|)>> such that

  <\equation>
    <around|\||\<psi\><around|(|\<omega\>|)>|\|><rsup|2>=f<around|(|\<omega\>|)><label|eq:psi>
  </equation>

  where <math|\<psi\><around|(|z|)>>, considered as a function of the complex
  variable <math|z=e<rsup|i*\<omega\>>>, has no poles or zeros inside the
  unit circle, <math|<around|\||z|\|>\<less\>1>. The function
  <math|\<psi\><around|(|\<omega\>|)>> may be written as a one-sided Fourier
  transform, viz.

  <\equation>
    \<psi\><around|(|\<omega\>|)>=<big|sum><rsub|u=0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*g<rsup|\<ast\>><around|(|u|)><label|eq:psiFT>
  </equation>

  for some suitable sequence <math|g<rsup|\<ast\>><around|(|u|)>>.

  Suppose further that:

  <\equation>
    <text|(C2)><space|1em><text|the family ><with|math-font|cal*|F>*<text|can
    be chosen so that, for each >t,A<rsub|t><around|(|z|)>*<text|(as a
    function of >z)<text|also has no poles or zeros inside the unit circle,
    so that, for each >t,
  </equation>

  <\equation>
    A<rsub|t><around|(|\<omega\>|)>=<big|sum><rsub|u=0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*g<rsub|t><around|(|u|)><label|eq:At>
  </equation>

  A necessary condition for the validity of<nbsp><eqref|eq:At> is

  <\equation>
    <big|int><rsub|-\<pi\>><rsup|\<pi\>>log
    <around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C3>
  </equation>

  for all <math|t> (Condition<nbsp>C3).

  Now write <math|X<around|(|t|)>> in the form

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*t*\<omega\>>*\<alpha\><rsub|t><around|(|\<omega\>|)>*d*z<around|(|\<omega\>|)><label|eq:Xtalpha>
  </equation>

  where <math|\<alpha\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*\<psi\><around|(|\<omega\>|)>>,
  so that

  <\equation>
    <around|\||\<alpha\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>=f<rsub|t><around|(|\<omega\>|)><label|eq:alphaft>
  </equation>

  and <math|z<around|(|\<omega\>|)>> is an orthogonal process on
  <math|<around|(|-\<pi\>,\<pi\>|)>> with
  <math|E*<around|\||d*z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<omega\>>.

  Since both <math|\<psi\><around|(|\<omega\>|)>> and
  <math|A<rsub|t><around|(|\<omega\>|)>> have one-sided Fourier transforms,
  it follows that, for each <math|t>, <math|\<alpha\><rsub|t><around|(|\<omega\>|)>>
  has a one-sided Fourier transform, i.e.,

  <\equation>
    \<alpha\><rsub|t><around|(|\<omega\>|)>=<big|sum><rsub|u=0><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)><label|eq:alphah>
  </equation>

  A necessary condition for the validity of<nbsp><eqref|eq:alphah> is

  <\equation>
    <big|int><rsub|-\<pi\>><rsup|\<pi\>>log
    f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C4>
  </equation>

  for each <math|t> (Condition<nbsp>C4).

  <\theorem>
    <label|thm:discMA>Let <math|<around|{|X<around|(|t|)>|}>> be a
    discrete-parameter oscillatory process. If there exists a family
    <math|<with|math-font|cal*|F>> satisfying Condition<nbsp>C2, and with
    respect to which <math|<around|{|X<around|(|t|)>|}>> has an absolutely
    continuous evolutionary spectrum satisfying Condition<nbsp>C4, then
    <math|<around|{|X<around|(|t|)>|}>> may be represented as a one-sided
    moving average process of the form

    <\equation>
      X<around|(|t|)>=<big|sum><rsub|u=0><rsup|\<infty\>>h<rsub|t><around|(|u|)>*\<xi\>*<around|(|t-u|)><label|eq:discMA>
    </equation>

    where <math|<around|{|\<xi\><around|(|t|)>|}>> is a stationary
    uncorrelated process. Conversely, if <math|<around|{|X<around|(|t|)>|}>>
    has a one-sided moving average representation of the
    form<nbsp><eqref|eq:discMA>, Condition<nbsp>C4 must be satisfied.
  </theorem>

  <\proof>
    See discussion leading up to and following equation<nbsp><eqref|eq:C4>.
  </proof>

  <subsection|Continuous-parameter Processes>

  As in the case of stationary processes (see<nbsp><cite|Whittle1963>), the
  results for discrete-parameter processes can readily be adapted to the
  continuous case. The measure <math|\<mu\>> is again assumed to be
  absolutely continuous (with respect to Lebesgue measure) and, in place of
  C1, we assume that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
    f<around|(|\<omega\>|)>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C1star>
  </equation>

  (Condition<nbsp>C1<rsup|<math|\<ast\>>>)

  Then there exists a function <math|\<psi\><around|(|\<omega\>|)>> such that
  <math|<around|\||\<psi\><around|(|\<omega\>|)>|\|><rsup|2>=f<around|(|\<omega\>|)>>,
  <math|\<psi\><around|(|z|)>> having no poles or zeros in the lower
  half-plane. The function <math|\<psi\><around|(|\<omega\>|)>> may now be
  written as a one-sided Fourier integral. Corresponding
  to<nbsp><eqref|eq:At>, we assume now that, for each <math|t>,

  <\equation>
    A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*g<rsub|t><around|(|u|)>*d*u<label|eq:Atcont>
  </equation>

  A necessary condition being

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
    <around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C3star>
  </equation>

  for all <math|t> (Condition<nbsp>C3<rsup|<math|\<ast\>>>).

  It then follows that we may write <math|X<around|(|t|)>> in the form

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<omega\>>*\<alpha\><rsub|t><around|(|\<omega\>|)>*d*z<around|(|\<omega\>|)><label|eq:XtalphaCont>
  </equation>

  where <math|z<around|(|\<omega\>|)>> is an orthogonal process on
  <math|<around|(|-\<infty\>,\<infty\>|)>>, with
  <math|E*<around|\||d*z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<omega\>>, and
  <math|\<alpha\><rsub|t><around|(|\<omega\>|)>> has a one-sided Fourier
  integral representation of the form

  <\equation>
    \<alpha\><rsub|t><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u<label|eq:alphahCont>
  </equation>

  and <math|<around|\||\<alpha\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>=f<rsub|t><around|(|\<omega\>|)>>.

  A necessary condition for the validity of<nbsp><eqref|eq:alphahCont> is

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
    f<rsub|t><around|(|\<omega\>|)>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C4star>
  </equation>

  for all <math|t> (Condition<nbsp>C4<rsup|<math|\<ast\>>>).

  Then, formally, we may write

  <\equation>
    X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>h<rsub|t><around|(|u|)>*\<xi\>*<around|(|t-u|)>*d*u<label|eq:contMA>
  </equation>

  where <math|\<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*z<around|(|\<omega\>|)>>.

  <section|The Time-domain Approach>

  The basic problem of linear least-squares prediction may be stated as
  follows: we are given the observed values of the process over the
  semi-infinite interval <math|<around|(|-\<infty\>,t|)>> and wish to predict
  the value of <math|X*<around|(|t+m|)>> (<math|m\<gtr\>0>). The predictor,
  <math|<wide|X|~>*<around|(|t+m|)>>, is to be chosen as that linear
  combination of <math|<around|{|X<around|(|s|)>,s\<leq\>t|}>> which is such
  that

  <\equation>
    M<around|(|m|)>=E*<around|{|<wide|X|~>*<around|(|t+m|)>-X*<around|(|t+m|)>|}><rsup|2><label|eq:predvar>
  </equation>

  is minimized.

  Assuming that the process has a one-sided moving average form, we may
  easily obtain an explicit expression for <math|<wide|X|~>*<around|(|t+m|)>>
  in terms of the process <math|<around|{|\<xi\><around|(|t|)>|}>>.

  <subsection|Discrete-parameter Processes>

  Assume <math|X<around|(|t|)>> has a one-sided moving average representation
  of the form<nbsp><eqref|eq:discMA>, so that

  <\equation>
    X<around|(|t|)>=<big|sum><rsub|u=0><rsup|\<infty\>>h<rsub|t><around|(|u|)>*\<xi\>*<around|(|t-u|)>=<big|sum><rsub|u=-\<infty\>><rsup|t>h<rsub|t>*<around|(|t-u|)>*\<xi\><around|(|u|)><label|eq:XtMA>
  </equation>

  Then

  <\equation>
    X*<around|(|t+m|)>=<big|sum><rsub|u=-\<infty\>><rsup|t>h<rsub|t+m>*<around|(|t+m-u|)>*\<xi\><around|(|u|)>+<big|sum><rsub|u=t+1><rsup|m>h<rsub|t+m>*<around|(|t+m-u|)>*\<xi\><around|(|u|)><label|eq:Xtplusm>
  </equation>

  The predictor is to be chosen as a linear combination of
  <math|<around|{|X<around|(|s|)>,s\<leq\>t|}>>:

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|sum><rsub|s=-\<infty\>><rsup|t>b<around|(|s|)>*X<around|(|s|)><label|eq:predX>
  </equation>

  Alternatively, as each <math|X<around|(|t|)>> is a linear combination of
  the <math|<around|{|\<xi\>*<around|(|t-u|)>|}>> (<math|u\<geq\>0>), we may
  write

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|sum><rsub|u=-\<infty\>><rsup|t>a<around|(|u|)>*\<xi\><around|(|u|)><label|eq:predxi>
  </equation>

  The problem reduces to finding the coefficients
  <math|<around|{|a<around|(|u|)>|}>> which minimize <math|M<around|(|m|)>>.
  The solution is

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|sum><rsub|u=-\<infty\>><rsup|t>h<rsub|t+m>*<around|(|t+m-u|)>*\<xi\><around|(|u|)>=<big|sum><rsub|u=m><rsup|\<infty\>>h<rsub|t+m><around|(|u|)>*\<xi\><rsub|t+m-u><label|eq:predsol>
  </equation>

  so that

  <\equation>
    a<around|(|u|)>=h<rsub|t+m>*<around|(|t+m-u|)><label|eq:au>
  </equation>

  for all <math|u>.

  The prediction variance is

  <\equation>
    M<around|(|m|)>=2*\<pi\>*<big|sum><rsub|u=0><rsup|m-1>h<rsub|t+m><rsup|2><around|(|u|)><label|eq:predvar2>
  </equation>

  To express <math|<wide|X|~>*<around|(|t+m|)>> in terms of the <math|X>'s,
  write

  <\equation>
    \<xi\><around|(|t|)>=<big|sum><rsub|v=0><rsup|\<infty\>>k<rsub|t><around|(|v|)>*X*<around|(|t-v|)><label|eq:xitok>
  </equation>

  Substituting<nbsp><eqref|eq:xitok> in<nbsp><eqref|eq:XtMA> and equating
  coefficients, we obtain the triangular system

  <\align>
    <tformat|<table|<row|<cell|>|<cell|h<rsub|t><around|(|0|)>*k<rsub|t><around|(|0|)>=1>>|<row|<cell|>|<cell|h<rsub|t><around|(|1|)>*k<rsub|t><around|(|0|)>+h<rsub|t-1><around|(|0|)>*k<rsub|t><around|(|1|)>=0>>|<row|<cell|>|<cell|h<rsub|t><around|(|2|)>*k<rsub|t><around|(|0|)>+h<rsub|t-1><around|(|1|)>*k<rsub|t><around|(|1|)>+h<rsub|t-2><around|(|0|)>*k<rsub|t><around|(|2|)>=0<eq-number><label|eq:triangular>>>>>
  </align>

  and so on.

  Alternatively, equating coefficients in the other order,

  <\equation>
    <big|sum><rsub|v=0><rsup|p>k<rsub|t-v>*<around|(|p-v|)>*h<rsub|t><around|(|v|)>=\<delta\><rsub|p,0><space|1em><around|(|p=0,1,2,\<ldots\>|)><label|eq:triangular2>
  </equation>

  where <math|\<delta\><rsub|p,0>> is the Kronecker delta.

  <subsection|Continuous-parameter Processes>

  The results for continuous-parameter processes are very similar. We are
  given <math|<around|{|X<around|(|s|)>,-\<infty\>\<less\>s\<leq\>t|}>> and
  wish to predict <math|X*<around|(|t+m|)>> by a linear combination of past
  values:

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|-\<infty\>><rsup|t>X<around|(|s|)>*b<around|(|s|)>*d*s<label|eq:contpredX>
  </equation>

  or, equivalently,

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|-\<infty\>><rsup|t>\<xi\><around|(|u|)>*a<around|(|u|)>*d*u<label|eq:contpredxi>
  </equation>

  Assuming <math|X<around|(|t|)>> has a moving-average representation of the
  form<nbsp><eqref|eq:contMA>, it follows that

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|-\<infty\>><rsup|t>h<rsub|t+m>*<around|(|t+m-u|)>*\<xi\><around|(|u|)>*d*u=<big|int><rsub|m><rsup|\<infty\>>h<rsub|t+m><around|(|u|)>*\<xi\>*<around|(|t+m-u|)>*d*u<label|eq:contpredsol>
  </equation>

  To express <math|<wide|X|~>*<around|(|t+m|)>> in terms of
  <math|<around|{|X<around|(|s|)>|}>>, write

  <\equation>
    \<xi\><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>k<rsub|t><around|(|v|)>*X*<around|(|t-v|)>*d*v<label|eq:contxitok>
  </equation>

  and substitute in<nbsp><eqref|eq:contMA>, leading to the integral equations

  <\equation>
    <big|int><rsub|0><rsup|v>h<rsub|t><around|(|u|)>*k<rsub|t-u>*<around|(|v-u|)>*d*u=\<delta\><around|(|v|)><label|eq:conttriangular>
  </equation>

  and

  <\equation>
    <big|int><rsub|0><rsup|u>k<rsub|t><around|(|v|)>*h<rsub|t-v>*<around|(|u-v|)>*d*v=\<delta\><around|(|u|)><label|eq:conttriangular2>
  </equation>

  where <math|\<delta\><around|(|\<cdummy\>|)>> is the Dirac delta function.

  <section|The Frequency-domain Approach>

  We now consider an alternative approach based on a generalization of the
  Wiener-Hopf technique. We treat first the continuous-parameter case, and
  write the predictor as

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|0><rsup|\<infty\>>b<rsub|t><around|(|u|)>*X*<around|(|t-u|)>*d*u<label|eq:freqpred>
  </equation>

  or, formally,

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|0><rsup|\<infty\>>X*<around|(|t-u|)>*d*\<beta\><rsub|t><around|(|u|)><label|eq:freqpred2>
  </equation>

  where <math|b<rsub|t><around|(|u|)>> may depend on both <math|t> and
  <math|m>.

  Using the evolutionary spectral representation, the predictor may be
  written

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*B<rsub|t><around|(|\<omega\>|)>*d*z<around|(|\<omega\>|)><label|eq:freqpredspec>
  </equation>

  where

  <\equation>
    B<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>b<rsub|t><around|(|u|)>*\<alpha\><rsub|t-u><around|(|\<omega\>|)>*e<rsup|-i*u*\<omega\>>*d*u<label|eq:Bt>
  </equation>

  and

  <\equation>
    X*<around|(|t+m|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t+m|)>>*\<alpha\><rsub|t+m><around|(|\<omega\>|)>*d*z<around|(|\<omega\>|)><label|eq:Xtplusmspec>
  </equation>

  The mean squared error is

  <\equation>
    M<around|(|m|)>=E*<around|\||<wide|X|~>*<around|(|t+m|)>-X*<around|(|t+m|)>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||e<rsup|i*\<omega\>*m>*\<alpha\><rsub|t+m><around|(|\<omega\>|)>-B<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\><label|eq:freqM>
  </equation>

  Let

  <\equation>
    e<rsup|i*\<omega\>*m>*\<alpha\><rsub|t+m><around|(|\<omega\>|)>=C<rsub|t><rsup|<around|(|1|)>><around|(|\<omega\>|)>+C<rsub|t><rsup|<around|(|2|)>><around|(|\<omega\>|)><label|eq:Csplit>
  </equation>

  where <math|C<rsub|t><rsup|<around|(|1|)>><around|(|\<omega\>|)>> is a
  \Pbackward transform\Q and <math|C<rsub|t><rsup|<around|(|2|)>><around|(|\<omega\>|)>>
  is a \Pforward transform\Q (see<nbsp><cite|Bartlett1955>, p.<nbsp>201).
  Then

  <\equation>
    M<around|(|m|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||C<rsub|t><rsup|<around|(|1|)>><around|(|\<omega\>|)>-B<rsub|t><around|(|\<omega\>|)>*<around|\||<rsup|2>d*\<omega\>+<big|int><rsub|-\<infty\>><rsup|\<infty\>>|\|>*C<rsub|t><rsup|<around|(|2|)>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\><label|eq:freqMsplit>
  </equation>

  and the minimum is attained when

  <\equation>
    B<rsub|t><around|(|\<omega\>|)>=C<rsub|t><rsup|<around|(|1|)>><around|(|\<omega\>|)><label|eq:Btopt>
  </equation>

  with

  <\equation>
    M<around|(|m|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||C<rsub|t><rsup|<around|(|2|)>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\><label|eq:freqMmin>
  </equation>

  Taking Fourier transforms, for <math|v\<geq\>0>,

  <\equation>
    K<rsub|t><around|(|v|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<theta\>*<around|(|v+m|)>>*\<alpha\><rsub|t+m><around|(|\<theta\>|)>*d*\<theta\>=h<rsub|t+m>*<around|(|v+m|)><label|eq:Kt>
  </equation>

  and

  <\equation>
    <big|int><rsub|0><rsup|v>b<rsub|t><around|(|u|)>*h<rsub|t-u>*<around|(|v-u|)>*d*u=h<rsub|t+m>*<around|(|v+m|)><label|eq:freqtriangular>
  </equation>

  for all <math|t> and <math|v\<geq\>0>.

  If <math|h<rsub|t-v><around|(|0|)>\<neq\>0> for all
  <math|v\<in\><around|(|0,\<infty\>|)>> and
  <math|\<partial\>*h<rsub|t-u>*<around|(|v-u|)>/\<partial\>*v=h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>>
  exists and is continuous, then by differentiating both sides with respect
  to <math|v>,

  <\equation>
    h<rsub|t-v><around|(|0|)>*b<rsub|t><around|(|v|)>+<big|int><rsub|0><rsup|v>h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>*b<rsub|t><around|(|u|)>*d*u=h<rsub|t+m,v><rprime|'>*<around|(|v+m|)><label|eq:freqtriangular2>
  </equation>

  or

  <\equation>
    b<rsub|t><around|(|v|)>+<big|int><rsub|0><rsup|v><frac|h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>|h<rsub|t-v><around|(|0|)>>*b<rsub|t><around|(|u|)>*d*u=<frac|h<rsub|t+m,v><rprime|'>*<around|(|v+m|)>|h<rsub|t-v><around|(|0|)>><label|eq:freqtriangular3>
  </equation>

  The solution is (see<nbsp><cite|Tricomi1957>, p.<nbsp>10)

  <\equation>
    b<rsub|t><around|(|v|)>=<frac|h<rsub|t+m,v><rprime|'>*<around|(|v+m|)>|h<rsub|t-v><around|(|0|)>>+<big|int><rsub|0><rsup|v>H<rsub|t><rsup|\<ast\>><around|(|v,u,-1|)>*<frac|h<rsub|t+m,v><rprime|'>*<around|(|u+m|)>|h<rsub|t-u><around|(|0|)>>*d*u<label|eq:btfinal>
  </equation>

  where the \Presolvent kernel\Q <math|H<rsub|t><rsup|\<ast\>><around|(|v,u,-1|)>>
  is

  <\equation>
    H<rsub|t><rsup|\<ast\>><around|(|v,u,-1|)>=-<big|sum><rsub|p=0><rsup|\<infty\>><around|(|-1|)><rsup|p>*K<rsub|t,p+1><rsup|\<ast\>><around|(|u,v|)><label|eq:resolvent>
  </equation>

  with the \Piterated kernels\Q

  <\equation>
    K<rsub|t,p+1><rsup|\<ast\>><around|(|u,v|)>=<big|int><rsub|u><rsup|v>K<rsub|t,1><rsup|\<ast\>><around|(|u,z|)>*K<rsub|t,p><rsup|\<ast\>><around|(|z,v|)>*d*z<space|1em><around|(|p=1,2,\<ldots\>|)><label|eq:iteratedkernels>
  </equation>

  and

  <\equation>
    K<rsub|t,1><rsup|\<ast\>><around|(|u,v|)>=<frac|h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>|h<rsub|t-v><around|(|0|)>><label|eq:firstkernel>
  </equation>

  For discrete-parameter processes, the predictor is

  <\equation>
    <wide|X|~>*<around|(|t+m|)>=<big|sum><rsub|u=0><rsup|\<infty\>>b<rsub|t><around|(|u|)>*X*<around|(|t-u|)><label|eq:discpred>
  </equation>

  and the system

  <\equation>
    <big|sum><rsub|u=0><rsup|v>b<rsub|t><around|(|u|)>*h<rsub|t-u>*<around|(|v-u|)>=h<rsub|t+m>*<around|(|v+m|)>*<space|1em><around|(|v=0,1,2,\<ldots\>|)><label|eq:discfreqtriangular>
  </equation>

  is triangular and easily solved by back-substitution.

  Attempting to obtain <math|b<rsub|t><around|(|u|)>> directly from the
  covariance function <math|R<around|(|s,t|)>=E*<around|{|X<around|(|s|)>*X<rsup|\<ast\>><around|(|t|)>|}>>
  would yield the system

  <\equation>
    <big|sum><rsub|u=0><rsup|\<infty\>>b<rsub|t><around|(|u|)>*R<around|(|t-u,t-v|)>=R<around|(|t-v,t+m|)>*<space|1em><around|(|v\<geq\>0|)><label|eq:covariance-integral>
  </equation>

  which is not as tractable as the spectral approach.

  <section|Discussion><label|sec:discussion>

  As mentioned in Section<nbsp>1, in this paper we are concerned primarily
  with the problem of determining the optimum predictor on the assumption
  that the second-order properties of the process are fully known. However,
  we have shown that the predictor <math|<wide|X|~>*<around|(|t+m|)>> is
  determined uniquely by the form of the evolutionary spectra
  <math|<around|{|f<rsub|t><around|(|\<omega\>|)>|}>>, so that in cases where
  we have no precise knowledge of the underlying model we may attack the
  problem by first estimating the functions
  <math|<around|{|f<rsub|t><around|(|\<omega\>|)>|}>>.

  It will be seen from Section<nbsp>5 that <math|<wide|X|~>*<around|(|t+m|)>>
  depends on the form of <math|h<rsub|t+m><around|(|u|)>>, i.e., on the form
  of the evolutionary spectrum at the future time point
  <math|<around|(|t+m|)>>. In a purely empirical analysis we would not, of
  course, be able to estimate <math|f<rsub|t+m><around|(|\<omega\>|)>>
  directly from observations extending only up to time <math|t>, and we would
  have to assume that the spectra were changing with sufficient
  \Psmoothness\Q over time to enable the form of
  <math|f<rsub|t+m><around|(|\<omega\>|)>> to be inferred from the spectra
  which have been estimated up to time <math|t>.

  If the prediction step <math|m> is much smaller than the characteristic
  width <math|B<rsub|X>> of the process (see<nbsp><cite|Priestley1965>), it
  would be a reasonable approximation to replace
  <math|f<rsub|t+m><around|(|\<omega\>|)>> by
  <math|f<rsub|t><around|(|\<omega\>|)>>\Vthe most recently available
  spectrum. In fact, it seems clear intuitively that the very nature of a
  non-stationary process precludes long-range prediction, unless we are
  prepared to make assumptions about the character of the non-stationarity.
  Consequently, if <math|m\<gg\>B<rsub|X>>, we would have to extrapolate the
  available spectra to the time point <math|<around|(|t+m|)>>. This
  extrapolation could be performed on the spectral ordinates themselves (by
  fitting suitable functions of <math|t> to a range of values of
  <math|\<omega\>>), but in general we would presumably start from a model of
  the process which determines the form of the evolutionary spectra in terms
  of a set of time-varying parameters <math|<around|{|\<alpha\><rsub|i><around|(|t|)>|}>>,
  and then extrapolate the values of these parameters. If our model specifies
  further the functional time-dependence of the
  <math|<around|{|\<alpha\><rsub|i><around|(|t|)>|}>> in terms of another set
  of constant parameters <math|<around|{|\<beta\><rsub|j>|}>>, then the
  extrapolation is a straightforward problem and involves merely the
  estimation of the <math|<around|{|\<beta\><rsub|j>|}>>. If, on the other
  hand, the functional form of the <math|<around|{|\<alpha\><rsub|i><around|(|t|)>|}>>
  is not specified by the model, the extrapolation would have to be performed
  by regression techniques.

  <section*|References>

  <\thebibliography|99>
    <bibitem|Bartlett1955>Bartlett, M.<nbsp>S. (1955). <em|An Introduction to
    Stochastic Processes>. Cambridge: University Press.

    <bibitem|Bendat1956>Bendat, J.<nbsp>S. (1956). A general theory of linear
    prediction and filtering. <em|J. Soc. Industr. Appl. Math.>, 4, 131\U151.

    <bibitem|Bendat1957>Bendat, J.<nbsp>S. (1957). Exact integral equation
    solutions and synthesis for a large class of optimum time variable linear
    filters. <em|Trans. Inst. Radio Engrs, IT-3>, 71\U80.

    <bibitem|Bendat1959>Bendat, J.<nbsp>S. (1959). <em|Principles and
    Applications of Random Noise Theory>. New York: Wiley.

    <bibitem|Booton1952>Booton, R.<nbsp>C. (1952). An optimization theory for
    time-varying linear systems with nonstationary statistical inputs.
    <em|Proc. Inst. Radio Engrs>, 40, 977\U981.

    <bibitem|Cramer1961a>Cramér, H. (1961a). On some classes of
    non-stationary processes. <em|Proc. 4th Berkeley Symp. Math. Statist. &
    Prob.>, 2, 57\U78.

    <bibitem|Cramer1961b>Cramér, H. (1961b). On the structure of purely
    non-deterministic stochastic processes. <em|Ark. Mat.>, 19, 249\U266.

    <bibitem|Davis1952>Davis, R.<nbsp>C. (1952). On the theory of prediction
    of non-stationary stochastic processes. <em|J. Appl. Phys.>, 23,
    1047\U1053.

    <bibitem|Doob1953>Doob, J.<nbsp>L. (1953). <em|Stochastic Processes>. New
    York: Wiley.

    <bibitem|GrangerHatanaka1964>Granger, C.<nbsp>W.<nbsp>J. and Hatanaka, M.
    (1964). <em|Spectral Analysis of Economic Time Series>. Princeton:
    University Press.

    <bibitem|GrenanderRosenblatt1957>Grenander, U. and Rosenblatt, M. (1957).
    <em|Statistical Analysis of Stationary Time Series>. New York: Wiley.

    <bibitem|Kalman1960>Kalman, R.<nbsp>E. (1960). A new approach to linear
    filtering and prediction problems. <em|J. Basic Eng. (Trans. A.S.M.E.,
    Series D)>, 82, 35\U45.

    <bibitem|Parzen1961>Parzen, E. (1961). An approach to time series
    analysis. <em|Ann. Math. Statist.>, 32, 951\U989.

    <bibitem|Priestley1965>Priestley, M.<nbsp>B. (1965). Evolutionary spectra
    and non-stationary processes. <em|J. R. Statist. Soc. B>, 27, 204\U237.

    <bibitem|Priestley1966>Priestley, M.<nbsp>B. (1966). Design relations for
    non-stationary processes. <em|J. R. Statist. Soc. B>, 28, 228\U240.

    <bibitem|Tricomi1957>Tricomi, F.<nbsp>G. (1957). <em|Integral Equations>.
    New York: Wiley.

    <bibitem|Whittle1963>Whittle, P. (1963). <em|Prediction and Regulation>.
    London: English Universities Press.

    <bibitem|Whittle1965>Whittle, P. (1965). Recursive relations for
    predictors of non-stationary processes. <em|J. R. Statist. Soc. B>, 27,
    523\U532.

    <bibitem|Yaglom1962>Yaglom, A.<nbsp>M. (1962). <em|An Introduction to the
    Theory of Stationary Random Functions>. Englewood Cliffs, N.J.:
    Prentice-Hall.

    <bibitem|Zadeh1953>Zadeh, L.<nbsp>A. (1953). Optimum non-linear filters.
    <em|J. Appl. Phys.>, 24, 396\U404.
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-10|<tuple|6|12|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-11|<tuple|6|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-12|<tuple|6|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-2|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-3|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-4|<tuple|3.1|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-5|<tuple|3.2|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-6|<tuple|4|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-7|<tuple|4.1|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-8|<tuple|4.2|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-9|<tuple|5|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Bartlett1955|<tuple|Bartlett1955|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Bendat1956|<tuple|Bendat1956|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Bendat1957|<tuple|Bendat1957|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Bendat1959|<tuple|Bendat1959|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Booton1952|<tuple|Booton1952|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Cramer1961a|<tuple|Cramer1961a|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Cramer1961b|<tuple|Cramer1961b|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Davis1952|<tuple|Davis1952|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Doob1953|<tuple|Doob1953|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-GrangerHatanaka1964|<tuple|GrangerHatanaka1964|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-GrenanderRosenblatt1957|<tuple|GrenanderRosenblatt1957|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Kalman1960|<tuple|Kalman1960|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Parzen1961|<tuple|Parzen1961|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Priestley1966|<tuple|Priestley1966|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Tricomi1957|<tuple|Tricomi1957|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Whittle1963|<tuple|Whittle1963|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Whittle1965|<tuple|Whittle1965|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Yaglom1962|<tuple|Yaglom1962|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|bib-Zadeh1953|<tuple|Zadeh1953|13|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:At|<tuple|11|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Atcont|<tuple|19|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Bt|<tuple|45|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Btopt|<tuple|50|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C1|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C1star|<tuple|18|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C3|<tuple|12|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C3star|<tuple|20|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C4|<tuple|16|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:C4star|<tuple|23|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Csplit|<tuple|48|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Kt|<tuple|52|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:XtMA|<tuple|26|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Xtalpha|<tuple|13|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:XtalphaCont|<tuple|21|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Xtplusm|<tuple|27|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:Xtplusmspec|<tuple|46|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:alphaft|<tuple|14|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:alphah|<tuple|15|5|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:alphahCont|<tuple|22|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:au|<tuple|31|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:btfinal|<tuple|56|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:contMA|<tuple|24|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:contpredX|<tuple|36|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:contpredsol|<tuple|38|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:contpredxi|<tuple|37|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:conttriangular|<tuple|40|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:conttriangular2|<tuple|41|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:contxitok|<tuple|39|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:covariance-integral|<tuple|62|12|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:discMA|<tuple|17|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:discfreqtriangular|<tuple|61|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:discpred|<tuple|60|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:evspec|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:evspec-cont|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:evspec-disc|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:evspec-disc2|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:firstkernel|<tuple|59|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqM|<tuple|47|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqMmin|<tuple|51|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqMsplit|<tuple|49|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqpred|<tuple|42|9|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqpred2|<tuple|43|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqpredspec|<tuple|44|10|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqtriangular|<tuple|53|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqtriangular2|<tuple|54|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:freqtriangular3|<tuple|55|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:ftA|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:iteratedkernels|<tuple|58|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:phiA|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:predX|<tuple|28|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:predsol|<tuple|30|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:predvar|<tuple|25|7|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:predvar2|<tuple|32|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:predxi|<tuple|29|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:psi|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:psiFT|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:resolvent|<tuple|57|11|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:triangular|<tuple|34|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:triangular2|<tuple|35|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:xitok|<tuple|33|8|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|sec:discussion|<tuple|6|12|../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|thm:discMA|<tuple|1|6|../.TeXmacs/texts/scratch/no_name_4.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Doob1953

      Bartlett1955

      GrenanderRosenblatt1957

      Yaglom1962

      Whittle1965

      Parzen1961

      Cramer1961a

      Cramer1961b

      Davis1952

      Booton1952

      Zadeh1953

      Bendat1956

      Kalman1960

      Whittle1965

      Priestley1965

      Priestley1965

      Priestley1966

      GrangerHatanaka1964

      Priestley1965

      Doob1953

      Whittle1963

      Bartlett1955

      Tricomi1957

      Priestley1965
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Evolutionary
      Spectral Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Moving-average
      Representations for Oscillatory Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Discrete-parameter Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Continuous-parameter
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Time-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Discrete-parameter Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Continuous-parameter
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Frequency-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Discussion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>