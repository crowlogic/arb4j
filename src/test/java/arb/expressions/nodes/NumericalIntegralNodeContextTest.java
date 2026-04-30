package arb.expressions.nodes;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Reproduces the Context-bound free-variable case for {@code nint}: the
 * outer expression has its own input variable {@code x}, and the integrand
 * references {@code x} alongside its own integration variable {@code t}.
 *
 * Reference: ∫₀^π sin(x·t) dt = (1 − cos(x·π)) / x.
 *   At x=1: (1 − cos π) / 1 = 2.
 *   At x=2: (1 − cos 2π) / 2 = 0.
 *   At x=3: (1 − cos 3π) / 3 = 2/3.
 */
public class NumericalIntegralNodeContextTest extends
                                              TestCase
{

  public void testOuterFreeVariableInIntegrand()
  {
    var    f     = RealFunction.express("x➔nint(t➔sin(x*t), t=0…π)");
    double atOne = f.eval(1.0);
    double atTwo = f.eval(2.0);

    assertEquals("∫₀^π sin(1·t) dt = 2", 2.0, atOne, 1e-2);
    assertEquals("∫₀^π sin(2·t) dt = 0", 0.0, atTwo, 1e-2);
  }

  /**
   * Repeat-call regression: confirm that re-evaluating at a previously seen
   * free-variable value rebuilds the cumulative cache rather than reusing a
   * stale grid. ∫₀^π sin(3t) dt = (1 − cos(3π))/3 = 2/3.
   */
  public void testRepeatedEvaluatesRebindGrid()
  {
    var    f      = RealFunction.express("x➔nint(t➔sin(x*t), t=0…π)");
    double a      = f.eval(1.0);
    double b      = f.eval(2.0);
    double c      = f.eval(3.0);
    double aAgain = f.eval(1.0);

    assertEquals("x=1 first call", 2.0, a, 1e-2);
    assertEquals("x=2", 0.0, b, 1e-2);
    assertEquals("x=3", 2.0 / 3.0, c, 1e-2);
    assertEquals("x=1 again", 2.0, aAgain, 1e-2);
  }
}
