package arb.expressions.nodes.unary;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * Runtime evaluation helper for {@link InverseFunctionNode}. Performs
 * Newton-Raphson iteration to compute f⁻¹(y) by solving f(t) = y.
 * <p>
 * Given a monotonic differentiable function f with derivative f′, the iteration
 * is:
 * 
 * <pre>
 *   tₙ₊₁ = tₙ − (f(tₙ) − y) / f′(tₙ)
 * </pre>
 * 
 * Convergence is quadratic when seeded near the root.
 *
 * @see InverseFunctionNode
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class InverseFunctionEvaluator
{

  /**
   * Evaluate f⁻¹(y) for a contextual (user-defined) function by Newton-Raphson
   * iteration.
   *
   * @param y             the target value
   * @param bits          working precision in bits
   * @param result        pre-allocated result variable
   * @param forwardFunc   the forward function f (must support order 0 and 1
   *                      evaluation)
   * @param functionName  name of the forward function (used for error messages
   *                      and builtin dispatch)
   * @param maxIterations maximum number of Newton iterations
   * @return result containing f⁻¹(y)
   */
  public static Real evaluate(Real y,
                              int bits,
                              Real result,
                              Function<Real, Real> forwardFunc,
                              String functionName,
                              int maxIterations)
  {
    assert forwardFunc != null : "forward function must be non-null for inverse evaluation of "
                                 + functionName;

    try ( Real iterate = new Real(); Real fValue = new Real(); Real fPrime = new Real();
          Real delta = new Real(); Real residual = new Real())
    {
      // Initial guess: t₀ = y
      iterate.set(y);

      for (int i = 0; i < maxIterations; i++)
      {
        // Evaluate f(tₙ) at order 0
        forwardFunc.evaluate(iterate, 0, bits, fValue);

        // residual = f(tₙ) − y
        fValue.sub(y, bits, residual);

        // Check convergence: |f(tₙ) − y| < 2^(−bits)
        if (residual.isZero() || residual.relAccuracyBits() > bits)
        {
          break;
        }

        // Evaluate f′(tₙ) at order 1
        forwardFunc.evaluate(iterate, 1, bits, fPrime);

        // delta = (f(tₙ) − y) / f′(tₙ)
        residual.div(fPrime, bits, delta);

        // tₙ₊₁ = tₙ − delta
        iterate.sub(delta, bits, iterate);
      }

      return result.set(iterate);
    }
  }

}
