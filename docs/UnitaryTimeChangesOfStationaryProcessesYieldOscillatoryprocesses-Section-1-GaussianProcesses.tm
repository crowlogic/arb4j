<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <section|Gaussian Processes>

  <subsection|Measure-theoretic preliminaries>

  <\definition>
    <label|def:absolute_continuity><with|font-series|bold|(Absolute
    continuity of measures)> Let <math|<around|(|S,\<Sigma\>|)>> be a
    measurable space and let <math|\<mu\>> and <math|\<nu\>> be measures on
    <math|<around|(|S,\<Sigma\>|)>> The measure <math|\<nu\>> is said to be
    absolutely continuous with respect to <math|\<mu\>>, denoted
    <math|\<nu\>\<ll\>\<mu\>>, if for every <math|A\<in\>\<Sigma\>>
    satisfying <math|\<mu\><around|(|A|)>=0>, one has
    <math|\<nu\><around|(|A|)>=0>
  </definition>

  <\theorem>
    <label|thm:radon_nikodym><with|font-series|bold|(Radon\UNikodým theorem
    <cite|rudinRealComplexAnalysis>)> Let
    <math|<around|(|S,\<Sigma\>,\<mu\>|)>> be a <math|\<sigma\>>-finite
    measure space and let <math|\<nu\>> be a <math|\<sigma\>>-finite measure
    on <math|<around|(|S,\<Sigma\>|)>> such that <math|\<nu\>\<ll\>\<mu\>>
    Then there exists a unique (up to <math|\<mu\>>-almost everywhere
    equality) <math|\<Sigma\>>-measurable function
    <math|g:S\<to\><around|[|0,\<infty\>|]>> such that

    <\equation>
      <label|eq:RN>\<nu\><around|(|A|)>=<big|int><rsub|A>g<around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>*<space|1em><text|for
      all >A\<in\>\<Sigma\>
    </equation>

    The function <math|g> is called the Radon\UNikodým derivative of
    <math|\<nu\>> with respect to <math|\<mu\>>, denoted
    <math|g=<frac|d*\<nu\>|d*\<mu\>>>
  </theorem>

  <\definition>
    <label|def:probability_space><with|font-series|bold|(Probability space)>
    A probability space is a triple <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>
    where <math|\<Omega\>> is a sample space, <math|\<cal-F\>> is a
    <math|\<sigma\>>-algebra of subsets of <math|\<Omega\>>, and
    <math|\<bbb-P\>:\<cal-F\>\<to\><around|[|0,1|]>> is a probability measure
    satisfying <math|\<bbb-P\><around|(|\<Omega\>|)>=1>
  </definition>

  <\definition>
    <label|def:L2_space><with|font-series|bold|(Complex-valued
    square-integrable random variables)> Let
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> be a probability space
    The space <math|L<rsup|2><around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>;\<bbb-C\>|)>>
    consists of all complex-valued random variables
    <math|Z:\<Omega\>\<to\>\<bbb-C\>> satisfying

    <\equation>
      <label|eq:L2_norm>\<bbb-E\><around|[|<around|\||Z|\|><rsup|2>|]>=<big|int><rsub|\<Omega\>><around|\||Z<around|(|\<omega\>|)>|\|><rsup|2>*<space|0.17em>d*\<bbb-P\><around|(|\<omega\>|)>\<less\>\<infty\>
    </equation>

    where two random variables are identified if they agree
    <math|\<bbb-P\>>-almost surely This space is a Hilbert space with inner
    product

    <\equation>
      <label|eq:L2_inner><around|\<langle\>|Z<rsub|1>,Z<rsub|2>|\<rangle\>>\<assign\>\<bbb-E\><around|[|Z<rsub|1><wide|Z<rsub|2>|\<bar\>>|]>=<big|int><rsub|\<Omega\>>Z<rsub|1><around|(|\<omega\>|)><wide|Z<rsub|2><around|(|\<omega\>|)>|\<bar\>><space|0.17em>d*\<bbb-P\><around|(|\<omega\>|)>
    </equation>
  </definition>

  <\definition>
    <label|def:complex_orthogonal_measure><with|font-series|bold|(Complex
    orthogonal random measure)> Let <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>
    be a probability space and <math|<around|(|\<bbb-R\>,\<cal-B\>|)>> the
    real line with its Borel <math|\<sigma\>>-algebra A map
    <math|\<Phi\>:\<cal-B\>\<to\>L<rsup|2><around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>;\<bbb-C\>|)>>
    is called a complex orthogonal random measure with control measure
    <math|F> if for all <math|A,B\<in\>\<cal-B\>>,

    <\equation>
      <label|eq:orth_rm>\<bbb-E\><around*|[|\<Phi\><around|(|A|)><space|0.17em><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>=F*<around|(|A\<cap\>B|)>
    </equation>

    where <math|F:\<cal-B\>\<to\><around|[|0,\<infty\>|)>> is a finite
    positive measure on <math|<around|(|\<bbb-R\>,\<cal-B\>|)>>, see
    <cite|stationaryAndRelatedStochasticProcesses>
  </definition>

  <subsection|Spectral representation of real-valued processes>

  Unless otherwise stated, all processes considered will be real-valued with
  absolutely continuous spectral measure in the sense of
  Definition<nbsp><reference|def:absolute_continuity>, meaning

  <\equation>
    <label|eq:ac_spectral>d*F<around|(|\<lambda\>|)>=<wide|F|\<dot\>><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation>

  where <math|<wide|F|\<dot\>>:\<bbb-R\>\<to\><around|[|0,\<infty\>|)>> is a
  measurable density function and <math|d*\<lambda\>> denotes Lebesgue
  measure on <math|\<bbb-R\>>

  <\theorem>
    <label|asm:real>Let <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>;\<bbb-R\>|)>>
    be a real-valued process with spectral representation

    <\equation>
      <label|eq:spectral_rep>X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure in the sense
    of Definition<nbsp><reference|def:complex_orthogonal_measure> Then

    <\equation>
      <label|eq:2>d<wide|\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=d*\<Phi\>*<around|(|-\<lambda\>|)>
    </equation>

    and the spectral measure <math|F> is even

    <\equation>
      <label|eq:3>F*<around|(|-A|)>=F<around|(|A|)>*<space|1em><text|for all
      Borel >A\<subset\>\<bbb-R\>
    </equation>
  </theorem>

  <\proof>
    Real-valuedness <math|<wide|X<around|(|u|)>|\<bar\>>=X<around|(|u|)>> for
    all <math|u\<in\>\<bbb-R\>> gives

    <\equation>
      <label|eq:conj><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<wide|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|-\<lambda\>|)>
    </equation>

    By uniqueness of the spectral representation, <eqref|eq:2> follows The
    covariance function

    <\equation>
      <label|eq:R>R<around|(|u|)>\<assign\>\<bbb-E\>*<around|[|X<around|(|0|)>*X<around|(|u|)>|]>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    satisfies <math|R*<around|(|-u|)>=R<around|(|u|)>>, so

    <\equation>
      <label|eq:even><big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F*<around|(|-\<lambda\>|)>
    </equation>

    By uniqueness of Fourier\UStieltjes transforms, <eqref|eq:3> follows
  </proof>

  <subsection|Gaussian processes>

  <\definition>
    <label|def:gaussian_process><with|font-series|bold|(Gaussian process)>
    Let <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> be a probability
    space and <math|T> a nonempty index set A family
    <math|<around|{|X<rsub|t>:t\<in\>T|}>> of real-valued random variables on
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is called a Gaussian
    process if for every finite subset <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>\<subset\>T>
    the random vector <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    is multivariate normal (possibly degenerate) The mean function is
    <math|m:T\<to\>\<bbb-R\>> defined by <math|m<around|(|t|)>\<assign\>\<bbb-E\><around|[|X<rsub|t>|]>>
    and the covariance kernel is <math|K:T\<times\>T\<to\>\<bbb-R\>> defined
    by

    <\equation>
      <label|eq:covariance_kernel>K<around|(|s,t|)>\<assign\><math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>=\<bbb-E\>*<around|[|<around|(|X<rsub|s>-m<around|(|s|)>|)>*<around|(|X<rsub|t>-m<around|(|t|)>|)>|]>
    </equation>

    A Gaussian process is completely determined in law by <math|m> and
    <math|K>
  </definition>

  <subsection|Stationary processes>

  <\definition>
    <label|def:cramer><with|font-series|bold|(Cramér spectral
    representation)> <cite|stationaryAndRelatedStochasticProcesses> A
    zero-mean weakly stationary process <math|X=<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    with spectral measure <math|F> admits the sample path representation

    <\equation>
      <label|eq:cramer_representation>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with control
    measure <math|F> in the sense of Definition<nbsp><reference|def:complex_orthogonal_measure>
    The covariance function is <math|R<rsub|X>:\<bbb-R\>\<to\>\<bbb-R\>>
    defined by

    <\equation>
      <label|eq:stationary_covariance>R<rsub|X>*<around|(|t-s|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsubsection|Sample path realizations>

  <\definition>
    <label|def:L2loc><with|font-series|bold|(Locally square-integrable
    functions)> Define

    <\equation>
      <label|eq:L2loc>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>

    where <math|d*t> denotes Lebesgue measure on <math|\<bbb-R\>>
  </definition>

  <\definition>
    <label|def:polynomial_growth><with|font-series|bold|(Polynomial growth at
    infinity)> A function <math|f:\<bbb-R\>\<to\>\<bbb-C\>> is said to have
    polynomial growth at infinity if there exist constants <math|C\<gtr\>0>
    and <math|n\<in\>\<bbb-N\>> such that

    <\equation>
      <label|eq:poly_growth><around|\||f<around|(|t|)>|\|>\<le\>C*<around|(|1+<around|\||t|\|>|)><rsup|n>*<space|1em><text|for
      all >t\<in\>\<bbb-R\>
    </equation>
  </definition>

  <\remark>
    <label|rem:L2loc_properties>Every bounded measurable set in
    <math|\<bbb-R\>> is contained in a compact set; hence
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> contains
    functions that are square-integrable on every bounded interval This
    includes functions with polynomial growth at infinity in the sense of
    Definition<nbsp><reference|def:polynomial_growth>, such as
    <math|f<around|(|t|)>=t<rsup|n>> for any <math|n\<in\>\<bbb-N\>> Such
    functions belong to <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
    but not to <math|L<rsup|2><around|(|\<bbb-R\>|)>=<around|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|\<bbb-R\>><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>|}>>
    globally The distinction is relevant because sample paths of stationary
    processes typically have finite local energy but may accumulate unbounded
    energy over <math|\<bbb-R\>>
  </remark>

  <\theorem>
    <label|thm:paths_loc><with|font-series|bold|(Sample paths in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>)> Let
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      <label|eq:finite_variance>\<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    Then almost every sample path lies in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
  </theorem>

  <\proof>
    Fix an arbitrary bounded interval <math|<around|[|a,b|]>\<subset\>\<bbb-R\>>
    with <math|a\<less\>b> Define the random variable
    <math|Y<rsub|<around|[|a,b|]>>:\<Omega\>\<to\><around|[|0,\<infty\>|]>>
    by

    <\equation>
      <label|eq:Yab>Y<rsub|<around|[|a,b|]>><around|(|\<omega\>|)>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t,\<omega\>|)><rsup|2>*<space|0.17em>d*t
    </equation>

    By Fubini's theorem,

    <\equation>
      <label|eq:EY>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*<space|0.17em>d*t=<around|(|b-a|)>*\<sigma\><rsup|2>\<less\>\<infty\>
    </equation>

    so <math|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>> almost surely
    Covering any compact <math|K\<subset\>\<bbb-R\>> by countably many dyadic
    intervals yields that almost surely

    <\equation>
      <label|eq:path_L2loc><big|int><rsub|K>X<around|(|t,\<omega\>|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>
    </equation>

    for all compact <math|K\<subset\>\<bbb-R\>>
  </proof>

  <\thebibliography|1>
    <bibitem-with-key|1|stationaryAndRelatedStochasticProcesses>Harald Cramér
    and M.R.<nbsp>Leadbetter. <with|font-shape|italic|Stationary and Related
    Processes: Sample Function Properties and Their Applications>. Wiley
    Series in Probability and Mathematical Statistics. 1967.

    <bibitem-with-key|2|rudinRealComplexAnalysis>Walter Rudin.
    <with|font-shape|italic|Real and Complex Analysis>. McGraw-Hill, 3rd
    edition, 1987.
  </thebibliography>
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
    <associate|asm:real|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-2|<tuple|1.1|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-3|<tuple|1.2|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-4|<tuple|1.3|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-5|<tuple|1.4|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-6|<tuple|1.4.1|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|auto-7|<tuple|20|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|bib-rudinRealComplexAnalysis|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:L2_space|<tuple|4|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:L2loc|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:absolute_continuity|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:complex_orthogonal_measure|<tuple|5|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:cramer|<tuple|8|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:gaussian_process|<tuple|7|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:polynomial_growth|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|def:probability_space|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:2|<tuple|7|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:3|<tuple|8|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:EY|<tuple|19|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:L2_inner|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:L2_norm|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:L2loc|<tuple|15|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:R|<tuple|10|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:RN|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:Yab|<tuple|18|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:ac_spectral|<tuple|5|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:conj|<tuple|9|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:covariance_kernel|<tuple|12|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:cramer_representation|<tuple|13|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:even|<tuple|11|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:finite_variance|<tuple|17|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:orth_rm|<tuple|4|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:path_L2loc|<tuple|20|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:poly_growth|<tuple|16|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:spectral_rep|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|eq:stationary_covariance|<tuple|14|2|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|rem:L2loc_properties|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|thm:paths_loc|<tuple|12|3|../.TeXmacs/texts/scratch/no_name_37.tm>>
    <associate|thm:radon_nikodym|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_37.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      rudinRealComplexAnalysis

      stationaryAndRelatedStochasticProcesses

      stationaryAndRelatedStochasticProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Measure-theoretic
      preliminaries <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Spectral representation of
      real-valued processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Gaussian processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.4.1<space|2spc>Sample path realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>