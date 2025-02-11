<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Operational Matrix of the Random Wave
  Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\lemma>
    <label|lem:HyperExpansions>For any <math|p\<in\>\<bbb-Z\><rsub|\<geq\>0>>,
    the Gauss hypergeometric function 'terminates' so that it is equal to a
    finite sum rather than its usual infinite sum(the non-'terminating'
    case):

    <\equation>
      <rsub|2>F<rsub|1><around|(|-p,b;c;z|)>=<big|sum><rsub|k=0><rsup|p><frac|<around|(|-p|)><rsub|k><around|(|b|)><rsub|k>|<around|(|c|)><rsub|k>*k!>*z<rsup|k>
    </equation>

    where <math|<around|(|a|)><rsub|k>=<big|prod><rsub|i=0><rsup|k-1><around|(|a+i|)>>
  </lemma>

  <\lemma>
    <label|lem:IntegralGamma>For <math|j\<geq\>0>,

    <\equation>
      <big|int><rsub|-1><rsup|1><around*|(|<frac|1-x|2>|)><rsup|j>*e<rsup|i*x*y>*d*x=<frac|e<rsup|i*y>|2<rsup|j>>*<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>
    </equation>

    where <math|\<gamma\><around|(|s,x|)>> denotes the lower incomplete gamma
    function.
  </lemma>

  <\theorem>
    <label|thm:MainResult>For <math|m,n\<geq\>0>,

    <\equation>
      I<rsub|m,n><around|(|y|)>=<big|int><rsub|-1><rsup|1><rsub|2>F<rsub|1><around*|(|-m,m+1;1;<tfrac|1-x|2>|)><rsub|2>*F<rsub|1><around*|(|-n,n+1;1;<tfrac|1-x|2>|)>*e<rsup|i*x*y>*d*x
    </equation>

    satisfies:

    <\equation>
      I<rsub|m,n><around|(|y|)>=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|\<Psi\><rsub|j><around|(|m,n|)>|2<rsup|j>><around*|[|<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>|]>
    </equation>

    where <math|\<Psi\><rsub|j><around|(|m,n|)>> is defined as:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<big|sum><rsub|k=max
      <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|j-k|)>!>
    </equation>

    and equivalently:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<frac|*<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Part 1: Integral Reduction to Finite Sums>

    Expand both hypergeometric series using Lemma
    <reference|lem:HyperExpansions>:

    <\equation>
      <with|font-base-size|7|<rsub|2>F<rsub|1><around*|(|-m,m+1;1;<tfrac|1-x|2>|)>
      <rsub|2>*F<rsub|1><around*|(|-n,n+1;1;<tfrac|1-x|2>|)>=<big|sum><rsub|k=0><rsup|m><big|sum><rsub|\<ell\>=0><rsup|n><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|\<ell\>>*<around|(|n+1|)><rsub|\<ell\>>|\<ell\>!><around*|(|<tfrac|1-x|2>|)><rsup|k+\<ell\>>>
    </equation>

    Let <math|j=k+\<ell\>>. For fixed <math|j>, <math|k> must satisfy
    <math|max <around|(|0,j-n|)>\<leq\>k\<leq\>min <around|(|j,m|)>>. Thus:

    <\equation>
      I<rsub|m,n><around|(|y|)>=<big|sum><rsub|j=0><rsup|m+n><big|sum><rsub|k=max
      <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|j-k|)>!>*<big|int><rsub|-1><rsup|1><around*|(|<frac|1-x|2>|)><rsup|j>*e<rsup|i*x*y>*d*x
    </equation>

    Apply Lemma <reference|lem:IntegralGamma> to evaluate the integral:

    <\equation>
      I<rsub|m,n><around|(|y|)>=e<rsup|i*y>*<big|sum><rsub|j=0><rsup|m+n><frac|\<Psi\><rsub|j><around|(|m,n|)>|2<rsup|j>><around*|[|<frac|\<gamma\><around|(|j+1,2*i*y|)>|<around|(|i*y|)><rsup|j+1>>|]>
    </equation>

    <with|font-series|bold|Part 2: Equivalence of
    <math|\<Psi\><rsub|j><around|(|m,n|)>> and <math|<rsub|4>F<rsub|3>>>

    Start from the hypergeometric representation:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<frac|<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>*
    </equation>

    Expand the <math|<rsub|4>F<rsub|3>> series:

    <\equation>
      <rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>*<around|(|-n|)><rsub|k>*<around|(|n+1|)><rsub|k>|<around|(|1|)><rsub|k><around|(|1|)><rsub|k>*<around|(|j+1|)><rsub|k>*k!>
    </equation>

    The series terminates at <math|k=min <around|(|m,n|)>> due to
    <math|<around|(|-m|)><rsub|k>=0> for <math|k\<gtr\>m> and
    <math|<around|(|-n|)><rsub|k>=0> for <math|k\<gtr\>n>. Perform the
    substitution <math|\<ell\>=j-k>:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<big|sum><rsub|k=max
      <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|j-k|)>!>
    </equation>

    Simplify by substituting the identity
    <math|<around|(|j+1|)><rsub|j-\<ell\>>=<frac|<around|(|2*j-\<ell\>|)>!|j!>>

    <\equation>
      <frac|1|<around|(|j+1|)><rsub|j-\<ell\>>>=<frac|j!|<around|(|2*j-\<ell\>|)>!>
    </equation>

    into the expression for <math|\<Psi\><rsub|j><around|(|m,n|)>> which
    yields:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<big|sum><rsub|\<ell\>=0><rsup|j><frac|<around|(|-m|)><rsub|j-\<ell\>>*<around|(|m+1|)><rsub|j-\<ell\>>*<around|(|-n|)><rsub|j-\<ell\>>*<around|(|n+1|)><rsub|j-\<ell\>>|<around|(|1|)><rsub|j-\<ell\>><around|(|1|)><rsub|j-\<ell\>>*<around|(|2*j-\<ell\>|)>!<around|(|j-\<ell\>|)>!>
    </equation>

    Reverse the substitution (<math|k=j-\<ell\>>) to obtain:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<big|sum><rsub|k=max
      <around|(|0,j-n|)>><rsup|min <around|(|j,m|)>><frac|<around|(|-m|)><rsub|k>*<around|(|m+1|)><rsub|k>|k!>*<frac|<around|(|-n|)><rsub|j-k>*<around|(|n+1|)><rsub|j-k>|<around|(|j-k|)>!>
    </equation>

    This establishes term-by-term equality, confirming the hypergeometric
    representation:

    <\equation>
      \<Psi\><rsub|j><around|(|m,n|)>=<frac|<space|0.17em><rsub|4>F<rsub|3><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-m,m+1,-n,n+1>>|<row|<cell|1,1,j+1>>>>>;1|)>|j!>*<space|1em>
    </equation>

    <math|\<blacksquare\>>
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
    <associate|lem:HyperExpansions|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_73.tm>>
    <associate|lem:IntegralGamma|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_73.tm>>
    <associate|thm:MainResult|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_73.tm>>
  </collection>
</references>