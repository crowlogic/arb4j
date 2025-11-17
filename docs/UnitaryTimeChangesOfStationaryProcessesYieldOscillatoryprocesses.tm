<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are locally square-integrable
    (meaning over compact sets). Applying <math|U<rsub|\<theta\>>> to the
    Cramér spectral representation of a stationary process yields an
    oscillatory process in the sense of Priestley with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
    evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>,
    and expected zero-counting function <math|\<bbb-E\><around|[|N<rsub|<around|[|0,T|]>>|]>=<frac|<around|[|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|]>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>.
    The sample paths of any non-degenerate second-order stationary process
    are locally square integrable, making the unitary time-change operator
    <math|U<rsub|\<theta\>>> applicable to typical realizations. A
    zero-localization measure <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of each oscillatory process realization <math|Z<around|(|t|)>>, and
    the multiplication operator <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>>
    has simple pure point spectrum equal to the zero crossing set of
    <math|Z>.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes and Simplicity of Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Definition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Stationary processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc>Fourier Transform Conventions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|1.2.2<space|2spc>Sample Path Realizations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Unitary Time-Change Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Transformation of Stationary to
    Oscillatory Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|3.2.1<space|2spc>Time-Varying Filter Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.3<space|2spc>Covariance Operator Conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Expected Zero-Counting Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes and Simplicity of Zeros>

  <\theorem>
    [Bulinskaya]<label|thm:bulinskaya> Let <math|X<around|(|t|)>> be a
    centered stationary Gaussian process with covariance function
    <math|K<around|(|h|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X*<around|(|t+h|)>|]>>
    twice differentiable at <math|h=0> with <math|K<around|(|0|)>\<gtr\>0>
    and <math|<wide|K|\<ddot\>><around|(|0|)>\<less\>0>. Then all zeros of
    <math|X> are simple: for every <math|t<rsub|0>> such that
    <math|X<around|(|t<rsub|0>|)>=0>, it follows that
    <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0>.
  </theorem>

  <\proof>
    The twice-differentiability of <math|K> at <math|h=0> implies that the
    spectral measure <math|F> possesses a finite second moment. Define

    <\equation>
      \<sigma\><rsub|1><rsup|2>\<assign\><big|int><rsub|\<bbb-R\>>\<lambda\><rsup|2>*d*F<around|(|\<lambda\>|)>
    </equation>

    By properties of stationary Gaussian processes,

    <\equation>
      \<sigma\><rsub|1><rsup|2>=-<wide|K|\<ddot\>><around|(|0|)>\<less\>\<infty\>
    </equation>

    The finiteness of <math|\<sigma\><rsub|1><rsup|2>> guarantees the
    existence of a mean-square continuous derivative
    <math|<wide|X|\<dot\>><around|(|t|)>> with

    <\equation>
      \<bbb-E\><around|[|<wide|X|\<dot\>><around|(|t|)><rsup|2>|]>=-<wide|K|\<ddot\>><around|(|0|)>=\<sigma\><rsub|1><rsup|2>\<gtr\>0
    </equation>

    For any fixed <math|t>, the joint distribution of
    <math|<around|(|X<around|(|t|)>,<wide|X|\<dot\>><around|(|t|)>|)>> is
    bivariate Gaussian. The covariance kernel <math|K<around|(|h|)>> is even
    by stationarity, so <math|<wide|K|\<dot\>><around|(|0|)>=0>. Therefore,
    the covariance matrix is

    <\equation>
      \<Sigma\><around|(|t|)>=<matrix|<tformat|<table|<row|<cell|K<around|(|0|)>>|<cell|<wide|K|\<dot\>><around|(|0|)>>>|<row|<cell|<wide|K|\<dot\>><around|(|0|)>>|<cell|-<wide|K|\<ddot\>><around|(|0|)>>>>>>=<matrix|<tformat|<table|<row|<cell|K<around|(|0|)>>|<cell|0>>|<row|<cell|0>|<cell|-<wide|K|\<ddot\>><around|(|0|)>>>>>>
    </equation>

    The determinant of <math|\<Sigma\><around|(|t|)>> is

    <\equation>
      det <around|(|\<Sigma\><around|(|t|)>|)>=K<around|(|0|)>\<cdot\><around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>\<gtr\>0
    </equation>

    so <math|\<Sigma\><around|(|t|)>> is positive definite.

    The inverse matrix is

    <\equation>
      \<Sigma\><around|(|t|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|1|K<around|(|0|)>>>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|-<wide|K|\<ddot\>><around|(|0|)>>>>>>>
    </equation>

    The joint density of <math|<around|(|X<around|(|t|)>,<wide|X|\<dot\>><around|(|t|)>|)>>
    is

    <\equation>
      p<around|(|x,y;t|)>=<frac|1|2*\<pi\>*<sqrt|det
      <around|(|\<Sigma\><around|(|t|)>|)>>>*exp
      <around*|(|-<frac|1|2>*<around|(|x,y|)>*\<Sigma\><around|(|t|)><rsup|-1><around|(|x,y|)><rsup|T>|)>
    </equation>

    Substituting the explicit forms:

    <\equation>
      p<around|(|x,y;t|)>=<frac|1|2*\<pi\>*<sqrt|K<around|(|0|)>\<cdot\><around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>>*exp
      <around*|(|-<frac|1|2>*<around*|[|<frac|x<rsup|2>|K<around|(|0|)>>+<frac|y<rsup|2>|-<wide|K|\<ddot\>><around|(|0|)>>|]>|)>
    </equation>

    The marginal density of <math|X<around|(|t|)>> is obtained by integrating
    over <math|y>:

    <\equation>
      p<rsub|X><around|(|x;t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<around|(|x,y;t|)>*d*y
    </equation>

    Factor out the <math|x>-dependent part:

    <\equation>
      p<rsub|X><around|(|x;t|)>=<frac|1|2*\<pi\>*<sqrt|K<around|(|0|)>\<cdot\><around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>>*exp
      <around*|(|-<frac|x<rsup|2>|2*K<around|(|0|)>>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around*|(|-<frac|y<rsup|2>|2*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>|)>*d*y
    </equation>

    The integral over <math|y> evaluates to
    <math|<sqrt|2*\<pi\>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around*|(|-<frac|y<rsup|2>|2*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>|)>*d*y=<sqrt|2*\<pi\>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>
    </equation>

    Therefore:

    <\equation>
      p<rsub|X><around|(|x;t|)>=<frac|1|<sqrt|2*\<pi\>*K<around|(|0|)>>>*exp
      <around*|(|-<frac|x<rsup|2>|2*K<around|(|0|)>>|)>
    </equation>

    At <math|x=0>:

    <\equation>
      p<rsub|X><around|(|0;t|)>=<frac|1|<sqrt|2*\<pi\>*K<around|(|0|)>>>\<gtr\>0
    </equation>

    The joint density evaluated at <math|x=0> is:

    <\equation>
      p<around|(|0,y;t|)>=<frac|1|2*\<pi\>*<sqrt|K<around|(|0|)>\<cdot\><around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>>*exp
      <around*|(|-<frac|y<rsup|2>|2*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>|)>
    </equation>

    The conditional density is

    <\equation>
      p*<around|(|<wide|X|\<dot\>><around|(|t|)>\<mid\>X<around|(|t|)>=0|)>=<frac|p<around|(|0,<wide|X|\<dot\>><around|(|t|)>;t|)>|p<rsub|X><around|(|0;t|)>>
    </equation>

    Substituting:

    <\equation>
      p*<around|(|<wide|X|\<dot\>><around|(|t|)>\<mid\>X<around|(|t|)>=0|)>=<frac|1|<sqrt|2*\<pi\>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>>*exp
      <around*|(|-<frac|y<rsup|2>|2*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>>|)>
    </equation>

    This is the density of a Gaussian random variable with mean zero and
    variance <math|-<wide|K|\<ddot\>><around|(|0|)>\<gtr\>0>.

    For any <math|c\<in\>\<bbb-R\>>,

    <\equation>
      \<bbb-P\>*<around|[|<wide|X|\<dot\>><around|(|t|)>=c\<mid\>X<around|(|t|)>=0|]>=<big|int><rsub|c><rsup|c>p*<around|(|<wide|X|\<dot\>><around|(|t|)>\<mid\>X<around|(|t|)>=0|)>*d*y=0
    </equation>

    In particular,

    <\equation>
      \<bbb-P\>*<around|[|<wide|X|\<dot\>><around|(|t<rsub|0>|)>=0\<mid\>X<around|(|t<rsub|0>|)>=0|]>=0
    </equation>

    so

    <\equation>
      \<bbb-P\>*<around|[|<wide|X|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0\<mid\>X<around|(|t<rsub|0>|)>=0|]>=1
    </equation>

    for every <math|t<rsub|0>> with <math|X<around|(|t<rsub|0>|)>=0>. All
    zeros are simple almost surely.
  </proof>

  <\theorem>
    [Simplicity under time change]<label|thm:zero_simplicity> Let
    <math|X<around|(|u|)>> satisfy the hypotheses of Theorem
    <reference|thm:bulinskaya>. Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be strictly increasing and absolutely continuous with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere.
    Define

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then all zeros of <math|Z> are simple: for every <math|t<rsub|0>> such
    that <math|Z<around|(|t<rsub|0>|)>=0>, it follows that
    <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0>.
  </theorem>

  <\proof>
    Let <math|u<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    and <math|v<around|(|t|)>=X<around|(|\<theta\><around|(|t|)>|)>>, so
    <math|Z<around|(|t|)>=u<around|(|t|)>*v<around|(|t|)>>.

    The derivative of <math|u<around|(|t|)>> is

    <\equation>
      <wide|u|\<dot\>><around|(|t|)>=<frac|d|d*t>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>=<frac|<wide|\<theta\>|\<ddot\>><around|(|t|)>|2*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    </equation>

    The derivative of <math|v<around|(|t|)>> by the chain rule is

    <\equation>
      <wide|v|\<dot\>><around|(|t|)>=<wide|X|\<dot\>><around|(|\<theta\><around|(|t|)>|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>

    By the product rule,

    <\equation>
      <wide|Z|\<dot\>><around|(|t|)>=<wide|u|\<dot\>><around|(|t|)>*v<around|(|t|)>+u<around|(|t|)><wide|v|\<dot\>><around|(|t|)>
    </equation>

    Substitute:

    <\equation>
      <wide|Z|\<dot\>><around|(|t|)>=<frac|<wide|\<theta\>|\<ddot\>><around|(|t|)>|2*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*X<around|(|\<theta\><around|(|t|)>|)>+<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<wide|X|\<dot\>><around|(|\<theta\><around|(|t|)>|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>

    Let <math|t<rsub|0>> satisfy <math|Z<around|(|t<rsub|0>|)>=0> and
    <math|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>\<gtr\>0>. Then
    <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>>\<gtr\>0> and

    <\equation>
      0=Z<around|(|t<rsub|0>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>>*X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>
    </equation>

    so

    <\equation>
      X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0
    </equation>

    By Theorem <reference|thm:bulinskaya>,
    <math|<wide|X|\<dot\>><around|(|\<theta\><around|(|t<rsub|0>|)>|)>\<neq\>0>
    almost surely.

    Evaluate <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>>:

    <\equation>
      <wide|Z|\<dot\>><around|(|t<rsub|0>|)>=<frac|<wide|\<theta\>|\<ddot\>><around|(|t<rsub|0>|)>|2*<sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>>>\<cdot\>0+<sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>>*<wide|X|\<dot\>><around|(|\<theta\><around|(|t<rsub|0>|)>|)>*<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>
    </equation>

    So

    <\equation>
      <wide|Z|\<dot\>><around|(|t<rsub|0>|)>=<around|[|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>|]><rsup|3/2>*<wide|X|\<dot\>><around|(|\<theta\><around|(|t<rsub|0>|)>|)>
    </equation>

    Since <math|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>\<gtr\>0> and
    <math|<wide|X|\<dot\>><around|(|\<theta\><around|(|t<rsub|0>|)>|)>\<neq\>0>,
    one has <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0>. The set
    where <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> has Lebesgue
    measure zero, so all zeros of <math|Z> are simple almost surely.
  </proof>

  All processes in the remainder of the document are real-valued unless
  otherwise stated.

  <\theorem>
    <label|asm:real>Let <math|X<around|(|u|)>> be a real-valued process:

    <\equation>
      X<around|(|u|)>\<in\>\<bbb-R\><space|1em>\<forall\>u\<in\>\<bbb-R\><label|eq:1>
    </equation>

    Then its (complex-valued) random orthogonal spectral measure satisfies

    <\equation>
      d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)><label|eq:2>
    </equation>

    and the corresponding covariance spectral measure <math|F> is even:

    <\equation>
      F*<around|(|-A|)>=F<around|(|A|)><label|eq:3>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>The spectral representation for <math|X<around|(|u|)>> is

      <\equation>
        X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      Since <math|X<around|(|u|)>> is real-valued for each <math|u>,

      <\equation>
        <wide|X<around|(|u|)>|\<bar\>>=X<around|(|u|)>
      </equation>

      The complex conjugate of the integral representation is

      <\align>
        <tformat|<table|<row|<cell|<wide|X<around|(|u|)>|\<bar\>>>|<cell|=<wide|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|e<rsup|i*\<lambda\>*u>|\<bar\>>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)><eq-number>>>>>
      </align>

      Apply the substitution <math|\<lambda\>\<mapsto\>-\<mu\>>:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*d*<wide|\<Phi\>|\<bar\>><around|(|-\<mu\>|)>
      </equation>

      Equating the two expressions for <math|<wide|X<around|(|u|)>|\<bar\>>>:

      <\equation>
        X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*<wide|\<Phi\>|\<bar\>><around|(|-\<lambda\>|)>
      </equation>

      By uniqueness of the spectral representation,

      <\equation>
        d*\<Phi\><around|(|\<lambda\>|)>=d*<wide|\<Phi\>|\<bar\>><around|(|-\<lambda\>|)>
      </equation>

      Taking complex conjugates,

      <\equation>
        d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      <item>The covariance function of <math|X> is

      <\equation>
        R<around|(|u|)>=\<bbb-E\>*<around|(|X<around|(|0|)>*X<around|(|u|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*F<around|(|\<lambda\>|)>
      </equation>

      Since <math|X> is real-valued, <math|R<around|(|u|)>> is real and
      stationary implies <math|R*<around|(|-u|)>=R<around|(|u|)>>. Compute

      <\align>
        <tformat|<table|<row|<cell|R*<around|(|-u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*d*F<around|(|\<lambda\>|)><eq-number>>>>>
      </align>

      Substitute <math|\<mu\>=-\<lambda\>>:

      <\align>
        <tformat|<table|<row|<cell|R*<around|(|-u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*d*F*<around|(|-\<mu\>|)><eq-number>>>>>
      </align>

      Equating <math|R<around|(|u|)>> and <math|R*<around|(|-u|)>> for all
      <math|u> gives

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*F<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*d*F*<around|(|-\<lambda\>|)>
      </equation>

      By uniqueness of Fourier\UStieltjes transforms,

      <\equation>
        d*F<around|(|\<lambda\>|)>=d*F*<around|(|-\<lambda\>|)>
      </equation>

      For any Borel set <math|A>,

      <\equation>
        F*<around|(|-A|)>=<big|int><rsub|-A>d*F<around|(|\<lambda\>|)>=<big|int><rsub|A>d*F*<around|(|-\<lambda\>|)>=<big|int><rsub|A>d*F<around|(|\<lambda\>|)>=F<around|(|A|)>
      </equation>
    </enumerate>
  </proof>

  <subsection|Definition>

  <\definition>
    <label|def:gaussian_process>(Gaussian process) Let
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> be a probability space
    and <math|T> a nonempty index set. A family
    <math|<around|{|X<rsub|t>:t\<in\>T|}>> of real-valued random variables is
    called a Gaussian process if for every finite subset
    <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>\<subset\>T> the random
    vector <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    is multivariate normal. The mean function is

    <\equation>
      m<around|(|t|)>\<assign\>\<bbb-E\><around|[|X<rsub|t>|]>
    </equation>

    and the covariance kernel is

    <\equation>
      K<around|(|s,t|)>=<math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>=\<bbb-E\>*<around|[|<around|(|X<rsub|s>-m<around|(|s|)>|)>*<around|(|X<rsub|t>-m<around|(|t|)>|)>|]>
    </equation>
  </definition>

  <subsection|Stationary processes>

  <\definition>
    <label|def:cramer>(Cramér spectral representation) A zero-mean stationary
    process <math|X> with spectral measure <math|F> admits the representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure. The
    covariance is

    <\equation>
      R<rsub|X>*<around|(|t-s|)>=\<bbb-E\><around|[|X<around|(|t|)><wide|X<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
    </equation>

    where <math|F> is the spectral measure defined by
    <math|d*F<around|(|\<lambda\>|)>=\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)><wide|d*\<Phi\><around|(|\<lambda\>|)>|\<bar\>>|]>>.
  </definition>

  <subsubsection|Fourier Transform Conventions>

  <\definition>
    <label|def:fourier>(Fourier transform conventions) The forward and
    inverse Fourier transforms on <math|L<rsup|2><around|(|\<bbb-R\>|)>> are

    <\equation>
      <wide|f|^><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*d*u
    </equation>

    and

    <\equation>
      f<around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*u>*d*\<lambda\>
    </equation>
  </definition>

  <subsubsection|Sample Path Realizations>

  <\definition>
    <label|def:L2loc>(Locally square-integrable functions)

    <\equation>
      L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    <label|rem:L2loc_properties>The space
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> contains
    functions that are square-integrable on every bounded interval, including
    functions with polynomial growth at infinity.
  </remark>

  <\theorem>
    <label|thm:paths_loc>(Sample paths in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>) Let
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      \<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    Then almost every sample path lies in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Let <math|<around|[|a,b|]>\<subset\>\<bbb-R\>> be bounded and define

    <\equation>
      Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t
    </equation>

    By Fubini,

    <\equation>
      \<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*d*t=<big|int><rsub|a><rsup|b>\<sigma\><rsup|2>*d*t=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>
    </equation>

    Thus <math|\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1>.

    Cover <math|\<bbb-R\>> by <math|I<rsub|n>=<around|[|n,n+1|]>>,
    <math|n\<in\>\<bbb-Z\>>. For each <math|n>,

    <\equation>
      \<bbb-P\>*<around*|(|<big|int><rsub|I<rsub|n>>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>|)>=1
    </equation>

    The countable intersection has probability one, so for almost every
    <math|\<omega\><rsub|0>> and every compact <math|K>,

    <\equation>
      <big|int><rsub|K><around|\||X<around|(|t,\<omega\><rsub|0>|)>|\|><rsup|2>*d*t\<less\>\<infty\>
    </equation>

    Hence the sample path lies in <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </proof>

  <section|Oscillatory Processes>

  <\definition>
    <label|def:osc_proc>(Oscillatory process) Let <math|F> be a finite
    nonnegative Borel measure on <math|\<bbb-R\>>. Let

    <\equation>
      A<rsub|t>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be the gain function and

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    be the oscillatory function. An oscillatory process is

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> satisfying

    <\equation>
      d*\<bbb-E\><around|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:realvaluedness>(Real-valuedness criterion) Let <math|Z> be an
    oscillatory process with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    and spectral measure <math|F>. Then <math|Z> is real-valued if and only
    if

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>>, equivalently

    <\equation>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>>.
  </theorem>

  <\proof>
    Assume <math|Z> real-valued. Then

    <\equation>
      Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>
    </equation>

    and

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Taking conjugates,

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>
    </equation>

    By Theorem <reference|asm:real>, <math|d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>>,
    so

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*d*\<Phi\>*<around|(|-\<lambda\>|)>
    </equation>

    Set <math|\<mu\>=-\<lambda\>>:

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>
    </equation>

    Equality <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>> gives

    <\equation>
      <big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<mu\>|)>*e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>
    </equation>

    so

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>><space|1em>F<text|-a.e.>
    </equation>

    Then

    <\equation>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=A<rsub|t>*<around|(|-\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>=<wide|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|\<bar\>>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    The converse follows by reversing the argument.
  </proof>

  <\theorem>
    <label|thm:existence_osc>(Existence of Oscillatory Processes) Let
    <math|F> be absolutely continuous with gain function
    <math|A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>> for
    all <math|t>, measurable in both time and frequency. Then there exists a
    complex orthogonal random measure <math|\<Phi\>> with spectral measure
    <math|F> such that

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>, and

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>.
    </equation>
  </theorem>

  <\proof>
    Define the stochastic integral first for simple
    <math|g<around|(|\<lambda\>|)>=<big|sum>c<rsub|j>*<with|math-font-family|bf|1><rsub|E<rsub|j>><around|(|\<lambda\>|)>>
    by

    <\equation>
      <big|int>g<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<big|sum>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
    </equation>

    Using orthogonality,

    <\equation>
      \<bbb-E\><around*|\||<big|int>g*<space|0.17em>d*\<Phi\>|\|><rsup|2>=<big|int><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
    </equation>

    Simple functions are dense in <math|L<rsup|2><around|(|F|)>>, so the
    integral extends uniquely to all <math|L<rsup|2><around|(|F|)>>.

    For each <math|t>, <math|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>\<in\>L<rsup|2><around|(|F|)>>,
    so <math|Z<around|(|t|)>> is defined. Covariance follows from bilinearity
    and orthogonality exactly as in standard spectral theory:

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </proof>

  <\definition>
    <label|def:impulse>(Forward impulse response) For
    <math|Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>,
    define

    <\equation>
      h<around|(|t,u|)>\<assign\><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>
    </equation>
  </definition>

  <\theorem>
    <label|thm:filter_rep>(Filter representation via impulse response) Let
    <math|X> be a zero-mean stationary process with Cramér representation
    <math|X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>>
    and spectral measure <math|F>. Let <math|Z> be an oscillatory process
    with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>
    using the same orthogonal random measure <math|\<Phi\>>. Then

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
    </equation>

    with <math|h> from Definition <reference|def:impulse>.
  </theorem>

  <\proof>
    Substitute:

    <\equation>
      <big|int>h<around|(|t,u|)>*X<around|(|u|)>*d*u=<big|int><frac|1|2*\<pi\>>*<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>*<big|int>e<rsup|i*\<lambda\><rprime|'>*u>*d*\<Phi\><around|(|\<lambda\><rprime|'>|)>*<space|0.17em>d*u
    </equation>

    Interchange integrals:

    <\equation>
      =<frac|1|2*\<pi\>>*<big|int><big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)><around*|[|<big|int>e<rsup|i*<around|(|\<lambda\><rprime|'>-\<lambda\>|)>*u>*d*u|]>*d*\<lambda\><rprime|'>*d*\<lambda\>
    </equation>

    Use

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<lambda\><rprime|'>-\<lambda\>|)>*u>*d*u=2*\<pi\>*\<delta\>*<around|(|\<lambda\><rprime|'>-\<lambda\>|)>
    </equation>

    to get

    <\equation>
      =<big|int>\<varphi\><rsub|t><around|(|\<lambda\><rprime|'>|)>*d*\<Phi\><around|(|\<lambda\><rprime|'>|)>=Z<around|(|t|)>
    </equation>
  </proof>

  <section|Unitarily Time-Changed Stationary Processes>

  <subsection|Unitary Time-Change Operator>

  <\theorem>
    <label|thm:local_unitarity>(Unitary time-change operator) Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    Lebesgue measure zero. For <math|f> measurable, define

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Its inverse is

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>\<assign\><frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    For every compact <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the two-sided inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    For <math|f\<in\>L<rsup|2><rsub|<math-up|loc>>>,

    <\equation>
      <big|int><rsub|K><around|\||U<rsub|\<theta\>>*f<around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t
    </equation>

    Set <math|s=\<theta\><around|(|t|)>> so
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t> and
    <math|s\<in\>\<theta\><around|(|K|)>>:

    <\equation>
      =<big|int><rsub|\<theta\><around|(|K|)>><around|\||f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    For the inverse, compute

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>=<frac|<around|(|U<rsub|\<theta\>>*f|)><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>=f<around|(|s|)>
    </equation>

    and similarly <math|<around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=g<around|(|t|)>>.
  </proof>

  <subsection|Transformation of Stationary to Oscillatory Processes>

  <\theorem>
    <label|thm:Utheta_to_osc>(Time changes produce oscillatory processes) Let
    <math|X> be zero-mean stationary as in Definition <reference|def:cramer>.
    For <math|\<theta\>> as in Theorem <reference|thm:local_unitarity>,
    define

    <\equation>
      Z<around|(|t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is an oscillatory process with oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    gain function

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    and covariance kernel

    <\equation>
      R<rsub|Z><around|(|t,s|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    From Cramér,

    <\equation>
      X<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    so

    <\equation>
      X<around|(|\<theta\><around|(|t|)>|)>=<big|int>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Then

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>=<big|int><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Set

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    and

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    so <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.

    For covariance,

    <\equation>
      R<rsub|Z><around|(|t,s|)>=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>
    </equation>

    and stationarity gives

    <\equation>
      \<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>=<big|int>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
    </equation>

    so

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </proof>

  <\corollary>
    <label|cor:evol_spec>The evolutionary spectrum is

    <\equation>
      d*F<rsub|t><around|(|\<lambda\>|)>\<assign\><wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>
    </equation>
  </corollary>

  <\proof>
    By definition <math|d*F<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>>
    and

    <\equation>
      <around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|\|><rsup|2><around*|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>

    so <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>.
  </proof>

  <subsubsection|Time-Varying Filter Representations>

  <\theorem>
    <label|thm:inverse_filter>Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be absolutely continuous, strictly increasing, and bijective with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere.
    Let <math|X<around|(|u|)>> be a stationary process. The oscillatory
    process obtained by <math|U<rsub|\<theta\>>> is

    <\equation>
      Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    with forward kernel

    <\equation>
      h<around|(|t,u|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
    </equation>

    and inverse

    <\equation>
      X<around|(|u|)>=<around|(|U<rsub|\<theta\>><rsup|-1>*Z|)><around|(|u|)>=<frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>

    with inverse kernel

    <\equation>
      g*<around|(|u,t|)>\<assign\><frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>
  </theorem>

  <\proof>
    Using <math|\<delta\>>,

    <\equation>
      X<around|(|\<theta\><around|(|t|)>|)>=<big|int>X<around|(|u|)>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*d*u
    </equation>

    hence

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int>X<around|(|u|)>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*d*u=<big|int><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*X<around|(|u|)>*d*u
    </equation>

    so <math|h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>>.

    For the inverse, from Theorem <reference|thm:local_unitarity>,

    <\equation>
      X<around|(|u|)>=<frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>=<big|int>Z<around|(|t|)><frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>*d*t
    </equation>

    so <math|g*<around|(|u,t|)>> as claimed. Composition of kernels yields
    the identity via standard delta sifting.
  </proof>

  <subsection|Covariance Operator Conjugation>

  <\proposition>
    <label|prop:conjugation>Let

    <\equation>
      <around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*d*s
    </equation>

    with

    <\equation>
      K<around|(|h|)>\<assign\><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*d*F<around|(|\<lambda\>|)>
    </equation>

    Define

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    Then

    <\equation>
      <around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>=<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>
    </equation>
  </proposition>

  <\proof>
    Compute

    <\equation>
      <around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int>K<around|(|<around|\||\<theta\><around|(|t|)>-s|\|>|)>*U<rsub|\<theta\>><rsup|-1>*f<around|(|s|)>*d*s
    </equation>

    Substitute <math|U<rsub|\<theta\>><rsup|-1>> and
    <math|s=\<theta\><around|(|r|)>>:

    <\equation>
      =<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|r|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|r|)>>*f<around|(|r|)>*d*r
    </equation>

    <\equation>
      =<big|int><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|r|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|r|)>|\|>|)>*f<around|(|r|)>*d*r
    </equation>

    which is <math|<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>>.
  </proof>

  <section|Zero Localization>

  <\definition>
    Let <math|Z:\<bbb-R\>\<to\>\<bbb-R\>> be real-valued with
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>. By Theorem
    <reference|thm:zero_simplicity>, all zeros of <math|Z> satisfy

    <\equation>
      Z<around|(|t<rsub|0>|)>=0\<Longrightarrow\><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>

    Define, for Borel <math|B\<subseteq\>\<bbb-R\>>:

    <\equation>
      \<mu\><around|(|B|)>\<assign\><big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t
    </equation>
  </definition>

  <\theorem>
    The zeros are locally finite and

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    and

    <\equation>
      \<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>
  </theorem>

  <\proof>
    For smooth test <math|\<phi\>>,

    <\equation>
      <big|int>\<phi\><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)>*d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<phi\><around|(|t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Zeros are isolated (simplicity and <math|C<rsup|1>>), so the sum is
    finite on compacts. Thus

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Substitute into <math|\<mu\>>:

    <\equation>
      \<mu\><around|(|B|)>=<big|sum><rsub|t<rsub|0>><big|int><with|math-font-family|bf|1><rsub|B><around|(|t|)><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t=<big|sum><rsub|t<rsub|0>><with|math-font-family|bf|1><rsub|B><around|(|t<rsub|0>|)>
    </equation>

    so <math|\<mu\>=<big|sum><rsub|t<rsub|0>>\<delta\><rsub|t<rsub|0>>>.
  </proof>

  <\definition>
    Define

    <\equation>
      H\<assign\>L<rsup|2><around|(|\<mu\>|)>
    </equation>

    with

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>\<assign\><big|int>f<around|(|t|)>*g<around|(|t|)>*d*\<mu\><around|(|t|)>
    </equation>
  </definition>

  <\proposition>
    [Atomic structure] Let <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>.
    Then

    <\equation>
      H=<around*|{|f:<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>\<to\>\<bbb-C\>:<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>
    </equation>

    with orthonormal basis <math|<around|{|e<rsub|t<rsub|0>>|}><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>>
    where

    <\equation>
      e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>\<assign\>\<delta\><rsub|t<rsub|0>,t<rsub|1>>
    </equation>
  </proposition>

  <\proof>
    For <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>>,

    <\equation>
      <around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><rsup|2>=<big|sum><rsub|t<rsub|0>><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>
    </equation>

    Define <math|\<Phi\><around|(|f|)>=<around|(|f<around|(|t<rsub|0>|)>|)><rsub|t<rsub|0>>>;
    this is an isometric isomorphism onto <math|\<ell\><rsup|2>>.

    For orthonormality,

    <\equation>
      <around|\<langle\>|e<rsub|t<rsub|0>>,e<rsub|t<rsub|1>>|\<rangle\>>=<big|sum><rsub|s>e<rsub|t<rsub|0>><around|(|s|)>*e<rsub|t<rsub|1>><around|(|s|)>=\<delta\><rsub|t<rsub|0>,t<rsub|1>>
    </equation>

    Any <math|f> has expansion <math|f=<big|sum>f<around|(|t<rsub|0>|)>*e<rsub|t<rsub|0>>>,
    so <math|<around|{|e<rsub|t<rsub|0>>|}>> is an orthonormal basis.
  </proof>

  <\definition>
    Define

    <\equation>
      L:D<around|(|L|)>\<subseteq\>H\<to\>H,<space|1em><around|(|L*f|)><around|(|t|)>\<assign\>t*f<around|(|t|)>
    </equation>

    with domain

    <\equation>
      D<around|(|L|)>\<assign\><around*|{|f\<in\>H:<big|int><around|\||t*f<around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    The operator <math|L> is self-adjoint on <math|H> and has pure point,
    simple spectrum

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>
    </equation>

    with eigenvalues <math|t<rsub|0>> and eigenvectors
    <math|e<rsub|t<rsub|0>>>.
  </theorem>

  <\proof>
    For <math|f,g\<in\>D<around|(|L|)>>,

    <\equation>
      <around|\<langle\>|L*f,g|\<rangle\>>=<big|int>t*f<around|(|t|)>*g<around|(|t|)>*d*\<mu\><around|(|t|)>=<big|int>f<around|(|t|)>*t*g<around|(|t|)>*d*\<mu\><around|(|t|)>=<around|\<langle\>|f,L*g|\<rangle\>>
    </equation>

    so <math|L> is symmetric and as a multiplication operator is
    self-adjoint.

    On <math|e<rsub|t<rsub|0>>>,

    <\equation>
      <around|(|L*e<rsub|t<rsub|0>>|)><around|(|t|)>=t*e<rsub|t<rsub|0>><around|(|t|)>=t<rsub|0>*e<rsub|t<rsub|0>><around|(|t|)>
    </equation>

    so <math|e<rsub|t<rsub|0>>> is an eigenvector with eigenvalue
    <math|t<rsub|0>>. The basis is complete, so the spectrum is pure point
    and simple.
  </proof>

  <subsection|Expected Zero-Counting Function>

  <\theorem>
    [Expected Zero-Counting Function with Deterministic Atoms] Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> for all <math|t>
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost
    everywhere. Define

    <\equation>
      T<rsub|0>\<assign\><around|{|t\<in\>\<bbb-R\>:<wide|\<theta\>|\<dot\>><around|(|t|)>=0|}>
    </equation>

    Let <math|X> be a centered stationary Gaussian process with spectral
    measure <math|F> and covariance

    <\equation>
      K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*d*F<around|(|\<lambda\>|)>
    </equation>

    twice differentiable at <math|h=0> with
    <math|<wide|K|\<ddot\>><around|(|0|)>\<less\>0> and
    <math|K<around|(|0|)>\<gtr\>0>. Define

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then for any <math|T\<gtr\>0>,

    <\equation>
      \<bbb-E\><around|[|N<rsub|<around|[|0,T|]>><around|(|Z|)>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
    </equation>

    where <math|N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>\<assign\>#<around|(|T<rsub|0>\<cap\><around|[|0,T|]>|)>>.
  </theorem>

  <\proof>
    If <math|t<rsub|0>\<in\>T<rsub|0>> then
    <math|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>=0> and

    <\equation>
      Z<around|(|t<rsub|0>|)>=0\<cdot\>X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0
    </equation>

    so these are deterministic zeros. By Theorem <reference|thm:bulinskaya>
    and monotonicity of <math|\<theta\>>, there are finitely many such points
    in <math|<around|[|0,T|]>>.

    On <math|I<rsub|T>=<around|[|0,T|]>\<setminus\>T<rsub|0>>,
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> and

    <\equation>
      Z<around|(|t|)>=0\<Longleftrightarrow\>X<around|(|\<theta\><around|(|t|)>|)>=0
    </equation>

    Define <math|Y<around|(|t|)>=X<around|(|\<theta\><around|(|t|)>|)>>. Then

    <\equation>
      K<rsub|Y><around|(|t,s|)>=\<bbb-E\>*<around|[|Y<around|(|t|)>*Y<around|(|s|)>|]>=K*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    Hence

    <\equation>
      <frac|\<partial\>|\<partial\>*s>*K<rsub|Y><around|(|t,s|)>=-<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|K|\<dot\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    and since <math|K> is even, <math|<wide|K|\<dot\>><around|(|0|)>=0> and

    <\equation>
      lim<rsub|s\<to\>t> <frac|\<partial\>|\<partial\>*s>*K<rsub|Y><around|(|t,s|)>=0
    </equation>

    Similarly,

    <\equation>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>=-<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|K|\<ddot\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    so

    <\equation>
      lim<rsub|s\<to\>t> <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>=-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>
    </equation>

    and <math|K<rsub|Y><around|(|t,t|)>=K<around|(|0|)>>.

    Kac\URice gives the zero intensity

    <\equation>
      \<lambda\><rsub|Y><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|K<around|(|0|)>*<around|(|-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>|)>|K<around|(|0|)><rsup|2>>>=<frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
    </equation>

    for <math|t\<in\>I<rsub|T>>. Then

    <\equation>
      \<bbb-E\><around|[|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|I<rsub|T>>\<lambda\><rsub|Y><around|(|t|)>*d*t=<frac|1|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>*<big|int><rsub|0><rsup|T><wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
    </equation>

    and

    <\equation>
      <big|int><rsub|0><rsup|T><wide|\<theta\>|\<dot\>><around|(|t|)>*d*t=\<theta\><around|(|T|)>-\<theta\><around|(|0|)>
    </equation>

    so

    <\equation>
      \<bbb-E\><around|[|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>|]>=<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
    </equation>

    The total is

    <\equation>
      \<bbb-E\><around|[|N<rsub|<around|[|0,T|]>><around|(|Z|)>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+\<bbb-E\><around|[|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>|]>
    </equation>

    as claimed.
  </proof>

  <\thebibliography|99>
    <bibitem|cramer>H. Cramér and M.R. Leadbetter,
    <with|font-shape|italic|Stationary and Related Processes: Sample Function
    Properties and Their Applications>. Wiley, 1967.

    <bibitem|priestley>M.B. Priestley, Evolutionary spectra and
    non-stationary processes, <with|font-shape|italic|J. Roy. Stat. Soc. B>,
    27(2):204\U229, 1965.
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
    <associate|asm:real|<tuple|3|5>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|3.2.1|12>>
    <associate|auto-11|<tuple|3.3|13>>
    <associate|auto-12|<tuple|4|13>>
    <associate|auto-13|<tuple|4.1|15>>
    <associate|auto-14|<tuple|151|16>>
    <associate|auto-2|<tuple|1.1|6>>
    <associate|auto-3|<tuple|1.2|7>>
    <associate|auto-4|<tuple|1.2.1|7>>
    <associate|auto-5|<tuple|1.2.2|7>>
    <associate|auto-6|<tuple|2|8>>
    <associate|auto-7|<tuple|3|10>>
    <associate|auto-8|<tuple|3.1|10>>
    <associate|auto-9|<tuple|3.2|11>>
    <associate|bib-cramer|<tuple|cramer|16>>
    <associate|bib-priestley|<tuple|priestley|16>>
    <associate|cor:evol_spec|<tuple|17|12>>
    <associate|def:L2loc|<tuple|7|7>>
    <associate|def:cramer|<tuple|5|7>>
    <associate|def:fourier|<tuple|6|7>>
    <associate|def:gaussian_process|<tuple|4|6>>
    <associate|def:impulse|<tuple|13|9>>
    <associate|def:osc_proc|<tuple|10|8>>
    <associate|eq:1|<tuple|29|5>>
    <associate|eq:2|<tuple|30|5>>
    <associate|eq:3|<tuple|31|5>>
    <associate|prop:conjugation|<tuple|19|13>>
    <associate|rem:L2loc_properties|<tuple|8|7>>
    <associate|thm:Utheta_to_osc|<tuple|16|11>>
    <associate|thm:bulinskaya|<tuple|1|2>>
    <associate|thm:existence_osc|<tuple|12|9>>
    <associate|thm:filter_rep|<tuple|14|10>>
    <associate|thm:inverse_filter|<tuple|18|12>>
    <associate|thm:local_unitarity|<tuple|15|10>>
    <associate|thm:paths_loc|<tuple|9|7>>
    <associate|thm:realvaluedness|<tuple|11|8>>
    <associate|thm:zero_simplicity|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes and Simplicity of Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Fourier Transform
      Conventions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Sample Path Realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Unitary Time-Change Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Transformation of Stationary
      to Oscillatory Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|3.2.1<space|2spc>Time-Varying Filter
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Covariance Operator
      Conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Expected Zero-Counting
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>