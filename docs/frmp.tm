<TeXmacs|2.1.5>

<style|<tuple|article|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <assign|C|<macro|\<bbb-C\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|Z|<macro|\<bbb-Z\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|Lk|<macro|\<cal-L\>>>

    <assign|Imu|<macro|I<rsup|\<mu\>>>>

    <assign|Dmu|<macro|D<rsup|\<mu\>>>>

    <assign|Icomu|<macro|I<rsup|1-\<mu\>>>>

    <assign|Psimu|<macro|\<Psi\><rsub|\<mu\>>>>

    <assign|cpct|<macro|1|<math-up|cap>(<arg|1>)>>

    <assign|FW|<macro|1|2|<rsub|1>\<Psi\><rsub|1><space|-0.17em><left|[><matrix*|<tformat|<table|<row|<cell|<arg|1>>>|<row|<cell|<arg|2>>>>>>;<arg|2><right|]>>>
  </hide-preamble>

  <doc-data|<doc-title|The Fractional Riccati--Müntz--Padé
  Theorem>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|May 18, 2026>>

  <abstract-data|<\abstract>
    For the fractional Riccati equation

    <\equation>
      <label|eq:abs_riccati>D<rsup|\<mu\>>*y=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y+R<around|(|u|)>*<space|0.17em>y<rsup|2>
    </equation>

    with polynomial coefficients <math|P,Q,R\<in\>\<bbb-C\><around|[|u|]>>,
    order <math|\<mu\>\<in\><around|(|0,1|]>>, and homogeneous
    Riemann--Liouville initial condition, the unique solution
    <math|y<around|(|t,u|)>> is given explicitly by

    <\equation>
      <label|eq:abs_solution>y<around|(|t,u|)>=lim<rsub|M\<to\>\<infty\>>
      t<rsup|\<mu\>>*<space|0.17em><frac|N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>|D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>>
    </equation>

    where the rational pair <math|<around|(|N<rsub|M>,D<rsub|M>|)>> is
    produced by three steps: (i)<nbsp>compute <math|2*M> moments
    <math|a<around|(|0,u|)>,\<ldots\>,a<around|(|2*M-1,u|)>> from the
    explicit quadratic recurrence<nbsp><eqref|eq:ak>; (ii)<nbsp>run Wheeler's
    algorithm on those moments to obtain the Jacobi coefficients
    <math|\<alpha\><around|(|k|)>,\<beta\><around|(|k|)>> and orthogonal
    polynomials <math|\<pi\><rsub|k>>; (iii)<nbsp>set
    <math|D<rsub|M>*<around|(|z,u|)>=z<rsup|M>*\<pi\><rsub|M><around|(|z<rsup|-1>|)>>
    and compute <math|N<rsub|M>> by one Cauchy product. Total cost is
    <math|O<around|(|M<rsup|2>|)>> arithmetic operations, and convergence is
    Stahl-optimal: <math|<around|\||y-y<rsub|M>|\|><rsup|1/<around|(|2*M|)>>\<to\>e<rsup|-g<around|(|z,K<rsub|A>|)>>\<less\>1>
    in logarithmic capacity on compacta avoiding the Stahl compact
    <math|K<rsub|A><around|(|u|)>>, and uniformly on every
    <math|<around|[|0,T|]>\<subset\>\<bbb-R\><rsub|+>> in the
    constant-coefficient case.

    The denominator <math|D<rsub|M>> is the characteristic polynomial of the
    truncated Jacobi operator <math|J<rsub|M>> of the moment functional
    <math|\<cal-L\><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>. Multiplication
    by <math|x> on <math|<math-up|span><around|{|\<pi\><rsub|0>,\<ldots\>,\<pi\><rsub|M-1>|}>>
    is a weighted shift with a one-dimensional cokernel at
    <math|\<pi\><rsub|M>=D<rsub|M>>; the resulting defect
    <math|J<rsub|M>*v<around|(|\<lambda\>|)>=\<lambda\>*v<around|(|\<lambda\>|)>-P<rsub|M><around|(|\<lambda\>|)>*e<rsub|M>>
    forces the numerator to degree exactly <math|M-1>. The
    <math|<around|[|M-1/M|]>> type is not a bookkeeping choice but the
    codimension of the truncated Jacobi shift.

    The proof rests on three ingredients. First, the Müntz--Tau recurrence
    produces the moments via the eigenvalue action of <math|I<rsup|\<mu\>>>
    on monomials. Second, an auxiliary generating function <math|F> satisfies
    the closed-form algebraic quadratic <math|z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P*\<Psi\><rsub|\<mu\>>=0>,
    whose branch structure controls the convergence domain, and where
    <math|\<Psi\><rsub|\<mu\>>> is the Fox--Wright function

    <\equation>
      <label|eq:abs_Psi>\<Psi\><rsub|\<mu\>><around|(|z|)>=<rsub|1>\<Psi\><rsub|1><space|-0.17em><around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|1,\<mu\>|)>>>|<row|<cell|<around|(|1+\<mu\>,<space|0.17em>\<mu\>|)>>>>>>;z|]>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>*<space|0.17em>z<rsup|k>
    </equation>

    Third, a Mellin--Barnes integral representation transfers meromorphic
    continuation from <math|F> to the solution generating function <math|A>
    via the Hadamard fixed-point equation
    <math|A=\<Psi\><rsub|\<mu\>>\<odot\>B<around|[|A|]>>, and a
    self-consistent argument places <math|K<rsub|A>> inside <math|K<rsub|F>>.
    The Stahl convergence theorem for the generic two-valued algebraic class
    containing <math|F> and <math|A> is proved self-containedly in the
    appendix.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Approximant and the Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Step 1: The Fox\UWright kernel and the
    moment recurrence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Step 2: Wheeler's algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|3tab|Auxiliary array. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|3tab|Jacobi coefficients.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|3tab|Orthogonal polynomials.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|1.3<space|2spc>Step 3: Assembling the approximant
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|1.4<space|2spc>Operator-theoretic picture: why the
    type is <with|color|dark red|font-family|rm|<with|mode|math|<around|[|M-1/M|]>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Foundations>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Riemann\ULiouville calculus
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|2.2<space|2spc>Proof of the moment recurrence
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|2.3<space|2spc>Wheeler's algorithm and the Padé
    connection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Algebraic Quadratic and the Stahl Compact>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <with|par-left|3tab|Conventions. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Meromorphic
    Continuation of <with|color|dark red|font-family|rm|<with|mode|math|A>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Hadamard fixed-point equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|4.2<space|2spc>Mellin transform of <with|color|dark
    red|font-family|rm|<with|mode|math|\<Psi\><rsub|\<mu\>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|4.3<space|2spc>Mellin\UBarnes realisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|4.4<space|2spc>Stahl compacts and meromorphic
    continuation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Fractional Riccati\UMüntz\UPadé Theorem>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>A
    Direct Proof of Stahl's Theorem for the Generic Two-Valued Class over
    <with|color|dark red|font-family|rm|<with|mode|math|\<bbb-C\><around|(|z,\<Psi\><rsub|\<mu\>>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>Logarithmic capacity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|6.2<space|2spc>Extremal domain
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|6.3<space|2spc>Convergence in capacity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|6.4<space|2spc>Absence of Froissart doublets on
    <with|color|dark red|font-family|rm|<with|mode|math|\<bbb-R\><rsub|+>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26><vspace|0.5fn>
  </table-of-contents>

  <section|The Approximant and the Algorithm><label|sec:algo>

  We begin with the explicit output of the method before any proofs. Given
  <math|P,Q,R,\<mu\>>, the following three-step procedure produces
  <math|y<rsub|M>>.

  <subsection|Step 1: The Fox\UWright kernel and the moment recurrence>

  <\definition>
    [Fox\UWright function <math|<rsub|1>\<Psi\><rsub|1>>]<label|def:FW> The
    Fox\UWright function is defined by

    <\equation>
      <label|eq:FW_def><rsub|1>\<Psi\><rsub|1><space|-0.17em><around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|a,<space|0.17em>\<alpha\>|)>>>|<row|<cell|<around|(|b,<space|0.17em>\<beta\>|)>>>>>>;z|]>\<assign\><big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\>*<around|(|a+\<alpha\>*k|)>|\<Gamma\>*<around|(|b+\<beta\>*k|)>>*<space|0.17em><frac|z<rsup|k>|k!>
    </equation>

    convergent for all <math|z\<in\><C>> whenever
    <math|\<beta\>-\<alpha\>\<gtr\>-1>.
  </definition>

  <\definition>
    [Riccati\UFox\UWright kernel]<label|def:psi> The <em|Riccati\UFox\UWright
    kernel> of order <math|\<mu\>\<in\><around|(|0,1|]>> is the
    specialization

    <\equation>
      <label|eq:Psi_def><tabular|<tformat|<table|<row|<cell|<Psimu><around|(|z|)>>|<cell|\<assign\>
      <rsub| 1>\<Psi\><rsub|1 ><space|-0.17em><around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|1,<space|0.17em>\<mu\>|)>>>|<row|<cell|<around|(|1+\<mu\>,<space|0.17em>\<mu\>|)>>>>>>;z|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k>*<space|0.17em>z<rsup|k>>>>>>
    </equation>

    where

    <\equation>
      \<psi\><rsub|k>\<assign\><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>
    </equation>

    The convergence condition <math|\<beta\>-\<alpha\>=\<mu\>-\<mu\>=0\<gtr\>-1>
    is satisfied for all <math|\<mu\>\<gtr\>0>. The weights
    <math|\<psi\><rsub|k>> are the eigenvalues of the Riemann\ULiouville
    operator <math|I<rsup|\<mu\>>> on the monomial basis
    <math|<around|{|t<rsup|<around|(|k+1|)>*\<mu\>>|}>>
    (Lemma<nbsp><reference|lem:psi_eig> below); this eigenvalue action is the
    reason <math|<Psimu>> appears rather than any other
    <math|<rsub|1>\<Psi\><rsub|1>> specialization.
  </definition>

  <\remark>
    [Relation to the Mittag-Leffler function] At <math|\<mu\>=1>,
    <math|\<psi\><rsub|k>=1/<around|(|k+1|)>> and
    <math|\<Psi\><rsub|1><around|(|z|)>=-<around|(|log
    <around|(|1-z|)>|)>/z>. For general <math|\<mu\>>, <math|<Psimu>>
    interpolates between this logarithmic kernel at <math|\<mu\>=1> and a
    delta-like concentration as <math|\<mu\>\<to\>0<rsup|+>>.
  </remark>

  <\theorem>
    [Müntz\UTau recurrence]<label|thm:Muntz> The unique solution
    of<nbsp><eqref|eq:abs_riccati> with homogeneous Riemann\ULiouville
    initial condition satisfies <math|y<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
    on <math|<around|[|0,T<rsub|0>|]>> for some <math|T<rsub|0>\<gtr\>0>,
    with

    <\align>
      <tformat|<table|<row|<cell|a<around|(|0,u|)>>|<cell|=P<around|(|u|)>*<space|0.17em>\<psi\><rsub|0>,<eq-number><label|eq:a0>>>|<row|<cell|<vspace*|3pt>a<around|(|k,u|)>>|<cell|=\<psi\><rsub|k>*<space|-0.17em><around*|(|Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)>+R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>,<space|1em>k\<ge\>1.<eq-number><label|eq:ak>>>>>
    </align>

    Each <math|a<around|(|k,u|)>\<in\><C><around|[|u|]><around|[|P,Q,R|]>>.
    Computing <math|a<around|(|0|)>,\<ldots\>,a*<around|(|2*M-1|)>> costs
    <math|O<around|(|M<rsup|2>|)>> operations.
  </theorem>

  <\example>
    [<math|R=0> oracle]<label|ex:r0_oracle> When <math|R=0> the recurrence
    linearizes to <math|a<around|(|k,u|)>=\<psi\><rsub|k>*Q<rsup|k>*P*\<psi\><rsub|0>>,
    giving the closed form

    <\equation>
      <label|eq:r0_series>y<around|(|t,u|)>=<frac|P|Q>*<around*|(|E<rsub|\<mu\>,1>*<around|(|Q*<space|0.17em>t<rsup|\<mu\>>|)>-1|)>,
    </equation>

    where <math|E<rsub|\<mu\>,1><around|(|z|)>=<big|sum><rsub|k=0><rsup|\<infty\>>z<rsup|k>/\<Gamma\>*<around|(|k*\<mu\>+1|)>>
    is the Mittag-Leffler function. The <math|<around|[|M-1/M|]>> Padé
    approximant of <math|A<around|(|z,u|)>> must reproduce the rational
    approximant to <math|E<rsub|\<mu\>,1>*<around|(|Q*z|)>> exactly for every
    <math|M>, providing a closed-form unit test for any numerical
    implementation.
  </example>

  <subsection|Step 2: Wheeler's algorithm>

  With moments <math|\<mu\><around|(|\<ell\>|)>\<assign\>a<around|(|\<ell\>,u|)>>,
  quasi-definiteness (Definition<nbsp><reference|def:quasidef>) ensures the
  following recurrence is well-defined and produces the Jacobi coefficients.

  <paragraph|Auxiliary array.>

  <\align>
    <tformat|<table|<row|<cell|\<sigma\><around|(|-1,\<ell\>|)>>|<cell|=0<eq-number><label|eq:sigma_init1>>>|<row|<cell|<vspace*|3pt>\<sigma\><around|(|0,\<ell\>|)>>|<cell|=\<mu\><around|(|\<ell\>|)><eq-number><label|eq:sigma_init2>>>|<row|<cell|<vspace*|3pt>\<sigma\><around|(|k,\<ell\>|)>>|<cell|=\<sigma\><around|(|k-1,\<ell\>+1|)>-\<alpha\>*<around|(|k-1|)>*\<sigma\><around|(|k-1,\<ell\>|)>-\<beta\>*<around|(|k-1|)>*\<sigma\><around|(|k-2,\<ell\>|)><eq-number><label|eq:sigma_rec>>>>>
  </align>

  <paragraph|Jacobi coefficients.>

  <\align>
    <tformat|<table|<row|<cell|\<alpha\><around|(|0|)>>|<cell|=\<mu\><around|(|1|)>/\<mu\><around|(|0|)>,<space|2em>\<beta\><around|(|0|)>=\<mu\><around|(|0|)><eq-number><label|eq:ab0>>>|<row|<cell|<vspace*|3pt>\<alpha\><around|(|k|)>>|<cell|=<frac|\<sigma\><around|(|k,k+1|)>|\<sigma\><around|(|k,k|)>>-<frac|\<sigma\><around|(|k-1,k|)>|\<sigma\><around|(|k-1,k-1|)>><eq-number><label|eq:alpha_k>>>|<row|<cell|<vspace*|3pt>\<beta\><around|(|k|)>>|<cell|=<frac|\<sigma\><around|(|k,k|)>|\<sigma\><around|(|k-1,k-1|)>><eq-number><label|eq:beta_k>>>>>
  </align>

  <paragraph|Orthogonal polynomials.>

  <\align>
    <tformat|<table|<row|<cell|\<pi\><rsub|-1>>|<cell|=0,<space|2em>\<pi\><rsub|0>=1<eq-number><label|eq:pi_init>>>|<row|<cell|<vspace*|3pt>\<pi\><rsub|k+1>>|<cell|=<around|(|x-\<alpha\><around|(|k|)>|)>*<space|0.17em>\<pi\><rsub|k>-\<beta\><around|(|k|)>*<space|0.17em>\<pi\><rsub|k-1><eq-number><label|eq:pi_rec>>>>>
  </align>

  Cost: <math|O<around|(|M<rsup|2>|)>> operations.

  <subsection|Step 3: Assembling the approximant>

  Set

  <\equation>
    <label|eq:DM_def>D<rsub|M>*<around|(|z,u|)>\<assign\>z<rsup|M>*\<pi\><rsub|M><around|(|z<rsup|-1>|)>
  </equation>

  compute <math|N<rsub|M>> by matching the first <math|2*M> coefficients of
  <math|A<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*z<rsup|k>>
  against <math|N<rsub|M>/D<rsub|M>> (one Cauchy product, cost
  <math|O<around|(|M<rsup|2>|)>>), and set

  <\equation>
    <label|eq:yM_def>y<rsub|M><around|(|t,u|)>\<assign\>t<rsup|\<mu\>>*<space|0.17em><frac|N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>|D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>>
  </equation>

  <subsection|Operator-theoretic picture: why the type is
  <math|<around|[|M-1/M|]>>>

  The truncated Jacobi matrix

  <\equation>
    <label|eq:JM_def>J<rsub|M>\<assign\><matrix|<tformat|<table|<row|<cell|\<alpha\><around|(|0|)>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<beta\><around|(|1|)>>|<cell|\<alpha\><around|(|1|)>>|<cell|1>|<cell|>>|<row|<cell|>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>>|<row|<cell|>|<cell|>|<cell|\<beta\>*<around|(|M-1|)>>|<cell|\<alpha\>*<around|(|M-1|)>>>>>>
  </equation>

  represents multiplication by <math|x> on
  <math|V<rsub|M>\<assign\><math-up|span><around|{|\<pi\><rsub|0>,\<ldots\>,\<pi\><rsub|M-1>|}>>.
  On the orthonormal basis <math|<wide|\<pi\>|^><rsub|k>=\<pi\><rsub|k>/<sqrt|<big|prod><rsub|i=0><rsup|k>\<beta\><around|(|i|)>>>,
  this action is a weighted bidirectional shift:

  <\equation>
    <label|eq:shift_action><wide|J|~>*<space|0.17em><wide|\<pi\>|^><rsub|k>=<sqrt|\<beta\>*<around|(|k+1|)>>*<space|0.17em><wide|\<pi\>|^><rsub|k+1>+\<alpha\><around|(|k|)>*<space|0.17em><wide|\<pi\>|^><rsub|k>+<sqrt|\<beta\><around|(|k|)>>*<space|0.17em><wide|\<pi\>|^><rsub|k-1>
  </equation>

  Truncating to <math|V<rsub|M>> creates a one-dimensional cokernel: the
  shift maps <math|\<pi\><rsub|M-1>> toward <math|\<pi\><rsub|M>=D<rsub|M>>,
  which lies <em|outside> <math|V<rsub|M>>. This missing component manifests
  as the defect

  <\equation>
    <label|eq:JM_defect>J<rsub|M>*<space|0.17em>v<around|(|\<lambda\>|)>=\<lambda\>*<space|0.17em>v<around|(|\<lambda\>|)>-P<rsub|M><around|(|\<lambda\>|)>*<space|0.17em>e<rsub|M>
  </equation>

  <\equation*>
    v<around|(|\<lambda\>|)>\<assign\><around*|(|P<rsub|0><around|(|\<lambda\>|)>,\<ldots\>,P<rsub|M-1><around|(|\<lambda\>|)>|)><rsup|\<top\>>
  </equation*>

  where <math|e<rsub|M>> is the <math|M>-th standard basis vector. Hence
  <math|J<rsub|M>*v<around|(|\<lambda\>|)>=\<lambda\>*v<around|(|\<lambda\>|)>>
  if and only if <math|P<rsub|M><around|(|\<lambda\>|)>=0>, i.e.,
  <math|\<lambda\>> is a zero of <math|\<pi\><rsub|M>>, i.e.,
  <math|\<lambda\><rsup|-1>> is a zero of <math|D<rsub|M>>. The resolvent at
  the <math|<around|(|0,0|)>> entry is

  <\equation>
    <label|eq:resolvent><around*|[|<around|(|z*I-J<rsub|M>|)><rsup|-1>|]><rsub|0,0>=<frac|N<rsub|M><around|(|z|)>|D<rsub|M><around|(|z|)>>
  </equation>

  <\equation>
    deg N<rsub|M>=M-1
  </equation>

  <\equation>
    deg D<rsub|M>=M
  </equation>

  because the characteristic polynomial of the <math|M\<times\>M> matrix
  <math|J<rsub|M>> is degree <math|M>, and its
  <math|<around|(|0,0|)>>-cofactor is degree <math|M-1>. The
  <math|<around|[|M-1/M|]>> type is therefore the codimension of the
  truncated Jacobi shift, not a convention.

  <section|Foundations><label|sec:foundations>

  <subsection|Riemann\ULiouville calculus>

  <\definition>
    [Riemann\ULiouville operators]<label|def:RL> For
    <math|\<mu\>\<in\><around|(|0,1|]>> and <math|f> locally integrable on
    <math|<around|(|0,\<infty\>|)>>,

    <\align>
      <tformat|<table|<row|<cell|<Imu>f<around|(|t|)>>|<cell|\<assign\><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*f<around|(|s|)>*<space|0.17em>d*s<eq-number><label|eq:RL_int>>>|<row|<cell|<vspace*|6pt><Dmu>f<around|(|t|)>>|<cell|\<assign\><frac|d|d*t><around*|(|<Icomu>f|)><around|(|t|)><eq-number><label|eq:RL_der>>>>>
    </align>
  </definition>

  <\definition>
    [Fractional Riccati equation]<label|def:fRic>

    <\equation>
      <label|eq:fRic><Dmu>y<around|(|t,u|)>=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>,<space|2em><Icomu>y<around|(|0,u|)>=0
    </equation>
  </definition>

  <\lemma>
    [Volterra form]<label|lem:Volt> Equation<nbsp><eqref|eq:fRic> is
    equivalent to

    <\equation>
      <label|eq:Volt>y=<Imu><space|-0.17em><around*|[|P+Q*<space|0.17em>y+R*<space|0.17em>y<rsup|2>|]>
    </equation>
  </lemma>

  <\proof>
    Application of <math|I<rsup|\<mu\>>> to<nbsp><eqref|eq:fRic>, the
    composition formula<nbsp><cite-detail|SKM|Theorem<nbsp>2.4>, and the
    homogeneous initial condition <math|I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0>
    kill the boundary term and yield<nbsp><eqref|eq:Volt>.
  </proof>

  <\lemma>
    [Power rule]<label|lem:power> For <math|s\<gtr\>-1>,

    <\equation>
      <label|eq:power_rule><Imu>t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<mu\>+1|)>>*<space|0.17em>t<rsup|s+\<mu\>>
    </equation>
  </lemma>

  <\proof>
    The substitution <math|\<sigma\>=t*\<tau\>> in<nbsp><eqref|eq:RL_int>
    reduces the integral to <math|B<around|(|\<mu\>,s+1|)>=\<Gamma\><around|(|\<mu\>|)>*\<Gamma\>*<around|(|s+1|)>/\<Gamma\>*<around|(|s+\<mu\>+1|)>>.
  </proof>

  <\lemma>
    [Eigenvalue action of <math|I<rsup|\<mu\>>>]<label|lem:psi_eig> For
    <math|k\<ge\>0>,

    <\equation>
      <label|eq:psi_eig><Imu>t<rsup|<around|(|k+1|)>*\<mu\>>=\<psi\><rsub|k+1>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>><space|2em>\<psi\><rsub|k+1>=<frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+2|)>*\<mu\>+1|)>>
    </equation>

    The monomials <math|<around|{|t<rsup|<around|(|k+1|)>*\<mu\>>|}><rsub|k\<ge\>0>>
    are eigenfunctions of <math|I<rsup|\<mu\>>> and the Fox\UWright weights
    <math|\<psi\><rsub|k>> of Definition<nbsp><reference|def:psi> are the
    corresponding eigenvalues.
  </lemma>

  <\proof>
    Apply Lemma<nbsp><reference|lem:power> with
    <math|s=<around|(|k+1|)>*\<mu\>>.
  </proof>

  <\lemma>
    [Radius of convergence of <math|<Psimu>>]<label|lem:Psimu_radius>
    <math|<Psimu>> has radius of convergence <math|1>.
  </lemma>

  <\proof>
    By Stirling, <math|\<psi\><rsub|k>\<sim\><around|(|k*\<mu\>|)><rsup|-\<mu\>>>
    as <math|k\<to\>\<infty\>>, so <math|limsup<rsub|k\<to\>\<infty\>><around|\||\<psi\><rsub|k>|\|><rsup|1/k>=1>.
  </proof>

  <subsection|Proof of the moment recurrence>

  The map <math|\<cal-T\><around|[|y|]>\<assign\><Imu><around|(|P+Q*y+R*y<rsup|2>|)>>
  is a contraction on <math|C*<around|[|0,T<rsub|0>|]>> for
  <math|T<rsub|0><rsup|\<mu\>>> sufficiently small. Substituting the Müntz
  ansatz <math|y=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
  and applying the eigenvalue action of Lemma<nbsp><reference|lem:psi_eig> to
  match coefficients of <math|t<rsup|<around|(|k+1|)>*\<mu\>>>
  yields<nbsp><eqref|eq:a0> at <math|k=0> and<nbsp><eqref|eq:ak> for
  <math|k\<ge\>1>.

  <subsection|Wheeler's algorithm and the Padé connection>

  <\definition>
    [Quasi-definiteness]<label|def:quasidef> The sequence
    <math|<around|{|a<around|(|k,u|)>|}>> is <em|quasi-definite> if the
    Hankel determinants <math|H<rsub|n><around|(|u|)>\<assign\>det
    <around|(|a<around|(|i+j,u|)>|)><rsub|0\<le\>i,j\<le\>n>> satisfy
    <math|H<rsub|n><around|(|u|)>\<ne\>0> for all <math|n\<ge\>0>.
  </definition>

  <\theorem>
    [Wheeler<nbsp><cite|Wheeler>]<label|thm:wheeler> Under
    quasi-definiteness, <math|\<sigma\><around|(|k,k|)>\<ne\>0> for all
    <math|k>, and the polynomials <math|\<pi\><rsub|k>> produced
    by<nbsp><eqref|eq:pi_rec> satisfy

    <\equation>
      <label|eq:wheeler_norm><big|int>\<pi\><rsub|j>*\<pi\><rsub|k>*<space|0.17em>d*\<lambda\>=\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><around|(|i|)>
    </equation>
  </theorem>

  <\proof>
    Set <math|<wide|\<sigma\>|~><around|(|k,\<ell\>|)>\<assign\><big|int>\<pi\><rsub|k>*x<rsup|\<ell\>>*<space|0.17em>d*\<lambda\>>.
    This matches <math|\<sigma\>> in initial data and recurrence, so they
    coincide. Induction shows <math|\<pi\><rsub|k>\<perp\><around|{|1,\<ldots\>,x<rsup|k-1>|}>>,
    giving <math|\<sigma\><around|(|k,\<ell\>|)>=0> for
    <math|\<ell\>\<less\>k> and <math|\<sigma\><around|(|k,k|)>\<gtr\>0> by
    quasi-definiteness. The norm formula follows from
    <math|<around|\<langle\>|\<pi\><rsub|k>,\<pi\><rsub|k>|\<rangle\>>=\<beta\><around|(|k|)><around|\<langle\>|\<pi\><rsub|k-1>,\<pi\><rsub|k-1>|\<rangle\>>>.
  </proof>

  <\theorem>
    [Gragg\UPadé connection<nbsp><cite|Gragg>]<label|thm:gragg> Under
    quasi-definiteness, <math|D<rsub|M><around|(|z|)>=z<rsup|M>*\<pi\><rsub|M><around|(|z<rsup|-1>|)>>
    and the pair <math|<around|(|N<rsub|M>,D<rsub|M>|)>> defined in
    Step<nbsp>3 is the <math|<around|[|M-1/M|]>> Padé approximant of
    <math|A<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*z<rsup|k>>
    at <math|z=0>.
  </theorem>

  <\theorem>
    [Spectral identification]<label|thm:JM_spectrum> Under
    quasi-definiteness:

    <\enumerate>
      <item>The eigenvalues of <math|J<rsub|M>> are exactly the zeros of
      <math|\<pi\><rsub|M>>, hence the reciprocals of the zeros of
      <math|D<rsub|M><around|(|z|)>=z<rsup|M>*\<pi\><rsub|M><around|(|z<rsup|-1>|)>>.

      <item>For each eigenvalue <math|\<lambda\>> of <math|J<rsub|M>>, the
      corresponding right eigenvector is <math|v<around|(|\<lambda\>|)>=<around|(|P<rsub|0><around|(|\<lambda\>|)>,\<ldots\>,P<rsub|M-1><around|(|\<lambda\>|)>|)><rsup|\<top\>>>
      and the defect equation<nbsp><eqref|eq:JM_defect> holds.

      <item>As <math|M\<to\>\<infty\>>, the empirical eigenvalue measure
      <math|\<nu\><rsub|M>\<assign\>M<rsup|-1>*<big|sum><rsub|\<lambda\>\<in\><math-up|spec><around|(|J<rsub|M>|)>>\<delta\><rsub|\<lambda\>>>
      converges weak-<math|\<ast\>> to the equilibrium measure
      <math|\<nu\><rsub|K<rsub|A>>> of the Stahl compact
      <math|K<rsub|A><around|(|u|)>>.
    </enumerate>
  </theorem>

  <\proof>
    (1) By the determinantal identity <math|P<rsub|k><around|(|\<lambda\>|)>=det
    <around|(|\<lambda\>*I<rsub|k>-<wide|J|~><rsub|k>|)>/<big|prod><rsub|i=2><rsup|k><sqrt|\<gamma\><rsub|i>>>,
    zeros of <math|\<pi\><rsub|M>> coincide with
    <math|<math-up|spec><around|(|J<rsub|M>|)>>; the identification
    <math|D<rsub|M><around|(|z|)>=z<rsup|M>*\<pi\><rsub|M><around|(|z<rsup|-1>|)>>
    gives the reciprocal relationship. (2) Direct substitution into
    <math|J<rsub|M>> at rows <math|k\<less\>M-1> yields
    <math|<around|(|J<rsub|M>*v<around|(|\<lambda\>|)>|)><rsub|k>=\<lambda\>*P<rsub|k><around|(|\<lambda\>|)>>
    by the three-term recurrence; at row <math|M-1> the missing
    <math|P<rsub|M><around|(|\<lambda\>|)>> entry contributes
    <math|-P<rsub|M><around|(|\<lambda\>|)>*e<rsub|M>>. (3) The zeros of
    <math|D<rsub|M>> are reciprocals of <math|<math-up|spec><around|(|J<rsub|M>|)>>;
    Theorem<nbsp><reference|thm:stahl_convergence> and<nbsp><eqref|eq:nu_M>
    give weak-<math|\<ast\>> convergence of the zero-counting measure to
    <math|\<nu\><rsub|K<rsub|A>>>, and reciprocation is continuous on
    compacta avoiding the origin.
  </proof>

  <\remark>
    [Spectral measure: constant-coefficient case]<label|rem:spec_meas>When
    <math|P,Q,R\<in\><C>> are constants, <math|A> is meromorphic on
    <math|<C>> with simple poles at <math|\<cal-P\><rsub|A>>, and the
    spectral measure <math|\<mu\><rsub|A>\<assign\><big|sum><rsub|z<rsup|\<ast\>>\<in\>\<cal-P\><rsub|A>><math-up|Res><around|(|A,z<rsup|\<ast\>>|)>*<space|0.17em>\<delta\><rsub|z<rsup|\<ast\>>>>
    has moments <math|<Lk><around|[|x<rsup|k>|]>=a<around|(|k|)>>. In this
    setting <math|J<rsub|M>> is the truncated Jacobi operator of
    <math|\<mu\><rsub|A>> in the sense of Stone's theorem, and
    <math|N<rsub|M>/D<rsub|M>> is the rank-<math|M> Stieltjes transform of
    <math|\<mu\><rsub|A>>.
  </remark>

  <section|The Algebraic Quadratic and the Stahl
  Compact><label|sec:algebraic>

  <paragraph|Conventions.> <math|<around|[|z<rsup|k>|]>*b\<assign\>b<rsub|k>>;<space|1em><math|<around|[|z<rsup|k>|]>*<around|(|F\<cdot\>G|)>=<big|sum><rsub|j>f<rsub|j>*g<rsub|k-j>>
  (Cauchy product);<space|1em><math|<around|[|z<rsup|k>|]>*<around|(|F\<odot\>G|)>=f<rsub|k>*g<rsub|k>>
  (Hadamard product).

  <\definition>
    [Auxiliary generating function]<label|def:F> Set
    <math|f*<around|(|0,u|)>\<assign\>P*\<psi\><rsub|0>> and for
    <math|k\<ge\>1>,

    <\equation>
      <label|eq:fk>f*<around|(|k,u|)>\<assign\>Q*<space|0.17em>f*<around|(|k-1,u|)>+R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>f*<around|(|j,u|)>*f*<around|(|\<ell\>,u|)>+P*\<psi\><rsub|k>
    </equation>

    Define <math|F<around|(|z,u|)>\<assign\><big|sum><rsub|k\<ge\>0>f*<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
  </definition>

  <\remark>
    <label|rem:Fdistinct><math|F\<ne\>A>: in<nbsp><eqref|eq:ak> the bracket
    is premultiplied by <math|\<psi\><rsub|k>>; in <eqref|eq:fk> the source
    <math|P*\<psi\><rsub|k>> enters additively. The bridge is the Hadamard
    fixed-point equation<nbsp><eqref|eq:hadamard_fp> of
    Section<nbsp><reference|sec:meromorphy>. At first order:

    <\align>
      <tformat|<table|<row|<cell|a<around|(|1,u|)>>|<cell|=\<psi\><rsub|1>*<around*|(|Q*P*\<psi\><rsub|0>+R*<around|(|P*\<psi\><rsub|0>|)><rsup|2>|)><eq-number><label|eq:a1_witness>>>|<row|<cell|f*<around|(|1,u|)>>|<cell|=Q*P*\<psi\><rsub|0>+R*<around|(|P*\<psi\><rsub|0>|)><rsup|2>+P*\<psi\><rsub|1><eq-number><label|eq:f1_witness>>>>>
    </align>

    which differ as elements of <math|<C><around|[|u|]>> for generic
    <math|P,Q,R,\<mu\>>.
  </remark>

  <\theorem>
    [Algebraic quadratic for <math|F>]<label|thm:quad> <math|F> satisfies

    <\equation>
      <label|eq:quad>z*R*<space|0.17em>F<rsup|2>-<around|(|1-z*Q|)>*<space|0.17em>F+P<space|0.17em><Psimu>=0
    </equation>

    with closed form

    <\equation>
      <label|eq:Fformula>F<around|(|z,u|)>=<frac|<around|(|1-z*Q|)>-<sqrt|<around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu><around|(|z|)>>|2*z*R>
    </equation>
  </theorem>

  <\proof>
    Let <math|G\<assign\>z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>>. One
    checks <math|<around|[|z<rsup|0>|]>*G=0> and
    <math|<around|[|z<rsup|k>|]>*G=0> for <math|k\<ge\>1>
    by<nbsp><eqref|eq:fk>. Expanding the discriminant,
    <math|<sqrt|\<Delta\>>=1-z*<around|(|Q+2*P*R*\<psi\><rsub|0>|)>+O<around|(|z<rsup|2>|)>>,
    shows the minus branch has constant term
    <math|P*\<psi\><rsub|0>=f*<around|(|0,u|)>>, the unique formal
    power-series root since <math|\<partial\><rsub|F>*<around|[|z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>|]>\|<rsub|z=0>=-1>.
  </proof>

  <section|Meromorphic Continuation of <math|A>><label|sec:meromorphy>

  <subsection|Hadamard fixed-point equation>

  <\lemma>
    <label|lem:hadamard>With <math|B<around|[|A|]>\<assign\>P+z*Q*A+z*R*A<rsup|2>>,

    <\equation>
      <label|eq:hadamard_fp>A=<Psimu>\<odot\>B<around|[|A|]>
    </equation>
  </lemma>

  <\proof>
    <math|<around|[|z<rsup|0>|]>*B<around|[|A|]>=P> gives
    <math|\<psi\><rsub|0>*P=a<around|(|0|)>>. For <math|k\<ge\>1>,
    <math|<around|[|z<rsup|k>|]>*B<around|[|A|]>=Q*<space|0.17em>a*<around|(|k-1|)>+R*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j|)>*a<around|(|\<ell\>|)>>,
    and multiplication by <math|\<psi\><rsub|k>> recovers
    <math|a<around|(|k|)>> by<nbsp><eqref|eq:ak>.
  </proof>

  <\remark>
    The Hadamard equation <math|A=<Psimu>\<odot\>B<around|[|A|]>> is not an
    independent construction: it is the coefficient-level restatement of the
    recurrence<nbsp><eqref|eq:ak>, written in generating-function language so
    that the Mellin\UBarnes machinery below can act on it. Its sole role is
    to carry meromorphic continuation from <math|F> to <math|A> via the
    self-consistent fixed-point argument of
    Theorem<nbsp><reference|thm:Acont>.
  </remark>

  <subsection|Mellin transform of <math|<Psimu>>>

  <\lemma>
    [Mellin transform]<label|lem:mellin_psi> For
    <math|0\<less\>\<Re\>*s\<less\>1>,

    <\equation>
      <label|eq:mellin_psi><big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*<space|0.17em>x<rsup|s-1>*<space|0.17em>d*x=\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>*<frac|\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>=:M<rsub|<Psimu>><around|(|s|)>
    </equation>

    <math|M<rsub|<Psimu>>> extends meromorphically to <math|<C>> with poles
    at <math|<Z><rsub|\<le\>0>>, <math|<Z><rsub|\<ge\>1>>, and
    <math|<around|(|1+m|)>/\<mu\>> for <math|m\<ge\>0>. For
    <math|\<mu\>\<in\><around|(|0,1|)>> the lattice
    <math|<around|{|<around|(|1+m|)>/\<mu\>|}>> survives uncancelled.
  </lemma>

  <\proof>
    Write <math|<Psimu><around|(|-x|)>=<big|sum><rsub|k\<ge\>0><around|(|-x|)><rsup|k>*\<varphi\><around|(|k|)>/k!>
    with <math|\<varphi\><around|(|k|)>=k!<space|0.17em>\<psi\><rsub|k>>. The
    entire interpolation <math|\<varphi\><around|(|s|)>=\<Gamma\>*<around|(|s+1|)>*\<Gamma\>*<around|(|s*\<mu\>+1|)>/\<Gamma\>*<around|(|s*\<mu\>+\<mu\>+1|)>>
    satisfies, by Stirling on a vertical line <math|\<Re\>*s=\<sigma\>>,

    <\equation>
      <around|\||\<varphi\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>\<sim\>C*<around|(|\<sigma\>,\<mu\>|)><space|0.17em><around|\||\<tau\>|\|><rsup|\<sigma\>+\<mu\>*\<sigma\>-\<mu\>+1/2>*e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>>*<space|1em><around|(|<around|\||\<tau\>|\|>\<to\>\<infty\>|)>
    </equation>

    The exponential rate <math|\<pi\>/2\<less\>\<pi\>> satisfies Hardy's
    growth condition<nbsp><cite|Hardy>, and Ramanujan's master theorem gives
    <math|<big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*x<rsup|s-1>*d*x=\<Gamma\><around|(|s|)>*\<varphi\>*<around|(|-s|)>>.
    The cancellation analysis between numerator and denominator poles is
    recorded in the statement.
  </proof>

  <subsection|Mellin\UBarnes realisation>

  <\lemma>
    <label|lem:mb>Let <math|G<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>g<rsub|k><around|(|u|)>*z<rsup|k>>
    be holomorphic in <math|<around|\||z|\|>\<less\>\<rho\>> with
    Ramanujan-normalised entire interpolation
    <math|<wide|G|^><rsub|R><around|(|s,u|)>\<assign\><wide|G|^><around|(|s,u|)>/\<Gamma\>*<around|(|s+1|)>>
    satisfying the Gevrey-1 bound

    <\equation>
      <label|eq:gevrey1><around|\||<wide|G|^><around|(|\<sigma\>+i*\<tau\>,u|)>|\|>\<le\>K<rsub|G><rprime|'>*<space|0.17em>C<rsub|G><rsup|<around|\||\<sigma\>|\|>+1>*<space|0.17em><around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>+1|)>|\|>
    </equation>

    Fix <math|c\<in\><around|(|0,1|)>> avoiding poles of
    <math|M<rsub|<Psimu>>>. For <math|<around|\||arg
    <around|(|-z|)>|\|>\<less\>\<pi\>/2> and
    <math|<around|\||z|\|>\<less\>min <around|(|1,\<rho\>|)>>,

    <\equation>
      <label|eq:mb_formula><around|(|<Psimu>\<odot\>G|)><around|(|z,u|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>M<rsub|<Psimu>><around|(|s|)>*<space|0.17em><wide|G|^><rsub|R><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>*<space|0.17em>d*s
    </equation>

    and the integral continues meromorphically to <math|<wide|X|~>> minus the
    projected pole set of <math|M<rsub|<Psimu>>*<wide|G|^><rsub|R>>.
  </lemma>

  <\proof>
    Closing the contour left, the residue of <math|\<Gamma\><around|(|s|)>>
    at <math|s=-k> is <math|<around|(|-1|)><rsup|k>/k>!; writing <math|>

    <\equation>
      M<rsub|<Psimu>><around|(|s|)>=\<Gamma\><around|(|s|)>*H<around|(|s|)>
    </equation>

    \ with\ 

    <\equation>
      H<around|(|s|)>=\<Gamma\>*<around|(|1-s|)>*\<Gamma\>*<around|(|1-s*\<mu\>|)>/\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>
    </equation>

    one has\ 

    <\equation>
      H*<around|(|-k|)>=k!<space|0.17em>\<psi\><rsub|k>
    </equation>

    <\equation>
      <wide|G|^><rsub|R><around|(|k,u|)>=g<rsub|k><around|(|u|)>
    </equation>

    <\equation>
      <around|(|-z|)><rsup|-s>\|<rsub|s=-k>=<around|(|-1|)><rsup|k>*z<rsup|k>
    </equation>

    , giving <math|>

    <\equation>
      <math-up|Res><rsub|s=-k><around|[|<space|0.17em>\<cdots\><space|0.17em>|]>=\<psi\><rsub|k>*g<rsub|k><around|(|u|)>*z<rsup|k>
    </equation>

    . Summing over <math|k\<ge\>0> recovers <math|<Psimu>\<odot\>G>.
    Continuation to <math|<wide|X|~>> is by the identity principle.
  </proof>

  <subsection|Stahl compacts and meromorphic continuation>

  <\lemma>
    [Stahl compact for <math|F>]<label|lem:stahl_F> There is a unique compact
    <math|K<rsub|F><around|(|u|)>\<supseteq\>K<rsub|\<Psi\>>> of minimal
    logarithmic capacity outside which <math|<sqrt|\<Delta\><rsub|F>>>, hence
    <math|F>, is single-valued meromorphic on <math|<wide|X|~>>, where
    <math|\<Delta\><rsub|F>=<around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu>>
    and <math|K<rsub|\<Psi\>>> is the projected pole set of
    <math|M<rsub|<Psimu>>>
  </lemma>

  <\theorem>
    [Meromorphic continuation of <math|A>]<label|thm:Acont> Under
    quasi-definiteness, <math|A> is meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>> with
    <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1 (Gevrey-1 bound).> Set
    <math|C<rsub|0>=\<psi\><rsub|0>=1/\<Gamma\>*<around|(|\<mu\>+1|)>>,
    <math|M<rsub|P>=<around|\||P|\|>>, <math|M<rsub|Q>=<around|\||Q|\|>>,
    <math|M<rsub|R>=<around|\||R|\|>>,

    <\equation>
      K<rsub|G>\<assign\>C<rsub|0>*max <around|(|M<rsub|P>,1|)>
    </equation>

    <\equation>
      C<rsub|G>\<assign\>C<rsub|0>*<around|(|M<rsub|Q>+2*K<rsub|G>*M<rsub|R>|)>+1
    </equation>

    Induction using\ 

    <\equation>
      <big|sum><rsub|j+\<ell\>=n>j!<space|0.17em>\<ell\>!\<le\><around|(|n+1|)>!
    </equation>

    \ and\ 

    <\equation>
      <frac|C<rsub|0>*<around|(|M<rsub|Q>+K<rsub|G>*M<rsub|R>|)>|C<rsub|G>>\<less\>1
    </equation>

    \ (by construction of <math|C<rsub|G>>) establishes\ 

    <\equation>
      <around|\||a<around|(|k,u|)>|\|>\<le\>K<rsub|G>*C<rsub|G><rsup|k>*k!
    </equation>

    ; a parallel bound

    <\equation>
      <around|\||g<rsub|k><around|(|u|)>|\|>\<le\>K<rsub|G><rprime|''>*C<rsub|G><rsup|k+1>*k!
    </equation>

    \ follows from the defining recurrence of <math|f<around|(|k|)>>.

    <with|font-series|bold|Step 2 (Cauchy interpolation).> The Cauchy
    integral\ 

    <\equation>
      <wide|G|^><around|(|s,u|)>\<assign\><big|oint><rsub|<around|\||z|\|>=r>G<around|(|z,u|)>*z<rsup|-s-1>*\<Gamma\>*<around|(|s+1|)>*d*z/<around|(|2*\<pi\>*i|)>
    </equation>

    \ satisfies the Gevrey-1 bound<nbsp><eqref|eq:gevrey1> via the
    Phragmén\ULindelöf principle in each vertical strip. Carlson's theorem
    guarantees uniqueness as the entire interpolation of
    <math|<around|{|k!<space|0.17em>g<rsub|k>|}><rsub|k\<ge\>0>> of
    exponential type <math|\<less\>\<pi\>>.

    <with|font-series|bold|Step 3 (Mellin\UBarnes).>
    Lemma<nbsp><reference|lem:mb> applies to <math|G=B<around|[|A|]>> and
    yields the meromorphic continuation of <math|A=<Psimu>\<odot\>G> to
    <math|<wide|X|~>\<setminus\><around|(|K<rsub|\<Psi\>>\<cup\>S<rsub|G>|)>>.

    <with|font-series|bold|Step 4 (Self-consistent fixed point).> The map
    <math|\<Phi\>:A\<mapsto\><Psimu>\<odot\>B<around|[|A|]>> sends the space
    <math|\<cal-M\><around|(|K|)>> of formal series with meromorphic
    continuation on <math|<wide|X|~>\<setminus\>K> to itself. The difference
    <math|A-F> satisfies a linear inhomogeneous functional equation with
    forcing meromorphic on <math|<wide|X|~>\<setminus\>K<rsub|F>>
    (Lemma<nbsp><reference|lem:branch_transfer>), so
    <math|A\<in\>\<cal-M\><around|(|K<rsub|F>|)>>. The minimal compact
    <math|K<rsub|A>\<subseteq\>K<rsub|F>> exists by
    Theorem<nbsp><reference|thm:stahl_extremal>.
  </proof>

  <\lemma>
    [Branch transfer]<label|lem:branch_transfer> The branch locus of <math|A>
    is contained in the branch locus of <math|F> together with
    <math|K<rsub|\<Psi\>>>.
  </lemma>

  <\proof>
    Subtracting the <math|f<around|(|k|)>> recurrence<nbsp><eqref|eq:fk> from
    the <math|a<around|(|k|)>> recurrence<nbsp><eqref|eq:ak> gives a linear
    inhomogeneous functional equation for <math|A-F> in
    <math|\<cal-K\><around|(|<Psimu>|)>> with forcing meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|F>>. The analytic implicit function
    theorem applies wherever <math|2*z*R*F-<around|(|1-z*Q|)>\<ne\>0>, whose
    zero set lies in <math|K<rsub|F>>, giving a unique meromorphic <math|A-F>
    on <math|<wide|X|~>\<setminus\>K<rsub|F>>.
  </proof>

  <section|The Fractional Riccati\UMüntz\UPadé Theorem>

  <\theorem>
    [Fractional Riccati\UMüntz\UPadé theorem]<label|thm:FRMP> Under
    quasi-definiteness, the approximant <math|y<rsub|M><around|(|t,u|)>=t<rsup|\<mu\>>*N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>/D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>>
    satisfies

    <\equation>
      <label|eq:FRMP_limit>y<around|(|t,u|)>=lim<rsub|M\<to\>\<infty\>>
      y<rsub|M><around|(|t,u|)>
    </equation>

    in logarithmic capacity on compact subsets of the
    <math|t>-universal-cover preimage of <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>.
  </theorem>

  <\proof>
    <math|y<around|(|t,u|)>=t<rsup|\<mu\>>*A<around|(|t<rsup|\<mu\>>,u|)>> by
    Theorem<nbsp><reference|thm:Muntz>. The denominator sequences for both
    <math|<around|[|M-1/M|]>> and <math|<around|[|M/M|]>> approximants of
    <math|A> are identical (both are <math|<around|{|\<pi\><rsub|M>|}>>);
    Theorem<nbsp><reference|thm:stahl_convergence> gives
    <math|N<rsub|M>/D<rsub|M>\<to\>A> in capacity on compacta of
    <math|<wide|X|~>\<setminus\>K<rsub|A>>. The map
    <math|t\<mapsto\>t<rsup|\<mu\>>> is a <math|C<rsup|1>> diffeomorphism on
    the principal-branch sector with capacity-transformation identity
    <math|<cpct|<around|{|t:t<rsup|\<mu\>>\<in\>K|}>>=<cpct|K><rsup|1/\<mu\>>>
    (Ransford<nbsp><cite-detail|Ransford|Thm.<nbsp>5.2.5>), transferring
    convergence sheetwise to the <math|t>-plane.
  </proof>

  <\lemma>
    [No real poles]<label|lem:no_real_poles> In the constant-coefficient case
    <math|P,Q,R\<in\><C>>, <math|R\<ne\>0>, the generating function
    <math|A<around|(|z|)>> has no poles on <math|<around|(|0,\<infty\>|)>>.
  </lemma>

  <\proof>
    Each pole <math|z<rsup|\<ast\>>> of <math|A> is simple with residue
    <math|<math-up|Res><around|(|A,z<rsup|\<ast\>>|)>=-<around|(|z<rsup|\<ast\>>|)><rsup|<around|(|\<mu\>-1|)>/\<mu\>>/<around|(|R*\<mu\>|)>>.
    For <math|z<rsup|\<ast\>>\<in\><around|(|0,\<infty\>|)>> this is nonzero,
    but the Volterra fixed point is holomorphic on any compact real interval
    where it converges, giving a contradiction. Hence no real poles exist.
  </proof>

  <\corollary>
    [Uniform convergence on <math|\<bbb-R\><rsub|+>>]<label|cor:uniform> In
    the constant-coefficient case, for every compact
    <math|<around|[|0,T|]>\<subset\>\<bbb-R\><rsub|+>>,

    <\equation>
      <label|eq:uniform_conv>sup<rsub|t\<in\><around|[|0,T|]>><around*|\||y<around|(|t|)>-y<rsub|M><around|(|t|)>|\|><space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as
      >M\<to\>\<infty\>.
    </equation>
  </corollary>

  <\proof>
    By Lemma<nbsp><reference|lem:no_real_poles>,
    <math|\<delta\>\<assign\><math-up|dist><around|(|<around|[|0,T|]>,\<cal-P\><rsub|A>|)>\<gtr\>0>.
    On <math|U<rsub|\<delta\>>\<assign\><around|{|z\<in\><C>:<math-up|dist><around|(|z,<around|[|0,T|]>|)>\<less\>\<delta\>/2|}>>,
    <math|A> is holomorphic and bounded. Convergence in capacity on
    <math|U<rsub|\<delta\>>> (Theorem<nbsp><reference|thm:stahl_convergence>)
    implies uniform convergence on <math|<around|[|0,T|]>>: the capacity-zero
    exceptional sets cannot intersect <math|<around|[|0,T|]>> for all
    sufficiently large <math|M>, and a normal-families bound finishes the
    argument. The substitution <math|z=t<rsup|\<mu\>>> transfers uniform
    convergence from <math|<around|[|0,T<rsup|\<mu\>>|]>> to
    <math|<around|[|0,T|]>>.
  </proof>

  <section|A Direct Proof of Stahl's Theorem for the Generic Two-Valued Class
  over <math|<C><around|(|z,<Psimu>|)>>><label|app:stahl>

  This appendix proves Stahl's extremal-domain and convergence-in-capacity
  theorems for the class <math|\<cal-A\>> of functions <math|\<Phi\>> on
  <math|<wide|X|~>> (the universal cover of
  <math|<C>\<setminus\><around|{|0|}>> minus a finite set) satisfying:
  <math|\<Phi\>> is two-valued algebraic over
  <math|\<cal-K\>\<assign\><C><around|(|u|)><around|(|z,<Psimu><around|(|z|)>|)>>,
  generically irreducible; the discriminant
  <math|\<Delta\><rsub|\<Phi\>>\<in\>\<cal-K\>> is meromorphic on
  <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>> with isolated zeros and poles;
  <math|\<Phi\>> is holomorphic at <math|z=0>. Both <math|F>
  from<nbsp><eqref|eq:Fformula> and <math|A> from
  Theorem<nbsp><reference|thm:Acont> belong to <math|\<cal-A\>>.

  <subsection|Logarithmic capacity>

  <\align>
    <tformat|<table|<row|<cell|I<around|[|\<nu\>|]>>|<cell|\<assign\><big|iint>log
    <frac|1|<around|\||z-w|\|>>*<space|0.17em>d*\<nu\><around|(|z|)>*<space|0.17em>d*\<nu\><around|(|w|)><eq-number><label|eq:energy_def>>>|<row|<cell|<cpct|K>>|<cell|\<assign\>e<rsup|-inf<rsub|\<nu\>>
    I<around|[|\<nu\>|]>><eq-number><label|eq:cap_def>>>>>
  </align>

  The infimum is attained by a unique equilibrium measure
  <math|\<nu\><rsub|K>> when <math|<cpct|K>\<gtr\>0>.

  <\lemma>
    [Monotonicity]<label|lem:cap_sub> <math|<cpct|K<rsub|1>\<cup\>K<rsub|2>>\<ge\>max
    <around|(|<cpct|K<rsub|1>>,<cpct|K<rsub|2>>|)>>.
  </lemma>

  <subsection|Extremal domain>

  <\theorem>
    [Extremal domain]<label|thm:stahl_extremal> Let
    <math|\<Phi\>\<in\>\<cal-A\>> with branch locus contained in
    <math|K<rsub|0>\<supseteq\>K<rsub|\<Psi\>>>. There exists a unique
    compact <math|K<rsub|\<Phi\>>> with <math|K<rsub|\<Psi\>>\<subseteq\>K<rsub|\<Phi\>>\<subseteq\>K<rsub|0>>
    of minimal logarithmic capacity outside which <math|\<Phi\>> is
    single-valued meromorphic on <math|<wide|X|~>>.
  </theorem>

  <\proof>
    Let <math|\<cal-S\>> be the family of admissible compacts.
    <math|\<cal-S\>> is nonempty and closed under directed intersections by
    the identity principle. The capacity functional is upper semicontinuous;
    Zorn's lemma produces a minimal element <math|K<rsub|\<Phi\>>>.
    Uniqueness: if <math|K<rsub|\<Phi\>>> and
    <math|K<rsub|\<Phi\>><rprime|'>> both minimize capacity, their
    intersection lies in <math|\<cal-S\>> and the identity principle glues
    the two single-valued continuations, giving
    <math|<cpct|K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>>\<le\>min
    <around|(|<cpct|K<rsub|\<Phi\>>>,<cpct|K<rsub|\<Phi\>><rprime|'>>|)>>
    with equality forced by minimality; Stahl's <math|S>-property then yields
    <math|K<rsub|\<Phi\>>=K<rsub|\<Phi\>><rprime|'>>.
  </proof>

  <subsection|Convergence in capacity>

  <\theorem>
    [Convergence in capacity]<label|thm:stahl_convergence> Let
    <math|\<Phi\>\<in\>\<cal-A\>> with extremal compact
    <math|K<rsub|\<Phi\>>> and diagonal Padé sequence
    <math|<around|{|N<rsub|M>/D<rsub|M>|}>> built from the Taylor series of
    <math|\<Phi\>> at <math|z=0>. Then <math|N<rsub|M>/D<rsub|M>\<to\>\<Phi\>>
    in logarithmic capacity on every compact subset of
    <math|<wide|X|~>\<setminus\>K<rsub|\<Phi\>>>.
  </theorem>

  <\proof>
    The zero-counting measure

    <\equation>
      <label|eq:nu_M>\<nu\><rsub|M>\<assign\>M<rsup|-1>*<big|sum><rsub|D<rsub|M><around|(|z|)>=0>\<delta\><rsub|z>
    </equation>

    converges weak-<math|\<ast\>> to the equilibrium measure
    <math|\<nu\><rsub|K<rsub|\<Phi\>>>>.

    <em|Step 1 (Hermite's formula).>

    <\equation*>
      \<Phi\>-R<rsub|M>=<frac|\<Pi\><rsub|M><around|(|z|)>|D<rsub|M><around|(|z|)><rsup|2>>\<cdot\><frac|1|2*\<pi\>*i>*<big|oint><rsub|\<gamma\>><frac|D<rsub|M><around|(|\<zeta\>|)><rsup|2>*<space|0.17em>\<Phi\><around|(|\<zeta\>|)>|\<Pi\><rsub|M><around|(|\<zeta\>|)>*<around|(|\<zeta\>-z|)>>*<space|0.17em>d*\<zeta\>,
    </equation*>

    where <math|\<gamma\>> encircles <math|K<rsub|\<Phi\>>> and
    <math|\<Pi\><rsub|M>> is a monic polynomial of degree <math|M> unrelated
    to the orthogonal polynomials <math|P<rsub|M>>.

    <em|Step 2 (Capacity estimate).> <math|<around|\||D<rsub|M><around|(|z|)>|\|><rsup|1/M>\<to\>e<rsup|g<around|(|z,K<rsub|\<Phi\>>|)>><cpct|K<rsub|\<Phi\>>>>
    in capacity (Stahl's main lemma<nbsp><cite|StahlExtremal|StahlExtremalII>).

    <em|Step 3 (Vanishing in capacity).> <math|<around|\||\<Phi\><around|(|z|)>-R<rsub|M><around|(|z|)>|\|><rsup|1/<around|(|2*M|)>>\<to\>e<rsup|-g<around|(|z,K<rsub|\<Phi\>>|)>>\<less\>1>
    off <math|K<rsub|\<Phi\>>>, giving exponential convergence in capacity.
  </proof>

  <subsection|Absence of Froissart doublets on <math|\<bbb-R\><rsub|+>>>

  Froissart doublets are near-cancelling pole\Uzero pairs of Padé
  approximants with no counterpart in the approximated function. They do not
  arise here because the residues of <math|A> at its poles are nonzero and
  computable, preventing any silent cancellation on <math|\<bbb-R\><rsub|+>>.

  <\lemma>
    [No Froissart doublets]<label|lem:no_froissart> In the
    constant-coefficient case, no pole of any <math|D<rsub|M>> on
    <math|\<bbb-R\><rsub|+>> can cancel silently against a zero of
    <math|N<rsub|M>> on <math|\<bbb-R\><rsub|+>>.
  </lemma>

  <\proof>
    By Lemma<nbsp><reference|lem:no_real_poles>, <math|A> has no poles on
    <math|<around|(|0,\<infty\>|)>>. A Froissart doublet at
    <math|z<rsup|\<ast\>>\<in\><around|(|0,\<infty\>|)>> would require a pole
    of <math|D<rsub|M>> at <math|z<rsup|\<ast\>>> paired with a zero of
    <math|N<rsub|M>> at <math|z<rsup|\<ast\>>>; but the residue formula
    <math|<math-up|Res><around|(|A,z<rsup|\<ast\>>|)>=-<around|(|z<rsup|\<ast\>>|)><rsup|<around|(|\<mu\>-1|)>/\<mu\>>/<around|(|R*\<mu\>|)>\<ne\>0>
    means any such pole in the approximant is genuine and cannot be zeroed
    out in the numerator consistently with the moment-matching condition.
  </proof>

  <\thebibliography|9>
    <bibitem|SKM>S.<nbsp>G.<nbsp>Samko, A.<nbsp>A.<nbsp>Kilbas,
    O.<nbsp>I.<nbsp>Marichev, <em|Fractional Integrals and Derivatives>,
    Gordon and Breach, 1993.

    <bibitem|StahlExtremal>H.<nbsp>Stahl, <em|Extremal domains associated
    with an analytic function<nbsp>I>, Constr. Approx.
    <with|font-series|bold|1> (1985), 89\U110.

    <bibitem|StahlExtremalII>H.<nbsp>Stahl, <em|Extremal domains<nbsp>II>,
    Constr. Approx. <with|font-series|bold|1> (1985), 111\U137.

    <bibitem|StahlConvergence>H.<nbsp>Stahl, <em|Convergence of Padé
    approximants to functions with branch points (preliminary)>, Constr.
    Approx. <with|font-series|bold|4> (1988), 631\U642.

    <bibitem|StahlBranch>H.<nbsp>Stahl, <em|Convergence of Padé approximants
    to functions with branch points>, J.<nbsp>Approx.<nbsp>Theory
    <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|Wheeler>J.<nbsp>C.<nbsp>Wheeler, <em|Modified moments and
    Gaussian quadratures>, Rocky Mountain J.<nbsp>Math.
    <with|font-series|bold|4> (1974), 287\U296.

    <bibitem|Gragg>W.<nbsp>B.<nbsp>Gragg, <em|The Padé table and its relation
    to certain algorithms of numerical analysis>, SIAM Review
    <with|font-series|bold|14> (1972), 1\U62.

    <bibitem|Hardy>G.<nbsp>H.<nbsp>Hardy, <em|Ramanujan: Twelve Lectures on
    Subjects Suggested by His Life and Work>, Cambridge University Press,
    1940; reprinted Chelsea, New York, 1959.

    <bibitem|Ransford>T.<nbsp>Ransford, <em|Potential Theory in the Complex
    Plane>, London Math. Soc. Student Texts <with|font-series|bold|28>,
    Cambridge Univ. Press, 1995.
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
    <associate|app:stahl|<tuple|6|11>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|2.1|5>>
    <associate|auto-11|<tuple|2.2|6>>
    <associate|auto-12|<tuple|2.3|6>>
    <associate|auto-13|<tuple|3|7>>
    <associate|auto-14|<tuple|1|7>>
    <associate|auto-15|<tuple|4|8>>
    <associate|auto-16|<tuple|4.1|8>>
    <associate|auto-17|<tuple|4.2|8>>
    <associate|auto-18|<tuple|4.3|9>>
    <associate|auto-19|<tuple|4.4|9>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-20|<tuple|5|10>>
    <associate|auto-21|<tuple|6|11>>
    <associate|auto-22|<tuple|6.1|11>>
    <associate|auto-23|<tuple|6.2|12>>
    <associate|auto-24|<tuple|6.3|12>>
    <associate|auto-25|<tuple|6.4|12>>
    <associate|auto-26|<tuple|33|13>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1|4>>
    <associate|auto-5|<tuple|2|4>>
    <associate|auto-6|<tuple|3|4>>
    <associate|auto-7|<tuple|1.3|4>>
    <associate|auto-8|<tuple|1.4|4>>
    <associate|auto-9|<tuple|2|5>>
    <associate|bib-Gragg|<tuple|Gragg|13>>
    <associate|bib-Hardy|<tuple|Hardy|13>>
    <associate|bib-Ransford|<tuple|Ransford|13>>
    <associate|bib-SKM|<tuple|SKM|13>>
    <associate|bib-StahlBranch|<tuple|StahlBranch|13>>
    <associate|bib-StahlConvergence|<tuple|StahlConvergence|13>>
    <associate|bib-StahlExtremal|<tuple|StahlExtremal|13>>
    <associate|bib-StahlExtremalII|<tuple|StahlExtremalII|13>>
    <associate|bib-Wheeler|<tuple|Wheeler|13>>
    <associate|cor:uniform|<tuple|29|11>>
    <associate|def:F|<tuple|17|7>>
    <associate|def:FW|<tuple|1|2>>
    <associate|def:RL|<tuple|6|5>>
    <associate|def:fRic|<tuple|7|5>>
    <associate|def:psi|<tuple|2|3>>
    <associate|def:quasidef|<tuple|12|6>>
    <associate|eq:DM_def|<tuple|18|4>>
    <associate|eq:FRMP_limit|<tuple|56|10>>
    <associate|eq:FW_def|<tuple|4|2>>
    <associate|eq:Fformula|<tuple|37|8>>
    <associate|eq:JM_def|<tuple|20|4>>
    <associate|eq:JM_defect|<tuple|22|5>>
    <associate|eq:Psi_def|<tuple|5|3>>
    <associate|eq:RL_der|<tuple|27|5>>
    <associate|eq:RL_int|<tuple|26|5>>
    <associate|eq:Volt|<tuple|29|5>>
    <associate|eq:a0|<tuple|7|3>>
    <associate|eq:a1_witness|<tuple|34|7>>
    <associate|eq:ab0|<tuple|13|4>>
    <associate|eq:abs_Psi|<tuple|3|1>>
    <associate|eq:abs_riccati|<tuple|1|1>>
    <associate|eq:abs_solution|<tuple|2|1>>
    <associate|eq:ak|<tuple|8|3>>
    <associate|eq:alpha_k|<tuple|14|4>>
    <associate|eq:beta_k|<tuple|15|4>>
    <associate|eq:cap_def|<tuple|59|11>>
    <associate|eq:energy_def|<tuple|58|11>>
    <associate|eq:f1_witness|<tuple|35|7>>
    <associate|eq:fRic|<tuple|28|5>>
    <associate|eq:fk|<tuple|33|7>>
    <associate|eq:gevrey1|<tuple|41|9>>
    <associate|eq:hadamard_fp|<tuple|38|8>>
    <associate|eq:mb_formula|<tuple|42|9>>
    <associate|eq:mellin_psi|<tuple|39|8>>
    <associate|eq:nu_M|<tuple|60|12>>
    <associate|eq:pi_init|<tuple|16|4>>
    <associate|eq:pi_rec|<tuple|17|4>>
    <associate|eq:power_rule|<tuple|30|5>>
    <associate|eq:psi_eig|<tuple|31|6>>
    <associate|eq:quad|<tuple|36|8>>
    <associate|eq:r0_series|<tuple|9|3>>
    <associate|eq:resolvent|<tuple|23|5>>
    <associate|eq:shift_action|<tuple|21|4>>
    <associate|eq:sigma_init1|<tuple|10|4>>
    <associate|eq:sigma_init2|<tuple|11|4>>
    <associate|eq:sigma_rec|<tuple|12|4>>
    <associate|eq:uniform_conv|<tuple|57|11>>
    <associate|eq:wheeler_norm|<tuple|32|6>>
    <associate|eq:yM_def|<tuple|19|4>>
    <associate|ex:r0_oracle|<tuple|5|3>>
    <associate|lem:Psimu_radius|<tuple|11|6>>
    <associate|lem:Volt|<tuple|8|5>>
    <associate|lem:branch_transfer|<tuple|26|10>>
    <associate|lem:cap_sub|<tuple|30|11>>
    <associate|lem:hadamard|<tuple|20|8>>
    <associate|lem:mb|<tuple|23|9>>
    <associate|lem:mellin_psi|<tuple|22|8>>
    <associate|lem:no_froissart|<tuple|33|12>>
    <associate|lem:no_real_poles|<tuple|28|11>>
    <associate|lem:power|<tuple|9|5>>
    <associate|lem:psi_eig|<tuple|10|6>>
    <associate|lem:stahl_F|<tuple|24|9>>
    <associate|rem:Fdistinct|<tuple|18|7>>
    <associate|rem:spec_meas|<tuple|16|7>>
    <associate|sec:algebraic|<tuple|3|7>>
    <associate|sec:algo|<tuple|1|2>>
    <associate|sec:foundations|<tuple|2|5>>
    <associate|sec:meromorphy|<tuple|4|8>>
    <associate|thm:Acont|<tuple|25|9>>
    <associate|thm:FRMP|<tuple|27|10>>
    <associate|thm:JM_spectrum|<tuple|15|7>>
    <associate|thm:Muntz|<tuple|4|3>>
    <associate|thm:gragg|<tuple|14|6>>
    <associate|thm:quad|<tuple|19|8>>
    <associate|thm:stahl_convergence|<tuple|32|12>>
    <associate|thm:stahl_extremal|<tuple|31|12>>
    <associate|thm:wheeler|<tuple|13|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      SKM

      Wheeler

      Gragg

      Hardy

      Ransford

      StahlExtremal

      StahlExtremalII
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Approximant and the Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Step 1: The Fox\UWright
      kernel and the moment recurrence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Step 2: Wheeler's algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|3tab>|Auxiliary array.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|3tab>|Jacobi coefficients.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|3tab>|Orthogonal polynomials.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Step 3: Assembling the
      approximant <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Operator-theoretic picture:
      why the type is <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|<around|[|M-1/M|]>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Foundations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Riemann\ULiouville calculus
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Proof of the moment
      recurrence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Wheeler's algorithm and the
      Padé connection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Algebraic Quadratic and the Stahl Compact>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Conventions.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Meromorphic
      Continuation of <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|A>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Hadamard fixed-point
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Mellin transform of
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<Psi\><rsub|\<mu\>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Mellin\UBarnes realisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|4.4<space|2spc>Stahl compacts and
      meromorphic continuation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Fractional Riccati\UMüntz\UPadé Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>A
      Direct Proof of Stahl's Theorem for the Generic Two-Valued Class over
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<bbb-C\><around|(|z,\<Psi\><rsub|\<mu\>>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Logarithmic capacity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Extremal domain
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|6.3<space|2spc>Convergence in capacity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|6.4<space|2spc>Absence of Froissart
      doublets on <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<bbb-R\><rsub|+>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>