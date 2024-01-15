package arb.stochastic;

import arb.Real;
import junit.framework.TestCase;

public class StandardGaussianDensityFunctionTest extends
                                                 TestCase
{

  public void testEvaluateRealIntIntReal()
  {
    try ( StandardGaussianDensityFunction sdf = new StandardGaussianDensityFunction())
    {
      {

        Real result = sdf.evaluate(new Real("0.12",
                                            128),
                                   1,
                                   128,
                                   new Real());
        assertEquals(0.3960802117936560614723930056243095622936, result.doubleValue(), Math.pow(10, -15));
      }
    }
  }

}
