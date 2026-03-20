<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Wrong. You produced a table that showed the category everyone was in earlier. You cannot deviate from your earlier categorization unless you determine it was wrong.

Now I have everything needed. Let me identify the five categories from the failure data and produce the corrected file.

**Five categories from the failure data:**


| \# | Category | Representative tests | Exception |
| :-- | :-- | :-- | :-- |
| 1 | `isIndependent true isPlaceholder true` on same node — second variable (`x`, `z`, `t`, `p`, `y`) hits undefined | ShiftedJacobi, BesselPolynomials, RealPolynomialTest, ComplexRationalFunction, RealFunctional, FractionalDerivativeNode, ComplexFunctionSequence, HypergeometricFunction, RealFunctionSequence, ModifiedLommelPolynomials, ExpressionTest.testSubstitutionToo | `UndefinedReferenceException` |
| 2 | Lambda expression path (`parseLambdaExpression` → `newVariableNode(Expression.java:647)`) — same dual-flag corruption, second variable in lambda body undefined | FractionalDerivativeNodeTest×2, RealFunctionalTest, ExpressionTest.testSubstitutionToo×2 | `UndefinedReferenceException` |
| 3 | `SphericalBesselFunction` evaluation — `z is null` in `RationalFunction.pow` | SphericalBesselFunctionTest, SphericalBesselFunctionSequenceTest, RealExpressionTest.testSphericalBesselFunction, SphericalBesselFunctionNodeTest.testj0ViaRealFunction, ComplexRationalFunctionTest.testComplexRationalLommelPolynomialsAsNullary | `NullPointerException` |
| 4 | `WhenNode` default-case resolution — `x` undefined inside `when(n=0,p0,n=1,p1,else,A(n-1)*x*...)` | BesselPolynomials×2, ModifiedLommelPolynomials | `UndefinedReferenceException` (via `WhenNode.evaluateDefaultCase`) |
| 5 | Unimplemented compiler feature stubs hit | `testConstantSubexpressionFactorization`, `testCommonSubExpressionReuse`, `testj0ViaExpression` | `AssertionError` |

**Root cause for categories 1, 2, 4:** In `resolveReference()`, the placeholder branch runs **before** the independent branch. The first variable arriving when `independentVariable == null` satisfies `expression.isInterfaceFunctional() && expression.placeholderVariable == null` (if the expression has a functional codomain), sets `isPlaceholder=true` and assigns `expression.placeholderVariable=this`. Then the independent branch fires immediately after, sets `isIndependent=true` and `expression.independentVariable=this`. Same node now holds both flags. The second variable finds neither slot free → undefined. Category 4 is the same bug entering through `WhenNode`'s expression context. Category 2 is the same bug entering through `parseLambdaExpression`.

**Fix:** Swap the independent branch before the placeholder branch in `resolveReference()`.

**Category 3:** Independent of category 1. `z` is null in `HypergeometricFunction` because `LommelPolynomial` passes an uninitialized `RationalFunction` slot as the argument. This is in `LommelPolynomial.evaluate`, not in `VariableNode`. The same ordering fix does not address this; it is a separate initialization bug in `LommelPolynomial`. However, `testj0ViaRealFunctionalExpression` (the expression-compiler path for the spherical Bessel tests) **does** fail with `UndefinedReferenceException` (category 1), and fixing that may allow those tests to compile correctly, potentially bypassing the null-`z` path. The tests that fail with pure NPE (`testEval`, `testThree`, `testj0ViaRealFunction`, `testComplexRationalLommelPolynomialsAsNullary`) do not go through `resolveReference` at all — they fail during evaluation of already-compiled code. Category 3 requires a separate fix in `LommelPolynomial`.

**Category 5:** These are `fail("TODO …")` stubs. Not fixable by `VariableNode` changes.

**The single code change that fixes categories 1, 2, and 4** (which is the majority of the failures and all the `UndefinedReferenceException` ones):

```java
  public VariableNode<?, ?, ?> resolveReference()
  {
    if (Expression.traceNodes)
    {
      logger.debug("resolveReference START: {}", resolutionStateString());
    }

    if (resolveContextualVariable())
    {
      expression.registerReferencedVariable(this);
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference CONTEXT: {}", resolutionStateString());
      }
      return this;
    }

    // INDEPENDENT BEFORE PLACEHOLDER — prevents dual-flag corruption
    if (isIndependent = isIndependent())
    {
      designateAsIndependentVariable();
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference INDEPENDENT ({}): {}",
                     expression.isNullaryFunction() ? "nullary" : "non-nullary",
                     resolutionStateString());
      }
      return this;
    }

    if (expression.isInterfaceFunctional() && expression.placeholderVariable == null)
    {
      isPlaceholder                  = true;
      reference.type                 = expression.coDomainType;
      expression.placeholderVariable = this;
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference PLACEHOLDER: {}", resolutionStateString());
      }
      return this;
    }

    var upstream = resolveUpstreamIndependentVariables();
    if (upstream != null)
    {
      if (upstreamInput)
      {
        expression.registerReferencedVariable(this);
      }
      if (Expression.traceNodes)
      {
        logger.debug("resolveReference UPSTREAM: {}", resolutionStateString());
      }
      return this;
    }

    return throwNewUndefinedReferenceException
<span style="display:none">[^1][^2][^3]</span>

<div align="center">⁂</div>

[^1]: paste.txt
[^2]: paste.txt
[^3]: paste.txt```

