package arb.geometry.curves;

import arb.Complex;
import arb.ComplexConstants;
import junit.framework.TestCase;

/**
 * TODO: implement this test: z(t)=sec(t)+itan(t)
 * 
 * @author crow
 *
 */
public class RectangularHyperbolaTest extends
                                      TestCase
{
  public static void testHyperbola()
  {
    try ( RectangularHyperbola hyperbola = new RectangularHyperbola())
    {
      Complex w = hyperbola.evaluate(ComplexConstants.one.getReal(), 2, 256, Complex.newVector(2));
      System.out.println("hyp(1)=" + w);

      assertEquals(1.85081571768092557, w.getReal().doubleValue(), 4.6232e-167);
      assertEquals(1.5574077246549023, w.getImag().doubleValue(), 1.9487e-167);
      assertEquals(2.8824746956289804, w.get(1).getReal().doubleValue(), 3.4545e-77);
      assertEquals(3.4255188208147596, w.get(1).getImag().doubleValue(), 3.4545e-77);
    }
  }
}
