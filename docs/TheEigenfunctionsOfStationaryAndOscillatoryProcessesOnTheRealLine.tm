<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <section*|Introduction>

  Oscillatory processes generalize stationary stochastic processes by
  allowing their spectral properties to evolve over time. Central to this
  representation is the gain function <math|A<around|(|t,\<omega\>|)>>, a
  complex-valued function that works in conjunction with an underlying
  spectral density <math|S<around|(|\<omega\>|)>> to produce time-varying
  spectral characteristics. The magnitude
  <math|<around|\<lvert\>|A<around|(|t,\<omega\>|)>|\<rvert\>>> scales the
  spectral power at each frequency and time, while the argument <math|arg
  A<around|(|t,\<omega\>|)>> introduces frequency-dependent phase shifts. The
  effective spectral density at time <math|t> becomes
  <math|<around|\<lvert\>|A<around|(|t,\<omega\>|)>|\<rvert\>><rsup|2>*S<around|(|\<omega\>|)>>,
  showing how the gain function and underlying spectral density work together
  multiplicatively.

  <\definition>
    <dueto|Stationary Process>A stochastic process
    <math|<around|{|X<around|(|t|)>,<space|0.17em>t\<in\>\<bbb-R\>|}>> is
    stationary when its covariance <math|R<around|(|s,t|)>> depends only on
    the lag: <math|R<around|(|s,t|)>=R*<around|(|t-s|)>> for all
    <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    <dueto|Complex orthogonal random measure>Let
    <math|<around|(|E,\<cal-E\>|)>> be a measurable space. A complex
    orthogonal random measure is a map <math|\<Phi\>:\<cal-E\>\<to\>L<rsup|2><around|(|\<Omega\>;\<bbb-C\>|)>>
    such that:

    <\enumerate>
      <item>(Null and <math|\<sigma\>>-additivity in <math|L<rsup|2>>)
      <math|\<Phi\><around|(|\<varnothing\>|)>=0>,
      <math|\<Phi\>*<around|(|A\<cup\>B|)>=\<Phi\><around|(|A|)>+\<Phi\><around|(|B|)>>
      for disjoint <math|A,B\<in\>\<cal-E\>>, and for any disjoint sequence
      <math|<around|(|A<rsub|n>|)><rsub|n\<ge\>1>\<subset\>\<cal-E\>>,

      <\equation*>
        \<Phi\><space|-0.17em><around*|(|<big|cup><rsub|n\<ge\>1>A<rsub|n>|)>=<big|sum><rsub|n\<ge\>1>\<Phi\><around|(|A<rsub|n>|)>*<space|1em><text|in
        >L<rsup|2>.
      </equation*>

      <item>(Zero mean and covariance) There exists a finite measure
      <math|\<mu\>> on <math|<around|(|E,\<cal-E\>|)>> such that, for all
      <math|A,B\<in\>\<cal-E\>>,

      <\equation*>
        \<bbb-E\><around|[|\<Phi\><around|(|A|)>|]>=0,<space|2em>\<bbb-E\><around*|[|\<Phi\><around|(|A|)><space|0.17em><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>=\<mu\>*<around|(|A\<cap\>B|)>.
      </equation*>
    </enumerate>

    In particular, for all <math|A\<in\>\<cal-E\>>,
    <math|\<bbb-E\><around|[|<around|\||\<Phi\><around|(|A|)>|\|><rsup|2>|]>=\<mu\><around|(|A|)>>,
    and for disjoint <math|A,B> the increments are orthogonal in
    <math|L<rsup|2>>.
  </definition>

  <\theorem>
    <dueto|Spectral Representation of Oscillatory Processes>A realization of
    an oscillatory process <math|Z<around|(|t|)>> is one that satisfies

    <\equation>
      <label|eq:osc-rep>Z<around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>X<around|(|u|)>*<space|0.17em>d*u,
    </equation>

    where <math|A<rsub|t><around|(|\<omega\>|)>> is a gain function and
    <math|\<Phi\>> is a complex orthogonal random measure. The stationary
    reference process is

    <\equation>
      <label|eq:X-stationary>X<around|(|u|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>.
    </equation>

    In the sense of Priestley's canonical definition, the oscillatory kernel
    <math|h> and the gain <math|A<rsub|t>> form a Fourier pair (in the sense
    of distributions) with the convention

    <\equation>
      <label|eq:h-A-pair>h<around|(|t,u|)><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*\<lambda\>,<space|2em>A<rsub|t><around|(|\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*u.
    </equation>

    If <math|Z> is real-valued, the conjugate symmetry conditions hold:

    <\equation>
      <label|eq:real-sym>A<rsub|t><around|(|\<omega\>|)><space|0.27em>=<space|0.27em>A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>,<space|2em>d*\<Phi\>*<around|(|-\<omega\>|)><space|0.27em>=<space|0.27em>d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation>
  </theorem>

  <\proof>
    Using <eqref|eq:X-stationary> and Fubini/Tonelli in <math|L<rsup|2>>,

    <\align*>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>X<around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>|)>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|i*\<omega\>*u>*<space|0.17em>d*u*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>.>>>>
    </align*>

    By the canonical Fourier relation <eqref|eq:h-A-pair>,

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|i*\<omega\>*u>*<space|0.17em>d*u=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><space|-0.17em><space|-0.17em><space|-0.17em>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>-\<lambda\>|)>*u>*<space|0.17em>d*u|)>*d*\<lambda\>=A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>.
    </equation*>

    Therefore <math|Z<around|(|t|)>=<big|int>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>,
    proving <eqref|eq:osc-rep>. Real-valuedness follows from
    <eqref|eq:real-sym> by a standard change of variables.
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Stationary Processes>Let
    <math|R<around|(|\<tau\>|)>> be a stationary covariance function and
    define the integral operator

    <\equation>
      <around|(|K*f|)><around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s.
    </equation>

    Then

    <\equation>
      K*<space|0.17em>e<rsup|i*\<omega\>*t><space|0.27em>=<space|0.27em>S<around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>,
    </equation>

    where the eigenvalue is the spectral density

    <\equation>
      S<around|(|\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>.
    </equation>
  </theorem>

  <\proof>
    <\align*>
      <tformat|<table|<row|<cell|<around|(|K*e<rsup|i*\<omega\>\<cdot\>>|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R*<around|(|t-s|)>*<space|0.17em>e<rsup|i*\<omega\>*s>*<space|0.17em>d*s=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|t-\<tau\>|)>>*<space|0.17em>d*\<tau\>>>|<row|<cell|>|<cell|=e<rsup|i*\<omega\>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>=S<around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>.>>>>
    </align*>
  </proof>

  <\theorem>
    <dueto|Eigenfunction Property for Oscillatory Processes>Assume absolute
    continuity: the spectral measure <math|d*F<around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>
    with <math|S<around|(|\<omega\>|)>\<ge\>0>. Let

    <\equation>
      C<around|(|s,t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<omega\>|)>*<space|0.17em>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>,<space|2em><around|(|K*f|)><around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s.
    </equation>

    Define the oscillatory functions

    <\equation>
      \<phi\><around|(|t,\<omega\>|)><space|0.27em>=<space|0.27em>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>.
    </equation>

    Suppose the time-orthogonality identity (in the sense of distributions)

    <\equation>
      <label|eq:time-orth><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*<space|0.17em>A<rsub|s><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*s>*<space|0.17em>d*s<space|0.27em>=<space|0.27em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<lambda\>|)>.
    </equation>

    Then, for each <math|\<omega\>>,

    <\equation>
      <label|eq:Kphi-eig><around|(|K*\<phi\>|(>\<cdot\>,\<omega\>))<around|(|t|)><space|0.27em>=<space|0.27em>S<around|(|\<omega\>|)>*<space|0.17em>\<phi\><around|(|t,\<omega\>|)>.
    </equation>
  </theorem>

  <\proof>
    <\align*>
      <tformat|<table|<row|<cell|<around|(|K*\<phi\>|(>\<cdot\>,\<omega\>))<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*<space|0.17em>\<phi\><around|(|s,\<omega\>|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*<space|0.17em>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>|)>*A<rsub|s><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*s>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>S<around|(|\<lambda\>|)><space|0.17em><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*<space|0.17em>A<rsub|s><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*s>*<space|0.17em>d*s|]>*d*\<lambda\>>>|<row|<cell|>|<cell|<above|=|<eqref|eq:time-orth>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>S<around|(|\<lambda\>|)>*<space|0.17em><around|(|2*\<pi\>|)>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>>>|<row|<cell|>|<cell|=2*\<pi\>*<space|0.17em>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>S<around|(|\<omega\>|)><space|0.27em>=<space|0.27em>S<around|(|\<omega\>|)>*<space|0.17em>\<phi\><around|(|t,\<omega\>|)>,>>>>
    </align*>

    where the last equality uses <math|\<phi\><around|(|t,\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    and the <math|2*\<pi\>> factor matches the Fourier normalization implicit
    in <eqref|eq:time-orth> and <eqref|eq:h-A-pair>.
  </proof>

  <\lemma>
    <dueto|Orthogonality Property>With the Fourier convention used above,

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><rsup|\<ast\>><around|(|\<lambda\>|)>*<space|0.17em>A<rsub|s><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*s>*<space|0.17em>d*s<space|0.27em>=<space|0.27em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<omega\>|)>.
    </equation*>
  </lemma>

  <\proof>
    For the orthogonal random measure <math|\<Phi\>>,

    <\equation*>
      \<bbb-E\>*<space|-0.17em><around*|[|d*\<Phi\><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>|]><space|0.27em>=<space|0.27em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*<space|0.17em>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>,
    </equation*>

    under the absolute continuity assumption
    <math|d*F<around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>
    and the chosen Fourier constants. The representation

    <\equation*>
      Z<around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>,
    </equation*>

    combined with this covariance structure, yields the stated
    time-orthogonality identity for the modulating amplitudes, consistent
    with the normalization used in <eqref|eq:h-A-pair>.
  </proof>

  <\theorem>
    <dueto|Real-Valued Oscillatory Processes>The process
    <math|Z<around|(|t|)>> is real-valued if and only if

    <\equation>
      A<rsub|t><around|(|\<omega\>|)><space|0.27em>=<space|0.27em>A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>*<space|2em><text|and><space|2em>d*\<Phi\>*<around|(|-\<omega\>|)><space|0.27em>=<space|0.27em>d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation>
  </theorem>

  <\proof>
    Compute

    <\equation*>
      Z<rsup|\<ast\>><around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*t>*<space|0.17em>d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)>.
    </equation*>

    Set <math|\<omega\>=-\<nu\>> so <math|d*\<omega\>=-d*\<nu\>>, then

    <\equation*>
      Z<rsup|\<ast\>><around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>>*<around|(|-\<nu\>|)>*<space|0.17em>e<rsup|i*\<nu\>*t>*<space|0.17em>d*\<Phi\><rsup|\<ast\>>*<around|(|-\<nu\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><rsup|\<ast\>>*<around|(|-\<omega\>|)>.
    </equation*>

    Thus <math|Z<around|(|t|)>=Z<rsup|\<ast\>><around|(|t|)>> for all
    <math|t> holds if and only if <math|A<rsub|t><around|(|\<omega\>|)>=A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>>
    and <math|d*\<Phi\><around|(|\<omega\>|)>=d*\<Phi\><rsup|\<ast\>>*<around|(|-\<omega\>|)>>
    for all <math|\<omega\>>. The converse direction is immediate by
    substitution.
  </proof>

  <\theorem>
    <dueto|Eigenfunction Conjugate Pairs>With
    <math|\<phi\><around|(|t,\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
    and <math|A<rsub|t><around|(|\<omega\>|)>=A<rsub|t><rsup|\<ast\>>*<around|(|-\<omega\>|)>>,

    <\equation*>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)><space|0.27em>=<space|0.27em>\<phi\><around|(|t,-\<omega\>|)>.
    </equation*>
  </theorem>

  <\proof>
    <\equation*>
      \<phi\><rsup|\<ast\>><around|(|t,\<omega\>|)><space|0.27em>=<space|0.27em><around*|(|A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>|)><rsup|\<ast\>><space|0.27em>=<space|0.27em>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*t><space|0.27em>=<space|0.27em>A<rsub|t>*<around|(|-\<omega\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*t><space|0.27em>=<space|0.27em>A<rsub|t>*<around|(|-\<omega\>|)>*<space|0.17em>e<rsup|i*<around|(|-\<omega\>|)>*t><space|0.27em>=<space|0.27em>\<phi\><around|(|t,-\<omega\>|)>.
    </equation*>
  </proof>

  <\theorem>
    <dueto|Filter Kernel: Dual Fourier Formula>With the Fourier convention
    fixed above,

    <\equation*>
      h<around|(|t,u|)><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*\<omega\><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*u>*<space|0.17em>d*\<omega\>.
    </equation*>
  </theorem>

  <\proof>
    <\equation*>
      <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t,\<omega\>|)>*<space|0.17em>e<rsup|-i*\<omega\>*u>*<space|0.17em>d*\<omega\><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*t>*<space|0.17em>e<rsup|-i*\<omega\>*u>*<space|0.17em>d*\<omega\><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*\<omega\>.
    </equation*>
  </proof>

  <\theorem>
    <dueto|Inverse Relations>

    <\equation>
      A<rsub|t><around|(|\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*u,<space|2em>\<phi\><around|(|t,\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<omega\>*u>*<space|0.17em>d*u.
    </equation>
  </theorem>

  <\proof>
    Using the dual formula and the identity
    <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<lambda\>-\<omega\>|)>*u>*<space|0.17em>d*u=2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<omega\>|)>>,

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*u>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*\<lambda\>|]>*e<rsup|-i*\<omega\>*<around|(|t-u|)>>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*e<rsup|-i*\<omega\>*t><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*<around|(|\<lambda\>-\<omega\>|)>*u>*<space|0.17em>d*u|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*e<rsup|-i*\<omega\>*t>*<space|0.17em>2*\<pi\>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<omega\>|)>*<space|0.17em>d*\<lambda\>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<omega\>|)>.>>>>
    </align*>

    The formula for <math|\<phi\><around|(|t,\<omega\>|)>> follows by
    multiplying both sides by <math|e<rsup|i*\<omega\>*t>> or directly from
    the dual formula.
  </proof>
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
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:Kphi-eig|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:X-stationary|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:h-A-pair|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:osc-rep|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:real-sym|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:time-orth|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>