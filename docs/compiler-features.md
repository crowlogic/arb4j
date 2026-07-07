# Compiler features

Canonical feature names used by `docs/test-catalog.md`. Section headings here are the only non-`none` compiler-feature labels used in the merged test catalog.

## Unicode surface syntax and literal parsing
**Brief description:** The parser accepts arb4j's Unicode-heavy surface language, including Greek identifiers, superscripts/subscripts, fraction glyphs, mathematical constants, and normalized string rendering of parsed expressions.
**Key source files/classes:** `src/main/java/arb/expressions/Parser.java`, `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/LiteralConstantNode.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testOneHalfMinusXOver2](test-catalog.md#complexrationalfunctiontesttestonehalfminusxover2)
- [ComplexRationalFunctionTest.testOneHalfMinusXOver2Squared](test-catalog.md#complexrationalfunctiontesttestonehalfminusxover2squared)
- [RationalFunctionTest.testOneHalfMinusXOver2](test-catalog.md#rationalfunctiontesttestonehalfminusxover2)
- [RationalFunctionTest.testOneHalfMinusXOver2Squared](test-catalog.md#rationalfunctiontesttestonehalfminusxover2squared)
- [ExpressionTest.testImaginary](test-catalog.md#expressiontesttestimaginary)

## Bounded variable metadata
**Brief description:** Independent variables can carry interval metadata via `∈` syntax, and the compiler preserves those bounds as variable-range metadata instead of treating them as ordinary arithmetic.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/VariableReference.java`, `src/main/java/arb/expressions/VariableRange.java`
**Representative tests:**
- [BoundedVariableParsingTest.testOpenIntervalBounds](test-catalog.md#boundedvariableparsingtesttestopenintervalbounds)
- [BoundedVariableParsingTest.testClosedIntervalBounds](test-catalog.md#boundedvariableparsingtesttestclosedintervalbounds)
- [BoundedVariableParsingTest.testHalfOpenLeftClosedBounds](test-catalog.md#boundedvariableparsingtesttesthalfopenleftclosedbounds)
- [BoundedVariableParsingTest.testHalfOpenRightClosedBounds](test-catalog.md#boundedvariableparsingtesttesthalfopenrightclosedbounds)
- [BoundedVariableParsingTest.testNonTrivialBounds](test-catalog.md#boundedvariableparsingtesttestnontrivialbounds)

## Nested functional declarations
**Brief description:** Multi-parameter declarations are normalized into nested arrows, yielding higher-order generated functions with captured upstream parameters and stable rendering.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/Node.java`, `src/main/java/arb/expressions/nodes/VariableNode.java`
**Representative tests:**
- [AutofunctionTest.testTwoParameterDeclarationMatchesArrowChain](test-catalog.md#autofunctiontesttesttwoparameterdeclarationmatchesarrowchain)
- [AutofunctionTest.testSingleParameterDeclarationMatchesArrow](test-catalog.md#autofunctiontesttestsingleparameterdeclarationmatchesarrow)
- [AutofunctionTest.testNamedDeclarationMatchesAnonymous](test-catalog.md#autofunctiontesttestnameddeclarationmatchesanonymous)
- [BesselTargetHoistingTest.testJOfKXIsNotHoisted](test-catalog.md#besseltargethoistingtesttestjofkxisnothoisted)
- [BesselTargetHoistingTest.testCompositeDependsOnlyOnBoundParameters](test-catalog.md#besseltargethoistingtesttestcompositedependsonlyonboundparameters)

## Functional application and reified function evaluation
**Brief description:** Compiled expressions can produce, return, and invoke function-valued results, including partial evaluation, nested application, and evaluation of reified sequence/polynomial/function objects.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/unary/FunctionalEvaluationNode.java`, `src/main/java/arb/expressions/nodes/unary/FunctionNode.java`, `src/main/java/arb/expressions/Expression.java`
**Representative tests:**
- [RealPolynomialTest.testIntegralOfSequenceofPolynomialElement](test-catalog.md#realpolynomialtesttestintegralofsequenceofpolynomialelement)
- [RealExpressionTest.testSFunction](test-catalog.md#realexpressiontesttestsfunction)
- [RealExpressionTest.testSFunctionWithVar](test-catalog.md#realexpressiontesttestsfunctionwithvar)
- [RealExpressionTest.testTanhLogOne](test-catalog.md#realexpressiontesttesttanhlogone)
- [IntegralNodeTest.testFunctionOfPolynomialElementOfAContextualSequence](test-catalog.md#integralnodetesttestfunctionofpolynomialelementofacontextualsequence)

## Context-based symbol resolution and namespace management
**Brief description:** Shared `Context` instances manage variables, function mappings, namespace separation, merge policies, identity sharing, and reference injection for generated evaluators.
**Key source files/classes:** `src/main/java/arb/expressions/Context.java`, `src/main/java/arb/expressions/FunctionMapping.java`, `src/main/java/arb/expressions/context/FunctionMappings.java`, `src/main/java/arb/expressions/Expression.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomials](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomials)
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomialsasnullary)
- [ComplexRationalFunctionTest.testPowers](test-catalog.md#complexrationalfunctiontesttestpowers)
- [ComplexRationalFunctionTest.testRationalIdentityExpression](test-catalog.md#complexrationalfunctiontesttestrationalidentityexpression)
- [RationalFunctionTest.testPowers](test-catalog.md#rationalfunctiontesttestpowers)

## Typed expression compilation and codomain promotion
**Brief description:** The compiler infers domain/codomain types, promotes compatible numeric forms, and generates typed evaluators for real, complex, rational, polynomial, matrix, and sequence-valued expressions.
**Key source files/classes:** `src/main/java/arb/expressions/Compiler.java`, `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/binary/BinaryOperationNode.java`, `src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java`, `src/main/java/arb/expressions/nodes/unary/FunctionalEvaluationNode.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomialsasnullary)
- [ComplexRationalFunctionTest.testRationalIdentityExpression](test-catalog.md#complexrationalfunctiontesttestrationalidentityexpression)
- [ComplexRationalFunctionTest.testXOver2](test-catalog.md#complexrationalfunctiontesttestxover2)
- [ComplexRationalFunctionTest.testOneHalfMinusXOver2](test-catalog.md#complexrationalfunctiontesttestonehalfminusxover2)
- [ComplexRationalFunctionTest.testXToThePowerOfNegativeOne](test-catalog.md#complexrationalfunctiontesttestxtothepowerofnegativeone)

## Bytecode generation and class loading
**Brief description:** Parsed expressions are compiled to JVM bytecode with ASM, loaded through `ExpressionClassLoader`, and emitted under either short or context-qualified class identities while honoring generated evaluate/result-buffer contracts.
**Key source files/classes:** `src/main/java/arb/expressions/Compiler.java`, `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/ExpressionClassLoader.java`, `src/main/java/arb/expressions/GenerationContext.java`, `src/main/java/arb/expressions/Context.java`
**Representative tests:**
- [ContextPackageIdentityTest.testUnpackagedContextProducesShortNameClass](test-catalog.md#contextpackageidentitytesttestunpackagedcontextproducesshortnameclass)
- [ContextPackageIdentityTest.testPackagedContextProducesQualifiedClass](test-catalog.md#contextpackageidentitytesttestpackagedcontextproducesqualifiedclass)
- [ContextPackageIdentityTest.testTwoPackagedContextsCoexistWithSameShortName](test-catalog.md#contextpackageidentitytesttesttwopackagedcontextscoexistwithsameshortname)
- [ContextPackageIdentityTest.testPackagedContextNAryOperationCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextnaryoperationcodegen)
- [ContextPackageIdentityTest.testPackagedContextDerivativeCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextderivativecodegen)

## Common-subexpression elimination
**Brief description:** Repeated non-constant subtrees are placed into congruence classes and rewritten to shared cached nodes backed by one generated field.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/CachedNode.java`, `src/main/java/arb/expressions/nodes/SharedNode.java`, `src/main/java/arb/expressions/nodes/CongruenceClass.java`
**Representative tests:**
- [NodeEqualsNoStackOverflowTest.testNodeEqualsDoesNotOverflow](test-catalog.md#nodeequalsnostackoverflowtesttestnodeequalsdoesnotoverflow)
- [NodeEqualsNoStackOverflowTest.testRootNodeEqualsBetweenSeparateCompilationsDoesNotOverflow](test-catalog.md#nodeequalsnostackoverflowtesttestrootnodeequalsbetweenseparatecompilationsdoesnotoverflow)
- [NodeEqualsNoStackOverflowTest.testExpressionEqualsDoesNotOverflow](test-catalog.md#nodeequalsnostackoverflowtesttestexpressionequalsdoesnotoverflow)
- [RealExpressionTest.testCommonSubExpressionReuse](test-catalog.md#realexpressiontesttestcommonsubexpressionreuse)
- [SharedNodeStaticHoistingTest.testSharedSubtreeWithBuriedStaticNodeEvaluatesWithoutNaN](test-catalog.md#sharednodestatichoistingtesttestsharedsubtreewithburiedstaticnodeevaluateswithoutnan)

## Static hoisting and cache invalidation
**Brief description:** Input-invariant subtrees are hoisted into generated static-evaluation paths, collapsed to fixed points across nested functions, and invalidated when cached inputs or precisions change.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/CachedNode.java`, `src/main/java/arb/expressions/nodes/StaticNode.java`
**Representative tests:**
- [BesselTargetFlatHoistingTest.testJOfKXIsNotHoisted](test-catalog.md#besseltargetflathoistingtesttestjofkxisnothoisted)
- [BesselTargetFlatHoistingTest.testExactlyOneCompositeStaticNode](test-catalog.md#besseltargetflathoistingtesttestexactlyonecompositestaticnode)
- [BesselTargetFlatHoistingTest.testCompositeDependsOnlyOnContextVariables](test-catalog.md#besseltargetflathoistingtesttestcompositedependsonlyoncontextvariables)
- [BesselTargetFlatHoistingTest.testHoistingIsAtFixedPoint](test-catalog.md#besseltargetflathoistingtesttesthoistingisatfixedpoint)
- [BesselTargetHoistingTest.testJOfKXIsNotHoisted](test-catalog.md#besseltargethoistingtesttestjofkxisnothoisted)

## Recursive and mutually recursive compilation
**Brief description:** The compiler supports self-recursive and mutually recursive generated functions and sequences, including recurrence-driven code paths that must share one class loader and context.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/Context.java`, `src/main/java/arb/expressions/FunctionMapping.java`, `src/main/java/arb/expressions/ExpressionClassLoader.java`
**Representative tests:**
- [RealPolynomialTest.testIntegralOfSequenceofPolynomialElement](test-catalog.md#realpolynomialtesttestintegralofsequenceofpolynomialelement)
- [RecurrentSequenceStressTest.directFormula](test-catalog.md#recurrentsequencestresstestdirectformula)
- [RecurrentSequenceStressTest.selfRecursive](test-catalog.md#recurrentsequencestresstestselfrecursive)
- [RecurrentSequenceStressTest.mutualPair](test-catalog.md#recurrentsequencestresstestmutualpair)
- [RecurrentSequenceStressTest.mutualTriple](test-catalog.md#recurrentsequencestresstestmutualtriple)

## Arithmetic and algebraic operator nodes
**Brief description:** Core arithmetic AST nodes cover addition, subtraction, multiplication, division, powers, negation, factorial-style operators, constant folding, and algebraic simplifications.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/binary/AdditionNode.java`, `src/main/java/arb/expressions/nodes/binary/SubtractionNode.java`, `src/main/java/arb/expressions/nodes/binary/MultiplicationNode.java`, `src/main/java/arb/expressions/nodes/binary/DivisionNode.java`, `src/main/java/arb/expressions/nodes/binary/ExponentiationNode.java`, `src/main/java/arb/expressions/nodes/binary/RisingFactorialNode.java`, `src/main/java/arb/expressions/nodes/unary/NegationNode.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomials](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomials)
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomialsasnullary)
- [ComplexRationalFunctionTest.testPowers](test-catalog.md#complexrationalfunctiontesttestpowers)
- [ComplexRationalFunctionTest.testXOver2](test-catalog.md#complexrationalfunctiontesttestxover2)
- [ComplexRationalFunctionTest.testOneHalfMinusXOver2](test-catalog.md#complexrationalfunctiontesttestonehalfminusxover2)

## Summation and product operators
**Brief description:** `Σ`/`∏` and related range syntax compile to bounded accumulation loops, including nested forms and sequence-valued operands.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java`, `src/main/java/arb/expressions/nodes/nary/SumNode.java`, `src/main/java/arb/expressions/nodes/nary/ProductNode.java`
**Representative tests:**
- [ContextPackageIdentityTest.testPackagedContextNAryOperationCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextnaryoperationcodegen)
- [ConvergentSumTest.testConvergentInfiniteSum](test-catalog.md#convergentsumtesttestconvergentinfinitesum)
- [ConvergentSumTest.testFixedBoundSumUnchanged](test-catalog.md#convergentsumtesttestfixedboundsumunchanged)
- [ExpressionTest.testSubstitutionToo](test-catalog.md#expressiontesttestsubstitutiontoo)
- [ExpressionTest.testSubstitutionToo2](test-catalog.md#expressiontesttestsubstitutiontoo2)

## Index access
**Brief description:** Postfix indexing resolves coefficient and element access over vector-like, polynomial-like, and sequence-like values by generating the appropriate `get(...)` path.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/IndexAccessNode.java`, `src/main/java/arb/expressions/nodes/VariableNode.java`, `src/main/java/arb/expressions/Compiler.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomials](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomials)
- [ComplexRationalFunctionTest.testPowers](test-catalog.md#complexrationalfunctiontesttestpowers)
- [RationalFunctionTest.testPowers](test-catalog.md#rationalfunctiontesttestpowers)
- [RealPolynomialTest.testIntegralOfSequenceofPolynomialElement](test-catalog.md#realpolynomialtesttestintegralofsequenceofpolynomialelement)
- [ExpressionTest.testVariableIndexedByASquareBracketedConstantAndMultipliedByTheDefactoInput](test-catalog.md#expressiontesttestvariableindexedbyasquarebracketedconstantandmultipliedbythedefactoinput)

## Symbolic differentiation
**Brief description:** The compiler parses function-form, Leibniz-form, combining-mark, Jacobian, and higher-order derivatives, then applies node-specific symbolic differentiation rules.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/DerivativeNode.java`, `src/main/java/arb/expressions/nodes/Node.java`, `src/main/java/arb/expressions/nodes/unary/FunctionNode.java`, `src/main/java/arb/expressions/nodes/binary/ExponentiationNode.java`
**Representative tests:**
- [ContextPackageIdentityTest.testPackagedContextDerivativeCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextderivativecodegen)
- [ExpressionTest.testDerivative](test-catalog.md#expressiontesttestderivative)
- [ExpressionTest.testDerivativeToo](test-catalog.md#expressiontesttestderivativetoo)
- [ExpressionTest.testRealFunctionDerivative](test-catalog.md#expressiontesttestrealfunctionderivative)
- [ExpressionTest.testRationalFunctionDerivative](test-catalog.md#expressiontesttestrationalfunctionderivative)

## Jet nodes and Taylor-series generation
**Brief description:** Jet-capable built-ins share computed jet state across consumers, while non-jet expressions fall back to generated derivative caches for Taylor coefficients.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/unary/JetNode.java`, `src/main/java/arb/expressions/nodes/unary/JetState.java`, `src/main/java/arb/expressions/nodes/unary/RiemannSiegelThetaJetNode.java`
**Representative tests:**
- [JetDerivativeOverhaulTest.testJetCoefficientsMatchReference](test-catalog.md#jetderivativeoverhaultesttestjetcoefficientsmatchreference)
- [JetDerivativeOverhaulTest.testJetStateDeduplication](test-catalog.md#jetderivativeoverhaultesttestjetstatededuplication)
- [JetDerivativeOverhaulTest.testSharedJetTwoConsumers](test-catalog.md#jetderivativeoverhaultesttestsharedjettwoconsumers)
- [JetDerivativeOverhaulTest.testJetDifferentiationReadsCorrectCoefficient](test-catalog.md#jetderivativeoverhaultesttestjetdifferentiationreadscorrectcoefficient)
- [JetDerivativeOverhaulTest.testTaylorSeriesPathNonJet](test-catalog.md#jetderivativeoverhaultesttesttaylorseriespathnonjet)

## Symbolic integration
**Brief description:** `int`/`∫` nodes build symbolic antiderivatives and definite integrals, including contextual function references, tree rewrites, integration by parts, and selected distribution-aware simplifications.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/IntegralNode.java`, `src/main/java/arb/expressions/nodes/binary/Integration.java`, `src/main/java/arb/expressions/nodes/unary/FunctionNode.java`, `src/main/java/arb/expressions/Expression.java`
**Representative tests:**
- [RealPolynomialTest.testIntegralOfSequenceofPolynomialElement](test-catalog.md#realpolynomialtesttestintegralofsequenceofpolynomialelement)
- [ContextPackageIdentityTest.testPackagedContextSymbolicIntegralCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextsymbolicintegralcodegen)
- [ExpressionTest.testIntegralOfAConstant](test-catalog.md#expressiontesttestintegralofaconstant)
- [ErrorFunctionDerivativeTest.testErfDerivative](test-catalog.md#errorfunctionderivativetesttesterfderivative)
- [ErrorFunctionDerivativeTest.testErfiDerivative](test-catalog.md#errorfunctionderivativetesttesterfiderivative)

## Numerical integration
**Brief description:** `nint(...)` selects explicit numerical quadrature, wiring a cached trapezoid integrator and numerical-integral node instead of symbolic antiderivative generation.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/NumericalIntegralNode.java`, `src/main/java/arb/expressions/nodes/IntegralNode.java`, `src/main/java/arb/expressions/FunctionMapping.java`
**Representative tests:**
- [ContextPackageIdentityTest.testPackagedContextNumericalIntegralCodegen](test-catalog.md#contextpackageidentitytesttestpackagedcontextnumericalintegralcodegen)
- [NumericalIntegralNodeContextTest.testOuterFreeVariableInIntegrand](test-catalog.md#numericalintegralnodecontexttesttestouterfreevariableinintegrand)
- [NumericalIntegralNodeTest.testSinIntegralDefaultN](test-catalog.md#numericalintegralnodetesttestsinintegraldefaultn)
- [NumericalIntegralNodeTest.testExplicitPanelCount](test-catalog.md#numericalintegralnodetesttestexplicitpanelcount)
- [NumericalIntegralNodeTest.testExplicitPanelWidth](test-catalog.md#numericalintegralnodetesttestexplicitpanelwidth)

## Fractional calculus
**Brief description:** The compiler supports Caputo fractional derivatives and Riemann–Liouville fractional integrals in parsed operator form and in closed-form special cases for monomials and selected built-ins.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/CaputoFractionalDerivativeNode.java`, `src/main/java/arb/expressions/nodes/RiemannLiouvilleFractionalIntegralNode.java`, `src/main/java/arb/expressions/nodes/Node.java`, `src/main/java/arb/expressions/nodes/unary/MittagLefflerFunctionNode.java`
**Representative tests:**
- [FractionTest.testRaiseIntegerToFractionalPower](test-catalog.md#fractiontesttestraiseintegertofractionalpower)
- [CaputoFractionalDerivativeNodeTest.testFracdiffParserConstructorDoesNotNPE](test-catalog.md#caputofractionalderivativenodetesttestfracdiffparserconstructordoesnotnpe)
- [CaputoFractionalDerivativeNodeTest.testFracdiffTwiceOnSameContextDoesNotThrow](test-catalog.md#caputofractionalderivativenodetesttestfracdifftwiceonsamecontextdoesnotthrow)
- [CaputoFractionalDerivativeNodeTest.testFracdiffOfUnnamedFunctionThrowsInsteadOfInfiniteRecurse](test-catalog.md#caputofractionalderivativenodetesttestfracdiffofunnamedfunctionthrowsinsteadofinfiniterecurse)
- [CaputoFractionalDerivativeNodeTest.testFracdiffOfContextualFunction](test-catalog.md#caputofractionalderivativenodetesttestfracdiffofcontextualfunction)

## Limit evaluation
**Brief description:** `lim(...)` binds a limiting variable and simplifies or evaluates the operand at the specified point when direct substitution is valid.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/LimitNode.java`, `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/VariableReference.java`
**Representative tests:**
- [LimitNodeTest.testLimitSubstitutesBoundVariableAtThePoint](test-catalog.md#limitnodetesttestlimitsubstitutesboundvariableatthepoint)
- [LimitNodeTest.testLimitOfExpressionIndependentOfBoundVariableReturnsOperand](test-catalog.md#limitnodetesttestlimitofexpressionindependentofboundvariablereturnsoperand)

## Inverse-function notation and series reversion
**Brief description:** The parser distinguishes multiplicative inverse from compositional inverse syntax, and inverse-function nodes generate inverse evaluators through the dedicated inverse-function path.
**Key source files/classes:** `src/main/java/arb/expressions/nodes/unary/InverseFunctionNode.java`, `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/unary/FunctionNode.java`
**Representative tests:**
- [VariableNodeResolutionTest.testNullaryRationalFunctionInverse](test-catalog.md#variablenoderesolutiontesttestnullaryrationalfunctioninverse)
- [InverseFunctionNodeTest.testMultiplicativeInverse](test-catalog.md#inversefunctionnodetesttestmultiplicativeinverse)
- [InverseFunctionNodeTest.testCompositionalInverseParsesToInverseFunctionNode](test-catalog.md#inversefunctionnodetesttestcompositionalinverseparsestoinversefunctionnode)
- [InverseFunctionTest.testExpressionCompilerInverseFunction](test-catalog.md#inversefunctiontesttestexpressioncompilerinversefunction)

## Built-in function and special-function nodes
**Brief description:** Built-in name resolution maps selected functions to dedicated AST nodes or specialized generation paths for transcendental, hypergeometric, and number-theoretic functions.
**Key source files/classes:** `src/main/java/arb/expressions/Expression.java`, `src/main/java/arb/expressions/nodes/unary/BesselFunctionNodeOfTheFirstKind.java`, `src/main/java/arb/expressions/nodes/unary/GammaFunctionNode.java`, `src/main/java/arb/expressions/nodes/unary/HypergeometricFunctionNode.java`, `src/main/java/arb/expressions/nodes/unary/FoxHFunctionNode.java`, `src/main/java/arb/expressions/nodes/unary/MittagLefflerFunctionNode.java`
**Representative tests:**
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomials](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomials)
- [ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary](test-catalog.md#complexrationalfunctiontesttestcomplexrationallommelpolynomialsasnullary)
- [ExpressionTest.testLogGamma](test-catalog.md#expressiontesttestloggamma)
- [ExpressionTest.testAbsoluteValue](test-catalog.md#expressiontesttestabsolutevalue)
- [ExpressionTest.testGammaReal](test-catalog.md#expressiontesttestgammareal)
