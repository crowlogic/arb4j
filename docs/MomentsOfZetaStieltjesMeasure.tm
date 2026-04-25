<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A closed-form moment expansion for a Stieltjes-type
  measure associated with <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>>|<doc-date|April
  23, 2026>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <abstract-data|<\abstract>
    Let <math|\<theta\><around|(|t|)>> be the Riemann--Siegel theta function
    and set <math|\<Theta\><around|(|t|)>\<assign\>\<theta\><around|(|t|)>+C*t>
    with <math|C\<gtr\><around|\||\<theta\><rprime|'><around|(|0|)>|\|>> so
    that <math|\<Theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is a strictly increasing
    diffeomorphism. For a parameter <math|\<alpha\>\<gtr\>0> define the
    density

    <\equation*>
      h<around|(|t|)><space|0.27em>\<assign\><space|0.27em>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>*<space|0.17em><sqrt|\<Theta\><rprime|'><around|(|t|)>>*<space|0.17em><around|(|1+\<Theta\><around|(|t|)><rsup|2>|)><rsup|-\<alpha\>>*<space|0.17em>e<rsup|<space|0.17em>i*\<Theta\><around|(|t|)>>,
    </equation*>

    and let <math|\<Phi\><rsub|G>> be the complex Borel measure on
    <math|\<bbb-R\>> obtained by pushing <math|h<around|(|t|)>*<space|0.17em>d*t>
    forward along <math|u=\<Theta\><around|(|t|)>>. We give a closed form for
    every moment

    <\equation*>
      \<mu\><rsub|n><space|0.27em>\<assign\><space|0.27em><big|int><rsub|\<bbb-R\>>u<rsup|n>*<space|0.17em>d*\<Phi\><rsub|G><around|(|u|)>
    </equation*>

    as an explicit finite sum in the Taylor coefficients
    <math|\<zeta\><rsub|k>\<assign\>\<zeta\><rsup|<around|(|k|)>><around|(|<tfrac|1|2>|)>>
    and <math|\<Theta\><rsub|2*\<ell\>+1>\<assign\>\<Theta\><rsup|<around|(|2*\<ell\>+1|)>><around|(|0|)>>.
    The closed form is obtained by a single application of the residue /
    Lagrange inversion identity to the substitution
    <math|u=\<Theta\><around|(|t|)>>. We record the first seven moments in
    fully expanded form and discuss cumulants and moment-type consequences.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Setup>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    closed-form moment identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Explicit
    moments for <with|mode|math|n\<le\>7>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Structural
    features> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|3tab|The <with|mode|math|\<zeta\><rsub|n-1>> slot.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|3tab|The leading <with|mode|math|\<alpha\>>-polynomials.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|3tab|Rational <with|mode|math|n>-dependence.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Consequences>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Cumulants
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|5.2<space|2spc>Weighted second moment of
    <with|mode|math|<around|\||\<zeta\>|\|><rsup|2>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|5.3<space|2spc>Moment-generating function and zeros
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|5.4<space|2spc>A Carleman-type question
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Remarks>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Setup>

  Throughout, <math|\<theta\><around|(|t|)>> is the Riemann\USiegel theta
  function,

  <\equation*>
    \<theta\><around|(|t|)><space|0.27em>=<space|0.27em>arg
    \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|log
    \<pi\>|2><space|0.17em>t,
  </equation*>

  and we fix a constant <math|C\<gtr\><around|\||\<theta\><rprime|'><around|(|0|)>|\|>=<around|\||<tfrac|1|2>\<psi\><around|(|<tfrac|1|4>|)>-<tfrac|log
  \<pi\>|2>|\|>> so that

  <\equation*>
    \<Theta\><around|(|t|)><space|0.27em>\<assign\><space|0.27em>\<theta\><around|(|t|)>+C*t
  </equation*>

  satisfies <math|\<Theta\><rprime|'><around|(|t|)>\<gtr\>0> for all
  <math|t\<in\>\<bbb-R\>>. Because <math|\<theta\>> is odd and analytic at
  the origin, <math|\<Theta\>> is odd-plus-linear,

  <\equation*>
    \<Theta\><around|(|t|)><space|0.27em>=<space|0.27em><big|sum><rsub|\<ell\>\<ge\>0><frac|\<Theta\><rsub|2*\<ell\>+1>|<around|(|2*\<ell\>+1|)>!>*<space|0.17em>t<rsup|2*\<ell\>+1>,<space|2em>\<Theta\><rsub|2*\<ell\>+1><space|0.27em>\<assign\><space|0.27em>\<Theta\><rsup|<around|(|2*\<ell\>+1|)>><around|(|0|)>.
  </equation*>

  In particular <math|\<Theta\><rsub|1>=<tfrac|1|2>\<psi\><around|(|<tfrac|1|4>|)>-<tfrac|log
  \<pi\>|2>+C\<gtr\>0>. Let <math|\<alpha\>\<gtr\>0> be a fixed convergence
  parameter.

  <\definition>
    <label|def:PhiG>The <em|<math|G>-measure> associated to <math|\<zeta\>>
    with parameters <math|<around|(|C,\<alpha\>|)>> is the pushforward under
    <math|u=\<Theta\><around|(|t|)>> of the density

    <\equation*>
      h<around|(|t|)>*<space|0.17em>d*t<space|0.27em>=<space|0.27em>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>*<space|0.17em><sqrt|\<Theta\><rprime|'><around|(|t|)>>*<space|0.17em><around|(|1+\<Theta\><around|(|t|)><rsup|2>|)><rsup|-\<alpha\>>*<space|0.17em>e<rsup|<space|0.17em>i*\<Theta\><around|(|t|)>>*<space|0.17em>d*t.
    </equation*>

    Equivalently,

    <\equation*>
      d*\<Phi\><rsub|G><around|(|u|)><space|0.27em>=<space|0.27em><frac|h<around|(|t<around|(|u|)>|)>|\<Theta\><rprime|'><around|(|t<around|(|u|)>|)>>*<space|0.17em>d*u,
    </equation*>

    where <math|t<around|(|u|)>> is the (global real-analytic) inverse of
    <math|\<Theta\>>.
  </definition>

  Since <math|\<Theta\>> is a diffeomorphism, <math|d*\<Phi\><rsub|G>> is a
  well-defined complex measure on <math|\<bbb-R\>> as long as the
  <math|<around|(|1+\<Theta\><rsup|2>|)><rsup|-\<alpha\>>> weight renders the
  density integrable. The <math|n>th moment is

  <\equation*>
    \<mu\><rsub|n><space|0.27em>\<assign\><space|0.27em><big|int><rsub|\<bbb-R\>>u<rsup|n>*<space|0.17em>d*\<Phi\><rsub|G><around|(|u|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>\<Theta\><around|(|t|)><rsup|n>*<space|0.17em>h<around|(|t|)>*<space|0.17em>d*t.
  </equation*>

  <section|The closed-form moment identity>

  <\theorem>
    [Closed form]<label|thm:closed> For every integer <math|n\<ge\>0>,

    <\equation>
      <label|eq:closed><with|font-base-size|10|\<mu\><rsub|n>\<cdot\>\<Theta\><rsub|1><rsup|<space|0.17em>n+<tfrac|1|2>><space|0.27em>=<space|0.27em><around|(|-i|)><rsup|n>*<space|0.17em>n!<space|0.17em><around*|[|t<rsup|n>|]>*<space|-0.17em><around*|{|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>*<space|0.17em><sqrt|<tfrac|\<Theta\><rprime|'><around|(|t|)>|\<Theta\><rsub|1>>>*<space|0.17em>e<rsup|<space|0.17em>i*\<Theta\><around|(|t|)>>*<space|0.17em><around|(|1+\<Theta\><around|(|t|)><rsup|2>|)><rsup|-\<alpha\>><space|0.17em><space|-0.17em><around*|(|<frac|\<Theta\><rsub|1>*<space|0.17em>t|\<Theta\><around|(|t|)>>|)><rsup|<space|-0.17em>n+1>|}>>
    </equation>

    where <math|<around|[|t<rsup|n>|]>> denotes the coefficient of
    <math|t<rsup|n>> in the formal power series obtained by expanding each
    factor at <math|t=0>.
  </theorem>

  <\proof>
    By definition

    <\equation*>
      \<mu\><rsub|n><space|0.27em>=<space|0.27em><big|int>\<Theta\><around|(|t|)><rsup|n>*<space|0.17em>h<around|(|t|)>*<space|0.17em>d*t<space|0.27em>=<space|0.27em><big|int>u<rsup|n>*<space|0.17em>d*\<Phi\><rsub|G><around|(|u|)>,
    </equation*>

    so

    <\equation*>
      \<mu\><rsub|n><space|0.27em>=<space|0.27em><around|(|-i|)><rsup|n>*n!\<cdot\><around*|[|u<rsup|n>|]><wide|\<Phi\><rsub|G>|^><around|(|\<xi\>|)><mid|\|><rsub|\<xi\>\<mapsto\>u>,
    </equation*>

    where we identify <math|\<mu\><rsub|n>> with the coefficients in the
    formal moment-generating expansion <math|<big|sum><rsub|n\<ge\>0>\<mu\><rsub|n>*<around|(|i*u|)><rsup|n>/n!=<big|int>e<rsup|i*u*<space|0.17em>u<rprime|'>>*d*\<Phi\><rsub|G><around|(|u<rprime|'>|)>>,
    viewed as a formal series in <math|u>.

    Working on the level of formal power series near <math|u=0>, write
    <math|F<around|(|u|)>\<assign\>h<around|(|t<around|(|u|)>|)>/\<Theta\><rprime|'><around|(|t<around|(|u|)>|)>>
    so that <math|\<mu\><rsub|n>=<around|(|-i|)><rsup|n>*n!<space|0.17em><around|[|u<rsup|n>|]>*F<around|(|u|)>\<cdot\><around|(|<text|const>|)>>
    up to the factor inherited from the Jacobian. The standard residue
    identity for a local diffeomorphism <math|u=\<Theta\><around|(|t|)>> with
    <math|\<Theta\><around|(|0|)>=0>, <math|\<Theta\><rprime|'><around|(|0|)>\<ne\>0>,
    applied to any formal series <math|G<around|(|u|)>>, gives

    <\equation*>
      <around|[|u<rsup|n>|]>*<space|0.17em>G<around|(|u|)><space|0.27em>=<space|0.27em><Res><rsub|u=0><frac|G<around|(|u|)>|u<rsup|n+1>>*<space|0.17em>d*u<space|0.27em>=<space|0.27em><Res><rsub|t=0><frac|G<around|(|\<Theta\><around|(|t|)>|)>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>|\<Theta\><around|(|t|)><rsup|n+1>>*<space|0.17em>d*t<space|0.27em>=<space|0.27em><around*|[|t<rsup|n>|]>*<space|0.17em>G<around|(|\<Theta\><around|(|t|)>|)>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)><space|0.17em><space|-0.17em><around*|(|<frac|t|\<Theta\><around|(|t|)>>|)><rsup|<space|-0.17em>n+1>.
    </equation*>

    Applying this with <math|G<around|(|u|)><space|0.27em>=<space|0.27em>e<rsup|i*u>*<around|(|1+u<rsup|2>|)><rsup|-\<alpha\>>*<space|0.17em>\<zeta\>*<around|(|<tfrac|1|2>+i*t<around|(|u|)>|)>/<sqrt|\<Theta\><rprime|'><around|(|t<around|(|u|)>|)>>>,
    one finds <math|G<around|(|\<Theta\><around|(|t|)>|)>=e<rsup|i*\<Theta\><around|(|t|)>>*<around|(|1+\<Theta\><around|(|t|)><rsup|2>|)><rsup|-\<alpha\>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>/<sqrt|\<Theta\><rprime|'><around|(|t|)>>>
    and multiplying by <math|\<Theta\><rprime|'><around|(|t|)>> converts the
    <math|1/<sqrt|\<Theta\><rprime|'>>> into
    <math|<sqrt|\<Theta\><rprime|'>>>. Scaling by
    <math|\<Theta\><rsub|1><rsup|n+1/2>> clears denominators and yields
    <eqref|eq:closed>.
  </proof>

  <\remark>
    Formula <eqref|eq:closed> is a finite sum in any concrete use: each
    factor in the braces is a power series in <math|t>, each coefficient is a
    polynomial in <math|\<alpha\>> and in the Taylor coefficients
    <math|\<zeta\><rsub|k>>, <math|\<Theta\><rsub|2*\<ell\>+1>>, and
    <math|<around|[|t<rsup|n>|]>> extracts a single finite combination. In
    particular, the only <math|n>-dependence in the formula is carried by the
    single binomial exponent <math|<around|(|n+1|)>> in
    <math|<around|(|\<Theta\><rsub|1>*t/\<Theta\><around|(|t|)>|)><rsup|n+1>>.
  </remark>

  <section|Explicit moments for <math|n\<le\>7>>

  Let <math|\<zeta\><rsub|k>\<assign\>\<zeta\><rsup|<around|(|k|)>><around|(|<tfrac|1|2>|)>>.
  Expanding <eqref|eq:closed> through <math|n=7> yields:

  <\align*>
    <tformat|<table|<row|<cell|\<mu\><rsub|1>\<cdot\>\<Theta\><rsub|1><rsup|3/2>>|<cell|=\<zeta\><rsub|1>+\<Theta\><rsub|1>*\<zeta\><rsub|0>,>>|<row|<cell|<vspace*|1mm>\<mu\><rsub|2>\<cdot\>\<Theta\><rsub|1><rsup|5/2>>|<cell|=\<zeta\><rsub|2>+2*\<Theta\><rsub|1>*\<zeta\><rsub|1>+<around*|[|<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|\<Theta\><rsub|3>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|0>,>>|<row|<cell|<vspace*|1mm>\<mu\><rsub|3>\<cdot\>\<Theta\><rsub|1><rsup|7/2>>|<cell|=\<zeta\><rsub|3>+3*\<Theta\><rsub|1>*\<zeta\><rsub|2>+<around*|[|3*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|5*\<Theta\><rsub|3>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|1>+<around*|[|<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|3>+<tfrac|3*\<Theta\><rsub|3>|2>|]>*\<zeta\><rsub|0>,>>|<row|<cell|<vspace*|1mm>\<mu\><rsub|4>\<cdot\>\<Theta\><rsub|1><rsup|9/2>>|<cell|=\<zeta\><rsub|4>+4*\<Theta\><rsub|1>*\<zeta\><rsub|3>+<around*|[|6*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|7*\<Theta\><rsub|3>|\<Theta\><rsub|1>>|]>*\<zeta\><rsub|2>+<around*|[|4*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|3>+10*\<Theta\><rsub|3>|]>*\<zeta\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|<around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|4>+3*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|3>+<tfrac|17*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1><rsup|2>>-<tfrac|\<Theta\><rsub|5>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|0>,>>|<row|<cell|<vspace*|1mm>\<mu\><rsub|5>\<cdot\>\<Theta\><rsub|1><rsup|11/2>>|<cell|=\<zeta\><rsub|5>+5*\<Theta\><rsub|1>*\<zeta\><rsub|4>+<around*|[|10*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|15*\<Theta\><rsub|3>|\<Theta\><rsub|1>>|]>*\<zeta\><rsub|3>+<around*|[|10*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|3>+35*\<Theta\><rsub|3>|]>*\<zeta\><rsub|2>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|5*<around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|4>+25*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|3>+<tfrac|145*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1><rsup|2>>-<tfrac|7*\<Theta\><rsub|5>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|<around|(|1+80*\<alpha\>+60*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|5>+5*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>*\<Theta\><rsub|3>+<tfrac|85*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1>>-<tfrac|5*\<Theta\><rsub|5>|2>|]>*\<zeta\><rsub|0>,>>|<row|<cell|<vspace*|1mm>\<mu\><rsub|6>\<cdot\>\<Theta\><rsub|1><rsup|13/2>>|<cell|=\<zeta\><rsub|6>+6*\<Theta\><rsub|1>*\<zeta\><rsub|5>+<around*|[|15*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|55*\<Theta\><rsub|3>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|4>+<around*|[|20*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|3>+90*\<Theta\><rsub|3>|]>*\<zeta\><rsub|3>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|15*<around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|4>+105*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|3>+<tfrac|655*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1><rsup|2>>-<tfrac|27*\<Theta\><rsub|5>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|2>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|6*<around|(|1+80*\<alpha\>+60*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|5>+50*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>*\<Theta\><rsub|3>+<tfrac|435*\<Theta\><rsub|3><rsup|2>|2*\<Theta\><rsub|1>>-21*\<Theta\><rsub|5>|]>*\<zeta\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|<around|(|1+450*\<alpha\>+540*\<alpha\><rsup|2>+120*\<alpha\><rsup|3>|)>*\<Theta\><rsub|1><rsup|6>+<tfrac|15|2><around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|3>*\<Theta\><rsub|3>-<tfrac|15|2><around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|5>|\<nobracket\>>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|<space|1em><phantom|+<around*|[||\<nobracket\>>>+<tfrac|255*<around|(|1+2*\<alpha\>|)>|4>\<Theta\><rsub|3><rsup|2>+<tfrac|865*\<Theta\><rsub|3><rsup|3>|8*\<Theta\><rsub|1><rsup|3>>-<tfrac|97*\<Theta\><rsub|3>*\<Theta\><rsub|5>|4*\<Theta\><rsub|1><rsup|2>>+<tfrac|\<Theta\><rsub|7>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|0>,>>>>
  </align*>

  and

  <\align*>
    <tformat|<table|<row|<cell|\<mu\><rsub|7>\<cdot\>\<Theta\><rsub|1><rsup|15/2>>|<cell|=\<zeta\><rsub|7>+7*\<Theta\><rsub|1>*\<zeta\><rsub|6>+<around*|[|21*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>+<tfrac|91*\<Theta\><rsub|3>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|5>+<around*|[|35*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|3>+<tfrac|385*\<Theta\><rsub|3>|2>|]>*\<zeta\><rsub|4>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|35*<around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|4>+315*<around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|3>+<tfrac|2135*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1><rsup|2>>-<tfrac|77*\<Theta\><rsub|5>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|3>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|21*<around|(|1+80*\<alpha\>+60*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|5>+245*<around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>*\<Theta\><rsub|3>+<tfrac|4585*\<Theta\><rsub|3><rsup|2>|4*\<Theta\><rsub|1>>-<tfrac|189*\<Theta\><rsub|5>|2>|]>*\<zeta\><rsub|2>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|7*<around|(|1+450*\<alpha\>+540*\<alpha\><rsup|2>+120*\<alpha\><rsup|3>|)>*\<Theta\><rsub|1><rsup|6>+<tfrac|175|2><around|(|1+24*\<alpha\>+12*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|3>*\<Theta\><rsub|3>-<tfrac|147|2><around|(|1+2*\<alpha\>|)>*\<Theta\><rsub|1>*\<Theta\><rsub|5>|\<nobracket\>>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|<space|1em><phantom|+<around*|[||\<nobracket\>>>+<tfrac|3045*<around|(|1+2*\<alpha\>|)>|4>\<Theta\><rsub|3><rsup|2>+<tfrac|10325*\<Theta\><rsub|3><rsup|3>|8*\<Theta\><rsub|1><rsup|3>>-<tfrac|1015*\<Theta\><rsub|3>*\<Theta\><rsub|5>|4*\<Theta\><rsub|1><rsup|2>>+<tfrac|9*\<Theta\><rsub|7>|2*\<Theta\><rsub|1>>|]>*\<zeta\><rsub|1>>>|<row|<cell|>|<cell|<space|1em>+<around*|[|<around|(|1+2142*\<alpha\>+2940*\<alpha\><rsup|2>+840*\<alpha\><rsup|3>|)>*\<Theta\><rsub|1><rsup|7>+<tfrac|21|2><around|(|1+80*\<alpha\>+60*\<alpha\><rsup|2>|)>*\<Theta\><rsub|1><rsup|4>*\<Theta\><rsub|3>-<tfrac|35|2><around|(|1+6*\<alpha\>|)>*\<Theta\><rsub|1><rsup|2>*\<Theta\><rsub|5>|\<nobracket\>>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|<space|1em><phantom|+<around*|[||\<nobracket\>>>+<tfrac|595*<around|(|1+6*\<alpha\>|)>|4>\<Theta\><rsub|1>*\<Theta\><rsub|3><rsup|2>+<tfrac|6055*\<Theta\><rsub|3><rsup|3>|8*\<Theta\><rsub|1><rsup|2>>-<tfrac|679*\<Theta\><rsub|3>*\<Theta\><rsub|5>|4*\<Theta\><rsub|1>>+<tfrac|7*\<Theta\><rsub|7>|2>|]>*\<zeta\><rsub|0>.>>>>
  </align*>

  All coefficients were verified by independent computation via Lagrange
  inversion of <math|u=\<Theta\><around|(|t|)>> in symbolic form.

  <section|Structural features>

  <paragraph|The <math|\<zeta\><rsub|n-1>> slot.> The coefficient of
  <math|\<zeta\><rsub|n-1>> in <math|\<mu\><rsub|n>\<cdot\>\<Theta\><rsub|1><rsup|n+1/2>>
  is always <math|n*\<Theta\><rsub|1>>.

  <paragraph|The leading <math|\<alpha\>>-polynomials.> Setting
  <math|\<Theta\><rsub|3>=\<Theta\><rsub|5>=\<Theta\><rsub|7>=\<cdots\>=0> in
  <eqref|eq:closed> gives

  <\equation*>
    \<mu\><rsub|n><rsup|<around|(|0|)>>\<cdot\>\<Theta\><rsub|1><rsup|<space|0.17em>n+<tfrac|1|2>><space|0.27em>=<space|0.27em>n!<big|sum><rsub|m=0><rsup|n><frac|\<zeta\><rsub|m>|m!>*<space|0.17em>\<Theta\><rsub|1><rsup|n-m>*<space|0.17em><big|sum><rsub|q=0><rsup|<around|\<lfloor\>|<around|(|n-m|)>/2|\<rfloor\>>><frac|<around|(|-1|)><rsup|q><binom|-\<alpha\>|q>|<around|(|n-m-2*q|)>!>.
  </equation*>

  The innermost <math|\<alpha\>>-sum, call it
  <math|P<rsub|n-m><around|(|\<alpha\>|)>>, produces the polynomials
  <math|P<rsub|0>=1>, <math|P<rsub|1>=1>, <math|P<rsub|2>=1+2*\<alpha\>>,
  <math|P<rsub|3>=1+6*\<alpha\>>, <math|P<rsub|4>=1+24*\<alpha\>+12*\<alpha\><rsup|2>>,
  <math|P<rsub|5>=1+80*\<alpha\>+60*\<alpha\><rsup|2>>,
  <math|P<rsub|6>=1+450*\<alpha\>+540*\<alpha\><rsup|2>+120*\<alpha\><rsup|3>>,
  <math|P<rsub|7>=1+2142*\<alpha\>+2940*\<alpha\><rsup|2>+840*\<alpha\><rsup|3>>.

  <paragraph|Rational <math|n>-dependence.> The only source of
  <math|n>-dependence in <eqref|eq:closed> is the exponent <math|n+1> in
  <math|<around|(|\<Theta\><rsub|1>*t/\<Theta\><around|(|t|)>|)><rsup|n+1>>;
  hence every <math|n>-polynomial coefficient in the expanded moment is a sum
  of products of generalized binomials <math|<binom|-<around|(|n+1|)>|Q>>
  against universal rationals from the other four factors.

  <section|Consequences>

  <subsection|Cumulants><label|sec:cumulants>

  The logarithm of the moment-generating series of <math|\<Phi\><rsub|G>>
  provides the <em|cumulants> <math|\<kappa\><rsub|n>> via <math|log
  <around|(|1+<big|sum><rsub|n\<ge\>1>\<mu\><rsub|n>*z<rsup|n>/n!|)>=<big|sum><rsub|n\<ge\>1>\<kappa\><rsub|n>*z<rsup|n>/n!>,
  so <math|\<kappa\><rsub|1>=\<mu\><rsub|1>>,
  <math|\<kappa\><rsub|2>=\<mu\><rsub|2>-\<mu\><rsub|1><rsup|2>>,
  <math|\<kappa\><rsub|3>=\<mu\><rsub|3>-3*\<mu\><rsub|2>*\<mu\><rsub|1>+2*\<mu\><rsub|1><rsup|3>>,
  etc. Each <math|\<kappa\><rsub|n>> inherits from
  Theorem<nbsp><reference|thm:closed> a closed finite-sum form in
  <math|\<zeta\><rsub|k>> and <math|\<Theta\><rsub|2*\<ell\>+1>>.

  <subsection|Weighted second moment of <math|<around|\||\<zeta\>|\|><rsup|2>>><label|sec:weighted2>

  The pushforward of <math|<around|\||h<around|(|t|)>|\|><rsup|2>*d*t/\<Theta\><rprime|'><around|(|t|)>>
  under <math|u=\<Theta\>> is a genuine positive measure with moments
  <math|M<rsub|n>\<assign\><big|int>u<rsup|n><around|\||h<around|(|t<around|(|u|)>|)>|\|><rsup|2>/\<Theta\><rprime|'><around|(|t<around|(|u|)>|)>*<space|0.17em>d*u>.
  Setting <math|n=0>,

  <\equation*>
    M<rsub|0><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em><around|(|1+\<Theta\><around|(|t|)><rsup|2>|)><rsup|-2*\<alpha\>>*<space|0.17em>d*t,
  </equation*>

  which is a regularized version of the classical
  <math|<big|int><rsub|-T><rsup|T><around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>*<space|0.17em>d*t\<sim\>T*log
  T>. The closed form of Theorem<nbsp><reference|thm:closed>, applied to
  <math|Z<wide|Z|\<bar\>>> instead of <math|Z>, furnishes an analogous
  explicit expansion for every <math|M<rsub|n>>.

  <subsection|Moment-generating function and zeros>

  The formal series <math|<big|sum><rsub|n\<ge\>0>\<mu\><rsub|n>*z<rsup|n>/n!>
  is the Laplace transform of <math|d*\<Phi\><rsub|G>>. Its zeros in the
  complex plane, pushed back through <math|\<Theta\><rsup|-1>> on the real
  line, parameterize the zeros of <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
  weighted by <math|<sqrt|\<Theta\><rprime|'><around|(|t|)>>*<around|(|1+\<Theta\><rsup|2>|)><rsup|-\<alpha\>>*e<rsup|i*\<Theta\><around|(|t|)>>>.
  Theorem<nbsp><reference|thm:closed> gives every coefficient of this
  generating function in closed form.

  <subsection|A Carleman-type question>

  A moment sequence <math|<around|(|\<mu\><rsub|n>|)>> is determined by its
  measure if <math|<big|sum>\<mu\><rsub|2*n><rsup|-1/<around|(|2*n|)>>=\<infty\>>
  (Carleman's condition). Because every <math|\<mu\><rsub|n>> is now explicit
  in <math|\<zeta\><rsub|k>> and <math|\<Theta\><rsub|2*\<ell\>+1>>, one can
  ask whether the growth rate of <math|\<mu\><rsub|n>> encodes RH. The closed
  form <eqref|eq:closed> gives <math|<around|\||\<mu\><rsub|n>|\|>\<le\>n!\<cdot\>\<Theta\><rsub|1><rsup|-n-1/2>\<cdot\>C<rsub|n>>
  where <math|C<rsub|n>> is a finite sum of absolute values of the listed
  rational-in-<math|\<Theta\><rsub|\<ell\>>> coefficients against
  <math|<around|\||\<zeta\><rsub|k>|\|>>. A precise Carleman / Hamburger
  analysis of these bounds, via the explicit formula above, is left for
  subsequent work.

  <section|Remarks>

  The representation <math|d*\<Phi\><rsub|G>> uses only the boundary values
  <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>, <math|t\<in\>\<bbb-R\>>.
  Formula <eqref|eq:closed> therefore gives, for each <math|n>, a finite
  linear combination of the Taylor data <math|<around|{|\<zeta\><rsup|<around|(|k|)>><around|(|<tfrac|1|2>|)>|}><rsub|k\<le\>n>>
  which equals the integral <math|<big|int>u<rsup|n>*<space|0.17em>d*\<Phi\><rsub|G><around|(|u|)>>,
  an object that, on the face of it, depends only on the behavior of
  <math|\<zeta\>> on the critical line. This exchange of line-data Taylor
  coefficients for global integrals against the <math|\<Theta\>>-warped
  density is the key structural content.

  <vspace*|2fn><no-indent><with|font-series|bold|Data availability.> Symbolic
  verification of formula <eqref|eq:closed> and of every moment
  <math|\<mu\><rsub|1>,\<ldots\>,\<mu\><rsub|7>> was performed with a SymPy
  computation; the short script reproduces the explicit table in
  Section<nbsp>3\ 
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-10|<tuple|5.2|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-11|<tuple|5.3|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-12|<tuple|5.4|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-13|<tuple|6|5|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-4|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-5|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-6|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-7|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-8|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|auto-9|<tuple|5.1|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|def:PhiG|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|eq:closed|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|sec:cumulants|<tuple|5.1|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|sec:weighted2|<tuple|5.2|4|../../.TeXmacs/texts/scratch/no_name_4.tm>>
    <associate|thm:closed|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_4.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Setup>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      closed-form moment identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Explicit
      moments for <with|mode|<quote|math>|n\<le\>7>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Structural
      features> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|3tab>|The <with|mode|<quote|math>|\<zeta\><rsub|n-1>>
      slot. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|3tab>|The leading
      <with|mode|<quote|math>|\<alpha\>>-polynomials.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|3tab>|Rational
      <with|mode|<quote|math>|n>-dependence.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Consequences>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Cumulants
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Weighted second moment of
      <with|mode|<quote|math>|<around|\||\<zeta\>|\|><rsup|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Moment-generating function
      and zeros <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>A Carleman-type question
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Remarks>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>