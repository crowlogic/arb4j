package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Context;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExtremumNodeTest extends TestCase
{
  public void testMaxOfTwoReals()
  {
    try ( Real result = new Real();
          Real x = new Real("3", 128);
          Real y = new Real("7", 128);
          RealFunctional f = RealFunctional.express("x➔y➔max(x, y)", new Context()) )
    {
      RealFunction g = f.evaluate(x, 128);
      g.evaluate(y, 1, 128, result);
      assertEquals(7.0, result.doubleValue(), 1e-10);

      RealFunctional h = RealFunctional.express("x➔y➔max(y, x)", new Context());
      RealFunction g2 = h.evaluate(x, 128);
      g2.evaluate(y, 1, 128, result);
      assertEquals(7.0, result.doubleValue(), 1e-10);
    }
  }

  public void testMinOfTwoReals()
  {
    try ( Real result = new Real();
          Real x = new Real("3", 128);
          Real y = new Real("7", 128);
          RealFunctional f = RealFunctional.express("x➔y➔min(x, y)", new Context()) )
    {
      RealFunction g = f.evaluate(x, 128);
      g.evaluate(y, 1, 128, result);
      assertEquals(3.0, result.doubleValue(), 1e-10);

      RealFunctional h = RealFunctional.express("x➔y➔min(y, x)", new Context());
      RealFunction g2 = h.evaluate(x, 128);
      g2.evaluate(y, 1, 128, result);
      assertEquals(3.0, result.doubleValue(), 1e-10);
    }
  }

  public void testMaxWithEqualValues()
  {
    try ( Real result = new Real();
          Real x = new Real("5", 128);
          Real y = new Real("5", 128);
          RealFunctional f = RealFunctional.express("x➔y➔max(x, y)", new Context()) )
    {
      RealFunction g = f.evaluate(x, 128);
      g.evaluate(y, 1, 128, result);
      assertEquals(5.0, result.doubleValue(), 1e-10);
    }
  }

  public void testExtremumWithNegativeValues()
  {
    try ( Real result = new Real();
          Real x = new Real("-3", 128);
          Real y = new Real("-7", 128);
          RealFunctional f = RealFunctional.express("x➔y➔max(x, y)", new Context()) )
    {
      RealFunction g = f.evaluate(x, 128);
      g.evaluate(y, 1, 128, result);
      assertEquals(-3.0, result.doubleValue(), 1e-10);

      RealFunctional h = RealFunctional.express("x➔y➔min(x, y)", new Context());
      RealFunction g2 = h.evaluate(x, 128);
      g2.evaluate(y, 1, 128, result);
      assertEquals(-7.0, result.doubleValue(), 1e-10);
    }
  }

  public void testExtremumWithExpressionArguments()
  {
    try ( Real result = new Real();
          Real x = new Real("4", 128);
          Real y = new Real("10", 128);
          RealFunctional f = RealFunctional.express("x➔y➔max(x*2, y-1)", new Context()) )
    {
      RealFunction g = f.evaluate(x, 128);
      g.evaluate(y, 1, 128, result);
      // x*2 = 8, y-1 = 9 -> max = 9
      assertEquals(9.0, result.doubleValue(), 1e-10);
    }
  }
}
