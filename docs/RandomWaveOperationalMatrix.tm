<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Operational Matrix of The Random Wave
  Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Hypergeometric
    Series Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Integral
    Evaluation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Double Sum
    Transformation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Final Result>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section*|Introduction>

  Let I be defined as the inverse Fourier transform\ 

  <\equation>
    I<rsub|m,n><around*|(|y|)>=<big|int><rsub|-1><rsup|1><rsub|><rsub|>
    <rsub|2>F<rsub|1><around*|(|-m,m+1;1;<frac|1|2>-<frac|x|2>|)><rsub|>
    <around*|\<nobracket\>|*<rsub|2>F<rsub|1><around*|(|-n,n+1;1;<frac|1|2>-<frac|x|2>|\<nobracket\>>|)>*e<rsup|i*x*y><space|0.17em>d*x
  </equation>

  where <math|<rsub|2>F<rsub|1><around|(|a,b;c;z|)>> is the Gauss
  hypergeometric function, and <math|m,n> are non-negative integers.

  <section*|Hypergeometric Series Expansion>

  <\lemma>
    For any non-negative integer <math|p> and complex numbers <math|b,c> with
    <math|c\<nin\><around|{|0,-1,-2,\<ldots\>|}>>:

    <\equation>
      <rsub|2>F<rsub|1><around|(|-p,b;c;z|)>=<big|sum><rsub|k=0><rsup|p><frac|<around|(|-p|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>

    where <math|<around|(|a|)><rsub|k>=a*<around|(|a+1|)>*\<cdots\>*<around|(|a+k-1|)>>
    is the Pochhammer symbol.
  </lemma>

  <\proof>
    By definition, <math|<rsub|2>F<rsub|1><around|(|a,b;c;z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|a|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>>.
    When <math|a=-p> for non-negative integer <math|p>:

    <\equation>
      <around|(|-p|)><rsub|k>=<around|(|-p|)>*<around|(|-p+1|)>*\<cdots\>*<around|(|-p+k-1|)>=<around|(|-1|)><rsup|k>*p*<around|(|p-1|)>*\<cdots\>*<around|(|p-k+1|)>
    </equation>

    Therefore <math|<around|(|-p|)><rsub|k>=0> for all <math|k\<gtr\>p> since
    one of the factors becomes zero. Thus the infinite series terminates at
    <math|k=p>.
  </proof>

  <\lemma>
    For the given integral, applying the series expansion:

    <\equation>
      I<rsub|m,n><around*|(|y|)>=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|l=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*<big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k+l>*e<rsup|i*x*y>*<space|0.17em>d*x
    </equation>
  </lemma>

  <\proof>
    Substituting the series expansions for both hypergeometric functions:

    <\equation>
      <with|font-base-size|9|I<rsub|m,n><around*|(|y|)>=<big|int><rsub|-1><rsup|1><around*|(|<big|sum><rsub|k=0><rsup|m><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k>|)><around*|(|<big|sum><rsub|l=0><rsup|n><frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*<around*|(|<frac|1|2>-<frac|x|2>|)><rsup|l>|)>*e<rsup|i*x*y>d*x>
    </equation>

    The series are finite, so we can interchange summation and integration by
    Fubini's theorem.
  </proof>

  <section*|Integral Evaluation>

  <\lemma>
    For non-negative integer <math|s>:

    <\equation>
      <big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|s>*e<rsup|i*x*y>*<space|0.17em>d*x=<frac|e<rsup|i*y>|2<rsup|s>>*<around*|[|<frac|\<Gamma\><around|(|s+1,-2*i*y|)>|<around|(|-i*y|)><rsup|s+1>>-<frac|\<Gamma\>*<around|(|s+1|)>|<around|(|-i*y|)><rsup|s+1>>|]>
    </equation>
  </lemma>

  <\proof>
    Make the substitution <math|u=1-x>. Then <math|d*x=-d*u> and when
    <math|x=-1>, <math|u=2>; when <math|x=1>, <math|u=0>. Thus:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|s>*e<rsup|i*x*y>*<space|0.17em>d*x>|<cell|=<frac|1|2<rsup|s>>*<big|int><rsub|-1><rsup|1><around|(|1-x|)><rsup|s>*e<rsup|i*x*y>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<frac|1|2<rsup|s>>*<big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|i*y*<around|(|1-u|)>>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<frac|e<rsup|i*y>|2<rsup|s>>*<big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|-i*u*y>*<space|0.17em>d*u>>>>>
    </equation>

    Let <math|v=i*u*y>. Then <math|d*u=<frac|d*v|i*y>> and:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<frac|e<rsup|i*y>|2<rsup|s>>*<big|int><rsub|0><rsup|2>u<rsup|s>*e<rsup|-i*u*y>*<space|0.17em>d*u>|<cell|=<frac|e<rsup|i*y>|2<rsup|s>>*<frac|1|<around|(|i*y|)><rsup|s+1>>*<big|int><rsub|0><rsup|2*i*y>v<rsup|s>*e<rsup|-v>*<space|0.17em>d*v>>|<row|<cell|>|<cell|=<frac|e<rsup|i*y>|2<rsup|s>>*<frac|1|<around|(|i*y|)><rsup|s+1>><around|[|\<gamma\><around|(|s+1,2*i*y|)>|]>>>>>>
    </equation>

    where <math|\<gamma\><around|(|a,z|)>=\<Gamma\><around|(|a|)>-\<Gamma\><around|(|a,z|)>>
    is the lower incomplete gamma function.
  </proof>

  <section*|Double Sum Transformation>

  <\theorem>
    The double sum can be rewritten as:

    <\equation>
      <big|sum><rsub|l=0><rsup|m+n>\<Phi\><rsub|s><around|(|m,n|)>*z<rsup|l>=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|l=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*z<rsup|k+l>
    </equation>

    where

    <\equation>
      \<Phi\><rsub|s><around|(|m,n|)>=<rsub|3>F<rsub|2><around*|(|-m,m+1,-s;1,1-s-n;1|)><frac|<around|(|-n|)><rsub|s>*<around|(|n+1|)><rsub|s>|s!>
    </equation>
  </theorem>

  <\proof>
    For fixed <math|s=k+l> sum over all <math|k> from 0 to <math|min
    <around|(|m,s|)>> with <math|l=s-k> and factor out terms independent of
    <math|k>

    <with|font-base-size|7|<\equation>
      <tabular|<tformat|<cwith|1|2|1|2|font-base-size|8>|<table|<row|<cell|<big|sum><rsub|k=0><rsup|min
      <around|(|m,s|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|s-k>*<around|(|n+1|)><rsub|s-k>|<around|(|s-k|)>!>>|<cell|=<frac|<around|(|-n|)><rsub|s>*<around|(|n+1|)><rsub|s>|s!>*<big|sum><rsub|k=0><rsup|min
      <around|(|m,s|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-s|)><rsub|k>|k!<around|(|1|)><rsub|k>*<around|(|1-s-n|)><rsub|k>>>>|<row|<cell|>|<cell|=<rsub|3>F<rsub|2><around|(|-m,m+1,-s;1,1-s-n;1|)>>>>>><tabular|<tformat|<table|<row|<cell|<reduce-by||0.5ex>>>>>><reduce-by||0.5ex>
    </equation>>
  </proof>

  <section*|Final Result>

  <\theorem>
    The integral evaluates to:

    <\equation>
      I<rsub|m,n><around*|(|y|)>=e<rsup|i*y>*<big|sum><rsub|s=0><rsup|m+n><frac|\<Phi\><rsub|s><around|(|m,n|)>|2<rsup|s>><around*|[|<frac|\<Gamma\><around|(|s+1,-2*i*y|)>-\<Gamma\>*<around|(|s+1|)>|<around|(|-i*y|)><rsup|s+1>>|]>
    </equation>

    where <math|\<Phi\><rsub|s><around|(|m,n|)>> is as defined above.
  </theorem>

  <\proof>
    Combining the series expansion from Lemma 2, the integral evaluation from
    Lemma 3, and the sum transformation from Theorem 1:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|I<rsub|m,n><around*|(|y|)>>|<cell|=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|l=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|l>*<around|(|n+1|)><rsub|l>|l!>*<big|int><rsub|-1><rsup|1><around*|(|<frac|1|2>-<frac|x|2>|)><rsup|k+l>*e<rsup|i*x*y>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|sum><rsub|s=0><rsup|m+n>\<Phi\><rsub|s><around|(|m,n|)>\<cdot\><frac|e<rsup|i*y>|2<rsup|s>><around*|[|<frac|\<Gamma\><around|(|s+1,-2*i*y|)>-\<Gamma\>*<around|(|s+1|)>|<around|(|-i*y|)><rsup|s+1>>|]>>>>>>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-3|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-4|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_72.tm>>
    <associate|auto-5|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_72.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Hypergeometric
      Series Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Integral
      Evaluation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Double
      Sum Transformation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Final
      Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>