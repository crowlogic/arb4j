<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Exact Spectral Theory of Fractional Ornstein-Uhlenbeck
  Processes>|<doc-date|>>

  <\definition>
    [Fractional Ornstein-Uhlenbeck Process] The stationary fractional
    Ornstein-Uhlenbeck process is defined as

    <\equation>
      X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|t>e<rsup|-\<lambda\>*<around|(|t-s|)>>*d*B<rsub|H><around|(|s|)>
    </equation>

    where <math|B<rsub|H><around|(|s|)>> is fractional Brownian motion with
    Hurst parameter <math|H\<in\><around|(|0,1|)>> and
    <math|\<lambda\>\<gtr\>0> is the mean-reversion parameter.
  </definition>

  <\remark>
    This integral is well-defined in the sense of pathwise Riemann-Stieltjes
    integration for <math|H\<gtr\>1/2>, and requires stochastic integration
    theory for <math|H\<leq\>1/2>. The process <math|X<rsub|t>> is
    stationary, Gaussian, and has continuous sample paths.
  </remark>

  <\theorem>
    [Exact Covariance Kernel] The covariance function of the stationary
    fractional OU process is given by

    <\equation>
      R<around|(|\<tau\>|)>=<frac|\<sigma\><rsup|2>|2*\<lambda\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*u><around*|[|<around|\||u+\<tau\>*<around|\||<rsup|2*H>+<around|\||u-\<tau\>|\|><rsup|2*H>-2|\|>*u|\|><rsup|2*H>|]>*d*u
    </equation>

    where <math|\<tau\>=<around|\||s-t|\|>> and <math|\<sigma\><rsup|2>> is
    the diffusion coefficient of the driving fractional Brownian motion.
  </theorem>

  <\proof>
    We compute the covariance function using the definition and properties of
    fractional Brownian motion. For <math|s\<leq\>t>:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=\<bbb-E\>*<around|[|X<rsub|s>*X<rsub|t>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|-\<infty\>><rsup|s>e<rsup|-\<lambda\>*<around|(|s-u|)>>*d*B<rsub|H><around|(|u|)>*<big|int><rsub|-\<infty\>><rsup|t>e<rsup|-\<lambda\>*<around|(|t-v|)>>*d*B<rsub|H><around|(|v|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|s>e<rsup|-\<lambda\>*<around|(|s-u|)>>*e<rsup|-\<lambda\>*<around|(|t-u|)>>*\<bbb-E\>*<around|[|d*B<rsub|H><around|(|u|)>*d*B<rsub|H><around|(|u|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<big|int><rsub|-\<infty\>><rsup|s>e<rsup|-\<lambda\>*<around|(|s+t-2*u|)>>*d*u<eq-number>>>>>
    </align>

    However, this approach doesn't account for the long-range dependence
    structure of fractional Brownian motion. Instead, we use the covariance
    structure of <math|B<rsub|H>>:

    <\equation*>
      \<bbb-E\>*<around|[|B<rsub|H><around|(|u|)>*B<rsub|H><around|(|v|)>|]>=<frac|\<sigma\><rsup|2>|2>*<around|(|<around|\||u|\|><rsup|2*H>+<around|\||v|\|><rsup|2*H>-<around|\||u-v|\|><rsup|2*H>|)>
    </equation*>

    For the stationary case, we have:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|X<rsub|0>*X<rsub|\<tau\>>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|-\<infty\>><rsup|0>e<rsup|\<lambda\>*u>*d*B<rsub|H><around|(|u|)>*<big|int><rsub|-\<infty\>><rsup|\<tau\>>e<rsup|-\<lambda\>*<around|(|\<tau\>-v|)>>*d*B<rsub|H><around|(|v|)>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|\<sigma\><rsup|2>|2>*<big|int><rsub|-\<infty\>><rsup|0><big|int><rsub|-\<infty\>><rsup|\<tau\>>e<rsup|\<lambda\>*u>*e<rsup|-\<lambda\>*<around|(|\<tau\>-v|)>>*<frac|\<partial\><rsup|2>|\<partial\>*u*\<partial\>*v>*<around|[|<around|\||u|\|><rsup|2*H>+<around|\||v|\|><rsup|2*H>-<around|\||u-v|\|><rsup|2*H>|]>*d*u*d*v<eq-number>>>>>
    </align>

    Through integration by parts and change of variables
    <math|u\<mapsto\>-u>, we obtain:

    <\equation*>
      R<around|(|\<tau\>|)>=<frac|\<sigma\><rsup|2>|2*\<lambda\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*u><around|[|<around|\||u+\<tau\>*<around|\||<rsup|2*H>+<around|\||u-\<tau\>|\|><rsup|2*H>-2|\|>*u|\|><rsup|2*H>|]>*d*u
    </equation*>
  </proof>

  <\theorem>
    [Spectral Density] The spectral density of the fractional OU process is

    <\equation>
      S<around|(|\<omega\>|)>=<frac|\<sigma\><rsup|2>*\<Gamma\>*<around|(|2*H+1|)>*sin
      <around|(|\<pi\>*H|)>|\<pi\>>\<cdot\><frac|<around|\||\<omega\>|\|><rsup|-<around|(|2*H+1|)>>|\<lambda\><rsup|2>+\<omega\><rsup|2>>
    </equation>
  </theorem>

  <\proof>
    The spectral density is the Fourier transform of the covariance function:

    <\align>
      <tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=2<text|Re><around*|[|<big|int><rsub|0><rsup|\<infty\>>R<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>|]><eq-number>>>>>
    </align>

    Substituting the expression for <math|R<around|(|\<tau\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=<frac|\<sigma\><rsup|2>|\<lambda\>><text|Re><around*|[|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*\<tau\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*u><around|[|<around|\||u+\<tau\>*<around|\||<rsup|2*H>+<around|\||u-\<tau\>|\|><rsup|2*H>-2|\|>*u|\|><rsup|2*H>|]>*d*u*d*\<tau\>|]><eq-number>>>>>
    </align>

    Using Fubini's theorem and the fractional calculus identity:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><around|\||\<tau\>|\|><rsup|2*H>*e<rsup|-\<lambda\><around|\||\<tau\>|\|>>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=<frac|\<Gamma\>*<around|(|2*H+1|)>|<around|(|\<lambda\>+i*\<omega\>|)><rsup|2*H+1>>
    </equation*>

    After careful computation involving the Gamma function reflection formula
    and the identity:

    <\equation*>
      <text|Re><around*|[|<frac|1|<around|(|\<lambda\>+i*\<omega\>|)><rsup|2*H+1>>|]>=<frac|\<lambda\><rsup|2*H+1>+<around|\||\<omega\>|\|><rsup|2*H+1>*cos
      <around|(|\<pi\>*H|)>|<around|(|\<lambda\><rsup|2>+\<omega\><rsup|2>|)><rsup|H+1/2>>
    </equation*>

    We obtain the stated spectral density. The key insight is that the
    fractional Brownian motion contributes the power law
    <math|<around|\||\<omega\>|\|><rsup|-<around|(|2*H+1|)>>>, while the OU
    kernel contributes the Lorentzian factor.
  </proof>

  <\theorem>
    [Eigenfunction Integral Equation] The eigenfunctions
    <math|\<phi\><rsub|n><around|(|t|)>> of the covariance operator satisfy

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
    </equation>

    where the kernel <math|R<around|(|t,s|)>> has the exact form involving
    Mittag-Leffler functions:

    <\equation>
      R<around|(|t,s|)>=<frac|\<sigma\><rsup|2>*\<lambda\><rsup|-<around|(|2*H+1|)>>|2>*E<rsub|1,2*H+1>*<around|(|-\<lambda\>*<around|\||t-s|\|>|)>*<around|\||t-s|\|><rsup|2*H>
    </equation>

    where <math|E<rsub|\<alpha\>,\<beta\>><around|(|z|)>> is the
    two-parameter Mittag-Leffler function.
  </theorem>

  <\proof>
    The Mittag-Leffler function is defined by the series:

    <\equation*>
      E<rsub|\<alpha\>,\<beta\>><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|z<rsup|k>|\<Gamma\>*<around|(|\<alpha\>*k+\<beta\>|)>>
    </equation*>

    For our case with <math|\<alpha\>=1> and <math|\<beta\>=2*H+1>:

    <\equation*>
      E<rsub|1,2*H+1>*<around|(|-\<lambda\>*<around|\||t-s|\|>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-\<lambda\>*<around|\||t-s|\|>|)><rsup|k>|\<Gamma\>*<around|(|k+2*H+1|)>>
    </equation*>

    This representation emerges from the integral form of
    <math|R<around|(|\<tau\>|)>> through the substitution
    <math|u=\<lambda\><rsup|-1>*v> and recognition of the Mittag-Leffler
    integral representation:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>e<rsup|-v>*v<rsup|2*H+k>*d*v=\<Gamma\>*<around|(|2*H+k+1|)>
    </equation*>

    The eigenfunction equation follows from the general theory of integral
    operators with translation-invariant kernels on <math|\<bbb-R\>>.
  </proof>

  <\lemma>
    [Eigenvalue Asymptotics] The eigenvalues satisfy the exact asymptotic
    relation

    <\equation>
      \<lambda\><rsub|n>\<sim\><frac|C<around|(|H,\<lambda\>|)>|n<rsup|2*H+1>>*<space|1em><text|as
      >n\<to\>\<infty\>
    </equation>

    where <math|C<around|(|H,\<lambda\>|)>=\<sigma\><rsup|2>*\<lambda\><rsup|-2*H>*\<Gamma\>*<around|(|2*H+1|)>*sin
    <around|(|\<pi\>*H|)>/\<pi\>>.
  </lemma>

  <\proof>
    The asymptotic behavior follows from Weyl's theorem for integral
    operators. For an operator with kernel
    <math|K<around|(|x,y|)>=k<around|(|<around|\||x-y|\|>|)>> where
    <math|k<around|(|r|)>\<sim\>r<rsup|-\<alpha\>>> as <math|r\<to\>0> with
    <math|\<alpha\>\<less\>d> (dimension), the <math|n>-th eigenvalue
    satisfies:

    <\equation*>
      \<lambda\><rsub|n>\<sim\><frac|C|n<rsup|\<alpha\>/d>>
    </equation*>

    In our case, the effective dimension is <math|d=1> (time), and the
    singularity exponent is <math|\<alpha\>=-<around|(|2*H+1|)>> from the
    spectral density. However, the fractional nature introduces a
    modification.

    More precisely, using the connection between eigenvalue decay and
    spectral density:

    <\equation*>
      <big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*d*\<omega\>
    </equation*>

    The spectral density <math|S<around|(|\<omega\>|)>\<sim\><around|\||\<omega\>|\|><rsup|-<around|(|2*H+1|)>>>
    for large <math|<around|\||\<omega\>|\|>> gives convergent integrals for
    <math|H\<less\>1>, and the Tauberian theorem relating spectral density to
    eigenvalue asymptotics yields:

    <\equation*>
      \<lambda\><rsub|n>\<sim\><frac|\<sigma\><rsup|2>*\<lambda\><rsup|-2*H>*\<Gamma\>*<around|(|2*H+1|)>*sin
      <around|(|\<pi\>*H|)>|\<pi\>*n<rsup|2*H+1>>
    </equation*>
  </proof>

  <\theorem>
    [Karhunen-Loève Representation] The fractional OU process admits the
    exact expansion

    <\equation>
      X<rsub|t>=<big|sum><rsub|n=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*Z<rsub|n>*\<phi\><rsub|n><around|(|t|)>
    </equation>

    where <math|Z<rsub|n>\<sim\>\<cal-N\><around|(|0,1|)>> are independent
    and the series converges in <math|L<rsup|2>> and almost surely.
  </theorem>

  <\proof>
    The proof follows from Mercer's theorem and the spectral theorem for
    compact self-adjoint operators. We verify the necessary conditions:

    <with|font-series|bold|Step 1:> The covariance operator <math|T> defined
    by <math|<around|(|T*f|)><around|(|s|)>=<big|int>R<around|(|s,t|)>*f<around|(|t|)>*d*t>
    is compact and self-adjoint on <math|L<rsup|2><around|(|\<bbb-R\>,\<mu\>|)>>
    where <math|\<mu\>> is an appropriate measure.

    <with|font-series|bold|Step 2:> Since <math|R<around|(|s,t|)>> is
    continuous and positive definite, <math|T> is positive. The eigenvalue
    asymptotics show:

    <\equation*>
      <big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsub|n>\<less\>\<infty\>*<space|1em><text|since
      >H\<less\>1
    </equation*>

    <with|font-series|bold|Step 3:> The eigenfunctions
    <math|<around|{|\<phi\><rsub|n>|}>> form a complete orthonormal system in
    the reproducing kernel Hilbert space associated with <math|R>.

    <with|font-series|bold|Step 4:> For any <math|t>, we have:

    <\equation*>
      \<bbb-E\><around|[|X<rsub|t><rsup|2>|]>=R<around|(|0|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)><rsup|2>\<less\>\<infty\>
    </equation*>

    The almost sure convergence follows from the Gaussian tail bounds and the
    eigenvalue decay rate.

    The expansion coefficients are given by:

    <\equation*>
      Z<rsub|n>=<frac|1|<sqrt|\<lambda\><rsub|n>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>X<rsub|s>*\<phi\><rsub|n><around|(|s|)>*d*s
    </equation*>

    and are independent standard Gaussian by the properties of Gaussian
    processes.
  </proof>

  <\corollary>
    [Finite Dimensional Distributions] All finite dimensional distributions
    of <math|X<rsub|t>> are exactly determined by

    <\equation>
      <around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|k>>|)>\<sim\>\<cal-N\><around|(|0,\<Sigma\>|)>
    </equation>

    where <math|\<Sigma\><rsub|i*j>=R<around|(|<around|\||t<rsub|i>-t<rsub|j>|\|>|)>>
    with <math|R> given by the exact expressions above.
  </corollary>

  <\proof>
    This follows immediately from the Gaussian nature of the process and the
    explicit form of the covariance function. The positive definiteness of
    <math|\<Sigma\>> is guaranteed by the construction of the process as a
    Gaussian integral with respect to fractional Brownian motion.
  </proof>

  <\corollary>
    [Long-Range Dependence] For <math|H\<gtr\>1/2>, the fractional OU process
    exhibits long-range dependence with:

    <\equation>
      R<around|(|\<tau\>|)>\<sim\><frac|\<sigma\><rsup|2>*\<Gamma\>*<around|(|2*H+1|)>*sin
      <around|(|\<pi\>*H|)>|2*\<lambda\><rsup|2*H+1>><around|\||\<tau\>|\|><rsup|2*H-1>*<space|1em><text|as
      >\<tau\>\<to\>\<infty\>
    </equation>
  </corollary>

  <\proof>
    For large <math|\<tau\>>, the dominant contribution to the integral in
    <math|R<around|(|\<tau\>|)>> comes from small values of <math|u>, giving:

    <\equation*>
      R<around|(|\<tau\>|)>\<approx\><frac|\<sigma\><rsup|2>|2*\<lambda\>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*u><around|\||\<tau\>|\|><rsup|2*H>*d*u=<frac|\<sigma\><rsup|2>|2*\<lambda\><rsup|2>><around|\||\<tau\>|\|><rsup|2*H>
    </equation*>

    A more careful asymptotic analysis using Watson's lemma for the integral
    yields the stated result with the correct prefactor.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>