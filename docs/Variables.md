
# Variable Resolution in arb4j Expression Compiler

## 1. Variable Type Classification

| Variable Type | Storage Location | Declared In | Purpose | Example |
| :-- | :-- | :-- | :-- | :-- |
| **Context Variable** | `Context.variables` map, accessed via field `this.context` | `Context.visitField("context", "Larb/expressions/Context;")` | Shared state across multiple expressions | `π`, `e`, user-defined vars |
| **Independent Variable** | Method parameter slot 1 (`ALOAD 1`) / Field `this.<name>` (`GETFIELD className name typeDesc`) | `ClassVisitor.visitField(ACC_PUBLIC, name, typeDesc, null, null)` | Domain input for `evaluate(D input, ...)` | `j→j²+1` where `j` is independent |
| **Indeterminate Variable** | `Expression.indeterminateVariables` Stack<VariableNode> | No bytecode (parse-time only) | Placeholder for functional/polynomial ops | `f(x) = ∫g(t,x)dt` where `t` is indeterminate |
| **Ascendent Input** | Field in nested expr class: `nestedClassName.<varName>` | `nestedExpr.declareVariables()` via parent propagation | Parent's independent var propagated to child | `μfunc`'s `j` field referencing parent `μ`'s `j` |

## 2. Variable Resolution Rules

### 2.1 Resolution Priority (in `resolveIdentifier`)

| Priority | Check | Action | Map Updated |
| :-- | :-- | :-- | :-- |
| 1 | `indeterminateVariables.contains(name)` | Return existing `VariableNode` from stack | None |
| 2 | `independentVariable.getName().equals(name)` | Return `independentVariable` | None |
| 3 | `context.getVariable(name) != null` | Create `VariableNode`, add to `referencedVariables` | `referencedVariables` |
| 4 | `context.getFunctionNames().contains(name)` | Create `FunctionNode`, add to `referencedFunctions` | `referencedFunctions` |
| 5 | None match | Throw `CompilerException("undefined variable")` | N/A |

### 2.2 Map Invariants

| Map | **MUST** Contain | **MUST NOT** Contain |
| :-- | :-- | :-- |
| `referencedVariables` | Context variables only | Independent variables, indeterminate variables, ascendent inputs |
| `referencedFunctions` | Context functions, nested operand functions | Built-in operators |
| `indeterminateVariables` | Lambda params, integration vars, polynomial placeholders | Regular domain variables |

## 3. Field Declaration Logic (`declareVariables`)

### 3.1 Current Behavior

| Field Source | Declaration Condition | Problem |
| :-- | :-- | :-- |
| Ascendent's independent var | `ascendentExpression.independentVariable != null` | ✓ Works |
| Referenced variables | `referencedVariables.entrySet()` where `!varNode.isIndependent && !varNode.isIndeterminate` | ✓ Works for context vars |
| **This expression's independent var** | **NEVER** | **❌ MISSING - causes `NoSuchFieldError`** |

### 3.2 Proposed Behavior

| Field Source | Declaration Condition | Rationale |
| :-- | :-- | :-- |
| **This expression's independent var** | `independentVariable != null && !independentVariable.type().equals(Object.class)` | **Enable ascendent-input propagation** |
| Ascendent's independent var | Same as current + skip if duplicate name | Backward compatible |
| Referenced variables (context) | Same as current | No change |

## 4. Initialization Semantics

### 4.1 Constructor (`generateConstructor`)

| Component | Current | Proposed | Difference |
| :-- | :-- | :-- | :-- |
| Super constructor | ✓ Called | ✓ Called | None |
| Context field | ✓ `new Context()` | ✓ `new Context()` | None |
| Literal constants | ✓ `new Real()` etc. | ✓ `new Real()` etc. | None |
| Intermediate vars | ✓ `new Real()` etc. | ✓ `new Real()` etc. | None |
| **Independent var field** | **❌ Not allocated** | **✓ `this.j = new Integer()`** | **Establishes shared reference** |

### 4.2 Initializer (`initialize` method)

