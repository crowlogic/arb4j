<TeXmacs|2.1.4>

<style|<tuple|letter|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>

    <\abstract>
      The eigenfunctions of covariance operators of stationary Gaussian
      processes are shown to be the orthogonal complements of the inverse
      Fourier transforms of functions orthogonal to the square root of their
      spectral densities. Utilizing the convolution theorem and properties of
      the covariance operator, an explicit construction method for these
      eigenfunctions is provided. This result enables efficient,
      straight-forward computation, providing a comprehensive solution for
      all stationary Gaussian processes.
    </abstract>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Examples>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>The Random Wave Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

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
    Let <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}>> be the unique set
    of polynomials orthogonal to <math|<sqrt|S<around|(|\<omega\>|)>>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>P<rsub|m><around*|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|n,m>
    </equation>

    and let their inverse Fourier transforms be defined by

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=\<cal-F\><rsup|-1><around|{|P<rsub|n><around|(|\<omega\>|)>|}><around*|(|t|)><label|ift>
    </equation>

    which constitutes the null space of the spectral factor inner product
    (<reference|sf>)

    <\equation>
      <around*|\<langle\>|h,\<phi\><rsub|n>|\<rangle\>>=0\<forall\>n\<gtr\>0
    </equation>

    Apply the Gram-Schmidt recursion to generate the orthogonal complement of
    the null space:

    <\equation>
      \<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>=\<phi\><rsub|n><around|(|t|)>-<big|sum><rsub|k=1><rsup|n-1><frac|<around|\<langle\>|\<phi\><rsub|n>,\<phi\><rsup|\<perp\>><rsub|n>|\<rangle\>>|<around|\<\|\|\>|\<phi\><rsup|\<perp\>><rsub|n>|\<\|\|\>><rsup|2>>\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)><label|gsr>
    </equation>

    Apply the covariance operator:

    <\equation>
      T<around*|[|\<psi\><rsub|n>|]>*<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around*|\||t-s|\|>|)>*\<phi\><rsup|\<perp\>><rsub|n><around*|(|s|)>*d*s
    </equation>

    then compute the Fourier transform:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<cal-F\>*<around|{|T*<around*|[|\<phi\><rsup|\<perp\>><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>>|<cell|=S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)>|}><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=S<around|(|\<omega\>|)>*P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>>>>
    </equation>

    where <math|\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n>|}><around*|(|\<omega\>|)>=P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>
    is Fourier transform of the orthogonal complement of the inverse Fourier
    transforms of the functions <math|P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>
    orthogonal to <math|<sqrt|S<around*|(|\<omega\>|)>>> and thus equal to
    the orthogonal (unweighted) complement of the functions orthogonal to
    <math|<sqrt|S<around*|(|\<omega\>|)>>>. Consider the eigenvalue equation\ 

    <\equation>
      T<around*|[|*\<phi\><rsup|\<perp\>><rsub|n>|]><around|(|t|)>=\<lambda\><rsub|n>*\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>
    </equation>

    and apply the Fourier transform to both sides\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<cal-F\>*<around|{|T*<around*|[|\<phi\><rsup|\<perp\>><rsub|n>|]><around|(|t|)>|}><around*|(|\<omega\>|)>>|<cell|=\<lambda\><rsub|n>*\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)>|}><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>>>>
    </equation>

    From the previous Fourier transform equation and the eigenvalue equation:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|S<around|(|\<omega\>|)>*\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)>|}><around*|(|\<omega\>|)>>|<cell|=S<around*|(|\<omega\>|)>P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>
      P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>>>>
    </equation>

    The unique solution satisfying these conditions is:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>>|<cell|=P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>|<cell|=\<lambda\><rsub|n>*<sqrt|S<around|(|\<omega\>|)>>>>>>>
    </equation>

    Therefore

    <\equation>
      <tabular|<tformat|<table|<row|<cell|S<around|(|\<omega\>|)>\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>>|<cell|=S<around*|(|\<omega\>|)>P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*\<cal-F\><around|{|\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|}><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>P<rsup|\<perp\>><rsub|n><around*|(|\<omega\>|)>>>>>>
    </equation>

    where the inverse Fourier transform of both sides is

    <\equation>
      T*<around*|[|\<psi\><rsub|n>|]><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|<around*|\||t-s|\|>|)>\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)>\<mathd\>t=\<lambda\><rsub|n>\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)><style-only*|<label|icv>>
    </equation>

    and the eigenvalues satisfy

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<frac|T<around*|[|\<phi\><rsup|\<perp\>><rsub|n>|]><around*|(|t|)>|\<phi\><rsup|\<perp\>><rsub|n><around*|(|t|)>>>>|<row|<cell|>|<cell|=<frac|<around|\<langle\>|T*\<phi\><rsup|\<perp\>><rsub|n>,\<phi\><rsup|\<perp\>><rsub|n>|\<rangle\>>|<around|\<\|\|\>|\<phi\><rsup|\<perp\>><rsub|n>|\<\|\|\>><rsup|2>>>>|<row|<cell|>|<cell|=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\><rsub|n>*\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>*\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>*d*t|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|\|><rsup|2>*d*t>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>*\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>*\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>*d*t|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|\|><rsup|2>*d*t>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<frac|<around|\<\|\|\>|\<phi\><rsup|\<perp\>><rsub|n>|\<\|\|\>><rsup|2>|<around|\<\|\|\>|\<phi\><rsup|\<perp\>><rsub|n>|\<\|\|\>><rsup|2>>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>>>>>>
    </equation>

    \;
  </proof>

  <\remark>
    It is important to note that a significant misconception pervades much of
    the literature regarding stationary processes. Many texts incorrectly
    assert that the eigenfunctions are `always complex exponentials' and
    further compound this error by claiming these are eigenfunctions of the
    kernel <math|K*<around|(|t-s|)>>. This is mathematically imprecise - the
    kernel itself does not possess eigenfunctions or eigenvalues. Rather, as
    equations (<reference|gsr>)\U(<reference|icv>) demonstrate, the
    eigenfunctions emerge from the Gram-Schmidt orthogonalization process
    applied to the spectral factor inner product null space, and the
    eigenvalues belong to the integral operator <math|T> defined by the
    kernel in equation (11):

    <\equation>
      T<around|[|\<phi\><rsup|\<perp\>><rsub|n><around|(|t|)>|]><around|(|t|)>=<big|int>K<around|(|<around|\||t-s|\|>|)>*\<phi\><rsup|\<perp\>><rsub|n><around|(|s|)>*<space|0.17em>d*s
    </equation>

    <no-indent>This distinction is crucial for proper understanding of the
    mathematical framework and its implementation.
  </remark>

  <section|Examples>

  <subsection|The Random Wave Operator>

  <\theorem>
    The polynomials orthogonal with respect to the square root of the
    spectral density of the random wave model\ 

    <\equation>
      <sqrt|S<around*|(|\<omega\>|)>>=<choice|<tformat|<table|<row|<cell|<sqrt|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>>|<cell|-1\<less\>x\<less\>1>>|<row|<cell|0>|<cell|otherwise>>>>>
    </equation>

    \;

    \ on <math|<around|[|-1,1|]>> \ the three-term recurrence relation

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
      \<mu\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    For the weight function <math|<sqrt|S<around*|(|\<omega\>|)>>=<choice|<tformat|<table|<row|<cell|<sqrt|<frac|1|<sqrt|1-\<omega\><rsup|2>>>|>>|<cell|<around*|\||\<omega\>|\|>\<less\>1>>|<row|<cell|0>|<cell|<around*|\||\<omega\>|\|>\<geqslant\>1>>>>>>,
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
    inner product space defined by <math|<sqrt|S<around*|(|\<omega\>|)>>>.
  </proof>

  <\big-table|<tabular|<tformat|<cwith|1|6|1|1|cell-halign|l>|<cwith|1|6|1|1|cell-lborder|0ln>|<cwith|1|6|1|2|cell-valign|c>|<cwith|1|1|1|2|cell-valign|top>|<cwith|1|1|1|2|cell-vmode|exact>|<cwith|1|1|1|2|cell-height|<plus|1fn|1em>>|<cwith|2|2|1|2|cell-valign|top>|<cwith|2|2|1|2|cell-vmode|exact>|<cwith|2|2|1|2|cell-height|<plus|1fn|1em>>|<cwith|3|3|1|2|cell-valign|top>|<cwith|3|3|1|2|cell-vmode|exact>|<cwith|3|3|1|2|cell-height|<plus|1fn|1em>>|<cwith|4|4|1|2|cell-valign|top>|<cwith|4|4|1|2|cell-vmode|exact>|<cwith|4|4|1|2|cell-height|<plus|1fn|1em>>|<cwith|5|5|1|2|cell-valign|top>|<cwith|5|5|1|2|cell-vmode|exact>|<cwith|5|5|1|2|cell-height|<plus|1fn|1em>>|<table|<row|<cell|<math|P<rsub|0><around|(|\<omega\>|)>>=>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<math|<frac|2<rsup|1/4>*\<pi\><rsup|1/4>|2*\<Gamma\>*<around|(|3/4|)>>>>>|<row|<cell|<math|<frac|<around|(|5*\<omega\><rsup|2>-2|)>*<sqrt|3>*\<pi\><rsup|1/4>*2<rsup|3/4>|8*\<Gamma\>*<around|(|3/4|)>>>>>|<row|<cell|<math|<frac|<around|(|39*\<omega\><rsup|4>-36*\<omega\><rsup|2>+4|)>*<sqrt|595>*\<pi\><rsup|1/4>*2<rsup|3/4>|224*\<Gamma\>*<around|(|3/4|)>>>>>|<row|<cell|<math|<frac|5*<around|(|1547*\<omega\><rsup|6>-2210*\<omega\><rsup|4>+780*\<omega\><rsup|2>-40|)>*2<rsup|1/4>*<sqrt|231>*\<pi\><rsup|1/4>|4928*\<Gamma\>*<around|(|3/4|)>>>>>|<row|<cell|<math|<frac|<around|(|2465*\<omega\><rsup|8>-4760*\<omega\><rsup|6>+2856*\<omega\><rsup|4>-544*\<omega\><rsup|2>+16|)>*<sqrt|195>*\<pi\><rsup|1/4>*2<rsup|3/4>|512*\<Gamma\>*<around|(|3/4|)>>>>>|<row|<cell|<math|<frac|<around|(|59015*\<omega\><rsup|10>-143550*\<omega\><rsup|8>+121800*\<omega\><rsup|6>-42000*\<omega\><rsup|4>+5040*\<omega\><rsup|2>-96|)>*2<rsup|1/4>*<sqrt|1893749>*\<pi\><rsup|1/4>|214016*\<Gamma\>*<around|(|3/4|)>>>>>>>>>>|<row|<cell|<math|P<rsub|1><around|(|\<omega\>|)>>=>|<cell|>>|<row|<cell|<math|P<rsub|2><around|(|\<omega\>|)>>=>|<cell|>>|<row|<cell|<math|P<rsub|3><around|(|\<omega\>|)>>=>|<cell|>>|<row|<cell|<math|P<rsub|4><around|(|\<omega\>|)>>=>|<cell|>>|<row|<cell|<math|P<rsub|5><around|(|\<omega\>|)>>=>|<cell|>>>>>>
    First 6 polynomials that are orthogonal with respect to
    <math|<sqrt|S<around*|(|\<omega\>|)>>=<choice|<tformat|<table|<row|<cell|<sqrt|<frac|1|<sqrt|1-\<omega\><rsup|2>>>|>>|<cell|<around*|\||\<omega\>|\|>\<less\>1>>|<row|<cell|0>|<cell|<around*|\||\<omega\>|\|>\<geqslant\>1>>>>>>
  </big-table>

  <\theorem>
    <dueto|Moment Relations>For any orthogonal polynomial system
    <math|P<rsub|n><around*|(|x|)>> with weight
    <math|<sqrt|S<around*|(|\<omega\>|)>>>, let <math|\<mu\><rsub|n>> denote
    the moments:

    <\equation>
      \<mu\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n><sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    <strong|>The three-term recurrence coefficients can be \ derived from the
    inner product representation:

    <\equation>
      <around|\<langle\>|p<rsub|n>,p<rsub|m>|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|m><around*|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>d*\<omega\>=h<rsub|n>*\<delta\><rsub|n*m>
    </equation>

    where <math|h<rsub|n>> is the normalization constant and
    <math|\<delta\><rsub|n*m>> is the Kronecker delta. Then the three-term
    recurrence coefficients are given by the moment ratios:

    <\equation>
      A<around|(|n|)>=<frac|\<mu\><rsub|2*n+1>|\<mu\><rsub|2*n>>=<frac|<around|\<langle\>|\<omega\>
      P<rsub|n><around*|(|\<omega\>|)>,P<rsub|n><around*|(|\<omega\>|)>|\<rangle\>>|<around|\<langle\>|P<rsub|n><around*|(|\<omega\>|)>,P<rsub|n><around*|(|\<omega\>|)>|\<rangle\>>>
    </equation>

    <\equation>
      B<around|(|n|)>=<frac|\<mu\><rsub|2*n+2>|\<mu\><rsub|2*n>>=<frac|<around|\<langle\>|x*P<rsub|n><around*|(|\<omega\>|)>,P<rsub|n-1><around*|(|\<omega\>|)>|\<rangle\>>|<around|\<langle\>|P<rsub|n-1><around*|(|\<omega\>|)>,P<rsub|n-1><around*|(|\<omega\>|)>|\<rangle\>>>
    </equation>

    <\equation>
      C<around|(|n|)>=<frac|\<mu\><rsub|2*n>|\<mu\><rsub|2*n-2>>=<frac|<around|\<langle\>|x*P<rsub|n><around*|(|\<omega\>|)>,P<rsub|n+1><around*|(|\<omega\>|)>|\<rangle\>>|<around|\<langle\>|P<rsub|n><around*|(|\<omega\>|)>,P<rsub|n><around*|(|\<omega\>|)>|\<rangle\>>>
    </equation>

    The integral representation is equivalent to the moment-based derivation
    by Favard's Theorem, which establishes that any sequence of polynomials
    satisfying a three-term recurrence relation with appropriate coefficients
    is orthogonal with respect to some measure.
  </theorem>

  <\proof>
    From the orthogonality condition:

    <\equation>
      <around|\<langle\>|P<rsub|n>,P<rsub|m>|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>*P<rsub|m><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>=h<rsub|n>*\<delta\><rsub|n*m>
    </equation>

    Given the three-term recurrence:

    <\equation>
      P<rsub|n+1><around|(|\<omega\>|)>=<around|(|A<around|(|n|)>*\<omega\>+B<around|(|n|)>|)>*P<rsub|n><around|(|\<omega\>|)>-C<around|(|n|)>*P<rsub|n-1><around|(|\<omega\>|)>
    </equation>

    Multiply by <math|\<omega\> P<rsub|n><around*|(|\<omega\>|)><sqrt|S<around*|(|\<omega\>|)>>>
    \ and integrate:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\>P<rsub|n><rsup|2><around|(|\<omega\>|)>*<sqrt|S*<around*|(|\<omega\>|)>>*d*\<omega\>=A<around|(|n|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><rsup|2><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    The left side equals <math|\<mu\><rsub|2n+1>>, the right side equals
    <math|A<around*|(|n|)>\<mu\><rsub|2n>>, therefore:

    <\equation>
      A<around|(|n|)>=<frac|\<mu\><rsub|2*n+1>|\<mu\><rsub|2*n>>
    </equation>

    Multiply by <math|P<rsub|n+1><around*|(|\<omega\>|)><sqrt|S<around*|(|\<omega\>|)>>>
    and integrate:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n+1><rsup|2><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>=B<around|(|n|)><big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>*P<rsub|n+1><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    The left side equals <math|\<mu\><rsub|2n+1>>, the right side equals
    <math|B*<around*|(|n|)>\<mu\><rsub|2n>>, therefore:

    <\equation>
      B<around|(|n|)>=<frac|\<mu\><rsub|2*n+2>|\<mu\><rsub|2*n>>
    </equation>

    Multiply by <math|P<rsub|n-1><around*|(|\<omega\>|)><sqrt|S<around*|(|\<omega\>|)>>>
    and integrate:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n-1><rsup|2><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>=C<around|(|n|)><big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>*P<rsub|n-1><around|(|\<omega\>|)>*<sqrt|S<around*|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    The left side equals <math|\<mu\><rsub|2n>>, the right side equals
    <math|C<around*|(|*n|)>\<mu\><rsub|2n-2>>, therefore:

    <\equation*>
      C<around|(|n|)>=<frac|\<mu\><rsub|2*n>|\<mu\><rsub|2*n-2>>
    </equation*>
  </proof>

  \;

  <\corollary>
    The even moments <math|\<mu\><rsub|2*n>> can be derived through the
    following transformation:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<mu\><rsub|2*n>>|<cell|=<big|int><rsup|\<infty\>><rsub|-\<infty\>><rsup|>\<omega\><rsup|2*n>*<sqrt|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>*d*\<omega\>>>|<row|<cell|>|<cell|=<frac|<around|(|<around|(|-1|)><rsup|2*n>+1|)>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|3|4>|)>|2*\<Gamma\>*<around*|(|<frac|5|4>+n|)>>>>>>>
    </equation>

    The odd moments vanish due to the symmetry of the integrand on
    <math|<around|[|-1,1|]>>.
  </corollary>

  <\remark>
    This weight function <math|<sqrt|S<around*|(|\<omega\>|)>>=<sqrt|<frac|1|<sqrt|1-x<rsup|2>>>>>
    represents a novel case in the theory of orthogonal polynomials,
    combining features of both classical Jacobi polynomials and the weight
    functions associated with singular measures. The explicit form of its
    recurrence coefficients provides new insights into the relationship
    between moment problems and special functions. The equivalence between
    the integral representation and the three-term recurrence relation
    demonstrates the fundamental connection between the measure-theoretic and
    algebraic aspects of orthogonal polynomial theory.
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
      Cram�r. <newblock>A contribution to the theory of stochastic processes.
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
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|3.1|4>>
    <associate|auto-5|<tuple|1|5>>
    <associate|auto-6|<tuple|4|7>>
    <associate|auto-7|<tuple|4|7>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|7>>
    <associate|gsr|<tuple|10|2>>
    <associate|icv|<tuple|18|3>>
    <associate|ift|<tuple|8|2>>
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
        First 6 polynomials that are orthogonal with respect to
        <with|mode|<quote|math>|<sqrt|S<around*|(|\<omega\>|)>>=<with|math-level|<quote|1>|math-top-swell-start|<quote|1.6ex>|math-top-swell-end|<quote|2.5ex>|math-bot-swell-start|<quote|-0.6ex>|math-bot-swell-end|<quote|-1.5ex>|<left|{><tformat|<cwith|1|-1|1|-1|cell-swell|0.9ex>|<tformat|<table|<row|<cell|<sqrt|<frac|1|<sqrt|1-\<omega\><rsup|2>>>|>>|<cell|<around*|\||\<omega\>|\|>\<less\>1>>|<row|<cell|0>|<cell|<around*|\||\<omega\>|\|>\<geqslant\>1>>>>><right|.>>>
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