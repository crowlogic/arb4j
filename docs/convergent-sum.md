# Convergent Sum `{n=n₀..∞}`

The expression compiler emits a self-terminating convergence loop when the
upper bound of a sum is ∞, rather than a `for` loop bounded by a fixed integer.

## Parser

The Unicode character `∞` (U+221E) and the ASCII token `infinity` are recognized
as literal constants by `LiteralConstantNode` (`docs/compiler-features.md` → "∞ literal"
feature). `LiteralConstantNode.isPositiveInfinity()` returns true for these nodes.

## Dispatch

`NAryOperationNode.generate()` (`NAryOperationNode.java:403`) checks:

```java
if (upperLimit.isPositiveInfinity())
{
  return generateConvergentSum(mv, resultType);
}
```

If the operation is not `add` (Σ), a `CompilerException` is thrown — only sums
support convergent iteration.

## Convergence Criterion

### Ball types (`Real`, `Complex`)

The loop stops when `0 ∈ ΔSₙ` where `ΔSₙ = S(n) − S(n−1)`. Three scratch fields
per sum:

- `previousResultFieldName` — holds `S(n−1)` (radius never zeroed, carries the
  natural evaluation error)
- `deltaFieldName` — copy of the current partial sum whose radius is zeroed so
  the delta's radius comes entirely from `S(n−1)`
- `resultFieldName` — accumulates `S(n)`

After each iteration: `Δ = S(n) − S(n−1)` with zeroed midpoint radius on the
copy. If `Δ.containsZero()` is true, the loop exits.

This is the printer-style convergence — the same mechanism `PadePrinter` uses.

### Non-ball types (polynomials, etc.)

The loop stops when `|term| ≤ 2^{-bits}`:

- `toleranceFieldName` — holds `2^{-bits}` as a `Real`
- `absTermFieldName` — holds `|operandValue|`
- After each term, `absTerm.compareTo(tolerance)` ≤ 0 exits the loop

## Fields

All scratch is on the generated class as fields (not locals), so `close()` can
dispose them. Declared by `declareConvergenceFields()`.

## Tests

| Test class | Method | Expression | What it verifies |
|---|---|---|---|
| `ConvergentSumTest` | `testConvergentInfiniteSum` | `Σk➔(x^k/k!){k=0…∞}` at x=1 | exp(1) to 1e-18 |
| `ConvergentSumTest` | `testFixedBoundSumUnchanged` | `Σk➔(x^k/k!){k=0…10}` | Fixed bound still works |
| `RoughHestonEdgeworthCallPriceTest` | `testEdgeworthAgainstSinhCbBenchmark` | `Σk➔T^(k*μ+1)*d(k){k=0..∞}` (via `RoughHestonEdgeworthCallPrice`) | 5 strikes, Table 1, 1e-11 abs tolerance |
| `RoughHestonEdgeworthCallPriceTest` | `testEdgeworthAgainstSinhCbBenchmarkTable2` | Same expression | 8 strikes, Table 12 (T=1/12), 5e-5 IV tolerance |
| `RoughHestonEdgeworthCallPriceTest` | `testEdgeworthDeepOtmAgainstBenchmarkT52` | Same expression | 9 strikes, Table 12 (T=1/52), per-strike IV tolerances |

The production expression that exercises this path is compiled in
`RoughHestonEdgeworthCallPrice.java:221`:

```java
"Σk➔T^(k*μ+1)*d(k){k=0..∞}"
```
