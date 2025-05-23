<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A CHARACTERIZATION OF OSCILLATORY PROCESSES AND THEIR
  PREDICTION>|<doc-author|<author-data|<author-name|V.
  Mandrekar>|<author-misc|Research supported by NSF Grant
  GP-11626.>>>|<doc-date|Received by the editors April 26, 1971.>>

  <abstract-data|<\abstract>
    The oscillatory stochastic processes recently studied by Priestley are
    characterized as deformed stationary curves in a Hilbert space. This
    characterization leads to the simple time domain proof of prediction and
    moving average representation for these stochastic processes in terms of
    the associated stationary curve.
  </abstract>>

  In <cite|Kolmogorov>, A. N. Kolmogorov studied second order stationary
  processes as curves in Hilbert space. The idea again occurred in Cram�r
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

  <\definition>
    <label|def:curves>Let <math|H> be a Hilbert-space and <math|R> be the
    space of real numbers with the usual topology. We say that:

    <\enumerate>
      <item><math|x> is a continuous curve in <math|H>, if <math|x> is a
      continuous map of <math|R> into <math|H>.

      <item><math|y> is a stationary continuous curve in <math|H>, if

      <\enumerate-roman>
        <item><math|y> is a continuous curve in <math|H>

        <item><math|<around*|(|y<around*|(|t|)>,y<around*|(|s|)>|)>> is a
        function of <math|t-s>
      </enumerate-roman>
    </enumerate>
  </definition>

  With every curve <math|x> in <math|H> we associate the following subspaces
  of <math|H>:

  <\align>
    <tformat|<table|<row|<cell|H<rsub|x><around|(|t|)>>|<cell|=\<cal-S\><around|{|x<around|(|\<tau\>|)>,\<tau\>\<leq\>t|}>,<eq-number><label|eq:subspace1>>>|<row|<cell|H<rsub|x>*<around|(|+\<infty\>|)>>|<cell|=\<cal-S\><around|{|x<around|(|\<tau\>|)>,\<tau\>\<in\>R|}>,<eq-number><label|eq:subspace2>>>|<row|<cell|H<rsub|x>*<around|(|-\<infty\>|)>>|<cell|=<big|cap><rsub|t>H<rsub|x><around|(|t|)><eq-number><label|eq:subspace3>>>>>
  </align>

  where <math|\<cal-S\><around|{|\<cdummy\>|}>> denotes the subspace
  generated by vectors.

  If the curve is continuous <math|H<rsub|x>*<around|(|+\<infty\>|)>> is
  separable. We say that a curve <math|x> in <math|H> is <em|purely
  nondeterministic> if <math|H<rsub|x>*<around|(|-\<infty\>|)>=<around|{|0|}>>
  and is said to be a <em|deformed stationary curve> if there exists a
  stationary continuous curve <math|y> in <math|H> and for each
  <math|t\<in\>R>, <math|A<around|(|t|)>> on
  <math|H<rsub|y>*<around|(|+\<infty\>|)>> into
  <math|H<rsub|y>*<around|(|+\<infty\>|)>> such that

  <\itemize>
    <item*|(a)><math|<math-up|Dom><around|(|A<around|(|t|)>|)>\<supset\><around|{|y<around|(|s|)>,-\<infty\>\<less\>s\<less\>+\<infty\>|}>>,

    <item*|(b)><math|x<around|(|t|)>=A<around|(|t|)>*y<around|(|t|)>,<space|1em>t\<in\>R>.
  </itemize>

  If <math|H=L<rsub|2><around|(|\<Omega\>,P|)>> the space of
  square-integrable functions with respect to <math|P>, the oscillatory
  processes are defined in <cite|Priestley> (see Note A below) as

  <\equation>
    x<rsub|t>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*a<rsub|t><around|(|u|)>*Z*<around|(|d*u|)><label|eq:oscillatory>
  </equation>

  where

  <\enumerate>
    <item><math|Z<around|(|\<cdummy\>|)>> is an orthogonal countably additive
    (c.a.) set function with values in <math|H>,

    <item>the integral in <eqref|eq:oscillatory> is the stochastic integral
    (Doob <cite|Doob>, p. 208),

    <item>for each <math|t\<in\>R>, <math|<big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||a<rsub|t><around|(|u|)>|\|><rsup|2>*\<rho\>*<around|(|d*u|)>\<less\>\<infty\>>
    where
  </enumerate>

  <\equation>
    \<rho\><around|(|A|)>=<around|(|Z<around|(|A|)>,Z<around|(|A|)>|)><rsub|L<rsub|2><around|(|\<Omega\>|)>><label|eq:rho>
  </equation>

  for <math|A\<in\>B<around|(|R|)>>, Borel subsets of <math|R>.

  Let us now define

  <\equation>
    y<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*Z*<around|(|d*u|)><label|eq:y_def>
  </equation>

  Then clearly <cite|Doob>, p. 526, <math|y> is a stationary continuous curve
  in <math|H>. Using Stone's Theorem <cite|Riesz>, p. 383, and uniqueness of
  the Fourier representation one obtains <math|Z<around|(|A|)>=E<around|(|A|)>*y<rsub|0>>
  for <math|A\<in\>B<around|(|R|)>>, where <math|E> is the spectral measure
  associated with the shift group defined for each <math|s\<in\>R> by

  <\equation>
    U<rsub|t>*y<around|(|s|)>=y*<around|(|t+s|)>,<space|1em>t\<in\>R<label|eq:shift_group>
  </equation>

  on <math|H<rsub|y>*<around|(|+\<infty\>|)>> into
  <math|H<rsub|y>*<around|(|+\<infty\>|)>>. Furthermore
  <math|H<rsub|y>*<around|(|+\<infty\>|)>=\<cal-S\><around|{|U<rsub|t>*y<rsub|0>,t\<in\>R|}>>.

  The following is our characterization of oscillatory processes.

  <\theorem>
    <label|thm:characterization><math|x> is an oscillatory curve in <math|H>
    if and only if <math|x> is a deformed stationary curve such that for each
    <math|t>, <math|A<around|(|t|)>*U<rsub|s>*h=U<rsub|s>*A<around|(|t|)>*h>,
    for <math|h\<in\><math-up|Dom><around|(|A<around|(|t|)>|)>> and for all
    <math|s\<in\>R>.
  </theorem>

  <\proof>
    Let <math|x<rsub|t>> be oscillatory. Then <math|y<around|(|t|)>> defined
    in <eqref|eq:y_def> is a continuous stationary curve. Furthermore
    <math|y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0>>
    where <math|E<around|(|\<cdummy\>|)>> is the spectral measure associated
    with a continuous unitary group

    <\equation>
      <around|{|U<rsub|t>,-\<infty\>\<less\>t\<less\>+\<infty\>|}><label|eq:unitary_group>
    </equation>

    given in <eqref|eq:shift_group> (<cite|Riesz>, p. 383). Define, for each
    <math|t\<in\>R>,

    <\equation>
      A<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|u|)>*E*<around|(|d*u|)><label|eq:A_def>
    </equation>

    Then by <cite|Dunford>, p. 1196, <math|A<around|(|t|)>> is closed. For
    each <math|t>, <math|<math-up|Dom><around|(|A<around|(|t|)>|)>\<supset\><around|{|y<around|(|s|)>,s\<in\>R|}>>.
    By the definition of the spectral integral and the fact
    <math|U<rsub|s>*E<around|(|A|)>=E<around|(|A|)>*U<rsub|s>> for
    <math|A\<in\>B<around|(|R|)>>, we obtain that, for each <math|t\<in\>R>,
    <math|A<around|(|t|)>*U<rsub|s>*h=U<rsub|s>*A<around|(|t|)>*h> for
    <math|h\<in\><math-up|Dom><around|(|A<around|(|t|)>|)>> and for all
    <math|s\<in\>R>. Furthermore,

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t|)>*y<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|u|)>*E*<around|(|d*u|)><around*|[|<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0>|]><eq-number><label|eq:At_yt>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|u|)>*e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0>=x<rsub|t>>>>>
    </align>

    since <math|E<around|(|A|)>*<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0>=<big|int><rsub|A>e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0>,A\<in\>B<around|(|R|)>>.

    To prove the converse, we observe that since
    <math|A<around|(|t|)>*U<rsub|s>*h=U<rsub|s>*A<around|(|t|)>*h> for
    <math|h\<in\><math-up|Dom><around|(|A<around|(|t|)>|)>\<supseteq\><around|{|y<around|(|t|)>,-\<infty\>\<less\>t\<less\>+\<infty\>|}>>
    and <math|H<rsub|y>*<around|(|+\<infty\>|)>=\<cal-S\><around|{|U<rsub|s>*y<rsub|0>,s\<in\>R|}>>
    we obtain by <cite|Masani>, p. 549, that there exists Borel measurable
    function <math|a<rsub|t><around|(|\<cdummy\>|)>> such that

    <\equation>
      A<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|u|)>*E*<around|(|d*u|)><label|eq:A_def_converse>
    </equation>

    The fact that <math|<math-up|Dom><around|(|A<around|(|t|)>|)>\<supseteq\><around|{|y<around|(|t|)>,-\<infty\>\<less\>t\<less\>+\<infty\>|}>>
    <cite|Dunford>, p. 1196, implies, for each <math|t\<in\>R>,
    <math|<big|int><rsub|-\<infty\>><rsup|+\<infty\>><around|\||a<rsub|t><around|(|u|)>|\|><rsup|2>*<around|\<\|\|\>|E*<around|(|d*u|)>*y<rsub|0>|\<\|\|\>><rsup|2>\<less\>\<infty\>>.
    Hence we obtain

    <\align>
      <tformat|<table|<row|<cell|x<rsub|t>>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>a<rsub|t><around|(|u|)>*E*<around|(|d*u|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*E*<around|(|d*u|)>*y<rsub|0><eq-number><label|eq:xt_spectral>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|+\<infty\>>e<rsup|i*t*u>*a<rsub|t><around|(|u|)>*E*<around|(|d*u|)>*y<rsub|0>>>>>
    </align>

    giving <math|x<rsub|t>> oscillatory.
  </proof>

  <\remark>
    <label|rem:spectrum>We now observe that since
    <math|x<rsub|t>=U<rsub|t>*A<around|(|t|)>*y<rsub|0>> the spectrum of
    <math|x<rsub|t>> is given by <math|<around|\<\|\|\>|E<around|(|A|)>*A<around|(|t|)>*y<rsub|0>|\<\|\|\>><rsup|2>>.
    This definition of spectrum was given in <cite|Priestley>.
  </remark>

  We now give sufficient conditions for a deformed stationary curve
  <math|x=A<around|(|\<cdummy\>|)>*y> to be purely nondeterministic.

  <\corollary>
    <label|cor:nondeterministic>Let <math|x> be a deformed stationary curve
    of the form <eqref|eq:deformed_b>. If <math|y> is purely nondeterministic
    and, for each <math|t>, <math|A<around|(|t|)>*H<rsub|y><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>>,
    then <math|x> is purely nondeterministic.
  </corollary>

  <\corollary>
    <label|cor:equivalence>Let <math|x> be a deformed stationary curve of the
    form <eqref|eq:deformed_b>. Assume that for each <math|t\<in\>R>,

    <\enumerate>
      <item><math|A<around|(|t|)>*H<rsub|y><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>>

      <item><math|A<around|(|t|)>\|<rsub|H<rsub|y><around|(|t|)>>> is
      invertible

      <item><math|A<rsub|t><rsup|-1>*H<rsub|y><around|(|t|)>\<subseteq\>H<rsub|y><around|(|t|)>>
    </enumerate>

    then <math|x> is purely nondeterministic if and only if <math|y> is
    purely nondeterministic.
  </corollary>

  <\corollary>
    <label|cor:multiplicity>Under the same assumptions as in Corollary
    <reference|cor:equivalence>, <math|x<around|(|t|)>> has multiplicity one
    in the sense of Cram�r <cite|Cramer>.
  </corollary>

  <\corollary>
    [Moving average representation]<label|cor:moving_avg> Let <math|x> be a
    deformed stationary curve with associated stationary curve purely
    nondeterministic. Assume that <math|A<around|(|t|)>> satisfies the
    assumptions of Corollary <reference|cor:nondeterministic>. Then

    <\enumerate>
      <item><math|y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|t>f*<around|(|t-u|)>*\<xi\>*<around|(|d*u|)>>
      where <math|\<xi\><around|(|\<cdummy\>|)>> is a c.a. set function with
      values in <math|H<rsub|y>*<around|(|+\<infty\>|)>> such that
      <math|H<rsub|y><around|(|t|)>=\<cal-S\><around|{|\<xi\><around|(|A|)>,A\<in\>B<around|(|R|)>,A\<subset\><around|(|-\<infty\>,t|]>|}>>;
      for <math|A,A<rprime|'>\<in\>B<around|(|R|)>>

      <\equation>
        <around|(|\<xi\><around|(|A|)>,\<xi\><around|(|A<rprime|'>|)>|)>=c*\<mu\>*<around|(|A\<cap\>A<rprime|'>|)>
      </equation>

      \ with <math|\<mu\>> being the Lebesgue measure and

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|0><around|\||f<around|(|u|)>|\|><rsup|2>*\<mu\>*<around|(|d*u|)>\<less\>\<infty\><label|eq:f_integral>
      </equation>

      <item><math|x<rsub|t>=<big|int><rsub|-\<infty\>><rsup|t>h<around|(|t,u|)>*\<xi\>*<around|(|d*u|)>>
      where <math|\<xi\>> is as in (a).
    </enumerate>
  </corollary>

  <\proof>
    (a) is due to Karhunen <cite|Karhunen>.

    (b) From the fact, <math|x<around|(|t|)>\<in\>\<cal-S\><around|{|\<xi\><around|(|A|)>,A\<in\>B<around|(|R|)>,A\<subset\><around|(|-\<infty\>,t|]>|}>>
    we get

    <\equation>
      x<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>h<around|(|t,u|)>*\<xi\>*<around|(|d*u|)><label|eq:x_moving_avg>
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
  <math|a<rsub|t><around|(|u|)>> must have an absolute maximum of zero
  frequency. This problem is connected with the uniqueness of the
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

    <bibitem|Cramer>H. Cram�r, Stochastic processes as curves in Hilbert
    space, Teor. Verojatnost. i Primenen. 9 (1964), 193-204. MR 30 #613.

    <bibitem|Doob>J. L. Doob, Stochastic processes, Wiley, New York, 1953. MR
    15, 445.

    <bibitem|Dunford>N. Dunford and J. T. Schwartz, Linear operators. II:
    Spectral theory. Self adjoint operators in Hilbert space, Interscience,
    New York, 1963. MR 32 #6181.

    <bibitem|Karhunen>K. Karhunen, �ber lineare Methoden in der
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

    <bibitem|Riesz>F. Riesz and B. Sz.-Nagy, Le�ons d'analyse fonctionnelle,
    Akad. Kiad�, Budapest, 1953; English transl., Ungar, New York, 1955. MR
    14, 286; MR 17, 175.
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
    <associate|auto-1|<tuple|8|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Abdrabbo|<tuple|Abdrabbo|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Cramer|<tuple|Cramer|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Doob|<tuple|Doob|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Dunford|<tuple|Dunford|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Karhunen|<tuple|Karhunen|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Kolmogorov|<tuple|Kolmogorov|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Masani|<tuple|Masani|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Priestley|<tuple|Priestley|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Riesz|<tuple|Riesz|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:equivalence|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:moving_avg|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:multiplicity|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:nondeterministic|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:curves|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:A_def|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:A_def_converse|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:At_yt|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:f_integral|<tuple|14|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:oscillatory|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:rho|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:shift_group|<tuple|7|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:subspace1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:subspace2|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:subspace3|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:unitary_group|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:x_moving_avg|<tuple|15|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:xt_spectral|<tuple|12|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:y_def|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|rem:discrete|<tuple|8|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|rem:spectrum|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:characterization|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Kolmogorov

      Cramer

      Priestley

      Abdrabbo

      Priestley

      Doob

      Doob

      Riesz

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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>