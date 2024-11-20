<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Constructive Solution for the Exact Eigenfunctions
  of Stationary Gaussian Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    A constructive method yielding exact eigenfunctions through uniform
    expansions is presented for stationary Gaussian processes. While Mercer's
    theorem guarantees existence and Aronszajn's theory provides the RKHS
    framework, this method explicitly constructs these objects through finite
    expressions. The triangular structure that emerges reveals deep
    connections to the Cameron-Martin space.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Novel
    Expansion Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Uniform Expansion Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Triangular
    Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  For a stationary Gaussian process with covariance operator <math|Q>, there
  exists a unique positive operator <math|Q<rsup|1/2>> such that
  <math|<around|(|Q<rsup|1/2>|)><rsup|2>=Q>. The Cameron-Martin space
  <math|H> is defined as:

  <\equation*>
    H=<around|{|Q<rsup|1/2>*h:h\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
  </equation*>

  This space exists for every Gaussian process, though explicit construction
  of <math|Q<rsup|1/2>> is unnecessary. The method works directly with
  uniform expansions of the kernel <math|K*<around|(|t-s|)>> and the Fourier
  transform of <math|<sqrt|S<around|(|\<omega\>|)>>>, where
  <math|S<around|(|\<omega\>|)>> is the spectral density.

  <section|Novel Expansion Method>

  A new technique is presented for expanding positive definite functions
  uniformly. For a stationary Gaussian process with kernel
  <math|K*<around|(|t-s|)>>, construct an orthonormal basis
  <math|<around|{|\<phi\><rsub|n>|}>> whose partial sums converge uniformly:

  <\equation*>
    K*<around|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n>*<around|(|t-s|)>
  </equation*>

  The kernel also admits a Mercer expansion:

  <\equation*>
    K*<around|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|t|)>*f<rsub|n><around|(|s|)>
  </equation*>

  where the Mercer basis elements <math|<around|{|f<rsub|n>|}>> are given by:

  <\equation*>
    f<rsub|n><around|(|t|)>=<big|int>g*<around|(|t-s|)>*\<phi\><rsub|n><around|(|s|)>*d*s
  </equation*>

  with <math|g<around|(|t|)>=\<cal-F\><around|[|<sqrt|S<around|(|\<omega\>|)>>|]>>.

  Rather than computing this convolution directly, <math|g<around|(|t|)>> is
  expanded in the Cameron-Martin basis <math|<around|{|\<psi\><rsub|n>|}>>
  whose partial sums converge uniformly:

  <\equation*>
    g<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|t|)>
  </equation*>

  This allows exact computation of the Mercer basis elements through
  term-by-term convolution, yielding the exact eigenfunctions rather than an
  approximation.

  <section|The Uniform Expansion Method>

  The construction begins with orthogonal polynomials with respect to
  <math|S<around|(|\<omega\>|)>>. For <math|n\<geq\>0>:

  <\equation*>
    p<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*p<rsub|k><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>|<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|k><rsup|2><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>>*p<rsub|k><around|(|\<omega\>|)>
  </equation*>

  Taking their Fourier transforms:

  <\equation*>
    <wide|p|^><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>
  </equation*>

  The orthogonal complement construction yields the basis, and the kernel
  expands as:

  <\equation*>
    u<rsub|n>=K-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|t|)>*<wide|p|^><rsub|k><around|(|t|)>*d*t|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|p|^><rsub|k><rsup|2><around|(|t|)>*d*t>*<wide|p|^><rsub|k>
  </equation*>

  <\equation*>
    \<phi\><rsub|n>=<frac|u<rsub|n>|<around|\<\|\|\>|u<rsub|n>|\<\|\|\>>>
  </equation*>

  <\equation*>
    K<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n><around|(|t|)>
  </equation*>

  Similarly for the Cameron-Martin basis, using
  <math|<sqrt|S<around|(|\<omega\>|)>>>:

  <\equation*>
    q<rsub|n><around|(|\<omega\>|)>=\<omega\><rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*q<rsub|k><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>|<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|k><rsup|2><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>>*q<rsub|k><around|(|\<omega\>|)>
  </equation*>

  Their Fourier transforms:

  <\equation*>
    <wide|q|^><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>q<rsub|n><around|(|\<omega\>|)>*e<rsup|i*t*\<omega\>>*d*\<omega\>
  </equation*>

  And the Cameron-Martin basis with its expansion:

  <\equation*>
    v<rsub|n>=g-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*<wide|q|^><rsub|k><around|(|t|)>*d*t|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|q|^><rsub|k><rsup|2><around|(|t|)>*d*t>*<wide|q|^><rsub|k>
  </equation*>

  <\equation*>
    \<psi\><rsub|n>=<frac|v<rsub|n>|<around|\<\|\|\>|v<rsub|n>|\<\|\|\>>>
  </equation*>

  <\equation*>
    g<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|t|)>
  </equation*>

  <section|Triangular Structure>

  <\theorem>
    For a stationary Gaussian process with kernel <math|K<around|(|t|)>> and
    spectral factor <math|g<around|(|t|)>=\<cal-F\><around|[|<sqrt|S<around|(|\<omega\>|)>>|]>>,
    let:

    <\equation*>
      K<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n><around|(|t|)>
    </equation*>

    <\equation*>
      g<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|t|)>
    </equation*>

    be their respective uniform expansions. Then the infinite convolution sum
    reduces to a finite sum due to triangularity.
  </theorem>

  <\proof>
    Fix <math|k>. The Mercer basis elements are given by the convolution of
    <math|\<phi\><rsub|k>> with <math|g<around|(|t|)>=\<cal-F\><around|[|<sqrt|S<around|(|\<omega\>|)>>|]>>:

    <\equation*>
      <big|int>g*<around|(|t-s|)>*\<phi\><rsub|k><around|(|s|)>*d*s
    </equation*>

    Using the uniform expansion of <math|g>, this integral equals:

    <\equation*>
      <big|int><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>*<around|(|t-s|)>|)>*\<phi\><rsub|k><around|(|s|)>*d*s=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>*<around|(|t-s|)>*\<phi\><rsub|k><around|(|s|)>*d*s
    </equation*>

    By Fubini's theorem:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>*<around|(|t-s|)>*\<phi\><rsub|k><around|(|s|)>*d*s=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<psi\><rsub|n>|\<rangle\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n>*<around|(|t-s|)>*\<phi\><rsub|k><around|(|s|)>*d*s
    </equation*>

    We now prove that <math|<big|int>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=0>
    for n \<gtr\> k:

    1) Recall <math|\<phi\><rsub|k><around|(|t|)>=\<cal-F\><around|[|p<rsub|k><around|(|\<omega\>|)>|]>>
    and <math|\<psi\><rsub|n><around|(|t|)>=\<cal-F\><around|[|q<rsub|n><around|(|\<omega\>|)>|]>>
    where <math|p<rsub|k>> and <math|q<rsub|n>> are orthogonal polynomials
    w.r.t. <math|S<around|(|\<omega\>|)>> and
    <math|<sqrt|S<around|(|\<omega\>|)>>> respectively.

    2) By Parseval's theorem: <math|<big|int>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=<big|int>q<rsub|n><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>>

    3) Expand <math|q<rsub|n><around|(|\<omega\>|)>> in terms of
    <math|<around|{|p<rsub|j><around|(|\<omega\>|)>|}><rsub|j=0><rsup|n>>:
    <math|q<rsub|n><around|(|\<omega\>|)>=<big|sum><rsub|j=0><rsup|n>a<rsub|n*j>*p<rsub|j><around|(|\<omega\>|)>>

    4) Substitute this into the integral:\ 

    <\equation>
      <big|int>q<rsub|n><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=<big|sum><rsub|j=0><rsup|n>a<rsub|n*j>*<big|int>p<rsub|j><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>
    </equation>

    5) For j \<gtr\> k, <math|<big|int>p<rsub|j><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>>S<around|(|\<omega\>|)>*d*\<omega\>=0>
    by orthogonality of <math|<around|{|p<rsub|j>|}>>.

    6) Therefore, <math|<big|int>p<rsub|j><around|(|\<omega\>|)><wide|p<rsub|k><around|(|\<omega\>|)>|\<bar\>><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=0>
    for j \<gtr\> k as well.

    7) Since n \<gtr\> k, all terms in the sum for j \<gtr\> k vanish,
    leaving only terms up to k.

    8) But <math|q<rsub|n>> is orthogonal to all polynomials of degree
    \<less\> n w.r.t. <math|<sqrt|S<around|(|\<omega\>|)>>>, so these
    remaining terms must sum to zero.

    Therefore, <math|<big|int>\<psi\><rsub|n><around|(|t|)>*\<phi\><rsub|k><around|(|t|)>*d*t=0>
    for n \<gtr\> k, establishing the triangular structure.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Novel
      Expansion Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Uniform Expansion Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Triangular
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>