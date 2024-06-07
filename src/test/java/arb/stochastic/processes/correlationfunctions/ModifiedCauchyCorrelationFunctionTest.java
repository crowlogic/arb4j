package arb.stochastic.processes.correlationfunctions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModifiedCauchyCorrelationFunctionTest extends
                                                   TestCase
{

  public void testEvaluate()
  {
    try ( ModifiedCauchyCorrelationFunction f = new ModifiedCauchyCorrelationFunction())
    {
      double                            fTwoPointThree = f.eval(2.3);
      assertEquals(0.0918273645546373, fTwoPointThree);
    }

  }

}
