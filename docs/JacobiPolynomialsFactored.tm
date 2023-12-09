<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-date|>>

  \;

  <strong|Coefficient Function>s

  <\equation*>
    A<around|(|n,x|)>=<frac|<around|(|C<around|(|n|)>-1|)>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>+C*<around|(|n-1|)>*C<around|(|n|)>*x|)>|2>*
  </equation*>

  <\equation*>
    B<around|(|n|)>=<around|(|n+\<alpha\>-1|)>*<around|(|n+\<beta\>-1|)>*C<around|(|n|)>
  </equation*>

  <\equation*>
    C<around|(|n|)>=2*n+\<alpha\>+\<beta\>
  </equation*>

  <\equation*>
    D<around*|(|n|)>=n*C<around|(|<frac|n|2>|)>*C*<around|(|n-1|)>
  </equation*>

  <strong|Initial Conditions>

  <\equation*>
    P<around*|(|0,x<rsub|>|)>=1
  </equation*>

  <\equation*>
    P<around*|(|1,x|)>=<frac|C<around*|(|1|)>x-\<beta\>+\<alpha\>|2>*
  </equation*>

  <strong|<with|font-series|bold|Recurrence Relation>>
  <math|\<forall\>n\<geqslant\>2>

  <\equation*>
    P<around*|(|n,x|)>=<frac|A<around|(|n,x|)>*P*<around*|(|n-1,x|)>-B<around|(|n|)>*P*<around*|(|n-2,x|)>|D<around*|(|n|)>>
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|magnification|2>
    <associate|page-height|auto>
    <associate|page-medium|papyrus>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>