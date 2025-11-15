<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|ell|<macro|\<ell\>>>

    <assign|norm|<macro|1|<left|\|><arg|1><right|\|>>>

    <assign|inner|<macro|1|2|\<langle\><arg|1>, <arg|2> \<rangle\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|sup|<macro|sup>>

    <assign|inf|<macro|inf>>
  </hide-preamble>

  <doc-data|<doc-title|Multiplication Operators on <math|\<ell\><rsup|2>>
  Space>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    <with|mode|math|\<ell\><rsup|2>> Space>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Multiplication
    Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Algebraic
    Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Spectral
    Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This document presents a comprehensive analysis of multiplication operators
  on the Hilbert space <math|\<ell\><rsup|2>> of square-summable sequences.
  The focus lies on establishing the fundamental properties of these
  operators through rigorous proofs.

  <section|The <math|\<ell\><rsup|2>> Space>

  <\definition>
    [The <math|\<ell\><rsup|2>> Space] The space <math|\<ell\><rsup|2>>
    consists of all sequences <math|x=<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,\<ldots\>|)>>
    of complex numbers such that

    <\equation*>
      <big|sum><rsub|n=0><rsup|\<infty\>><around|\||x<rsub|n>|\|><rsup|2>\<less\>\<infty\>.
    </equation*>
  </definition>

  <\theorem>
    [<math|\<ell\><rsup|2>> is a Hilbert Space] The space
    <math|\<ell\><rsup|2>> equipped with the inner product

    <\equation*>
      <inner|x|y>=<big|sum><rsub|j=0><rsup|\<infty\>>x<rsub|j><wide|y<rsub|j>|\<bar\>>
    </equation*>

    and induced norm <math|<norm|x><rsub|2>=<sqrt|<inner|x|x>>> forms a
    complete Hilbert space.
  </theorem>

  <\proof>
    The proof consists of several steps:

    <with|font-series|bold|Step 1:> Verify that the inner product is
    well-defined. For <math|x,y\<in\>\<ell\><rsup|2>>, the Cauchy-Schwarz
    inequality gives

    <\equation*>
      <around*|\||<big|sum><rsub|j=0><rsup|n>x<rsub|j><wide|y<rsub|j>|\<bar\>>|\|>\<leq\><around*|(|<big|sum><rsub|j=0><rsup|n><around|\||x<rsub|j>|\|><rsup|2>|)><rsup|1/2><around*|(|<big|sum><rsub|j=0><rsup|n><around|\||y<rsub|j>|\|><rsup|2>|)><rsup|1/2>\<leq\><norm|x><rsub|2><norm|y><rsub|2>.
    </equation*>

    Since the right side is finite, the series
    <math|<big|sum><rsub|j=0><rsup|\<infty\>>x<rsub|j><wide|y<rsub|j>|\<bar\>>>
    converges absolutely.

    <with|font-series|bold|Step 2:> Verify inner product axioms. The inner
    product satisfies linearity, conjugate symmetry, and positive
    definiteness by direct verification using properties of infinite series.

    <with|font-series|bold|Step 3:> Prove completeness. Let
    <math|<around|(|x<rsup|<around|(|k|)>>|)><rsub|k=1><rsup|\<infty\>>> be a
    Cauchy sequence in <math|\<ell\><rsup|2>>. For each fixed
    <math|n\<in\><N>>, the sequence <math|<around|(|x<rsub|n><rsup|<around|(|k|)>>|)><rsub|k=1><rsup|\<infty\>>>
    is Cauchy in <math|<C>> and hence converges to some limit
    <math|x<rsub|n>>.

    One can show that <math|x=<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,\<ldots\>|)>\<in\>\<ell\><rsup|2>>
    and <math|x<rsup|<around|(|k|)>>\<to\>x> in <math|\<ell\><rsup|2>> norm,
    establishing completeness.
  </proof>

  <section|Multiplication Operators>

  <\definition>
    [Multiplication Operator] Let <math|a=<around|(|a<rsub|0>,a<rsub|1>,a<rsub|2>,\<ldots\>|)>\<in\>\<ell\><rsup|\<infty\>>>
    be a bounded sequence. The multiplication operator
    <math|M<rsub|a>:\<ell\><rsup|2>\<to\>\<ell\><rsup|2>> is defined by

    <\equation*>
      M<rsub|a>*x=<around|(|a<rsub|0>*x<rsub|0>,a<rsub|1>*x<rsub|1>,a<rsub|2>*x<rsub|2>,\<ldots\>|)>
    </equation*>

    for all <math|x=<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,\<ldots\>|)>\<in\>\<ell\><rsup|2>>.
  </definition>

  <\lemma>
    [Well-definedness of <math|M<rsub|a>>] If
    <math|a\<in\>\<ell\><rsup|\<infty\>>> and <math|x\<in\>\<ell\><rsup|2>>,
    then <math|M<rsub|a>*x\<in\>\<ell\><rsup|2>>.
  </lemma>

  <\proof>
    For <math|x\<in\>\<ell\><rsup|2>> and
    <math|a\<in\>\<ell\><rsup|\<infty\>>>, one has

    <\equation*>
      <big|sum><rsub|j=0><rsup|\<infty\>><around|\||a<rsub|j>*x<rsub|j>|\|><rsup|2>\<leq\><norm|a><rsub|\<infty\>><rsup|2><big|sum><rsub|j=0><rsup|\<infty\>><around|\||x<rsub|j>|\|><rsup|2>=<norm|a><rsub|\<infty\>><rsup|2><norm|x><rsub|2><rsup|2>\<less\>\<infty\>.
    </equation*>

    Therefore, <math|M<rsub|a>*x\<in\>\<ell\><rsup|2>>.
  </proof>

  <\theorem>
    [Operator Norm of Multiplication Operators] Let
    <math|a\<in\>\<ell\><rsup|\<infty\>>> and let
    <math|M<rsub|a>:\<ell\><rsup|2>\<to\>\<ell\><rsup|2>> be the
    corresponding multiplication operator. Then

    <\equation*>
      <norm|M<rsub|a>>=<norm|a><rsub|\<infty\>>=sup<rsub|n\<geq\>0><around|\||a<rsub|n>|\|>.
    </equation*>
  </theorem>

  <\proof>
    The proof proceeds in two parts to establish both inequalities.

    <with|font-series|bold|Step 1:> Show <math|<norm|M<rsub|a>>\<leq\><norm|a><rsub|\<infty\>>>.
    For any <math|x\<in\>\<ell\><rsup|2>> with <math|<norm|x><rsub|2>=1>, one
    has

    <\align>
      <tformat|<table|<row|<cell|<norm|M<rsub|a>*x><rsub|2><rsup|2>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><around|\||a<rsub|j>*x<rsub|j>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|j=0><rsup|\<infty\>><around|\||a<rsub|j>|\|><rsup|2><around|\||x<rsub|j>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|\<leq\><norm|a><rsub|\<infty\>><rsup|2><big|sum><rsub|j=0><rsup|\<infty\>><around|\||x<rsub|j>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<norm|a><rsub|\<infty\>><rsup|2><norm|x><rsub|2><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<norm|a><rsub|\<infty\>><rsup|2>.<eq-number>>>>>
    </align>

    Taking the supremum over all unit vectors <math|x>, this gives
    <math|<norm|M<rsub|a>>\<leq\><norm|a><rsub|\<infty\>>>.

    <with|font-series|bold|Step 2:> Show <math|<norm|M<rsub|a>>\<geq\><norm|a><rsub|\<infty\>>>.
    Let <math|\<epsilon\>\<gtr\>0> be given. Since
    <math|<norm|a><rsub|\<infty\>>=sup<rsub|n\<geq\>0><around|\||a<rsub|n>|\|>>,
    there exists an index <math|n<rsub|0>> such that
    <math|<around|\||a<rsub|n<rsub|0>>|\|>\<gtr\><norm|a><rsub|\<infty\>>-\<epsilon\>>.

    Consider the unit vector <math|e<rsub|n<rsub|0>>=<around|(|\<delta\><rsub|n<rsub|0>,0>,\<delta\><rsub|n<rsub|0>,1>,\<delta\><rsub|n<rsub|0>,2>,\<ldots\>|)>>
    where <math|\<delta\>> is the Kronecker delta. Then

    <\equation*>
      <norm|M<rsub|a>*e<rsub|n<rsub|0>>><rsub|2>=<norm|<around|(|0,0,\<ldots\>,a<rsub|n<rsub|0>>,0,\<ldots\>|)>><rsub|2>=<around|\||a<rsub|n<rsub|0>>|\|>\<gtr\><norm|a><rsub|\<infty\>>-\<epsilon\>.
    </equation*>

    Since <math|<norm|e<rsub|n<rsub|0>>><rsub|2>=1>, this shows
    <math|<norm|M<rsub|a>>\<geq\><around|\||a<rsub|n<rsub|0>>|\|>\<gtr\><norm|a><rsub|\<infty\>>-\<epsilon\>>.

    Since <math|\<epsilon\>\<gtr\>0> was arbitrary, one obtains
    <math|<norm|M<rsub|a>>\<geq\><norm|a><rsub|\<infty\>>>.

    Combining both inequalities yields <math|<norm|M<rsub|a>>=<norm|a><rsub|\<infty\>>>.
  </proof>

  <\proposition>
    [Action on Canonical Basis] Let <math|<around|{|e<rsub|n>|}><rsub|n=0><rsup|\<infty\>>>
    denote the canonical orthonormal basis for <math|\<ell\><rsup|2>>. Then

    <\equation*>
      M<rsub|a>*e<rsub|n>=a<rsub|n>*e<rsub|n>
    </equation*>

    for all <math|n\<geq\>0>.
  </proposition>

  <\proof>
    By definition, <math|e<rsub|n>=<around|(|\<delta\><rsub|n,0>,\<delta\><rsub|n,1>,\<delta\><rsub|n,2>,\<ldots\>|)>>.
    Therefore,

    <\equation*>
      M<rsub|a>*e<rsub|n>=<around|(|a<rsub|0>*\<delta\><rsub|n,0>,a<rsub|1>*\<delta\><rsub|n,1>,a<rsub|2>*\<delta\><rsub|n,2>,\<ldots\>|)>=a<rsub|n>*e<rsub|n>.
    </equation*>

    This shows that multiplication operators are diagonal with respect to the
    canonical basis.
  </proof>

  <section|Algebraic Properties>

  <\theorem>
    [Algebraic Structure of Multiplication Operators] The set of
    multiplication operators on <math|\<ell\><rsup|2>> forms a commutative
    algebra under the operations:

    <\enumerate>
      <item><math|M<rsub|a>+M<rsub|b>=M<rsub|a+b>>

      <item><math|\<lambda\>*M<rsub|a>=M<rsub|\<lambda\>*a>> for scalars
      <math|\<lambda\>\<in\><C>>

      <item><math|M<rsub|a>*M<rsub|b>=M<rsub|a*b>> (componentwise product)
    </enumerate>
  </theorem>

  <\proof>
    Each property is verified by direct computation:

    <with|font-series|bold|Property 1:> For <math|x\<in\>\<ell\><rsup|2>>,

    <\equation*>
      <around|(|M<rsub|a>+M<rsub|b>|)>*x=M<rsub|a>*x+M<rsub|b>*x=<around|(|a<rsub|0>*x<rsub|0>+b<rsub|0>*x<rsub|0>,a<rsub|1>*x<rsub|1>+b<rsub|1>*x<rsub|1>,\<ldots\>|)>=M<rsub|a+b>*x.
    </equation*>

    <with|font-series|bold|Property 2:> For <math|x\<in\>\<ell\><rsup|2>> and
    <math|\<lambda\>\<in\><C>>,

    <\equation*>
      <around|(|\<lambda\>*M<rsub|a>|)>*x=\<lambda\>*<around|(|M<rsub|a>*x|)>=<around|(|\<lambda\>*a<rsub|0>*x<rsub|0>,\<lambda\>*a<rsub|1>*x<rsub|1>,\<ldots\>|)>=M<rsub|\<lambda\>*a>*x.
    </equation*>

    <with|font-series|bold|Property 3:> For <math|x\<in\>\<ell\><rsup|2>>,

    <\align>
      <tformat|<table|<row|<cell|<around|(|M<rsub|a>*M<rsub|b>|)>*x>|<cell|=M<rsub|a>*<around|(|M<rsub|b>*x|)>=M<rsub|a>*<around|(|b<rsub|0>*x<rsub|0>,b<rsub|1>*x<rsub|1>,\<ldots\>|)><eq-number>>>|<row|<cell|>|<cell|=<around|(|a<rsub|0>*b<rsub|0>*x<rsub|0>,a<rsub|1>*b<rsub|1>*x<rsub|1>,\<ldots\>|)>=M<rsub|a*b>*x.<eq-number>>>>>
    </align>

    Commutativity follows since <math|M<rsub|a>*M<rsub|b>=M<rsub|a*b>=M<rsub|b*a>=M<rsub|b>*M<rsub|a>>.
  </proof>

  <\theorem>
    [Adjoint of Multiplication Operators] The adjoint of the multiplication
    operator <math|M<rsub|a>> is given by

    <\equation*>
      M<rsub|a><rsup|\<ast\>>=M<rsub|<wide|a|\<bar\>>>,
    </equation*>

    where <math|<wide|a|\<bar\>>=<around|(|<wide|a<rsub|0>|\<bar\>>,<wide|a<rsub|1>|\<bar\>>,<wide|a<rsub|2>|\<bar\>>,\<ldots\>|)>>
    is the componentwise complex conjugate.
  </theorem>

  <\proof>
    For <math|x,y\<in\>\<ell\><rsup|2>>, one computes

    <\align>
      <tformat|<table|<row|<cell|<inner|M<rsub|a>*x|y>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><around|(|a<rsub|j>*x<rsub|j>|)><wide|y<rsub|j>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>>x<rsub|j><wide|a<rsub|j>|\<bar\>><wide|y<rsub|j>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>>x<rsub|j><wide|<around|(|<wide|a<rsub|j>|\<bar\>>y<rsub|j>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<inner|x|M<rsub|<wide|a|\<bar\>>>*y>.<eq-number>>>>>
    </align>

    By the definition of the adjoint operator, this establishes
    <math|M<rsub|a><rsup|\<ast\>>=M<rsub|<wide|a|\<bar\>>>>.
  </proof>

  <section|Spectral Properties>

  <\theorem>
    [Invertibility of Multiplication Operators] The multiplication operator
    <math|M<rsub|a>> is invertible if and only if

    <\equation*>
      inf<rsub|n\<geq\>0><around|\||a<rsub|n>|\|>\<gtr\>0.
    </equation*>

    When invertible, the inverse is given by
    <math|M<rsub|a><rsup|-1>=M<rsub|1/a>> where
    <math|1/a=<around|(|1/a<rsub|0>,1/a<rsub|1>,1/a<rsub|2>,\<ldots\>|)>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Necessity:> Suppose <math|M<rsub|a>> is
    invertible. If <math|inf<rsub|n\<geq\>0><around|\||a<rsub|n>|\|>=0>, then
    there exists a subsequence <math|<around|(|a<rsub|n<rsub|k>>|)>> such
    that <math|<around|\||a<rsub|n<rsub|k>>|\|>\<to\>0> as
    <math|k\<to\>\<infty\>>.

    For each <math|k>, consider the unit vector <math|e<rsub|n<rsub|k>>>.
    Then <math|M<rsub|a>*e<rsub|n<rsub|k>>=a<rsub|n<rsub|k>>*e<rsub|n<rsub|k>>>,
    so <math|<norm|M<rsub|a>*e<rsub|n<rsub|k>>><rsub|2>=<around|\||a<rsub|n<rsub|k>>|\|>\<to\>0>.
    This contradicts the existence of <math|M<rsub|a><rsup|-1>> since
    <math|M<rsub|a>> would not be bounded below.

    <with|font-series|bold|Sufficiency:> Suppose
    <math|\<delta\>\<assign\>inf<rsub|n\<geq\>0><around|\||a<rsub|n>|\|>\<gtr\>0>.
    Define the sequence <math|1/a=<around|(|1/a<rsub|0>,1/a<rsub|1>,1/a<rsub|2>,\<ldots\>|)>>.
    Since <math|<around|\||1/a<rsub|n>|\|>=1/<around|\||a<rsub|n>|\|>\<leq\>1/\<delta\>>
    for all <math|n>, one has <math|1/a\<in\>\<ell\><rsup|\<infty\>>>.

    For any <math|x\<in\>\<ell\><rsup|2>>,

    <\equation*>
      M<rsub|1/a>*<around|(|M<rsub|a>*x|)>=M<rsub|1/a>*<around|(|a<rsub|0>*x<rsub|0>,a<rsub|1>*x<rsub|1>,\<ldots\>|)>=<around|(|x<rsub|0>,x<rsub|1>,x<rsub|2>,\<ldots\>|)>=x.
    </equation*>

    Similarly, <math|M<rsub|a>*<around|(|M<rsub|1/a>*x|)>=x>. Therefore,
    <math|M<rsub|a><rsup|-1>=M<rsub|1/a>>.
  </proof>

  <\theorem>
    [Spectrum of Multiplication Operators] The spectrum of the multiplication
    operator <math|M<rsub|a>> is given by

    <\equation*>
      \<sigma\><around|(|M<rsub|a>|)>=<wide|<around|{|a<rsub|n>:n\<geq\>0|}>|\<bar\>>,
    </equation*>

    the closure of the range of the sequence <math|a>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1:> Show <math|<around|{|a<rsub|n>:n\<geq\>0|}>\<subseteq\>\<sigma\><around|(|M<rsub|a>|)>>.
    For any <math|n\<geq\>0>, consider <math|\<lambda\>=a<rsub|n>>. Then
    <math|<around|(|M<rsub|a>-\<lambda\>*I|)>*e<rsub|n>=a<rsub|n>*e<rsub|n>-a<rsub|n>*e<rsub|n>=0>.
    Since <math|e<rsub|n>\<neq\>0>, the operator
    <math|M<rsub|a>-\<lambda\>*I> is not injective, hence not invertible.
    Therefore, <math|a<rsub|n>\<in\>\<sigma\><around|(|M<rsub|a>|)>>.

    <with|font-series|bold|Step 2:> Show <math|\<sigma\><around|(|M<rsub|a>|)>\<subseteq\><wide|<around|{|a<rsub|n>:n\<geq\>0|}>|\<bar\>>>.
    Let <math|\<lambda\>\<nin\><wide|<around|{|a<rsub|n>:n\<geq\>0|}>|\<bar\>>>.
    Then there exists <math|\<epsilon\>\<gtr\>0> such that
    <math|<around|\||\<lambda\>-a<rsub|n>|\|>\<geq\>\<epsilon\>> for all
    <math|n\<geq\>0>. This means the sequence
    <math|b=<around|(|<around|(|\<lambda\>-a<rsub|0>|)><rsup|-1>,<around|(|\<lambda\>-a<rsub|1>|)><rsup|-1>,\<ldots\>|)>>
    is bounded, so <math|M<rsub|b>> exists and satisfies
    <math|M<rsub|b>*<around|(|M<rsub|a>-\<lambda\>*I|)>=<around|(|M<rsub|a>-\<lambda\>*I|)>*M<rsub|b>=I>.
    Hence <math|\<lambda\>\<nin\>\<sigma\><around|(|M<rsub|a>|)>>.

    Since the spectrum is closed, one obtains
    <math|\<sigma\><around|(|M<rsub|a>|)>=<wide|<around|{|a<rsub|n>:n\<geq\>0|}>|\<bar\>>>.
  </proof>

  <\remark>
    [Significance of <math|\<ell\><rsup|2>> Space] The space
    <math|\<ell\><rsup|2>> serves as the prototypical separable
    infinite-dimensional Hilbert space. Every separable Hilbert space is
    isometrically isomorphic to <math|\<ell\><rsup|2>>, making it the
    canonical model for quantum mechanical state spaces and numerous
    applications in functional analysis. The completeness of
    <math|\<ell\><rsup|2>> enables the development of spectral theory,
    projection theory, and the rich geometric structure that characterizes
    Hilbert space analysis.
  </remark>
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
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|5|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      <with|mode|<quote|math>|\<ell\><rsup|2>> Space>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Multiplication
      Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Algebraic
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Spectral
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>