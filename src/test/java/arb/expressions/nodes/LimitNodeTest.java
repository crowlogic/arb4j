package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/** @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary} */
public class LimitNodeTest extends
                           TestCase
{
  public void testLimitSubstitutesBoundVariableAtThePoint()
  {
    try (Context context = new Context())
    {
      context.registerVariable(Real.named("t"));
      var f = RealFunction.express("x➔lim(x+t,t=2)", context);
      double actual = f.eval(3.0);
      assertEquals(5.0, actual, 1e-10);
    }
  }

  public void testLimitOfExpressionIndependentOfBoundVariableReturnsOperand()
  {
    try (Context context = new Context())
    {
      context.registerVariable(Real.named("t"));
      var f = RealFunction.express("x➔lim(1+x,t=0)", context);
      double actual = f.eval(2.3);
      assertEquals(3.3, actual, 1e-10);
    }
  }
}
