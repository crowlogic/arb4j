package arb.functions.complex;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TFunctionTest extends
                           TestCase
{
  public static void testS()
  {

    try ( TFunction tFunction = new TFunction(); Complex t = new Complex())
    {
      t.set(2, 0.2);
      Complex result = tFunction.evaluate(t, 2, 256, Complex.newVector(2));

      assertEquals(0.9272321871063992, result.getReal().doubleValue());
      assertEquals(0.023134949807849504, result.getImag().doubleValue());
      assertEquals(0.1103681255609957, result.get(1).getReal().doubleValue());
      assertEquals(-0.04104757711323205, result.get(1).getImag().doubleValue());
    }
  }
}
