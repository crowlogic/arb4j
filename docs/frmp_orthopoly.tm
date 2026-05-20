<TeXmacs|2.1.5>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <assign|C|<macro|\<bbb-C\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|Psimu|<macro|\<Psi\><rsub|\<mu\>>>>

    <assign|Imu|<macro|I<rsup|\<mu\>>>>

    <assign|Dmu|<macro|D<rsup|\<mu\>>>>
  </hide-preamble>

  <doc-data|<doc-title|Fox--Wright Orthogonal Polynomials and
  the<next-line>Fractional Riccati--Müntz--Padé Theorem:<next-line>A New
  Family in Non-Hermitian Approximation Theory>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|May 2026>>

  <abstract-data|<\abstract>
    We identify and characterize the orthogonal polynomial sequence
    canonically associated with the Fractional Riccati--Müntz--Padé theorem
    <cite|Crowley2026>. The polynomials arise as the denominators of the Padé
    approximants built from the Müntz--Tau moment sequence
    <math|<around|{|a<around|(|k,u|)>|}><rsub|k\<ge\>0>> of the fractional
    Riccati equation <math|D<rsup|\<mu\>>*y=P<around|(|u|)>+Q<around|(|u|)>*y+R<around|(|u|)>*y<rsup|2>>,
    and are orthogonal with respect to a quasi-definite moment functional
    whose weights are modulated by the Fox--Wright function
    <math|\<Psi\><rsub|\<mu\>><around|(|z|)>=<big|sum><rsub|k\<ge\>0>\<Gamma\>*<around|(|k*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>\<cdot\>z<rsup|k>>.

    We place these polynomials precisely within the hierarchy of known
    orthogonal families: they belong to the Nuttall--Stahl class of
    non-Hermitian orthogonal polynomials <cite|NuttallSingh1977|Stahl1985I|Stahl1985II>
    on the Stahl minimal-capacity compact <math|K<rsub|A><around|(|u|)>>,
    form a regular sequence in the sense of Stahl--Totik
    <cite|StahlTotik1992>, and in the <math|\<mu\>=1> special case reduce to
    Chebotarëv--Jacobi polynomials studied by Barhoumi--Yattselev
    <cite|BarhoumiYattselev2023>. For <math|\<mu\>\<in\><around|(|0,1|)>>
    they constitute a genuinely new subfamily -- <em|Fox--Wright
    non-Hermitian orthogonal polynomials> -- whose weight is a
    Fox--Wright-deformed Jacobi-type function on a transcendental arc system,
    and whose asymptotic recurrence coefficients are determined by the
    equilibrium measure of <math|K<rsub|A><around|(|u|)>> via the
    Gonchar--Rakhmanov <math|S>-property <cite|GoncharRakhmanov1987>. The
    Müntz--Szász density theorem <cite|MuntzSzasz1914|Moragues2018> provides
    the underlying qualitative completeness backdrop, while the
    Chebyshev--Wheeler algorithm <cite|Wheeler1974|Gragg1972> provides the
    constructive computational realization.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Moment Functional and its Fox\UWright Structure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>The Müntz\UTau Moments
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Gevrey-1 Growth and Formal vs.
    Analytic Structure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>The Hadamard Fixed-Point Equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Moment Functional and Its Quasi-Definiteness>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Classification:
    The Fox\UWright Non-Hermitian Orthogonal Polynomials>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>The Hierarchy of Orthogonal Polynomial
    Families <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|4.2<space|2spc>The Weight Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|4.3<space|2spc>The Fox\UWright Deformation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Asymptotic
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>The <with|color|dark
    red|font-family|rm|<with|mode|math|S>>-Property and Stahl's Compact
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|5.2<space|2spc>Zero Condensation: Nuttall\UStahl
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|5.3<space|2spc>Recurrence Coefficient Asymptotics
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|5.4<space|2spc>Convergence: Stahl's Theorem Applied
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>The
    <with|color|dark red|font-family|rm|<with|mode|math|\<mu\>=1>> Special
    Case: Chebotarëv\UJacobi Polynomials>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>The
    <with|color|dark red|font-family|rm|<with|mode|math|R=0>> Oracle:
    Mittag-Leffler Moments and Laguerre Structure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>The
    Müntz\USzász Backbone> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Computational
    Realization: The Chebyshev\UWheeler Algorithm>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Summary:
    Classification of the FW-NHOP Family>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Fractional Riccati\UMüntz\UPadé theorem <cite|Crowley2026> establishes
  that the unique solution of the fractional Riccati equation

  <\equation>
    <label|eq:fRic>D<rsup|\<mu\>>*y<around|(|t,u|)>=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>
  </equation>

  <\equation>
    I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0
  </equation>

  with polynomial coefficients <math|P,Q,R\<in\><C><around|[|u|]>>, order
  <math|\<mu\>\<in\><around|(|0,1|]>>, and Riemann\ULiouville calculus, is
  recovered in logarithmic capacity on the complement of Stahl's compact
  <math|K<rsub|A><around|(|u|)>> by the near-diagonal Müntz\UPadé
  approximants

  <\equation>
    <label|eq:yM>y<rsub|M><around|(|t,u|)>=t<rsup|\<mu\>>*<frac|N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>|D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>>
  </equation>

  Central to the proof is the identification of the Padé denominator sequence
  <math|<around|{|D<rsub|M>|}>> with the orthogonal polynomial sequence of
  the moment functional <math|\<cal-L\><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>,
  where <math|<around|{|a<around|(|k,u|)>|}>> are the Müntz\UTau coefficients
  satisfying an explicit Fox\UWright-weighted recurrence <cite|Crowley2026>.
  The present article characterizes this orthogonal polynomial sequence in
  depth: its algebraic structure, its place in the classification of
  orthogonal polynomial families, its asymptotic behavior, and its
  relationship to classical and modern results in non-Hermitian approximation
  theory.

  The main contribution is the identification of these polynomials as
  <em|Fox\UWright non-Hermitian orthogonal polynomials> (FW-NHOPs) \U a new
  subfamily of the Nuttall\UStahl class parametrized by
  <math|\<mu\>\<in\><around|(|0,1|)>> that interpolates between the classical
  algebraic (Chebotarëv\UJacobi) case at <math|\<mu\>=1> and a transcendental
  Fox\UWright-weighted limit as <math|\<mu\>\<to\>0<rsup|+>>. The
  Müntz\USzász condition <math|<big|sum>1/<around|(|k*\<mu\>|)>=\<infty\>>
  for all <math|\<mu\>\<in\><around|(|0,1|]>> guarantees the underlying
  density <cite|Moragues2018>, while the Chebyshev\UWheeler algorithm
  <cite|Wheeler1974> provides numerically stable computation of the
  recurrence coefficients.

  <section|The Moment Functional and its Fox\UWright Structure>

  <subsection|The Müntz\UTau Moments>

  The fractional Riccati equation <eqref|eq:fRic>, recast as the Volterra
  integral equation <math|y=I<rsup|\<mu\>>*<around|[|P+Q*y+R*y<rsup|2>|]>>
  via the Riemann\ULiouville composition formula <cite|SKM1993>, admits a
  unique formal power series solution in the Müntz basis
  <math|<around|{|t<rsup|<around|(|k+1|)>*\<mu\>>|}><rsub|k\<ge\>0>>
  <cite|Crowley2026>:

  <\equation>
    <label|eq:y_expansion>y<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>
  </equation>

  with <math|a<around|(|k,<space|0.17em>\<cdot\><space|0.17em>|)>\<in\><C><around|[|u|]>>
  satisfying the recurrence

  <\align>
    <tformat|<table|<row|<cell|a<around|(|0,u|)>>|<cell|=P<around|(|u|)>*<space|0.17em>\<psi\><rsub|0><eq-number><label|eq:a0>>>|<row|<cell|a<around|(|k,u|)>>|<cell|=\<psi\><rsub|k>*<space|-0.17em><around*|(|Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)>+R<around|(|u|)>*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>\<forall\>k\<ge\>1<eq-number><label|eq:ak>>>>>
  </align>

  where the Fox\UWright weights are

  <\equation>
    <label|eq:psi>\<psi\><rsub|k>\<assign\><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>
    \ \ \ \ \ \ \<forall\>k\<ge\>0
  </equation>

  The sequence <math|<around|{|\<psi\><rsub|k>|}>> is precisely the sequence
  of eigenvalues of the fractional integral <math|I<rsup|\<mu\>>> on the
  Müntz monomial basis: <math|I<rsup|\<mu\>>*t<rsup|<around|(|k+1|)>*\<mu\>>=\<psi\><rsub|k+1>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>>
  <cite|Crowley2026>. By Stirling's formula,
  <math|\<psi\><rsub|k>\<sim\><around|(|k*\<mu\>|)><rsup|-\<mu\>>> as
  <math|k\<to\>\<infty\>>, and <math|\<Psi\><rsub|\<mu\>><around|(|z|)>=<big|sum><rsub|k\<ge\>0>\<psi\><rsub|k>*z<rsup|k>>
  has radius of convergence exactly <math|1>.

  <subsection|Gevrey-1 Growth and Formal vs. Analytic Structure>

  The generating function <math|A<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
  lives in <math|<C><around|[|u|]><around|[|<around|[|z|]>|]>> as a formal
  power series. By an explicit induction on the recurrence <eqref|eq:ak>, the
  moments satisfy the Gevrey-1 bound <cite|Crowley2026>:

  <\equation>
    <label|eq:gevrey><around|\||a<around|(|k,u|)>|\|>\<le\>K<rsub|G><around|(|u|)>*<space|0.17em>C<rsub|G><around|(|u|)><rsup|k>*<space|0.17em>k!
  </equation>

  with computable constants <math|K<rsub|G>,C<rsub|G>> depending on
  <math|<around|\||P<around|(|u|)>|\|>>, <math|<around|\||Q<around|(|u|)>|\|>>,
  <math|<around|\||R<around|(|u|)>|\|>>, and
  <math|\<psi\><rsub|0>=1/\<Gamma\>*<around|(|\<mu\>+1|)>>. The factorial
  growth means the radius of convergence of <math|A> is zero for generic
  parameters \U <math|A> diverges everywhere except at the origin.

  This divergence is not a defect: it is the signature of the meromorphic
  nature of <math|A>. Via a Mellin\UBarnes integral representation
  <cite|Crowley2026>

  <\equation>
    <label|eq:MB>A<around|(|z,u|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>M<rsub|\<Psi\><rsub|\<mu\>>><around|(|s|)>*<space|0.17em><wide|B|^><rsub|R><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>*<space|0.17em>d*s
  </equation>

  where

  <\equation>
    M<rsub|\<Psi\><rsub|\<mu\>>><around|(|s|)>=\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>*\<Gamma\>*<around|(|1-s*\<mu\>|)>/\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>
  </equation>

  \ is the Mellin transform of <math|\<Psi\><rsub|\<mu\>>*<around|(|-x|)>>,
  the formal series <math|A> is promoted to a meromorphic function on the
  universal cover <math|<wide|X|~>> of <math|<C>\<setminus\><around|{|0|}>>
  minus a minimal-capacity compact <math|K<rsub|A><around|(|u|)>> \U Stahl's
  compact.

  <subsection|The Hadamard Fixed-Point Equation>

  Define\ 

  <\equation>
    B<around|[|A|]><around|(|z,u|)>\<assign\>P<around|(|u|)>+z*Q<around|(|u|)>*A<around|(|z,u|)>+z*R<around|(|u|)>*A<around|(|z,u|)><rsup|2>\<in\><C><around|[|u|]><around|[|<around|[|z|]>|]>
  </equation>

  Then the unique formal power series satisfying the Müntz\UTau recurrence is
  characterized by the Hadamard fixed-point equation <cite|Crowley2026>:

  <\equation>
    <label|eq:hadamard_fp>A<around|(|z,u|)>=\<Psi\><rsub|\<mu\>><around|(|z|)>\<odot\>B<around|[|A|]><around|(|z,u|)>,
  </equation>

  where <math|\<odot\>> denotes the Hadamard (coefficient-wise) product:
  <math|<around|[|z<rsup|k>|]>*<around|(|F\<odot\>G|)>=f<rsub|k>*g<rsub|k>>.
  This identity holds in <math|<C><around|[|u|]><around|[|<around|[|z|]>|]>>
  and is proved by direct coefficient extraction <cite|Crowley2026>: at
  degree <math|k>,\ 

  <\equation>
    <around|[|z<rsup|k>|]>*B<around|[|A|]>=Q*<space|0.17em>a*<around|(|k-1|)>+R*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j|)>*a<around|(|\<ell\>|)>
  </equation>

  and multiplying by <math|\<psi\><rsub|k>> recovers <math|a<around|(|k|)>>
  exactly from <eqref|eq:ak>.

  <section|The Moment Functional and Its Quasi-Definiteness>

  <\definition>
    [Fox\UWright moment functional] The <em|Fox\UWright moment functional>
    associated to <eqref|eq:fRic> is the <math|<C>>-linear map
    <math|\<cal-L\>:<C><around|[|x|]>\<to\><C><around|[|u|]>> defined by

    <\equation>
      <label|eq:L_def>\<cal-L\><around|[|x<rsup|k>|]>\<assign\>a<around|(|k,u|)>\<forall\>\<forall\>k\<ge\>0
    </equation>

    extended by linearity. The Hankel determinants are

    <\equation>
      <label|eq:hankel>H<rsub|n><around|(|u|)>\<assign\>det
      <space|-0.17em><around*|(|a<around|(|i+j,u|)>|)><rsub|0\<le\>i,j\<le\>n-1>\<in\><C><around|[|u|]>
    </equation>

    The functional is <em|quasi-definite> if
    <math|H<rsub|n><around|(|u|)>\<ne\>0> for all <math|n\<ge\>1> (as
    elements of <math|<C><around|[|u|]>>, i.e., not identically zero).
  </definition>

  <\remark>
    [Generic quasi-definiteness] By the Müntz\UTau recurrence
    <eqref|eq:a0>\U<eqref|eq:ak>, each <math|a<around|(|k,u|)>> is a
    polynomial in <math|u> of degree increasing with <math|k>. The Hankel
    determinant <math|H<rsub|n><around|(|u|)>> is a polynomial in <math|u>
    that vanishes only on a proper algebraic subvariety of parameter space;
    generically, <math|H<rsub|n><around|(|u|)>\<ne\>0>. The recurrence
    coefficients <math|\<alpha\><around|(|k,u|)>> and
    <math|\<beta\><around|(|k,u|)>> produced by the Chebyshev\UWheeler
    algorithm <cite|Wheeler1974|Gragg1972> are rational functions of <math|u>
    well-defined off this subvariety.
  </remark>

  Under quasi-definiteness, the Chebyshev\UWheeler algorithm
  <cite|Wheeler1974|Gautschi1982> produces the unique monic polynomial
  sequence <math|<around|{|P<rsub|M>*<around|(|x,u|)>|}><rsub|M\<ge\>0>>
  satisfying

  <\equation>
    <label|eq:orth_cond>\<cal-L\>*<around|[|x<rsup|k>*P<rsub|M>*<around|(|x,u|)>|]>=0<space|2em>\<forall\>k=0,1,\<ldots\>,M-1
  </equation>

  via the three-term recurrence

  <\equation>
    <label|eq:three_term>P<rsub|M+1>*<around|(|x,u|)>=<around|(|x-\<alpha\><around|(|M,u|)>|)>*<space|0.17em>P<rsub|M>*<around|(|x,u|)>-\<beta\><around|(|M,u|)>*<space|0.17em>P<rsub|M-1>*<around|(|x,u|)>
  </equation>

  The Padé denominator of <math|A<around|(|z,u|)>> at order <math|M> is the
  polynomial

  <\equation>
    <label|eq:pade_denom>D<rsub|M>*<around|(|z,u|)>=z<rsup|M>*P<rsub|M>*<around|(|z<rsup|-1>,u|)>
  </equation>

  the reciprocal transform of <math|P<rsub|M>> <cite|Crowley2026|Gragg1972>.

  <section|Classification: The Fox\UWright Non-Hermitian Orthogonal
  Polynomials>

  <subsection|The Hierarchy of Orthogonal Polynomial Families>

  We locate <math|<around|{|P<rsub|M>|(>\<cdot\>,u)}> within the
  classification of orthogonal polynomial sequences:

  <\enumerate>
    <item><with|font-series|bold|Classical orthogonal polynomials> (Jacobi,
    Laguerre, Hermite) are orthogonal with respect to a positive measure on
    <math|<R>> with explicit weight function. The moments grow at most
    polynomially. The recurrence coefficients <math|\<alpha\><around|(|k|)>>
    and <math|\<beta\><around|(|k|)>> are rational functions of <math|k> with
    known explicit forms. <em|Our polynomials do not belong to this class>:
    by <eqref|eq:gevrey>, the moments grow like <math|k>!, ruling out any
    positive measure on <math|<R>> <cite|StahlTotik1992>.

    <item><with|font-series|bold|Favard class / positive-measure OPs> are
    orthogonal with respect to a positive Borel measure on <math|<C>> with
    compact support. <em|Our polynomials do not belong to this class> in
    general: the moment functional <math|\<cal-L\>> is quasi-definite but not
    positive-definite (the Hankel determinants may have varying signs or be
    complex-valued for generic <math|u\<in\><C>>).

    <item><with|font-series|bold|Regular OPs in the Stahl\UTotik sense>
    <cite|StahlTotik1992> satisfy the <math|n>-th root asymptotics

    <\equation>
      <label|eq:nth_root><around|\||P<rsub|M>*<around|(|z,u|)>|\|><rsup|1/M><space|0.27em>\<to\><space|0.27em>e<rsup|g<around|(|z,K<rsub|A><around|(|u|)>|)>><space|0.17em><math-up|cap><around|(|K<rsub|A><around|(|u|)>|)><space|1em><text|in
      capacity on ><C>\<setminus\>K<rsub|A><around|(|u|)>
    </equation>

    where <math|g<around|(|\<cdummy\>,K<rsub|A><around|(|u|)>|)>> is the
    Green function of <math|<C>\<setminus\>K<rsub|A><around|(|u|)>> with pole
    at infinity, and <math|<math-up|cap><around|(|K<rsub|A><around|(|u|)>|)>>
    is the logarithmic capacity. <em|Our polynomials belong to this class> by
    virtue of Stahl's convergence theorem <cite|Stahl1997> as invoked in
    <cite|Crowley2026>.

    <item><with|font-series|bold|Nuttall\UStahl non-Hermitian OPs>
    <cite|NuttallSingh1977|Stahl1985I|Stahl1985II|GoncharRakhmanov1987> are
    orthogonal on the Stahl minimal-capacity contour <math|K<rsub|\<Phi\>>>
    with a complex-valued weight <math|\<rho\>> (the jump of the approximated
    function across <math|K<rsub|\<Phi\>>>):

    <\equation>
      <label|eq:nh_orth><big|int><rsub|K<rsub|A><around|(|u|)>>z<rsup|k>*P<rsub|M>*<around|(|z,u|)>*<space|0.17em>\<rho\><around|(|z,u|)>*<space|0.17em>d*z=0
      \ \ \ \ \<forall\>k=0,\<ldots\>,M-1
    </equation>

    <em|Our polynomials belong to this class>, with
    <math|K<rsub|A><around|(|u|)>> the Stahl compact from <cite|Crowley2026>
    and <math|\<rho\><around|(|z,u|)>> the jump of <math|A<around|(|z,u|)>>
    across <math|K<rsub|A><around|(|u|)>> \U a Fox\UWright-deformed
    Jacobi-type function described in Section<nbsp><reference|sec:weight>
    below.
  </enumerate>

  <subsection|The Weight Function><label|sec:weight>

  The jump of <math|A<around|(|z,u|)>> across <math|K<rsub|A><around|(|u|)>>
  is determined by the algebraic structure of the auxiliary function
  <math|F<around|(|z,u|)>> satisfying the quadratic <cite|Crowley2026>:

  <\equation>
    <label|eq:quad>z*R<around|(|u|)>*<space|0.17em>F<rsup|2>-<around|(|1-z*Q<around|(|u|)>|)>*<space|0.17em>F+P<around|(|u|)>*<space|0.17em>\<Psi\><rsub|\<mu\>><around|(|z|)>=0
  </equation>

  The discriminant is

  <\equation>
    <label|eq:disc>\<Delta\><rsub|F><around|(|z,u|)>=<around|(|1-z*Q<around|(|u|)>|)><rsup|2>-4*z*P<around|(|u|)>*R<around|(|u|)>*<space|0.17em>\<Psi\><rsub|\<mu\>><around|(|z|)>
  </equation>

  and <math|F<around|(|z,u|)>> has the closed form

  <\equation>
    <label|eq:F_closed>F<around|(|z,u|)>=<frac|<around|(|1-z*Q|)>-<sqrt|\<Delta\><rsub|F>>|2*z*R>
  </equation>

  The jump of <math|F> across the branch cut <math|K<rsub|F><around|(|u|)>>
  is

  <\equation>
    <label|eq:jump_F>\<rho\><rsub|F><around|(|z,u|)>=F<rsup|+><around|(|z,u|)>-F<rsup|-><around|(|z,u|)>=<frac|<sqrt|\<Delta\><rsub|F><rsup|+><around|(|z,u|)>>-<sqrt|\<Delta\><rsub|F><rsup|-><around|(|z,u|)>>|2*z*R<around|(|u|)>>
  </equation>

  which is a Fox\UWright-modified Jacobi-type weight: the classical Jacobi
  weight <math|<sqrt|<around|(|z-e<rsub|1>|)>*<around|(|z-e<rsub|2>|)>>>
  (where <math|e<rsub|1>,e<rsub|2>> are the branch points of the algebraic
  part <math|<around|(|1-z*Q|)><rsup|2>-4*z*P*R>) is deformed by the factor
  <math|\<Psi\><rsub|\<mu\>><around|(|z|)>> in <eqref|eq:disc>. Since
  <math|A> and <math|F> have the same branch locus by the branch-transfer
  lemma <cite|Crowley2026>, <math|\<rho\><rsub|A>=\<rho\><rsub|F>> up to a
  meromorphic factor, and the non-Hermitian orthogonality <eqref|eq:nh_orth>
  holds with weight <math|\<rho\><around|(|z,u|)>=\<rho\><rsub|F><around|(|z,u|)>>.

  <subsection|The Fox\UWright Deformation>

  The key distinction from all previously named orthogonal polynomial
  families is the presence of <math|\<Psi\><rsub|\<mu\>><around|(|z|)>> in
  the discriminant <eqref|eq:disc>. For <math|\<mu\>=1>, one computes

  <\equation>
    <label|eq:Psi1>\<Psi\><rsub|1><around|(|z|)>=<big|sum><rsub|k\<ge\>0><frac|1|k+1>*<space|0.17em>z<rsup|k>=-<frac|log
    <around|(|1-z|)>|z>
  </equation>

  which is analytic in <math|<around|\||z|\|>\<less\>1> but has a logarithmic
  branch point at <math|z=1>. Thus even in the simplest non-classical case,
  <math|\<Delta\><rsub|F>> acquires a transcendental factor. For
  <math|\<mu\>\<in\><around|(|0,1|)>>, <math|\<Psi\><rsub|\<mu\>>> is a
  Fox\UWright <math|<rsub|1>\<Psi\><rsub|1>> function (see
  <cite|Wright1935|Gorenflo2014>):

  <\equation>
    <label|eq:fox_wright_explicit>\<Psi\><rsub|\<mu\>><around|(|z|)>=<rsub|1>\<Psi\><rsub|1><space|-0.17em><around*|(|<tabular*|<tformat|<table|<row|<cell|<around|(|1,\<mu\>|)>>>|<row|<cell|<around|(|1+\<mu\>,\<mu\>|)>>>>>><space|0.17em>;<space|0.17em>z|)>=<big|sum><rsub|k\<ge\>0><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>*<space|0.17em>z<rsup|k>
  </equation>

  with Mellin transform <math|>

  <\equation>
    M<rsub|\<Psi\><rsub|\<mu\>>><around|(|s|)>=<frac|\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>*\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>
  </equation>

  \ meromorphic on <math|<C>> <cite|Crowley2026>. The branch points of
  <math|<sqrt|\<Delta\><rsub|F>>> are therefore the zeros of <eqref|eq:disc>,
  which include both the zeros of the polynomial factor
  <math|<around|(|1-z*Q|)><rsup|2>-4*z*P*R\<cdot\>\<psi\><rsub|0>> (near
  <math|z=0>) and the singularities of <math|\<Psi\><rsub|\<mu\>>> on the
  circle <math|<around|\||z|\|>=1>, projected under the Stahl\UChebotarëv
  minimization <cite|Stahl1985I|Stahl1985II>.

  <section|Asymptotic Theory>

  <subsection|The <math|S>-Property and Stahl's Compact>

  The Stahl compact <math|K<rsub|A><around|(|u|)>> satisfies the
  <em|<math|S>-property> of Gonchar\URakhmanov <cite|GoncharRakhmanov1987>:
  the normal derivative of the Green function
  <math|g<around|(|z,K<rsub|A><around|(|u|)>|)>> from the two sides of
  <math|K<rsub|A><around|(|u|)>> are equal

  <\equation>
    <label|eq:S_property><frac|\<partial\>*g|\<partial\>*n<rsup|+>>*<around|(|z,K<rsub|A><around|(|u|)>|)>=<frac|\<partial\>*g|\<partial\>*n<rsup|->>*<around|(|z,K<rsub|A><around|(|u|)>|)>
    \ \ \ \<forall\>z\<in\>K<rsub|A><around|(|u|)>\<setminus\>\<partial\>*K<rsub|A><around|(|u|)>
  </equation>

  This characterizes <math|K<rsub|A><around|(|u|)>> as the support of the
  equilibrium measure that balances the logarithmic energy functional
  <cite|Ransford1995>:

  <\equation>
    <label|eq:equil_meas>\<nu\><rsub|K<rsub|A><around|(|u|)>>=arg
    min<rsub|\<nu\>> I<around|[|\<nu\>|]>
  </equation>

  <\equation>
    I<around|[|\<nu\>|]>\<assign\><big|iint>log
    <frac|1|<around|\||z-w|\|>>*<space|0.17em>d*\<nu\><around|(|z|)>*<space|0.17em>d*\<nu\><around|(|w|)>
  </equation>

  <subsection|Zero Condensation: Nuttall\UStahl>

  The empirical zero-counting measure of the orthogonal polynomials

  <\equation>
    <label|eq:nu_M>\<nu\><rsub|M>\<assign\><frac|1|M>*<big|sum><rsub|P<rsub|M>*<around|(|\<lambda\>,u|)>=0>\<delta\><rsub|\<lambda\>>
  </equation>

  converges weak-<math|\<ast\>> to <math|\<nu\><rsub|K<rsub|A><around|(|u|)>>>
  as <math|M\<to\>\<infty\>>, the equilibrium measure of the Stahl compact
  <cite|Crowley2026|Stahl1997>. This is the Nuttall\UStahl zero-condensation
  theorem, which in the present context reads: the zeros of
  <math|<around|{|P<rsub|M>|(>\<cdot\>,u)}<rsub|M\<ge\>1>> are dense in
  <math|K<rsub|A><around|(|u|)>> and equidistribute according to
  <math|\<nu\><rsub|K<rsub|A><around|(|u|)>>>.

  <subsection|Recurrence Coefficient Asymptotics>

  Under the regularity hypothesis <eqref|eq:nth_root>, the recurrence
  coefficients of <eqref|eq:three_term> satisfy <cite|StahlTotik1992>:

  <\equation>
    <label|eq:alpha_asymp>\<alpha\><around|(|k,u|)><space|0.27em>\<longrightarrow\><space|0.27em>\<alpha\><rsup|\<ast\>><around|(|u|)>
  </equation>

  <\equation>
    \<beta\><around|(|k,u|)><space|0.27em>\<longrightarrow\><space|0.27em>\<beta\><rsup|\<ast\>><around|(|u|)>
  </equation>

  as <math|k\<to\>\<infty\>>, where <math|\<alpha\><rsup|\<ast\>><around|(|u|)>>
  and <math|\<beta\><rsup|\<ast\>><around|(|u|)>> are determined by the
  conformal map <math|\<Phi\>:<C>\<setminus\>K<rsub|A><around|(|u|)>\<to\><C>\<setminus\><wide|\<bbb-D\>|\<bar\>>>
  by the Szeg®-type asymptotic formula. Explicitly, the equilibrium measure
  <math|\<nu\><rsub|K<rsub|A><around|(|u|)>>> has density <math|>

  <\equation>
    d*\<nu\><rsub|K<rsub|A><around|(|u|)>>=<around|(|1/2*\<pi\>|)><around|\||\<Phi\><rprime|'><around|(|z|)>|\|>*<space|0.17em><around|\||d*z|\|>
  </equation>

  \ on <math|K<rsub|A><around|(|u|)>>, and the asymptotic recurrence
  coefficients are the first two Laurent coefficients of the conformal map:

  <\equation>
    <label|eq:alpha_beta_conformal>\<Phi\><around|(|z|)>=z/<math-up|cap><around|(|K<rsub|A><around|(|u|)>|)>+\<alpha\><rsup|\<ast\>><around|(|u|)>+O<around|(|1/z|)>.
  </equation>

  For <math|K<rsub|A><around|(|u|)>> an interval
  <math|<around|[|a,b|]>\<subset\><R>> (possible for special real parameter
  values), this reduces to

  <\equation>
    <label|eq:interval_case>\<alpha\><rsup|\<ast\>><around|(|u|)>=<tfrac|a+b|2>
  </equation>

  <\equation>
    \<beta\><rsup|\<ast\>><around|(|u|)>=<tfrac|<around|(|b-a|)><rsup|2>|16>
  </equation>

  and the <math|P<rsub|M>*<around|(|\<cdummy\>,u|)>> are asymptotically
  Chebyshev polynomials for <math|<around|[|a,b|]>>. For
  <math|K<rsub|A><around|(|u|)>> a complex arc, the conformal map is
  transcendental and no closed-form expression is known in general.

  <subsection|Convergence: Stahl's Theorem Applied>

  The Padé approximants <math|N<rsub|M>/D<rsub|M>> converge to
  <math|A<around|(|z,u|)>> in logarithmic capacity on compact subsets of
  <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>:

  <\equation>
    <label|eq:stahl_conv><around*|\||<frac|N<rsub|M>|D<rsub|M>>-A|\|><rsup|1/<around|(|2*M|)>><space|0.27em>\<longrightarrow\><space|0.27em>e<rsup|-g<around|(|z,K<rsub|A><around|(|u|)>|)>><space|1em><text|in
    capacity>
  </equation>

  <cite|Stahl1997|Crowley2026>. This implies exponential convergence off
  <math|K<rsub|A><around|(|u|)>> with rate governed by the Green function.
  Since <math|K<rsub|A><around|(|u|)>> is disjoint from <math|<R><rsub|+>>
  (the poles of <math|A> on the physical time axis are absent by a
  Volterra-iteration argument <cite|Crowley2026>), the convergence upgrades
  to uniform convergence:

  <\equation>
    <label|eq:uniform_conv>sup<rsub|t\<in\><around|[|0,T|]>><around*|\||y<around|(|t,u|)>-y<rsub|M><around|(|t,u|)>|\|><space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as
    >M\<to\>\<infty\>.
  </equation>

  <section|The <math|\<mu\>=1> Special Case: Chebotarëv\UJacobi Polynomials>

  When <math|\<mu\>=1>, the Fox\UWright weights reduce to <math|>

  <\equation>
    \<psi\><rsub|k>=<frac|1|k+1>
  </equation>

  and\ 

  <\equation>
    \<Psi\><rsub|1><around|(|z|)>=<frac|-log <around|(|1-z|)>|z>
  </equation>

  The discriminant <eqref|eq:disc> becomes

  <\equation>
    <label|eq:disc_mu1>\<Delta\><rsub|F><around|(|z,u|)><mid|\|><rsub|\<mu\>=1>=<around|(|1-z*Q|)><rsup|2>+4*z*P*R*<space|0.17em><frac|log
    <around|(|1-z|)>|z>
  </equation>

  The zeros of <math|\<Delta\><rsub|F>> are the solutions to <math|>

  <\equation>
    <around|(|1-z*Q|)><rsup|2>=-4*P*R*log <around|(|1-z|)>
  </equation>

  a transcendental equation, but the branch structure of
  <math|<sqrt|\<Delta\><rsub|F>>> is still two-sheeted, and the Stahl compact
  <math|K<rsub|A><around|(|u|)>> is a finite arc in <math|<C>> connecting the
  two branch points of <math|<sqrt|\<Delta\><rsub|F>>>. The orthogonal
  polynomials in this case are exactly the Padé denominator polynomials for a
  two-sheeted function with one finite branch cut, the class studied in
  <cite|BarhoumiYattselev2023> and earlier by Aptekarev\UStahl
  <cite|Stahl1997>.

  For the further special case <math|Q=0>, <math|R=-1>, <math|P=1> (which
  gives the Bernoulli equation at <math|\<mu\>=1>), the quadratic
  <eqref|eq:quad> simplifies and <math|K<rsub|A><around|(|u|)>> is a segment
  <math|<around|[|0,\<sigma\>|]>> for <math|\<sigma\>> the first zero of the
  classical Riccati solution \U the <math|P<rsub|M>*<around|(|\<cdummy\>,u|)>>
  are then Legendre polynomials shifted to <math|<around|[|0,\<sigma\>|]>>.

  <section|The <math|R=0> Oracle: Mittag-Leffler Moments and Laguerre
  Structure>

  When <math|R<around|(|u|)>=0>, the recurrence <eqref|eq:ak> linearizes to\ 

  <\equation>
    a<around|(|k,u|)>=\<psi\><rsub|k>*Q<around|(|u|)><rsup|k>*P<around|(|u|)>*\<psi\><rsub|0><rsup|-1>\<cdot\>\<psi\><rsub|0>
  </equation>

  giving <cite|Crowley2026>:

  <\equation>
    <label|eq:r0_moments>a<around|(|k,u|)>=P<around|(|u|)>*<space|0.17em>\<psi\><rsub|k>*<space|0.17em>Q<around|(|u|)><rsup|k>
  </equation>

  The moment functional becomes

  <\equation>
    \<cal-L\><around|[|x<rsup|k>|]>=P<around|(|u|)>*\<psi\><rsub|k>*Q<around|(|u|)><rsup|k>
  </equation>

  a Stieltjes-type functional with moments
  <math|<around|{|P*\<psi\><rsub|k>*Q<rsup|k>|}>>.

  <\proposition>
    In the <math|R=0> case, the moment functional <math|\<cal-L\>> has the
    integral representation

    <\equation>
      <label|eq:r0_int>\<cal-L\><around|[|f|]>=<big|int><rsub|0><rsup|\<infty\>>f*<around|(|Q*x|)>*<space|0.17em>w<rsub|\<mu\>><around|(|x|)>*<space|0.17em>d*x
    </equation>

    where <math|>

    <\equation>
      w<rsub|\<mu\>><around|(|x|)>=P*<space|0.17em>\<cal-L\><rsup|-1><around|[|\<psi\><rsub|k>|]><around|(|x|)>
    </equation>

    \ is the inverse Laplace transform of the Fox\UWright function
    <math|z\<mapsto\>P*<space|0.17em>\<Psi\><rsub|\<mu\>>*<around|(|Q*z|)>>.
    Explicitly, <math|w<rsub|\<mu\>>> is a one-sided stable density with
    stability index <math|\<mu\>>, related to the Mittag-Leffler measure
    <cite|Grothaus2015>.
  </proposition>

  The <math|R=0> orthogonal polynomials are therefore classical Laguerre-type
  polynomials for the one-sided stable distribution at index <math|\<mu\>>.
  For <math|\<mu\>=1>, <math|w<rsub|1><around|(|x|)>=P*e<rsup|-x>> and the
  polynomials are standard Laguerre polynomials
  <math|L<rsub|M><rsup|<around|(|0|)>>> scaled to <math|<around|[|0,1/Q|]>>.
  For <math|\<mu\>\<ne\>1>, they are the orthogonal polynomials of the
  Mittag-Leffler measure of <cite|Grothaus2015> \U a family studied in
  connection with fractional Brownian motion and anomalous diffusion.

  This provides a closed-form unit test for any implementation: the
  <math|<around|[|M/M|]>> Padé approximant to
  <math|A<around|(|z,u|)>\|<rsub|R=0>=P/<around|(|1-Q*z|)>> must reproduce
  the <math|M>-th Padé approximant to <math|E<rsub|\<mu\>,1>*<around|(|Q*t<rsup|\<mu\>>|)>>
  exactly, and the Wheeler algorithm must recover Laguerre recurrence
  coefficients asymptotically <cite|Crowley2026>.

  <section|The Müntz\USzász Theorem>

  The Müntz\USzász theorem <cite|MuntzSzasz1914|Moragues2018> provides the
  qualitative underpinning of the entire convergence theory. The Müntz
  exponents used in the expansion <eqref|eq:y_expansion> are
  <math|\<lambda\><rsub|k>=<around|(|k+1|)>*\<mu\>>, and

  <\equation>
    <label|eq:muntz_sum><big|sum><rsub|k=0><rsup|\<infty\>><frac|1|\<lambda\><rsub|k>>=<frac|1|\<mu\>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|1|k+1>=\<infty\>
  </equation>

  for every <math|\<mu\>\<in\><around|(|0,1|]>>. By Müntz\USzász, the system
  <math|<around|{|t<rsup|<around|(|k+1|)>*\<mu\>>|}>> is therefore dense in
  <math|<around|{|f\<in\>C<around|(|<around|[|0,T|]>|)>:f<around|(|0|)>=0|}>>
  for all <math|T\<gtr\>0>.

  Three implications follow immediately:

  <\enumerate>
    <item><with|font-series|bold|No coefficient can be discarded.> Any
    subsequence <math|<around|{|a<around|(|k<rsub|j>,u|)>|}>> with
    <math|<big|sum>1/k<rsub|j>\<less\>\<infty\>> generates a Padé table that
    cannot uniformly recover <math|y<around|(|t,u|)>> on
    <math|<around|[|0,T|]>>. All moments are indispensable.

    <item><with|font-series|bold|The Müntz rational approximants have maximum
    approximation power.> Since the exponents satisfy <eqref|eq:muntz_sum>,
    the Müntz rationals <math|<around|{|t<rsup|\<mu\>>*N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>/D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>|}>>
    form a complete approximating family in
    <math|C<rsub|0><around|(|<around|[|0,T|]>|)>>.

    <item><with|font-series|bold|Uniform convergence on <math|<R><rsub|+>> is
    the canonical upgrade.> The Stahl convergence-in-capacity result on the
    complement of <math|K<rsub|A><around|(|u|)>>, combined with the absence
    of poles on <math|<R><rsub|+>> (Lemma 14 of <cite|Crowley2026>), is the
    quantitative realization of the qualitative Müntz\USzász density \U the
    divergence of <math|<big|sum>1/\<lambda\><rsub|k>> is the engine, and the
    Fox\UWright-weighted Padé table is the mechanism.
  </enumerate>

  <section|Computational Realization: The Chebyshev\UWheeler Algorithm>

  The three-term recurrence coefficients <math|\<alpha\><around|(|k,u|)>> and
  <math|\<beta\><around|(|k,u|)>> are computed from the moments
  <math|<around|{|a<around|(|k,u|)>|}>> by the Chebyshev\UWheeler algorithm
  <cite|Wheeler1974|Gautschi1982>, which operates on an auxiliary array
  <math|\<sigma\><around|(|k,\<ell\>;u|)>> initialized by <math|>

  <\equation>
    \<sigma\><around|(|0,\<ell\>;u|)>=a<around|(|\<ell\>,u|)>
  </equation>

  \ and evolved by

  <\equation>
    <label|eq:sigma_rec>\<sigma\><around|(|k,\<ell\>;u|)>=\<sigma\><around|(|k-1,\<ell\>+1;u|)>-\<alpha\><around|(|k-1,u|)>*<space|0.17em>\<sigma\><around|(|k-1,\<ell\>;u|)>-\<beta\><around|(|k-1,u|)>*<space|0.17em>\<sigma\><around|(|k-2,\<ell\>;u|)>
  </equation>

  The recurrence coefficients are

  <\equation>
    <label|eq:alpha_beta_wheeler>\<alpha\><around|(|k,u|)>=<frac|\<sigma\><around|(|k,k+1;u|)>|\<sigma\><around|(|k,k;u|)>>-<frac|\<sigma\><around|(|k-1,k;u|)>|\<sigma\><around|(|k-1,k-1;u|)>>
  </equation>

  <\equation>
    \<beta\><around|(|k,u|)>=<frac|\<sigma\><around|(|k,k;u|)>|\<sigma\><around|(|k-1,k-1;u|)>>
  </equation>

  Under quasi-definiteness, <math|\<sigma\><around|(|k,k;u|)>\<ne\>0> for all
  <math|k> and the algorithm is well-defined. The orthonormality of the
  resulting polynomials is guaranteed by Wheeler's theorem
  <cite|Wheeler1974>:

  <\equation>
    <label|eq:wheeler_norm>\<cal-L\>*<around|[|\<pi\><rsub|j>*<space|0.17em>\<pi\><rsub|k>|]>=\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><around|(|i,u|)>
  </equation>

  where <math|\<pi\><rsub|k>> are the monic orthogonal polynomials produced
  by <eqref|eq:three_term>.

  <vspace*|1fn><no-indent><with|font-series|bold|Numerical stability.> The
  Chebyshev\UWheeler algorithm for the Fox\UWright moment functional is
  subject to the same conditioning issues as the general modified-moment
  algorithm <cite|Gautschi1994|Gautschi1998>: the map from moments to
  recurrence coefficients is a nonlinear map that can be ill-conditioned when
  the moments grow rapidly. The Gevrey-1 bound <eqref|eq:gevrey> implies
  moments of size <math|\<sim\>K<rsub|G>*C<rsub|G><rsup|k>*k>!, and working
  in extended precision (as in the ARB library <cite|Johansson2017>) is
  recommended for large <math|M>.

  <section|Summary: Classification of the FW-NHOP Family>

  <big-table|<with|par-mode|center|<assign|arraystretch|<macro|1.4>>
  <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|13|13|1|-1|cell-bborder|1ln>|<table|<row|<cell|<with|font-series|bold|Property>>|<cell|<with|font-series|bold|Value/Status>>|<cell|<with|font-series|bold|Reference>>>|<row|<cell|Moment
  growth>|<cell|Gevrey-1: <math|<around|\||a<around|(|k|)>|\|>\<le\>K*C<rsup|k>*k>!>|<cell|<cite|Crowley2026>>>|<row|<cell|Moment
  functional>|<cell|Quasi-definite, not positive>|<cell|<cite|Crowley2026>>>|<row|<cell|Orthogonality>|<cell|Non-Hermitian
  on <math|K<rsub|A><around|(|u|)>>>|<cell|<cite|NuttallSingh1977>>>|<row|<cell|Weight>|<cell|Fox--Wright-deformed
  Jacobi>|<cell|<cite|Wright1935|Crowley2026>>>|<row|<cell|Zero
  distribution>|<cell|Condenses to <math|\<nu\><rsub|K<rsub|A><around|(|u|)>>>>|<cell|<cite|Stahl1997|Crowley2026>>>|<row|<cell|Regularity>|<cell|Stahl--Totik
  regular>|<cell|<cite|StahlTotik1992>>>|<row|<cell|<math|S>-property>|<cell|Gonchar--Rakhmanov>|<cell|<cite|GoncharRakhmanov1987>>>|<row|<cell|<math|\<mu\>=1>
  reduction>|<cell|Chebotarëv--Jacobi>|<cell|<cite|BarhoumiYattselev2023>>>|<row|<cell|<math|R=0>
  reduction>|<cell|Mittag-Leffler / Laguerre-type>|<cell|<cite|Grothaus2015>>>|<row|<cell|Computation>|<cell|Chebyshev--Wheeler>|<cell|<cite|Wheeler1974|Gautschi1982>>>|<row|<cell|Convergence>|<cell|Stahl
  cap. + uniform on <math|<R><rsub|+>>>|<cell|<cite|Stahl1997|Crowley2026>>>|<row|<cell|Completeness>|<cell|Müntz--Szász>|<cell|<cite|Moragues2018>>>>>>
  >|Properties of the Fox--Wright non-Hermitian orthogonal polynomials
  (FW-NHOPs) associated to the fractional Riccati equation <eqref|eq:fRic>.>

  The Fox\UWright non-Hermitian orthogonal polynomials form a one-parameter
  family indexed by <math|\<mu\>\<in\><around|(|0,1|]>> that interpolates
  between:

  <\itemize>
    <item><math|\<mu\>=1>: classical (logarithmically-deformed)
    Chebotarëv\UJacobi polynomials on a two-arc system
    <cite|BarhoumiYattselev2023>;

    <item><math|\<mu\>\<to\>0<rsup|+>>: a limiting regime where
    <math|\<psi\><rsub|k>\<to\>1> for all <math|k> (by
    <math|\<Gamma\><around|(|1|)>/\<Gamma\><around|(|1|)>=1>) and the
    Fox\UWright weight collapses to a standard algebraic weight \U the
    polynomials approach classical Padé denominators for the bare quadratic
    <math|F<rsub|0><around|(|z,u|)>> with <math|\<Psi\><rsub|0>\<equiv\>1>.
  </itemize>

  <\thebibliography|99>
    <bibitem|Crowley2026>S.<nbsp>Crowley, <em|The Fractional
    Riccati\UMüntz\UPadé Theorem>, preprint (2026).

    <bibitem|SKM1993>S.<nbsp>G.<nbsp>Samko, A.<nbsp>A.<nbsp>Kilbas,
    O.<nbsp>I.<nbsp>Marichev, <em|Fractional Integrals and Derivatives:
    Theory and Applications>, Gordon and Breach, 1993.

    <bibitem|Stahl1985I>H.<nbsp>Stahl, <em|Extremal domains associated with
    an analytic function I>, Constr. Approx. <with|font-series|bold|1>
    (1985), 89\U110.

    <bibitem|Stahl1985II>H.<nbsp>Stahl, <em|Extremal domains associated with
    an analytic function II>, Constr. Approx. <with|font-series|bold|1>
    (1985), 111\U137.

    <bibitem|Stahl1997>H.<nbsp>Stahl, <em|The convergence of Padé
    approximants to functions with branch points>, J. Approx. Theory
    <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|StahlTotik1992>H.<nbsp>Stahl, V.<nbsp>Totik, <em|General
    Orthogonal Polynomials>, Encyclopedia of Mathematics and its Applications
    <with|font-series|bold|43>, Cambridge University Press, 1992.

    <bibitem|GoncharRakhmanov1987>A.<nbsp>A.<nbsp>Gonchar,
    E.<nbsp>A.<nbsp>Rakhmanov, <em|Equilibrium distributions and degree of
    rational approximation of analytic functions>, Mat. Sb.
    <with|font-series|bold|134>(176) (1987), 306\U352; English transl. Math.
    USSR-Sb. <with|font-series|bold|62> (1989), 305\U348.

    <bibitem|NuttallSingh1977>J.<nbsp>Nuttall, S.<nbsp>R.<nbsp>Singh,
    <em|Orthogonal polynomials and Padé approximants associated with a system
    of arcs>, J. Approx. Theory <with|font-series|bold|21> (1977), 1\U42.

    <bibitem|BarhoumiYattselev2023>A.<nbsp>B.<nbsp>Barhoumi,
    M.<nbsp>L.<nbsp>Yattselev, <em|Non-Hermitian orthogonal polynomials on a
    trefoil>, arXiv:2303.17037 (2023).

    <bibitem|Wheeler1974>J.<nbsp>C.<nbsp>Wheeler, <em|Modified moments and
    Gaussian quadratures>, Rocky Mountain J. Math. <with|font-series|bold|4>
    (1974), 287\U296.

    <bibitem|Gragg1972>W.<nbsp>B.<nbsp>Gragg, <em|The Padé table and its
    relation to certain algorithms of numerical analysis>, SIAM Review
    <with|font-series|bold|14> (1972), 1\U62.

    <bibitem|Gautschi1982>W.<nbsp>Gautschi, <em|On generating orthogonal
    polynomials>, SIAM J. Sci. Stat. Comput. <with|font-series|bold|3>
    (1982), 289\U317.

    <bibitem|Gautschi1994>W.<nbsp>Gautschi, <em|Orthogonal polynomials:
    applications and computation>, Acta Numerica <with|font-series|bold|5>
    (1996), 45\U119.

    <bibitem|Gautschi1998>W.<nbsp>Gautschi, L.<nbsp>Gori, M.<nbsp>L.<nbsp>Lo
    Cascio, <em|Quadrature rules for rational functions>, Numer. Math.
    <with|font-series|bold|86> (2000), 617\U633.

    <bibitem|MuntzSzasz1914>Ch.<nbsp>H.<nbsp>Müntz, <em|Über den
    Approximationssatz von Weierstrass>, H.<nbsp>A.<nbsp>Schwarz Festschrift,
    Berlin, 1914, 303\U312.

    <bibitem|Moragues2018>A.<nbsp>Ferré<nbsp>Moragues, <em|What is... the
    Müntz\USzász Theorem?>, expository note (2018).

    <bibitem|Wright1935>E.<nbsp>M.<nbsp>Wright, <em|The asymptotic expansion
    of the generalized Bessel function>, Proc. London Math. Soc. (2)
    <with|font-series|bold|38> (1935), 257\U270.

    <bibitem|Gorenflo2014>R.<nbsp>Gorenflo, A.<nbsp>A.<nbsp>Kilbas,
    F.<nbsp>Mainardi, S.<nbsp>V.<nbsp>Rogosin, <em|Mittag-Leffler Functions,
    Related Topics and Applications>, Springer, 2014.

    <bibitem|Grothaus2015>M.<nbsp>Grothaus, F.<nbsp>Jahnert,
    <em|Mittag-Leffler analysis I: Construction and characterization>, J.
    Funct. Anal. <with|font-series|bold|268> (2015), 1876\U1903.

    <bibitem|Ransford1995>T.<nbsp>Ransford, <em|Potential Theory in the
    Complex Plane>, London Math. Soc. Student Texts
    <with|font-series|bold|28>, Cambridge Univ. Press, 1995.

    <bibitem|Johansson2017>F.<nbsp>Johansson, <em|Arb: efficient
    arbitrary-precision midpoint-radius interval arithmetic>, IEEE Trans.
    Comput. <with|font-series|bold|66> (2017), 1281\U1292.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-10|<tuple|4.3|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|5|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|5.1|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|5.2|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-14|<tuple|5.3|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-15|<tuple|5.4|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-16|<tuple|6|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-17|<tuple|7|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-18|<tuple|8|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-19|<tuple|9|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-20|<tuple|10|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-21|<tuple|1|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-22|<tuple|<with|mode|<quote|math>|\<bullet\>>|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|2.1|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|2.2|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|2.3|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|4|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|4.1|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|4.2|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-BarhoumiYattselev2023|<tuple|BarhoumiYattselev2023|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Crowley2026|<tuple|Crowley2026|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gautschi1982|<tuple|Gautschi1982|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gautschi1994|<tuple|Gautschi1994|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gautschi1998|<tuple|Gautschi1998|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-GoncharRakhmanov1987|<tuple|GoncharRakhmanov1987|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gorenflo2014|<tuple|Gorenflo2014|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gragg1972|<tuple|Gragg1972|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Grothaus2015|<tuple|Grothaus2015|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Johansson2017|<tuple|Johansson2017|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Moragues2018|<tuple|Moragues2018|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-MuntzSzasz1914|<tuple|MuntzSzasz1914|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-NuttallSingh1977|<tuple|NuttallSingh1977|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Ransford1995|<tuple|Ransford1995|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-SKM1993|<tuple|SKM1993|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Stahl1985I|<tuple|Stahl1985I|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Stahl1985II|<tuple|Stahl1985II|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Stahl1997|<tuple|Stahl1997|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlTotik1992|<tuple|StahlTotik1992|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Wheeler1974|<tuple|Wheeler1974|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Wright1935|<tuple|Wright1935|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:F_closed|<tuple|23|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:L_def|<tuple|14|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:MB|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Psi1|<tuple|25|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:S_property|<tuple|28|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a0|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ak|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:alpha_asymp|<tuple|32|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:alpha_beta_conformal|<tuple|35|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:alpha_beta_wheeler|<tuple|52|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:disc|<tuple|22|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:disc_mu1|<tuple|42|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:equil_meas|<tuple|29|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fRic|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fox_wright_explicit|<tuple|26|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gevrey|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hadamard_fp|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hankel|<tuple|15|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:interval_case|<tuple|36|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:jump_F|<tuple|24|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:muntz_sum|<tuple|49|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:nh_orth|<tuple|20|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:nth_root|<tuple|19|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:nu_M|<tuple|31|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:orth_cond|<tuple|16|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pade_denom|<tuple|18|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:psi|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:quad|<tuple|21|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:r0_int|<tuple|47|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:r0_moments|<tuple|45|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_rec|<tuple|51|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:stahl_conv|<tuple|38|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:three_term|<tuple|17|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:uniform_conv|<tuple|39|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:wheeler_norm|<tuple|54|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:yM|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_expansion|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:weight|<tuple|4.2|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Crowley2026

      NuttallSingh1977

      Stahl1985I

      Stahl1985II

      StahlTotik1992

      BarhoumiYattselev2023

      GoncharRakhmanov1987

      MuntzSzasz1914

      Moragues2018

      Wheeler1974

      Gragg1972

      Crowley2026

      Crowley2026

      Moragues2018

      Wheeler1974

      SKM1993

      Crowley2026

      Crowley2026

      Crowley2026

      Crowley2026

      Crowley2026

      Crowley2026

      Wheeler1974

      Gragg1972

      Wheeler1974

      Gautschi1982

      Crowley2026

      Gragg1972

      StahlTotik1992

      StahlTotik1992

      Stahl1997

      Crowley2026

      NuttallSingh1977

      Stahl1985I

      Stahl1985II

      GoncharRakhmanov1987

      Crowley2026

      Crowley2026

      Crowley2026

      Wright1935

      Gorenflo2014

      Crowley2026

      Stahl1985I

      Stahl1985II

      GoncharRakhmanov1987

      Ransford1995

      Crowley2026

      Stahl1997

      StahlTotik1992

      Stahl1997

      Crowley2026

      Crowley2026

      BarhoumiYattselev2023

      Stahl1997

      Crowley2026

      Grothaus2015

      Grothaus2015

      Crowley2026

      MuntzSzasz1914

      Moragues2018

      Crowley2026

      Wheeler1974

      Gautschi1982

      Wheeler1974

      Gautschi1994

      Gautschi1998

      Johansson2017

      Crowley2026

      Crowley2026

      NuttallSingh1977

      Wright1935

      Crowley2026

      Stahl1997

      Crowley2026

      StahlTotik1992

      GoncharRakhmanov1987

      BarhoumiYattselev2023

      Grothaus2015

      Wheeler1974

      Gautschi1982

      Stahl1997

      Crowley2026

      Moragues2018

      BarhoumiYattselev2023
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Properties of the
      Fox--Wright non-Hermitian orthogonal polynomials (FW-NHOPs) associated
      to the fractional Riccati equation <with|font-shape|<quote|right>|(<reference|eq:fRic>)>.>|<pageref|auto-21>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Moment Functional and its Fox\UWright Structure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The Müntz\UTau Moments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Gevrey-1 Growth and Formal
      vs. Analytic Structure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>The Hadamard Fixed-Point
      Equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Moment Functional and Its Quasi-Definiteness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Classification:
      The Fox\UWright Non-Hermitian Orthogonal Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>The Hierarchy of Orthogonal
      Polynomial Families <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>The Weight Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>The Fox\UWright Deformation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Asymptotic
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>The <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|S>>-Property and
      Stahl's Compact <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Zero Condensation:
      Nuttall\UStahl <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Recurrence Coefficient
      Asymptotics <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Convergence: Stahl's Theorem
      Applied <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>The
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<mu\>=1>>
      Special Case: Chebotarëv\UJacobi Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>The
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|R=0>>
      Oracle: Mittag-Leffler Moments and Laguerre Structure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Müntz\USzász Backbone> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Computational
      Realization: The Chebyshev\UWheeler Algorithm>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Summary:
      Classification of the FW-NHOP Family>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>