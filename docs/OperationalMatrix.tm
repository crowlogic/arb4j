<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Evaluation of an Integral Involving Hypergeometric
  Functions>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <\theorem>
    \;

    <\equation>
      <tabular|<tformat|<table|<row|<cell|I>|<cell|=<big|int><rsub|-1><rsup|1>*<rsub|2>F<rsub|1><around*|(|-m,m+1;1;<frac|1|2>-<frac|x|2>|)>*<rsub|2>F<rsub|1><around*|(|-n,n+1;1;<frac|1|2>-<frac|x|2>|)>*e<rsup|i*x*y><space|0.17em>d*x>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|s=0><rsup|m+n><frac|\<Gamma\>*<around|(|s+1|)>|2<rsup|s>*<around|(|-i*y|)><rsup|s+1>>
      *<rsub|3>F<rsub|2><around*|(|-m,-n,-s;m+1,n+1;1|)>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|s><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>>>>>>
    </equation>
  </theorem>

  <\proof>
    \;

    The hypergeometric function <math|<rsub|2>F<rsub|1><around|(|a,b;c;z|)>>
    has the finite series representation:

    <\equation>
      <rsub|2>F<rsub|1><around|(|-p,b;c;z|)>=<big|sum><rsub|k=0><rsup|p><frac|<around|(|-p|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>

    when <math|p> is a non-negative integer. Here,
    <math|<around|(|a|)><rsub|k>=a*<around|(|a+1|)>*<around|(|a+2|)>*\<cdots\>*<around|(|a+k-1|)>>
    is the Pochhammer symbol. For the integral, expand both hypergeometric
    functions:

    <\equation>
      <rsub|2>F<rsub|1><around*|(|-m,m+1;1;<frac|1|2>-<frac|x|2>|)>=<big|sum><rsub|k=0><rsup|m><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|<around|(|1|)><rsub|k>*k!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k>
    </equation>

    <\equation>
      <rsub|2>F<rsub|1><around*|(|-n,n+1;1;<frac|1|2>-<frac|x|2>|)>=<big|sum><rsub|l=0><rsup|n><frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|<around|(|1|)><rsub|l>*l!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|l>
    </equation>

    Substituting these into the integral:

    <\equation>
      I=<big|int><rsub|-1><rsup|1><around*|[|<big|sum><rsub|k=0><rsup|m><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k>|]><around*|[|<big|sum><rsub|l=0><rsup|n><frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|l>|]>*e<rsup|i*x*y>*d*x
    </equation>

    Expand the double sum:

    <\equation>
      I=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|l=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*<big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k+l>*e<rsup|i*x*y>*<space|0.17em>d*x
    </equation>

    \;

    Let <math|s=k+l> and evaluate

    <\equation>
      I<rsub|s>=<big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|s>*e<rsup|i*x*y>*<space|0.17em>d*x
    </equation>

    Rewrite <math|<frac|1|2>-<frac|x|2>>:

    <\equation>
      <around*|(|<frac|1|2>-<frac|x|2>|)><rsup|s>=<frac|1|2<rsup|s>>*<around|(|1-x|)><rsup|s>
    </equation>

    Thus:

    <\equation>
      I<rsub|s>=<frac|*<big|int><rsub|-1><rsup|1><around|(|1-x|)><rsup|s>*e<rsup|i*x*y>*<space|0.17em>d*x|2<rsup|s>>
    </equation>

    Let <math|u=1-x> so that <math|x=1-u>, <math|d*x=-d*u> and the limits of
    integration change:

    <\equation>
      x=-1\<Longrightarrow\>u=2
    </equation>

    <\equation>
      x=1\<Longrightarrow\>u=0
    </equation>

    thus the integral becomes:

    <\equation>
      I<rsub|s>=<frac|<big|int><rsub|2><rsup|0>u<rsup|s>*e<rsup|i*y*<around|(|1-u|)>>*<around|(|-d*u|)>|2<rsup|s>>*=<frac|<big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|i*y>*e<rsup|-i*u*y>*<space|0.17em>d*u|2<rsup|s>>*
    </equation>

    and after factoring out <math|e<rsup|i*y>>:

    <\equation>
      I<rsub|s>=<frac|e<rsup|i*y>|2<rsup|s>>*<big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|-i*u*y>*<space|0.17em>d*u<label|a1>
    </equation>

    Substituting the known integral into (<reference|a1>)

    <\equation>
      <big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|-i*u*y>*<space|0.17em>d*u=<frac|\<Gamma\>*<around|(|s+1|)>|<around|(|-i*y|)><rsup|s+1>>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|s><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>
    </equation>

    gives

    <\equation>
      I<rsub|s>=<frac|e<rsup|i*y>*\<Gamma\>*<around|(|s+1|)>|2<rsup|s>*<around|(|-i*y|)><rsup|s+1>>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|s><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>
    </equation>

    so that returning to the full integral:

    <\equation>
      I=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|l=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>\<cdot\><frac|e<rsup|i*y>*\<Gamma\>*<around|(|k+l+1|)>|2<rsup|k+l>*<around|(|-i*y|)><rsup|k+l+1>>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|k+l><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>
    </equation>

    Letting <math|s=k+l> and rewriting the double sum:

    <\equation>
      <with|font-base-size|7|I=e<rsup|i*y>*<big|sum><rsub|s=0><rsup|m+n><frac|\<Gamma\>*<around|(|s+1|)>|2<rsup|s>*<around|(|-i*y|)><rsup|s+1>><around*|[|<big|sum><rsub|k=max
      <around|(|0,s-n|)>><rsup|min <around|(|s,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|s-k>*<around|(|n+1|)><rsub|s-k>|<around|(|s-k|)>!>|]>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|s><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>>
    </equation>

    and noting that the inner sum is a hypergeometric function:

    <\equation>
      <big|sum><rsub|k=max <around|(|0,s-n|)>><rsup|min
      <around|(|s,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|s-k>*<around|(|n+1|)><rsub|s-k>|<around|(|s-k|)>!>=<rsub|3>F<rsub|2><around*|(|-m,-n,-s;m+1,n+1;1|)>
    </equation>

    it is seen that the result can be expressed as

    <\equation>
      <tabular|<tformat|<table|<row|<cell|I>|<cell|=<big|int><rsub|-1><rsup|1>*<rsub|2>F<rsub|1><around*|(|-m,m+1;1;<frac|1|2>-<frac|x|2>|)>*<rsub|2>F<rsub|1><around*|(|-n,n+1;1;<frac|1|2>-<frac|x|2>|)>*e<rsup|i*x*y><space|0.17em>d*x>>|<row|<cell|>|<cell|=e<rsup|i*y>*<big|sum><rsub|s=0><rsup|m+n><frac|\<Gamma\>*<around|(|s+1|)>|2<rsup|s>*<around|(|-i*y|)><rsup|s+1>>
      *<rsub|3>F<rsub|2><around*|(|-m,-n,-s;m+1,n+1;1|)>*<around*|[|1-e<rsup|-2*i*y>*<big|sum><rsub|j=0><rsup|s><frac|<around|(|2*i*y|)><rsup|j>|j!>|]>>>>>>
    </equation>

    \;
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
    <associate|a1|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_73.tm>>
  </collection>
</references>