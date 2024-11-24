<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Spectral Factorization Theorem for Stationary
  Gaussian Processes>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Proof>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Initial Setup
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Construction of
    <with|color|#503050|font-family|rm|<with|mode|math|h>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Convolution Analysis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Application of Delta Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  \;

  <\theorem>
    <dueto|Spectral Factorization Theorem>Let
    <math|K:\<bbb-R\>\<to\>\<bbb-R\>> be a positive definite stationary
    kernel function such that:

    <\enumerate>
      <item><math|K\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> (integrability)

      <item><math|K> is continuous

      <item>The spectral density <math|S<around|(|\<omega\>|)>> satisfies:

      <\itemize>
        <item><math|S<around|(|\<omega\>|)>\<geq\>0> (non-negativity)

        <item><math|S<around|(|\<omega\>|)>=S*<around|(|-\<omega\>|)>>
        (symmetry)

        <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||S<around|(|\<omega\>|)>|\|>*d*\<omega\>\<less\>\<infty\>>
        (integrability)
      </itemize>
    </enumerate>

    Then there exists a real-valued function
    <math|h:\<bbb-R\>\<to\>\<bbb-R\>> such that:

    <\equation>
      K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)>*h*<around|(|s+\<tau\>|)>*d*\<tau\>
    </equation>

    where

    <\equation>
      h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>
  </theorem>

  <section|Proof>

  <subsection|Initial Setup>

  By Bochner's theorem, since <math|K> is positive definite and stationary:

  <\equation*>
    K*<around|(|t-s|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>
  </equation*>

  where <math|S<around|(|\<omega\>|)>\<geq\>0> and
  <math|S<around|(|\<omega\>|)>=S*<around|(|-\<omega\>|)>> for all
  <math|\<omega\>\<in\>\<bbb-R\>>.

  <subsection|Construction of <math|h>>

  Define:

  <\equation*>
    h<around|(|t|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\>|)>>*e<rsup|i*\<omega\>*t>*d*\<omega\>
  </equation*>

  Note that this is well-defined since <math|S<around|(|\<omega\>|)>\<geq\>0>
  and symmetric.

  <subsection|Convolution Analysis>

  Consider the convolution integral:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)>*h*<around|(|s+\<tau\>|)>*d*\<tau\>
  </equation*>

  Substituting the definition of <math|h>:

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|K*<around|(|t-s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t+\<tau\>|)>*h*<around|(|s+\<tau\>|)>*d*\<tau\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*e<rsup|i*\<omega\><rsub|1>*<around|(|t+\<tau\>|)>>*d*\<omega\><rsub|1>|2*\<pi\>>|)><around*|(|<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|2>*<around|(|s+\<tau\>|)>>*d*\<omega\><rsub|2>|2*\<pi\>>|)>*d*\<tau\>>>|<row|<cell|>|<cell|=<frac|1|4*\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*<sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>*e<rsup|i*\<omega\><rsub|2>*s>*e<rsup|i*<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>>>>
  </equation>

  <subsection|Application of Delta Function>

  The inner integral over <math|\<tau\>> yields:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>*\<tau\>>*d*\<tau\>=2*\<pi\>*\<delta\>*<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>
  </equation*>

  Therefore:

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|K*<around|(|t-s|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|S<around|(|\<omega\><rsub|1>|)>>*<sqrt|S<around|(|\<omega\><rsub|2>|)>>*e<rsup|i*\<omega\><rsub|1>*t>*e<rsup|i*\<omega\><rsub|2>*s>*\<delta\>*<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<omega\>>>>>>
  </equation>

  <cite|cramerStochasticProcessTheoryContribution>

  <thebibliography|1|<bibitem-with-key|1|cramerStochasticProcessTheoryContribution>Harald
  Cramér. <newblock>A contribution to the theory of stochastic processes.
  <newblock><with|font-shape|italic|Proceedings of the Second Berkeley
  Symposium on Mathematical Statistics and Probability>, 2:329\U339,
  1951.<newblock>>
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-2|<tuple|1.1|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-3|<tuple|1.2|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-4|<tuple|1.3|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-5|<tuple|1.4|2|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|auto-6|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_61.tm>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_61.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      cramerStochasticProcessTheoryContribution
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Initial Setup
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Construction of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|h>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Convolution Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Application of Delta
      Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>