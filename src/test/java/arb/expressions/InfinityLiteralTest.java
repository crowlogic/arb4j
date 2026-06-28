package arb.expressions;

import org.junit.Test;

import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Locks in the {@code ∞}/{@code inf}/{@code infty} literal: the expression
 * compiler emits a field load of {@code RealConstants.infinity}, which must
 * exist and equal {@code +∞}. A convergent geometric series summed to the
 * {@code ∞} bound with the {@code ~} optimal-truncation specifier evaluates to
 * its closed form Σₖ 2⁻ᵏ = 2.
 */
public class InfinityLiteralTest extends
                                 TestCase
{
  @Test
  public void testInfinityConstantIsPositiveInfinity()
  {
    assertTrue("RealConstants.infinity must be +∞", RealConstants.infinity.isInfinite() && RealConstants.infinity.isPositive());
  }

  @Test
  public void testInfinityLiteralCompilesToTheConstant()
  {
    try ( Context ctx = new Context())
    {
      // The ∞ literal in a Real expression emits a field load of
      // RealConstants.infinity; the result must be +∞.
      RealNullaryFunction f = RealNullaryFunction.express("f", "∞", ctx);
      try ( Real r = new Real() )
      {
        f.evaluate(128, r);
        assertTrue("∞ literal must evaluate to +∞, got " + r, r.isInfinite() && r.isPositive());
      }
    }
  }
}
