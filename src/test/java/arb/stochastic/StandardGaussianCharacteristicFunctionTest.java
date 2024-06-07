package arb.stochastic;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import junit.framework.TestCase;

public class StandardGaussianCharacteristicFunctionTest extends
                                                        TestCase
{

  public void testEvaluate()
  {
    try ( StandardGaussianCharacteristicFunction f = new StandardGaussianCharacteristicFunction())
    {
      Complex x      = new Complex(new Real("0.12",
                                            128),
                                   RealConstants.zero);
      Complex result = f.evaluate(x, 1, 128, new Complex());

      assertEquals(0.3960802117936560614723930056243095622936, result.re().doubleValue(), Math.pow(10, -15));
    }

  }

}
