<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>and a Functional Framework Toward a
  Hilbert--Pólya Construction>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Unitary
    Time Change on <with|mode|math|L<rsup|2><around|(|\<bbb-R\>|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes in the Sense of Priestley> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitary
    Time Changes Map Stationary to Oscillatory>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zero
    Localization by a Functional Measure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Hilbert
    Space on the Zero Set and Multiplication Operator>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Time-Changed
    Stationary Processes and a Hilbert\UPólya Scaffold>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Appendix:
    Regularity and Simple Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Unitary Time Change on <math|L<rsup|2><around|(|\<bbb-R\>|)>>>

  <\definition>
    [Unitary time change operator on <math|L<rsup|2><around|(|\<bbb-R\>|)>>]
    Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous
    with <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0> almost everywhere.
    Define <math|U<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    by

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>\<assign\><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>*<space|2em><around|(|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|)>.
    </equation>
  </definition>

  <\theorem>
    [Unitarity of <math|U<rsub|\<theta\>>>] <math|U<rsub|\<theta\>>> is
    unitary on <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    By absolute continuity and <math|\<theta\><rprime|'><around|(|t|)>\<neq\>0>
    a.e., the change-of-variables formula gives

    <\equation*>
      <big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*\<theta\><rprime|'><around|(|t|)><around|\||<space|0.17em>|\|>*f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|u|)>|\|><rsup|2>*<space|0.17em>d*u,
    </equation*>

    so <math|U<rsub|\<theta\>>> is an isometry. Since <math|\<theta\>> admits
    an a.e. inverse <math|\<theta\><rsup|-1>> with the same regularity and
    nonvanishing derivative a.e., one has
    <math|U<rsub|\<theta\><rsup|-1>>*U<rsub|\<theta\>>=<math-up|Id>> and
    <math|U<rsub|\<theta\>>*U<rsub|\<theta\><rsup|-1>>=<math-up|Id>> a.e.,
    hence <math|U<rsub|\<theta\>>> is unitary.
  </proof>

  <section|Oscillatory Processes in the Sense of Priestley>

  <\definition>
    [Oscillatory process, gain and oscillatory function] Let <math|F> be a
    finite nonnegative Borel measure on <math|\<bbb-R\>>. For each
    <math|t\<in\>\<bbb-R\>> let <math|A<rsub|t>:\<bbb-R\>\<to\>\<bbb-C\>> be
    measurable and square-integrable with respect to <math|F>. Define

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>
    </equation>

    An <em|oscillatory process> <math|Z> is a stochastic process with
    spectral representation

    <\equation>
      Z<around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> satisfying the orthogonality of infinitesimal increments

    <\equation>
      \<bbb-E\>*<space|-0.17em><around*|[|\<Phi\>*<around|(|d*\<lambda\>|)><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    The covariance kernel is

    <\equation>
      R<rsub|Z><around|(|t,s|)>\<assign\>\<bbb-E\><around*|[|Z<around|(|t|)><space|0.17em><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\remark>
    [Real-valuedness] <math|Z> is real-valued if and only if, for each fixed
    <math|t>, <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    for <math|F>-a.e. <math|\<lambda\>>, equivalently
    <math|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    for <math|F>-a.e. <math|\<lambda\>>.
  </remark>

  <\theorem>
    [Existence of oscillatory processes with prescribed
    <math|<around|(|A<rsub|t>|)><rsub|t>>] Let <math|F> be finite and
    <math|<around|(|A<rsub|t>|)><rsub|t>> measurable with
    <math|<big|int><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>\<less\>\<infty\>>
    for each <math|t>. There exists a complex orthogonal random measure
    <math|\<Phi\>> on <math|\<bbb-R\>> with spectral measure <math|F> such
    that <math|Z<around|(|t|)>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>
    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
    covariance

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    Construct the stochastic integral first for simple functions in
    <math|L<rsup|2>*<around|(|\<bbb-R\>,F|)>> and extend by isometry using

    <\equation>
      \<bbb-E\><around*|[|<mid|\|><big|int>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><mid|\|><rsup|2>|]>=<big|int><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    Apply with <math|g=\<varphi\><rsub|t>> to obtain <math|Z<around|(|t|)>>
    and the stated covariance.
  </proof>

  <section|Unitary Time Changes Map Stationary to Oscillatory>

  <\definition>
    [Stationary process via Cramér representation] A zero-mean stationary
    process <math|X> with spectral measure <math|F> admits

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    with covariance

    <\equation>
      R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\theorem>
    [Unitary time change yields an oscillatory process] Let <math|X> be
    zero-mean stationary with

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    Let <math|\<theta\>> satisfy the hypotheses of the unitary time change
    and set

    <\equation>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is an oscillatory process with oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    and gain

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    The covariance is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </theorem>

  <\proof>
    Compute

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>>>>>
    </equation>

    Thus\ 

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    \ and

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>
    </equation>

    The covariance follows from orthogonality of <math|\<Phi\>>.
  </proof>

  <\remark>
    [Real-valuedness under time change] If <math|X> is real-valued and
    <math|\<theta\>> is real with <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0>
    a.e., then <math|Z> is real-valued by the Hermitian symmetry of
    <math|A<rsub|t>>.
  </remark>

  <section|Zero Localization by a Functional Measure>

  <\definition>
    [Zero localization measure] Let <math|Z> be real-valued, with sample
    paths in <math|C<rsup|1><around|(|\<bbb-R\>|)>>, and such that every zero
    of <math|Z> is simple (i.e. <math|Z<around|(|t<rsub|0>|)>=0\<Longrightarrow\>Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>).
    Define the measure on Borel <math|B\<subset\>\<bbb-R\>> by

    <\equation>
      \<mu\><around|(|B|)>\<assign\><big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>
  </definition>

  <\theorem>
    [Support and mass on the zero set] For any test function
    <math|\<phi\>\<in\>C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<phi\><around|(|t<rsub|0>|)>
    </equation>

    and hence <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>
    is a discrete measure assigning unit mass to each simple zero of
    <math|Z>.
  </theorem>

  <\proof>
    At a simple zero <math|t<rsub|0>>, the distributional identity holds:

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>+<big|sum><rsub|t<rsub|1>\<neq\>t<rsub|0>:Z<around|(|t<rsub|1>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|1>|)>|<around|\||Z<rprime|'><around|(|t<rsub|1>|)>|\|>>
    </equation>

    Multiplying by <math|<around|\||Z<rprime|'><around|(|t|)>|\|>> and
    integrating against <math|\<phi\>> yields the stated identity and the
    atomic form of <math|\<mu\>>.
  </proof>

  <section|Hilbert Space on the Zero Set and Multiplication Operator>

  <\definition*>
    [Hilbert space on the zero set via <math|\<mu\>>] Define

    <\equation>
      \<cal-H\>\<assign\>L<rsup|2><around|(|\<mu\>|)>=<around*|{|f:\<bbb-R\>\<to\>\<bbb-C\><space|0.17em>:<space|0.17em><around|\<\|\|\>|f|\<\|\|\>><rsub|\<cal-H\>><rsup|2>=<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t\<less\>\<infty\>|}>
    </equation>

    The inner product is\ 

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>
  </definition*>

  <\proposition>
    [Atomic structure] With <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>,
    one has

    <\equation>
      \<cal-H\>=<around*|{|f:<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>\<to\>\<bbb-C\><space|0.17em>:<space|0.17em><big|sum><rsub|Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>\<cong\>\<ell\><rsup|2>
    </equation>

    and the functions <math|e<rsub|t<rsub|0>>> defined by
    <math|e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>*t<rsub|1>>>
    form an orthonormal basis.
  </proposition>

  <\proof>
    Substitute the atomic form of <math|\<mu\>> into the
    <math|L<rsup|2>>-definition to obtain the
    <math|\<ell\><rsup|2>>-structure; the canonical coordinate functions form
    an ONB.
  </proof>

  <\definition>
    [Multiplication operator] Define <math|L:\<cal-D\><around|(|L|)>\<subset\>\<cal-H\>\<to\>\<cal-H\>>
    by <math|<around|(|L*f|)><around|(|t|)>=t*<space|0.17em>f<around|(|t|)>>
    on <math|sup<around|(|\<mu\>|)>>, with

    <\equation>
      \<cal-D\><around|(|L|)>=<around*|{|f\<in\>\<cal-H\><space|0.17em>:<space|0.17em><big|int><around|\||t*<space|0.17em>f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    [Self-adjointness and spectrum] <math|L> is self-adjoint on
    <math|\<cal-H\>>, and its spectrum is exactly

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|<space|0.17em>t\<in\>\<bbb-R\><space|0.17em>:<space|0.17em>Z<around|(|t|)>=0<space|0.17em>|}>
    </equation>

    with pure point spectrum consisting of simple eigenvalues
    <math|\<lambda\>=t<rsub|0>> (for each zero <math|t<rsub|0>>) and
    eigenvectors <math|e<rsub|t<rsub|0>>>.
  </theorem>

  <\proof>
    For <math|f,g\<in\>\<cal-D\><around|(|L|)>>,

    <\equation>
      <around|\<langle\>|L*f,g|\<rangle\>>=<big|int>t*<space|0.17em>f<around|(|t|)><space|0.17em><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<big|int>f<around|(|t|)><space|0.17em><wide|t*<space|0.17em>g<around|(|t|)>|\<bar\>><space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<around|\<langle\>|f,L*g|\<rangle\>>
    </equation>

    so <math|L> is symmetric. On the atomic space, <math|L> is unitarily
    equivalent to the diagonal operator <math|<around|(|c<rsub|t<rsub|0>>|)>\<mapsto\><around|(|t<rsub|0>*c<rsub|t<rsub|0>>|)>>
    on <math|\<ell\><rsup|2>>, which is self-adjoint with spectrum equal to
    the set of diagonal entries <math|<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>>,
    each simple, with eigenvectors the coordinate basis identified with
    <math|e<rsub|t<rsub|0>>>.
  </proof>

  <section|Time-Changed Stationary Processes and a Hilbert\UPólya Scaffold>

  <\definition>
    [Arithmetic phase time change] Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be an absolutely continuous phase with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> a.e. encoding the target
    arithmetic structure (e.g. a Riemann\USiegel-type phase). Let <math|X> be
    zero-mean stationary with spectral measure <math|F> and orthogonal random
    measure <math|\<Phi\>>. Define the time-changed oscillatory process

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>
  </definition>

  <\proposition>
    [Covariance under time change]

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    In particular, if <math|F> is chosen so that <math|R<rsub|Z>>
    concentrates along <math|\<theta\><around|(|t|)>=\<theta\><around|(|s|)>>,
    then the correlation structure of <math|Z> is phase-aligned with
    <math|\<theta\>>.
  </proposition>

  <\proof>
    Insert the oscillatory function into the covariance integral and use the
    orthogonality relation for <math|\<Phi\>>.
  </proof>

  <\definition>
    [Zero-localized Hilbert space and operator] With the zero localization
    measure <math|\<mu\>*<around|(|d*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t>,
    define <math|\<cal-H\>=L<rsup|2><around|(|\<mu\>|)>> and <math|L> as
    multiplication by <math|t> on <math|\<cal-H\>>.
  </definition>

  <\theorem>
    [Spectral encoding of zero set] The spectrum of <math|L> is the zero set
    of <math|Z>:

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t:Z<around|(|t|)>=0|}>
    </equation>

    and <math|L> has simple pure point spectrum with eigenvectors supported
    at individual zeros.
  </theorem>

  <\proof>
    Follows from the established atomic structure of <math|\<mu\>> and the
    diagonal form of <math|L> on <math|L<rsup|2><around|(|\<mu\>|)>>.
  </proof>

  <\remark>
    [Operator scaffold] The sequence

    <\equation>
      <text|stationary >X<long-arrow|\<rubber-rightarrow\>|<space|0.17em>U<rsub|\<theta\>><space|0.17em>><text|oscillatory
      >Z<long-arrow|\<rubber-rightarrow\>|<space|0.17em>\<delta\><around|(|Z|)><space|0.17em><around|\||Z<rprime|'>|\|>*<space|0.17em>d*t<space|0.17em>>\<mu\><long-arrow|\<rubber-rightarrow\>|<space|0.17em>L<rsup|2><around|(|\<mu\>|)><space|0.17em>>\<cal-H\><long-arrow|\<rubber-rightarrow\>|<space|0.17em>t\<cdot\><space|0.17em>>L
    </equation>

    produces a concrete self-adjoint operator whose spectrum equals the
    (constructed) zero set governed by the choice of <math|\<theta\>> and
    <math|F>. Aligning <math|\<theta\>> and <math|F> to a prescribed
    arithmetic target sets the stage for a Hilbert\UPólya-type
    identification.
  </remark>

  <section|Appendix: Regularity and Simple Zeros>

  <\definition>
    [Regularity and simplicity] Assume <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>
    and every zero of <math|Z> is simple:
    <math|Z<around|(|t<rsub|0>|)>=0\<Longrightarrow\>Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>.
  </definition>

  <\lemma>
    [Local finiteness and decomposition] Under the above condition, zeros are
    locally finite and the distributional identity

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>
    </equation>

    holds, yielding <math|>

    <\equation>
      \<mu\>=<big|sum><rsub|t<rsub|0>>\<delta\><rsub|t<rsub|0>>
    </equation>
  </lemma>

  <\proof>
    Continuity and <math|Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0> imply
    isolated zeros by the inverse function theorem; the distributional
    identity is standard from the one-dimensional change-of-variables formula
    for the Dirac delta under monotone <math|C<rsup|1>> maps near each zero.
  </proof>
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|7|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Unitary
      Time Change on <with|mode|<quote|math>|L<rsup|2><around|(|\<bbb-R\>|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes in the Sense of Priestley>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitary
      Time Changes Map Stationary to Oscillatory>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization by a Functional Measure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Hilbert
      Space on the Zero Set and Multiplication Operator>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Time-Changed
      Stationary Processes and a Hilbert\UPólya Scaffold>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Appendix:
      Regularity and Simple Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>