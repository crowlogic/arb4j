package arb.functions;

import static org.junit.Assert.assertEquals;

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
    RealBivariateFunction func          = RealBivariateFunction.express("x-y");
    RealFunction  innerFunction = func.evaluate(RealConstants.half, 128);
    Real                  result        = innerFunction.evaluate(RealConstants.sqrt2, 128, new Real());
    result.printPrecision = false;
    assertEquals("-0.91421356237309504880168872420969807857", result.toString());
  }

}
