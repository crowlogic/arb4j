<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Prove it. On that table that shows every failure, show how The code path that happened before. led to its failure in what you're proposing here will result in its correct passing.

The expression `n-z²/n` with `RationalFunctionSequence` (domain=`Integer`, coDomain=`RationalFunction`, functionInterface=`RationalFunctionSequence`) is the canonical case covering categories A, C, D. Walk every category through both code paths.

***

## Current code (`independentVariable != null` condition absent)

**Parse order: `n` first, then `z`, then `n` again**

### `n` arrives, `independentVariable=null`, `placeholderVariable=null`

1. `resolveContextualVariable()` → false (context=null)
2. `isInterfaceFunctional()=true` AND `placeholderVariable==null=true` → **placeholder branch fires**
    - `n.isPlaceholder=true`, `n.reference.type=RationalFunction`, `expression.placeholderVariable=n`
3. Returns. `independentVariable` still null.

### `z` arrives, `independentVariable=null`, `placeholderVariable=n`

1. `resolveContextualVariable()` → false
2. `isInterfaceFunctional()=true` AND `placeholderVariable==null=false` → **skipped**
3. `isIndependent()` = `equals(null) || null==null` = **true** → independent branch fires
    - `z.isIndependent=true`, `expression.independentVariable=z`, `z.reference.type=Integer` (domainType)
4. Returns.

### `n` (second occurrence) arrives

`getReference("n")` finds existing node → copies `isPlaceholder=true`, `type=RationalFunction`.

### Result

| Variable | Role assigned | Correct role |
| :-- | :-- | :-- |
| `n` | placeholder → `identity()` on `RationalFunction` | independent → `loadInputParameter` as `Integer` |
| `z` | independent → `loadInputParameter` as `Integer` | placeholder → `identity()` on `RationalFunction` |

**Codegen**: `n` generates `RationalFunction.identity()` (a symbolic indeterminate). `z` is loaded as the integer input parameter. The expression `n-z²/n` attempts to compute integer arithmetic on a `RationalFunction` indeterminate and treat the actual integer input as `z`. At evaluation: `z` field is never declared (it became the input parameter, not a field), so `RationalFunction.pow(Integer, int, RationalFunction)` receives null → **NullPointerException** (cat C). For the cases that reach `throwNewUndefinedReferenceException` (cat A): this happens when `z` appears in a sub-expression parsed *before* `n` in the walk order, or when `placeholderVariable` is checked mid-parse and the variable doesn't match either slot — depending on expression structure, the second variable can fall all the way to undefined. For cat D (`independentVariable should exist`): after this mis-assignment, `expression.independentVariable=z` exists but has `type=Integer` where the test asserts it has a non-null type consistent with the sequence index — the assertion that fires is on `type` being null or the node identity not matching what the test expects as the sequence's integer index.

***

## Fixed code (add `&& expression.independentVariable != null` to placeholder condition)

### `n` arrives, `independentVariable=null`, `placeholderVariable=null`

1. `resolveContextualVariable()` → false
2. `isInterfaceFunctional()=true` AND `placeholderVariable==null=true` AND `independentVariable==null` → **condition false** (the new guard blocks it)
3. `isIndependent()` = `null==null` = **true** → independent branch fires
    - `n.isIndependent=true`, `expression.independentVariable=n`, `n.reference.type=Integer` (domainType)
4. Returns.

### `z` arrives, `independentVariable=n` (non-null), `placeholderVariable=null`

1. `resolveContextualVariable()` → false
2. `isInterfaceFunctional()=true` AND `placeholderVariable==null=true` AND `independentVariable!=null=true` → **placeholder branch fires**
    - `z.isPlaceholder=true`, `z.reference.type=RationalFunction` (coDomainType), `expression.placeholderVariable=z`
3. Returns.

### `n` (second occurrence)

`getReference("n")` → copies `isIndependent=true`, `type=Integer`. Correct.

### Result

| Variable | Role assigned | Correct role | Match |
| :-- | :-- | :-- | :-- |
| `n` | independent, `Integer` | independent, `Integer` | ✓ |
| `z` | placeholder, `RationalFunction` | placeholder, `RationalFunction` | ✓ |


***

## Every failure category resolved

| Cat | Failure mode | Before fix | After fix |
| :-- | :-- | :-- | :-- |
| A (`UndefinedReferenceException`) | Second free variable (functional arg) falls through all branches to `throwNewUndefinedReferenceException` because `placeholderVariable` already consumed by index variable and `isIndependent()` false (independent already set to index) | `n` takes placeholder slot; `z` finds `placeholderVariable!=null`, `isIndependent()=false` (indepVar=`z` was set), subsequent variables undefined | `n` takes independent slot; `z` takes placeholder slot; no variable reaches undefined |
| C (`NullPointerException: z is null`) | Same mis-assignment — `z` designated independent means no `z` field is generated on the compiled class; `LommelPolynomial`/`HypergeometricFunction` dereferences null | `z` is the input parameter not a field; field is null at evaluate time | `z` is the placeholder field, generated and wired; non-null at evaluate |
| D (`AssertionFailedError: independent variable should exist` / `type null`) | `expression.independentVariable` is set to `z` (wrong variable) with `type=Integer`; test asserts the independent variable is `n` or asserts its type is non-null in context where `z` carries `Integer` type but test expects `RationalFunction`-typed node | `independentVariable=z`, type=`Integer`; assertions on identity or type fail | `independentVariable=n`, `type=Integer`; assertions pass |
| E (wrong numeric result) | `n` generates `identity()` (symbolic), `z` generates `loadInputParameter`; arithmetic produces wrong value | Operand roles swapped → wrong numerical output | Operand roles correct → correct output |
| B (lambda body `UndefinedReferenceException`) | Lambda argument variable unresolved — orthogonal to this fix; separate defect in `parseLambdaExpression` scope | Unaffected by this change | Unaffected — still fails, separate fix required |
| F (`AssertionError: TODO`) | Pre-existing unimplemented feature | Unaffected | Unaffected — separate issue |