| Step | Bytecode Pattern | Purpose |
| :-- | :-- | :-- |
| 1. Check `isInitialized` | `GETFIELD isInitialized; IFEQ` | Prevent re-init |
| 2. Propagate context vars | `this.nestedFunc.contextVar = this.context.get("contextVar")` | Wire context |
| 3. Propagate context funcs | `this.nestedFunc.contextFunc = this.context.getFunction("contextFunc")` | Wire functions |
| 4. **Propagate ascendent inputs** | `this.nestedFunc.j = this.j` | **Share parent's independent var by reference** |
| 5. Propagate context to nested | `this.nestedFunc.context = this.context` | Share context |
| 6. Init nested functions | `this.nestedFunc.initialize()` | Recursive init |
| 7. Set `isInitialized = true` | `ICONST_1; PUTFIELD isInitialized` | Mark done |

### 4.3 Evaluation (`evaluate` method)

#### Current Behavior (Independent Var as Parameter Only)

```
evaluate(D input, int order, int bits, C result):
  [order check if needed]
  if (!isInitialized) initialize()
  // input parameter used directly in AST generation
  result = [AST evaluation using ALOAD 1 for input]
  return result
```

**Problem**: When nested functions hold `this.j` field reference, parent never updates it → stale values.

#### Proposed Behavior (Independent Var as Shared Field)

```
evaluate(D input, int order, int bits, C result):
  [order check if needed]
  this.j.set((Integer)input)  // Copy input INTO shared field by value
  if (!isInitialized) initialize()
  result = [AST evaluation]
  return result
```

**Fix**: Field `this.j` is updated every call; nested functions see current value.

## 5. Propagation Matrix

### 5.1 Variable Propagation (`propagateAscendentInputVariablesToNestedFunctions`)

| Parent Has | Nested Needs | Current Bytecode | Works? |
| :-- | :-- | :-- | :-- |
| `context.var` | `context.var` | `this.nested.var = this.context.get("var")` | ✓ Yes |
| `independentVariable j` | Field `j` | `this.nested.j = this.j` | **❌ No - field doesn't exist** |
| **After fix:** |  |  |  |
| `independentVariable j` + field `j` | Field `j` | `this.nested.j = this.j` | **✓ Yes** |

### 5.2 Iterator Pattern (Current Implementation)

```java
for (var entry : nestedExpr.referencedVariables.entrySet()) {
  String varName = entry.getKey();
  // Skip if context variable
  if (context != null && context.getVariable(varName) != null) continue;
  // Remaining are "ascendent input" - emit: this.nested.<varName> = this.<varName>
  mv.visitFieldInsn(GETFIELD, className, varName, varTypeDesc);
  // ↑ THIS FAILS if varName is parent's independent var but no field was declared
}
```


## 6. Type Flow Analysis

### 6.1 Independent Variable Type Resolution

| Expression | `independentVariable.type()` | `domainType` | Field Type |
| :-- | :-- | :-- | :-- |
| `j→j+1` in `μ` | `Integer.class` | `Integer.class` | `Larb/Integer;` |
| Nested operand in `μfunc` | Initially `Object.class` → resolved to `Integer.class` | `Integer.class` | `Larb/Integer;` |

### 6.2 Field Allocation Decision Table

| Condition | Current | Proposed |
| :-- | :-- | :-- |
| `independentVariable == null` | No field | No field |
| `independentVariable.type().equals(Object.class)` | No field | No field |
| `independentVariable != null && concrete type` | **No field** | **Declare field** |
| Nested function exists that uses it | N/A (not checked) | Already covered by above |

## 7. Code Changes Required

### 7.1 `declareVariables(ClassVisitor)`

**Addition at start of method:**

```java
// NEW: Declare this expression's own independent variable as a field
if (independentVariable != null 
    && !independentVariable.type().equals(Object.class)) {
  classVisitor.visitField(ACC_PUBLIC,
                          independentVariable.getName(),
                          independentVariable.type().descriptorString(),
                          null, null);
}
```

**Skip logic adjustment (prevent duplicate if ascendent has same name):**

