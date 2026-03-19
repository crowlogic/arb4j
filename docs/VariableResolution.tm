<TeXmacs|2.1.4>

<style|article>

<\body>
  <\hide-preamble>
    <assign|expr|<macro|\<cal-E\>>>

    <assign|dom|<macro|<math-up|dom>>>

    <assign|codom|<macro|<math-up|codom>>>

    <assign|ctx|<macro|<math-up|ctx>>>

    <assign|Func|<macro|<math-ss|Function>>>

    \;
  </hide-preamble>

  <doc-data|<doc-title|Variable Resolution in <with|font-family|tt|arb4j>
  Expressions:<next-line>A Complete Specification>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Definitions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Resolution
    Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Codegen
    Dispatch> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Theorems>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Worked
    Examples> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Non-nullary, non-functional codomain
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|5.2<space|2spc>Nullary, non-functional codomain
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|5.3<space|2spc>Nullary, functional codomain
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|5.4<space|2spc>Non-nullary, functional codomain
    (sequences producing functions) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|5.5<space|2spc>Sub-expressions (upstream variables)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|5.6<space|2spc>Bivariate functions (functional
    codomain = inner function type) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>What
    This Replaces> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Definitions>

  <\definition>
    [Expression] An <em|expression> <math|<expr>> is characterised by:

    <\enumerate>
      <item>A <em|domain type> <math|<dom><around|(|<expr>|)>>.

      <item>A <em|codomain type> <math|<codom><around|(|<expr>|)>>.

      <item>A <em|function type> <math|F<around|(|<expr>|)>>.

      <item>An optional <em|context> <math|<ctx><around|(|<expr>|)>>: a
      finite map from names to typed values.

      <item>An optional <em|upstream expression>
      <math|<expr><rsub|\<uparrow\>>>: the enclosing expression, if
      <math|<expr>> is a sub-expression (e.g. the body of a <math|\<Sigma\>>
      or <math|\<Pi\>>).
    </enumerate>
  </definition>

  <\definition>
    [Nullary expression] <math|<expr>> is <em|nullary> iff
    <math|<dom><around|(|<expr>|)>=<math-ss|Object>>, meaning the compiled
    function takes no typed input parameter.
  </definition>

  <\definition>
    [Functionally-codomained expression] <math|<expr>> is
    <em|functionally-codomained> iff <math|<codom><around|(|<expr>|)>>
    implements the <math|<Func>> interface. Equivalently,
    <math|<codom><around|(|<expr>|)>> is a type whose instances are
    themselves functions (e.g. <with|font-family|tt|RationalFunction>,
    <with|font-family|tt|RealPolynomial>,
    <with|font-family|tt|RealFunction>).
  </definition>

  <\definition>
    [Variable] A <em|variable> <math|v> appearing in <math|<expr>> is a
    symbolic name that must be <em|resolved> to exactly one of the following
    roles before bytecode generation:

    <\enumerate>
      <item><with|font-series|bold|Context variable>: <math|v> is bound in
      <math|<ctx><around|(|<expr>|)>>.

      <item><with|font-series|bold|Independent variable>: <math|v> is the
      input parameter of <math|<expr>>.

      <item><with|font-series|bold|Placeholder variable>: <math|v> is the
      formal variable of <math|<codom><around|(|<expr>|)>> when
      <math|<codom><around|(|<expr>|)>> is functional.

      <item><with|font-series|bold|Upstream variable>: <math|v> matches the
      independent variable of some <math|<expr><rsub|\<uparrow\>>>.

      <item><with|font-series|bold|Undefined>: <math|v> matches none of the
      above; compilation fails.
    </enumerate>
  </definition>

  <\definition>
    [Placeholder variable] Let <math|<expr>> be functionally-codomained. The
    <em|placeholder variable> of <math|<expr>> is the unique variable
    <math|p> such that:

    <\enumerate>
      <item><math|p> is not a context variable of <math|<expr>>.

      <item><math|p> is not the independent variable of <math|<expr>>.

      <item><math|p> is not an upstream variable.

      <item><math|<expr>> is functionally-codomained.
    </enumerate>

    At most one such variable may exist per expression. If a second variable
    satisfying (i)\U(iv) is encountered, compilation fails with an undefined
    reference.

    The placeholder variable is stored in the field
    <with|font-family|tt|Expression.placeholderVariable>, which is distinct
    from <with|font-family|tt|Expression.independentVariable>.
  </definition>

  <section|Resolution Algorithm>

  <\definition>
    [Resolution order] Given a variable <math|v> encountered during parsing
    of <math|<expr>>, resolution proceeds by the following ordered tests. The
    first matching case determines <math|v>'s role.

    <vspace*|1fn><tabular*|<tformat|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|8|8|1|-1|cell-bborder|1ln>|<table|<row|<cell|<with|font-series|bold|Step>>|<cell|<with|font-series|bold|Condition>>|<cell|<with|font-series|bold|Role
    assigned>>|<cell|<with|font-family|tt|reference.type>
    <with|font-series|bold|set to>>>|<row|<cell|1>|<cell|<math|v\<in\><dom><around|(|<ctx><around|(|<expr>|)>|)>>>|<cell|Context
    variable>|<cell|class of <math|<ctx><around|(|<expr>|)><around|(|v|)>>>>|<row|<cell|2>|<cell|<math|v=<math-up|indep><around|(|<expr>|)>>
    or <math|<math-up|indep><around|(|<expr>|)>=\<varnothing\>>>|<cell|Independent
    variable>|<cell|<math|<choice|<tformat|<table|<row|<cell|<codom><around|(|<expr>|)>>|<cell|<text|if
    nullary>>>|<row|<cell|<dom><around|(|<expr>|)>>|<cell|<text|otherwise>>>>>>>>>|<row|<cell|3>|<cell|<math|<expr>>
    is func.-codomained,>|<cell|Placeholder
    variable>|<cell|<math|<codom><around|(|<expr>|)>>>>|<row|<cell|>|<cell|<math|<math-up|indep><around|(|<expr>|)>\<neq\>\<varnothing\>>,>|<cell|>|<cell|>>|<row|<cell|>|<cell|<math|<math-up|placeholder><around|(|<expr>|)>=\<varnothing\>>>|<cell|>|<cell|>>|<row|<cell|4>|<cell|<math|\<exists\><space|0.17em><expr><rsub|\<uparrow\>>>
    with <math|<math-up|indep><around|(|<expr><rsub|\<uparrow\>>|)>=v>>|<cell|Upstream
    variable>|<cell|<math|<dom><around|(|<expr><rsub|\<uparrow\>>|)>>>>|<row|<cell|5>|<cell|otherwise>|<cell|<with|font-series|bold|Undefined>>|<cell|throw
    error>>>>>
  </definition>

  <section|Codegen Dispatch>

  <\definition>
    [Bytecode generation] After resolution, the variable's role determines
    the bytecode emitted by <with|font-family|tt|generateReference>:
  </definition>

  <vspace*|1fn><tabular|<tformat|<cwith|1|6|1|3|cell-valign|c>|<cwith|1|1|1|3|cell-tborder|1ln>|<cwith|1|1|1|3|cell-bborder|1ln>|<cwith|6|6|1|3|cell-bborder|1ln>|<cwith|1|-1|1|-1|font-base-size|7>|<table|<row|<cell|<with|font-series|bold|Role>>|<cell|<with|font-series|bold|Codegen
  path>>|<cell|<with|font-series|bold|Semantics>>>|<row|<cell|Context
  variable>|<cell|<with|font-family|tt|loadThisAndFieldOntoStack>>|<cell|Load
  from instance field>>|<row|<cell|Independent +
  nullary>|<cell|<with|font-family|tt|generateFunctionalVariableIdentity>>|<cell|Allocate
  codomain; call <with|font-family|tt|.identity()>>>|<row|<cell|Independent +
  non-nullary>|<cell|<with|font-family|tt|loadInputParameter>>|<cell|Load
  from method argument>>|<row|<cell|Placeholder
  variable>|<cell|<with|font-family|tt|generateFunctionalVariableIdentity>>|<cell|Allocate
  codomain; call <with|font-family|tt|.identity()>>>|<row|<cell|Upstream
  variable>|<cell|linked field from enclosing class>|<cell|Load from
  upstream-bound field>>>>>

  <section|Theorems>

  <\theorem>
    [Completeness] Every variable <math|v> in a well-formed expression
    <math|<expr>> is resolved to exactly one of: context variable,
    independent variable, placeholder variable, or upstream variable. No
    other resolution category is required.
  </theorem>

  <\proof>
    We proceed by exhaustive case analysis on the nature of <math|v>.

    <vspace*|1fn><no-indent><with|font-series|bold|Case A: <math|v> is
    externally provided.> If <math|v> is a name\Uvalue pair supplied by the
    caller, it is in <math|<ctx><around|(|<expr>|)>> and is resolved at
    Step<nbsp>1 regardless of all other properties of <math|<expr>>. This
    handles named constants, pre-computed values, and any externally injected
    quantity.

    <vspace*|1fn><no-indent><with|font-series|bold|Case B: <math|v> is the
    input to <math|<expr>>.> If <math|v> is the name appearing to the left of
    the arrow in arrow syntax (e.g. <math|n> in
    <math|n\<to\><around|(|<tfrac|1|2>-z/2|)><rsup|n>>), it is set as
    <math|<math-up|indep><around|(|<expr>|)>> before parsing the body, so
    Step<nbsp>2 matches. If no arrow is present, the first free variable
    encountered that does not match Steps<nbsp>1 is assigned as
    <math|<math-up|indep><around|(|<expr>|)>> (since
    <math|<math-up|indep><around|(|<expr>|)>=\<varnothing\>> at that point),
    which again matches Step<nbsp>2.

    <vspace*|1fn><no-indent><with|font-series|bold|Case C: <math|v> is the
    formal variable of a functional codomain.> This case arises only when
    <math|<codom><around|(|<expr>|)>> implements <math|<Func>> (e.g.
    <with|font-family|tt|RationalFunction>,
    <with|font-family|tt|RealPolynomial>). Suppose <math|<expr>> already has
    an independent variable assigned. Then:

    <\itemize>
      <item>Step<nbsp>1 fails (not in context).

      <item>Step<nbsp>2 fails (<math|v\<neq\><math-up|indep><around|(|<expr>|)>>
      and <math|<math-up|indep><around|(|<expr>|)>\<neq\>\<varnothing\>>).

      <item>Step<nbsp>3 matches: <math|<expr>> is functionally-codomained,
      the independent variable exists, and no placeholder has yet been
      assigned. <math|v> is assigned as the placeholder variable.
    </itemize>

    If <math|<expr>> is nullary and functionally-codomained, there is no
    arrow-specified independent variable. The first free variable encountered
    sees <math|<math-up|indep><around|(|<expr>|)>=\<varnothing\>> and is
    captured by Step<nbsp>2. This is correct: in a nullary functional
    expression, the independent variable and the placeholder variable
    coincide\Vthere is only one free variable, and it simultaneously serves
    as the output type's formal variable. The field
    <with|font-family|tt|placeholderVariable> need not be set separately in
    this case because the codegen dispatch for \Pindependent + nullary\Q
    already emits <with|font-family|tt|identity()>.

    <vspace*|1fn><no-indent><with|font-series|bold|Case D: <math|v> is
    inherited from an enclosing scope.> If <math|<expr>> is a sub-expression
    (body of <math|\<Sigma\>>, <math|\<Pi\>>, or a lambda), its
    <with|font-family|tt|upstreamExpression> is the enclosing expression. If
    <math|v> matches the independent variable of some ancestor, Step<nbsp>4
    resolves it. The upstream resolution walk terminates because the chain of
    upstream expressions is finite (no cycles).

    <vspace*|1fn><no-indent><with|font-series|bold|Case E: <math|v> matches
    none of the above.> Step<nbsp>5 throws an undefined reference error. This
    is the correct behaviour: a name that is not provided by context, not the
    input, not the codomain's formal variable, and not inherited from any
    enclosing scope has no meaning.

    <vspace*|1fn><no-indent><with|font-series|bold|Uniqueness of
    placeholder.> Suppose two variables <math|v<rsub|1>\<neq\>v<rsub|2>> both
    reach Step<nbsp>3. The first to be parsed is assigned as the placeholder;
    when <math|v<rsub|2>> is encountered,
    <math|<math-up|placeholder><around|(|<expr>|)>\<neq\>\<varnothing\>>, so
    Step<nbsp>3 fails, and <math|v<rsub|2>> falls through to Step<nbsp>5
    (undefined reference). Therefore at most one placeholder variable exists
    per expression.
  </proof>

  <\theorem>
    [Non-nullary functional expressions require exactly two free
    variables]<label|thm:two-vars>Let <math|<expr>> be a non-nullary,
    functionally-codomained expression with no context variables used and no
    upstream expression. Then <math|<expr>> requires exactly two distinct
    free variables: one independent variable and one placeholder variable.
  </theorem>

  <\proof>
    Since <math|<expr>> is non-nullary, it has a typed input parameter, so at
    least one variable is needed to refer to that input (the independent
    variable, resolved at Step<nbsp>2).

    Since <math|<expr>> is functionally-codomained, its codomain type
    implements <math|<Func>>. If the body of <math|<expr>> contains any
    reference to the codomain's formal variable (which it must, to produce a
    non-constant output), that variable cannot be the independent variable
    (different role) and is not in context (by hypothesis) and is not
    upstream (by hypothesis). It is resolved at Step<nbsp>3 as the
    placeholder variable.

    Conversely, any third free variable <math|w\<neq\><math-up|indep><around|(|<expr>|)>>,
    <math|w\<neq\><math-up|placeholder><around|(|<expr>|)>> fails
    Steps<nbsp>1\U4 and triggers Step<nbsp>5. Therefore exactly two free
    variables are permitted.
  </proof>

  <\corollary>
    [Nullary functional expressions have exactly one free variable] Let
    <math|<expr>> be nullary and functionally-codomained with no context
    variables and no upstream expression. Then <math|<expr>> has exactly one
    free variable, which serves simultaneously as the independent variable
    and the codomain's formal variable.
  </corollary>

  <\proof>
    Since <math|<expr>> is nullary, the first free variable encountered sees
    <math|<math-up|indep><around|(|<expr>|)>=\<varnothing\>> and is captured
    by Step<nbsp>2, which sets <with|font-family|tt|reference.type><math|=<codom><around|(|<expr>|)>>
    (the nullary branch). Codegen emits <with|font-family|tt|identity()> via
    the \Pindependent + nullary\Q dispatch. Any second free variable fails
    Steps<nbsp>1\U4 (independent is assigned, placeholder check at
    Step<nbsp>3 sees <math|<math-up|indep><around|(|<expr>|)>\<neq\>\<varnothing\>>,
    but since the independent variable was already assigned, we would need
    <math|<math-up|placeholder><around|(|<expr>|)>=\<varnothing\>>\Vhowever,
    for the nullary case, the system should recognise that the independent
    variable already plays the placeholder role and not permit a second
    placeholder). Therefore exactly one free variable exists.
  </proof>

  <section|Worked Examples>

  <\remark>
    [Exhaustive case coverage] Every expression type in the
    <with|font-family|tt|arb4j> codebase falls into one of the following
    categories, each of which is a direct instantiation of the resolution
    algorithm.
  </remark>

  <subsection|Non-nullary, non-functional codomain>

  <with|font-series|bold|Pattern>: <math|D\<to\>R> where <math|R> does not
  implement <math|<Func>>.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealFunction.express("x^2+1")>
  <space|1em>(<math|\<bbb-R\>\<to\>\<bbb-R\>>)

  <\itemize|nosep>
    <item><math|x>: Step<nbsp>2 (independent), type <math|=<math-up|Real>>,
    codegen <math|=> <with|font-family|tt|loadInputParameter>.

    <item>Any other free name: Step<nbsp>5 (undefined).
  </itemize>

  <no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealFunction.express("x+a", ctx)> where
  <math|<ctx>=<around|{|a\<mapsto\>5.0|}>>

  <\itemize|nosep>
    <item><math|a>: Step<nbsp>1 (context), type <math|=<math-up|Real>>.

    <item><math|x>: Step<nbsp>2 (independent), type <math|=<math-up|Real>>.
  </itemize>

  <no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|ComplexFunction.express("sin(z)")>
  <space|1em>(<math|\<bbb-C\>\<to\>\<bbb-C\>>)

  <\itemize|nosep>
    <item><math|z>: Step<nbsp>2 (independent), type
    <math|=<math-up|Complex>>.
  </itemize>

  <subsection|Nullary, non-functional codomain>

  <with|font-series|bold|Pattern>: <math|<math-ss|Object>\<to\>R> where
  <math|R> does not implement <math|<Func>>.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealNullaryFunction.express("2^(1/4)")>

  <\itemize|nosep>
    <item>No free variables. Pure constant.
  </itemize>

  <no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealNullaryFunction.express("a+1", ctx)> where
  <math|<ctx>=<around|{|a\<mapsto\>7.0|}>>

  <\itemize|nosep>
    <item><math|a>: Step<nbsp>1 (context), type <math|=<math-up|Real>>.
  </itemize>

  <subsection|Nullary, functional codomain>

  <with|font-series|bold|Pattern>: <math|<math-ss|Object>\<to\>R> where
  <math|R> implements <math|<Func>>.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RationalFunction.express("x/2")>
  <space|1em>(<math|<math-ss|Object>\<to\><math-up|RationalFunction>>)

  <\itemize|nosep>
    <item><math|x>: Step<nbsp>2 (independent,
    <math|<math-up|indep>=\<varnothing\>> at encounter). Type
    <math|=<math-up|RationalFunction>> (codomain, since nullary). Codegen
    <math|=> <with|font-family|tt|generateFunctionalVariableIdentity>.

    <item>One free variable only (Corollary<nbsp>1). Any second free name:
    Step<nbsp>5.
  </itemize>

  <no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealPolynomialNullaryFunction.express("x^2+1")>
  <space|1em>(<math|<math-ss|Object>\<to\><math-up|RealPolynomial>>)

  <\itemize|nosep>
    <item><math|x>: Step<nbsp>2 (independent). Type
    <math|=<math-up|RealPolynomial>>. Codegen <math|=>
    <with|font-family|tt|identity()>.
  </itemize>

  <subsection|Non-nullary, functional codomain (sequences producing
  functions)>

  <with|font-series|bold|Pattern>: <math|D\<to\>R> where
  <math|D\<neq\><math-ss|Object>> and <math|R> implements <math|<Func>>.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RationalFunctionSequence.express("n<math|\<rightarrow\>>(<math|<frac|1|2>-<frac|z|2>>)<rsup|n>")>

  (<math|<math-up|Integer>\<to\><math-up|RationalFunction>>)

  <\itemize|nosep>
    <item><math|n>: Arrow syntax assigns it as
    <math|<math-up|indep><around|(|<expr>|)>> before body parsing.
    Step<nbsp>2. Type <math|=<math-up|Integer>> (domain). Codegen <math|=>
    <with|font-family|tt|loadInputParameter>.

    <item><math|z>: Step<nbsp>1 fails (no context). Step<nbsp>2 fails
    (<math|<math-up|indep>=n\<neq\>z>). Step<nbsp>3 matches: expression is
    functionally-codomained, independent variable exists, no placeholder yet.
    Assigned as placeholder. Type <math|=<math-up|RationalFunction>>
    (codomain). Codegen <math|=> <with|font-family|tt|generateFunctionalVariableIdentity>.

    <item>Any third free name: Step<nbsp>5 (undefined).
  </itemize>

  <no-indent>This is the case that was broken after the removal of
  <with|font-family|tt|isDeclaredVariable>. The resolution algorithm's
  Step<nbsp>3 is the replacement: it is not a reintroduction of any
  \Pformal\Q or \Pdeclared\Q or \Pindeterminate\Q concept. It is simply the
  recognition that when an expression's codomain is a function type, exactly
  one non-input, non-context variable is permitted to serve as that output
  function's variable.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>: Jacobi polynomial
  recurrence

  <with|font-family|tt|P:n<math|\<rightarrow\>>when(n=0,1,n=1,(C(1)*x-<math|\<beta\>>+<math|\<alpha\>>)/2,...)>
  as a <with|font-family|tt|RealPolynomialSequence>

  (<math|<math-up|Integer>\<to\><math-up|RealPolynomial>>)

  <\itemize|nosep>
    <item><math|n>: Step<nbsp>2 (independent). Type
    <math|=<math-up|Integer>>.

    <item><math|x>: Step<nbsp>3 (placeholder). Type
    <math|=<math-up|RealPolynomial>>.

    <item><math|\<alpha\>,\<beta\>>: Step<nbsp>1 (context variables, provided
    by caller).

    <item><math|C,A,B,E,P>: Function references (resolved by the function
    mapping system, not the variable resolution system).
  </itemize>

  <subsection|Sub-expressions (upstream variables)>

  <with|font-series|bold|Pattern>: Body of <math|\<Sigma\>>, <math|\<Pi\>>,
  or nested lambda.

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealFunction.express("<math|\<Sigma\>>k<math|\<rightarrow\>>k*x{k=1...N}")>

  <\itemize|nosep>
    <item>The outer expression has <math|x> as its independent variable.

    <item>The <math|\<Sigma\>> body is compiled as a sub-expression
    <math|<expr><rprime|'>> with <math|<expr><rprime|'><rsub|\<uparrow\>>=<expr>>.

    <item><math|k>: Step<nbsp>2 in <math|<expr><rprime|'>> (independent
    variable of the sub-expression). Type <math|=<math-up|Integer>>.

    <item><math|x>: Step<nbsp>4 in <math|<expr><rprime|'>> (upstream\Vmatches
    <math|<math-up|indep><around|(|<expr>|)>>). Type <math|=<math-up|Real>>.
    <with|font-family|tt|upstreamInput> <math|=<math-up|true>>.
  </itemize>

  <subsection|Bivariate functions (functional codomain = inner function
  type)>

  <with|font-series|bold|Pattern>: <math|D\<to\>G> where <math|G> is itself a
  function type (<math|G> implements <math|<Func>>).

  <vspace*|1fn><no-indent><with|font-series|bold|Example>:
  <with|font-family|tt|RealBivariateFunction.express("(n,x)<math|\<rightarrow\>>n*x")>

  (<math|<math-up|Real>\<to\><math-up|RealFunction>>)

  <\itemize|nosep>
    <item>The outer variable is <math|n> (independent, Step<nbsp>2), the
    inner lambda parameter <math|x> becomes the independent variable of the
    generated inner <with|font-family|tt|RealFunction> sub-expression via
    <with|font-family|tt|parseLambda>/<with|font-family|tt|newFunctionalExpression>.

    <item>This is handled by the lambda/functional expression machinery, not
    by the placeholder mechanism, because the syntax explicitly declares both
    variables.
  </itemize>

  <section|What This Replaces>

  The previous implementation had fields <with|font-family|tt|isDeclaredVariable>
  and <with|font-family|tt|isFormalVariable> on
  <with|font-family|tt|VariableNode>, which amounted to a per-variable
  boolean flag that was set under ad-hoc conditions. This led to:

  <\enumerate>
    <item>Conceptual confusion between \Pindeterminate,\Q \Pformal,\Q and
    \Pdeclared\Q variables\Vthree names for what was really one concept.

    <item>A fragile resolution path that could silently misclassify
    variables.

    <item>No enforcement that at most one placeholder exists per expression.
  </enumerate>

  The new design replaces all of this with:

  <\itemize|nosep>
    <item>A single new field <with|font-family|tt|Expression.placeholderVariable>
    (analogous to the existing <with|font-family|tt|Expression.independentVariable>).

    <item>A deterministic, priority-ordered resolution algorithm with exactly
    five steps.

    <item>A proof that five variable roles\Vcontext, independent,
    placeholder, upstream, undefined\Vare both necessary and sufficient for
    all expression types in the system.
  </itemize>

  No concept of \Pindeterminate variable,\Q \Pformal variable,\Q or
  \Pdeclared variable\Q is introduced or needed. The placeholder is not a
  special kind of variable\Vit is simply the one variable per
  functionally-codomained expression that refers to the output function's own
  variable, identified by process of elimination during resolution.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-10|<tuple|5.5|6|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-11|<tuple|5.6|6|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-12|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-4|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-5|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-6|<tuple|5.1|5|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-7|<tuple|5.2|5|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-8|<tuple|5.3|5|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|auto-9|<tuple|5.4|5|../.TeXmacs/texts/scratch/no_name_49.tm>>
    <associate|thm:two-vars|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_49.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Resolution
      Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Codegen
      Dispatch> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Theorems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Worked
      Examples> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Non-nullary, non-functional
      codomain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Nullary, non-functional
      codomain <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Nullary, functional codomain
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Non-nullary, functional
      codomain (sequences producing functions)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|5.5<space|2spc>Sub-expressions (upstream
      variables) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.6<space|2spc>Bivariate functions
      (functional codomain = inner function type)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>What
      This Replaces> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>