# arb4j Test Suite Run Report — 2026-07-04

## Environment

| Item | Value |
|---|---|
| JDK | temurin-25-jdk-amd64 |
| Maven | 3.x (surefire 3.2.5) |
| Profile | `-Ptrace` (second run; first run without trace) |
| Locale | `LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8` |

## Summary

| Metric | Value |
|---|---|
| Total tests | 961 |
| Failures | 2 |
| Errors | 0 |
| Skipped | 0 |
| Build result | **FAILURE** |
| Wall time (without trace) | 03:34 min |
| Wall time (with `-Ptrace`) | 04:50 min |

---

## Failures

### 1. `RoughHestonEdgeworthCallPriceTest.testEdgeworthAgainstSinhCbBenchmark`

**Location:** `src/test/java/arb/stochastic/processes/heston/RoughHestonEdgeworthCallPriceTest.java:127`

**Parameters:** T = 1/12, K = 0.95

```
expected: 2.45579[5500000000000000000e-7 +/- 3e-36]
     got: 2.45579[4571327327685046683e-7 +/- 1.37e-32]
```

The computed ball does not enclose the reference value; divergence begins at the 9th significant digit.
The computed radius (1.37e-32) is also wider than the reference ball (3e-36), indicating a precision loss.

---

### 2. `RoughHestonEdgeworthCallPriceTest.testEdgeworthAgainstSinhCbBenchmarkTable2`

**Location:** `src/test/java/arb/stochastic/processes/heston/RoughHestonEdgeworthCallPriceTest.java:205`

**Parameters:** T = 1/8, K = 0.8

```
expected: [0.2280000000000000000000000 +/- 3e-30]
     got: [5.302872228883103623981394e-6 +/- 3.50e-31]
```

The computed value is wrong by four orders of magnitude.

---

## Timing Analysis

The suite excluding `RoughHestonOptionPricerTest` finishes in under 12 seconds total.
`RoughHestonOptionPricerTest` alone consumed **182.8 seconds** (without trace) / **182.8 seconds** (with trace — identical; the trace adds only compiler logging, not evaluation overhead).

The two tests in that class are:

| Test | Time |
|---|---|
| `testBlackScholesLimitIsExact` | ~90 s |
| `testCayleyScaleInvariance` | ~90 s |

Each call to `lewisSingleSeries` with `bits=256` and the test pole configuration (w = 3±2i, B = 0.1±0.05i) computes an exit index N\* via:

```
N* = ⌈(log τC + bits·log 2) / log R⌉
```

With log R ≈ 0.243 (R ≈ 1.275) and bits = 256, N\* lands in the hundreds.
The compiled `price` expression then evaluates:

```
Σ_{n=0}^{N*} q(n) · (T(n)(1) − T(n)(0))
```

where `T(n)(δ)` contains `Σ_{k=1}^{n} Σ_{m=1}^{k} A(m)(qNode)`, giving **O(N\*³)** evaluations of the compiled `A` expression — tens of millions of ball-arithmetic operations per `lewisSingleSeries` call.

The `price` sum is re-evaluated from scratch on each `lewisContext.invalidateAllCaches()` call because no intermediate values are cached across calls.

---

## Surefire Configuration Note

The pom.xml surefire configuration (lines 208–224) has **no `forkedProcessTimeoutInSeconds` setting**.
The 182-second fork was never killed; it ran to natural completion.
The memory entry claiming `forkedProcessTimeoutInSeconds=45` is set has been downvoted as incorrect.
