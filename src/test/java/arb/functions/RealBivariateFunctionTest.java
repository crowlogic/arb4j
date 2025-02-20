package arb.functions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealBivariateFunctionTest
{

  @Test
  public void testEvaluateDInt()
  {
    RealBivariateFunction func   = Function.express(Real.class, RealFunction.class, RealBivariateFunction.class, "x-y");
    Real                  result = func.evaluate(RealConstants.half, 128).evaluate(RealConstants.sqrt2, 128, new Real());
    assertEquals(result.toString(),"cool");
  }

}
