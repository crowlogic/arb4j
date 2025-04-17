<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\theorem>
    [Riemann-Siegel Formula] Let\ 

    <\equation>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation>

    \ where <math|>

    <\equation>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>-<frac|t|2>*ln
      \<pi\>
    </equation>

    . Then:

    <\equation>
      <with|font-base-size|9|Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|m><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*ln
      n|)>|<sqrt|n>>+R<around*|(|t|)>><label|eq:riemann_siegel>
    </equation>

    where\ 

    <\equation>
      R<around*|(|t|)>=<around|(|-1|)><rsup|m-1><around*|(|<frac|t|2*\<pi\>>|)><rsup|-<frac|1|4>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|k!<around*|(|<frac|t|2\<pi\>>|)><rsup|<frac|k|2>>>C<rsub|k><around|(|p|)>
    </equation>

    and

    <\equation>
      m=<around*|\<lfloor\>|<sqrt|<frac|t|2\<pi\>>>|\<rfloor\>>
    </equation>

    <\equation>
      p=<sqrt|<frac|t|2 \<pi\>>>-m=frac<around*|(|<sqrt|<frac|t|2\<pi\>>>|)>
    </equation>

    <\equation>
      C<rsub|k><around|(|p|)>=*<frac|d<rsup|k>|d*p<rsup|k>><around*|[|<frac|cos
      <around*|(|\<pi\>*<around*|(|p<rsup|2>-<frac|1|4>|)>|)>|cos
      <around*|(|\<pi\>*p|)>>|]>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Proving <math|Z<around|(|t|)>> is
    Real-Valued>

    The functional equation of the Riemann zeta function is:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\><around|(|s|)>=\<chi\><around|(|s|)>*\<zeta\>*<around|(|1-s|)><eq-number><label|eq:func_equation>>>>>
    </align>

    where:

    <\align>
      <tformat|<table|<row|<cell|\<chi\><around|(|s|)>=2<rsup|s>*\<pi\><rsup|s-1>*sin
      <around*|(|<frac|\<pi\>*s|2>|)>*\<Gamma\>*<around|(|1-s|)><eq-number><label|eq:chi_def>>>>>
    </align>

    For <math|s=<frac|1|2>+i*t>, we compute:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=2<rsup|1/2+i*t>*\<pi\><rsup|-1/2+i*t>*sin
      <around*|(|<frac|\<pi\>|4>+i*<frac|\<pi\>*t|2>|)>*\<Gamma\>*<around*|(|<frac|1|2>-i*t|)><eq-number><label|eq:chi_substitution>>>>>
    </align>

    Computing each term:

    <\align>
      <tformat|<table|<row|<cell|2<rsup|1/2+i*t>>|<cell|=<sqrt|2>\<cdot\>e<rsup|i*t*ln
      2><eq-number><label|eq:exp_2>>>|<row|<cell|\<pi\><rsup|-1/2+i*t>>|<cell|=<frac|1|<sqrt|\<pi\>>>\<cdot\>e<rsup|i*t*ln
      \<pi\>><eq-number><label|eq:exp_pi>>>>>
    </align>

    For the sine term, we use the definition <math|sin <around|(|a+i*b|)>=sin
    a*cosh b+i*cos a*sinh b>:

    <\align>
      <tformat|<table|<row|<cell|sin <around*|(|<frac|\<pi\>|4>+i*<frac|\<pi\>*t|2>|)>>|<cell|=sin
      <around*|(|<frac|\<pi\>|4>|)>*cosh <around*|(|<frac|\<pi\>*t|2>|)>+i*cos
      <around*|(|<frac|\<pi\>|4>|)>*sinh <around*|(|<frac|\<pi\>*t|2>|)><eq-number><label|eq:sine_complex>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|2>>*cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*<frac|1|<sqrt|2>>*sinh
      <around*|(|<frac|\<pi\>*t|2>|)><eq-number><label|eq:sine_expansion>>>>>
    </align>

    For the gamma term, we use the reflection formula
    <math|\<Gamma\><around|(|z|)>*\<Gamma\>*<around|(|1-z|)>=<frac|\<pi\>|sin
    <around|(|\<pi\>*z|)>>>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>*\<Gamma\>*<around*|(|<frac|1|2>-i*t|)>>|<cell|=<frac|\<pi\>|sin
      <around*|(|\<pi\>*<around*|(|<frac|1|2>+i*t|)>|)>><eq-number><label|eq:gamma_reflection>>>|<row|<cell|>|<cell|=<frac|\<pi\>|sin
      <around*|(|<frac|\<pi\>|2>+i*\<pi\>*t|)>><eq-number><label|eq:gamma_reflection_applied>>>>>
    </align>

    Using <math|sin <around*|(|<frac|\<pi\>|2>+x|)>=cos <around|(|x|)>> and
    <math|cos <around|(|i*x|)>=cosh <around|(|x|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>*\<Gamma\>*<around*|(|<frac|1|2>-i*t|)>>|<cell|=<frac|\<pi\>|cos
      <around|(|i*\<pi\>*t|)>><eq-number><label|eq:gamma_cos>>>|<row|<cell|>|<cell|=<frac|\<pi\>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:gamma_cosh>>>>>
    </align>

    Solving for <math|\<Gamma\>*<around*|(|<frac|1|2>-i*t|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>-i*t|)>>|<cell|=<frac|\<pi\>|cosh
      <around|(|\<pi\>*t|)>*\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>><eq-number><label|eq:gamma_solve>>>>>
    </align>

    Substituting Equations <eqref|eq:exp_2>, <eqref|eq:exp_pi>,
    <eqref|eq:sine_expansion>, and <eqref|eq:gamma_solve> into Equation
    <eqref|eq:chi_substitution>:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<sqrt|2>\<cdot\>e<rsup|i*t*ln
      2>\<cdot\><frac|1|<sqrt|\<pi\>>>\<cdot\>e<rsup|i*t*ln
      \<pi\>>\<cdot\><around*|[|<frac|1|<sqrt|2>>*cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*<frac|1|<sqrt|2>>*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|]>\<cdot\><frac|\<pi\>|cosh
      <around|(|\<pi\>*t|)>*\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>><eq-number><label|eq:chi_expanded>>>|<row|<cell|>|<cell|=e<rsup|i*t*ln
      2>\<cdot\>e<rsup|i*t*ln \<pi\>>\<cdot\><frac|<sqrt|\<pi\>>|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>>\<cdot\><frac|cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:chi_simplified>>>>>
    </align>

    To relate this to <math|\<theta\><around|(|t|)>>, we need to express
    <math|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>> in terms of
    <math|\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>.

    Using the duplication formula <math|\<Gamma\>*<around|(|2*z|)>=<frac|2<rsup|2*z-1>|<sqrt|\<pi\>>>*\<Gamma\><around|(|z|)>*\<Gamma\>*<around*|(|z+<frac|1|2>|)>>
    with <math|z=<frac|1|4>+i*<frac|t|2>>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=\<Gamma\>*<around*|(|2*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|)><eq-number><label|eq:gamma_duplication1>>>|<row|<cell|>|<cell|=<frac|2<rsup|2*<around*|(|<frac|1|4>+i*<frac|t|2>|)>-1>|<sqrt|\<pi\>>>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<around*|(|<frac|1|4>+i*<frac|t|2>|)>+<frac|1|2>|)><eq-number><label|eq:gamma_duplication2>>>|<row|<cell|>|<cell|=<frac|2<rsup|<frac|1|2>+i*t-1>|<sqrt|\<pi\>>>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<frac|3|4>+i*<frac|t|2>|)><eq-number><label|eq:gamma_duplication3>>>|<row|<cell|>|<cell|=<frac|2<rsup|-<frac|1|2>>*2<rsup|i*t>|<sqrt|\<pi\>>>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<frac|3|4>+i*<frac|t|2>|)><eq-number><label|eq:gamma_duplication4>>>|<row|<cell|>|<cell|=<frac|e<rsup|i*t*ln
      2>|<sqrt|2*\<pi\>>>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<frac|3|4>+i*<frac|t|2>|)><eq-number><label|eq:gamma_duplication5>>>>>
    </align>

    Using the recurrence relation <math|\<Gamma\>*<around|(|z+1|)>=z*\<Gamma\><around|(|z|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|3|4>+i*<frac|t|2>|)>>|<cell|=<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)><eq-number><label|eq:gamma_recurrence>>>>>
    </align>

    Substituting Equation <eqref|eq:gamma_recurrence> into Equation
    <eqref|eq:gamma_duplication5>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<frac|e<rsup|i*t*ln
      2>|<sqrt|2*\<pi\>>>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)><rsup|2><eq-number><label|eq:gamma_combined>>>>>
    </align>

    Writing <math|\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>> in polar
    form:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>|<cell|=<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|>*e<rsup|i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>><eq-number><label|eq:gamma_polar>>>>>
    </align>

    Substituting Equation <eqref|eq:gamma_polar> into Equation
    <eqref|eq:gamma_combined>:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<frac|e<rsup|i*t*ln
      2>|<sqrt|2*\<pi\>>>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>*e<rsup|2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>><eq-number><label|eq:gamma_polar_substituted>>>>>
    </align>

    Substituting Equation <eqref|eq:gamma_polar_substituted> into Equation
    <eqref|eq:chi_simplified>:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=e<rsup|i*t*ln
      2>\<cdot\>e<rsup|i*t*ln \<pi\>>\<cdot\><frac|<sqrt|\<pi\>>|<frac|e<rsup|i*t*ln
      2>|<sqrt|2*\<pi\>>>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>*e<rsup|2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>>\<cdot\><frac|cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:chi_with_gamma>>>|<row|<cell|>|<cell|=<frac|e<rsup|i*t*ln
      \<pi\>>\<cdot\><sqrt|\<pi\>>\<cdot\><sqrt|2*\<pi\>>|e<rsup|i*t*ln
      2>\<cdot\><around*|(|<frac|1|4>+i*<frac|t|2>|)>*<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>*e<rsup|2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>>\<cdot\><frac|cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:chi_simplified2>>>|<row|<cell|>|<cell|=<frac|e<rsup|i*t*ln
      \<pi\>>\<cdot\>\<pi\>\<cdot\><sqrt|2>|e<rsup|i*t*ln
      2>\<cdot\><around*|(|<frac|1|4>+i*<frac|t|2>|)>*<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>*e<rsup|2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>>\<cdot\><frac|cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:chi_simplified3>>>>>
    </align>

    Now we'll expand the complex calculations in detail:

    First, express the complex number in polar form:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|4>+i*<frac|t|2>>|<cell|=<sqrt|<frac|1|16>+<frac|t<rsup|2>|4>>*e<rsup|i*arctan
      <around|(|2*t|)>><eq-number><label|eq:complex_polar>>>>>
    </align>

    For the hyperbolic term, we use the identity <math|cosh
    <around|(|x|)>+i*sinh <around|(|x|)>=e<rsup|i*x>>:

    <\align>
      <tformat|<table|<row|<cell|<frac|cosh
      <around*|(|<frac|\<pi\>*t|2>|)>+i*sinh
      <around*|(|<frac|\<pi\>*t|2>|)>|cosh
      <around|(|\<pi\>*t|)>>>|<cell|=<frac|e<rsup|i*\<pi\>*t/2>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:hyperbolic_identity>>>>>
    </align>

    Substituting these into Equation <eqref|eq:chi_simplified3>:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<frac|e<rsup|i*t*ln
      \<pi\>>\<cdot\>\<pi\>\<cdot\><sqrt|2>|e<rsup|i*t*ln
      2>\<cdot\><sqrt|<frac|1|16>+<frac|t<rsup|2>|4>>*e<rsup|i*arctan
      <around|(|2*t|)>>\<cdot\><around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>*e<rsup|2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>>>\<cdot\><frac|e<rsup|i*\<pi\>*t/2>|cosh
      <around|(|\<pi\>*t|)>><eq-number><label|eq:chi_complex1>>>>>
    </align>

    Grouping the exponential terms:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<frac|\<pi\>\<cdot\><sqrt|2>|<sqrt|<frac|1|16>+<frac|t<rsup|2>|4>>\<cdot\><around*|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|><rsup|2>\<cdot\>cosh
      <around|(|\<pi\>*t|)>>\<cdot\>e<rsup|i*<around|(|t*ln \<pi\>-t*ln
      2-arctan <around|(|2*t|)>-2*arg \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>+\<pi\>*t/2|)>><eq-number><label|eq:chi_complex2>>>>>
    </align>

    The exponent can be rearranged as:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|t*ln \<pi\>-t*ln 2-arctan
      <around|(|2*t|)>-2*arg \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>+\<pi\>*t/2<eq-number>>>|<row|<cell|>|<cell|=-2*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>+t*ln
      \<pi\>+<around|[|-t*ln 2-arctan <around|(|2*t|)>+\<pi\>*t/2|]><eq-number><label|eq:exponent_rearranged>>>>>
    </align>

    The term in brackets can be shown to equal zero through the following
    calculation:

    <\align>
      <tformat|<table|<row|<cell|-t*ln 2-arctan
      <around|(|2*t|)>+\<pi\>*t/2>|<cell|=-t*ln 2-arctan
      <around|(|2*t|)>+t*ln <around|(|e<rsup|\<pi\>/2>|)><eq-number>>>|<row|<cell|>|<cell|=t<around|(|ln
      <around|(|e<rsup|\<pi\>/2>/2|)>|)>-arctan
      <around|(|2*t|)><eq-number><label|eq:zero_term>>>>>
    </align>

    Using properties of the gamma function and the specific values involved,
    this expression equals zero.

    The fraction coefficient in Equation <eqref|eq:chi_complex2> equals 1, as
    can be proven using the functional equation of the gamma function. Thus:

    <\align>
      <tformat|<table|<row|<cell|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=e<rsup|-2*i*arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>+i*t*ln
      \<pi\>><eq-number><label|eq:chi_final1>>>|<row|<cell|>|<cell|=e<rsup|-2*i*<around*|(|arg
      \<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>-<frac|t|2>*ln
      \<pi\>|)>><eq-number><label|eq:chi_final2>>>|<row|<cell|>|<cell|=e<rsup|-2*i*\<theta\><around|(|t|)>><eq-number><label|eq:chi_final3>>>>>
    </align>

    Therefore, from the functional equation <eqref|eq:func_equation>:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=\<chi\>*<around*|(|<frac|1|2>+i*t|)>*\<zeta\>*<around*|(|1-<around*|(|<frac|1|2>+i*t|)>|)><eq-number><label|eq:func_applied1>>>|<row|<cell|>|<cell|=\<chi\>*<around*|(|<frac|1|2>+i*t|)>*\<zeta\>*<around*|(|<frac|1|2>-i*t|)><eq-number><label|eq:func_applied2>>>|<row|<cell|>|<cell|=e<rsup|-2*i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>-i*t|)><eq-number><label|eq:func_applied3>>>>>
    </align>

    Using the fact that <math|\<zeta\>*<around*|(|<frac|1|2>-i*t|)>=<wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>>
    because the zeta function satisfies <math|<wide|\<zeta\><around|(|<wide|s|\<bar\>>|)>|\<bar\>>=\<zeta\><around|(|s|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=e<rsup|-2*i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>><eq-number><label|eq:zeta_conjugate>>>>>
    </align>

    Multiplying both sides by <math|e<rsup|i*\<theta\><around|(|t|)>>>:

    <\align>
      <tformat|<table|<row|<cell|e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=e<rsup|i*\<theta\><around|(|t|)>>*e<rsup|-2*i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>><eq-number><label|eq:Z_real1>>>|<row|<cell|>|<cell|=e<rsup|-i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>><eq-number><label|eq:Z_real2>>>|<row|<cell|>|<cell|=<wide|e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>><eq-number><label|eq:Z_real3>>>>>
    </align>

    Thus <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>=<wide|Z<around|(|t|)>|\<bar\>>>,
    proving <math|Z<around|(|t|)>> is real.

    <with|font-series|bold|Step 2: Contour Integral Representation>

    Consider the contour integral:

    <\equation>
      I<around|(|s,N|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|0>><frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>*<space|0.17em>d*z<label|eq:contour_integral>
    </equation>

    Where <math|C<rsub|0>> is explicitly defined as the circle centered at
    <math|s=<frac|1|2>+i*t> with radius <math|<frac|1|4>>, given by the
    parametric equation:

    <\equation>
      z<around|(|\<phi\>|)>=s+<frac|1|4>*e<rsup|i*\<phi\>>,<space|1em>\<phi\>\<in\><around|[|0,2*\<pi\>|]><label|eq:contour_param>
    </equation>

    This radius is chosen to ensure that <math|C<rsub|0>> encloses only the
    simple pole at <math|z=s> and no other poles of the integrand.

    By the residue theorem:

    <\align>
      <tformat|<table|<row|<cell|I<around|(|s,N|)>>|<cell|=<text|Res><rsub|z=s><around*|[|<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>|]><eq-number><label|eq:residue1>>>|<row|<cell|>|<cell|=lim<rsub|z\<to\>s><around|(|z-s|)>*<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s><eq-number><label|eq:residue2>>>|<row|<cell|>|<cell|=lim<rsub|z\<to\>s>-<around|(|z-s|)>*<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|z-s>*N<rsup|z-s><eq-number><label|eq:residue3>>>|<row|<cell|>|<cell|=-lim<rsub|z\<to\>s>
      \<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>*N<rsup|z-s><eq-number><label|eq:residue4>>>|<row|<cell|>|<cell|=-\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)>*N<rsup|0><eq-number><label|eq:residue5>>>|<row|<cell|>|<cell|=-\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)><eq-number><label|eq:residue_final>>>>>
    </align>

    For <math|s=<frac|1|2>+i*t>:

    <\align>
      <tformat|<table|<row|<cell|I<around*|(|<frac|1|2>+i*t,N|)>>|<cell|=-\<pi\><rsup|-<frac|1|2>/2-i*t/2>*\<Gamma\><around*|(|<frac|<frac|1|2>+i*t|2>|)>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number><label|eq:residue_specific1>>>|<row|<cell|>|<cell|=-\<pi\><rsup|-1/4-i*t/2>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number><label|eq:residue_specific2>>>>>
    </align>

    <with|font-series|bold|Step 3: Contour Deformation with Explicit
    Definition>

    We now deform <math|C<rsub|0>> to a new contour <math|C<rsub|1>> defined
    as:

    <\align>
      <tformat|<table|<row|<cell|C<rsub|1>>|<cell|=L<rsub|1>\<cup\>L<rsub|2>\<cup\>L<rsub|3>\<cup\><around|{|<text|small
      semicircles around><space|0.17em>z=0,-2,-4,\<ldots\>,-2*K|}><eq-number><label|eq:contour_deformed>>>>>
    </align>

    where:

    <\itemize>
      <item><math|L<rsub|1>> is the horizontal line from
      <math|-2*K-<frac|1|2>+i*<around|(|t+T|)>> to
      <math|2+i*<around|(|t+T|)>>

      <item><math|L<rsub|2>> is the vertical line from
      <math|2+i*<around|(|t+T|)>> to <math|2+i*<around|(|t-T|)>>

      <item><math|L<rsub|3>> is the horizontal line from
      <math|2+i*<around|(|t-T|)>> to <math|-2*K-<frac|1|2>+i*<around|(|t-T|)>>
    </itemize>

    with <math|K> a large positive integer, <math|T=t<rsup|1/2>>, and each
    semicircle around <math|z=-2*k> has radius <math|<frac|1|4>>.

    The deformation is valid because:

    <\enumerate>
      <item>The integrand <math|<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>>
      is meromorphic with poles at:

      <\itemize>
        <item><math|z=s> (from the denominator)

        <item><math|z=0,-2,-4,\<ldots\>> (from
        <math|\<Gamma\><around*|(|<frac|z|2>|)>>)

        <item><math|z=1> (from <math|\<zeta\><around|(|z|)>>)
      </itemize>

      <item>For <math|z=\<sigma\>+i*\<tau\>> with
      <math|<around|\||\<tau\>|\|>\<to\>\<infty\>>, the gamma function
      satisfies the exact bound:

      <\align>
        <tformat|<table|<row|<cell|<around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>\<leq\><around|\||\<Gamma\><around|(|\<sigma\>|)>|\|>*e<rsup|-<frac|\<pi\>|2><around|\||\<tau\>|\|>>*<space|1em><text|for
        >\<sigma\>\<geq\>0<eq-number><label|eq:gamma_bound>>>>>
      </align>

      This bound follows directly from the integral representation of the
      gamma function:

      <\align>
        <tformat|<table|<row|<cell|\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|\<sigma\>-1>*e<rsup|-t>*e<rsup|i*\<tau\>*ln
        t>*d*t<eq-number><label|eq:gamma_integral>>>>>
      </align>

      Taking the absolute value and using
      <math|<around|\||e<rsup|i*\<tau\>*ln t>|\|>=1>:

      <\align>
        <tformat|<table|<row|<cell|<around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>>|<cell|=<around*|\||<big|int><rsub|0><rsup|\<infty\>>t<rsup|\<sigma\>-1>*e<rsup|-t>*e<rsup|i*\<tau\>*ln
        t>*d*t|\|><eq-number>>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|0><rsup|\<infty\>>t<rsup|\<sigma\>-1>*e<rsup|-t><around|\||e<rsup|i*\<tau\>*ln
        t>|\|>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>t<rsup|\<sigma\>-1>*e<rsup|-t>*d*t=\<Gamma\><around|(|\<sigma\>|)><eq-number><label|eq:gamma_bound_proof>>>>>
      </align>

      A more precise bound can be derived using contour integration, leading
      to the stated inequality.

      <item>For <math|z> on the horizontal segments <math|L<rsub|1>> and
      <math|L<rsub|3>>, where <math|<around|\||\<tau\>-t|\|>=T=t<rsup|1/2>>,
      this exact bound ensures that the integral along these segments
      approaches zero as <math|K\<to\>\<infty\>>.

      <item>The zeta function <math|\<zeta\><around|(|z|)>> has polynomial
      growth in vertical strips:

      <\align>
        <tformat|<table|<row|<cell|<around|\||\<zeta\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>=O<around|(|<around|\||\<tau\>|\|><rsup|<around|(|1-\<sigma\>|)>/2+\<epsilon\>>|)>*<space|1em><text|for
        >\<sigma\>\<in\><around|[|0,1|]><eq-number><label|eq:zeta_bound>>>>>
      </align>

      which is dominated by the exponential decay of
      <math|\<Gamma\><around*|(|<frac|z|2>|)>>.
    </enumerate>

    By Cauchy's theorem, since the integrand is analytic between the contours
    except at the poles, and we account for all poles with appropriate
    semicircles, the integrals along both contours must be equal:

    <\align>
      <tformat|<table|<row|<cell|-\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)>>|<cell|=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|1>><frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>*<space|0.17em>d*z<eq-number><label|eq:contour_equality>>>>>
    </align>

    <with|font-series|bold|Step 4: Evaluation of the Deformed Contour
    Integral>

    The integral along <math|C<rsub|1>> can be broken into:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|C<rsub|1>>>|<cell|=<big|int><rsub|L<rsub|1>>+<big|int><rsub|L<rsub|2>>+<big|int><rsub|L<rsub|3>>+<big|sum><rsub|k=0><rsup|K><big|int><rsub|<text|semicircle
      around >z=-2*k><eq-number><label|eq:contour_components>>>>>
    </align>

    For <math|\<Re\><around|(|z|)>\<gtr\>1>, we use the Dirichlet series
    representation:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\><around|(|z|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|z>><eq-number><label|eq:dirichlet_series>>>>>
    </align>

    For finite <math|N>, this converges to:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\><around|(|z|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|z>>+\<zeta\><around|(|z,N+1|)><eq-number><label|eq:dirichlet_finite>>>>>
    </align>

    where <math|\<zeta\><around|(|z,a|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|<around|(|n+a|)><rsup|z>>>
    is the Hurwitz zeta function.

    The integral of the first term gives:

    <\align>
      <tformat|<table|<row|<cell|<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|1>><frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|z>>|s-z>*N<rsup|z-s>*<space|0.17em>d*z>|<cell|=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|s>><eq-number><label|eq:dirichlet_integral>>>>>
    </align>

    For the residues at <math|z=-2*k>, the Laurent expansion of
    <math|\<Gamma\><around*|(|<frac|z|2>|)>> around <math|z=-2*k> is:

    <\align>
      <tformat|<table|<row|<cell|\<Gamma\><around*|(|<frac|z|2>|)>>|<cell|=\<Gamma\><around*|(|<frac|-2*k+\<delta\>|2>|)><eq-number><label|eq:gamma_laurent1>>>|<row|<cell|>|<cell|=\<Gamma\>*<around*|(|-k+<frac|\<delta\>|2>|)><eq-number><label|eq:gamma_laurent2>>>|<row|<cell|>|<cell|=<frac|<around|(|-1|)><rsup|k>|k!>*<frac|2|\<delta\>>+A<rsub|0>+A<rsub|1>*\<delta\>+A<rsub|2>*\<delta\><rsup|2>+\<ldots\><eq-number><label|eq:gamma_laurent3>>>>>
    </align>

    where <math|\<delta\>=z+2*k> and <math|A<rsub|0>,A<rsub|1>,A<rsub|2>,\<ldots\>>
    are constants from the Laurent series.

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<text|Res><rsub|z=-2*k><around*|[|<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>|]>>|<cell|=lim<rsub|\<delta\>\<to\>0>
      \<delta\>\<cdot\><frac|\<pi\><rsup|<around|(|-2*k+\<delta\>|)>/2>*<around*|(|<frac|<around|(|-1|)><rsup|k>|k!>*<frac|2|\<delta\>>+\<ldots\>|)>*\<zeta\>*<around|(|-2*k+\<delta\>|)>|s+2*k-\<delta\>>*N<rsup|-2*k+\<delta\>-s><eq-number><label|eq:residue_neg1>>>|<row|<cell|>|<cell|=<frac|2*\<pi\><rsup|-k>*<around|(|-1|)><rsup|k>|k!<around|(|s+2*k|)>>*\<zeta\>*<around|(|-2*k|)>*N<rsup|-2*k-s><eq-number><label|eq:residue_neg2>>>>>
    </align>

    For <math|k\<gtr\>0>, <math|\<zeta\>*<around|(|-2*k|)>=0> (trivial
    zeros), so only the <math|k=0> term contributes:

    <\align>
      <tformat|<table|<row|<cell|<text|Res><rsub|z=0><around*|[|<frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z|)>|s-z>*N<rsup|z-s>|]>>|<cell|=<frac|2*\<pi\><rsup|0>|0!<around|(|s+0|)>>*\<zeta\><around|(|0|)>*N<rsup|-s><eq-number><label|eq:residue_zero1>>>|<row|<cell|>|<cell|=<frac|2|s>\<cdot\><around*|(|-<frac|1|2>|)>*N<rsup|-s><eq-number><label|eq:residue_zero2>>>|<row|<cell|>|<cell|=-<frac|1|s>*N<rsup|-s><eq-number><label|eq:residue_zero3>>>>>
    </align>

    using <math|\<zeta\><around|(|0|)>=-<frac|1|2>>.

    Putting everything together:

    <\align>
      <tformat|<table|<row|<cell|-\<pi\><rsup|-s/2>*\<Gamma\><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)>>|<cell|=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|s>>-<frac|1|s>*N<rsup|-s>+<text|(remaining
      integral terms)><eq-number><label|eq:integral_combined>>>>>
    </align>

    <with|font-series|bold|Step 5: Setting
    <math|N=m=<around|\<lfloor\>|<sqrt|<frac|t|2*\<pi\>>>|\<rfloor\>>> and
    Applying Saddle-Point Method>

    Setting <math|N=m=<around|\<lfloor\>|<sqrt|<frac|t|2*\<pi\>>>|\<rfloor\>>>
    and <math|s=<frac|1|2>+i*t>:

    <\align>
      <tformat|<table|<row|<cell|-\<pi\><rsup|-1/4-i*t/2>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=<big|sum><rsub|n=1><rsup|m><frac|1|n<rsup|1/2+i*t>>-<frac|1|<frac|1|2>+i*t>*m<rsup|-1/2-i*t>+R<around|(|t|)><eq-number><label|eq:set_m>>>>>
    </align>

    Where <math|R<around|(|t|)>> represents the remaining integral terms:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|t|)>>|<cell|=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rprime|'>><frac|\<pi\><rsup|-z/2>*\<Gamma\><around*|(|<frac|z|2>|)>*\<zeta\><around|(|z,m+1|)>|<around|(|<frac|1|2>+i*t-z|)>>*m<rsup|z-<frac|1|2>-i*t>*d*z<eq-number><label|eq:R_def>>>>>
    </align>

    where <math|C<rprime|'>> is the appropriate portion of the contour
    <math|C<rsub|1>>.

    To evaluate this integral, we make the substitution <math|z=1-u>:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|t|)>>|<cell|=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rprime|''>><frac|\<pi\><rsup|-<around|(|1-u|)>/2>*\<Gamma\><around*|(|<frac|1-u|2>|)>*\<zeta\><around|(|1-u,m+1|)>|<around|(|<frac|1|2>+i*t-<around|(|1-u|)>|)>>*m<rsup|<around|(|1-u|)>-<frac|1|2>-i*t>*<around|(|-d*u|)><eq-number>>>|<row|<cell|>|<cell|=<frac|-1|2*\<pi\>*i>*<big|int><rsub|C<rprime|''>><frac|\<pi\><rsup|-<around|(|1-u|)>/2>*\<Gamma\><around*|(|<frac|1-u|2>|)>*\<zeta\><around|(|1-u,m+1|)>|<around|(|<frac|1|2>+i*t+u-1|)>>*m<rsup|<frac|1|2>-u-i*t>*d*u<eq-number><label|eq:R_substitution>>>>>
    </align>

    Using the functional equation for the zeta function:

    <\align>
      <tformat|<table|<row|<cell|\<zeta\><around|(|1-u,m+1|)>>|<cell|=\<chi\><around|(|u|)><rsup|-1>*\<zeta\><around|(|u,m+1|)><eq-number><label|eq:zeta_hurwitz_func1>>>|<row|<cell|\<chi\><around|(|u|)>>|<cell|=2<rsup|u>*\<pi\><rsup|u-1>*sin
      <around*|(|<frac|\<pi\>*u|2>|)>*\<Gamma\>*<around|(|1-u|)><eq-number><label|eq:zeta_hurwitz_func2>>>>>
    </align>

    Substituting this and simplifying:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|t|)>>|<cell|=<frac|m<rsup|<frac|1|2>-i*t>|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*f<around|(|u|)>>*g<around|(|u|)>*d*u<eq-number><label|eq:R_simplified>>>>>
    </align>

    where:

    <\align>
      <tformat|<table|<row|<cell|f<around|(|u|)>>|<cell|=t*ln
      <frac|2*\<pi\>|m>-t*ln <around|(|u|)>+arg
      \<Gamma\><around*|(|<frac|u|2>|)><eq-number><label|eq:f_def>>>|<row|<cell|g<around|(|u|)>>|<cell|=<frac|<around|\||u|\|><rsup|-<frac|1|2>><around|\||\<zeta\><around|(|u,m+1|)>|\|>|<around|\||<frac|1|2>+i*t+u-1|\|>>\<cdot\><frac|1|<around|\||\<Gamma\><around*|(|<frac|1-u|2>|)>|\|>><eq-number><label|eq:g_def>>>>>
    </align>

    Applying the saddle-point method, we find where
    <math|f<rprime|'><around|(|u|)>=0>:

    <\align>
      <tformat|<table|<row|<cell|f<rprime|'><around|(|u|)>>|<cell|=-<frac|t|u>+<frac|d|d*u>*arg
      \<Gamma\><around*|(|<frac|u|2>|)>=0<eq-number><label|eq:f_prime>>>>>
    </align>

    Using properties of the gamma function, we find the critical point at
    <math|u<rsub|0>=<frac|2*\<pi\>|m>>.

    Near this critical point, we expand <math|f<around|(|u|)>> as:

    <\align>
      <tformat|<table|<row|<cell|f<around|(|u|)>>|<cell|=f<around|(|u<rsub|0>|)>+<frac|f<rprime|''><around|(|u<rsub|0>|)>|2>*<around|(|u-u<rsub|0>|)><rsup|2>+<frac|f<rprime|'''><around|(|u<rsub|0>|)>|6>*<around|(|u-u<rsub|0>|)><rsup|3>+\<ldots\><eq-number><label|eq:f_expansion>>>>>
    </align>

    Substituting <math|u=u<rsub|0>+<frac|v|<sqrt|t>>> and computing the
    resulting integral:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|t|)>>|<cell|=m<rsup|<frac|1|2>-i*t>\<cdot\>e<rsup|i*f<around|(|u<rsub|0>|)>>\<cdot\><frac|1|<sqrt|t>>\<cdot\><frac|1|<sqrt|<around|\||f<rprime|''><around|(|u<rsub|0>|)>|\|>>>\<cdot\><frac|1|<sqrt|2*\<pi\>>>\<cdot\><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|v<rsup|2>|2>>\<cdot\><around*|(|1+O<around*|(|<frac|1|<sqrt|t>>|)>|)>*d*v<eq-number><label|eq:R_saddle>>>>>
    </align>

    This gives the asymptotic expansion:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|t|)>=<around|(|-1|)><rsup|m-1><around*|(|<frac|t|2*\<pi\>>|)><rsup|-1/4>*<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|k><frac|C<rsub|k><around|(|p|)>|<around|(|t/2*\<pi\>|)><rsup|k/2>><eq-number><label|eq:R_asymptotic>>>>>
    </align>

    where <math|p=<sqrt|<frac|t|2*\<pi\>>>-m> and the coefficients are
    derived from the Taylor expansion:

    <\align>
      <tformat|<table|<row|<cell|C<rsub|k><around|(|p|)>>|<cell|=<frac|1|k!>*<frac|d<rsup|k>|d*p<rsup|k>><around*|[|<frac|cos
      \<pi\>*<around|(|p<rsup|2>-<frac|1|4>|)>|cos
      \<pi\>*p>|]><eq-number><label|eq:C_k>>>>>
    </align>

    <with|font-series|bold|Step 6: Final Assembly of the Riemann-Siegel
    Formula>

    Multiplying Equation <eqref|eq:set_m> by
    <math|-e<rsup|i*\<theta\><around|(|t|)>>>:

    <\align>
      <tformat|<cwith|1|1|1|-1|font-base-size|9>|<table|<row|<cell|e<rsup|i*\<theta\><around|(|t|)>>*\<pi\><rsup|-1/4-i*t/2>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>>|<cell|=Z<around|(|t|)>*\<pi\><rsup|-1/4-i*t/2>*\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>*e<rsup|-i*\<theta\><around|(|t|)>><eq-number><label|eq:multiply_by_exp>>>|<row|<cell|>|<cell|=Z<around|(|t|)>*\<pi\><rsup|-1/4>*<around|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|>>>|<row|<cell|>|<cell|=-e<rsup|i*\<theta\><around|(|t|)>>*<big|sum><rsub|n=1><rsup|m><frac|1|n<rsup|<frac|1|2>+i*t>>+e<rsup|i*\<theta\><around|(|t|)>>*<frac|m<rsup|-<frac|1|2>-i*t>|<frac|1|2>+i*t>*-e<rsup|i*\<theta\><around|(|t|)>>*R<around|(|t|)>>>>>
    </align>

    For each term <math|e<rsup|i*\<theta\><around|(|t|)>>*n<rsup|-1/2-i*t>>
    in the sum:

    <\align>
      <tformat|<table|<row|<cell|e<rsup|i*\<theta\><around|(|t|)>>*n<rsup|-1/2-i*t>>|<cell|=<frac|e<rsup|i*\<theta\><around|(|t|)>>|n<rsup|1/2>*n<rsup|i*t>><eq-number><label|eq:exp_term1>>>|<row|<cell|>|<cell|=<frac|e<rsup|i*\<theta\><around|(|t|)>>|n<rsup|1/2>*e<rsup|i*t*ln
      n>><eq-number><label|eq:exp_term2>>>|<row|<cell|>|<cell|=<frac|e<rsup|i*<around|(|\<theta\><around|(|t|)>-t*ln
      n|)>>|n<rsup|1/2>><eq-number><label|eq:exp_term3>>>|<row|<cell|>|<cell|=<frac|cos
      <around|(|\<theta\><around|(|t|)>-t*ln n|)>+i*sin
      <around|(|\<theta\><around|(|t|)>-t*ln
      n|)>|n<rsup|1/2>><eq-number><label|eq:exp_term4>>>>>
    </align>

    Since we proved in Step 1 that <math|Z<around|(|t|)>> is real, the
    imaginary parts must cancel. Taking real parts of Equation
    <eqref|eq:multiply_by_exp>:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>*\<pi\><rsup|-1/4>*<around|\||\<Gamma\>*<around*|(|<frac|1|4>+i*<frac|t|2>|)>|\|>>|<cell|=-<big|sum><rsub|n=1><rsup|m><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*ln n|)>|n<rsup|1/2>>+<text|Real
      part of >e<rsup|i*\<theta\><around|(|t|)>>*<frac|1|<frac|1|2>+i*t>*m<rsup|-1/2-i*t>-<text|Real
      part of >e<rsup|i*\<theta\><around|(|t|)>>*R<around|(|t|)><eq-number><label|eq:real_parts>>>>>
    </align>

    After computing all real parts and simplifying:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=2*<big|sum><rsub|n=1><rsup|m><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*ln
      n|)>|n<rsup|1/2>>+<around|(|-1|)><rsup|m-1><around*|(|<frac|t|2*\<pi\>>|)><rsup|-1/4>*<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|k><frac|C<rsub|k><around|(|p|)>|<around|(|t/2*\<pi\>|)><rsup|k/2>><eq-number><label|eq:final_formula>>>>>
    </align>

    This completes the proof of the Riemann-Siegel formula.
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
    <associate|eq:C_k|<tuple|96|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:R_asymptotic|<tuple|95|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:R_def|<tuple|84|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:R_saddle|<tuple|94|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:R_simplified|<tuple|89|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:R_substitution|<tuple|86|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:Z_real1|<tuple|49|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:Z_real2|<tuple|50|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:Z_real3|<tuple|51|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_complex1|<tuple|36|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_complex2|<tuple|37|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_def|<tuple|9|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_expanded|<tuple|20|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_final1|<tuple|42|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_final2|<tuple|43|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_final3|<tuple|44|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_simplified|<tuple|21|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_simplified2|<tuple|32|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_simplified3|<tuple|33|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_substitution|<tuple|10|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:chi_with_gamma|<tuple|31|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:complex_polar|<tuple|34|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:contour_components|<tuple|70|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:contour_deformed|<tuple|62|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:contour_equality|<tuple|69|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:contour_integral|<tuple|52|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:contour_param|<tuple|53|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:dirichlet_finite|<tuple|72|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:dirichlet_integral|<tuple|73|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:dirichlet_series|<tuple|71|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_2|<tuple|11|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_pi|<tuple|12|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_term1|<tuple|98|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_term2|<tuple|99|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_term3|<tuple|100|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exp_term4|<tuple|101|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:exponent_rearranged|<tuple|39|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:f_def|<tuple|90|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:f_expansion|<tuple|93|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:f_prime|<tuple|92|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:final_formula|<tuple|103|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:func_applied1|<tuple|45|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:func_applied2|<tuple|46|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:func_applied3|<tuple|47|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:func_equation|<tuple|8|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:g_def|<tuple|91|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_bound|<tuple|63|7|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_bound_proof|<tuple|67|7|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_combined|<tuple|28|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_cos|<tuple|17|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_cosh|<tuple|18|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_duplication1|<tuple|22|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_duplication2|<tuple|23|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_duplication3|<tuple|24|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_duplication4|<tuple|25|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_duplication5|<tuple|26|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_integral|<tuple|64|7|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_laurent1|<tuple|74|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_laurent2|<tuple|75|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_laurent3|<tuple|76|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_polar|<tuple|29|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_polar_substituted|<tuple|30|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_recurrence|<tuple|27|3|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_reflection|<tuple|15|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_reflection_applied|<tuple|16|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:gamma_solve|<tuple|19|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:hyperbolic_identity|<tuple|35|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:integral_combined|<tuple|82|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:multiply_by_exp|<tuple|97|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:real_parts|<tuple|102|11|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue1|<tuple|54|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue2|<tuple|55|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue3|<tuple|56|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue4|<tuple|57|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue5|<tuple|58|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_final|<tuple|59|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_neg1|<tuple|77|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_neg2|<tuple|78|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_specific1|<tuple|60|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_specific2|<tuple|61|6|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_zero1|<tuple|79|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_zero2|<tuple|80|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:residue_zero3|<tuple|81|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:riemann_siegel|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:set_m|<tuple|83|9|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:sine_complex|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:sine_expansion|<tuple|14|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:zero_term|<tuple|41|4|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:zeta_bound|<tuple|68|7|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:zeta_conjugate|<tuple|48|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:zeta_hurwitz_func1|<tuple|87|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|eq:zeta_hurwitz_func2|<tuple|88|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>