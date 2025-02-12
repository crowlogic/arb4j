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
    Legendre polynomials are hypergeometric functions

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

  \;

  <section|Main Theorem>

  <\theorem>
    <dueto|Fourier Transform of Legendre Polynomial Products>The Fourier
    transform of the product of a pair of Legendre polynomials is the
    convolution of a pair of spherical Bessel functions of the first kind
    which can be expressed as

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|I<rsub|m,n><around|(|y|)>>|<cell|=<big|int><rsub|-1><rsup|1>P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>*e<rsup|i*x*y>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n>\<Psi\><rsub|j><around|(|m,n|)><frac|\<gamma\><around|(|j+1,2*i*y|)>|2<rsup|j>*<around|(|i*y|)><rsup|j+1>>>>>>>
    </equation>

    where

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<frac|<rsub|4>F<rsub|3><space|-0.17em><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,<space|0.17em>m+1,<space|0.17em>-n,<space|0.17em>n+1>>|<row|<cell|1,<space|0.17em>1,<space|0.17em>j+1>>>>>;1|)>|j!>
    </equation>
  </theorem>

  Expand both polynomials using their hypergeometric representations:

  <\equation>
    P<rsub|m><around|(|x|)>=<big|sum><rsub|k=0><rsup|m><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|<around|(|1|)><rsub|k>*k!><around*|(|<frac|1-x|2>|)><rsup|k>
  </equation>

  <\equation>
    P<rsub|n><around|(|x|)>=<big|sum><rsub|\<ell\>=0><rsup|n><frac|<around|(|-n|)><rsub|\<ell\>>*<around|(|n+1|)><rsub|\<ell\>>|<around|(|1|)><rsub|\<ell\>>*\<ell\>!><around*|(|<frac|1-x|2>|)><rsup|\<ell\>>
  </equation>

  Their product becomes:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>>|<cell|=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|\<ell\>=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|\<ell\>>*<around|(|n+1|)><rsub|\<ell\>>|<around|(|1|)><rsub|k><around|(|1|)><rsub|\<ell\>>*k!\<ell\>!><around*|(|<frac|1-x|2>|)><rsup|k+\<ell\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|\<ell\>=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|\<ell\>>*<around|(|n+1|)><rsub|\<ell\>>|k!<rsup|2>
    \<ell\>!<rsup|2>><around*|(|<frac|1-x|2>|)><rsup|k+\<ell\>>>>>>>
  </equation>

  Reorganize using <math|j=k+\<ell\>>, with explicit summation bounds:

  <\equation>
    P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>=<big|sum><rsub|j=0><rsup|m+n><wide*|<big|sum><rsub|k=max
    <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|j-k>*k!<around|(|j-k|)>!>|\<wide-underbrace\>><rsub|\<Psi\><rsub|j><around|(|m,n|)>><around*|(|<frac|1-x|2>|)><rsup|j>
  </equation>

  The inner sum coefficients are:

  <\equation>
    \<Psi\><rsub|j><around|(|m,n|)>=<big|sum><rsub|k=max
    <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|j-k>*k!<around|(|j-k|)>!>
  </equation>

  Apply the identities:

  <\align>
    <tformat|<table|<row|<cell|<around|(|-n|)><rsub|j-k>>|<cell|=<around|(|-1|)><rsup|j-k><frac|\<Gamma\>*<around|(|n+1|)>|\<Gamma\>*<around|(|n-j+k+1|)>><eq-number>>>|<row|<cell|<around|(|n+1|)><rsub|j-k>>|<cell|=<frac|\<Gamma\>*<around|(|n+j-k+1|)>|\<Gamma\>*<around|(|n+1|)>><eq-number>>>|<row|<cell|<around|(|-a|)><rsub|n>*<around|(|a+1|)><rsub|n>>|<cell|=<around|(|-1|)><rsup|n><frac|\<Gamma\>*<around|(|a+1|)>|\<Gamma\>*<around|(|a-n+1|)>><eq-number>>>>>
  </align>

  so that the substitutions

  <\equation>
    <around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>=<frac|<around|(|-1|)><rsup|j-k>*\<Gamma\>*<around|(|n+j-k+1|)>|\<Gamma\>*<around|(|n-j+k+1|)>>
  </equation>

  and <math|h=j-k> can be made so that <math|\<Psi\><rsub|j><around|(|m,n|)>>
  can be expressed as

  <\equation>
    \<Psi\><rsub|j><around|(|m,n|)>=<around|(|-1|)><rsup|j>*<big|sum><rsub|h=0><rsup|min
    <around|(|n,j|)>-max <around|(|0,j-m|)>><frac|<around|(|-m|)><rsub|j-h>*<around|(|m+1|)><rsub|j-h>*\<Gamma\>*<around|(|n+h+1|)>|<around|(|j-h|)>!<rsup|2>\<Gamma\>*<around|(|n-j+h+1|)>*h!>
  </equation>

  to reveal the hypergeometric form by reversing the index transformation:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<Psi\><rsub|j><around|(|m,n|)>>|<cell|=<frac|1|j!>*<big|sum><rsub|k=0><rsup|min
    <around|(|j,m,n|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|k>*<around|(|j+1|)><rsub|k>*k!>>>|<row|<cell|>|<cell|=<frac|<rsub|4>F<rsub|3><space|-0.17em><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>>>>>>
  </equation>
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
    <associate|a|<tuple|19|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|fi|<tuple|4|?>>
    <associate|foi|<tuple|4|?>>
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