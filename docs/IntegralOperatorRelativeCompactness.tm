<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Metric Entropy and Compactness Properties of Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\definition>
    For a Gaussian process <math|<around|{|X<around|(|t|)>:t\<in\>T|}>>, the
    <with|font-series|bold|canonical metric> <math|d> is defined as:

    <\equation>
      d<around|(|s,t|)>\<assign\><sqrt|\<bbb-E\><around|[|<around|(|X<around|(|s|)>-X<around|(|t|)>|)><rsup|2>|]>>
    </equation>

    This metric reflects the expected distance between the process values at
    any two points <math|s,t\<in\>T>.
  </definition>

  <\definition>
    The <with|font-series|bold|spectral radius> <math|R> of the covariance
    operator <math|K> associated with a Gaussian process is defined as the
    square of the largest eigenvalue <math|\<lambda\><rsub|1>> of <math|K>:

    <\equation>
      R\<assign\>\<lambda\><rsub|1><rsup|2>
    </equation>

    The spectral radius indicates the maximum variance contributed by the
    process in the direction of the first eigenfunction.
  </definition>

  <\definition>
    The <with|font-series|bold|covering number>
    <math|N<around|(|T,d,\<varepsilon\>|)>> is the minimum number of points
    needed to cover the space <math|T> within distance <math|\<varepsilon\>>
    using the canonical metric <math|d>. An upper bound for the covering
    number is given by:

    <\equation>
      N<around|(|T,d,\<varepsilon\>|)>\<leq\>min
      <around|{|n\<in\>\<bbb-N\>:\<lambda\><rsub|n+1><rsup|2>\<leq\>\<varepsilon\>|}>
    </equation>

    where <math|<around|{|\<lambda\><rsub|k>|}>> are the eigenvalues of the
    covariance operator, ordered in decreasing order.
  </definition>

  <\definition>
    The <with|font-series|bold|metric entropy> is the logarithm of the
    covering number:

    <\equation>
      log N<around|(|T,d,\<varepsilon\>|)>
    </equation>

    which measures the complexity of the set <math|T> in the canonical metric
    <math|d> at scale <math|\<varepsilon\>\<gtr\>0>.
  </definition>

  <\definition>
    The <with|font-series|bold|metric entropy integral> is defined as:

    <\equation>
      <big|int><rsub|0><rsup|R>log N<around|(|T,d,\<varepsilon\>|)>*<space|0.17em>d*\<varepsilon\>
    </equation>

    where <math|R\<assign\>\<lambda\><rsub|1><rsup|2>> is the spectral
    radius. This integral quantifies the total complexity of covering the
    metric space <math|<around|(|T,d|)>> as <math|\<varepsilon\>> varies from
    <math|R> to <math|0>.
  </definition>

  <section*|Theorem>

  <\theorem>
    Let <math|<around|{|X<around|(|t|)>:t\<in\>T|}>> be a Gaussian process
    with covariance operator <math|K> having eigenvalues
    <math|<around|{|\<lambda\><rsub|k>|}>>. If the eigenvalues satisfy
    <math|\<lambda\><rsub|k>\<to\>0> as <math|k\<to\>\<infty\>>, then the
    metric entropy integral

    <\equation>
      <big|int><rsub|0><rsup|R>log N<around|(|T,d,\<varepsilon\>|)>*<space|0.17em>d*\<varepsilon\>\<less\>\<infty\>
    </equation>

    is finite, indicating that the space is relatively compact in the
    canonical metric <math|d>.
  </theorem>

  <section*|Proof>

  Given <math|\<lambda\><rsub|k>\<to\>0>, for any
  <math|\<varepsilon\>\<gtr\>0>, there exists a finite set of indices such
  that <math|\<lambda\><rsub|k><rsup|2>\<gtr\>\<varepsilon\>>. Thus, the
  covering number <math|N<around|(|T,d,\<varepsilon\>|)>> is finite for any
  <math|\<varepsilon\>\<gtr\>0>.

  The metric entropy integral is:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|R>log
    N<around|(|T,d,\<varepsilon\>|)>*<space|0.17em>d*\<varepsilon\>>|<cell|=<big|sum><rsub|k=1><rsup|N<around|(|T,d,R|)>>log<around*|(|k|)>*<around|(|\<lambda\><rsub|k><rsup|2>-\<lambda\><rsub|k+1><rsup|2>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|\<lambda\><rsub|k+1><rsup|2>\<leq\>\<varepsilon\>>log<around*|(|k|)>*<around|(|\<lambda\><rsub|k><rsup|2>-\<lambda\><rsub|k+1><rsup|2>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|\<lambda\><rsub|k+1><rsup|>\<leq\><sqrt|\<varepsilon\>><rsup|>>log<around*|(|k|)>*<around|(|\<lambda\><rsub|k><rsup|2>-\<lambda\><rsub|k+1><rsup|2>|)>>>>>>
  </equation>

  Both <math|log k> and <math|<around|(|\<lambda\><rsub|k><rsup|2>-\<lambda\><rsub|k+1><rsup|2>|)>>
  are finite, thus the sum is finite, ensuring that the metric entropy
  integral is finite, implying relative compactness.
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
    <associate|auto-1|<tuple|5|1|../.TeXmacs/texts/scratch/no_name_64.tm>>
    <associate|auto-2|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_64.tm>>
    <associate|auto-3|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_64.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definitions
      and Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>