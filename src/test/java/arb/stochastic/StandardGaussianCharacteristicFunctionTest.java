package arb.stochastic;

import static java.lang.System.out;

import arb.*;
import junit.framework.TestCase;

public class StandardGaussianCharacteristicFunctionTest extends
                                                        TestCase
{

  public void testEvaluate()
  {
    StandardGaussianCharacteristicFunction f      = new StandardGaussianCharacteristicFunction();
    Complex                                x      = new Complex(new Real("0.12",
                                                                         128),
                                                                RealConstants.zero);
    Complex                                result = f.evaluate(x, 1, 128, new Complex());
    out.println(f.getClass().getSimpleName() + "(" + x + ")=" + result);

    assertEquals(0.3960802117936560614723930056243095622936, result.re().doubleValue(), Math.pow(10, -15));

  }

}
