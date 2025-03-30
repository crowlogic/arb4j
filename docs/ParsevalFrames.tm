<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Parseval Frames>|<doc-author|<author-data|<author-name|<math|S\<tau\>\<Sigma\>v\<varepsilon\>>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Parseval frames are a specialized type of frame in Hilbert spaces that
  extend the concept of orthonormal bases. They maintain the preservation of
  vector norms while introducing redundancy into the system. This redundancy
  allows for greater flexibility in representation and analysis,
  distinguishing Parseval frames as a valuable mathematical tool in the study
  of Hilbert spaces.

  <section|Definition of Parseval Frames>

  A Parseval frame is a specific type of frame in linear algebra and
  functional analysis that generalizes the concept of orthonormal bases while
  maintaining certain desirable properties. Formally, a sequence of vectors
  <math|<around|{|f<rsub|j>|}>> in a Hilbert space <math|H> is called a
  Parseval frame if it satisfies the following condition for all vectors
  <math|x> in <math|H>:

  <\equation>
    <big|sum><rsub|j><around|\||<around|\<langle\>|x,f<rsub|j>|\<rangle\>>|\|><rsup|2>=<around|\<\|\|\>|x|\<\|\|\>><rsup|2>
  </equation>

  This equation, known as the frame condition, is a generalization of
  Parseval's identity for orthonormal bases. It ensures that the norm of any
  vector <math|x> is preserved when expressed in terms of its inner products
  with the frame elements.

  Parseval frames can be characterized by their frame operator <math|S>,
  defined as:

  <\equation>
    S*x=<big|sum><rsub|j><around|\<langle\>|x,f<rsub|j>|\<rangle\>>*f<rsub|j>
  </equation>

  For a Parseval frame, the frame operator is equal to the identity operator,
  i.e., <math|S=I>. This property distinguishes Parseval frames from general
  frames and tight frames.

  An equivalent definition of a Parseval frame can be given in terms of the
  analysis operator <math|T> and its adjoint <math|T<rsup|\<ast\>>>:

  <\equation*>
    T<rsup|\<ast\>>*T=I
  </equation*>

  where <math|T> is the operator that maps a vector <math|x> to its sequence
  of frame coefficients <math|<around|{|<around|\<langle\>|x,f<rsub|j>|\<rangle\>>|}>>.

  In finite-dimensional spaces, Parseval frames have an additional
  characterization: a set of vectors <math|<around|{|f<rsub|j>|}>> forms a
  Parseval frame if and only if the matrix <math|F> whose columns are the
  frame vectors satisfies <math|F*F<rsup|\<ast\>>=I>, where
  <math|F<rsup|\<ast\>>> is the conjugate transpose of <math|F>.

  <section|Key Properties of Parseval Frames>

  <\enumerate>
    <item>Norm Equivalence: One of the fundamental properties of Parseval
    frames is their ability to maintain norm equivalence between a vector in
    the Hilbert space and its sequence of coefficients.

    <item>Redundancy: Unlike orthonormal bases, Parseval frames can have more
    vectors than the dimension of the space they span.

    <item>Tight Frame Property: Parseval frames are a special case of tight
    frames, where the frame bounds <math|A> and <math|B> are equal to
    <math|1>.

    <item>Reconstruction Formula: For any vector <math|x> in the Hilbert
    space, a Parseval frame <math|<around|{|f<rsub|j>|}>> satisfies the
    reconstruction formula:

    <\equation>
      x=<big|sum><rsub|j><around|\<langle\>|x,f<rsub|j>|\<rangle\>>*f<rsub|j>
    </equation>

    <item>Parseval's Identity: Parseval frames satisfy a generalized version
    of Parseval's identity:

    <\equation>
      <around|\<\|\|\>|x|\<\|\|\>><rsup|2>=<big|sum><rsub|j><around|\||<around|\<langle\>|x,f<rsub|j>|\<rangle\>>|\|><rsup|2>
    </equation>

    <item>Duality: Every Parseval frame is self-dual, meaning that the frame
    itself serves as its own dual frame.

    <item>Invariance Under Unitary Transformations: If
    <math|<around|{|f<rsub|j>|}>> is a Parseval frame and <math|U> is a
    unitary operator, then <math|<around|{|U*f<rsub|j>|}>> is also a Parseval
    frame.

    <item>Finite-Dimensional Characterization: In finite-dimensional Hilbert
    spaces, a set of vectors forms a Parseval frame if and only if the matrix
    whose columns are the frame vectors has orthonormal rows.
  </enumerate>

  <section|Construction via Orthogonal Projection>

  Let <math|H> be infinite-dimensional Hilbert space<next-line>Let
  <math|W\<subseteq\>H> be finite-dimensional subspace<next-line>Let
  <math|<around|{|e<rsub|1>,e<rsub|2>,...,e<rsub|n>|}>> be orthonormal basis
  for <math|W><next-line>Let <math|<around|{|f<rsub|k>|}><rsub|k=1><rsup|\<infty\>>>
  be orthonormal basis for <math|H>

  Orthogonal projection <math|P<rsub|W>> onto
  <math|W>:<next-line><math|P<rsub|W>*x=<big|sum><around|\<langle\>|x,e<rsub|i>|\<rangle\>>*e<rsub|i>>

  Construction of Parseval frame:

  <\equation>
    <wide|f|~><rsub|k>=<frac|P<rsub|W>*f<rsub|k>|<sqrt|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>>>
  </equation>

  Verification:

  <\enumerate>
    <item>For any <math|x\<in\>W>:

    <\equation>
      <around|\<langle\>|x,<wide|f|~><rsub|k>|\<rangle\>>=<frac|<around|\<langle\>|x,P<rsub|W>*f<rsub|k>|\<rangle\>>|<sqrt|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>>>=<frac|<around|\<langle\>|P<rsub|W>*x,f<rsub|k>|\<rangle\>>|<sqrt|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>>>=<frac|<around|\<langle\>|x,f<rsub|k>|\<rangle\>>|<sqrt|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>>>
    </equation>

    <item>Parseval frame condition:

    <\equation>
      <big|sum><around|\||<around|\<langle\>|x,<wide|f|~><rsub|k>|\<rangle\>>|\|><rsup|2>=<big|sum><frac|<around|\||<around|\<langle\>|x,f<rsub|k>|\<rangle\>>|\|><rsup|2>|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>>
    </equation>

    <item>Interchanging sums:

    <\equation>
      <big|sum><rsub|i><big|sum><rsub|k><frac|<around|\||<around|\<langle\>|x,f<rsub|k>|\<rangle\>>|\|><rsup|2><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|i>|\<rangle\>>|\|><rsup|2>|<around|(|<big|sum><around|\||<around|\<langle\>|f<rsub|k>,e<rsub|j>|\<rangle\>>|\|><rsup|2>|)><rsup|2>>
    </equation>

    <item>Using orthonormal basis property:

    <\equation>
      <big|sum><around|\||<around|\<langle\>|x,e<rsub|i>|\<rangle\>>|\|><rsup|2>=<around|\<\|\|\>|P<rsub|W>*x|\<\|\|\>><rsup|2>=<around|\<\|\|\>|x|\<\|\|\>><rsup|2>
    </equation>
  </enumerate>
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definition
      of Parseval Frames> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Key
      Properties of Parseval Frames> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Construction
      via Orthogonal Projection> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>