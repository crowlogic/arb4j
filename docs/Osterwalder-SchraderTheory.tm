<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Osterwalder-Schrader Theory>>

  <section|Introduction>

  The Osterwalder-Schrader (OS) theory provides a rigorous framework for
  constructing quantum field theories by transforming problems from Minkowski
  space to Euclidean space. This transformation is facilitated by the Wick
  rotation, and the theory is defined by a set of axioms (OS axioms) that
  ensure the reconstruction of a corresponding quantum field theory in
  Minkowski space.

  <section|Wick Rotation>

  The Wick rotation transforms Minkowski space-time with metric signature
  <math|<around|(|+,-,-,-|)>> into Euclidean space with metric
  <math|<around|(|+,+,+,+|)>> by replacing the real-time coordinate <math|t>
  with an imaginary time coordinate <math|\<tau\>>:

  <\equation>
    t\<to\>-i*\<tau\>
  </equation>

  Under this transformation, the Minkowski metric:

  <\equation>
    d*s<rsup|2>=d*t<rsup|2>-d*x<rsup|2>-d*y<rsup|2>-d*z<rsup|2>
  </equation>

  becomes the Euclidean metric:

  <\equation>
    d*s<rsub|E><rsup|2>=d*\<tau\><rsup|2>+d*x<rsup|2>+d*y<rsup|2>+d*z<rsup|2>
  </equation>

  This simplification converts the relativistic Klein-Gordon equation in
  Minkowski space:

  <\equation>
    <around|(|\<partial\><rsub|t><rsup|2>-\<nabla\><rsup|2>+m<rsup|2>|)>*\<phi\><around|(|t,<math-bf|x>|)>=0
  </equation>

  to the Euclidean Klein-Gordon equation:

  <\equation>
    <around|(|\<partial\><rsub|\<tau\>><rsup|2>+\<nabla\><rsup|2>-m<rsup|2>|)>*\<phi\><around|(|\<tau\>,<math-bf|x>|)>=0
  </equation>

  <section|OS Axioms>

  The OS axioms are conditions on the Euclidean Green's functions
  <math|G<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>>, where
  <math|x<rsub|i>> are points in Euclidean space.

  <subsection|Euclidean Invariance>

  The Green's functions must be invariant under the Euclidean group
  (translations and rotations):

  <\equation>
    G<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>=G<rsub|n><around|(|x<rsub|1>+a,\<ldots\>,x<rsub|n>+a|)>
  </equation>

  <\equation>
    G<rsub|n><around|(|R*x<rsub|1>,\<ldots\>,R*x<rsub|n>|)>=G<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>
  </equation>

  where <math|a> is a translation vector and <math|R> is a rotation matrix.

  <subsection|Reflection Positivity>

  For any test function <math|f<around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>>
  with support in <math|\<tau\>\<geq\>0>:

  <\equation>
    <big|int>d<rsup|d>*x<rsub|1>*\<ldots\>*d<rsup|d>*x<rsub|n><space|0.17em><wide|f<around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>|\<bar\>>G<rsub|n><around|(|\<theta\>*x<rsub|1>,\<ldots\>,\<theta\>*x<rsub|n>|)>*f<around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>\<geq\>0
  </equation>

  where <math|\<theta\>> is the reflection
  <math|\<theta\>*<around|(|\<tau\>,<math-bf|x>|)>=<around|(|-\<tau\>,<math-bf|x>|)>>.

  <subsection|Regularity Conditions>

  The Green's functions must be distributions with respect to their arguments
  and have certain analyticity properties.

  <subsection|Growth and Smoothness Conditions>

  The Green's functions should not grow too rapidly at infinity and should be
  sufficiently smooth. Specifically, they must satisfy:

  <\equation>
    <around|\||G<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>|\|>\<leq\>C*e<rsup|-\<mu\>*<big|sum><rsub|i\<less\>j><around|\||x<rsub|i>-x<rsub|j>|\|>>
  </equation>

  for some constants <math|C> and <math|\<mu\>>.

  <section|Reconstruction Theorem>

  Given a set of Euclidean Green's functions <math|G<rsub|n>> satisfying the
  OS axioms, one can construct the corresponding Wightman functions
  <math|W<rsub|n>> in Minkowski space.

  <subsection|Inverse Wick Rotation>

  Perform the inverse Wick rotation:

  <\equation>
    \<tau\>\<to\>i*t
  </equation>

  to obtain the Wightman functions <math|W<rsub|n><around|(|t<rsub|1>,<math-bf|x><rsub|1>,\<ldots\>,t<rsub|n>,<math-bf|x><rsub|n>|)>>
  from the Euclidean Green's functions <math|G<rsub|n><around|(|\<tau\><rsub|1>,<math-bf|x><rsub|1>,\<ldots\>,\<tau\><rsub|n>,<math-bf|x><rsub|n>|)>>.

  <subsection|Construction of the Hilbert Space>

  Define the Hilbert space using the Wightman functions. The inner product is
  given by:

  <\equation>
    <around|\<langle\>|\<Phi\>\|\<Psi\>|\<rangle\>>=<big|int><space|0.17em><wide|\<Phi\><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>|\<bar\>>W<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>*\<Psi\><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>d<rsup|d>*x<rsub|1>*\<ldots\>*d<rsup|d>*x<rsub|n>
  </equation>

  <subsection|Quantum Field Operators>

  Construct the quantum field operators <math|\<phi\><around|(|x|)>> such
  that:

  <\equation>
    <around|\<langle\>|0*<around|\||\<phi\><around|(|x<rsub|1>|)>*\<phi\><around|(|x<rsub|2>|)>*\<ldots\>*\<phi\><around|(|x<rsub|n>|)>|\|>*0|\<rangle\>>=W<rsub|n><around|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>
  </equation>

  These operators act on the Hilbert space constructed from the Wightman
  functions and satisfy the Wightman axioms, ensuring that the resulting
  quantum field theory is well-defined.

  <section|Summary>

  The Osterwalder-Schrader theory bridges Euclidean and Minkowski quantum
  field theories using the Wick rotation and a set of axioms that ensure the
  physical consistency of the reconstructed theory. The key mathematical
  tools involve Euclidean Green's functions, reflection positivity, and the
  reconstruction theorem, enabling the formulation of rigorous quantum field
  theories.
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
    <associate|auto-10|<tuple|4.2|3>>
    <associate|auto-11|<tuple|4.3|3>>
    <associate|auto-12|<tuple|5|3>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|3.1|2>>
    <associate|auto-5|<tuple|3.2|2>>
    <associate|auto-6|<tuple|3.3|2>>
    <associate|auto-7|<tuple|3.4|2>>
    <associate|auto-8|<tuple|4|2>>
    <associate|auto-9|<tuple|4.1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Wick
      Rotation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>OS
      Axioms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Euclidean Invariance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Reflection Positivity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Regularity Conditions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Growth and Smoothness
      Conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Reconstruction
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Inverse Wick Rotation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Construction of the Hilbert
      Space <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Quantum Field Operators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>