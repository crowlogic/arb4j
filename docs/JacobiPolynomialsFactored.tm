<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Jacobi Polynomias>>

  Let

  <\align*>
    <tformat|<table|<row|<cell|C<around|(|n|)>>|<cell|\<assign\>2*n+\<alpha\>+\<beta\>>>|<row|<cell|F<around|(|n|)>>|<cell|\<assign\><frac|1|2>*<around|(|C<around|(|n|)>-1|)>*C*<around|(|n-1|)>*C<around|(|n|)>>>|<row|<cell|G<around|(|n|)>>|<cell|\<assign\><frac|1|2>*<around|(|C<around|(|n|)>-1|)>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>>>|<row|<cell|A<around|(|n,x|)>>|<cell|\<assign\>F<around|(|n|)>*x+G<around|(|n|)>>>|<row|<cell|B<around|(|n,x|)>>|<cell|\<assign\><around|(|n+\<alpha\>-1|)>*<around|(|n+\<beta\>-1|)>*C<around|(|n|)>>>|<row|<cell|E<around|(|n|)>>|<cell|\<assign\>n*C<around*|(|<frac|n|2>|)>*C*<around|(|n-1|)>>>>>
  </align*>

  and the initial conditions be given by

  <\align*>
    <tformat|<table|<row|<cell|P<around*|(|0,x|)>>|<cell|=1>>|<row|<cell|P<around*|(|1,x|)>>|<cell|=<frac|C<around|(|1|)>*x-\<beta\>+\<alpha\>|2>>>>>
  </align*>

  then the rest of them are given by

  <\equation*>
    P<around*|(|n,x|)>=<frac|A<around|(|n,x|)>*P<around*|(|n-1,x|)>-B<around|(|n,x|)>*P<around*|(|n-2,x|)>|E<around|(|n|)>>\<forall\>n\<geqslant\>2
  </equation*>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Function
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Initial
      Conditions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Recurrence
      Relation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>