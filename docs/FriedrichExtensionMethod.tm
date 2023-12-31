<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Friedrichs Extension Method in Operator
  Theory>|<doc-author|<author-data|<author-name|Stephen Crowley and the
  Collective Unconsciousness (via Chatgpt)>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section*|Preliminaries>

  <\itemize>
    <item><with|font-series|bold|Hilbert Space>: A complete inner-product
    space.

    <item><with|font-series|bold|Symmetric Operator>: An operator <math|A> on
    a Hilbert space <math|H> is symmetric if
    <math|<around|\<langle\>|A*x,y|\<rangle\>>=<around|\<langle\>|x,A*y|\<rangle\>>>
    for all <math|x,y> in the domain of <math|A>.

    <item><with|font-series|bold|Self-adjoint Operator>: An extension of a
    symmetric operator that is equal to its adjoint.

    <item><with|font-series|bold|Densely Defined Operator>: An operator whose
    domain is dense in the Hilbert space.

    <item><with|font-series|bold|Semi-bounded Operator>: An operator <math|A>
    is semi-bounded if there exists an <math|m\<in\>\<bbb-R\>> such that
    <math|<around|\<langle\>|A*x,x|\<rangle\>>\<geq\>m<around|\<\|\|\>|x|\<\|\|\>><rsup|2>>
    for all <math|x> in the domain of <math|A>.
  </itemize>

  <section*|The Friedrichs Extension Process>

  <\enumerate>
    <item><with|font-series|bold|Starting Point>: Begin with a symmetric,
    semi-bounded, densely defined operator <math|A> on a Hilbert space
    <math|H>. Assume without loss of generality that <math|A> is
    lower-bounded.

    <item><with|font-series|bold|Associated Quadratic Form>: Define a
    quadratic form <math|q> associated with <math|A> by
    <math|q<around|(|x|)>=<around|\<langle\>|A*x,x|\<rangle\>>>. The domain
    of <math|q>, denoted as <math|D<around|(|q|)>>, is the domain of
    <math|A>.

    <item><with|font-series|bold|Closure of the Quadratic Form>: Extend
    <math|q> to its closure <math|<wide|q|\<bar\>>>. This involves taking the
    limit of Cauchy sequences in the form-domain of <math|q>. The domain of
    <math|<wide|q|\<bar\>>>, denoted <math|D<around|(|<wide|q|\<bar\>>|)>>,
    is larger than <math|D<around|(|q|)>>.

    <item><with|font-series|bold|Defining the Friedrichs Extension>: The
    Friedrichs extension <math|A<rsub|F>> of <math|A> is defined on the
    domain <math|D<around|(|A<rsub|F>|)>\<subseteq\>D<around|(|<wide|q|\<bar\>>|)>>
    such that for every <math|y\<in\>D<around|(|A<rsub|F>|)>>, the equality
    <math|<wide|q|\<bar\>><around|(|x,y|)>=<around|\<langle\>|x,A<rsub|F>*y|\<rangle\>>>
    holds for all <math|x\<in\>D<around|(|<wide|q|\<bar\>>|)>>.

    <item><with|font-series|bold|Self-adjointness of <math|A<rsub|F>>>: The
    key property of the Friedrichs extension is that <math|A<rsub|F>> is
    self-adjoint. This is shown by verifying that <math|A<rsub|F>> is
    symmetric and that the domains of <math|A<rsub|F>> and its adjoint
    <math|A<rsub|F><rsup|\<ast\>>> coincide.

    <item><with|font-series|bold|Uniqueness>: The Friedrichs extension is
    unique in the sense that if <math|A> has a self-adjoint extension, then
    there is a unique self-adjoint extension that agrees with <math|A> on the
    original domain and is lower-bounded by the same bound as <math|A>.
  </enumerate>

  <section*|Significance>

  <\itemize>
    <item>The Friedrichs extension allows one to work with a larger, more
    manageable domain while preserving important properties like
    self-adjointness.

    <item>It's particularly important in quantum mechanics, where
    self-adjoint operators correspond to physical observables.

    <item>This method is a cornerstone in the theory of unbounded operators,
    especially in the context of partial differential operators.
  </itemize>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|The
      Friedrichs Extension Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Significance>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>