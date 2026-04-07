package arb.operators;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class UnitaryTimeChangeTest extends
                                   TestCase
{

  public void testUnitaryTimeChange()
  {
    RealFunction      f = RealFunction.express("tanh(x)");
    RealFunction      ψ = RealFunction.express("x^2");
    RealFunction      g = RealFunction.express("sqrt(diff(t^2,t))*tanh(t^2)");
    try ( UnitaryTimeChange U = new UnitaryTimeChange(f,
                                                ψ))
    {
      assertEquals(g.eval(2.3), U.eval(2.3));
    }
  }

}
