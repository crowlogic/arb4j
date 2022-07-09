package arb.curves;

import arb.Complex;
import arb.Constants;
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
    RectangularHyperbola hyperbola = new RectangularHyperbola();
    Complex              w         = hyperbola.evaluate(Constants.complexOne.getReal(), 2, 256, Complex.newVector(2));
    System.out.println("hyp(1)=" + w);

    assertEquals(1.8508157176809255, w.getReal().doubleValue(), 4.6232e-167);
    assertEquals(1.557407724654902, w.getImag().doubleValue(), 1.9487e-167);
    assertEquals(2.88247469562898, w.get(1).getReal().doubleValue(), 3.4545e-77);
    assertEquals(3.4255188208147596, w.get(1).getImag().doubleValue(), 3.4545e-77);
  }
}
