<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|The Role of Inner Products and Reproducing Kernel Hilbert
  Space(RKHS) in Stochastic Processes><label|the-role-of-inner-products-and-reproducing-kernel-hilbert-spacerkhs-in-stochastic-processes><label|the-role-of-inner-products-and-reproducing-kernel-hilbert-spacerkhs-in-stochastic-processes>

  <subsection|Inner Products and RKHS><label|inner-products-and-rkhs><label|inner-products-and-rkhs>

  A Reproducing Kernel Hilbert Space (RKHS) is a particular kind of Hilbert
  space where functions serve as elements. The inner product in this space
  can be induced by a kernel function <math|k<around|(|s,t|)>>. Specifically,
  for any two functions <math|f,g\<in\>\<cal-H\>> within an RKHS
  <math|\<cal-H\>>, the inner product is given by:

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=<big|int><big|int>f<around|(|s|)><wide|g<around|(|t|)>|\<bar\>>k<around|(|s,t|)>*d*s*d*t
  </equation>

  This construct ensures that the inner product is a strict inner product in
  <math|\<cal-H\>>.

  <subsection|Riesz Representation Theorem><label|riesz-representation-theorem><label|riesz-representation-theorem>

  <subsubsection|Theorem><label|theorem><label|theorem>

  For every continuous linear functional <math|F> on a Hilbert space
  <math|\<cal-H\>>, there exists a unique element <math|y> in
  <math|\<cal-H\>> such that:

  <\equation>
    F<around|(|x|)>=<around|\<langle\>|x,y|\<rangle\>>\<forall\>x\<in\>\<cal-H\>
  </equation>

  <subsubsection|Implications for RKHS><label|implications-for-rkhs><label|implications-for-rkhs>

  In the case of RKHS, the Riesz Representation Theorem ensures that the
  evaluation functional <math|F<around|(|f|)>=f<around|(|s|)>> can be
  represented as an inner product:

  <\equation>
    F<around|(|f|)>=f<around|(|s|)>=\<langle\>f,k(s,\<cdot\><around|)||\<rangle\>>
  </equation>

  This verifies that the kernel <math|k<around|(|s,\<cdot\>|)>> effectively
  represents function evaluations and functionals in the RKHS, thereby making
  <math|k<around|(|s,\<cdot\>|)>> a reproducing kernel.

  <subsection|Stochastic Processes and Covariance
  Function><label|stochastic-processes-and-covariance-function><label|stochastic-processes-and-covariance-function>

  When <math|f<around|(|s|)>=X<around|(|s|)>> and
  <math|g<around|(|s|)>=X<around|(|t|)>> for a stochastic process
  <math|X\<in\>\<cal-H\>>, the covariance function <math|C<around|(|s,t|)>>
  is naturally represented as:

  <\equation>
    C<around|(|s,t|)>=<around|\<langle\>|X<around|(|s|)>,X<around|(|t|)>|\<rangle\>>
  </equation>

  In this special case, <math|C<around|(|s,t|)>> becomes a true inner product
  in <math|\<cal-H\>>. Here, <math|k<around|(|s,t|)>> serves as the
  autocovariance kernel function of <math|X>.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|1.2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|1.2.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|1.3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|implications-for-rkhs|<tuple|1.2.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|inner-products-and-rkhs|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|riesz-representation-theorem|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|stochastic-processes-and-covariance-function|<tuple|1.3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|the-role-of-inner-products-and-reproducing-kernel-hilbert-spacerkhs-in-stochastic-processes|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|theorem|<tuple|1.2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Role of Inner Products and Reproducing Kernel Hilbert Space(RKHS) in
      Stochastic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Inner Products and RKHS
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Riesz Representation Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Implications for RKHS
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Stochastic Processes and
      Covariance Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>