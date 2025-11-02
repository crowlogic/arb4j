<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Lagrange Inversion Formula for the Riemann-Siegel
  Theta Function>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>General
    Lagrange-Bürmann Inversion Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Application
    to the Riemann-Siegel Theta Function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definition and Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.2<space|2spc>Construction of the Auxiliary Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.3<space|2spc>Inversion via Lagrange-Bürmann Formula
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.4<space|2spc>Explicit Coefficient Formula
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.5<space|2spc>Summary
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>
  </table-of-contents>

  <section*|Introduction>

  The Riemann-Siegel theta function admits a convergent Taylor series
  expansion in a neighborhood of the origin. The inversion of this series via
  the Lagrange-Bürmann formula yields the compositional inverse. This
  exposition develops the general theory and applies it to the Riemann-Siegel
  theta function.

  <section|General Lagrange-Bürmann Inversion Formula>

  <\theorem>
    [Lagrange-Bürmann Inversion] Let <math|\<phi\>:U\<to\>\<bbb-C\>> be an
    analytic function on the disk <math|U=<around|{|t\<in\>\<bbb-C\>:<around|\||t|\|>\<less\>R|}>>
    with <math|\<phi\><around|(|0|)>=1> and Taylor series
    <math|\<phi\><around|(|t|)>=<big|sum><rsub|j=0><rsup|\<infty\>>\<phi\><rsub|j>*t<rsup|j>>.
    Define <math|w<around|(|t|)>=<frac|t|\<phi\><around|(|t|)>>>. The
    compositional inverse <math|t<around|(|w|)>> satisfying
    <math|w<around|(|t<around|(|w|)>|)>=w> has the representation

    <\equation*>
      t<around|(|w|)>=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|n>*w<rsup|n>
    </equation*>

    where

    <\equation*>
      c<rsub|n>=<frac|1|n*<around|(|n-1|)>!>*<frac|d<rsup|n-1>|d*t<rsup|n-1>><around|(|\<phi\><around|(|t|)>|)><rsup|n><mid|\|><rsub|t=0>
    </equation*>

    for each positive integer <math|n>.
  </theorem>

  <\proof>
    Consider the functional equation <math|w=<frac|t|\<phi\><around|(|t|)>>>.
    The Cauchy residue formula applied to

    <\equation*>
      t<around|(|w|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|t*\<phi\><rprime|'><around|(|t|)>|w*\<phi\><around|(|t|)>-t>*d*t
    </equation*>

    where <math|C> is a positively oriented circle of radius
    <math|\<epsilon\>> centered at the origin with
    <math|0\<less\>\<epsilon\>\<less\>R> and <math|<around|\||w|\|>> small
    enough that <math|<around|\||w*\<phi\><around|(|t|)>|\|>\<less\><around|\||t|\|>>
    on <math|C>.

    Expanding the denominator,

    <\equation*>
      <frac|1|w*\<phi\><around|(|t|)>-t>=-<frac|1|t>*<big|sum><rsub|n=0><rsup|\<infty\>><around*|(|<frac|w*\<phi\><around|(|t|)>|t>|)><rsup|n>=-<big|sum><rsub|n=0><rsup|\<infty\>><frac|w<rsup|n><around|(|\<phi\><around|(|t|)>|)><rsup|n>|t<rsup|n+1>>
    </equation*>

    gives

    <\equation*>
      t<around|(|w|)>=-<frac|1|2*\<pi\>*i>*<big|sum><rsub|n=0><rsup|\<infty\>>w<rsup|n>*<big|oint><rsub|C><frac|\<phi\><rprime|'><around|(|t|)><around|(|\<phi\><around|(|t|)>|)><rsup|n>|t<rsup|n+1>>*d*t
    </equation*>

    The residue at <math|t=0> of <math|<frac|\<phi\><rprime|'><around|(|t|)><around|(|\<phi\><around|(|t|)>|)><rsup|n>|t<rsup|n+1>>>
    equals <math|<frac|1|n!>*<frac|d<rsup|n>|d*t<rsup|n>><around|(|\<phi\><around|(|t|)>|)><rsup|n+1><mid|\|><rsub|t=0>>.
    By the residue theorem,

    <\equation*>
      <big|oint><rsub|C><frac|\<phi\><rprime|'><around|(|t|)><around|(|\<phi\><around|(|t|)>|)><rsup|n>|t<rsup|n+1>>*d*t=2*\<pi\>*i\<cdot\><frac|1|n!>*<frac|d<rsup|n>|d*t<rsup|n>><around|(|\<phi\><around|(|t|)>|)><rsup|n+1><mid|\|><rsub|t=0>
    </equation*>

    Substituting yields

    <\equation*>
      t<around|(|w|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|w<rsup|n>|n!>*<frac|d<rsup|n>|d*t<rsup|n>><around|(|\<phi\><around|(|t|)>|)><rsup|n+1><mid|\|><rsub|t=0>
    </equation*>

    Reindexing with <math|m=n+1> gives <math|n=m-1>, so

    <\equation*>
      t<around|(|w|)>=<big|sum><rsub|m=1><rsup|\<infty\>><frac|w<rsup|m-1>|<around|(|m-1|)>!>*<frac|d<rsup|m-1>|d*t<rsup|m-1>><around|(|\<phi\><around|(|t|)>|)><rsup|m><mid|\|><rsub|t=0>=<big|sum><rsub|m=1><rsup|\<infty\>><frac|1|m*<around|(|m-1|)>!>*<frac|d<rsup|m-1>|d*t<rsup|m-1>><around|(|\<phi\><around|(|t|)>|)><rsup|m><mid|\|><rsub|t=0>w<rsup|m>
    </equation*>

    Define <math|c<rsub|m>\<assign\><frac|1|m*<around|(|m-1|)>!>*<frac|d<rsup|m-1>|d*t<rsup|m-1>><around|(|\<phi\><around|(|t|)>|)><rsup|m><mid|\|><rsub|t=0>>
    for each positive integer <math|m>.
  </proof>

  <section|Application to the Riemann-Siegel Theta Function>

  <subsection|Definition and Properties>

  The Riemann-Siegel theta function is defined for real <math|t> by

  <\equation*>
    \<theta\><around|(|t|)>=<frac|1|2>*arg
    \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log \<pi\>
  </equation*>

  where the argument is continuous with <math|arg
  \<Gamma\>*<around|(|1/4|)>=0>. The function <math|\<theta\><around|(|t|)>>
  is real-valued, odd, and satisfies <math|\<theta\><around|(|0|)>=0>.

  The Taylor series expansion is

  <\equation*>
    \<theta\><around|(|t|)>=<big|sum><rsub|k=0><rsup|\<infty\>>a<rsub|k>*t<rsup|k>
  </equation*>

  where

  <\equation*>
    a<rsub|k>=<frac|1|k!>*<frac|d<rsup|k>|d*t<rsup|k>>*\<theta\><around|(|t|)><mid|\|><rsub|t=0>
  </equation*>

  for each nonnegative integer <math|k>. Since <math|\<theta\><around|(|t|)>>
  is odd, <math|a<rsub|k>=0> whenever <math|k> is even. For odd <math|k>, the
  coefficient <math|a<rsub|k>> is nonzero in general, with
  <math|a<rsub|1>=-<frac|1|2>*log \<pi\>\<neq\>0>.

  <subsection|Construction of the Auxiliary Function>

  Define the auxiliary function <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-R\>> by

  <\equation*>
    \<phi\><around|(|t|)>=<frac|t|\<theta\><around|(|t|)>>
  </equation*>

  with <math|\<phi\><around|(|0|)>\<assign\>a<rsub|1><rsup|-1>>. Since
  <math|\<theta\><around|(|t|)>=t*<big|sum><rsub|k=0><rsup|\<infty\>>a<rsub|2*k+1>*t<rsup|2*k>>,
  the function <math|\<phi\><around|(|t|)>> is given by

  <\equation*>
    \<phi\><around|(|t|)>=<frac|1|<big|sum><rsub|k=0><rsup|\<infty\>>a<rsub|2*k+1>*t<rsup|2*k>>=<big|sum><rsub|j=0><rsup|\<infty\>>\<phi\><rsub|j>*t<rsup|j>
  </equation*>

  where

  <\equation*>
    \<phi\><rsub|j>=<frac|1|j!>*<frac|d<rsup|j>|d*t<rsup|j>>*\<phi\><around|(|t|)><mid|\|><rsub|t=0>
  </equation*>

  for each nonnegative integer <math|j>.

  Since the denominator <math|<big|sum><rsub|k=0><rsup|\<infty\>>a<rsub|2*k+1>*t<rsup|2*k>>
  contains only even powers of <math|t>, the reciprocal
  <math|\<phi\><around|(|t|)>> contains only even powers. Define the
  subsequence

  <\equation*>
    \<psi\><rsub|i>=\<phi\><rsub|2*i>
  </equation*>

  for each nonnegative integer <math|i>, so
  <math|\<phi\><around|(|t|)>=<big|sum><rsub|i=0><rsup|\<infty\>>\<psi\><rsub|i>*t<rsup|2*i>>
  with <math|\<psi\><rsub|0>=a<rsub|1><rsup|-1>>

  <subsection|Inversion via Lagrange-Bürmann Formula>

  Apply Theorem 1 with <math|\<phi\><around|(|t|)>=<frac|t|\<theta\><around|(|t|)>>>
  and <math|w=\<theta\><around|(|t|)>>. The compositional inverse satisfies

  <\equation*>
    t<around|(|w|)>=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|n>*w<rsup|n>
  </equation*>

  where

  <\equation*>
    c<rsub|n>=<frac|1|n*<around|(|n-1|)>!>*<frac|d<rsup|n-1>|d*t<rsup|n-1>><around|(|\<phi\><around|(|t|)>|)><rsup|n><mid|\|><rsub|t=0>
  </equation*>

  Since <math|\<phi\><around|(|t|)>=<big|sum><rsub|i=0><rsup|\<infty\>>\<psi\><rsub|i>*t<rsup|2*i>>
  contains only even powers, the power <math|<around|(|\<phi\><around|(|t|)>|)><rsup|n>>
  contains only even powers of <math|t>. When <math|n> is even, the function
  <math|<around|(|\<phi\><around|(|t|)>|)><rsup|n>> is even, so all odd
  derivatives vanish at <math|t=0>. For even <math|n>, write <math|n=2*m>, so
  <math|n-1=2*m-1> is odd, giving <math|c<rsub|2*m>=0>.

  When <math|n> is odd, write <math|n=2*m-1> for a positive integer <math|m>.
  Then <math|n-1=2*m-2> is even, and the derivative is nonzero. Define

  <\equation*>
    b<rsub|m>=c<rsub|2*m-1>=<frac|1|<around|(|2*m-1|)>*<around|(|2*m-2|)>!>*<frac|d<rsup|2*m-2>|d*t<rsup|2*m-2>><around|(|\<phi\><around|(|t|)>|)><rsup|2*m-1><mid|\|><rsub|t=0>
  </equation*>

  for each positive integer <math|m>.

  <subsection|Explicit Coefficient Formula>

  The derivative <math|<frac|d<rsup|2*m-2>|d*t<rsup|2*m-2>><around|(|\<phi\><around|(|t|)>|)><rsup|2*m-1><mid|\|><rsub|t=0>>
  equals <math|<around|(|2*m-2|)>>! times the coefficient of
  <math|t<rsup|2*m-2>> in the Taylor expansion of
  <math|<around|(|\<phi\><around|(|t|)>|)><rsup|2*m-1>>.

  Write <math|<around|(|\<phi\><around|(|t|)>|)><rsup|2*m-1>=<around*|(|<big|sum><rsub|i=0><rsup|\<infty\>>\<psi\><rsub|i>*t<rsup|2*i>|)><rsup|2*m-1>>.
  Define <math|\<cal-K\><around|(|m|)>> as the set of all sequences
  <math|\<kappa\>=<around|(|\<kappa\><rsub|0>,\<kappa\><rsub|1>,\<kappa\><rsub|2>,\<ldots\>|)>>
  of nonnegative integers with finite support satisfying

  <\equation*>
    <big|sum><rsub|i=0><rsup|\<infty\>>\<kappa\><rsub|i>=2*m-1*<space|1em><text|and><space|1em><big|sum><rsub|i=0><rsup|\<infty\>>2*i*\<kappa\><rsub|i>=2*m-2
  </equation*>

  For each sequence <math|\<kappa\>\<in\>\<cal-K\><around|(|m|)>>, the
  multinomial coefficient is

  <\equation*>
    <frac|<around|(|2*m-1|)>!|<big|prod><rsub|i=0><rsup|\<infty\>>\<kappa\><rsub|i>!>.
  </equation*>

  The derivative is

  <\equation*>
    <frac|d<rsup|2*m-2>|d*t<rsup|2*m-2>><around|(|\<phi\><around|(|t|)>|)><rsup|2*m-1><mid|\|><rsub|t=0>=<around|(|2*m-2|)>!<big|sum><rsub|\<kappa\>\<in\>\<cal-K\><around|(|m|)>><frac|<around|(|2*m-1|)>!|<big|prod><rsub|i=0><rsup|\<infty\>>\<kappa\><rsub|i>!>*<big|prod><rsub|i=0><rsup|\<infty\>>\<psi\><rsub|i><rsup|\<kappa\><rsub|i>>
  </equation*>

  Therefore

  <\equation*>
    b<rsub|m>=<frac|1|2*m-1>*<big|sum><rsub|\<kappa\>\<in\>\<cal-K\><around|(|m|)>><frac|<around|(|2*m-1|)>!|<big|prod><rsub|i=0><rsup|\<infty\>>\<kappa\><rsub|i>!>*<big|prod><rsub|i=0><rsup|\<infty\>>\<psi\><rsub|i><rsup|\<kappa\><rsub|i>>
  </equation*>

  <subsection|Summary>

  The compositional inverse of the Riemann-Siegel theta function is

  <\equation*>
    t<around|(|w|)>=<big|sum><rsub|m=1><rsup|\<infty\>>b<rsub|m>*w<rsup|2*m-1>
  </equation*>

  where each coefficient <math|b<rsub|m>> is defined by

  <\equation*>
    b<rsub|m>=<frac|1|<around|(|2*m-1|)>*<around|(|2*m-2|)>!>*<frac|d<rsup|2*m-2>|d*t<rsup|2*m-2>><around*|(|<frac|t|\<theta\><around|(|t|)>>|)><rsup|2*m-1><mid|\|><rsub|t=0>
  </equation*>

  for each positive integer <math|m>.
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
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-2|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-3|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-4|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-5|<tuple|2.2|3|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-6|<tuple|2.3|3|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-7|<tuple|2.4|4|../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-8|<tuple|2.5|5|../.TeXmacs/texts/scratch/no_name_8.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>General
      Lagrange-Bürmann Inversion Formula>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Application
      to the Riemann-Siegel Theta Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition and Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Construction of the
      Auxiliary Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Inversion via
      Lagrange-Bürmann Formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Explicit Coefficient Formula
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.5<space|2spc>Summary
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>