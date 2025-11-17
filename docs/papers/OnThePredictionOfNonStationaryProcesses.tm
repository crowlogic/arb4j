<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

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

    <with|par-left|1tab|3.1<space|2spc>Continuous-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Time-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Continuous-parameter Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Frequency-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Discussion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
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

  Before discussing the prediction problem, briefly relevant parts of the
  theory of evolutionary spectra are summarized.

  <section|Evolutionary Spectral Representations>

  Consider a class of continuous parameter processes,
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
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)><label|eq:evspec-cont>
  </equation>

  where <math|<around|{|Z<around|(|\<omega\>|)>|}>> is an orthogonal process
  with\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>>|<cell|=\<mathd\>\<mu\>*<around|(|*\<omega\>|)>>>|<row|<cell|>|<cell|=f*<around*|(|\<lambda\>|)>\<mathd\>\<lambda\>>>>>>
  </equation>

  \ (see also <cite|GrangerHatanaka1964>).\ 

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
    d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*\<mathd\>\<mu\><around|(|*\<omega\>|)><space|1em>-\<infty\>\<less\>\<omega\>\<less\>\<infty\><label|eq:evspec>
  </equation>

  <\definition>
    When the measure <math|\<mu\>> is absolutely continuous (with respect to
    Lebesgue measure), the derivative <math|f<rsub|t><around|(|\<omega\>|)>=F<rsub|t><rprime|'><around|(|\<omega\>|)>>
    exists for all <math|\<omega\>>, and is termed the <em|evolutionary
    spectral density function> at time <math|t>.
  </definition>

  <\remark>
    The functions <math|A<rsub|t><around|(|\<omega\>|)>> may be normalize so
    that <math|A<rsub|0><around|(|\<omega\>|)>=1>\<forall\><math|\<omega\>>.
    With this convention, <math|>

    <\equation>
      \<mathd\>\<mu\><around|(|*\<omega\>|)>\<equiv\>d*F<rsub|0><around|(|\<omega\>|)>
    </equation>

    the evolutionary spectrum at time zero.
  </remark>

  <section|Moving-average Representations for Oscillatory Processes>

  As in the prediction theory of stationary processes, \ a one-sided
  moving-average representation for a class of oscillatory processes can be
  constr, the distinction with the stationary case being that the
  coefficients in the moving-average scheme are now time-dependent.

  <subsection|Continuous-parameter Processes>

  As in the case of stationary processes (see<nbsp><cite|Whittle1963>), the
  results for discrete-parameter processes can readily be adapted to the
  continuous case. Let the measure <math|\<mu\>> be absolutely continuous
  (with respect to Lebesgue measure). If the following conditions are met

  <\enumerate-Alpha>
    <item>V-integrability

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
      f<around|(|\<omega\>|)>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C1star>
    </equation>

    <item>Then there exists a function <math|\<psi\><around|(|\<omega\>|)>>
    having no poles or zeros in the lower half-planesuch that

    <\equation>
      <around|\||\<psi\><around|(|\<omega\>|)>|\|><rsup|2>=f<around|(|\<omega\>|)>
    </equation>

    The function <math|\<psi\><around|(|\<omega\>|)>> may now be written as a
    one-sided Fourier integral. Corresponding to<nbsp><eqref|eq:At>, we
    assume now that, for each <math|t>,

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*g<rsub|t><around|(|u|)>*d*u<label|eq:Atcont>
    </equation>

    A necessary condition being

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
      <around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C3star>
    </equation>

    for all <math|t>

    <item>It then follows that we may write <math|X<around|(|t|)>> in the
    form

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<omega\>>*A<rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)><label|eq:XtalphaCont>
    </equation>

    where <math|z<around|(|\<omega\>|)>> is an orthogonal process on
    <math|<around|(|-\<infty\>,\<infty\>|)>>, with\ 

    <\equation>
      E*<around|\||d*<around|\<nobracket\>|\<Phi\>\<omega\>|)>|\|><rsup|2>=d*\<omega\>
    </equation>

    , and <math|A<rsub|t><around|(|\<omega\>|)>> has a one-sided Fourier
    integral representation of the form

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u<label|eq:alphahCont>
    </equation>

    and <math|<around|\||\<Alpha\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>=f<rsub|t><around|(|\<omega\>|)>>.
    A necessary condition for the validity of<nbsp><eqref|eq:alphahCont> is

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|log
      f<rsub|t><around|(|\<omega\>|)>|1+\<omega\><rsup|2>>*d*\<omega\>\<gtr\>-\<infty\><label|eq:C4star>
    </equation>

    for all <math|t>\ 
  </enumerate-Alpha>

  Then, we may write

  <\equation>
    <tabular|<tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>h<rsub|t><around|(|u|)>*\<xi\>*<around|(|t-u|)>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around*|(|t-u|)>>***h<rsub|t><around|(|u|)>d*u
    d\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i
    \<omega\> t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*u>***h<rsub|t><around|(|u|)>d*u|)>
    d\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i
    \<omega\> t>A<rsub|t><around*|(|\<omega\>|)>
    d\<Phi\><around|(|\<omega\>|)>>>>>><label|eq:contMA>
  </equation>

  where

  <\equation>
    \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d\<Phi\><around|(|\<omega\>|)>
  </equation>

  and <math|\<Phi\><around*|(|\<omega\>|)>> is the complex orthogonal random
  measure which is isomorphic to the sample path
  <math|\<xi\><around*|(|t|)>>.

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

  is minimized. Assuming that the process has a one-sided moving average
  form, we may easily obtain an explicit expression for
  <math|<wide|X|~>*<around|(|t+m|)>> in terms of the process
  <math|<around|{|\<xi\><around|(|t|)>|}>>.

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
    <tabular|<tformat|<table|<row|<cell|<wide|X|~>*<around|(|t+m|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>b<rsub|t><around|(|u|)>*X*<around|(|t-u|)>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>X*<around|(|t-u|)>*d*\<beta\><rsub|t><around|(|u|)><label|eq:freqpred2>>>>>><label|eq:freqpred>
  </equation>

  where <math|b<rsub|t><around|(|u|)>> may depend on both <math|t> and
  <math|m>. Using the evolutionary spectral representation, the predictor may
  be written

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
    <tabular|<tformat|<table|<row|<cell|M<around|(|m|)>>|<cell|=E*<around|\||<wide|X|~>*<around|(|t+m|)>-X*<around|(|t+m|)>|\|><rsup|2>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||e<rsup|i*\<omega\>*m>*\<alpha\><rsub|t+m><around|(|\<omega\>|)>-B<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>>>>>><label|eq:freqM>
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

  for all <math|t> and <math|v\<geq\>0>. If
  <math|h<rsub|t-v><around|(|0|)>\<neq\>0> for all
  <math|v\<in\><around|(|0,\<infty\>|)>> and <math|>

  <\equation>
    \<partial\>*h<rsub|t-u>*<around|(|v-u|)>/\<partial\>*v=h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>
  </equation>

  \ exists and is continuous, then by differentiating both sides with respect
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
    H<rsub|t><rsup|\<ast\>><around|(|v,u,-1|)>=-<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|p>*K<rsub|t,k+1><rsup|\<ast\>><around|(|u,v|)><label|eq:resolvent>
  </equation>

  with the \Piterated kernels\Q

  <\equation>
    K<rsub|t,p+1><rsup|\<ast\>><around|(|u,v|)>=<big|int><rsub|u><rsup|v>K<rsub|t,1><rsup|\<ast\>><around|(|u,z|)>*K<rsub|t,p><rsup|\<ast\>><around|(|z,v|)>*d*z<space|1em><around|(|p=1,2,\<ldots\>|)><label|eq:iteratedkernels>
  </equation>

  and

  <\equation>
    K<rsub|t,1><rsup|\<ast\>><around|(|u,v|)>=<frac|h<rsub|t-u,v><rprime|'>*<around|(|v-u|)>|h<rsub|t-v><around|(|0|)>><label|eq:firstkernel>
  </equation>

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
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|6|9>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|3.1|4>>
    <associate|auto-5|<tuple|4|5>>
    <associate|auto-6|<tuple|4.1|5>>
    <associate|auto-7|<tuple|5|6>>
    <associate|auto-8|<tuple|40|8>>
    <associate|auto-9|<tuple|37|9>>
    <associate|bib-Bartlett1955|<tuple|Bartlett1955|9>>
    <associate|bib-Bendat1956|<tuple|Bendat1956|9>>
    <associate|bib-Bendat1957|<tuple|Bendat1957|9>>
    <associate|bib-Bendat1959|<tuple|Bendat1959|9>>
    <associate|bib-Booton1952|<tuple|Booton1952|9>>
    <associate|bib-Cramer1961a|<tuple|Cramer1961a|9>>
    <associate|bib-Cramer1961b|<tuple|Cramer1961b|9>>
    <associate|bib-Davis1952|<tuple|Davis1952|9>>
    <associate|bib-Doob1953|<tuple|Doob1953|9>>
    <associate|bib-GrangerHatanaka1964|<tuple|GrangerHatanaka1964|9>>
    <associate|bib-GrenanderRosenblatt1957|<tuple|GrenanderRosenblatt1957|9>>
    <associate|bib-Kalman1960|<tuple|Kalman1960|9>>
    <associate|bib-Parzen1961|<tuple|Parzen1961|9>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|9>>
    <associate|bib-Priestley1966|<tuple|Priestley1966|9>>
    <associate|bib-Tricomi1957|<tuple|Tricomi1957|10>>
    <associate|bib-Whittle1963|<tuple|Whittle1963|10>>
    <associate|bib-Whittle1965|<tuple|Whittle1965|10>>
    <associate|bib-Yaglom1962|<tuple|Yaglom1962|10>>
    <associate|bib-Zadeh1953|<tuple|Zadeh1953|10>>
    <associate|eq:Atcont|<tuple|8|4>>
    <associate|eq:Bt|<tuple|25|7>>
    <associate|eq:Btopt|<tuple|30|7>>
    <associate|eq:C1star|<tuple|6|4>>
    <associate|eq:C3star|<tuple|9|4>>
    <associate|eq:C4star|<tuple|13|5>>
    <associate|eq:Csplit|<tuple|28|7>>
    <associate|eq:Kt|<tuple|32|7>>
    <associate|eq:XtalphaCont|<tuple|10|4>>
    <associate|eq:Xtplusmspec|<tuple|26|7>>
    <associate|eq:alphahCont|<tuple|12|5>>
    <associate|eq:btfinal|<tuple|37|8>>
    <associate|eq:contMA|<tuple|14|5>>
    <associate|eq:contpredX|<tuple|17|5>>
    <associate|eq:contpredsol|<tuple|19|6>>
    <associate|eq:contpredxi|<tuple|18|6>>
    <associate|eq:conttriangular|<tuple|21|6>>
    <associate|eq:conttriangular2|<tuple|22|6>>
    <associate|eq:contxitok|<tuple|20|6>>
    <associate|eq:evspec|<tuple|4|3>>
    <associate|eq:evspec-cont|<tuple|1|3>>
    <associate|eq:evspec-disc|<tuple|5|3>>
    <associate|eq:evspec-disc2|<tuple|6|3>>
    <associate|eq:firstkernel|<tuple|40|8>>
    <associate|eq:freqM|<tuple|27|7>>
    <associate|eq:freqMmin|<tuple|31|7>>
    <associate|eq:freqMsplit|<tuple|29|7>>
    <associate|eq:freqpred|<tuple|23|6>>
    <associate|eq:freqpred2|<tuple|23|6>>
    <associate|eq:freqpredspec|<tuple|24|6>>
    <associate|eq:freqtriangular|<tuple|33|7>>
    <associate|eq:freqtriangular2|<tuple|35|8>>
    <associate|eq:freqtriangular3|<tuple|36|8>>
    <associate|eq:iteratedkernels|<tuple|39|8>>
    <associate|eq:phiA|<tuple|3|3>>
    <associate|eq:predvar|<tuple|16|5>>
    <associate|eq:resolvent|<tuple|38|8>>
    <associate|sec:discussion|<tuple|6|8>>
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

      <with|par-left|<quote|1tab>|3.1<space|2spc>Continuous-parameter
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Time-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Continuous-parameter
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Frequency-domain Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Discussion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>