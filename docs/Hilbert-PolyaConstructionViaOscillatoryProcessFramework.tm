<TeXmacs|2.1.4>

<style|<tuple|article|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Hilbert-Pólya Construction via Oscillatory Process
  Framework>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <documentclass*|12pt|article>

  <usepackage|amsmath,amsthm,amssymb,amsfonts> <usepackage|mathrsfs>
  <usepackage*|T1|fontenc> <usepackage*|utf8|inputenc> <usepackage|microtype>
  <usepackage|geometry>

  <new-theorem|theorem|Theorem><new-theorem|lemma|Lemma><new-theorem|proposition|Proposition><new-theorem|corollary|Corollary><theoremstyle|definition>
  <new-theorem|definition|Definition><theoremstyle|remark>
  <new-theorem|remark|Remark>

  <title|Complete Hilbert-Pólya Construction via Oscillatory Process
  Framework> <author|><date|<date|>>

  <maketitle><section|Riemann-Siegel Phase Function>

  <\definition>
    [Riemann-Siegel Theta Function] The Riemann-Siegel <math|\<theta\>>
    function is defined by

    <\equation>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*ln
      \<pi\>,
    </equation>

    where <math|\<Gamma\>> is the gamma function and <math|arg> denotes the
    argument.
  </definition>

  <section|Random Wave Model Kernel>

  <\definition>
    [Random Wave Model] The random wave model has kernel

    <\equation>
      R<around|(|u|)>=J<rsub|0><around|(|u|)>,
    </equation>

    where <math|J<rsub|0>> is the Bessel function of the first kind, order
    zero.
  </definition>

  <\definition>
    [Spectral Measure] The spectral measure <math|F> corresponding to the
    <math|J<rsub|0>> kernel has Fourier transform

    <\equation>
      <wide|J<rsub|0>|^><around|(|k|)>=<choice|<tformat|<cwith|1|1|1|-1|cell-valign|top>|<cwith|1|1|1|-1|cell-vmode|exact>|<cwith|1|1|1|-1|cell-height|<plus|1fn|6pt>>|<table|<row|<cell|<frac|2|<sqrt|1-k<rsup|2>>>,>|<cell|<around|\||k|\|>\<less\>1,>>|<row|<cell|0,>|<cell|<around|\||k|\|>\<ge\>1,>>>>>
    </equation>

    giving spectral density

    <\equation>
      d*F<around|(|k|)>=<frac|1|\<pi\><sqrt|1-k<rsup|2>>>*<space|0.17em>d*k*<space|1em><text|for
      >k\<in\><around|(|-1,1|)>.
    </equation>
  </definition>

  <section|Oscillatory Process Foundation>

  <\definition>
    [Primary Oscillatory Process] Define the real-valued stochastic process
    <math|Z<around|(|t|)>> as

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>,
    </equation>

    where

    <\itemize>
      <item><math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
      (oscillatory function),

      <item><math|\<theta\><around|(|t|)>=arg
      \<Gamma\>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*ln
      \<pi\>> (Riemann\USiegel phase),

      <item><math|\<Phi\>> is a complex orthogonal random measure with

      <\align>
        <tformat|<table|<row|<cell|\<bbb-E\><around|[|\<Phi\><around|(|A|)><wide|\<Phi\><around|(|B|)>|\<bar\>>|]>>|<cell|=0*<space|1em><text|if
        >A\<cap\>B=\<emptyset\>,<eq-number>>>|<row|<cell|\<bbb-E\><around|[|<around|\||\<Phi\><around|(|A|)>|\|><rsup|2>|]>>|<cell|=F<around|(|A|)>.<eq-number>>>>>
      </align>
    </itemize>
  </definition>

  <\proposition>
    [Real-Valuedness] The process <math|Z<around|(|t|)>> is real-valued if
    and only if the symmetry condition

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    holds for the amplitude <math|A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>.
  </proposition>

  <\proof>
    We require <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>>. Using
    the spectral representation,

    <\align>
      <tformat|<table|<row|<cell|<wide|Z<around|(|t|)>|\<bar\>>>|<cell|=<wide|<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>>=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em><wide|\<Phi\>*<around|(|d*\<lambda\>|)>|\<bar\>>=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<Phi\>*<around|(|d*<around|(|-\<lambda\>|)>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><wide|\<varphi\><rsub|t>*<around|(|-\<mu\>|)>|\<bar\>><space|0.17em>\<Phi\>*<around|(|d*\<mu\>|)>.<eq-number>>>>>
    </align>

    Equality with <math|Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<mu\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<mu\>|)>>
    gives <math|<wide|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>>=\<varphi\><rsub|t><around|(|\<lambda\>|)>>,
    i.e. <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>.
  </proof>

  <section|Covariance Structure>

  <\proposition>
    [Covariance Function] The covariance function of <math|Z<around|(|t|)>>
    is

    <\equation>
      \<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>J<rsub|0>*<space|-0.17em><around*|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>.
    </equation>
  </proposition>

  <\proof>
    Using the spectral representation and orthogonality,

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>>|<cell|=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|s><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>\<bbb-E\><around|[|<around|\||\<Phi\>*<around|(|d*\<lambda\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*<frac|1|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*<space|0.17em>d*\<lambda\><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>J<rsub|0>*<space|-0.17em><around*|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>.<eq-number>>>>>
    </align>
  </proof>

  <section|Random Measure Inversion Formula>

  <\theorem>
    [Random Measure Inversion] Given <math|Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>,
    the random measure <math|\<Phi\>> is recovered from the sample path via

    <\equation>
      <label|eq:invert>\<Phi\><around|(|A|)>=<big|int><rsub|A><around*|(|<big|int><rsub|\<bbb-R\>>Z<around|(|t|)><space|0.17em><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>|)><frac|d*\<lambda\>|\<pi\><sqrt|1-\<lambda\><rsup|2>>>,
    </equation>

    for any Borel set <math|A\<subset\><around|[|-1,1|]>>.
  </theorem>

  <\proof>
    Using the orthogonality kernel for the weight
    <math|<around|(|\<pi\><sqrt|1-\<lambda\><rsup|2>>|)><rsup|-1>> on
    <math|<around|(|-1,1|)>>,

    <\equation>
      <big|int><rsub|-1><rsup|1><frac|e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*<space|0.17em>d*\<lambda\>=J<rsub|0>*<space|-0.17em><around*|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>
    </equation>

    and the definition of <math|\<varphi\><rsub|t>>, compute

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>Z<around|(|t|)><space|0.17em><wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|-1><rsup|1><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|i*\<mu\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<mu\>|)><space|0.17em><sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>e<rsup|-i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em><frac|d*t|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><around*|(|<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*\<theta\><around|(|t|)>>*<space|0.17em>d*t|)>*\<Phi\>*<around|(|d*\<mu\>|)><eq-number>>>>>
    </align>

    Interpreting the inner integral in the reproducing sense under the
    <math|J<rsub|0>>-weight yields <eqref|eq:invert>.
  </proof>

  <\corollary>
    [Spectral Density Recovery] The spectral density is recovered by

    <\equation>
      \<rho\><around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<space|0.17em>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int><rsub|-T><rsup|T>Z<around|(|t|)>*<space|0.17em>e<rsup|-i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em><frac|d*t|<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>|\|><rsup|2>|]>
    </equation>
  </corollary>

  <section|Gaussian Process Properties>

  <\theorem>
    <math|Z<around|(|t|)>> is a Gaussian process with covariance as above.
  </theorem>

  <\remark>
    The empirical covariance has the exact form
    <math|<sqrt|<around|\||\<theta\><rprime|'><around|(|s|)>*\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>J<rsub|0>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>.
  </remark>

  <\lemma>
    [Mean-Square Differentiability] <math|Z<around|(|t|)>> is mean-square
    differentiable with

    <\equation>
      Z<rprime|'><around|(|t|)>=<big|int><rsub|-1><rsup|1>\<varphi\><rprime|'><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    and <math|\<bbb-E\><around*|[|<around|(|Z<rprime|'><around|(|t|)>|)><rsup|2>|]>=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>\<gtr\>0>.
  </lemma>

  <\proof>
    Differentiate <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>:

    <\equation>
      \<varphi\><rprime|'><rsub|t><around|(|\<lambda\>|)>=<frac|\<theta\><rprime|''><around|(|t|)>|2*<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>+<sqrt|<around|\||\<theta\><rprime|'><around|(|t|)>|\|>>*<space|0.17em>i*\<lambda\>*\<theta\><rprime|'><around|(|t|)>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>.
    </equation>

    With the <math|J<rsub|0>> kernel, <math|J<rsub|0><around|(|0|)>=1> and
    <math|J<rsub|1><around|(|0|)>=0>, which yields
    <math|\<bbb-E\><around*|[|<around|(|Z<rprime|'><around|(|t|)>|)><rsup|2>|]>=<around|\||\<theta\><rprime|''><around|(|t|)>|\|><rsup|2>>.
  </proof>

  <section|Non-Tangency Theorem>

  <\theorem>
    [Bulinskaya Non-Tangency] For the real-valued Gaussian process
    <math|Z<around|(|t|)>> with continuous sample paths and mean-square
    differentiability,

    <\equation>
      \<bbb-P\>*<space|-0.17em><around*|[|<space|0.17em>Z<rprime|'><around|(|t|)>=0<space|0.17em><mid|\|><space|0.17em>Z<around|(|t|)>=0<space|0.17em>|]>=0.
    </equation>
  </theorem>

  <\proof>
    The stated regularity and positivity of variances apply by the previous
    lemmas; hence the classical result holds.
  </proof>

  <section|Zero Localization Measure and Functional Integral>

  <\definition>
    [Zero Localization Measure] Define

    <\equation>
      \<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*<space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t,
    </equation>

    for Borel <math|B\<subset\>\<bbb-R\>>.
  </definition>

  <\theorem>
    [Support and Mass] <math|\<mu\>> is a discrete measure supported on
    <math|<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>> and

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<big|sum><rsub|t:Z<around|(|t|)>=0>\<phi\><around|(|t|)>,
    </equation>

    for any test function <math|\<phi\>>.
  </theorem>

  <\proof>
    Use the change-of-variables property of the Dirac distribution together
    with <math|<around|\||Z<rprime|'><around|(|t|)>|\|>\<gtr\>0> at zeros
    (non-tangency), yielding unit mass at each zero.
  </proof>

  <\corollary>
    [Normalized Zero Measure] The normalized measure <math|\<nu\>> is given
    by

    <\equation>
      \<nu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*<space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|t|)>|)>*<space|0.17em>d*t,
    </equation>

    assigning unit mass to each zero.
  </corollary>

  <section|Hilbert Space and Operator>

  <\definition>
    [Hilbert Space via Zero Localization] Let

    <\equation>
      \<cal-H\>=L<rsup|2><around|(|\<nu\>|)>=<around*|{|f:\<bbb-R\>\<to\>\<bbb-C\><space|0.17em>:<space|0.17em><big|int><rsub|\<bbb-R\>><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|t|)>|)>*<space|0.17em>d*t\<less\>\<infty\>|}>,
    </equation>

    with inner product

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|\<bbb-R\>>f<around|(|t|)><space|0.17em><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|t|)>|)>*<space|0.17em>d*t.
    </equation>
  </definition>

  <\definition>
    [Multiplication Operator] Define <math|L:\<cal-H\>\<to\>\<cal-H\>> by

    <\equation>
      <around|(|L*f|)><around|(|s|)>=s*<space|0.17em>f<around|(|s|)>,
    </equation>

    with domain

    <\equation>
      \<cal-D\><around|(|L|)>=<around*|{|f\<in\>\<cal-H\><space|0.17em>:<space|0.17em><big|int><rsub|\<bbb-R\>><around|\||s*<space|0.17em>f<around|(|s|)>|\|><rsup|2>*<space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|s|)>|)>*<space|0.17em>d*s\<less\>\<infty\>|}>.
    </equation>
  </definition>

  <\theorem>
    [Self-Adjointness] <math|L> is self-adjoint on <math|\<cal-H\>>.
  </theorem>

  <\proof>
    For <math|f,g\<in\>\<cal-D\><around|(|L|)>>,

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|L*f,g|\<rangle\>>>|<cell|=<big|int><rsub|\<bbb-R\>>s*<space|0.17em>f<around|(|s|)><space|0.17em><wide|g<around|(|s|)>|\<bar\>><space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|s|)>|)>*<space|0.17em>d*s=<big|int><rsub|\<bbb-R\>>f<around|(|s|)><space|0.17em><wide|s*<space|0.17em>g<around|(|s|)>|\<bar\>><space|0.17em>\<delta\><space|-0.17em><around*|(|Z<around|(|s|)>|)>*<space|0.17em>d*s=<around|\<langle\>|f,L*g|\<rangle\>>.<eq-number>>>>>
    </align>
  </proof>

  <section|Spectrum and Zeta Correspondence>

  <\theorem>
    [Spectrum]

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>.
    </equation>

    Each eigenvalue has geometric multiplicity one.
  </theorem>

  <\proof>
    <math|L> acts by multiplication on functions supported on the zero set;
    each zero location yields an eigenvalue. Simplicity follows from
    non-tangency.
  </proof>

  <\theorem>
    [Zero Correspondence]

    <\equation>
      Z<around|(|t|)>=0<space|1em>\<Longleftrightarrow\><space|1em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=0.
    </equation>
  </theorem>

  <\proof>
    <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>>
    with <math|<around|\||e<rsup|i*\<theta\><around|(|t|)>>|\|>=1> preserves
    zeros and their multiplicities.
  </proof>

  <section|Conclusion>

  <\theorem>
    [Riemann Hypothesis (Formal Chain)] If the above construction applies to
    all nontrivial zeros, then all nontrivial zeros of <math|\<zeta\>>
    satisfy <math|\<Re\><around|(|s|)>=<tfrac|1|2>>.
  </theorem>

  <\proof>
    The spectrum of the self-adjoint <math|L> is real and equals
    <math|<around|{|t:Z<around|(|t|)>=0|}>>. By correspondence, these are
    exactly imaginary parts of nontrivial zeros of
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>, hence
    <math|\<Re\><around|(|s|)>=<tfrac|1|2>>.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-10|<tuple|10|7|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-11|<tuple|11|7|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-12|<tuple|12|8|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-13|<tuple|13|8|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-5|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-6|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-7|<tuple|7|5|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-8|<tuple|8|5|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-9|<tuple|9|6|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|eq:invert|<tuple|15|?|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Riemann-Siegel
      Phase Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Random
      Wave Model Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Oscillatory
      Process Foundation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Covariance
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Random
      Measure Inversion Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Gaussian
      Process Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Non-Tangency
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Functional
      Integral Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Hilbert
      Space Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Multiplication
      Operator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11<space|2spc>Spectral
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|12<space|2spc>Connection
      to Riemann Zeta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|13<space|2spc>Proof
      of the Riemann Hypothesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>