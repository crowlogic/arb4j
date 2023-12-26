<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title| Essentially Self-Adjoint
  Operators>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|<code|<code*|This article synthesizes a detailed
  and intuitive discussion on self-adjoint operators, encompassing the
  theoretical foundations and practical analogies. These concepts are pivotal
  in fields like quantum mechanics and underpin many computational models in
  physics and mathematics.>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Essentially
    Self-Adjoint Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Closure of an Operator is Complete> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Self-Adjoint
    Extensions and Defect Indices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Computational
    Analogy in Java> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This article delves into the intricacies of self-adjoint operators in the
  realm of functional analysis, particularly focusing on Hilbert spaces. It
  is a compilation of a detailed discussion that covers the definitions,
  properties, and implications of essentially self-adjoint operators, their
  closures, and related concepts in mathematical physics and computational
  analogies.

  <section|Essentially Self-Adjoint Operators>

  <\definition>
    An operator <math|A> on a Hilbert space <math|\<cal-H\>> is deemed
    <with|font-shape|italic|essentially self-adjoint> if it is not only
    symmetric but also if its closure <math|<wide|A|\<bar\>>> is self-adjoint
  </definition>

  In essence, this involves two key conditions:

  <\enumerate>
    <item><strong|Symmetry>: The operator must satisfy\ 

    <\equation>
      <around|\<langle\>|A*f,g|\<rangle\>>=<around|\<langle\>|f,A*g|\<rangle\>>\<forall\>f,g\<in\>\<cal-D\><around|(|A|)>
    </equation>

    where <math|\<cal-D\><around|(|A|)>=dom>(A) is the domain of <math|A> and
    <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> is the inner
    product in <math|\<cal-H\>>.

    <item><strong|Closure and Self-Adjointness>: The operator <math|A> is
    <em|closable>, and its closure <math|<wide|A|\<bar\>>> is self-adjoint.
    This implies <math|<wide|A|\<bar\>>=A<rsup|\<ast\>>>, with
    <math|A<rsup|\<ast\>>> being the adjoint of <math|A>, and thus it is a
    necessary condtion that <math|<wide|A|\<bar\>>> and
    <math|A<rsup|\<ast\>>> are equal.
  </enumerate>

  <section|The Closure of an Operator is Complete>

  The concept of an operator's closure is analogous to completing a function
  by considering its limit points. Specifically,\ 

  <\definition>
    <strong|(Closure of an Operatior)> Let <math|A> be a linear operator with
    domain <math|\<cal-D\><around|(|A|)>> in a Hilbert space
    <math|\<cal-H\>>. The graph of <math|A>, denoted <math|G<around|(|A|)>>,
    is defined by

    <\equation>
      G<around|(|A|)>=<around|{|<around|(|f,A*f|)>:f\<in\>\<cal-D\><around|(|A|)>|}>\<subseteq\>\<cal-H\>\<times\>\<cal-H\>.
    </equation>

    The closure of <math|G<around|(|A|)>>, denoted
    <math|<wide|G<around|(|A|)>|\<bar\>>>, includes all limit points of
    sequences in <math|G<around|(|A|)>>. Specifically, if there exists a
    sequence <math|<around|{|f<rsub|n>|}>\<subseteq\>\<cal-D\><around|(|A|)>>
    such that <math|f<rsub|n>\<to\>f> in <math|\<cal-H\>>, and
    <math|A*f<rsub|n>\<to\>g> in <math|\<cal-H\>>, then

    <\equation>
      <around|(|f,g|)>\<in\><wide|G<around|(|A|)>|\<bar\>>.
    </equation>

    The operator <math|<wide|A|\<bar\>>>, defined by
    <math|<wide|A|\<bar\>>*f=g> for each <math|<around|(|f,g|)>\<in\><wide|G<around|(|A|)>|\<bar\>>>,
    is the <strong|closure> of <math|A>. This extends <math|A> to include
    these limit points, thereby <with|font-series|bold|completing> the
    operator.
  </definition>

  <section|Self-Adjoint Extensions and Defect Indices>

  Transitioning from a non-self-adjoint to a self-adjoint operator often
  involves an analysis of defect indices. These indices,
  <math|n<rsub|\<pm\>><around|(|A|)>>, are dimensions of the spaces
  <math|<around|{|u\<in\>\<cal-H\>:A<rsup|\<ast\>>*u=\<pm\>i*u|}>> and are
  crucial in determining if and how a symmetric operator <math|A> can be
  extended to a self-adjoint operator. This process, rooted in the von
  Neumann theory, entails selecting suitable boundary conditions or
  modifications to achieve self-adjointness.

  <section|Computational Analogy in Java>

  In the realm of Java programming, a self-adjoint operator can be
  conceptually represented in an object-oriented framework. Considering a
  base class <with|font-family|tt|Operator> and a subclass
  <with|font-family|tt|SelfAdjointOperator>, the self-adjoint nature is
  encapsulated by overriding the <with|font-family|tt|getAdjoint()> method to
  return the operator itself, i.e., <with|font-family|tt|this>. This
  programming analogy mirrors the mathematical property that a self-adjoint
  operator is its own adjoint.

  <\verbatim>
    \;

    public class SelfAdjointOperator extends Operator {

    \ \ \ \ @Override

    \ \ \ \ public SelfAdjointOperator getAdjoint() {

    \ \ \ \ \ \ \ \ return this;

    \ \ \ \ }

    }

    \;
  </verbatim>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Essentially
      Self-Adjoint Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Closure of an Operator is Complete>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Self-Adjoint
      Extensions and Defect Indices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Computational
      Analogy in Java> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>