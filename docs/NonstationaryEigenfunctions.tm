<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Non-Stationary Covariance Operators
  via Wigner-Ville Distribution>|<doc-date|This is probably mostly wrong but
  almost right>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Construction
    of Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Orthogonal Polynomials in
    Time-Frequency Domain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|3.2<space|2spc>Time-Domain Basis Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|3.3<space|2spc>Orthogonalization in Time Domain
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Eigenfunction
    Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Eigenfunction
    Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Null
    Space Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Eigenfunctions
    from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  We present a rigorous mathematical framework for constructing
  eigenfunctions of non-stationary covariance operators using the
  Wigner-Ville distribution. This approach extends the eigenfunction method
  typically used for stationary processes to the non-stationary case.

  <section|Preliminaries>

  Let <math|X<around|(|t|)>> be a non-stationary stochastic process with
  covariance function <math|K<around|(|s,t|)>>. The Wigner-Ville distribution
  <math|W<around|(|t,\<omega\>|)>> and the covariance function
  <math|K<around|(|s,t|)>> are related by the following Fourier transform
  pair:

  <\equation>
    W<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around*|(|t+<frac|\<tau\>|2>,t-<frac|\<tau\>|2>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  <\equation>
    K<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<around*|(|<frac|s+t|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<omega\>
  </equation>

  <section|Construction of Eigenfunctions>

  <subsection|Orthogonal Polynomials in Time-Frequency Domain>

  We define polynomials <math|p<rsub|n><around|(|t,\<omega\>|)>> orthogonal
  with respect to <math|W<around|(|t,\<omega\>|)>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|t,\<omega\>|)>*p<rsub|m><around|(|t,\<omega\>|)>*W<around|(|t,\<omega\>|)>*d*t*d*\<omega\>=\<delta\><rsub|n*m>
  </equation>

  where <math|\<delta\><rsub|n*m>> is the Kronecker delta.

  <subsection|Time-Domain Basis Functions>

  We transform the orthogonal polynomials to the time domain:

  <\equation>
    r<rsub|n><around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around*|(|<frac|s+t|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<omega\>
  </equation>

  <subsection|Orthogonalization in Time Domain>

  We orthogonalize the functions <math|r<rsub|n><around|(|s,t|)>> with
  respect to <math|K<around|(|s,t|)>>:

  <\equation>
    \<psi\><rsub|n><around|(|s,t|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|s,t|)>
  </equation>

  where the coefficients <math|a<rsub|n*k>> are determined by:

  <\equation>
    a<rsub|n*k>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>><rsub|K>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>
  </equation>

  Here, <math|<around|\<langle\>|f,g|\<rangle\>><rsub|K>> denotes the inner
  product with respect to <math|K>:

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|K>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|s,t|)>*g<around|(|s,t|)>*K<around|(|s,t|)>*d*s*d*t
  </equation>

  <section|Eigenfunction Property>

  <\theorem>
    The functions <math|\<psi\><rsub|n><around|(|s,t|)>> are eigenfunctions
    of the covariance operator <math|T> defined by:

    <\equation>
      <around|(|T*f|)><around|(|s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*f<around|(|t|)>*d*t
    </equation>
  </theorem>

  <\proof>
    We need to show that <math|T*\<psi\><rsub|n><around|(|s,u|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|s,u|)>>
    for some <math|\<lambda\><rsub|n>>.

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*\<psi\><rsub|n><around|(|t,u|)>*d*t>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|t,u|)>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*r<rsub|k><around|(|t,u|)>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|k>*<around*|(|<frac|t+u|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-u|)>>*d*\<omega\>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|k><around*|(|<frac|s+u|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-u|)>>*d*\<omega\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*t>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|s,u|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|s,u|)>>>>>
    </align*>

    where

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|s,t|)>*\<psi\><rsub|n><around|(|s,t|)>*d*s*d*t
    </equation>
  </proof>

  <section|Eigenfunction Expansion>

  The process <math|X<around|(|t|)>> can now be represented as:

  <\equation>
    X<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n>*\<psi\><rsub|n><around|(|t,t|)>
  </equation>

  where <math|\<xi\><rsub|n>> are uncorrelated random variables with
  <math|E<around|[|\<xi\><rsub|n>|]>=0> and
  <math|E*<around|[|\<xi\><rsub|n>*\<xi\><rsub|m>|]>=\<delta\><rsub|n*m>>.

  <section|Conclusion>

  This framework provides a rigorous approach to extending the eigenfunction
  method to non-stationary processes using the Wigner-Ville distribution. The
  key steps are:

  <\enumerate>
    <item>Construct orthogonal polynomials in the time-frequency domain.

    <item>Transform these to the time domain.

    <item>Orthogonalize the resulting functions with respect to the
    covariance function.

    <item>Prove that these functions are eigenfunctions of the covariance
    operator.
  </enumerate>

  <doc-data|<doc-title|Eigenfunctions of Non-Stationary Operators via
  Wigner-Ville Isomorphism>|<doc-date|<date|>>>

  <\theorem>
    Let <math|C<around|(|t,s|)>> be the covariance function of a
    non-stationary Gaussian process on <math|\<bbb-R\>>. The covariance
    operator <math|T> is defined by:

    <\equation*>
      <around|(|T*f|)><around|(|t|)>=<big|int>C<around|(|t,s|)>*f<around|(|s|)>*<space|0.17em>d*s
    </equation*>

    The Wigner-Ville distribution <math|W<around|(|t,\<omega\>|)>> of the
    process is related to <math|C<around|(|t,s|)>> by:

    <\equation*>
      W<around|(|t,\<omega\>|)>=<big|int>C<around|(|t+\<tau\>/2,t-\<tau\>/2|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>
    </equation*>

    Conversely:

    <\equation*>
      C<around|(|t,s|)>=<big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*<space|0.17em>d*\<omega\>
    </equation*>

    We consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>|}>>
    orthogonal with respect to the spectral density
    <math|S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>>:

    <\equation*>
      <big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*p<rsub|m><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>=\<delta\><rsub|n*m>
    </equation*>

    where\ 

    <\equation>
      S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>=<frac|1|2*\<pi\>>*<big|int>W<around|(|t,<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>/2|)>*e<rsup|-i*t*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>>*<space|0.17em>d*t
    </equation>

    The inverse Fourier transforms of these polynomials are:

    <\equation>
      r<rsub|n><around|(|t,s|)>=<frac|1|2*\<pi\>>*<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*\<omega\><rsub|1>*t-i*\<omega\><rsub|2>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation>
  </theorem>

  <section|Null Space Property>

  <\theorem>
    \ <math|r<rsub|n><around|(|t,s|)>> forms the null space of the kernel
    inner product:

    <\equation>
      <big|int><big|int>C<around|(|t,s|)>*r<rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s=0
    </equation>
  </theorem>

  <\proof>
    <\align*>
      <tformat|<table|<row|<cell|>|<cell|<big|int><big|int>C<around|(|t,s|)>*r<rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><big|int><around*|[|<big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*<space|0.17em>d*\<omega\>|]>\<times\><around*|[|<frac|1|2*\<pi\>>*<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*\<omega\><rsub|1>*t-i*\<omega\><rsub|2>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><big|int><big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>\<times\><around*|[|<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\>|)>*t-i*<around|(|\<omega\><rsub|2>-\<omega\>|)>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*\<omega\>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><big|int><big|int>W<around|(|u,\<omega\>|)><around*|[|<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\>|)>*<around|(|u+v/2|)>-i*<around|(|\<omega\><rsub|2>-\<omega\>|)>*<around|(|u-v/2|)>>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*\<omega\>*<space|0.17em>d*u*<space|0.17em>d*v>>|<row|<cell|>|<cell|<space|1em><text|(substituting
      <math|u=<frac|t+s|2>>, <math|v=t-s>)>>>|<row|<cell|>|<cell|=<big|int><big|int>W<around|(|u,\<omega\>|)>*p<rsub|n><around|(|\<omega\>,\<omega\>|)>*<space|0.17em>d*u*<space|0.17em>d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><big|int>S<around|(|\<omega\>,\<omega\>|)>*p<rsub|n><around|(|\<omega\>,\<omega\>|)>*<space|0.17em>d*\<omega\>=0<space|1em><text|(by
      orthogonality)>>>>>
    </align*>
  </proof>

  <section|Eigenfunctions from Orthogonalized Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|t,s|)>|}>>,
  we obtain the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|t,s|)>|}>>
  of the covariance operator <math|T>. The orthogonalization process gives:

  <\equation>
    \<psi\><rsub|n><around|(|t,s|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>
  </equation>

  where the coefficients <math|a<rsub|n*k>> are given by:

  <\equation>
    a<rsub|n*k>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>
  </equation>

  We prove that these are indeed eigenfunctions:

  <\proof>
    Let

    <\equation>
      \<psi\><rsub|n><around|(|t,s|)>=<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>
    </equation>

    Then:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int>C<around|(|t,u|)>*\<psi\><rsub|n><around|(|u,s|)>*<space|0.17em>d*u>|<cell|=<big|int>C<around|(|t,u|)>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|u,s|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<big|int>C<around|(|t,u|)>*r<rsub|k><around|(|u,s|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<around*|[|r<rsub|k><around|(|t,s|)>*<big|int><big|int>C<around|(|u,v|)>*\<psi\><rsub|n><around|(|u,v|)>*<space|0.17em>d*u*<space|0.17em>d*v|\<nobracket\>>>>|<row|<cell|>|<cell|<space|1em><around*|\<nobracket\>|-<big|int><big|int>C<around|(|u,v|)>*\<partial\><rsub|t>*r<rsub|k><around|(|t-u,s-v|)>*<space|0.17em>d*u*<space|0.17em>d*v|]>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t,s|)>>>>>>
    </equation>

    where the eigenvalue <math|\<lambda\><rsub|n>> is given by:

    <\equation>
      \<lambda\><rsub|n>=<big|int><big|int>C<around|(|t,s|)>*\<psi\><rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s
    </equation>
  </proof>

  The eigenfunctions of the non-stationary process are then given by:

  <\equation>
    \<phi\><rsub|n><around|(|t|)>=\<psi\><rsub|n><around|(|t,t|)>
  </equation>

  Thus, we have shown that the orthogonalized null space functions are
  eigenfunctions of the non-stationary covariance operator, providing a
  direct method to construct eigenfunctions for non-stationary operators. The
  eigenvalues are determined by the inner product of the covariance function
  with the corresponding eigenfunction.
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
    <associate|auto-10|<tuple|7|5>>
    <associate|auto-11|<tuple|8|5>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|3.1|2>>
    <associate|auto-5|<tuple|3.2|2>>
    <associate|auto-6|<tuple|3.3|2>>
    <associate|auto-7|<tuple|4|2>>
    <associate|auto-8|<tuple|5|3>>
    <associate|auto-9|<tuple|6|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Construction
      of Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Orthogonal Polynomials in
      Time-Frequency Domain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Time-Domain Basis Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Orthogonalization in Time
      Domain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Eigenfunction
      Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Eigenfunction
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Null
      Space Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Eigenfunctions
      from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>