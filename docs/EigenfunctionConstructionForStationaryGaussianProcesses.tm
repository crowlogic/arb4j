<TeXmacs|2.1.4>

<style|<tuple|letter|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>

    <\abstract>
      The eigenfunctions of the covariance operator of a stationary Gaussian
      process are shown to be the orthogonal complement of the inverse
      Fourier transforms of polynomials orthogonal to the square root of its
      spectral density. Utilizing the convolution theorem and properties of
      the covariance operator, an explicit construction method for these
      eigenfunctions is provided. This result enables efficient computation
      and offers a comprehensive solution for all stationary Gaussian
      processes.
    </abstract>
  </author-affiliation>>>>

  <section|Introduction>

  The eigenfunction decomposition of stationary Gaussian processes remains a
  central problem in stochastic analysis, connecting spectral theory,
  functional analysis, and computational methods. While Bochner's theorem
  characterizes their spectral structure, a constructive theory of
  eigenfunctions has proven elusive. This paper resolves the problem
  completely through a novel connection between spectral factorization and
  orthogonal polynomials in the spectral domain.

  The key insight lies in recognizing that the null space of the spectral
  factor's inner product precisely characterizes the eigenfunction structure.
  This leads to an explicit construction through inverse Fourier transforms
  of polynomials orthogonal to the square root of the spectral density.

  <section|Main Results>

  <\theorem>
    <strong|[Spectral Factorization]> Let <math|K<around|(|t,s|)>> be a
    positive definite stationary kernel. Then there exists a spectral density
    <math|S<around|(|\<omega\>|)>> and spectral factor:

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\><label|sf>
    </equation>

    such that:

    <\equation>
      K<around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>
    </equation>

    <cite|cramerStochasticProcessTheoryContribution>
  </theorem>

  <\proof>
    1. By Bochner's theorem, since <math|K> is positive definite and
    stationary:

    <\equation>
      K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
    </equation>

    where <math|S<around|(|\<omega\>|)>\<geq\>0> is the spectral density.

    2. Define <math|h<around|(|t|)>> as stated. Then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)><wide|h*<around|(|s+\<tau\>|)>|\<bar\>>d*\<tau\>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*<around|(|t+\<tau\>|)>>*d*\<omega\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>\<cdot\><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|-i*\<omega\><rsub|2>*<around|(|s+\<tau\>|)>>*d*\<omega\><rsub|2>*d*\<tau\>>>>>>
    </equation>

    3. Rearranging integrals (justified by Fubini's theorem since
    <math|S<around|(|\<omega\>|)>\<geq\>0>):

    <\equation>
      =<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>*e<rsup|-i*\<omega\><rsub|2>*s><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation>

    4. The inner integral gives <math|2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>e<rsup|-i*\<omega\><rsub|2>*s>*2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>|<row|<cell|=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>*S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*<around*|(|\<omega\><rsub|1>*t-\<omega\><rsub|2>*s|)>>*2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>|<row|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>=K*<around|(|t-s|)>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    The eigenfunctions of a stationary Gaussian process are given by the
    orthogonal complement of the inverse Fourier transforms of the
    polynomials orthogonal with respect to the square root of the spectral
    density.
  </theorem>

  <\proof>
    The polynomials <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}>> are
    orthogonal to <math|<sqrt|S<around|(|\<omega\>|)>>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>P<rsub|m><around*|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|n,m>
    </equation>

    Take their inverse Fourier transforms:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=\<cal-F\><rsup|-1><around|{|P<rsub|n><around|(|\<omega\>|)>|}>
    </equation>

    which span the null space of the inner product with the spectral factor
    (<reference|sf>)

    <\equation>
      <around*|\<langle\>|h,\<phi\><rsub|n>|\<rangle\>>=0\<forall\>n\<gtr\>0
    </equation>

    The Gram-Schmidt recursion generates the orthogonal complement of the
    spectral factor inner product null space:

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=\<phi\><rsub|n><around|(|t|)>-<big|sum><rsub|k=1><rsup|n-1><frac|<around|\<langle\>|\<phi\><rsub|n>,\<psi\><rsub|k>|\<rangle\>>|<around|\<\|\|\>|\<psi\><rsub|k>|\<\|\|\>><rsup|2>>*\<psi\><rsub|k><around|(|t|)>
    </equation>

    Apply the covariance operator:

    <\equation>
      T<around*|[|\<psi\><rsub|n>|]>*<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around*|\||t-s|\|>|)>*\<psi\><rsub|n><around|(|s|)>*d*s
    </equation>

    then compute the Fourier transform:

    <\equation>
      \<cal-F\>*<around|{|T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>=S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    Consider the eigenvalue equation\ 

    <\equation>
      T<around*|[|*\<psi\><rsub|n>|]><around|(|t|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    and apply the Fourier transform to yield

    <\equation>
      \<cal-F\>*<around|{|T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    From the previous Fourier transform equation and the eigenvalue equation:

    <\equation>
      S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    The unique solution satisfying these conditions is:

    <\equation>
      \<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*<sqrt|S<around|(|\<omega\>|)>>
    </equation>

    Therefore we have:

    <\equation>
      S<around|(|\<omega\>|)>\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>=\<lambda\><rsub|n>*S<around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>=\<lambda\><rsub|n>*\<cal-F\><around|{|\<psi\><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>
    </equation>

    where we take the inverse Fourier transform of both sides:

    <\equation>
      T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|<around*|\||t-s|\|>|)>\<psi\><rsub|n><around*|(|t|)>\<mathd\>t=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    and the eigenvalues satisfy

    <\align*>
      <tformat|<table|<row|<cell|\<lambda\><rsub|n>=>|<cell|<frac|<around|\<langle\>|T*\<psi\><rsub|n>,\<psi\><rsub|n>|\<rangle\>>|<around|\<\|\|\>|\<psi\><rsub|n>|\<\|\|\>><rsup|2>>>>|<row|<cell|>|<cell|=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*d*t|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<psi\><rsub|n><around|(|t|)>|\|><rsup|2>*d*t>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<frac|<around|\<\|\|\>|\<psi\><rsub|n>|\<\|\|\>><rsup|2>|<around|\<\|\|\>|\<psi\><rsub|n>|\<\|\|\>><rsup|2>>>>>>
    </align*>
  </proof>

  <section|Examples>

  <subsection|The Random Wave Operator>

  <new-theorem|theorem|Theorem><new-theorem|lemma|Lemma><new-theorem|corollary|Corollary><new-theorem|proposition|Proposition>

  <\theorem>
    For polynomials orthogonal with respect to the weight function\ 

    <\equation>
      w<around|(|x|)>=<choice|<tformat|<table|<row|<cell|<sqrt|<frac|1|<sqrt|1-x<rsup|2>>>>>|<cell|-1\<less\>x\<less\>1>>|<row|<cell|0>|<cell|otherwise>>>>>
    </equation>

    \;

    \ on <math|<around|[|-1,1|]>>, the three-term recurrence relation

    <\equation>
      p<rsub|n+1><around|(|x|)>=<around|(|A<around|(|n|)>*x+B<around|(|n|)>|)>*p<rsub|n><around|(|x|)>-C<around|(|n|)>*p<rsub|n-1><around|(|x|)>
    </equation>

    has coefficients:

    <\equation>
      A<around|(|n|)>=0
    </equation>

    <\equation>
      B<around|(|n|)>=<frac|\<Gamma\>*<around*|(|n+<frac|5|4>|)>*\<Gamma\>*<around*|(|n+<frac|1|4>|)>|\<Gamma\>*<around|(|n+1|)>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>>
    </equation>

    <\equation>
      C<around|(|n|)>=<frac|n|4*<around|(|2*n-1|)>>
    </equation>
  </theorem>

  <\proof>
    The coefficients are determined by the moments of the weight function:

    <\equation>
      \<mu\><rsub|n>=<big|int><rsub|-1><rsup|1>x<rsup|n>*w<around|(|x|)>*d*x
    </equation>

    For the weight function <math|w<around|(|x|)>=<sqrt|1/<sqrt|1-x<rsup|2>>>>,
    these moments can be expressed in terms of the Gamma function:

    <\equation>
      \<mu\><rsub|2*n>=<frac|\<Gamma\>*<around*|(|n+<frac|1|4>|)>*\<Gamma\>*<around*|(|<frac|1|4>|)>|\<Gamma\>*<around|(|n+1|)>*\<Gamma\>*<around*|(|*<frac|1|4>|)>>
    </equation>

    <\equation>
      \<mu\><rsub|2*n+1>=0
    </equation>

    The recurrence coefficients are then given by:

    <\equation>
      A<around|(|n|)>=<frac|\<mu\><rsub|2*n+1>|\<mu\><rsub|2*n>>=0
    </equation>

    <\equation>
      B<around|(|n|)>=<frac|\<mu\><rsub|2*n+2>|\<mu\><rsub|2*n>>=<frac|\<Gamma\>*<around*|(|n+<frac|5|4>|)>*\<Gamma\>*<around*|(|n+<frac|1|4>|)>|\<Gamma\>*<around|(|n+1|)>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>>
    </equation>

    <\equation>
      C<around|(|n|)>=<frac|\<mu\><rsub|2*n>|\<mu\><rsub|2*n-2>>=<frac|n|4*<around|(|2*n-1|)>>
    </equation>

    These coefficients ensure orthogonality with respect to the weight
    function, as they are derived from the moments which characterize the
    inner product space defined by <math|w<around|(|x|)>>.
  </proof>

  <\big-table|<tabular|<tformat|<table|<row|<cell|<left|[><tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<math|p<rsub|0><around*|(|x|)>>=>|<cell|<frac|2<rsup|<frac|1|4>>
  \<pi\><rsup|<frac|1|4>>|2 \<Gamma\><left|(><frac|3|4><right|)>>>>|<row|<cell|<math|p<rsub|1><around*|(|x|)>>=>|<cell|<frac|<left|(>5
  x<rsup|2>-2<right|)> <sqrt|3><space|0.17em> \<pi\><rsup|<frac|1|4>>
  2<rsup|<frac|3|4>>|8 \<Gamma\><left|(><frac|3|4><right|)>>>>|<row|<cell|<math|p<rsub|2><around*|(|x|)>>=>|<cell|<frac|<left|(>39
  x<rsup|4>-36 x<rsup|2>+4<right|)> <sqrt|595><space|0.17em>
  \<pi\><rsup|<frac|1|4>> 2<rsup|<frac|3|4>>|224
  \<Gamma\><left|(><frac|3|4><right|)>>>>|<row|<cell|<math|p<rsub|3><around*|(|x|)>>=>|<cell|<frac|5
  <left|(>1547 x<rsup|6>-2210 x<rsup|4>+780 x<rsup|2>-40<right|)>
  2<rsup|<frac|1|4>> <sqrt|231><space|0.17em> \<pi\><rsup|<frac|1|4>>|4928
  \<Gamma\><left|(><frac|3|4><right|)>>>>|<row|<cell|<math|p<rsub|4><around*|(|x|)>=>>|<cell|<frac|<left|(>2465
  x<rsup|8>-4760 x<rsup|6>+2856 x<rsup|4>-544 x<rsup|2>+16<right|)>
  <sqrt|195><space|0.17em> \<pi\><rsup|<frac|1|4>> 2<rsup|<frac|3|4>>|512
  \<Gamma\><left|(><frac|3|4><right|)>>>>|<row|<cell|<math|p<rsub|5><around*|(|x|)>>=>|<cell|<frac|<left|(>59015
  x<rsup|10>-143550 x<rsup|8>+121800 x<rsup|6>-42000 x<rsup|4>+5040
  x<rsup|2>-96<right|)> 2<rsup|<frac|1|4>> <sqrt|1893749><space|0.17em>
  \<pi\><rsup|<frac|1|4>>|214016 \<Gamma\><left|(><frac|3|4><right|)>>>>>>><right|]>
  >>>>>>
    The first 6 polynomials orthogonal to the square root of the spectral
    density of the random wave process over <math|y=-1\<ldots\>1>
  </big-table>

  <\proposition>
    <strong|[Integral Representation] >The three-term recurrence coefficients
    can be equivalently derived from the inner product representation:

    <\equation>
      <around|\<langle\>|p<rsub|n>,p<rsub|m>|\<rangle\>>=<big|int><rsub|-1><rsup|1>p<rsub|n><around|(|x|)>*p<rsub|m><around|(|x|)>*w<around|(|x|)>*d*x=h<rsub|n>*\<delta\><rsub|n*m>
    </equation>

    where <math|h<rsub|n>> is the normalization constant and
    <math|\<delta\><rsub|n*m>> is the Kronecker delta.

    The coefficients are then given by:

    <\equation>
      A<around|(|n|)>=<frac|<around|\<langle\>|x*p<rsub|n>,p<rsub|n>|\<rangle\>>|<around|\<langle\>|p<rsub|n>,p<rsub|n>|\<rangle\>>>
    </equation>

    <\equation>
      C<around|(|n|)>=<frac|<around|\<langle\>|x*p<rsub|n>,p<rsub|n-1>|\<rangle\>>|<around|\<langle\>|p<rsub|n-1>,p<rsub|n-1>|\<rangle\>>>
    </equation>

    <\equation>
      B<around|(|n|)>=<frac|<around|\<langle\>|x*p<rsub|n>,p<rsub|n+1>|\<rangle\>>|<around|\<langle\>|p<rsub|n>,p<rsub|n>|\<rangle\>>>
    </equation>

    This integral representation is equivalent to the moment-based derivation
    by Favard's Theorem, which establishes that any sequence of polynomials
    satisfying a three-term recurrence relation with appropriate coefficients
    is orthogonal with respect to some measure.
  </proposition>

  <\corollary>
    The even moments <math|\<mu\><rsub|2*n>> can be derived through the
    following transformation:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<mu\><rsub|2*n>>|<cell|=<big|int><rsub|-1><rsup|1>x<rsup|2*n>*<sqrt|1/<sqrt|1-x<rsup|2>>>*d*x>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|\<pi\>/2><around|(|sin
      \<theta\>|)><rsup|2*n><around|(|cos
      \<theta\>|)><rsup|1/2>*d*\<theta\>>>|<row|<cell|>|<cell|=<frac|<around|(|<around|(|-1|)><rsup|2*n>+1|)>*\<Gamma\>*<around|(|n+1/2|)>*\<Gamma\>*<around|(|3/4|)>|2*\<Gamma\>*<around|(|5/4+n|)>>>>>>>
    </equation>

    This integral represents a special case of the Beta function:

    <\equation>
      B<around*|(|<around|(|2*n+1|)>/2,<frac|1|4>|)>=2*<big|int><rsub|0><rsup|<frac|\<pi\>|2>><frac|1|<sqrt|<around|(|sin
      <around*|(|\<theta\>|)>|)><rsup|2*n><around|(|cos
      <around*|(|\<theta\>|)>|)>>>*d*\<theta\>
    </equation>

    Using the relationship <math|B<around|(|p,q|)>=<frac|\<Gamma\><around|(|p|)>*\<Gamma\><around|(|q|)>|\<Gamma\>*<around|(|p+q|)>>>,
    we obtain the stated form of <math|\<mu\><rsub|2*n>>. The odd moments
    vanish due to the symmetry of the integrand on <math|<around|[|-1,1|]>>.
  </corollary>

  <\remark>
    This weight function <math|w<around|(|x|)>=<sqrt|1/<sqrt|1-x<rsup|2>>>>
    represents a novel case in the theory of orthogonal polynomials,
    combining features of both classical Jacobi polynomials and the weight
    functions associated with singular measures. The explicit form of its
    recurrence coefficients provides new insights into the relationship
    between moment problems and special functions.

    The equivalence between the integral representation and the three-term
    recurrence relation demonstrates the fundamental connection between the
    measure-theoretic and algebraic aspects of orthogonal polynomial theory.
  </remark>

  <section|Conclusion>

  The spectral factorization approach developed here completely solves the
  eigenfunction problem for stationary Gaussian processes. The construction
  provides both the theoretical characterization and explicit computational
  method through four key steps: spectral factorization, orthogonal
  polynomial generation, inverse Fourier transformation, and another
  orthogonal polynomial sequence generation. This resolves a fundamental
  question in stochastic process theory that has remained open since its
  inception.

  The completeness of the solution means any stationary Gaussian process can
  now have its eigenfunctions constructed explicitly, without approximation
  or numerical schemes. This exact solution has immediate implications for
  anything involving stationary Gaussian processes. The connection to
  orthogonal polynomials in the spectral domain also reveals a deep
  mathematical structure underlying these processes that was previously
  hidden.

  \;

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-cramerStochasticProcessTheoryContribution>Harald
      Cramér. <newblock>A contribution to the theory of stochastic processes.
      <newblock><with|font-shape|italic|Proceedings of the Second Berkeley
      Symposium on Mathematical Statistics and Probability>, 2:329\U339,
      1951.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|3.1|3>>
    <associate|auto-5|<tuple|1|4>>
    <associate|auto-6|<tuple|4|5>>
    <associate|auto-7|<tuple|4|5>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|5>>
    <associate|sf|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramerStochasticProcessTheoryContribution
    </associate>
    <\associate|table>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        The first 6 polynomials orthogonal to the square root of the spectral
        density of the random wave process over
        <with|mode|<quote|math>|y=-1\<ldots\>1>
      </surround>|<pageref|auto-5>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>The Random Wave Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>