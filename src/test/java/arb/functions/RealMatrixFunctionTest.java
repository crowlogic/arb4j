package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealMatrixFunctionTest extends
                                    TestCase
{
  public void testMatrixAdd()
  {
    RealNullaryMatrixFunction func = RealNullaryMatrixFunction.express("2+3");
    var                       A    = func.evaluate(128);
    assertEquals("[5]", func.toString());
  }
}
