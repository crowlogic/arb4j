# Essay 2: Root cause — where `this.a == this` got set

## The deterministic trace

Probe of `RiccatiMuntzPadeFunctional.muntzBasis()`:

```
a identityHash:   388357135
a.a identityHash: 388357135
a == a.a ? true
```

`this.a` IS `this`. Same Java object. Recursive call `this.a.evaluate(k-1)` is literally `this.evaluate(k-1)` on the same instance, sharing all scratch fields.

## How it got set

`Expression.instantiate()`:

```java
public F instantiate() {
   instance = newInstance();       // creates a@outer
   instantiateAndInjectReferencedFunctions(instance);   // ← walks operandF0001
   injectContextFunctionAndVariableReferences(instance);
   ...
}
```

`Expression.instance` is a mutable field on the Expression object. When `instantiateAndInjectReferencedFunctions` walks operandF0001 (the sub-expression for the Σ in a's body), operandF0001's own iAIRF walks its referenced functions and hits `a`. It calls `FunctionMapping["a"].instantiate()`.

`FunctionMapping["a"].instantiateInProgress` was FALSE at this point (the outer `a` was instantiated via `Function.express → Expression.instantiate`, not via `FunctionMapping.instantiate`, so the mapping's flag was never set). So the nested `mapping["a"].instantiate()` proceeds: sets the flag, calls `expression.compile()`, then calls `expression.instantiate()` again.

The recursive `expression.instantiate()` does `instance = newInstance()` AGAIN — overwriting `Expression.instance` from a@outer to a@inner. a@outer is now ghosted.

`FunctionMapping["a"].instance` was set to a@inner by the recursive `instantiate()`'s `return instance = expression.instantiate();`.

The outer `Expression.instantiate()` continues with `instance == a@inner` (because the field was overwritten). Its `injectContextFunctionAndVariableReferences(instance)` runs on a@inner. injectFunctionReferences walks `context.functions`. For "a" with `instance == a@inner == f`, it does `field.set(a@inner, a@inner)` — setting `a@inner.a = a@inner`. **Self-alias.**

## Why Chebyshev T doesn't hit this

T's body has no operand sub-expression — no Σ. So T's iAIRF walks `getReferencedFunctions()` and finds only the self-ref "T", which it skips at the `if (referencedFunctionName.equals(functionName)) continue;` guard. No nested `mapping.instantiate()`. No ghost. `mapping["T"].instance` stays null through outer T's instantiate, so injection skips, and `T.T` stays null. Then `generateSelfReference`'s bytecode at first `initialize()` does `if (this.T == null) this.T = new T()` — separate instance. Works.

## The fix

Two guards:

1. **`Expression.instantiate()`** — set `functionMapping.instantiateInProgress = true` before descending into iAIRF. This stops the ghost-instance creation when a sub-expression's iAIRF recurses back through `mapping.instantiate()` on the same mapping.

2. **`Context.injectFunctionReferences()`** — skip `field.set(f, mapping.instance)` when `mapping.instance == f`. Even if some other path published the instance before injection runs, this guard prevents the self-alias from being established by injection.

The bytecode `generateSelfReference` already emits `if (this.<self> == null) this.<self> = new <self>()` — once injection no longer pre-fills the field, this fallback creates a separate instance with its own scratch.
