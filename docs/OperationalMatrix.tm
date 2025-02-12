<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Operational Matrix of the Random Wave
  Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    Department of Intuition

    The Royal Citadel of Pure Being<hlink||mailto:your.email@example.com>
  </author-affiliation>>>|<doc-date|<date|>>>

  <\abstract>
    An expression for the convolution of a pair of spherical Bessel functions
    is determined.
  </abstract>

  <section|Lemmas>

  <\lemma>
    <dueto|Terminating Hypergeometric Series><label|lem:HyperExpansions>For
    any <math|p\<in\>\<bbb-Z\><rsub|\<geq\>0>>, the Gauss hypergeometric
    function terminates:

    <\equation>
      <rsub|2>F<rsub|1><around|(|-p,b;c;z|)>=<big|sum><rsub|k=0><rsup|p><frac|<around|(|-p|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>

    where <math|<around|(|a|)><rsub|k>=<big|prod><rsub|i=0><rsup|k-1><around|(|a+i|)>>
  </lemma>

  <\proof>
    By definition, the Gauss hypergeometric series is:

    <\equation>
      <rsub|2>F<rsub|1><around|(|a,b;c;z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|a|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>

    Setting <math|a=-p> with <math|p\<in\>\<bbb-Z\><rsub|\<geq\>0>>, the
    Pochhammer symbol <math|<around|(|-p|)><rsub|k>> becomes zero for all
    <math|k\<gtr\>p>. Explicitly:

    <\equation>
      <around|(|-p|)><rsub|k>=<big|prod><rsub|i=0><rsup|k-1><around|(|-p+i|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|-p|)>*<around|(|-p+1|)>*\<cdots\>*<around|(|-p+k-1|)>,>|<cell|k\<leq\>p>>|<row|<cell|0>|<cell|k\<gtr\>p>>>>>|\<nobracket\>>
    </equation>

    Thus, the series terminates at <math|k=p>, yielding:

    <\equation>
      <rsub|2>F<rsub|1><around|(|-p,b;c;z|)>=<big|sum><rsub|k=0><rsup|p><frac|<around|(|-p|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>
  </proof>

  <\lemma>
    <dueto|Integral with Incomplete Gamma
    Function><label|lem:IntegralGamma>For <math|j\<geq\>0>,

    <\equation>
      <big|int><rsub|-1><rsup|1><around*|(|<frac|1-x|2>|)><rsup|j>*e<rsup|i*x*y>*d*x=<frac|e<rsup|i*y>|2<rsup|j>>*<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>
    </equation>

    where <math|\<gamma\><around|(|s,x|)>> denotes the lower incomplete gamma
    function.
  </lemma>

  <\proof>
    Substitute <math|t=<frac|1-x|2>\<Longrightarrow\>x=1-2*t>,
    <math|d*x=-2*d*t>, adjusting limits:

    <\equation>
      <big|int><rsub|1><rsup|0>t<rsup|j>*e<rsup|i*<around|(|1-2*t|)>*y>*<around|(|-2*d*t|)>=2*e<rsup|i*y>*<big|int><rsub|0><rsup|1>t<rsup|j>*e<rsup|-2*i*y*t>*d*t
    </equation>

    Let <math|u=2*i*y*t\<Longrightarrow\>t=<frac|u|2*i*y>>, <math|d*t=<frac|d
    u|2 i y>>:

    <\equation*>
      <frac|2*e<rsup|i*y>|<around|(|2*i*y|)><rsup|j+1>>*<big|int><rsub|0><rsup|2*i*y>u<rsup|j>*e<rsup|-u>*d*u=<frac|e<rsup|i*y>|2<rsup|j>>*<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>
    </equation*>
  </proof>

  <\lemma>
    <dueto|Legendre Polynomial Representation><label|lem:Legendre>The
    hypergeometric function quals the Legendre polynomial
    <math|P<rsub|m><around|(|x|)>>. The Legendre polynomials are
    hypergeometric functions

    <\equation>
      P<rsub|m><around*|(|x|)>=<rsub|2>F<rsub|1><around|(|-m,m+1;1;<tfrac|1-x|2>|)>
    </equation>
  </lemma>

  <\proof>
    From the Rodrigues formula <math|P<rsub|m><around|(|x|)>=<frac|1|2<rsup|m>*m!>*<frac|d<rsup|m>|d*x<rsup|m>>*<around|(|x<rsup|2>-1|)><rsup|m>>
    expand using the binomial theorem:

    <\equation>
      <around|(|x<rsup|2>-1|)><rsup|m>=<big|sum><rsub|k=0><rsup|m><around|(|-1|)><rsup|m-k><binom|m|k>x<rsup|2*k>
    </equation>

    Differentiating <math|m> times yields terms proportional to
    <math|x<rsup|k>>, matching the hypergeometric series:

    <\equation*>
      P<rsub|m><around|(|x|)>=<rsub|2>F<rsub|1><around*|(|-m,m+1;1;<tfrac|1-x|2>|)>
    </equation*>
  </proof>

  <section|Main Theorem>

  <\theorem>
    <dueto|Fourier Transform of Legendre Polynomial
    Products><label|thm:MainResult>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|I<rsub|m,n><around|(|y|)>>|<cell|=<big|int><rsub|-1><rsup|1>P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>*e<rsup|i*x*y>*d*x>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|\<Psi\><rsub|j><around|(|m,n|)>|2<rsup|j>><around*|[|<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>|]>>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|<frac|<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>|2<rsup|j>><around*|[|<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>|]>>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!
      2<rsup|j>><frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|
      \<gamma\><around|(|j+1,2*i*y|)>|j! 2<rsup|j><around|(|i*y|)><rsup|j+1>><space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>>>>>>
    </equation>

    where\ 

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<frac|<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>*
    </equation>
  </theorem>

  <\proof>
    \;

    <with|font-series|bold|Part 1: Integral Reduction><next-line>Expand
    <math|P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>> using Lemma
    <reference|lem:HyperExpansions>:

    <\equation>
      P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|\<ell\>=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|\<ell\>>*<around|(|n+1|)><rsub|\<ell\>>|<around|(|1|)><rsub|k><around|(|1|)><rsub|\<ell\>>*k!\<ell\>!><around*|(|<tfrac|1-x|2>|)><rsup|k+\<ell\>>
    </equation>

    Let <math|j=k+\<ell\>>, valid for <math|0\<leq\>k\<leq\>m>,
    <math|0\<leq\>\<ell\>\<leq\>n>. Then:

    <\equation>
      I<rsub|m,n><around|(|y|)>=<big|sum><rsub|j=0><rsup|m+n><wide*|<big|sum><rsub|k=max
      <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|j-k>*k!<around|(|j-k|)>!>|\<wide-underbrace\>><rsub|\<Psi\><rsub|j><around|(|m,n|)>><big|int><rsub|-1><rsup|1><around*|(|<tfrac|1-x|2>|)><rsup|j>*e<rsup|i*x*y>*d*x
    </equation>

    Apply Lemma <reference|lem:IntegralGamma> to obtain the result.

    <with|font-series|bold|Part 2: <math|\<Psi\><rsub|j><around|(|m,n|)>> as
    a <math|<rsub|4>F<rsub|3>> Function><next-line>Expand the
    <math|<rsub|4>F<rsub|3>> series:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>>|<cell|=<big|sum><rsub|k=0><rsup|j><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|k>*<around|(|j+1|)><rsub|k>*k!>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|j><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|k!
      k!*<around|(|j+1|)><rsub|k>*k!>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|j><frac|<around|(|0-m|)><rsub|k>*<around|(|1+m|)><rsub|k>*<around|(|0-n|)><rsub|k>*<around|(|1+n|)><rsub|k>|<around|(|1+j|)><rsub|k>
      <around*|(|k!|)><rsup|3>*>>>>>>
    </equation>

    The main result follows.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|lem:HyperExpansions|<tuple|1|1>>
    <associate|lem:IntegralGamma|<tuple|2|2>>
    <associate|lem:Legendre|<tuple|3|2>>
    <associate|thm:MainResult|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Lemmas>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>