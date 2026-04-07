package arb.operators;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * TODO: make an Operator which would be a Function<RealFunction,RealFunction>
 * which would map a function to the function unitarily composed with another
 * function
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class AbsoluteUnitaryTimeChangeTest extends
                                   TestCase
{

  public void testUnitaryTimeChange()
  {
    RealFunction      f = RealFunction.express("tanh(x)");
    RealFunction      ψ = RealFunction.express("x^2");
    RealFunction      g = RealFunction.express("sqrt(diff(t^2,t))*tanh(t^2)");
    try ( AbsoluteUnitaryTimeChange U = new AbsoluteUnitaryTimeChange(f,
                                                ψ))
    {
      assertEquals(g.eval(2.3), U.eval(2.3));
    }
  }

}
