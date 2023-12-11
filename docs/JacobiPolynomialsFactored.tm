<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Jacobi Polynomials>>

  Let

  <\align*>
    <tformat|<table|<row|<cell|C<around|(|n|)>>|<cell|\<assign\>2*n+\<alpha\>+\<beta\>>>|<row|<cell|F<around|(|n|)>>|<cell|\<assign\>*C*<around|(|n-1|)>*C<around|(|n|)>>>|<row|<cell|G>|<cell|\<assign\>\<alpha\><rsup|2>-\<beta\><rsup|2>>>|<row|<cell|A<around|(|n,x|)>>|<cell|\<assign\><around*|(|F<around|(|n|)>*x+G|)>*<around|(|C<around|(|n|)>-1|)>**<frac|1|2>*>>|<row|<cell|B<around|(|n|)>>|<cell|\<assign\><around|(|n+\<alpha\>-1|)>*<around|(|n+\<beta\>-1|)>*C<around|(|n|)>>>|<row|<cell|E<around|(|n|)>>|<cell|\<assign\>n*C<around*|(|<frac|n|2>|)>*C*<around|(|n-1|)>>>>>
  </align*>

  and the initial conditions be given by

  <\align*>
    <tformat|<table|<row|<cell|P<around*|(|0,x|)>>|<cell|=1>>|<row|<cell|P<around*|(|1,x|)>>|<cell|=<frac|C<around|(|1|)>*x-\<beta\>+\<alpha\>|2>>>>>
  </align*>

  then the rest of them are given by

  <\equation*>
    P<around*|(|n,x|)>=<frac|A<around|(|n,x|)>*P<around*|(|n-1,x|)>-B<around|(|n|)>*P<around*|(|n-2,x|)>|E<around|(|n|)>>\<forall\>n\<geqslant\>2
  </equation*>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.7>
    <associate|page-height|auto>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>