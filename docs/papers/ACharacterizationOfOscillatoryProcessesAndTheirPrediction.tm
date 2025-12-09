<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <assign|slim|<macro|<with|math-font-family|rm|s<with|math-level|1|mode|text|->lim>>>

    \;

    \;

    \;

    \;
  </hide-preamble>

  <doc-data|<doc-title|A Characterization Of Oscillatory Processes And Their
  Prediction>|<doc-author|<author-data|<author-name|V.
  Mandrekar>|<\author-affiliation>
    <doc-data|<doc-author|<author-data|<\author-misc>
      Research supported by NSF Grant GP-11626.
    </author-misc>>>|<\doc-date>
      Received by the editors April 26, 1971.
    </doc-date>>
  </author-affiliation>>>>

  <abstract-data|<abstract|The oscillatory stochastic processes recently
  studied by Priestley are characterized as deformed stationary curves in a
  Hilbert space. This characterization leads to the simple time domain proof
  of prediction and moving average representation for these stochastic
  processes in terms of the associated stationary curve>>

  <section|Introduction>

  In <cite|Kolmogorov>, A. N. Kolmogorov studied second order stationary
  processes as curves in Hilbert space. The idea again occurred in Cramér
  <cite|Cramer> for nonstationary processes. In this note we characterize the
  oscillatory processes introduced by Priestley <cite|Priestley> as deformed
  stationary curves in a Hilbert space and give a simple geometric solution
  for the prediction problem for such curves. As a consequence of this one
  can easily derive the analytic results on prediction in <cite|Abdrabbo>,
  thus providing a simple and more general solution for the prediction
  problem of oscillatory processes. Also our characterization makes the
  definition of the time dependent spectral distribution an obvious
  generalization of the stationary case. For the sake of being specific we
  consider throughout the continuous parameter case.

  <subsection|Defintions and Preliminaries>

  <\definition>
    <label|U><dueto|Strongly Continuous One-Parameter Unitary
    Group><label|def:unitary_group>A family
    <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>> of operators in
    <math|\<cal-L\><around|(|H|)>> is a strongly continuous one-parameter
    unitary group if:

    <\enumerate>
      <item>Each <math|U<rsub|t>> is unitary:
      <math|U<rsub|t><rsup|\<ast\>>*U<rsub|t>=U<rsub|t>*U<rsub|t><rsup|\<ast\>>=I>
      for all <math|t\<in\>\<bbb-R\>>

      <item>Group property: <math|U<rsub|t>*U<rsub|s>=U<rsub|t+s>> for all
      <math|t,s\<in\>\<bbb-R\>>

      <item>Identity: <math|U<rsub|0>=I>

      <item>Strong continuity:

      <\equation>
        lim<rsub|t\<to\>0><around|\<\|\|\>|<around|(|U<rsub|t>*f|)><around|(|t|)>-f<around|(|t|)>|\<\|\|\>>=0\<forall\>f\<in\>H
      </equation>
    </enumerate>

    By Stone's theorem, every such group admits a unique self-adjoint
    infinitesimal generator <math|T> with spectral representation:

    <\equation>
      U<rsub|t>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<around|(|\<lambda\>|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    where <math|E<around|(|\<cdummy\>|)>> is the projection-valued measure
    (spectral measure) on <math|\<bbb-R\>>.
  </definition>

  \;

  <\definition>
    <label|def:curves>Let <math|H> be a Hilbert-space and <math|R> be the
    space of real numbers with the usual topology. It is said that

    <\enumerate>
      <item><math|x> is a continuous curve in <math|H>, if <math|>

      <\equation>
        x<around*|(|t|)>:R\<rightarrow\>H
      </equation>

      \ is a continuous map of <math|R> into <math|H>.

      <item><label|stationaryCurve><math|y> is a stationary continuous curve
      in <math|H>, if

      <\enumerate-roman>
        <item><math|y> is a continuous curve in <math|H>

        <item><math|<around|(|y<around|(|t|)>,y<around|(|s|)>|)>> is a
        function of <math|t-s>
      </enumerate-roman>

      where the spectral representation of the stationary process is given by\ 

      <\equation>
        y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<Phi\><around|(|\<lambda\>|)><label|eq:y_def>
      </equation>

      Then clearly <cite|Doob>, p. 526, <math|y> is a stationary continuous
      curve in <math|H>. Using Stone's Theorem <cite|Riesz>, p. 383, and
      uniqueness of the Fourier representation one obtains an expression for
      the orthogonal random measure

      <\equation>
        \<Phi\><around|(|A|)>=<around|(|E<around|(|A|)>*y|)><around|(|0|)>
      </equation>

      \ for <math|A\<in\>B<around|(|R|)>>, where <math|E> is the spectral
      measure associated with the shift group defined for each
      <math|s\<in\>R> by

      <\equation>
        <around|(|U<rsub|t>*y|)><around|(|s|)>=y*<around|(|t+s|)>\<forall\>t\<in\>\<bbb-R\><label|eq:shift_group>
      </equation>

      on <math|H<rsub|y>*<around|(|+\<infty\>|)>> into
      <math|H<rsub|y>*<around|(|+\<infty\>|)>>. Furthermore <math|>the closed
      linear span

      <\equation>
        H<rsub|y>*<around|(|+\<infty\>|)>=\<cal-S\><around|{|<around|(|U<rsub|t>*y|)><around|(|0|)>,t\<in\>R|}>
      </equation>

      is the space of all shifts of the stationary process.
    </enumerate>
  </definition>

  With every curve <math|x> in <math|H> we associate the following subspaces
  of <math|H>:

  <\align>
    <tformat|<table|<row|<cell|H<rsub|x><around|(|t|)>>|<cell|=\<cal-S\><around|{|x<around|(|\<tau\>|)>,\<tau\>\<leq\>t|}><eq-number><label|eq:subspace1>>>|<row|<cell|H<rsub|x>*<around|(|+\<infty\>|)>>|<cell|=\<cal-S\><around|{|x<around|(|\<tau\>|)>,\<tau\>\<in\>R|}><eq-number><label|eq:subspace2>>>|<row|<cell|H<rsub|x>*<around|(|-\<infty\>|)>>|<cell|=<big|cap><rsub|t>H<rsub|x><around|(|t|)><eq-number><label|eq:subspace3>>>>>
  </align>

  where <math|\<cal-S\><around|{|\<cdummy\>|}>> denotes the subspace
  generated by vectors. If the curve is continuous
  <math|H<rsub|x>*<around|(|+\<infty\>|)>> then is separable.\ 

  <\definition>
    <label|sol><dueto|Strong Operator Limit>Let
    <math|<around|{|T<rsub|\<alpha\>>|}>> be a net (or sequence) of bounded
    linear operators on a Hilbert space <math|H>. The strong operator limit
    of <math|<around|{|T<rsub|\<alpha\>>|}>> is defined by:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<slim><rsub|\<alpha\>>
      <around*|(|T<rsub|\<alpha\>> f|)><around*|(|t|)>=<around*|(|T
      f|)><around*|(|t|)>>|<cell|\<Longleftrightarrow\>>|<cell|lim<rsub|\<alpha\>><around|\<\|\|\>|<around*|(|T<rsub|\<alpha\>>*h|)><around*|(|t|)>-<around*|(|T*h|)><around*|(|t|)>|\<\|\|\>>=0>|<cell|\<forall\>h\<in\>H>>>>>
    </equation>

    This is convergence in the strong operator topology on
    <math|\<cal-L\><around|(|H|)>>, meaning that the operators converge
    pointwise on <math|H> in the norm of the space.
  </definition>

  <\definition>
    <dueto|Infinitesimal Generator of a Unitary Group>Let
    <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>> be a strongly
    continuous one-parameter unitary group on a Hilbert space <math|H>, The
    infinitesimal generator <math|T> of this group is the (densely defined,
    self-adjoint) operator

    <\equation>
      <around*|(|T*h|)><around*|(|t|)>=<slim><rsub|t\<rightarrow\>0>
      <frac|<around*|(|U<rsub|t>*h|)><around*|(|t|)>-h<around*|(|t|)>|i*t>
    </equation>

    with domain

    <\equation>
      <math-up|Dom><around|(|T|)>=<around*|{|h\<in\>H:<around*|(|T*h|)><around*|(|t|)>\<in\>H|}>
    </equation>

    For such <math|T>, the exponential representation holds:

    <\equation>
      U<rsub|t>=e<rsup|i*t*T>*<space|1em><text|for all >t\<in\>\<bbb-R\>
    </equation>

    where

    <\equation>
      e<rsup|i*t*T>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<around|(|\<lambda\>|)>
    </equation>

    defines the unitary group via the spectral theorem.

    The resolvent of <math|T> is

    <\equation>
      <around*|(|R<rsub|z> f|)><around*|(|t|)>=<frac|1|z*-<around*|(|T
      f|)><around*|(|t|)>><space|1em>z\<in\>\<bbb-C\>\<setminus\>\<bbb-R\>
    </equation>

    and the spectral measure <math|E<around|(|\<cdummy\>|)>> satisfies
    Stone's formula:

    <\equation>
      E<around|(|<around|(|a,b|]>|)>= <slim><rsub|e\<rightarrow\>0<rsup|+>><frac|<big|int><rsub|a><rsup|b><around*|(|R*<around|(|\<lambda\>+i*\<varepsilon\>|)>-R*<around|(|\<lambda\>-i*\<varepsilon\>|)>|)>*<space|0.17em>d*\<lambda\>|2*\<pi\>*i>*
    </equation>

    where <math|<slim><rsub|e\<rightarrow\>0<rsup|+>>> is the strong operator
    limit from Definition <reference|sol>).
  </definition>

  <\definition>
    <dueto|Spectral Measure via Stone's Formula>Let <math|T> be the
    infinitesimal generator of <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>=<math|<around|{|e<rsup|i*t*T>|}><rsub|t\<in\>\<bbb-R\>>>,
    where <math|U<rsub|t>=e<rsup|i*t*T>>. For any interval
    <math|<around|(|a,b|]>\<subset\>\<bbb-R\>> and
    <math|h\<in\>H<rsub|y>*<around|(|+\<infty\>|)>>:

    <\equation>
      <around*|(|E<around|(|<around|(|a,b|]>|)>*h|)><around*|(|t|)>=<frac|<text|s->lim<rsub|\<varepsilon\>\<to\>0<rsup|+>>
      <big|int><rsub|a><rsup|b><around*|[|<around*|(|R<rsub|R*<rsub|\<lambda\>+i*\<varepsilon\>>>
      h|)><around*|(|t|)>-<around*|(|R<rsub|\<lambda\>-i*\<varepsilon\>>
      h|)><around*|(|t|)>|]>**<space|0.17em>d*\<lambda\>|2*\<pi\>*i>*
    </equation>

    where

    <\equation>
      <around*|(|R<rsub|z> f|)><around*|(|t|)>=<frac|1|<around|(|z*I-<around*|(|T
      f|)><around*|(|t|)>|)>>
    </equation>

    \ is the resolvent of <math|T> for <math|z\<in\>\<bbb-C\>\<setminus\>\<bbb-R\>>.
    For general Borel sets <math|A\<in\>B<around|(|\<bbb-R\>|)>>:

    <\equation>
      E<around|(|A|)>=<text|s->lim<rsub|n\<to\>\<infty\>>
      <big|sum><rsub|k=1><rsup|n<rsub|A>>\<chi\><rsub|A<rsub|k>>*E<around|(|A<rsub|k>|)>
    </equation>

    where <math|<around|{|A<rsub|k>|}>> are disjoint intervals partitioning
    <math|A> with mesh going to zero, and <math|\<chi\><rsub|A<rsub|k>>> are
    coefficients in the simple function approximation of
    <math|\<chi\><rsub|A>> having numbers of elements <math|n<rsub|A>>

    Equivalently, via functional calculus:

    <\equation>
      E<around|(|A|)>=<text|s->lim<rsub|n\<to\>\<infty\>>
      f<rsub|n><around|(|T|)>
    </equation>

    where <math|f<rsub|n>> are bounded measurable functions with
    <math|f<rsub|n>\<to\>\<chi\><rsub|A>> pointwise and
    <math|<around|\<\|\|\>|f<rsub|n>|\<\|\|\>><rsub|\<infty\>>\<leq\>1>.
  </definition>

  <section|Oscillatory Processes as Stationary Deformed Curves>

  <\definition>
    It is said that a curve <math|x> in <math|H> is <em|purely
    nondeterministic> if <math|H<rsub|x>*<around|(|-\<infty\>|)>=<around|{|0|}>>
    and is said to be a <em|deformed stationary curve> if there exists a
    stationary continuous curve <math|y> in <math|H> and for each
    <math|t\<in\>R>, a linear operator

    <\equation>
      <around*|(|A f|)><around*|(|t|)>:H<rsub|y>*<around|(|+\<infty\>|)>\<rightarrow\>H<rsub|y>*<around|(|+\<infty\>|)>
    </equation>

    \ such that

    <\itemize>
      <item*|(a)>the domain of A contains all functions in
      <math|H<rsub|y><around*|(|\<infty\>|)>>

      <\equation>
        <math-up|Dom><around|(|A|)>\<supset\><around|{|y<around|(|s|)>,-\<infty\>\<less\>s\<less\>+\<infty\>|}>
      </equation>

      <item*|(b)>and the deformed stationary curve <math|x<around*|(|t|)>> is
      actually an oscillatory process <cite|Priestley> and can be represented
      as the application of the operator <math|A> to the stationary curve
      <math|y<around*|(|t|)>>

      <\equation>
        <tabular|<tformat|<table|<row|<cell|x<around|(|t|)>>|<cell|=<around|(|A*y|)><around|(|t|)>\<forall\>t\<in\>\<bbb-R\>>>|<row|<cell|>|<cell|=<around|(|A*<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<Phi\><around|(|\<lambda\>|)>|)><around|(|t|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)><label|eq:oscillatory>>>>>>
      </equation>

      where <math|y<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<Phi\><around|(|\<lambda\>|)>>
      is the stationary continuous curve in Definition
      <reference|def:curves>.<reference|stationaryCurve> and
      <math|H=L<rsub|2><around|(|\<Omega\>,P|)>> the space of
      square-integrable functions with respect to <math|P> and where

      <\enumerate>
        <item><math|\<Phi\><around|(|\<cdummy\>|)>> is an orthogonal
        countably additive (c.a.) set function known as the (complex)
        orthogonal random measure (with values in <math|H>).

        <item>the integral in <eqref|eq:oscillatory> is the stochastic
        integral (Doob <cite|Doob>, p. 208), and

        <item>for each <math|t\<in\>R>, we have

        <\equation>
          <big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<rho\><around|(|\<lambda\>|)>\<less\>\<infty\>\<forall\>t\<in\>\<bbb-R\>
        </equation>

        \ where

        <\equation>
          \<rho\><around|(|A|)>=<around|(|\<Phi\><around|(|A|)>,\<Phi\><around|(|A|)>|)><rsub|L<rsub|2><around|(|\<Omega\>|)>><text|\<forall\><math|A\<in\>B<around|(|R|)>>><label|eq:rho>
        </equation>

        and <math|B<around*|(|R|)>> is the Borel sets of <math|R>.
      </enumerate>
    </itemize>
  </definition>

  <\definition>
    <dueto|Spectral measure of a stationary curve>Let <math|y<around|(|t|)>>
    be a second order stationary process with values in
    <math|H=L<rsub|2><around|(|\<Omega\>,\<cal-F\>,P|)>>, and let
    <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>> be the shift group
    on <math|H<rsub|y>*<around|(|+\<infty\>|)>> defined by

    <\equation>
      <around|(|U<rsub|t>*y|)><around|(|s|)>=y*<around|(|t+s|)>,<space|1em>t,s\<in\>\<bbb-R\>
    </equation>

    By Stone's theorem there exists a unique projection\Uvalued measure

    <\equation>
      E:\<cal-B\><around|(|\<bbb-R\>|)>\<to\>\<cal-L\>*<around*|(|H<rsub|y>*<around|(|+\<infty\>|)>|)>
    </equation>

    such that

    <\equation>
      U<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<around|(|\<lambda\>|)><space|2em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    Define the orthogonal random measure <math|\<Phi\>> by

    <\equation>
      \<Phi\><around|(|A|)>\<assign\><around|(|E<around|(|A|)>*y|)><around|(|0|)><space|2em>\<forall\>A\<in\>\<cal-B\><around|(|\<bbb-R\>|)>
    </equation>

    Then the spectral measure <math|\<mu\>> of the (scalar) stationary
    process <math|y<around|(|t|)>> is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<mu\><around|(|A|)>>|<cell|=\<bbb-E\><around*|(|<around|\||\<Phi\><around|(|A|)>|\|><rsup|2>|)>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|\<Phi\><around|(|A|)>|\<\|\|\>><rsub|L<rsub|2><around|(|\<Omega\>|)>><rsup|2>>>|<row|<cell|>|<cell|=<around*|\<langle\>|E<around|(|A|)>*y<around|(|0|)>,<space|0.17em>y<around|(|0|)>|\<rangle\>><rsub|H>>>>>><space|2em>\<forall\>A\<in\>\<cal-B\><around|(|\<bbb-R\>|)>
    </equation>

    In differential notation this is written as

    <\equation>
      <tabular|<tformat|<table|<row|<cell|d*\<mu\><around|(|\<lambda\>|)>>|<cell|=\<bbb-E\><around*|(|<around|\||d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|)>>>|<row|<cell|>|<cell|=<around*|\<langle\>|d*E<around|(|\<lambda\>|)>*<space|0.17em>y<around|(|0|)>,<space|0.17em>y<around|(|0|)>|\<rangle\>><rsub|H>>>>>>
    </equation>
  </definition>

  The following characterizes oscillatory processes.

  <\theorem>
    <label|thm:characterization><math|x> is an oscillatory curve in <math|H>
    if and only if <math|x> is a deformed stationary curve such that for each
    <math|t>,

    <\equation>
      <around|(|A*U<rsub|s>*h|)><around|(|t|)>=<around|(|U<rsub|s>*A*h|)><around|(|t|)>\<forall\>s\<in\>\<bbb-R\>,h\<in\><math-up|Dom><around|(|A|)>
    </equation>
  </theorem>

  <\proof>
    Let <math|x<rsub|t>> be oscillatory and <math|y<around|(|t|)>> be the
    stationary process in Equation-<eqref|eq:y_def> which can be represented
    by

    <\equation>
      y<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>
    </equation>

    where <math|E<around|(|\<cdummy\>|)>> is the spectral measure associated
    with a continuous unitary group

    <\equation>
      <around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>><label|eq:unitary_group>
    </equation>

    given in <eqref|eq:shift_group> (<cite|Riesz>, p. 383). Define

    <\equation>
      A<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*d*E<around|(|\<lambda\>|)><label|eq:A_def>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    Then by <cite|Dunford>, p. 1196, <math|A<around|(|t|)>> is closed and
    <math|<math-up|Dom><around|(|A|)>\<supset\><around|{|y<around|(|s|)>,s\<in\>R|}>\<forall\>t>.
    By the definition of the spectral integral and the fact

    <\equation>
      <around|(|U<rsub|s>*E|)><around|(|A|)>=<around|(|E*U<rsub|s>|)><around|(|A|)>\<forall\>A\<in\>B<around|(|R|)>
    </equation>

    it is seen that

    <\equation>
      <around|(|A*U<rsub|s>*h|)><around|(|t|)>=<around|(|U<rsub|s>*A*h|)><around|(|t|)>\<forall\>t,s\<in\>\<bbb-R\>
    </equation>

    and <math|h\<in\><math-up|Dom><around|(|A|)>>. Furthermore,

    <\align>
      <tformat|<table|<row|<cell|<around|(|A*y|)><around|(|t|)>>|<cell|=<around*|(|<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*d*E<around|(|\<lambda\>|)>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>|)><eq-number><label|eq:At_yt>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>>>|<row|<cell|>|<cell|=x<around*|(|t|)>>>>>
    </align>

    since

    <\equation>
      <around|(|E<around|(|A|)>*\<cdummy\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>|]>=<big|int><rsub|A>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>\<forall\>A\<in\>B<around|(|R|)>
    </equation>

    To prove the converse, we observe that since

    <\equation>
      <around|(|A*U<rsub|s>*h|)><around|(|t|)>=<around|(|U<rsub|s>*A*h|)><around|(|t|)>\<forall\>h\<in\><math-up|Dom><around|(|A|)>\<supseteq\><around|{|y<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>
    </equation>

    and

    <\equation>
      H<rsub|y>*<around|(|+\<infty\>|)>=\<cal-S\><around|{|<around|(|U<rsub|s>*y|)><around|(|0|)>,s\<in\>R|}>
    </equation>

    we obtain by <cite|Masani>, p. 549, that there exists Borel measurable
    function <math|a<rsub|t><around|(|\<cdummy\>|)>> such that

    <\equation>
      A<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*d*E<around|(|\<lambda\>|)><label|eq:A_def_converse>
    </equation>

    The fact that

    <\equation>
      <math-up|Dom><around|(|A|)>\<supseteq\><around|{|y<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>
    </equation>

    <cite|Dunford>, p. 1196, implies

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<around|\<\|\|\>|d*E<around|(|\<lambda\>|)>*y<around|(|0|)>|\<\|\|\>><rsup|2>\<less\>\<infty\>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    Hence we obtain

    <\align>
      <tformat|<table|<row|<cell|x<rsub|t>>|<cell|=<around*|(|<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|\<lambda\>|)>*d*E<around|(|\<lambda\>|)>|)><around*|[|<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>|)>|]><eq-number><label|eq:xt_spectral>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>*d*E<around|(|\<lambda\>|)>*y<around|(|0|)>>>>>
    </align>

    giving <math|x<rsub|t>> oscillatory.
  </proof>

  <\remark>
    <label|rem:spectrum>We now observe that since

    <\equation>
      x<around*|(|t|)>=<around|(|U<rsub|t>*A*y|)><around|(|0|)>
    </equation>

    the spectrum of <math|x<around*|(|t|)>> is given by
    <math|<around|\<\|\|\>|<around|(|E<around|(|A|)>*A*y|)><around|(|0|)>|\<\|\|\>><rsup|2>>.
    This definition of spectrum was given in <cite|Priestley>.
  </remark>

  We now give sufficient conditions for a deformed stationary curve

  <\equation>
    x<around*|(|t|)>=<around|(|A*y|)><around|(|t|)>
  </equation>

  \ to be purely nondeterministic.

  <\corollary>
    <label|cor:nondeterministic>Let <math|x> be a deformed stationary curve
    of the form <eqref|stationaryCurve>. If <math|y> is purely
    nondeterministic and

    <\equation>
      <around|(|A*H<rsub|y>|)><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    then <math|x> is purely nondeterministic.
  </corollary>

  <\corollary>
    <label|cor:equivalence>Let <math|x> be a deformed stationary curve of the
    form <eqref|stationaryCurve> and

    <\enumerate>
      <item><math|<around|(|A*H<rsub|y>|)><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>>

      <item><math|<around|(|A\|<rsub|H<rsub|y>>|)><around|(|t|)>> is
      invertible

      <item><math|<around|(|A<rsub|t><rsup|-1>*H<rsub|y>|)><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>>
    </enumerate>

    <math|\<forall\>t\<in\>\<bbb-R\>> then <math|x> is purely
    nondeterministic if and only if <math|y> is purely nondeterministic.
  </corollary>

  <\corollary>
    <label|cor:multiplicity>Under the same assumptions as in Corollary
    <reference|cor:equivalence>, <math|x<around|(|t|)>> has multiplicity one
    in the sense of Cramér <cite|Cramer>.
  </corollary>

  <\corollary>
    <dueto|Moving average representation><label|cor:moving_avg>Let
    <math|x<around*|(|t|)>> be a deformed stationary curve with associated
    stationary curve purely nondeterministic. Assume that
    <math|A<around|(|t|)>> satisfies the assumptions of Corollary
    <reference|cor:nondeterministic>. Then

    <\enumerate>
      <item><math|y<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>f*<around|(|t-u|)>*d*\<xi\><around|(|u|)>>
      where <math|\<xi\><around|(|\<cdummy\>|)>> is a c.a. set function with
      values in <math|H<rsub|y>*<around|(|+\<infty\>|)>> such that

      <\equation>
        H<rsub|y><around|(|t|)>=\<cal-S\><around|{|\<xi\><around|(|A|)>,A\<in\>B<around|(|R|)>,A\<subset\><around|(|-\<infty\>,t|]>|}>\<forall\>A,A<rprime|'>\<in\>B<around|(|R|)>
      </equation>

      for

      <\equation>
        <around|(|\<xi\><around|(|A|)>,\<xi\><around|(|A<rprime|'>|)>|)>=c*\<mu\>*<around|(|A\<cap\>A<rprime|'>|)>
      </equation>

      with <math|\<mu\>> being the Lebesgue measure and

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|0><around|\||f<around|(|u|)>|\|><rsup|2>*d*\<mu\><around|(|u|)>\<less\>\<infty\><label|eq:f_integral>
      </equation>

      <item><math|x<around*|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>h<around|(|t,u|)>*d*\<xi\><around|(|u|)>>
      where <math|\<xi\>> is as in (a).
    </enumerate>
  </corollary>

  <\proof>
    (a) is due to Karhunen <cite|Karhunen>.

    (b) From the fact <math|x<around|(|t|)>\<in\>\<cal-S\><around|{|\<xi\><around|(|A|)>,A\<in\>B<around|(|R|)>,A\<subset\><around|(|-\<infty\>,t|]>|}>>
    we get

    <\equation>
      x<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>h<around|(|t,u|)>*d*\<xi\><around|(|u|)><label|eq:x_moving_avg>
    </equation>
  </proof>

  Corollaries <reference|cor:nondeterministic> and <reference|cor:moving_avg>
  give generalizations of the main results of <cite|Abdrabbo> to the deformed
  stationary curves. The identification of the representation in Corollary
  <reference|cor:moving_avg>(b) under additional conditions of
  <cite|Abdrabbo>, pp. 572-573, is trivial and hence omitted.

  <\remark>
    <label|rem:discrete>The discrete parameter case can be handled in a
    parallel way. All one needs is again the Stone-von Neumann theorem on
    commutants <cite|Masani>.
  </remark>

  <with|font-series|bold|Note A.> We note here that our definition of
  oscillatory processes differs from that of <cite|Priestley>. The class of
  oscillatory processes defined in <cite|Priestley> included an extra
  condition that the modulus of the Fourier transform of
  <math|a<rsub|t><around|(|\<lambda\>|)>> must have an absolute maximum of
  zero frequency. This problem is connected with the uniqueness of the
  representation in Theorem <reference|thm:characterization> and is connected
  with the spectral analysis of the process as a time series. It has however
  no bearing on the prediction problem studied here and hence our results
  here do include the results in <cite|Abdrabbo>.

  <with|font-series|bold|Acknowledgement.> I would like to thank the referee
  for comments which led to the addition of Note A which clarifies the
  relation of this paper to <cite|Priestley>.

  <\thebibliography|9>
    <bibitem|Abdrabbo>N. A. Abdrabbo and M. B. Priestley, On the prediction
    of non-stationary processes, J. Roy. Statist. Soc. Ser. B 29 (1967),
    570-585. MR 36 #4758.

    <bibitem|Cramer>H. Cramér, Stochastic processes as curves in Hilbert
    space, Teor. Verojatnost. i Primenen. 9 (1964), 193-204. MR 30 #613.

    <bibitem|Doob>J. L. Doob, Stochastic processes, Wiley, New York, 1953. MR
    15, 445.

    <bibitem|Dunford>N. Dunford and J. T. Schwartz, Linear operators. II:
    Spectral theory. Self adjoint operators in Hilbert space, Interscience,
    New York, 1963. MR 32 #6181.

    <bibitem|Karhunen>K. Karhunen, Über lineare Methoden in der
    Wahrscheinlichkeitsrechnung, Ann. Acad. Sci. Fenn. Ser. A.I. Math.-Phys.
    No. 37 (1947), 79 pp. MR 9, 292.

    <bibitem|Kolmogorov>A. N. Kolmogorov, Stationary sequences in Hilbert's
    space, Bull. Moskov. Gos. Univ. Mat. 2 (1941), no. 6, 40 pp. (Russian) MR
    5, 101; 13, 1138.

    <bibitem|Masani>P. Masani, The normality of time-invariant, subordinative
    operators in a Hilbert space, Bull. Amer. Math. Soc. 71 (1965), 546-550.
    MR 31 #1567.

    <bibitem|Priestley>M. B. Priestley, Evolutionary spectra and
    non-stationary processes, J. Roy. Statist. Soc. Ser. B 27 (1965),
    204-237. MR 33 #8026.

    <bibitem|Riesz>F. Riesz and B. Sz.-Nagy, Leçons d'analyse fonctionnelle,
    Akad. Kiadó, Budapest, 1953; English transl., Ungar, New York, 1955. MR
    14, 286; MR 17, 175.
  </thebibliography>

  \;
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
    <associate|U|<tuple|1|2>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|2|6>>
    <associate|auto-4|<tuple|14|10>>
    <associate|bib-Abdrabbo|<tuple|Abdrabbo|10>>
    <associate|bib-Cramer|<tuple|Cramer|10>>
    <associate|bib-Doob|<tuple|Doob|10>>
    <associate|bib-Dunford|<tuple|Dunford|10>>
    <associate|bib-Karhunen|<tuple|Karhunen|10>>
    <associate|bib-Kolmogorov|<tuple|Kolmogorov|10>>
    <associate|bib-Masani|<tuple|Masani|10>>
    <associate|bib-Priestley|<tuple|Priestley|10>>
    <associate|bib-Riesz|<tuple|Riesz|10>>
    <associate|cor:equivalence|<tuple|11|9>>
    <associate|cor:moving_avg|<tuple|13|9>>
    <associate|cor:multiplicity|<tuple|12|9>>
    <associate|cor:nondeterministic|<tuple|10|9>>
    <associate|def:curves|<tuple|2|3>>
    <associate|def:unitary_group|<tuple|1|2>>
    <associate|eq:A_def|<tuple|36|7>>
    <associate|eq:A_def_converse|<tuple|43|8>>
    <associate|eq:At_yt|<tuple|39|8>>
    <associate|eq:f_integral|<tuple|52|9>>
    <associate|eq:oscillatory|<tuple|24|6>>
    <associate|eq:rho|<tuple|26|6>>
    <associate|eq:shift_group|<tuple|6|3>>
    <associate|eq:subspace1|<tuple|8|4>>
    <associate|eq:subspace2|<tuple|9|4>>
    <associate|eq:subspace3|<tuple|10|4>>
    <associate|eq:unitary_group|<tuple|35|7>>
    <associate|eq:x_moving_avg|<tuple|53|9>>
    <associate|eq:xt_spectral|<tuple|46|8>>
    <associate|eq:y_def|<tuple|4|3>>
    <associate|rem:discrete|<tuple|14|10>>
    <associate|rem:spectrum|<tuple|9|8>>
    <associate|sol|<tuple|3|4>>
    <associate|stationaryCurve|<tuple|2|3>>
    <associate|thm:characterization|<tuple|8|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Kolmogorov

      Cramer

      Priestley

      Abdrabbo

      Doob

      Riesz

      Priestley

      Doob

      Riesz

      Dunford

      Masani

      Dunford

      Priestley

      Cramer

      Karhunen

      Abdrabbo

      Abdrabbo

      Masani

      Priestley

      Priestley

      Abdrabbo

      Priestley
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Defintions and Preliminaries
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes as Stationary Deformed Curves>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>