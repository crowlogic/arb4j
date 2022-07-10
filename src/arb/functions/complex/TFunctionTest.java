package arb.functions.complex;

import arb.*;
import junit.framework.*;

public class TFunctionTest extends
                           TestCase
{
  public static void testS()
  {

    try ( TFunction tFunction = new TFunction(); Complex t = new Complex())
    {
      t.set(2, 0.2);
      Complex result = tFunction.evaluate(t, 2, 256, Complex.newVector(2));
      System.out.format("S(%s)=%s\n", t, result);

      assertEquals(0.9272321871063991, result.getReal().doubleValue());
      assertEquals(0.0231349498078495, result.getImag().doubleValue());
      assertEquals(0.11036812556099569, result.get(1).getReal().doubleValue());
      assertEquals(-0.04104757711323205, result.get(1).getImag().doubleValue());
    }
  }
}