```java
// In ascendent independent var section:
if (ascendentExpression != null) {
  var ascendentIndep = ascendentExpression.independentVariable;
  if (ascendentIndep != null && !ascendentIndep.type().equals(Object.class)) {
    // NEW: Skip if already declared above
    boolean alreadyDeclared = 
      (independentVariable != null 
       && independentVariable.getName().equals(ascendentIndep.reference.name));
    if (!alreadyDeclared) {
      classVisitor.visitField(ACC_PUBLIC, ...);
    }
  }
}
```


### 7.2 `generateConstructor(ClassVisitor)`

**Addition after `generateIntermediateVariableInitializers(mv)`:**

```java
// NEW: Allocate the independent variable field
if (independentVariable != null 
    && !independentVariable.type().equals(Object.class)) {
  loadThisOntoStack(mv);
  generateNewObjectInstruction(mv, independentVariable.type());
  duplicateTopOfTheStack(mv);
  invokeDefaultConstructor(mv, independentVariable.type());
  mv.visitFieldInsn(PUTFIELD,
                    className,
                    independentVariable.getName(),
                    independentVariable.type().descriptorString());
}
```


### 7.3 `generateEvaluationMethod(ClassVisitor)`

**Addition after `designateLabel(mv, startLabel)` and `annotateWithOverride(mv)`:**

```java
// NEW: Copy input parameter into field by value
if (independentVariable != null 
    && !independentVariable.type().equals(Object.class)) {
  loadThisOntoStack(mv);
  mv.visitFieldInsn(GETFIELD,
                    className,
                    independentVariable.getName(),
                    independentVariable.type().descriptorString());
  mv.visitVarInsn(ALOAD, 1);  // Load input parameter
  mv.visitTypeInsn(CHECKCAST, Type.getInternalName(independentVariable.type()));
  invokeVirtualMethod(mv,
                      independentVariable.type(),
                      "set",
                      independentVariable.type(),
                      independentVariable.type());
  mv.visitInsn(Opcodes.POP);  // Discard return value
}
```


## 8. Correctness Guarantees

| Property | Before Fix | After Fix |
| :-- | :-- | :-- |
| `propagateAscendentInputs` can reference `this.<indepVar>` | ❌ `NoSuchFieldError` | ✓ Field exists |
| Independent var value updated per evaluation | ✓ (via parameter) | ✓ (via field.set) |
| Nested functions see current value | ❌ (no shared reference) | ✓ (shared field reference) |
| Context variables still work | ✓ | ✓ (unchanged) |
| Stack map frames valid | ✓ | ✓ (COMPUTE_FRAMES handles it) |
| Memory overhead | Minimal | +1 field per expression with independent var |

## 9. Edge Cases

| Scenario | Handling |
| :-- | :-- |
| Independent var name == context var name | Constructor check already throws `CompilerException` |
| Ascendent and child have same independent var name | Skip duplicate declaration in `declareVariables` |
| No independent variable (`nullary function`) | All checks guard with `independentVariable != null` |
| Independent var type unresolved (`Object.class`) | Skip field declaration (defensive check) |
| Multiple levels of nesting | Recursive `initialize()` propagates correctly |

## 10. Performance Impact

| Aspect | Impact | Magnitude |
| :-- | :-- | :-- |
| Additional field per expression | +8 bytes/instance | Negligible |
| Constructor allocation overhead | +1 `NEW` + `INVOKESPECIAL` | ~10-20ns one-time |
| Evaluation overhead | +1 `GETFIELD` + `INVOKEVIRTUAL(set)` | ~5-10ns per call |
| Nested function propagation | Same bytecode, now resolvable | 0 (was broken) |
| JIT optimization potential | Field access predictable | Likely inlined |

## 11. Addendum: Why `referencedVariables` Must Not Drive This

| Incorrect Approach | Why It's Wrong |
| :-- | :-- |
| Check `nestedExpr.referencedVariables.contains(parent.independentVariable.getName())` | Violates invariant: `referencedVariables` is for **context variables only** |
| Infer ascendent-input needs from `referencedVariables` | Coupling: parent field allocation depends on child's internal map state |
| Use `referencedVariables` for both context and ascendent tracking | Semantic overload: one map serving two unrelated purposes |

**Correct Approach**: Independent variable field allocation is a **uniform, unconditional** property of any expression with a non-`Object` independent variable. No introspection of nested expressions required.
