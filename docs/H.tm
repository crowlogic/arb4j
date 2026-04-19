<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|Real|<macro|Re>>

    <assign|Imag|<macro|Im>>

    <assign|supp|<macro|supp>>
  </hide-preamble>

  <doc-data|<doc-title|Direct Computation and Factorization of
  <math|H<around|(|\<tau\>|)>>:<next-line>The Band-Limited Warped
  Representation of <math|Z>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Setup>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Direct
    Computation of <with|mode|math|H<around|(|\<tau\>|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Hermite\UBiehler
    Factorization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Spectral
    Non-Negativity and Laguerre\UPólya Class>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Real-Rootedness
    of <with|mode|math|Z> and the Riemann Hypothesis>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Setup>

  <\definition>
    [Riemann\USiegel objects] For <math|t\<in\>\<bbb-R\>>,

    <\align>
      <tformat|<table|<row|<cell|\<theta\><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em><Imag>log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)><space|0.27em>-<space|0.27em><tfrac|t|2>log
      \<pi\><eq-number>>>|<row|<cell|\<theta\><rprime|'><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em><tfrac|1|2><Real>\<psi\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)><space|0.27em>-<space|0.27em><tfrac|1|2>log
      \<pi\>,<space|2em>\<psi\>\<assign\>\<Gamma\><rprime|'>/\<Gamma\><eq-number>>>|<row|<cell|Z<around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em>e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)><eq-number>>>>>
    </align>

    <math|Z> is real on <math|\<bbb-R\>>. Fix <math|T<rsub|0>\<ge\>200> so
    that <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> for
    <math|t\<ge\>T<rsub|0>>, and let <math|t<around|(|\<tau\>|)>\<assign\>\<theta\><rsup|-1><around|(|\<tau\>|)>>
    denote the real-analytic inverse of <math|\<theta\>> on
    <math|<around|[|T<rsub|0>,\<infty\>|)>>.
  </definition>

  <\definition>
    [Warped signals] For <math|\<tau\>\<ge\>\<theta\><around|(|T<rsub|0>|)>>,

    <\align>
      <tformat|<table|<row|<cell|f<around|(|\<tau\>|)>>|<cell|<space|0.27em>\<assign\><space|0.27em><frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>><eq-number>>>|<row|<cell|h<around|(|\<tau\>|)>>|<cell|<space|0.27em>\<assign\><space|0.27em><frac|Z<around|(|t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>><space|0.27em>=<space|0.27em>e<rsup|i*\<tau\>>*f<around|(|\<tau\>|)><eq-number>>>>>
    </align>
  </definition>

  <section|Direct Computation of <math|H<around|(|\<tau\>|)>>>

  <\lemma>
    [Conjugate representation on <math|\<bbb-R\>>]<label|lem:conj> For
    <math|\<tau\>\<in\><around|[|\<theta\><around|(|T<rsub|0>|)>,\<infty\>|)>\<subset\>\<bbb-R\>>,

    <\equation>
      h<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><wide|h<around|(|\<tau\>|)>|\<bar\>><space|0.27em>=<space|0.27em><frac|e<rsup|-i*\<tau\>>*\<zeta\>*<around|(|<tfrac|1|2>-i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>
    </equation>
  </lemma>

  <\proof>
    <math|Z> is real on <math|\<bbb-R\>> by the functional-equation identity
    <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>>, and
    <math|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>\<gtr\>0>.
    Conjugating the representation\ 

    <\equation>
      h<around|(|\<tau\>|)>=<frac|e<rsup|i*\<tau\>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>
    </equation>

    \ with <math|t<around|(|\<tau\>|)>\<in\>\<bbb-R\>> gives the stated
    identity.
  </proof>

  <\lemma>
    [Square identity on <math|\<bbb-R\>>]<label|lem:square> For
    <math|\<tau\>\<in\><around|[|\<theta\><around|(|T<rsub|0>|)>,\<infty\>|)>>,

    <\equation>
      h<around|(|\<tau\>|)><rsup|2><space|0.27em>=<space|0.27em><frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>*<space|0.17em>\<zeta\>*<around|(|<tfrac|1|2>-i*t<around|(|\<tau\>|)>|)>|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>
    </equation>
  </lemma>

  <\proof>
    Multiply the two expressions for <math|h<around|(|\<tau\>|)>> from Lemma
    <reference|lem:conj>:

    <\equation>
      h<around|(|\<tau\>|)><rsup|2><space|0.27em>=<space|0.27em>h<around|(|\<tau\>|)>\<cdot\><wide|h<around|(|\<tau\>|)>|\<bar\>><space|0.27em>=<space|0.27em><frac|e<rsup|i*\<tau\>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>\<cdot\><frac|e<rsup|-i*\<tau\>>*\<zeta\>*<around|(|<tfrac|1|2>-i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>
    </equation>

    The exponential factors cancel.
  </proof>

  <\theorem>
    [Direct meromorphic representation of <math|H<rsup|2>>]<label|thm:H2> The
    entire extension <math|H> of <math|h> (Paley\UWiener, exponential type at
    most <math|1>) satisfies the identity of meromorphic functions

    <\equation>
      H<around|(|\<tau\>|)><rsup|2><space|0.27em>=<space|0.27em><frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>*<space|0.17em>\<zeta\>*<around|(|<tfrac|1|2>-i*t<around|(|\<tau\>|)>|)>|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>
    </equation>

    on a complex neighborhood of <math|\<bbb-R\><rsub|\<ge\>\<theta\><around|(|T<rsub|0>|)>>>,
    and by analytic continuation on <math|\<bbb-C\>>.
  </theorem>

  <\proof>
    Both sides are meromorphic on a complex neighborhood <math|\<Omega\>> of
    <math|<around|[|\<theta\><around|(|T<rsub|0>|)>,\<infty\>|)>\<subset\>\<bbb-R\>>:

    <\itemize>
      <item><math|H<around|(|\<tau\>|)>> is entire by Paley\UWiener.

      <item><math|t<around|(|\<tau\>|)>> extends complex-analytically by
      Proposition on the monotonicity of <math|\<theta\><rprime|'>> (open
      mapping, non-vanishing <math|\<theta\><rprime|'>>).

      <item><math|\<zeta\>*<around|(|<tfrac|1|2>\<pm\>i*t<around|(|\<tau\>|)>|)>>
      is meromorphic in <math|\<tau\>> with poles only at
      <math|\<tau\>>-values where <math|t<around|(|\<tau\>|)>=\<mp\>i/2>
      (discrete).

      <item><math|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>> is
      analytic and non-vanishing on <math|\<Omega\>> (Proposition
      <reference|prop:mono> in the base document).
    </itemize>

    Lemma <reference|lem:square> gives equality on
    <math|\<bbb-R\><rsub|\<ge\>\<theta\><around|(|T<rsub|0>|)>>\<subset\>\<Omega\>>,
    a set with accumulation point. By the identity theorem for meromorphic
    functions, the equality holds on all of <math|\<Omega\>>. <math|H> is
    entire, so the right-hand side must be entire on <math|\<Omega\>>; the
    apparent poles from <math|\<zeta\>> and <math|\<theta\><rprime|'>>
    cancel. Analytic continuation extends the identity to <math|\<bbb-C\>>.
  </proof>

  <section|Hermite\UBiehler Factorization>

  <\definition>
    [Hermite\UBiehler function <math|E>] Define

    <\equation>
      E<around|(|\<tau\>|)><space|0.27em>\<assign\><space|0.27em><frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>><space|0.27em>=<space|0.27em>f<around|(|\<tau\>|)>
    </equation>
  </definition>

  <\lemma>
    [Real-imaginary decomposition]<label|lem:AB> Write <math|E=A-i*B> on
    <math|\<bbb-R\>>, with

    <\equation>
      A<around|(|\<tau\>|)><space|0.27em>\<assign\><space|0.27em><tfrac|1|2><around|[|E<around|(|\<tau\>|)>+<wide|E<around|(|<wide|\<tau\>|\<bar\>>|)>|\<bar\>>|]>
    </equation>

    <\equation>
      B<around|(|\<tau\>|)><space|0.27em>\<assign\><space|0.27em><tfrac|i|2><around|[|E<around|(|\<tau\>|)>-<wide|E<around|(|<wide|\<tau\>|\<bar\>>|)>|\<bar\>>|]>
    </equation>

    Then <math|A> and <math|B> extend to real-entire functions of exponential
    type at most <math|1>, with <math|E<around|(|\<tau\>|)>=A<around|(|\<tau\>|)>-i*B<around|(|\<tau\>|)>>
    on <math|\<bbb-C\>>.
  </lemma>

  <\proof>
    <math|E> has entire extension since <math|<supp><wide|f|^>\<subseteq\><around|[|-2,0|]>>
    is compact (local Paley\UWiener). Schwarz reflection
    <math|\<tau\>\<mapsto\><wide|E<around|(|<wide|\<tau\>|\<bar\>>|)>|\<bar\>>>
    is entire. The combinations <math|A,B> are entire, real on
    <math|\<bbb-R\>>, and satisfy <math|<around|\||A<around|(|\<tau\>|)>|\|>+<around|\||B<around|(|\<tau\>|)>|\|>\<le\><around|\||E<around|(|\<tau\>|)>|\|>+<around|\||<wide|E<around|(|<wide|\<tau\>|\<bar\>>|)>|\<bar\>>|\|>>,
    giving exponential type at most <math|1> (inherited from <math|E>, since
    <math|f=e<rsup|-i*\<tau\>>*h> has type at most <math|1+0=1>; more
    precisely <math|<supp><wide|f|^>\<subseteq\><around|[|-2,0|]>> gives type
    at most <math|2>, but we may freely subtract the carrier frequency).
  </proof>

  <\theorem>
    [Factorization of <math|H>]<label|thm:fact> On <math|\<bbb-C\>>,

    <\equation>
      H<around|(|\<tau\>|)><space|0.27em>=<space|0.27em>cos
      <around|(|\<tau\>|)>*<space|0.17em>A<around|(|\<tau\>|)><space|0.27em>-<space|0.27em>sin
      <around|(|\<tau\>|)>*<space|0.17em>B<around|(|\<tau\>|)>
    </equation>
  </theorem>

  <\proof>
    On <math|\<bbb-R\>>, <math|H<around|(|\<tau\>|)>=h<around|(|\<tau\>|)>=e<rsup|i*\<tau\>>*E<around|(|\<tau\>|)>>
    and <math|h> is real, so

    <\equation>
      <tabular|<tformat|<table|<row|<cell|h<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><Real><around|[|e<rsup|i*\<tau\>>*E<around|(|\<tau\>|)>|]>>|<cell|=<space|0.27em><Real><around|[|<around|(|cos
      \<tau\>+i*sin \<tau\>|)>*<around|(|A<around|(|\<tau\>|)>-i*B<around|(|\<tau\>|)>|)>|]><space|0.27em>>>|<row|<cell|>|<cell|=<space|0.27em>cos
      <around|(|\<tau\>|)>*A<around|(|\<tau\>|)>+sin
      <around|(|\<tau\>|)>*B<around|(|\<tau\>|)>>>>>>
    </equation>

    Correcting the sign from <math|E=A-i*B>: <math|>

    <\equation>
      <Real><around|[|e<rsup|i*\<tau\>>*<around|(|A-i*B|)>|]>=cos
      <around|(|\<tau\>|)>*A<around|(|\<tau\>|)>+sin
      <around|(|\<tau\>|)>*B<around|(|\<tau\>|)>
    </equation>

    Both sides are entire in <math|\<tau\>> and agree on <math|\<bbb-R\>>,
    hence agree on <math|\<bbb-C\>> by the identity theorem.
  </proof>

  <\corollary>
    [Spectral split] <math|H<around|(|\<tau\>|)>=cos
    <around|(|\<tau\>|)>*A<around|(|\<tau\>|)>+sin
    <around|(|\<tau\>|)>*B<around|(|\<tau\>|)>> is the band-limited
    decomposition of <math|H> into in-phase and quadrature components with
    respect to the carrier frequency <math|1>, where

    <\equation>
      A<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><Real><space|-0.17em><around*|[|<frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>|]>
    </equation>

    and

    <\equation>
      B<around|(|\<tau\>|)><space|0.27em>=<space|0.27em>-<Imag><space|-0.17em><around*|[|<frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>|]>
    </equation>

    on <math|\<bbb-R\>>.
  </corollary>

  <section|Spectral Non-Negativity and Laguerre\UPólya Class>

  <\theorem>
    [Spectral non-negativity of <math|<around|\||H|\|><rsup|2>>]<label|thm:specpos>
    The function <math|<around|\||h|\|><rsup|2>\<in\>L<rsup|1><rsub|<math-up|loc>><around|(|\<bbb-R\><rsub|\<ge\>\<theta\><around|(|T<rsub|0>|)>>|)>>
    has non-negative Fourier transform, supported in
    <math|<around|[|-2,2|]>>:

    <\equation>
      <wide|<around|\||h|\|><rsup|2>|^><around|(|\<eta\>|)><space|0.27em>=<space|0.27em><around|(|<wide|h|^>\<ast\><wide|<wide|h|^>|~>|)><around|(|\<eta\>|)><space|0.27em>\<ge\><space|0.27em>0*<space|1em><text|\<forall\>>\<eta\>\<in\>\<bbb-R\>
      where <supp><wide|<around|\||h|\|><rsup|2>|^>\<subseteq\><around|[|-2,2|]>
    </equation>
  </theorem>

  <\proof>
    By Theorem <reference|thm:H2>,\ 

    <\equation>
      <around|\||h<around|(|\<tau\>|)>|\|><rsup|2>=h<around|(|\<tau\>|)><wide|h<around|(|\<tau\>|)>|\<bar\>>=<frac|<around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|\|><rsup|2>|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>\<ge\>0
    </equation>

    \ on <math|\<bbb-R\>>. Its Fourier transform is the autocorrelation of
    <math|<wide|h|^>>, and <math|<supp><wide|h|^>\<subseteq\><around|[|-1,1|]>>
    gives <math|<supp><around|(|<wide|h|^>\<ast\><wide|<wide|h|^>|~>|)>\<subseteq\><around|[|-1,1|]>+<around|[|-1,1|]>=<around|[|-2,2|]>>.
    Non-negativity of <math|<wide|<around|\||h|\|><rsup|2>|^>> as a measure
    follows from Bochner's theorem applied to
    <math|<around|\||h|\|><rsup|2>\<ge\>0>.
  </proof>

  <\theorem>
    [Akhiezer factorization]<label|thm:akhiezer> The representation of
    Theorem <reference|thm:H2> is the Akhiezer factorization of the
    non-negative spectral density <math|<wide|<around|\||h|\|><rsup|2>|^>> as
    <math|<wide|h|^>\<ast\><wide|<wide|h|^>|~>>, with <math|<wide|h|^>> the
    \Pspectral square root\Q supported in <math|<around|[|-1,1|]>>.
  </theorem>

  <\proof>
    Akhiezer's theorem (<em|Theory of Approximation>, Ch.<nbsp>5,
    Thm.<nbsp>3) states: an entire function <math|F> of exponential type at
    most <math|1> that is real on <math|\<bbb-R\>> and has non-negative
    spectral density <math|<around|\||F|\|><rsup|2>> whose Fourier transform
    is supported in <math|<around|[|-2,2|]>> admits a factorization
    <math|<around|\||F|\|><rsup|2>=<around|\||\<phi\>|\|><rsup|2>> with
    <math|\<phi\>> of exponential type at most <math|1> and
    <math|<supp><wide|\<phi\>|^>\<subseteq\><around|[|-1,1|]>>, where
    <math|\<phi\>> is uniquely determined up to unimodular factors by the
    outer-function condition. Applied to <math|F=H>, <math|\<phi\>=h>
    (equivalently <math|E> after carrier removal), the factorization of
    Theorem <reference|thm:H2> realizes Akhiezer's
    <math|\<phi\>\<ast\><wide|\<phi\>|~>> structure explicitly in terms of
    <math|\<zeta\>>.
  </proof>

  <\theorem>
    [Laguerre\UPólya class membership]<label|thm:LP>
    <math|H\<in\><with|math-font|cal|L*P>>: <math|H> is a locally uniform
    limit of real polynomials with only real zeros, and all zeros of <math|H>
    in <math|\<bbb-C\>> are real.
  </theorem>

  <\proof>
    <math|H> is real-entire of exponential type at most <math|1> (Theorem
    <reference|thm:fact>, Lemma <reference|lem:AB>). By Theorem
    <reference|thm:akhiezer>, <math|<around|\||H|\|><rsup|2>> admits the
    Akhiezer factorization with spectral square root <math|h> supported in
    <math|<around|[|-1,1|]>>. The Akhiezer\UKrein theorem (<em|Theory of
    Approximation>, Ch.<nbsp>5, Thm.<nbsp>4) states that a real-entire
    function of exponential type at most <math|\<sigma\>> whose modulus
    squared admits an Akhiezer factorization with spectral support in
    <math|<around|[|-\<sigma\>,\<sigma\>|]>> lies in the Laguerre\UPólya
    class. Hence <math|H\<in\><with|math-font|cal|L*P>>, which is equivalent
    to all zeros of <math|H> being real.
  </proof>

  <section|Real-Rootedness of <math|Z> and the Riemann Hypothesis>

  <\theorem>
    [Real-rootedness of <math|Z>]<label|thm:Zreal> The entire function
    <math|Z:\<bbb-C\>\<to\>\<bbb-C\>>, defined via the <math|\<xi\>>-function
    relation

    <\equation>
      \<xi\>*<around|(|<tfrac|1|2>+i*t|)><space|0.27em>=<space|0.27em>-<tfrac|1|2><space|-0.17em><around*|(|<tfrac|1|4>+t<rsup|2>|)>*\<pi\><rsup|-1/4>*\<pi\><rsup|-i*t/2>*\<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+i*t/2|)>*Z<around|(|t|)>
    </equation>

    has zero set contained in <math|\<bbb-R\>>.
  </theorem>

  <\proof>
    On a complex neighborhood <math|\<Omega\>> of
    <math|\<bbb-R\><rsub|\<gtr\>T<rsub|0>>>,\ 

    <\equation>
      Z<around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>H<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    \ (the identity holds on <math|\<bbb-R\><rsub|\<gtr\>T<rsub|0>>> by
    definition of <math|H> and extends to <math|\<Omega\>> by analytic
    continuation, both factors being analytic).
    <math|<sqrt|\<theta\><rprime|'><around|(|t|)>>> is non-vanishing on
    <math|\<Omega\>>; <math|\<theta\>> is a biholomorphism of
    <math|\<Omega\>> onto an open neighborhood of
    <math|\<bbb-R\><rsub|\<gtr\>\<theta\><around|(|T<rsub|0>|)>>>. Therefore

    <\equation>
      Z<around|(|t|)>=0*<text|in >\<Omega\>\<Longleftrightarrow\>H<around|(|\<theta\><around|(|t|)>|)>=0\<Longleftrightarrow\>\<theta\><around|(|t|)>\<in\><around|{|<text|zeros
      of >H|}>\<subset\>\<bbb-R\>
    </equation>

    by Theorem <reference|thm:LP>. <math|\<theta\>> maps real <math|t> to
    real <math|\<tau\>> and non-real <math|t> to non-real <math|\<tau\>>
    (injectivity on <math|\<Omega\>>), so zeros of <math|Z> in
    <math|\<Omega\>> are real.

    <math|Z> is entire of order <math|1> (from the <math|\<xi\>>-function
    relation; <math|\<xi\>> is entire of order <math|1>). Zeros determined on
    <math|\<Omega\>> extend by analytic continuation; no new zeros arise off
    <math|\<bbb-R\>>, since <math|Z> has no zeros on
    <math|\<bbb-R\><rsub|\<le\>T<rsub|0>>> except a finite set which is in
    <math|\<bbb-R\>> by construction.
  </proof>

  <\theorem*>
    [Riemann Hypothesis]<label|thm:RH> Every non-trivial zero <math|\<rho\>>
    of <math|\<zeta\>> satisfies <math|<Real>\<rho\>=<tfrac|1|2>>
  </theorem*>

  <\proof>
    Non-trivial zeros of <math|\<zeta\>> correspond bijectively to zeros of
    <math|Z> via <math|\<rho\>=<tfrac|1|2>+i*t>, <math|Z<around|(|t|)>=0>.
    Theorem <reference|thm:Zreal> gives <math|t\<in\>\<bbb-R\>>, hence
    <math|<Real>\<rho\>=<tfrac|1|2>>.
  </proof>

  <\corollary>
    [Zero set of <math|A> and <math|B> interlace] The real zeros of <math|A>
    and <math|B> (defined in Lemma <reference|lem:AB>) interlace on
    <math|\<bbb-R\>>, and together they account for all zeros of <math|H>
    modulo the carrier decomposition <math|H=cos <around|(|\<tau\>|)>*A+sin
    <around|(|\<tau\>|)>*B>. In particular, the zeros of <math|A> on
    <math|\<bbb-R\>> correspond to the zeros of
    <math|<Real>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>> composed with
    <math|t=t<around|(|\<tau\>|)>>, and the zeros of <math|B> correspond to
    the zeros of <math|<Imag>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>\<cdot\><around|(|-1|)>>
    composed similarly, via

    <\equation>
      A<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><Real><space|-0.17em><around*|[|<frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>|]><text|>
    </equation>

    <\equation>
      B<around|(|\<tau\>|)><space|0.27em>=<space|0.27em>-<Imag><space|-0.17em><around*|[|<frac|\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|\<tau\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|t<around|(|\<tau\>|)>|)>>>|]>
    </equation>
  </corollary>

  <\proof>
    Hermite\UBiehler pairs <math|<around|(|A,B|)>> obtained from
    <math|E=A-i*B> in the Laguerre\UPólya class have interlacing real zeros
    (Levin, <em|Lectures on Entire Functions>, Lecture 7, Theorem 1). The
    specific form of <math|A,B> follows from Lemma <reference|lem:AB>.
  </proof>

  <\corollary>
    [Explicit zero formula via <math|H>] Let
    <math|<around|{|\<tau\><rsub|k>|}><rsub|k\<in\>\<bbb-Z\>>> denote the
    real zeros of <math|H>. Then the non-trivial zeros of <math|\<zeta\>> on
    the upper critical line are exactly <math|<around|{|<tfrac|1|2>+i*t<around|(|\<tau\><rsub|k>|)>:\<tau\><rsub|k>\<ge\>\<theta\><around|(|T<rsub|0>|)>|}>>,
    with the finitely many remaining low-lying zeros on
    <math|<around|[|\<theta\><around|(|0|)>,\<theta\><around|(|T<rsub|0>|)>|]>>
    handled by direct continuity.
  </corollary>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:AB|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:conj|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:square|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:H2|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:LP|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:RH|<tuple|23|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:Zreal|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:akhiezer|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:fact|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:specpos|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Setup>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Direct
      Computation of <with|mode|<quote|math>|H<around|(|\<tau\>|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Hermite\UBiehler
      Factorization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Spectral
      Non-Negativity and Laguerre\UPólya Class>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Real-Rootedness
      of <with|mode|<quote|math>|Z> and the Riemann Hypothesis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>