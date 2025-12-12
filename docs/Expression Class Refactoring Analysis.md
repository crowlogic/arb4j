<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

## Expression Class Refactoring Analysis

The **Expression** class is a monolithic **3000+ line compiler** that conflates six distinct responsibilities:

### **Major Conceptual Groupings**

**1. Parsing Pipeline (15% of methods)**

- Grammar traversal: `resolve()`, `exponentiateMultiplyAndDivide()`, `multiplyAndDivide()`, `addAndSubtract()`
- Token/operand handling: `evaluateOperand()`, `evaluateNumericLiteralConstant()`, `evaluateIndex()`
- Identifier resolution: `resolveIdentifier()`, `resolveFunction()`, `resolveFunctionDerivative()`
- Postfix operators: `resolveFactorials()`, `resolveFloor()`, `resolveAbsoluteValue()`

**Problem:** Creates circular dependency with Node classes that callback into Expression.

**2. Code Generation/Bytecode (25% of methods)**

- High-level generation: `generate()`, `generateEvaluationMethod()`, `generateDerivativeMethod()`, `generateIntegralMethod()`
- Method/constructor builders: `generateConstructor()`, `generateInitializationMethod()`, `generateCloseMethod()`
- Field declaration: `declareFields()`, `declareLiteralConstants()`, `declareVariables()`, `declareFunctionReferences()`
- Initialization: `generateLiteralConstantInitializers()`, `generateIntermediateVariableInitializers()`

**Problem:** Mixed with field allocation; hard to extend for new codomain types (see `newFunctionalExpression()` TODO).

**3. Variable \& Field Management (20% of methods)**

- Allocation: `allocateIntermediateVariable()`, `newIntermediateVariable()`, `newLiteralConstant()`
- Registry: `registerIntermediateVariable()`, `intermediateVariables` HashMap
- Sorting/access: `sortedIntermediateVariables()`, `getSortedLiteralConstantNodes()`, `getConstantCounter()`

**Problem:** Scattered across allocation, declaration, and linking concerns.

**4. Reference Propagation (15% of methods)**

- Context flow: `propagateContext()`, `propagateContextVariables()`, `propagateContextualFunctions()`
- Variable linking: `linkSharedVariableToReferencedFunction()`, `initializeReferencedFunctionVariableReferences()`
- Nested conditionals: `jumpIfNestedFunctionFieldIsNull()`, `copyNestedFunctionFieldByValueIfNestedFunctionFieldIsNotNull()`, `linkNestedFunctionFieldByReferenceWhenItIsNull()`

**Problem:** 3+ methods implementing very similar logic with deep nesting.

**5. Type/Codomain Resolution (8% of methods)**

- Type getters: `getDomainTypeMethodSignature()`, `getCoDomainTypeMethodSignature()`
- Checks: `hasScalarCodomain()`, `hasIndeterminateVariable()`, `thisOrAnyAscendentExpressionHasIndeterminantVariable()`
- **Critical extension point**: `newFunctionalExpression()` with teletype pattern and TODO

**Problem:** Adding support for new codomains (RealSequence, RealPolynomial) requires modifying Expression directly.

**6. State Management (8% of methods)**

- Position tracking: `skipSpaces()`, `nextCharacter()`, `character`, `position` fields
- Variable assignment: `assignIndependentVariable()`, `assignIndeterminantVariable()`, `assignVariable()`
- Assurance checks: `assureNoNumbersInTheInputVariable()`, `assureInputNameHasNotAlreadyBeenAssociatedWithAContextVariable()`

**Problem:** No cohesive state abstraction; scattered throughout.

***

### **Critical Structural Issues**

1. **Single Responsibility Violation**: Does lexing, parsing, AST construction, bytecode generation, runtime management, and registry coordination
2. **Circular Dependencies**: Nodes call back into Expression for `generatedNodes`, `referencedVariables`, `intermediateVariables`
3. **Poor Extension Points**: `newFunctionalExpression()` is teletype pattern with explicit TODO for new types
4. **Complex State**: 26 fields with implicit ordering constraints and invariants
5. **Deep Nesting**: Reference propagation has 3+ levels of conditional bytecode emission logic

***

### **Recommended Refactoring Strategy**

Extract into focused collaborators in priority order:


| Phase | Extract | Benefit | Effort |
| :-- | :-- | :-- | :-- |
| **1** | `VariableManager` | Reduces Expression to ~2400 LOC immediately | 4-6h |
| **2** | `CodomainFactory` (registry pattern) | **Fixes type extension immediately** | 2-3h |
| **3** | `ExpressionParser` | Isolates grammar, enables parser testing | 8-10h |
| **4** | `CodeGenerator` | Reduces Expression to ~1200 LOC | 15-20h |
| **5** | `ReferenceLinker` | Makes propagation logic testable | 10-15h |

**Total effort:** ~40-60 hours, can be done incrementally.

