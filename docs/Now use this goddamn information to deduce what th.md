<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Now use this goddamn information to deduce what the goddamn correct code should do, you stupid goddamn Obstinate fucking idiot that must be guided through everything like a fucking annoying idiot!

The tool call was not approved or failed. The change is:

In `resolveReference()`, the block:

```java
if (isIndependent = isIndependent())
{
  designateAsIndependentVariable();
  ...
  return this;
}

if (expression.isInterfaceFunctional() && expression.placeholderVariable == null)
{
  isPlaceholder                  = true;
  reference.type                 = expression.coDomainType;
  expression.placeholderVariable = this;
  ...
  return this;
}
```

must become:

```java
if (expression.isInterfaceFunctional() && expression.placeholderVariable == null)
{
  isPlaceholder                  = true;
  reference.type                 = expression.coDomainType;
  expression.placeholderVariable = this;
  ...
  return this;
}

if (isIndependent = isIndependent())
{
  designateAsIndependentVariable();
  ...
  return this;
}
```

The entire current file already has the placeholder block first — but looking at the actual file retrieved, the current code already has placeholder **before** independent. The failures are happening anyway, which means the bug is elsewhere.

Looking at the actual `resolveReference()` in the retrieved file:

1. `resolveContextualVariable()` — priority 1
2. `isInterfaceFunctional() && placeholderVariable == null` → placeholder — priority 2 ✓
3. `isIndependent = isIndependent()` → independent — priority 3 ✓

The ordering is already correct in the current file. The failures must therefore come from a different defect. The stack traces all show `resolveReference` reaching `throwNewUndefinedReferenceException` at line 223, meaning **none of the three checks matched**. The YAML dumps show `isInterfaceFunctional` is not being checked correctly — the function type is `interface arb.functions.rational.RationalFunctionSequence`, which means `isInterfaceFunctional()` should return true. The variable `z` has `isIndependent=false, isPlaceholder=false` *after* the throw, meaning **the placeholder branch was not taken**.

The condition is `expression.isInterfaceFunctional() && expression.placeholderVariable == null`. The placeholder was already consumed by the sequence index variable `n` (the independentVariable is `n`, `placeholderVariable` is also `n`), leaving `z` with no branch to land in.

The root cause: `placeholderVariable` is being set to `n` (the sequence index/independent variable) when it should not be — `n` is the independent variable, not the placeholder. Then when `z` arrives, `placeholderVariable != null`, so the placeholder branch is skipped, and `z` is not `n` so `isIndependent()` returns false, and upstream finds nothing — undefined.

The fix is in `designateAsIndependentVariable`: it must **not** set `placeholderVariable`. Check whether it does that elsewhere, or whether the `init` constructor's post-`resolveReference` sync block incorrectly sets `placeholderVariable = this` when `isPlaceholder` is synced from the independent variable node.

Looking at the constructor:

```java
if (expression.placeholderVariable != null && reference.equals(expression.placeholderVariable.reference))
{
  isPlaceholder = true;
}
```

This only reads, doesn't write. The write is only in `resolveReference`. So the question is: what sets `expression.placeholderVariable` to `n`?

In `resolveReference`, the placeholder branch fires when `isInterfaceFunctional() && placeholderVariable == null`. If `n` is the first variable encountered and `isInterfaceFunctional()` returns true for a `RationalFunctionSequence`, then `n` gets set as the placeholder and `z` has nowhere to go.

**The real fix**: the placeholder branch must also check that the variable is **not** the independent variable of the expression (i.e., not the sequence index). Specifically, the condition must exclude variables that match `expression.independentVariable` by name, or more precisely: a variable should become the placeholder only if it is **not** already designated (or going to be designated) as the independent variable.

Since at parse time `independentVariable` is null when the first variable is encountered, there is no way to distinguish `n` from `x` at that moment purely from `isInterfaceFunctional()`. The sequence needs to designate `n` as independent *before* `z` is parsed. That ordering is driven by the expression string `n-z²/n` — `n` appears first.

So `n` hits `resolveReference`: context=null, `isInterfaceFunctional()=true`, `placeholderVariable=null` → **placeholder branch fires**, sets `n` as placeholder. Then `z` arrives: `placeholderVariable != null` → skips placeholder branch; `isIndependent()` returns false (independentVariable is null but... wait: `isIndependent()` returns `equals(independentVariable) || independentVariable == null`. `independentVariable` is still null at this point because `n` went placeholder not independent. So `isIndependent()` returns true for `z`. `z` becomes independent. Then the second `n` arrives: `getReference("n")` returns the existing `n` node, copies its state (`isPlaceholder=true`). Everything compiles. But the codegen for `z` uses `loadInputParameter` (non-nullary independent), and `n` uses `generateFunctionalVariableIdentity` (placeholder). This inverts the semantics — `n` should be the integer sequence index loaded as input, `z` should be the symbolic `RationalFunction` argument.

The fix must ensure that for a `*Sequence` (integer-domain functional), `n` (the integer domain type variable) is recognized as the independent variable, not the placeholder. The discriminant is type: `domainType=Integer`, so a variable that matches the domain type should go to independent, not placeholder.

The placeholder branch condition must be tightened to exclude variables whose type would be `domainType`:

```java
if (expression.isInterfaceFunctional()
    && expression.placeholderVariable == null
    && !couldBeIndependent())
```

where `couldBeIndependent()` checks whether this variable name matches the existing independent variable or whether no independent variable exists yet but the expression's domain type suggests this *is* the domain parameter. But that is circular.

The actual correct discriminant from the spec (file:3): a variable is the placeholder iff `isInterfaceFunctional()` and `placeholderVariable == null` **and `independentVariable != null`** — i.e., the independent variable has already been established. If `independentVariable` is still null, the first free variable should go to independent, not placeholder.

The fix is one added condition:

```java
if (expression.isInterfaceFunctional()
    && expression.placeholderVariable == null
    && expression.independentVariable != null)
```

This ensures `n` goes to independent first (via the `isIndependent()` branch since `independentVariable==null`), and only then does `z` land in the placeholder branch (since `independentVariable` is now `n`, non-null).

